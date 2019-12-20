#!/bin/bash

BRANCH_1=$1
BRANCH_2=$2
OUTPUT=$3
if [ -z $OUTPUT ]; then
  OUTPUT=patches
fi
mkdir -p $OUTPUT
echo "@@ Diff between $BRANCH_1 and $BRANCH_1 ..."

git log --oneline $BRANCH_1..$BRANCH_2 > tmp_1.txt
awk '{print $1}' < tmp_1.txt | tac > tmp_2.txt

index=0
while read line; do
  git format-patch -1 $line >/dev/null
  ori_name=`ls *.patch`
  tgt_name=`ls $ori_name | cut -d- -f2-`
  str=`printf "%04d" $index`
  mv $ori_name "$str-$tgt_name"
  mv "$str-$tgt_name" $OUTPUT/
  index=$(($index+1))
done < tmp_2.txt

rm -f tmp*.txt

# end of file

#!/bin/sh

depth=$1
if [ -z $depth ]; then
  depth=1
fi

filepath=$(cd "$(dirname $0)"; pwd)
echo $filepath
ROOT_DIR=$filepath/checkpatch
DPDK_CHECKPATCH_PATH=$ROOT_DIR/checkpatch.pl;
export DPDK_CHECKPATCH_PATH

$ROOT_DIR/checkpatches.sh -v -n $depth

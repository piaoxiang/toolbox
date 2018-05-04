#!/bin/bash

set -x

patches=`find . -name "*.patch"`

for file in $patches; do
	newname=`echo $file | cut -d- -f1`
	mv $file $newname.patch
done

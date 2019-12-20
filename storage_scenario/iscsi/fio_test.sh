#!/bin/bash

FIO_PREFIX=test

if [ "$1" = "clean" ]; then
  echo "Cleaning..."
  rm -rf *.log *.svg
  exit 1
fi

FIO_FILE=$1
if [ "${FIO_FILE##*.}" = "fio" ]; then
  echo "Test Parameters: $FIO_FILE"
else
  echo "Usage: `basename $0` [clean | file.fio]"
  exit 1
fi

# fio test
FIO_PREFIX=${FIO_PREFIX} fio iscsi.fio

# draw picture
for i in clat lat slat bw iops;
  do mv ${FIO_PREFIX}_$i.1.log ${FIO_PREFIX}_$i.log
done

fio_generate_plots ${FIO_PREFIX} 2>/dev/null

# end of file

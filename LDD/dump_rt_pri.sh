#!/bin/bash

pid_table=`ls /proc | grep "[0-9].*"`

for pid in $pid_table; 
do
  chrt -p $pid
done

# end of file

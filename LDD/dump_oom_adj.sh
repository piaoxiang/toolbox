#!/bin/bash

pid_table=`ls /proc | grep "[0-9].*"`

for pid in $pid_table; 
do
  if [ -e /proc/$pid/oom_adj ]; then
    oom_adj=`cat /proc/$pid/oom_adj`
    oom_score_adj=`cat /proc/$pid/oom_score_adj`
    if [ $oom_adj -ne 0 -o $oom_score_adj -ne 0 ]; then
      echo -n "$pid $oom_adj $oom_score_adj "
      cat /proc/$pid/cmdline
      echo
    fi
  fi
done

# end of file

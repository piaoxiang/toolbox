#!/bin/bash

/usr/share/spdk/scripts/spdk-nvme-setup.sh

if [ -z "$1" ]
    then
      iscsi_tgt -c iscsi.conf -m 0x3
    else
      iscsi_tgt -c $1
fi

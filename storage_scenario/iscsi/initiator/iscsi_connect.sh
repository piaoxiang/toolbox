#!/bin/sh

iscsiadm -m discovery -t sendtargets -p 9.9.9.1
iscsiadm -m node --login
iscsiadm -m session -P 3

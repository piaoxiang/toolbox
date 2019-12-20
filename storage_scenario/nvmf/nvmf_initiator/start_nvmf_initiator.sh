#!/bin/sh

set -x

modprobe nvme_rdma

nvme discover -t rdma -a 192.168.1.11 -s 1023
nvme connect -t rdma -n n -a 192.168.1.11 -s 1023
sleep 1
nvme list

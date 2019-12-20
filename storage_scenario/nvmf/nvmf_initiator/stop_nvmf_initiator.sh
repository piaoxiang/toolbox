#!/bin/sh

set -x

nvme disconnect -n n
sleep 1
nvme list

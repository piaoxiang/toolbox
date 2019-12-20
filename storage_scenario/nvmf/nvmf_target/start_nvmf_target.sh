#!/bin/sh

set -x

modprobe nvmet-rdma

# NULL_BLK
modprobe null_blk nr_devices=2

mkdir /sys/kernel/config/nvmet/subsystems/n

cd /sys/kernel/config/nvmet/subsystems/n
echo 1 > attr_allow_any_host
mkdir namespaces/10
cd namespaces/10
echo -n /dev/nullb0 > device_path
echo 1 > enable

cd /sys/kernel/config/nvmet/subsystems/n
mkdir namespaces/11
cd namespaces/11
echo -n /dev/nullb1 > device_path
echo 1 > enable

cd /sys/kernel/config/nvmet/subsystems/n
mkdir namespaces/20
cd namespaces/20
echo -n /dev/nvme0n1 > device_path
echo 1 > enable

cd /sys/kernel/config/nvmet/subsystems/n
mkdir namespaces/21
cd namespaces/21
echo -n /dev/nvme1n1 > device_path
echo 1 > enable

mkdir /sys/kernel/config/nvmet/ports/1
cd /sys/kernel/config/nvmet/ports/1
echo 192.168.1.11 > addr_traddr
echo rdma > addr_trtype
echo 1023 > addr_trsvcid
echo ipv4 > addr_adrfam
ln -s /sys/kernel/config/nvmet/subsystems/n /sys/kernel/config/nvmet/ports/1/subsystems/n


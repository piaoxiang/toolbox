#!/bin/sh
#
# add PF or VFs to container directly.
#

set -x

start_container()
{
	docker run -itd --name=$1 busybox
}

stop_container()
{
	docker stop $1
	docker rm $1
}

diag_container()
{
	docker exec -it $1 ip addr
}

PIPEWORK=/home/qingmin/github/docker/pipework/pipework

#prepare
CONTAINERS=container1
start_container $CONTAINERS

# add PF or VFs
diag_container $CONTAINERS

VF_NAME=eno1
$PIPEWORK --direct-phys $VF_NAME $CONTAINERS 192.168.1.2/24

diag_container $CONTAINERS

# stop
stop_container $CONTAINERS

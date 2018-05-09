#!/bin/sh
#
# Default bridge
# - Bring up two containers
# - ping each other
#

set -x

# remote
docker rm container1
docker rm container2

# create containers
docker run -itd --name=container1 busybox
docker run -itd --name=container2 busybox

# diag
docker network inspect bridge
docker ps

# ping test
docker exec container1 ping -c 2 172.17.0.3
docker exec container2 ping -c 2 172.17.0.2

# stop
docker stop container1
docker stop container2

# end of file

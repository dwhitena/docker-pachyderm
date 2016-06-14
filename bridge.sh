#!/bin/sh
set -e -x

brctl addbr bridge0
ip addr add 192.168.5.1/24 dev bridge0
ip link set dev bridge0 up
echo 'DOCKER_OPTS="-b=bridge0"' >> /etc/default/docker

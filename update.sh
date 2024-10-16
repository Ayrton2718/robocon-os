#!/bin/bash

DIR_NAME="$(dirname $0)"

# Extentions
rm -rf $DIR_NAME/ext
rm -rf $DIR_NAME/build $DIR_NAME/install $DIR_NAME/log
vcs import --recursive < $DIR_NAME/ext.repos
vcs pull $DIR_NAME/ext

sudo apt update && rosdep update
rosdep install -yi --rosdistro humble --from-paths $DIR_NAME

# SMBus
SMBUS_PORTS="net.ipv4.ip_local_reserved_ports=6171-6191"
if ! grep -q "$SMBUS_PORTS" /etc/sysctl.conf; then
    sudo bash -c "echo '$SMBUS_PORTS' >> /etc/sysctl.conf"
fi

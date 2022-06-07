#!/bin/bash

# TZ: config && install
# set noninteractive installation
export DEBIAN_FRONTEND=noninteractive
# install tzdata package
apt-get install -y tzdata
# set your timezone
ln -fs /usr/share/zoneinfo/Brazil/East /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata

# SSHD: install && config
apt-get install -y openssh-server
sed -i 's/PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config
sed -i 's/^.*AuthorizedKeysFile.*$/AuthorizedKeysFile	.ssh/authorized_keys/' /etc/ssh/sshd_config
sed -i 's/^.*PubkeyAuthentication .*$/PubkeyAuthentication yes/' /etc/ssh/sshd_config


#!/bin/bash

set -ex

wget --quiet --no-clobber https://kernel.ubuntu.com/mainline/v6.5/amd64/linux-headers-6.5.0-060500_6.5.0-060500.202308271831_all.deb
wget --quiet --no-clobber https://kernel.ubuntu.com/mainline/v6.5/amd64/linux-headers-6.5.0-060500-generic_6.5.0-060500.202308271831_amd64.deb

dpkg -i ./*.deb
rm *.deb

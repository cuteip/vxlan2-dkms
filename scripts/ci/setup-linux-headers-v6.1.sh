#!/bin/bash

set -ex

wget --quiet --no-clobber https://file-public1.chasoba.net/mirrors/kernel.ubuntu.com/mainline/v6.1/amd64/linux-headers-6.1.0-060100_6.1.0-060100.202303090726_all.deb
wget --quiet --no-clobber https://file-public1.chasoba.net/mirrors/kernel.ubuntu.com/mainline/v6.1/amd64/linux-headers-6.1.0-060100-generic_6.1.0-060100.202303090726_amd64.deb

dpkg -i ./*.deb
rm *.deb

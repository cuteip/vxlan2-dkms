#!/bin/bash

set -ex

wget --quiet --no-clobber https://kernel.ubuntu.com/mainline/v6.6/amd64/linux-headers-6.6.0-060600_6.6.0-060600.202311151808_all.deb
wget --quiet --no-clobber https://kernel.ubuntu.com/mainline/v6.6/amd64/linux-headers-6.6.0-060600-generic_6.6.0-060600.202311151808_amd64.deb

apt install ./*.deb
rm *.deb

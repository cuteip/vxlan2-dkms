#!/bin/bash

set -ex

wget --quiet --no-clobber https://file-public1.chasoba.net/mirrors/kernel.ubuntu.com/mainline/v6.3/amd64/linux-headers-6.3.0-060300_6.3.0-060300.202304232030_all.deb
wget --quiet --no-clobber https://file-public1.chasoba.net/mirrors/kernel.ubuntu.com/mainline/v6.3/amd64/linux-headers-6.3.0-060300-generic_6.3.0-060300.202304232030_amd64.deb

dpkg -i ./*.deb
rm *.deb

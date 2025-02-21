#!/bin/bash

set -ex

wget --quiet --no-clobber https://file-public1.chasoba.net/mirrors/kernel.ubuntu.com/mainline/v6.4/amd64/linux-headers-6.4.0-060400_6.4.0-060400.202306271339_all.deb
wget --quiet --no-clobber https://file-public1.chasoba.net/mirrors/kernel.ubuntu.com/mainline/v6.4/amd64/linux-headers-6.4.0-060400-generic_6.4.0-060400.202306271339_amd64.deb

dpkg -i ./*.deb
rm *.deb

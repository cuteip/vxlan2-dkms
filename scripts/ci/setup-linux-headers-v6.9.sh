#!/bin/bash

set -ex

wget --quiet --no-clobber https://file-public1.chasoba.net/mirrors/kernel.ubuntu.com/mainline/v6.9/amd64/linux-headers-6.9.0-060900_6.9.0-060900.202501291528_all.deb
wget --quiet --no-clobber https://file-public1.chasoba.net/mirrors/kernel.ubuntu.com/mainline/v6.9/amd64/linux-headers-6.9.0-060900-generic_6.9.0-060900.202501291528_amd64.deb

dpkg -i ./*.deb
rm *.deb

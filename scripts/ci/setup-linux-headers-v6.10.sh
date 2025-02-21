#!/bin/bash

set -ex

wget --quiet --no-clobber https://file-public1.chasoba.net/mirrors/kernel.ubuntu.com/mainline/v6.10/amd64/linux-headers-6.10.0-061000_6.10.0-061000.202502181540_all.deb
wget --quiet --no-clobber https://file-public1.chasoba.net/mirrors/kernel.ubuntu.com/mainline/v6.10/amd64/linux-headers-6.10.0-061000-generic_6.10.0-061000.202502181540_amd64.deb

dpkg -i ./*.deb
rm *.deb

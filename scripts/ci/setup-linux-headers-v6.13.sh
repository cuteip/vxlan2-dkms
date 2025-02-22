#!/bin/bash

set -ex

wget --quiet --no-clobber https://file-public1.chasoba.net/mirrors/kernel.ubuntu.com/mainline/v6.13/amd64/linux-headers-6.13.0-061300_6.13.0-061300.202501302155_all.deb
wget --quiet --no-clobber https://file-public1.chasoba.net/mirrors/kernel.ubuntu.com/mainline/v6.13/amd64/linux-headers-6.13.0-061300-generic_6.13.0-061300.202501302155_amd64.deb

dpkg -i ./*.deb
rm *.deb

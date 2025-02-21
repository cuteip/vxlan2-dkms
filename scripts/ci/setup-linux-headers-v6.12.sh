#!/bin/bash

set -ex

wget --quiet --no-clobber https://file-public1.chasoba.net/mirrors/kernel.ubuntu.com/mainline/v6.12/amd64/linux-headers-6.12.0-061200_6.12.0-061200.202411220723_all.deb
wget --quiet --no-clobber https://file-public1.chasoba.net/mirrors/kernel.ubuntu.com/mainline/v6.12/amd64/linux-headers-6.12.0-061200-generic_6.12.0-061200.202411220723_amd64.deb

dpkg -i ./*.deb
rm *.deb

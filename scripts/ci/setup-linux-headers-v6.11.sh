#!/bin/bash

set -ex

wget --quiet --no-clobber https://file-public1.chasoba.net/mirrors/kernel.ubuntu.com/mainline/v6.11/amd64/linux-headers-6.11.0-061100_6.11.0-061100.202409151536_all.deb
wget --quiet --no-clobber https://file-public1.chasoba.net/mirrors/kernel.ubuntu.com/mainline/v6.11/amd64/linux-headers-6.11.0-061100-generic_6.11.0-061100.202409151536_amd64.deb

dpkg -i ./*.deb
rm *.deb

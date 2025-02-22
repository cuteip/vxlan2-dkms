#!/bin/bash

set -ex

wget --quiet --no-clobber https://file-public1.chasoba.net/mirrors/kernel.ubuntu.com/mainline/v6.8/amd64/linux-headers-6.8.0-060800_6.8.0-060800.202502181545_all.deb
wget --quiet --no-clobber https://file-public1.chasoba.net/mirrors/kernel.ubuntu.com/mainline/v6.8/amd64/linux-headers-6.8.0-060800-generic_6.8.0-060800.202502181545_amd64.deb

dpkg -i ./*.deb
rm *.deb

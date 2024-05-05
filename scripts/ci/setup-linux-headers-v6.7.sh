#!/bin/bash

set -ex

wget --quiet --no-clobber https://kernel.ubuntu.com/mainline/v6.7/amd64/linux-headers-6.7.0-060700_6.7.0-060700.202401072033_all.deb
wget --quiet --no-clobber https://kernel.ubuntu.com/mainline/v6.7/amd64/linux-headers-6.7.0-060700-generic_6.7.0-060700.202401072033_amd64.deb

dpkg -i ./*.deb
rm *.deb

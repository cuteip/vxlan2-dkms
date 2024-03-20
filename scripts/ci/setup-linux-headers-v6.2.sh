#!/bin/bash

set -ex

wget --quiet --no-clobber https://kernel.ubuntu.com/mainline/v6.2/amd64/linux-headers-6.2.0-060200_6.2.0-060200.202302191831_all.deb
wget --quiet --no-clobber https://kernel.ubuntu.com/mainline/v6.2/amd64/linux-headers-6.2.0-060200-generic_6.2.0-060200.202302191831_amd64.deb

dpkg -i ./*.deb
rm *.deb

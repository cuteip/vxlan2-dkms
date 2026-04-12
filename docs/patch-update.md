# パッチファイルの更新方法

## オリジナルソースの取得

```shell
mkdir -p temp/
cd temp

wget https://raw.githubusercontent.com/torvalds/linux/refs/tags/v6.19/drivers/net/vxlan/vxlan_core.c
cp vxlan_core.c{,.orig}

$EDITOR vxlan_core.c

diff -uN vxlan_core.c.orig vxlan_core.c > ../ignore_df.patch
```

## test

```shell
incus delete -f uc-container1:dkms-test-debian14
incus launch images:debian/13 uc-container1:dkms-test-debian14 --vm -s pool1
```

```shell
incus config set uc-container1:dkms-test-debian14 security.secureboot=false
incus config device add uc-container1:dkms-test-debian14 eth0 nic nictype=macvlan parent=ens18 name=eth0
```

```shell
incus exec uc-container1:dkms-test-debian14 -- bash

apt update
DEBIAN_FRONTEND=noninteractive sudo -E apt install -y git dkms linux-source patch linux-headers-amd64

mkdir -p temp
cd temp
git clone https://github.com/cuteip/vxlan2-dkms.git
cd vxlan2-dkms
git checkout temp-dkms-patch

dkms remove vxlan2/0.9 || true
dkms add .
dkms build -m vxlan2 -v 0.9

# debug
less /var/lib/dkms/vxlan2/0.9/build/make.log

dkms install -m vxlan2 -v 0.9
```

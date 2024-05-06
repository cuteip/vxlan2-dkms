# vxlan2-dkms

vxlan2 is a patched version of the vxlan module in the Linux kernel that allows IP fragmentation of packets encapsulated in VXLAN.

## Installation

https://github.com/cuteip/vxlan2-dkms/releases

```shell
sudo apt install dkms -y

VXLAN2_DKMS_VERSION=0.7
wget https://github.com/cuteip/vxlan2-dkms/releases/download/v${VXLAN2_DKMS_VERSION}/vxlan2-dkms_${VXLAN2_DKMS_VERSION}_all.deb
sudo apt install -y ./vxlan2-dkms_${VXLAN2_DKMS_VERSION}_all.deb
```

## Limitations

- Supported Linux Kernel versions: 6.1 - 6.5
- Supports only IPv6 underlying network
  - It's likely that applying a similar patch would make the underlying network work with IPv4 as well.
- The upstream vxlan module will be blacklisted when installing vxlan2-dkms

## Upstream / Original

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/net/vxlan

## Appendix

- [Linux Kernel の VXLAN 実装へ IP フラグメントを許容するパッチと DKMS パッケージの紹介 - CuteIP](https://www.cuteip.net/posts/2024/04/09/cuteip-updates-5-vxlan2-dkms/)

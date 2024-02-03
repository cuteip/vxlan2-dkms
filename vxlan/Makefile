#
# Makefile for the vxlan driver
#

# 既存 vxlan と同名だと、パッチ前後のどちらを読み込んでいるのかわからなくなるので、
# vxlan2 とする。

# obj-m += vxlan.o
obj-m += vxlan2.o

ifneq ($(KERNELRELEASE),)
KVER ?= $(shell uname -r)
endif
KDIR ?= /usr/lib/modules/$(KVER)/build

# vxlan-objs := vxlan_core.o vxlan_multicast.o vxlan_vnifilter.o vxlan_mdb.o
vxlan2-objs := vxlan_core.o vxlan_multicast.o vxlan_vnifilter.o vxlan_mdb.o

default:
	$(MAKE) -C $(KDIR) M=$$PWD
clean:
	$(MAKE) -C $(KDIR) M=$$PWD clean

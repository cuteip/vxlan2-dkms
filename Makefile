KDIR ?= /lib/modules/$(KVER)/build

ifeq ($(findstring 6.1.,$(KVER)),6.1.)
	SRC_VERSION := v6.1
else ifeq ($(findstring 6.2.,$(KVER)),6.2.)
	SRC_VERSION := v6.2
else ifeq ($(findstring 6.3.,$(KVER)),6.3.)
	SRC_VERSION := v6.3
else ifeq ($(findstring 6.4.,$(KVER)),6.4.)
	SRC_VERSION := v6.4
else ifeq ($(findstring 6.5.,$(KVER)),6.5.)
	SRC_VERSION := v6.5
else ifeq ($(findstring 6.6.,$(KVER)),6.6.)
	SRC_VERSION := v6.6
else ifeq ($(findstring 6.7.,$(KVER)),6.7.)
	SRC_VERSION := v6.7
else ifeq ($(findstring 6.8.,$(KVER)),6.8.)
	SRC_VERSION := v6.8
else ifeq ($(findstring 6.9.,$(KVER)),6.9.)
	SRC_VERSION := v6.9
else ifeq ($(findstring 6.10.,$(KVER)),6.10.)
	SRC_VERSION := v6.10
else ifeq ($(findstring 6.11.,$(KVER)),6.11.)
	SRC_VERSION := v6.11
else ifeq ($(findstring 6.12.,$(KVER)),6.12.)
	SRC_VERSION := v6.12
else ifeq ($(findstring 6.13.,$(KVER)),6.13.)
	SRC_VERSION := v6.13
else
	$(error not implemented for KVER=$(KVER))
endif

default:
	@echo "KVER=$(KVER)"
	@echo "KDIR=$(KDIR)"
	@echo "PWD=$(PWD)"
	@echo "SRC_VERSION=$(SRC_VERSION)"
	$(MAKE) -C $(KDIR) M=$$PWD/src/$(SRC_VERSION) CONFIG_VXLAN=m
	@mkdir -p ./vxlan2
	@cp $$PWD/src/$(SRC_VERSION)/vxlan2.ko ./vxlan2/vxlan2.ko

clean:
	@echo "KVER=$(KVER)"
	@echo "KDIR=$(KDIR)"
	@echo "PWD=$(PWD)"
	@echo "SRC_VERSION=$(SRC_VERSION)"
	$(MAKE) -C $(KDIR) M=$$PWD/src/$(SRC_VERSION) clean

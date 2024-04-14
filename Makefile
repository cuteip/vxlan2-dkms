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

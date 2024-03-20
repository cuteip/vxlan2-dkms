KDIR ?= /lib/modules/$(KVER)/build

ifeq ($(findstring 6.5.,$(KVER)),6.5.)
	SRC_VERSION := v6.5
	include ./src/$(SRC_VERSION)/Makefile
else
	$(error not implemented for KVER=$(KVER))
endif

default:
	@echo "KVER=$(KVER)"
	@echo "KDIR=$(KDIR)"
	@echo "PWD=$(PWD)"
	@echo "SRC_VERSION=$(SRC_VERSION)"
	$(MAKE) -C $(KDIR) M=$$PWD/src/$(SRC_VERSION)
	@mkdir -p ./vxlan2
	@cp src/$(SRC_VERSION)/vxlan.ko ./vxlan2/vxlan2.ko

clean:
	@echo "KVER=$(KVER)"
	@echo "KDIR=$(KDIR)"
	@echo "PWD=$(PWD)"
	@echo "SRC_VERSION=$(SRC_VERSION)"
	$(MAKE) -C $(KDIR) M=$$PWD/src/$(SRC_VERSION) clean

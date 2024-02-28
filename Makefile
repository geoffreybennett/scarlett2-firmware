.PHONY: help install tar rpm clean

FIRMWARE_DIR := firmware
FIRMWARE_FILES := $(wildcard $(FIRMWARE_DIR)/*.bin)
LICENSE_FILES := $(wildcard LICENSE*)
VERSION := 2128b
NAME := scarlett2-firmware
SPEC_FILE := $(NAME).spec
TAR_DIR := $(NAME)-$(VERSION)
TAR_FILE := $(TAR_DIR).tar.gz

help:
	@echo "Usage:"
	@echo "  make install - Install firmware files to /usr/lib/firmware/scarlett2"
	@echo "  make tar - Create a tarball of the firmware files and spec file"
	@echo "  make rpm - Build an RPM package from the tarball"
	@echo "  make deb - Build an deb package from the tarball"
	@echo "  make clean - Remove tar file"

install:
	install -d $(DESTDIR)/usr/lib/firmware/scarlett2
	install -m 644 $(FIRMWARE_FILES) $(DESTDIR)/usr/lib/firmware/scarlett2

tar: $(FIRMWARE_DIR) $(LICENSE_FILES) $(SPEC_FILE)
	mkdir -p $(TAR_DIR)
	cp -r $(FIRMWARE_DIR) $(LICENSE_FILES) $(SPEC_FILE) debian Makefile $(TAR_DIR)/
	tar czf $(TAR_FILE) $(TAR_DIR)
	rm -rf $(TAR_DIR)

rpm: tar
	rpmbuild -ta $(TAR_FILE)

deb: prepare_deb
	dpkg-deb --build debian $(NAME)_$(VERSION).deb

prepare_deb: tar
	mkdir -p debian/DEBIAN debian/usr/lib/firmware/scarlett2
	cp $(FIRMWARE_FILES) $(LICENSE_FILES) debian/usr/lib/firmware/scarlett2
	cp debian/control debian/DEBIAN
	sed -i "s/VERSION/$(VERSION)/g" debian/DEBIAN/control

clean:
	rm -rf $(TAR_FILE) $(NAME)_$(VERSION).deb debian/usr debian/DEBIAN

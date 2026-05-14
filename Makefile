PY = $(shell which python3)
PSPDEV = $(shell psp-config --pspdev-path)
BUILDTOOLS = $(PSPDEV)/share/psp-cfw-sdk/build-tools

all:
	$(Q)mkdir -p dist/LIBS
	$(Q)cp pre-built/*.prx dist/LIBS/
	$(Q)$(MAKE) -C idStorageRegen
	$(PY) $(BUILDTOOLS)/gz/pspgz.py dist/LIBS/idsregeneration.prx $(BUILDTOOLS)/gz/SystemControl.hdr idStorageRegen/idsregeneration.prx pspIdsRegeneration_Driver 0x3007
	$(Q)$(MAKE) -C IOPrivileged
	$(PY) $(BUILDTOOLS)/gz/pspgz.py dist/LIBS/iop.prx $(BUILDTOOLS)/gz/SystemControl.hdr IOPrivileged/iop.prx IoPrivileged 0x3007
	$(Q)$(MAKE) -C IPL_Updater
	$(PY) $(BUILDTOOLS)/gz/pspgz.py dist/LIBS/ipl_update.prx $(BUILDTOOLS)/gz/SystemControl.hdr IPL_Updater/ipl_update.prx pspIplUpdate 0x3007
	$(Q)$(MAKE) -C KBooti_Updater
	$(PY) $(BUILDTOOLS)/gz/pspgz.py dist/LIBS/kbooti_update.prx $(BUILDTOOLS)/gz/SystemControl.hdr KBooti_Updater/kbooti_update.prx kbooti_update 0x3007
	$(Q)$(MAKE) -C Peops
	$(PY) $(BUILDTOOLS)/gz/pspgz.py dist/LIBS/peops.prx $(BUILDTOOLS)/gz/UserModule.hdr Peops/peops.prx peops 0x0000
	$(Q)$(MAKE) -C PSPAV
	$(PY) $(BUILDTOOLS)/gz/pspgz.py dist/LIBS/pspav.prx $(BUILDTOOLS)/gz/UserModule.hdr PSPAV/pspav.prx PSPAV_Player 0x0000
	$(Q)$(MAKE) -C PSPFTP
	$(PY) $(BUILDTOOLS)/gz/pspgz.py dist/LIBS/pspftp.prx $(BUILDTOOLS)/gz/UserModule.hdr PSPFTP/pspftp.prx FTPlibPSP 0x0000
	$(Q)$(MAKE) -C PSPIdentHelper
	$(PY) $(BUILDTOOLS)/gz/pspgz.py dist/LIBS/kpspident.prx $(BUILDTOOLS)/gz/SystemControl.hdr PSPIdentHelper/kpspident.prx kpspident 0x3007
	$(Q)$(MAKE) -C USBDeviceDriver
	$(PY) $(BUILDTOOLS)/gz/pspgz.py dist/LIBS/usbdevice.prx $(BUILDTOOLS)/gz/SystemControl.hdr USBDeviceDriver/usbdevice.prx pspUsbDev_Driver 0x3007
	$(Q)echo 'All Done!'


clean:
	$(Q)$(MAKE) -C idStorageRegen clean
	$(Q)$(MAKE) -C IOPrivileged clean
	$(Q)$(MAKE) -C IPL_Updater clean
	$(Q)$(MAKE) -C KBooti_Updater clean
	$(Q)$(MAKE) -C Peops clean
	$(Q)$(MAKE) -C PSPAV clean
	$(Q)$(MAKE) -C PSPFTP clean
	$(Q)$(MAKE) -C PSPIdentHelper clean
	$(Q)$(MAKE) -C USBDeviceDriver clean
	$(Q)rm -rf dist

all:
	$(Q)mkdir -p dist/LIBS
	$(Q)cp pre-built/*.prx dist/LIBS/
	$(Q)$(MAKE) -C idStorageRegen
	$(Q)cp idStorageRegen/*.prx dist/LIBS/
	$(Q)$(MAKE) -C IOPrivileged
	$(Q)cp IOPrivileged/*.prx dist/LIBS/
	$(Q)$(MAKE) -C IPL_Updater
	$(Q)cp IPL_Updater/*.prx dist/LIBS/
	$(Q)$(MAKE) -C KBooti_Updater
	$(Q)cp KBooti_Updater/*.prx dist/LIBS/
	$(Q)$(MAKE) -C Peops
	$(Q)cp Peops/*.prx dist/LIBS/
	$(Q)$(MAKE) -C PSPAV
	$(Q)cp PSPAV/*.prx dist/LIBS/
	$(Q)$(MAKE) -C PSPFTP
	$(Q)cp PSPFTP/*.prx dist/LIBS/
	$(Q)$(MAKE) -C PSPIdentHelper
	$(Q)cp PSPIdentHelper/*.prx dist/LIBS/
	$(Q)$(MAKE) -C USBDeviceDriver
	$(Q)cp USBDeviceDriver/*.prx dist/LIBS/
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

PSPSDK=$(shell psp-config --pspsdk-path)

TARGET = kpspident
OBJS = main.o

INCDIR = 
CFLAGS = -Os -G0 -Wall -fno-pic
CXXFLAGS = $(CFLAGS) -fno-exceptions -fno-rtti
ASFLAGS = $(CFLAGS)

BUILD_PRX = 1
PRX_EXPORTS = exports.exp

USE_KERNEL_LIBC = 1
USE_KERNEL_LIBS = 1

LIBDIR = 
LDFLAGS = -nostartfiles
LIBS =

PSP_FW_VERSION = 660

include $(PSPSDK)/lib/build.mak

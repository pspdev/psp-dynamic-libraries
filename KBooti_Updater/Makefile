PSPSDK=$(shell psp-config --pspsdk-path)

TARGET = kbooti_update
OBJS = main.o

INCDIR = 
CFLAGS = -Os -G0 -Wall -fno-pic -std=c99
CXXFLAGS = $(CFLAGS) -fno-exceptions -fno-rtti
ASFLAGS = $(CFLAGS)

PSP_FW_VERSION = 660

BUILD_PRX = 1
PRX_EXPORTS = exports.exp

LIBDIR = 
LDFLAGS = -nostartfiles
LIBS = -lpspsystemctrl_kernel

USE_KERNEL_LIBC = 1
USE_KERNEL_LIBS = 1

include $(PSPSDK)/lib/build.mak

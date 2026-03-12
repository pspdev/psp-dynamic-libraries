PSPSDK=$(shell psp-config --pspsdk-path)

TARGET = idsregeneration
OBJS = main.o exports.o src/idsregeneration.o src/aes_core.o

INCDIR = include
CFLAGS = -O2 -Os -G0 -Wall -fshort-wchar -fno-pic -mno-check-zero-division 
CXXFLAGS = $(CFLAGS) -fno-exceptions -fno-rtti
ASFLAGS = $(CFLAGS)

BUILD_PRX = 1
PRX_EXPORTS = exports.exp

USE_KERNEL_LIBC = 1
USE_KERNEL_LIBS = 1

LDFLAGS = -nostdlib -nodefaultlibs
LIBDIR = 
LIBS = -lpspsystemctrl_kernel -lpspdisplay_driver -lpspnand_driver -lpsplflash_fatfmt

include $(PSPSDK)/lib/build.mak

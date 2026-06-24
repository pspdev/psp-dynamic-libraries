TARGET = unarchive

OBJS = main.o exports.o

BUILD_PRX = 1
PRX_EXPORTS = exports.exp

USE_PSPSDK_LIBS = 1
USE_PSPSDK_LIBC = 1

INCDIR = 
CFLAGS = -std=c99 -O2 -Os -G0 -Wall -fshort-wchar -fno-pic -mno-check-zero-division
CXXFLAGS = $(CFLAGS) -fno-rtti
ASFLAGS = $(CFLAGS)
LIBDIR = 
LIBS = -lunarchive_helper -lunarr -lz -lbz2 -llzma -lpspsysc_user -lpsprtc
LDFLAGS = -nostartfiles

PSPSDK = $(shell psp-config --pspsdk-path)
include $(PSPSDK)/lib/build_prx.mak
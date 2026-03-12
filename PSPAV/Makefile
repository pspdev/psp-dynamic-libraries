TARGET = pspav
OBJS = \
	main.o \
	exports.o \


CFLAGS = -std=c99 -O2 -Os -G0 -Wall -fshort-wchar -fno-pic -mno-check-zero-division
CXXFLAGS = $(CFLAGS) -fno-exceptions -fno-rtti
ASFLAGS = $(CFLAGS)
LDFLAGS = -nostartfiles

BUILD_PRX = 1
PRX_EXPORTS = exports.exp

INCDIR = 
LIBDIR = 

USE_PSPSDK_LIBS = 1
USE_PSPSDK_LIBC = 1

LIBS = -lpspav -lpsppower -lpspaudio -lpspatrac3 -lpspmpeg -lpspmp3 -lpspsystemctrl_user -lpspsysc_user

PSPSDK = $(shell psp-config --pspsdk-path)
include $(PSPSDK)/lib/build_prx.mak

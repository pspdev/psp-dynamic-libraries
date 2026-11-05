project(lflash_fdisk VERSION 1.0 LANGUAGES C ASM)

add_prx_module(lflash_fdisk exports.exp)

target_sources(lflash_fdisk PRIVATE
   main.c
)

target_compile_options(lflash_fdisk PRIVATE -std=c99 -O2 -Os -G0 -Wall -fshort-wchar -fno-pic -mno-check-zero-division)
target_include_directories(lflash_fdisk PRIVATE ${CFWSDK}/include)
target_link_directories(lflash_fdisk PRIVATE ${CFWSDK}/libs)
target_link_libraries(lflash_fdisk PRIVATE
   -nostartfiles
   pspkernel
   pspdisplay_driver
   pspnand_driver
   pspsystemctrl_kernel
)
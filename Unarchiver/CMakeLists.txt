project(unarchive VERSION 1.0 LANGUAGES C ASM)

add_prx_module(unarchiver exports.exp)

target_sources(unarchiver PRIVATE
   main.c
)

target_compile_options(unarchiver PRIVATE -std=c99 -Os -G0 -Wall -fshort-wchar -fno-pic -mno-check-zero-division)
target_include_directories(unarchiver PRIVATE ${CFWSDK}/include)
target_link_directories(unarchiver PRIVATE ${CFWSDK}/libs)
target_link_libraries(unarchiver PRIVATE
   -nostartfiles
   unarchive_helper
   unarr
   z
   bz2
   lzma
   pspsysc_user
   psprtc
)
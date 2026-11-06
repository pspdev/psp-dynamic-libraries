project(libpng VERSION 1.0 LANGUAGES C ASM)

add_prx_module(libpng exports.exp)

target_sources(libpng PRIVATE
   main.c
)

target_compile_options(libpng PRIVATE -std=c99 -Os -G0 -Wall -fshort-wchar -fno-pic -mno-check-zero-division)
target_include_directories(libpng PRIVATE ${CFWSDK}/include)
target_link_directories(libpng PRIVATE ${CFWSDK}/libs)
target_link_libraries(libpng PRIVATE
   -nostartfiles
   png
   z
   m
   pspsysc_user
)
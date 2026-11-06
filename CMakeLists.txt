cmake_minimum_required(VERSION 3.28)

if(NOT DEFINED ENV{PSPDEV})
message(FATAL_ERROR "Please define PSPDEV to point to your PSPDEV path!")
endif()

set(CMAKE_TOOLCHAIN_FILE "$ENV{PSPDEV}/psp/share/pspdev.cmake" CACHE PATH "toolchain file")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(extrautilitymodules VERSION 1.0 LANGUAGES C ASM)

include(FetchContent)

set(PSPCFWSDK_PATH "" CACHE PATH "Path to local psp-cfw-sdk (for local development)")
set(BUILD_PROBLEMATIC OFF CACHE BOOL "If to build the problematic modules")
set(DIST_DIR ${CMAKE_CURRENT_LIST_DIR}/dist)
set(LIBS_DIR ${DIST_DIR}/LIBS)

if(PSPCFWSDK_PATH)
message(STATUS "Using local pspcfw repo: ${PSPCFWSDK_PATH}")
FetchContent_Declare(
    psp-cfw-sdk
    SOURCE_DIR ${PSPCFWSDK_PATH}
    EXCLUDE_FROM_ALL
)
else()
FetchContent_Declare(
    psp-cfw-sdk
    GIT_REPOSITORY https://github.com/pspdev/psp-cfw-sdk.git
    GIT_TAG main
    EXCLUDE_FROM_ALL
)
endif()
FetchContent_MakeAvailable(psp-cfw-sdk)

set(CFWSDK ${psp-cfw-sdk_SOURCE_DIR})

include_directories(${CFWSDK}/include)
link_directories(${CFWSDK}/libs)

remove_definitions("-D_PSP_FW_VERSION=600")
add_definitions("-D_PSP_FW_VERSION=660")

add_subdirectory(idStorageRegen)
add_subdirectory(IOPrivileged)
add_subdirectory(IPL_Updater)
add_subdirectory(KBootI_Updater)
add_subdirectory(PSPAV)
add_subdirectory(PSPFTP)
add_subdirectory(PSPIdentHelper)
add_subdirectory(USBDeviceDriver)
add_subdirectory(lflash_fdisk)
if (BUILD_PROBLEMATIC)
message(STATUS "Enabling build of problematic modules")
add_subdirectory(LibPNG)
add_subdirectory(Unarchiver)
endif()

add_custom_target(dist ALL
    DEPENDS
        idStorageRegen
        IOPrivileged
        IPL_Updater
        KBootI_Updater
        PSPAV
        PSPFTP
        PSPIdentHelper
        USBDeviceDriver
        lflash_fdisk

    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}

    COMMAND ${CMAKE_COMMAND} -E make_directory "${LIBS_DIR}"

    COMMAND ${CMAKE_COMMAND} -E copy_directory "${CMAKE_CURRENT_SOURCE_DIR}/pre-built" "${LIBS_DIR}/"

    COMMAND ${CMAKE_COMMAND} -E copy "$<TARGET_FILE:idsregeneration>.prx" "${LIBS_DIR}/"
    COMMAND ${CMAKE_COMMAND} -E copy "$<TARGET_FILE:iop>.prx" "${LIBS_DIR}/"
    COMMAND ${CMAKE_COMMAND} -E copy "$<TARGET_FILE:ipl_update>.prx" "${LIBS_DIR}/"
    COMMAND ${CMAKE_COMMAND} -E copy "$<TARGET_FILE:kbooti_update>.prx" "${LIBS_DIR}/"
    COMMAND ${CMAKE_COMMAND} -E copy "$<TARGET_FILE:pspav>.prx" "${LIBS_DIR}/"
    COMMAND ${CMAKE_COMMAND} -E copy "$<TARGET_FILE:kpspident>.prx" "${LIBS_DIR}/"
    COMMAND ${CMAKE_COMMAND} -E copy "$<TARGET_FILE:usbdevice>.prx" "${LIBS_DIR}/"
    COMMAND ${CMAKE_COMMAND} -E copy "$<TARGET_FILE:lflash_fdisk>.prx" "${LIBS_DIR}/"
    COMMAND $<$<TARGET_EXISTS:libpng>:${CMAKE_COMMAND}> $<$<TARGET_EXISTS:libpng>:-E> $<$<TARGET_EXISTS:libpng>:copy> $<$<TARGET_EXISTS:libpng>:"$<TARGET_FILE:libpng>.prx"> $<$<TARGET_EXISTS:libpng>:"${LIBS_DIR}/">
    COMMAND $<$<TARGET_EXISTS:unarchiver>:${CMAKE_COMMAND}> $<$<TARGET_EXISTS:unarchiver>:-E> $<$<TARGET_EXISTS:unarchiver>:copy> $<$<TARGET_EXISTS:unarchiver>:"$<TARGET_FILE:unarchiver>.prx"> $<$<TARGET_EXISTS:unarchiver>:"${LIBS_DIR}/">
)

if (BUILD_PROBLEMATIC)
    message(STATUS "Added problematic modules as dependencies of `dist`")
    add_dependencies(dist libpng unarchiver)
endif()
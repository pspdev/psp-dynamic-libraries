cmake_minimum_required(VERSION 3.28)

if(NOT DEFINED ENV{PSPDEV})
message(FATAL_ERROR "Please define PSPDEV to point to your PSPDEV path!")
endif()

set(CMAKE_TOOLCHAIN_FILE "$ENV{PSPDEV}/psp/share/pspdev.cmake" CACHE PATH "toolchain file")
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

project(extrautilitymodules VERSION 1.0 LANGUAGES C ASM)

include(FetchContent)

set(PSPCFWSDK_PATH "" CACHE PATH "Path to local psp-cfw-sdk (for local development)")

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

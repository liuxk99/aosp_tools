# !/bin/bash

#ROOT=/home/thomas/eui/t972

export USER=thomas

source build/envsetup.sh

echo PLATFORM_VERSION:
get_build_var PLATFORM_VERSION

echo PLATFORM_SDK_VERSION:
get_build_var PLATFORM_SDK_VERSION
#!/bin/bash
# host ota_file
if [[ $# -lt 2 ]]; then
	echo "Usage: $0 <host> <ota-file>"
	echo "For example: $0 972-1e out/target/product/letv_gae_cvt/letv_gae_cvt-ota-eng.xianke.zip"
	exit 1
fi

host=$1

ota_file=$2
if [[ ! -e ${ota_file} ]]; then
	echo "${ota_file} dosen't exist!"
	exit 2
fi

adb connect $host
export ANDROID_SERIAL=$host:5555
adb wait-for-device
build_type=`adb shell getprop ro.build.type`
if [[ $build_type != "userdebug" ]]; then
	echo "build type[$build_type] is not userdebug"
	exit 3
fi

adb root
adb connect $host
export ANDROID_SERIAL=$host:5555
adb wait-for-device

ota_cache=/cache/update.zip
time adb push ${ota_file} ${ota_cache}

# adb shell echo '"--update_package=${ota_cache}" >/cache/recovery/command'
adb shell 'echo "--update_package=/cache/update.zip" >/cache/recovery/command'
adb reboot recovery

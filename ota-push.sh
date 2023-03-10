#!/bin/bash

# local ota file path, target host, target usb storage.
if [[ $# -lt 3 ]]; then
	echo "Usage: $0 <host> <ota-file> <target_dir>"
	echo "User can set target_dir='/data/local/tmp' or udisk dir: '/storage/[\-0-9A-F]'."
	echo "For example: $0 972-1e ~/Downloads/letv_gae_cvt-ota-eng.letv-user.zip /data/locla/tmp/"
	exit 1
fi

host=$1
ota_file=$2
target_dir=$3

if [[ ! -e ${ota_file} ]]; then
	echo "${ota_file} dosen't exist!"
	exit 2
fi

adb connect $host
export ANDROID_SERIAL=$host:5555
adb wait-for-device

build_type=`adb shell getprop ro.build.type`
if [[ $build_type != "user" ]]; then
	echo "build type[$build_type] is not user"
	exit 3
fi

time adb push ${ota_file} ${target_dir}/update.zip

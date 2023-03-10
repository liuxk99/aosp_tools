#!/bin/sh

if [[ $# -lt 1 ]]; then
	echo "Usage: $0 <ota-file>"
    echo "This scripts must run at device console with root identity."
    echo "For example: $0 /data/local/tmp/update.zip"
	exit 1
fi

ota_file=$1
if [[ ! -e ${ota_file} ]]; then
	echo "${ota_file} dosen't exist!"
	exit 2
fi

ota_cache=/cache/update.zip
time cp $ota_file $ota_cache
if [[ ! -f ${ota_cache} ]]; then
  echo "${ota_cache} dosen't exist!"
	exit 3
fi

echo "--update_package=/cache/update.zip" >/cache/recovery/command
reboot recovery
# !/bin/bash

repo_sync.sh

source build/envsetup.sh
lunch <<EOF
cibn
aosp_persimmon_isdb-userdebug
EOF

build.sh

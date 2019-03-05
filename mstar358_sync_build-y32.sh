# !/bin/bash

repo_sync.sh

source build/envsetup.sh
lunch <<EOF
cibn
aosp_persimmon_isdb_letv_y32-userdebug
EOF

make update-api
time make -j16

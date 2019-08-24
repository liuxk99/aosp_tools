# !/bin/bash

ROOT=/home/thomas/eui/mstar358
cd $ROOT
repo_sync.sh

source build/envsetup.sh
lunch <<EOF
cibn
aosp_persimmon_isdb_letv_y32-userdebug
EOF

cd $ROOT
make update-api
time make -j16

# !/bin/bash

source build/envsetup.sh
lunch <<EOF
cibn
aosp_persimmon_isdb_letv_y32s-userdebug
EOF
make out/host/linux-x86/framework/idegen.jar
development/tools/idegen/idegen.sh

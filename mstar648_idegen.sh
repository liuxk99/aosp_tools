# !/bin/bash

source build/envsetup.sh
lunch <<EOF
cibn
aosp_almond_letv_hera_dtmb_sub-userdebug
EOF
make out/host/linux-x86/framework/idegen.jar
development/tools/idegen/idegen.sh

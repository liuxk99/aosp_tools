# !/bin/bash

source build/envsetup.sh
lunch <<EOF
cibn
aosp_mangosteen_x4m-userdebug
EOF
make out/host/linux-x86/framework/idegen.jar
development/tools/idegen/idegen.sh

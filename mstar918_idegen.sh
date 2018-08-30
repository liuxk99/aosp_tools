# !/bin/bash

source build/envsetup.sh
lunch <<EOF
cibn
full_mstarnapoli-userdebug
EOF
make out/host/linux-x86/framework/idegen.jar
development/tools/idegen/idegen.sh

# !/bin/bash

repo_sync.sh

source build/envsetup.sh
lunch <<EOF
cibn
aosp_mangosteen_x5-userdebug
EOF

build.sh

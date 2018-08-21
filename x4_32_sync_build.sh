# !/bin/bash

repo_sync.sh

source build/envsetup.sh
lunch <<EOF
cibn
x32-userdebug
EOF

build.sh

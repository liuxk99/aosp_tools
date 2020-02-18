# !/bin/bash

#ROOT=/home/thomas/eui/t972

export USER=thomas

source build/envsetup.sh
lunch <<EOF
cibn
letv_gae-userdebug
EOF

time make -j1

# !/bin/bash

#ROOT=/disk2/thomas/eui/mstar846

#cd $ROOT
.repo/repo/repo forall -c 'git reset --hard; git clean -fd'
.repo/repo/repo sync --no-tags -cj4

export USER=thomas

source build/envsetup.sh
lunch <<EOF
cibn
aosp_almond_letv_hera_dtmb_x450uc-userdebug
EOF

# cd $ROOT
# if [ -d "$ROOT/out" ]; then
#     echo "rm -rf $ROOT/out"
#     rm -rf $ROOT/out
# else
#     echo "no out dir!"
# fi

time make -j4

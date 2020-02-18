# !/bin/bash

ROOT=/home/thomas/eui/t972

cd $ROOT
.repo/repo/repo forall -c 'git reset --hard; git clean -fd'
.repo/repo/repo sync --no-tags -cj4

export USER=thomas

source build/envsetup.sh
lunch <<EOF
cibn
letv_gae-userdebug
EOF

cd $ROOT
#if [ -d "$ROOT/out" ]; then
#    echo "rm -rf $ROOT/out"
#    rm -rf $ROOT/out
#else
#    echo "no out dir!"
#fi

time make -j1

# !/bin/bash

DIR=/home/thomas/eui/mstar846
if [ ! -z $DIR ]; then
  # rm installed dirs
  # echo $DIR 'exist'

  cd $DIR
  if [ ! -z .repo ]; then
    # echo '.repo exist'
    rm .repo -rf
    rm * -rf
  else
    exit 1
  fi

else
  echo '$DIR is empty!'
  exit 2
fi

repo init -u athenar:mstar/6A848/platform/manifest.git -b master -m letv/JASON.xml --repo-url=athenar:tools/repo.git --no-repo-verify
repo sync --no-tags -cdj4

cd $DIR
source build/envsetup.sh
lunch <<EOF
cibn
letv_jason-user
EOF

make -j16


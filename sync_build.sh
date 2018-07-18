# !/bin/bash
# after source build/envsetup.sh; lunch

# clean local uncommited modification
repo forall -c 'git reset --hard; git clean -fd'

# sync lastest code
repo sync --no-tags -cdj4

# make
time make -j16

#!/bin/bash
mstar938=/disk2/thomas/mirror/mstar938
mstar648=/disk2/thomas/mirror/mstar648
mstar358=/disk2/thomas/mirror/mstar358
mstar848=/disk2/thomas/mirror/mstar848

cd $mstar938
repo sync -j4

cd $mstar648
repo sync -j4

cd $mstar358
repo sync -j4

cd $mstar848
repo sync -j4

# mirror
cd /disk2/thomas/eui/mstar357
repo sync --no-tags -cj4

cd /disk2/thomas/eui/mstar357-B
repo sync --no-tags -cj4

cd /disk2/thomas/eui/mstar647
repo sync --no-tags -cj4

cd /disk2/thomas/eui/mstar647-B
repo sync --no-tags -cj4

cd /disk2/thomas/eui/mstar846
repo sync --no-tags -cj4

cd /disk2/thomas/eui/mstar847
repo sync --no-tags -cj4

cd /disk2/thomas/eui/mstar847-B
repo sync --no-tags -cj4

cd /disk2/thomas/eui/mstar918
repo sync --no-tags -cj4

cd /disk2/thomas/eui/mstar927
repo sync --no-tags -cj4

cd /disk2/thomas/eui/mstar928
repo sync --no-tags -cj4

cd /disk2/thomas/eui/mstar937
repo sync --no-tags -cj4

cd /disk2/thomas/eui/mstar937-B
repo sync --no-tags -cj4

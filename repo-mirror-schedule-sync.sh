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

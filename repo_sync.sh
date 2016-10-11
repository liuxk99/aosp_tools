#!/bin/bash

repo forall -c 'git reset --hard; git clean -fd'
repo sync -c -j4


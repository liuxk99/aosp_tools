#!/bin/bash
repo init -u athenar:mstar/6A848/platform/manifest.git -b master -m letv/JASON_BUSINESS.xml \
--repo-url=athenar:tools/repo.git --no-repo-verify \
--reference=/disk2/thomas/mirror/mstar848-main

time repo sync --no-tags -cnj4
du -sh .repo/
time repo sync -l

time repo start dev --all

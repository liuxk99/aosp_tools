# overview
These commands assist AOSP source code development

# modify ~/.bashrc
```
AOSP_TOOLS=~/aosp_tools
PATH=$PATH:$AOSP_TOOLS
```

# Commands
## bash_formatter.py
You can use showcommands pseudo target to show specifical commands(ninja), but usually it's to many lines and difficult to read.
**Before**
```
[100% 1114/1114] /bin/bash -c "(rm -f out/target/product/letv_gae/system/priv-app/LiveTv/oat/arm/LiveTv.odex ) && (cp \"out/target/product/letv_gae/obj/APPS/LiveTv_intermediates/oat/arm/package.odex\" \"out/target/product/letv_gae/system/priv-app/LiveTv/oat/arm/LiveTv.odex\" )"
```
**After**
```
# [100% 1114/1114] 
/bin/bash \
 -c "(rm \
 -f out/target/product/letv_gae/system/priv-app/LiveTv/oat/arm/LiveTv.odex ) \
&& (cp \"out/target/product/letv_gae/obj/APPS/LiveTv_intermediates/oat/arm/package.odex\" \"out/target/product/letv_gae/system/priv-app/LiveTv/oat/arm/LiveTv.odex\" )"
```
So there is simple formatter for console output.
+ comment general output
+ format /bin/bash -c "xxx"
``` bash
make LiveTv showcommands >LiveTv.log 2>&1
python /opt/bin/aosp_tools/bash_formatter.py -i /disk2/thomas/eui/t972/LiveTv.log -o /disk2/thomas/eui/t972/LiveTv.sh
#python /opt/bin/aosp_tools/bash_formatter.py -i ./LiveTv.log -o ./LiveTv.sh
```

# ota utils
On development host, you can push ota.zip to target device(/data/local/tmp/update.zip).
`ota-push.sh` can do these in one command.

## In the target device with ro.build.type:userdebug
On development host, you can use adb root to change root identity, then push ota file to `/cache/update.zip`, then adb reboot recovery.
`ota-update-userdebug.sh` can do these in one command.

## In the target device with ro.build.type:user
On target device on UART console, use cp ota file to `/cache/update.zip`, then reboot recovery.
`ota-update-user-uart.sh` do these in one command.

## ota-push.sh
### NAME
    ota-push - push the ota package file to android device(host)'s target directory.

### SYNOPSIS
    ota-push.sh <host> <ota-file> <target_dir>

### DESCRIPTION
	User can set target_dir='/data/local/tmp' or udisk dir: '/storage/[\-0-9A-F]'.
	For example: 
```
$ ota-push.sh 972-1e ~/Downloads/letv_gae_cvt-ota-eng.letv-user.zip /data/locla/tmp/
```

## ota-update-userdebug.sh
### NAME
    ota-update-userdebug - update ota package on target device with [ro.build.type:userdebug]

### SYNOPSIS
    ota-update-userdebug.sh <host> <ota-file>
    
### DESCRIPTION
	User can push ota package file and reboot recovery.
	For example: 
```
$ ota-update-userdebug.sh 972-1e out/target/product/letv_gae_cvt/letv_gae_cvt-ota-eng.xianke.zip
```

## ota-update-user-uart.sh
### NAME
    ota-update-user-uart - update ota package on local device with [ro.build.type:user], on UART console with root identity.

### SYNOPSIS
    ota-update-user-uart.sh <ota-file>
    
### DESCRIPTION
	User can `cp` ota package file to /cache/update.zip and reboot recovery.
	For example: 
```
# ota-update-user-uart.sh /data/local/tmp/update.zip
```

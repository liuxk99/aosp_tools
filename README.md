# overview
These commands assist AOSP source code development

# modify ~/.bashrc
```
AOSP_TOOLS=~/aosp_tools
PATH=$PATH:$AOSP_TOOLS
```

# commands
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
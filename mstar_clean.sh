#!/bin/bash
function gettop
{
    local TOPFILE=build/core/envsetup.mk
    if [ -n "$TOP" -a -f "$TOP/$TOPFILE" ] ; then
        # The following circumlocution ensures we remove symlinks from TOP.
        (cd $TOP; PWD= /bin/pwd)
    else
        if [ -f $TOPFILE ] ; then
            # The following circumlocution (repeated below as well) ensures
            # that we record the true directory name and not one that is
            # faked up with symlink names.
            PWD= /bin/pwd
        else
            local HERE=$PWD
            T=
            while [ \( ! \( -f $TOPFILE \) \) -a \( $PWD != "/" \) ]; do
                \cd ..
                T=`PWD= /bin/pwd -P`
            done
            \cd $HERE
            if [ -f "$T/$TOPFILE" ]; then
                echo $T
            fi
        fi
    fi
}

function croot()
{
    T=$(gettop)
    if [ "$T" ]; then
        \cd $(gettop)
    else
        echo "Couldn't locate the top of the tree.  Try setting TOP."
    fi
}

croot
cd vendor/mstar/kernel/
git reset --hard
git clean -fd

cd vendor/mstar/supernova/MStarSDK; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/extra; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/audio; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/cec; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/datatype; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/demux; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/devices; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/devices/audio_amp; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/devices/frontend; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/devices/frontpnl; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/devices/mhl; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/devices/panel; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/devices/pcb; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/devices/ursa; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/display; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/gpio; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/hdmitx; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/hsl; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/i2c; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/interface; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/mbootenv; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/middleware; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/middleware/ca; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/middleware/cc; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/middleware/ci; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/middleware/cni; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/middleware/drmcodegen; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/middleware/epg; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/middleware/ginga; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/middleware/hdcp2; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/middleware/huffman; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/middleware/mheg5; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/middleware/mm; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/middleware/oad; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/middleware/pvr; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/middleware/si; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/middleware/subtitle; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/middleware/tsplayer; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/middleware/ttx; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/miu; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/mspi; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/mvop; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/pq; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/sar; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/secure; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/signalprocess; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/smartcard; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/storage; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/str; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/system; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/transform; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/uart; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/utility; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/vd; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/vdec; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/MStarSDK/src/video; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/core/BrickTerminator; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/core/muf; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/develop/core; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/develop/core/MBacktrace; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/develop/core/MLog; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/develop/core/MMAPInfo; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/develop/core/SoftwareIR; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/develop/core/autotest; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/develop/core/dlmalloc; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/develop/core/fastlz; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/develop/core/iniparser; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/develop/core/mali; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/develop/core/mdebug; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/develop/core/moduletest; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/develop/core/muf; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/develop/core/ramLog; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/develop/extra/sim; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/develop/extra/target; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/develop/include/GPD; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/develop/include/apm; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/develop/include/misc; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/develop/lib/target; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/develop/lib/x86; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/Doxygen; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/board; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/board/ChipInfo; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/board/INI; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/board/bin; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/board/inc; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/board/maserati; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/buildsettings; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/config; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/customerinfo; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/customization/MStarSDK; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/customization/MStarSDK/audio; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/customization/MStarSDK/dac; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/customization/MStarSDK/pq; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/customization/MStarSDK/transform; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/customization/MStarSDK/video; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/customization/msrv; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/customization/msrv/atsc; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/customization/msrv/atv; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/customization/msrv/common; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/customization/msrv/control; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/customization/msrv/dvb; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/customization/msrv/system_database; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/customization/network_control; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/devices; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/devices/audioamp; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/devices/customized_plugins; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/devices/demod_dtmb; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/devices/demodulator; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/devices/dish; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/devices/frontpnl; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/devices/hdmitx; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/devices/mhl; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/devices/panel; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/devices/pcb; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/devices/smartcard; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/devices/tuner; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/devices/ursa; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/devices/vif; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/dfbinfo; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/dfbinput; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/ipc_svc; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/ipc_svc/app_ipc_interface; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/ipc_svc/browser_service; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/ipc_svc/commui; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/ipc_svc/mdroid_pkg; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/ipc_svc/msrv_mm_playerinterface; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/ipc_svc/msrv_mountnotifier; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/ipc_svc/msrv_rvu_interface; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/ipc_svc/msrv_secure_interface; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/ipc_svc/msrv_widi_interface; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/ipc_svc/tv_interface; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/ipc_svc/webappmgr; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/lint; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/msrv; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/msrv/MultiScreenTX; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/msrv/atsc; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/msrv/atv; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/msrv/autotest; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/msrv/browser_service; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/msrv/common; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/msrv/control; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/msrv/dvb; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/msrv/module_rel; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/msrv/moduletest; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/msrv/multimedia; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/msrv/netready; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/msrv/network; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/msrv/system_database; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/scripts; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/systeminfo; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/tvos; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/ui/Apps; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/ui/CusApps; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/ui/InternalApps; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/ui/WSServer; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/ui/jarves; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/projects/ui/nebula; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/target; git reset --hard; git clean -fd; cd -
cd vendor/mstar/supernova/tee; git reset --hard; git clean -fd; cd -

cd vendor/broadcom/bcm43569/wifi/; git reset --hard; git clean -fd; cd -
cd vendor/mstar/mboot/; git reset --hard; git clean -fd; cd -

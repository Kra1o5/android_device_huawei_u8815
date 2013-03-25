#!/system/bin/sh
boosted=$(cat /proc/app_info | grep -A1 "framebuffer_boosted:" | grep [0-9])
mount -o remount,rw /system
rm /system/lib/libcm.so
if [ $boosted == 0 ]; then ln -s /system/lib/libcm_0.so /system/lib/libcm.so; fi
if [ $boosted == 1 ]; then ln -s /system/lib/libcm_1.so /system/lib/libcm.so; fi
mount -o remount,ro /system

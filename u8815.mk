# Copyright (C) 2012 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

#
# This file is the build configuration for a full Android
# build for toro hardware. This cleanly combines a set of
# device-specific aspects (drivers) with a device-agnostic
# product configuration (apps). Except for a few implementation
# details, it only fundamentally contains two inherit-product
# lines, full and toro, hence its name.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The GPS configuration appropriate for this device.
$(call inherit-product, device/common/gps/gps_eu_supl.mk)

$(call inherit-product, vendor/huawei/u8815/u8815-vendor.mk)

DEVICE_PACKAGE_OVERLAYS += device/huawei/u8815/overlay

PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi

# Video
PRODUCT_PACKAGES += \
    libstagefrighthw \
    libmm-omxcore \
    libOmxCore

# Graphics
PRODUCT_PACKAGES += \
    copybit.msm7x27a \
    gralloc.msm7x27a \
    hwcomposer.msm7x27a \
    libtilerenderer

# Audio
PRODUCT_PACKAGES += \
    audio.a2dp.default \
    audio.primary.u8815 \
    audio_policy.u8815 \
    audio.usb.default \
    libaudioutils

# GPS
PRODUCT_PACKAGES += \
    gps.u8815
	
# u8815 specific	
PRODUCT_PACKAGES += \
    lights.u8815

# Power HAL	
PRODUCT_PACKAGES += \
    power.msm7x27a

# Live Wallpapers
PRODUCT_PACKAGES += \
    LiveWallpapersPicker \
    librs_jni	
	
# Other Packages
PRODUCT_PACKAGES += \
    libgenlock \
    setbtmac \
    setwifimac \
    dexpreopt \
    make_ext4fs \
    setup_fs \
    Torch \
    com.android.future.usb.accessory 

PRODUCT_COPY_FILES += \
    device/huawei/u8815/ramdisk/init.huawei.rc:root/init.huawei.rc \
    device/huawei/u8815/ramdisk/ueventd.huawei.rc:root/ueventd.huawei.rc \
    device/huawei/u8815/ramdisk/init.huawei.usb.rc:root/init.huawei.usb.rc

PRODUCT_COPY_FILES += \
    device/huawei/u8815/prebuilt/system/etc/fw_4330_b2.bin:system/etc/fw_4330_b2.bin \
    device/huawei/u8815/prebuilt/system/etc/bluetooth/BCM4330.hcd:system/etc/bluetooth/BCM4330.hcd \
    device/huawei/u8815/prebuilt/system/etc/nvram_4330.txt:system/etc/nvram_4330.txt \
    device/huawei/u8815/prebuilt/system/etc/dhcpcd/dhcpcd.conf:system/etc/dhcpcd/dhcpcd.conf \
    device/huawei/u8815/prebuilt/system/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf

PRODUCT_COPY_FILES += \
    device/huawei/u8815/prebuilt/system/etc/audio_policy.conf:system/etc/audio_policy.conf \
    device/huawei/u8815/prebuilt/system/etc/AudioFilter.csv:system/etc/AudioFilter.csv \
    device/huawei/u8815/prebuilt/system/etc/AutoVolumeControl.txt:system/etc/AutoVolumeControl.txt \
    device/huawei/u8815/prebuilt/system/etc/media_codecs.xml:system/etc/media_codecs.xml \
    device/huawei/u8815/prebuilt/system/etc/media_profiles.xml:system/etc/media_profiles.xml \
    device/huawei/u8815/prebuilt/system/etc/libcm.sh:system/etc/libcm.sh \
    device/huawei/u8815/prebuilt/system/etc/vold.fstab:system/etc/vold.fstab

PRODUCT_COPY_FILES += \
    device/huawei/u8815/prebuilt/system/usr/idc/synaptics.idc:system/usr/idc/synaptics.idc \
    device/huawei/u8815/prebuilt/system/usr/idc/qwerty.idc:system/usr/idc/qwerty.idc \
    device/huawei/u8815/prebuilt/system/usr/idc/qwerty2.idc:system/usr/idc/qwerty2.idc \
    device/huawei/u8815/prebuilt/system/usr/keychars/7x27a_kp.kcm:system/usr/keychars/7x27a_kp.kcm \
    device/huawei/u8815/prebuilt/system/usr/keylayout/7x27a_kp.kl:system/usr/keylayout/7x27a_kp.kl \
    device/huawei/u8815/prebuilt/system/usr/keylayout/7k_handset.kl:system/usr/keylayout/7k_handset.kl \
    device/huawei/u8815/prebuilt/system/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
    device/huawei/u8815/prebuilt/system/usr/keylayout/Generic.kl:system/usr/keylayout/Generic.kl \
    device/huawei/u8815/prebuilt/system/usr/keylayout/surf_keypad.kl:system/usr/keylayout/surf_keypad.kl

# Install the features available on this device.
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/native/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/native/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    frameworks/native/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
    frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml

$(call inherit-product, frameworks/native/build/phone-hdpi-512-dalvik-heap.mk)
$(call inherit-product, build/target/product/full.mk)

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_u8815
PRODUCT_DEVICE := u8815
PRODUCT_MANUFACTURER := HUAWEI
PRODUCT_MODEL := Ascend G300

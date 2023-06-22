#
# Copyright (C) 2009 The Android Open Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

#
# This is the product configuration for a generic GSM passion,
# not specialized for any geography.
#

$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
PRODUCT_COPY_FILES += \
    device/htc/flyer/gps.conf:system/etc/gps.conf

## (1) First, the most specific values, i.e. the aspects that are specific to GSM

PRODUCT_COPY_FILES += \
    device/htc/flyer/init.flyer.rc:root/init.flyer.rc

## (2) Also get non-open-source GSM-specific aspects if available
$(call inherit-product-if-exists, vendor/htc/flyer/flyer-vendor.mk)

## (3)  Finally, the least specific parts, i.e. the non-GSM-specific aspects
PRODUCT_PROPERTY_OVERRIDES += \
    ro.com.google.clientidbase=android-tmobile-us \
    ro.com.google.clientidbase.vs=android-hms-tmobile-us \
    ro.com.google.clientidbase.ms=android-hms-tmobile-us \
    ro.com.google.locationfeatures=1 \
    ro.com.google.networklocation=1 \
    ro.com.google.gmsversion=2.2_r6 \
    ro.setupwizard.enable_bypass=1 \
    dalvik.vm.lockprof.threshold=500 \
    dalvik.vm.dexopt-flags=m=y

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0

DEVICE_PACKAGE_OVERLAYS += device/htc/flyer/overlay

PRODUCT_COPY_FILES += \
    frameworks/base/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \
    frameworks/base/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
    frameworks/base/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
    frameworks/base/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
    frameworks/base/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
    frameworks/base/data/etc/android.hardware.sensor.compass.xml:system/etc/permissions/android.hardware.sensor.compass.xml \
    frameworks/base/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
    frameworks/base/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
    frameworks/base/data/etc/android.hardware.touchscreen.multitouch.distinct.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.distinct.xml \
    frameworks/base/data/etc/android.hardware.telephony.gsm.xml:system/etc/permissions/android.hardware.telephony.gsm.xml \
    device/htc/flyer/etc/com.htc.hardware.flyer.xml:system/etc/permissions/com.htc.hardware.flyer.xml \
    device/htc/flyer/etc/com.htc.hardware.twincamdevice.xml:system/etc/permissions/com.htc.hardware.twincamdevice.xml \
    frameworks/base/data/etc/platform.xml:system/etc/permissions/platform.xml 

# media config xml file
PRODUCT_COPY_FILES += \
    device/htc/flyer/media_profiles.xml:system/etc/media_profiles.xml

PRODUCT_PACKAGES += \
    librs_jni \
    lights.flyer \
    sensors.flyer

# Keylayouts
PRODUCT_COPY_FILES += \
    device/htc/flyer/keychars/qwerty2.kcm.bin:system/usr/keychars/qwerty2.kcm.bin \
    device/htc/flyer/keychars/qwerty.kcm.bin:system/usr/keychars/qwerty.kcm.bin \
    device/htc/flyer/keychars/flyer-keypad.kcm.bin:system/usr/keychars/flyer-keypad.kcm.bin \
    device/htc/flyer/keylayout/h2w_headset.kl:system/usr/keylayout/h2w_headset.kl \
    device/htc/flyer/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
    device/htc/flyer/keylayout/flyer-keypad.kl:system/usr/keylayout/flyer-keypad.kl \
    device/htc/flyer/keylayout/curcial-oj.kl:system/usr/keylayout/curcial-oj.kl \
    device/htc/flyer/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl

# Firmware
PRODUCT_COPY_FILES += \
    device/htc/flyer/firmware/bcm4329.hcd:system/etc/firmware/bcm4329.hcd \
    device/htc/flyer/firmware/fw_bcm4329.bin:system/etc/firmware/fw_bcm4329.bin \
    device/htc/flyer/firmware/default.acdb:system/etc/firmware/default.acdb \
    device/htc/flyer/firmware/default_org.acdb:system/etc/firmware/default_org.acdb \
    device/htc/flyer/firmware/default_org_WA.acdb:system/etc/firmware/default_org_WA.acdb \
    device/htc/flyer/firmware/fw_bcm4329_apsta.bin:system/etc/firmware/fw_bcm4329_apsta.bin \
    device/htc/flyer/firmware/vidc_720p_command_control.fw:system/etc/firmware/vidc_720p_command_control.fw \
    device/htc/flyer/firmware/vidc_720p_h263_dec_mc.fw:system/etc/firmware/vidc_720p_h263_dec_mc.fw \
    device/htc/flyer/firmware/vidc_720p_h264_dec_mc.fw:system/etc/firmware/vidc_720p_h264_dec_mc.fw \
    device/htc/flyer/firmware/vidc_720p_h264_enc_mc.fw:system/etc/firmware/vidc_720p_h264_enc_mc.fw \
    device/htc/flyer/firmware/vidc_720p_mp2_dec_mc.fw:system/etc/firmware/vidc_720p_mp2_dec_mc.fw \
    device/htc/flyer/firmware/vidc_720p_mp4_dec_mc.fw:system/etc/firmware/vidc_720p_mp4_dec_mc.fw \
    device/htc/flyer/firmware/vidc_720p_mp4_enc_mc.fw:system/etc/firmware/vidc_720p_mp4_enc_mc.fw \
    device/htc/flyer/firmware/vidc_720p_vc1_dec_mc.fw:system/etc/firmware/vidc_720p_vc1_dec_mc.fw \
    device/htc/flyer/firmware/Flyer_SPK.acdb:system/etc/firmware/Flyer_SPK.acdb \
    device/htc/flyer/firmware/yamato_pfp.fw:system/etc/firmware/yamato_pfp.fw \
    device/htc/flyer/firmware/yamato_pm4.fw:system/etc/firmware/yamato_pm4.fw

# Certificates
PRODUCT_COPY_FILES += \
    device/htc/flyer/certs/T-Mobile_USA_Intermediate_CA_01.der:system/etc/T-Mobile_USA_Intermediate_CA_01.der \
    device/htc/flyer/certs/T-Mobile_USA_Issuer_CA_01.der:system/etc/T-Mobile_USA_Issuer_CA_01.der \
    device/htc/flyer/certs/T-Mobile_USA_Issuer_CA_02.der:system/etc/T-Mobile_USA_Issuer_CA_02.der \
    device/htc/flyer/certs/T-Mobile_USA_Root_CA.der:system/etc/T-Mobile_USA_Root_CA.der

# we have enough storage space to hold precise GC data
PRODUCT_TAGS += dalvik.gc.type-precise

# flyer uses high-density artwork where available
PRODUCT_LOCALES += hdpi

PRODUCT_COPY_FILES += \
    flyer/htc/flyer/vold.fstab:system/etc/vold.fstab

# Kernel modules
#PRODUCT_COPY_FILES += \

ifeq ($(TARGET_PREBUILT_KERNEL),)
LOCAL_KERNEL := device/htc/flyer/kernel
else
LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

PRODUCT_COPY_FILES += \
    device/htc/flyer/modules/bcm4329.ko:system/lib/modules/bcm4329.ko

$(call inherit-product-if-exists, vendor/htc/flyer/flyer-vendor.mk)

# media profiles and capabilities spec
$(call inherit-product, device/htc/flyer/media_a1026.mk)

# htc audio settings
$(call inherit-product, device/htc/flyer/media_htcaudio.mk)

# stuff common to all HTC phones
$(call inherit-product, device/htc/common/common.mk)

$(call inherit-product, build/target/product/full.mk)


PRODUCT_NAME := htc_flyer
PRODUCT_DEVICE := flyer
PRODUCT_MODEL := HTC Flyer
PRODUCT_MANUFACTURER := HTC


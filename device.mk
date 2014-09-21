#
# Copyright (C) 2014 The CyanogenMod Project
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

## (2) Also get non-open-source specific aspects if available
$(call inherit-product-if-exists, vendor/samsung/expressatt/expressatt-vendor.mk)

## overlays
DEVICE_PACKAGE_OVERLAYS += device/samsung/expressatt/overlay

# Boot animation and screen size
PRODUCT_AAPT_CONFIG := normal hdpi
PRODUCT_AAPT_PREF_CONFIG := hdpi
TARGET_SCREEN_HEIGHT := 800
TARGET_SCREEN_WIDTH := 480
PRODUCT_PROPERTY_OVERRIDES += ro.sf.lcd_density=240

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

# Ramdisk
PRODUCT_PACKAGES += \
    init.bt.sh \
    init.target.rc \
    wifimac.sh

PRODUCT_COPY_FILES += \
    device/samsung/expressatt/rootdir/etc/init.qcom.rc:root/init.qcom.rc \
    device/samsung/expressatt/rootdir/etc/ueventd.qcom.rc:root/ueventd.qcom.rc

# Audio configuration
PRODUCT_COPY_FILES += \
    device/samsung/expressatt/audio/snd_soc_msm_2x:system/etc/snd_soc_msm/snd_soc_msm_2x \
    device/samsung/expressatt/audio/audio_policy.conf:system/etc/audio_policy.conf

# GPS
PRODUCT_PACKAGES += \
    gps.msm8960

PRODUCT_COPY_FILES += \
    device/samsung/expressatt/gps/gps.conf:system/etc/gps.conf

# Keylayout
PRODUCT_COPY_FILES += \
    device/samsung/expressatt/keylayout/fsa9485.kl:system/usr/keylayout/fsa9485.kl \
    device/samsung/expressatt/keylayout/msm8960-snd-card_Button_Jack.kl:system/usr/keylayout/msm8960-snd-card_Button_Jack.kl \
    device/samsung/expressatt/keylayout/sec_key.kl:system/usr/keylayout/sec_key.kl \
    device/samsung/expressatt/keylayout/sec_keys.kl:system/usr/keylayout/sec_keys.kl \
    device/samsung/expressatt/keylayout/sec_powerkey.kl:system/usr/keylayout/sec_powerkey.kl \
    device/samsung/expressatt/keylayout/sec_touchkey.kl:system/usr/keylayout/sec_touchkey.kl \
    device/samsung/expressatt/keylayout/sii9234_rcp.kl:system/usr/keylayout/sii9234_rcp.kl

# Logo
PRODUCT_COPY_FILES += \
    device/samsung/expressatt/initlogo.rle:root/initlogo.rle

# Media profile
PRODUCT_COPY_FILES += \
    device/samsung/expressatt/media/media_profiles.xml:system/etc/media_profiles.xml

# Wifi
PRODUCT_COPY_FILES += \
    device/samsung/expressatt/wifi/wpa_supplicant_overlay.conf:system/etc/wifi/wpa_supplicant_overlay.conf \
    device/samsung/expressatt/wifi/p2p_supplicant_overlay.conf:system/etc/wifi/p2p_supplicant_overlay.conf

PRODUCT_PACKAGES += \
    WCNSS_cfg.dat \
    WCNSS_qcom_cfg.ini \
    WCNSS_qcom_wlan_nv.bin_

# common msm8960
$(call inherit-product, device/samsung/msm8960-common/msm8960.mk)

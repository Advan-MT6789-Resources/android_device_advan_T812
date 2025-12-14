#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit_only.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/mica/config/common_full_tablet.mk)

# Inherit from T812 device
$(call inherit-product, device/advan/T812/device.mk)

PRODUCT_NAME := mica_T812
PRODUCT_DEVICE := T812
PRODUCT_MANUFACTURER := ADVAN
PRODUCT_BRAND := ADVAN
PRODUCT_MODEL := 8004

PRODUCT_GMS_CLIENTID_BASE := android-advandigital

PRODUCT_BUILD_PROP_OVERRIDES += \
    BuildFingerprint=ADVAN/ADVAN_TAB_V8/ADVAN_TAB_V8:14/UP1A.231005.007/1729758888:user/release-keys \
    DeviceName=ADVAN_TAB_V8 \
    DeviceProduct=ADVAN_TAB_V8 \
    SystemDevice=ADVAN_TAB_V8 \
    SystemName=ADVAN_TAB_V8

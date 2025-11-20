#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from those products. Most specific first.
$(call inherit-product, $(SRC_TARGET_DIR)/product/core_64_bit.mk)
$(call inherit-product, $(SRC_TARGET_DIR)/product/full_base_telephony.mk)

# Inherit some common Lineage stuff.
$(call inherit-product, vendor/lineage/config/common_full_tablet.mk)

# Inherit from T812 device
$(call inherit-product, device/advan/T812/device.mk)

PRODUCT_NAME := lineage_T812
PRODUCT_DEVICE := T812
PRODUCT_MANUFACTURER := ADVAN
PRODUCT_BRAND := ADVAN
PRODUCT_MODEL := 8004

PRODUCT_SYSTEM_DEVICE := ADVAN_TAB_V8

PRODUCT_GMS_CLIENTID_BASE := android-advandigital

PRODUCT_BUILD_PROP_OVERRIDES += \
    PRIVATE_BUILD_DESC="sys_mssi_t_64_cn_armv82-user 14 UP1A.231005.007 1729758888 release-keys" \
    TARGET_DEVICE=$(PRODUCT_SYSTEM_DEVICE) \
    TARGET_PRODUCT=$(PRODUCT_SYSTEM_DEVICE)

BUILD_FINGERPRINT=ADVAN/ADVAN_TAB_V8/ADVAN_TAB_V8:14/UP1A.231005.007/1729758888:user/release-keys

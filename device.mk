#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/advan/T812

# Inherit from mt6789-common
$(call inherit-product, device/advan/mt6789-common/common.mk)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
	$(LOCAL_PATH)

# Inherit from vendor blobs
$(call inherit-product, vendor/advan/T812/T812-vendor.mk)

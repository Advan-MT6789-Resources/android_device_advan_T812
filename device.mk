#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

DEVICE_PATH := device/advan/T812
KERNEL_PATH := $(DEVICE_PATH)-kernel

# Inherit from mt6789-common
$(call inherit-product, device/advan/mt6789-common/common.mk)

# Audio
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/configs/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml

# Kernel
PRODUCT_COPY_FILES += \
	$(KERNEL_PATH)/Image.gz:kernel

# Overlays
PRODUCT_PACKAGES += \
	ApertureResOverlayT812 \
	FrameworksResOverlayT812

# Power
$(call soong_config_set,mediatek_power,powerhal_ext,//$(LOCAL_PATH):libpowermode-ext-T812)

# Soong namespaces
PRODUCT_SOONG_NAMESPACES += \
	$(LOCAL_PATH)

# Inherit from vendor blobs
$(call inherit-product, vendor/advan/T812/T812-vendor.mk)

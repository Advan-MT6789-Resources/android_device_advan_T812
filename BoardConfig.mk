#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

# Inherit from mt6789-common
include device/advan/mt6789-common/BoardConfigCommon.mk

# Display
TARGET_SCREEN_DENSITY := 280

# Inherit from the proprietary version
include vendor/advan/T812/BoardConfigVendor.mk

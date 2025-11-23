#
# Copyright (C) 2025 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

LOCAL_PATH := $(call my-dir)

ifeq ($(TARGET_DEVICE),T812)

include $(call all-makefiles-under,$(LOCAL_PATH))

CAMERA_SYMLINKS := $(addprefix $(TARGET_OUT_VENDOR)/, $(strip $(shell cat $(DEVICE_PATH)/symlink/camera.txt)))
$(CAMERA_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	$(hide) echo "Linking $(notdir $@)"
	@ln -sf $(TARGET_BOARD_PLATFORM)/$(notdir $@) $@

GATEKEEPER_SYMLINKS := $(TARGET_OUT_VENDOR)/lib64/hw/gatekeeper.default.so
$(GATEKEEPER_SYMLINKS): $(LOCAL_INSTALLED_MODULE)
	$(hide) echo "Linking $(notdir $@)"
	@ln -sf libSoftGatekeeper.so $@

ALL_DEFAULT_INSTALLED_MODULES += \
	$(CAMERA_SYMLINKS) \
	$(GATEKEEPER_SYMLINKS)

endif

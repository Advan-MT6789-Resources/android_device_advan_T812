#!/usr/bin/env -S PYTHONPATH=../../../tools/extract-utils python3
#
# SPDX-FileCopyrightText: 2024 The LineageOS Project
# SPDX-License-Identifier: Apache-2.0
#

from extract_utils.fixups_blob import (
    blob_fixup,
    blob_fixups_user_type,
)
from extract_utils.main import (
    ExtractUtils,
    ExtractUtilsModule,
)

namespace_imports = [
    'device/advan/mt6789-common',
    'hardware/mediatek',
    'vendor/advan/mt6789-common',
]

blob_fixups: blob_fixups_user_type = {
    'vendor/bin/hw/android.hardware.security.keymint-service.trustkernel': blob_fixup()
        .replace_needed('android.hardware.security.keymint-V1-ndk_platform.so', 'android.hardware.security.keymint-V4-ndk.so')
        .replace_needed('android.hardware.security.sharedsecret-V1-ndk_platform.so', 'android.hardware.security.sharedsecret-V1-ndk.so')
        .replace_needed('android.hardware.security.secureclock-V1-ndk_platform.so', 'android.hardware.security.secureclock-V1-ndk.so')
        .add_needed('android.hardware.security.rkp-V3-ndk.so'),
    'vendor/lib64/mt6789/libcam.utils.sensorprovider.so': blob_fixup()
        .replace_needed('libsensorndkbridge.so', 'android.hardware.sensors@1.0-convert-shared.so'),
    (
        'vendor/lib64/hw/mt6789/android.hardware.camera.provider@2.6-impl-mediatek.so',
        'vendor/lib64/mt6789/libmtkcam_stdutils.so'
    ): blob_fixup()
        .replace_needed('libutils.so', 'libutils-v32.so'),
    (
        'vendor/lib64/mt6789/lib3a.ae.stat.so',
        'vendor/lib64/mt6789/lib3a.flash.so',
        'vendor/lib64/mt6789/lib3a.sensors.color.so',
        'vendor/lib64/mt6789/lib3a.sensors.flicker.so',
    ): blob_fixup()
        .add_needed('liblog.so'),
}  # fmt: skip

module = ExtractUtilsModule(
    'T812',
    'advan',
    namespace_imports=namespace_imports,
    blob_fixups=blob_fixups,
    add_firmware_proprietary_file=True,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(
        module, 'mt6789-common', module.vendor
    )
    utils.run()

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
    'vendor/lib64/mt6789/libcam.utils.sensorprovider.so': blob_fixup()
        .add_needed('libshim_sensors.so'),
    (
        'vendor/lib64/hw/mt6789/android.hardware.camera.provider@2.6-impl-mediatek.so',
        'vendor/lib64/mt6789/libmtkcam_stdutils.so'
    ): blob_fixup()
        .replace_needed('libutils.so', 'libutils-v32.so'),
}  # fmt: skip

module = ExtractUtilsModule(
    'T812',
    'advan',
    namespace_imports=namespace_imports,
    blob_fixups=blob_fixups,
    check_elf=True,
    add_firmware_proprietary_file=True,
)

if __name__ == '__main__':
    utils = ExtractUtils.device_with_common(
        module, 'mt6789-common', module.vendor
    )
    utils.run()

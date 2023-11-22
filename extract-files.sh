#!/bin/bash
#
# Copyright (C) 2016 The CyanogenMod Project
# Copyright (C) 2017-2020 The LineageOS Project
#
# SPDX-License-Identifier: Apache-2.0
#

function blob_fixup() {
    case "${1}" in
        vendor/lib64/mt6789/libcam.utils.sensorprovider.so)
            grep -q "libshim_sensors.so" "${2}" || "${PATCHELF_0_17_2}" --add-needed "libshim_sensors.so" "${2}"
            ;;
        vendor/lib64/mt6789/libmtkcam_stdutils.so)
            "${PATCHELF}" --replace-needed "libutils.so" "libutils-v32.so" "${2}"
            ;;
    esac
}

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

export DEVICE=T812
export DEVICE_COMMON=mt6789-common
export VENDOR=advan

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"

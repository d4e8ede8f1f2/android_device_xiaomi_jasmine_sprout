#!/bin/bash

# If we're being sourced by the common script that we called,
# stop right here. No need to go down the rabbit hole.
if [ "${BASH_SOURCE[0]}" != "${0}" ]; then
    return
fi

set -e

# Required!
export DEVICE=jasmine_sprout
export DEVICE_COMMON=sdm660-common
export VENDOR=xiaomi

export DEVICE_BRINGUP_YEAR=2018

GOODIX="$LINEAGE_ROOT"/vendor/"$VENDOR"/"$DEVICE"/proprietary/vendor/lib64/libgf_ca.so
sed -i "s|/system/etc/firmware|/vendor/firmware\x0\x0\x0\x0|g" $GOODIX

"./../../${VENDOR}/${DEVICE_COMMON}/extract-files.sh" "$@"

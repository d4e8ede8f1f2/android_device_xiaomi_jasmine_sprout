#!/bin/bash

set -e

# Required!
export DEVICE=jasmine_sprout
export DEVICE_COMMON=sdm660-common
export VENDOR=xiaomi

export DEVICE_BRINGUP_YEAR=2018

"./../../${VENDOR}/${DEVICE_COMMON}/setup-makefiles.sh" "$@"

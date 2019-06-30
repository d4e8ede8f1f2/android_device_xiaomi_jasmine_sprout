
LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_C_INCLUDES := \
    system/core/base/include \
    system/core/init

LOCAL_MODULE := libinit_jasmine_sprout
LOCAL_MODULE_TAGS := optional
LOCAL_SRC_FILES := init_jasmine_sprout.cpp

LOCAL_STATIC_LIBRARIES := \
    libbase \
    libselinux

include $(BUILD_STATIC_LIBRARY)


# Inherit the fusion-common definitions
$(call inherit-product, device/xiaomi/sdm660-common/platform.mk)

# Inherit from PixelExperience custom product configuration
$(call inherit-product, vendor/aosp/config/common.mk)

#TWRP
BUILD_TWRP := false

# Device Path
DEVICE_PATH := device/xiaomi/jasmine_sprout

# Device identifier
PRODUCT_BRAND := xiaomi
PRODUCT_DEVICE := jasmine_sprout
PRODUCT_NAME := aosp_jasmine_sprout
PRODUCT_MANUFACTURER := Xiaomi
PRODUCT_MODEL := Mi A2
PRODUCT_PLATFORM := sdm660

PRODUCT_BUILD_PROP_OVERRIDES += \
	PRODUCT_NAME="jasmine" \
	TARGET_DEVICE="jasmine_sprout"

TARGET_VENDOR_PRODUCT_NAME := jasmine

# A/B
AB_OTA_UPDATER := true

AB_OTA_PARTITIONS += \
	boot \
	system \
	vendor

AB_OTA_POSTINSTALL_CONFIG += \
	RUN_POSTINSTALL_system=true \
	POSTINSTALL_PATH_system=system/bin/otapreopt_script \
	FILESYSTEM_TYPE_system=ext4 \
	POSTINSTALL_OPTIONAL_system=true

PRODUCT_PACKAGES += \
	otapreopt_script

# Apps
$(call inherit-product-if-exists, vendor/apps/GoogleCamera/config.mk)
$(call inherit-product-if-exists, vendor/apps/MiuiCamera/config.mk)
$(call inherit-product-if-exists, vendor/apps/WallpapersBReel2018/config.mk)

# PixelExperience stuff
TARGET_GAPPS_ARCH := arm64
TARGET_BOOT_ANIMATION_RES := 1080
#CUSTOM_BUILD_TYPE := OFFICIAL
IS_PHONE := true

# Overlays
DEVICE_PACKAGE_OVERLAYS += \
	$(DEVICE_PATH)/overlay

# Audio
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/audio/audio_effects.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_effects.xml \
	$(DEVICE_PATH)/audio/audio_output_policy.conf:$(TARGET_COPY_OUT_VENDOR)/etc/audio_output_policy.conf \
	$(DEVICE_PATH)/audio/audio_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_platform_info.xml \
	$(DEVICE_PATH)/audio/audio_policy_configuration.xml:$(TARGET_COPY_OUT_VENDOR)/etc/audio_policy_configuration.xml \
	$(DEVICE_PATH)/audio/audio_tuning_mixer.txt:$(TARGET_COPY_OUT_VENDOR)/etc/audio_tuning_mixer.txt \
	$(DEVICE_PATH)/audio/graphite_ipc_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/graphite_ipc_platform_info.xml \
	$(DEVICE_PATH)/audio/listen_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/listen_platform_info.xml \
	$(DEVICE_PATH)/audio/mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/mixer_paths.xml \
	$(DEVICE_PATH)/audio/sound_trigger_mixer_paths.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_mixer_paths.xml \
	$(DEVICE_PATH)/audio/sound_trigger_platform_info.xml:$(TARGET_COPY_OUT_VENDOR)/etc/sound_trigger_platform_info.xml

# Boot animation
TARGET_SCREEN_HEIGHT := 2160
TARGET_SCREEN_WIDTH := 1080

PRODUCT_CHARACTERISTICS := nosdcard

# Boot control
PRODUCT_PACKAGES += \
	android.hardware.boot@1.0-impl \
	android.hardware.boot@1.0-service \
	bootctrl.sdm660

PRODUCT_STATIC_BOOT_CONTROL_HAL := \
	bootctrl.sdm660 \
	libcutils \
	libgptutils \
	libz

# Consumerir
PRODUCT_PACKAGES += \
	android.hardware.ir@1.0-impl \
	android.hardware.ir@1.0-service

# Device properties
$(call inherit-product, $(DEVICE_PATH)/device_prop.mk)

# Init
PRODUCT_PACKAGES += \
	libinit_jasmine_sprout

# Media
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs.xml \
	$(DEVICE_PATH)/media/media_codecs.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_vendor.xml \
	$(DEVICE_PATH)/media/media_codecs_performance.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_codecs_performance.xml \
	$(DEVICE_PATH)/media/media_profiles_V1_0.xml:$(TARGET_COPY_OUT_VENDOR)/etc/media_profiles_V1_0.xml

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.consumerir.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.consumerir.xml

# Ramdisk
 PRODUCT_PACKAGES += \
	init.device.rc \
	init.goodix.sh

# Screen density
PRODUCT_AAPT_CONFIG := normal
PRODUCT_AAPT_PREF_CONFIG := xxhdpi

# Sensors
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/sensors/sensor_def_qcomdev.conf:$(TARGET_COPY_OUT_VENDOR)/etc/sensors/sensor_def_qcomdev.conf

# Update engine
PRODUCT_PACKAGES += \
	brillo_update_payload \
	update_engine \
	update_engine_sideload \
	update_verifier

PRODUCT_PACKAGES_DEBUG += \
	update_engine_client

# Vibrator
PRODUCT_PACKAGES += \
	android.hardware.vibrator@1.0-impl \
	android.hardware.vibrator@1.0-service

# Watermark
PRODUCT_COPY_FILES += \
	$(DEVICE_PATH)/media/MIUI_DualCamera_watermark_A2.png:$(TARGET_COPY_OUT_VENDOR)/etc/MIUI_DualCamera_watermark.png

# Verity
PRODUCT_SYSTEM_VERITY_PARTITION := /dev/block/platform/soc/c0c4000.sdhci/by-name/system
PRODUCT_VENDOR_VERITY_PARTITION := /dev/block/platform/soc/c0c4000.sdhci/by-name/vendor
$(call inherit-product, build/target/product/verity.mk)

# Vendor files
$(call inherit-product, vendor/xiaomi/wayne/wayne-vendor.mk)

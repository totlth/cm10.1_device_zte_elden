$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

$(call inherit-product, build/target/product/full_base_telephony.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/zte/elden/overlay

PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_TAGS += dalvik.gc.type-precise

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product-if-exists, vendor/zte/elden/elden-vendor.mk)

LOCAL_PATH := device/zte/elden
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

$(call inherit-product, $(LOCAL_PATH)/prebuilts/lib/modules/modules.mk)

## Ramdisk
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/ramdisk/fstab.qcom:root/fstab.qcom \
        $(LOCAL_PATH)/ramdisk/init.rc:root/init.rc \
        $(LOCAL_PATH)/ramdisk/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
        $(LOCAL_PATH)/ramdisk/init.qcom.class_main.sh:root/init.qcom.class_main.sh \
        $(LOCAL_PATH)/ramdisk/init.qcom.rc:root/init.qcom.rc \
        $(LOCAL_PATH)/ramdisk/init.qcom.sh:root/init.qcom.sh \
        $(LOCAL_PATH)/ramdisk/init.qcom.usb.rc:root/init.qcom.usb.rc \
        $(LOCAL_PATH)/ramdisk/init.qcom.usb.sh:root/init.qcom.usb.sh \
        $(LOCAL_PATH)/ramdisk/ueventd.rc:root/ueventd.qcom.rc \
        $(LOCAL_PATH)/ramdisk/logo.bmp:root/logo.bmp \
        $(LOCAL_PATH)/ramdisk/sbin/usbconfig:root/sbin/usbconfig

#LLVM for RenderScript
LLVM_ROOT_PATH := external/llvm

# Permissions
PRODUCT_COPY_FILES += \
	frameworks/native/data/etc/android.hardware.bluetooth.xml:system/etc/permissions/android.hardware.bluetooth.xml \
	frameworks/native/data/etc/android.hardware.camera.flash-autofocus.xml:system/etc/permissions/android.hardware.camera.flash-autofocus.xml \
	frameworks/native/data/etc/android.hardware.camera.front.xml:system/etc/permissions/android.hardware.camera.front.xml \
	frameworks/native/data/etc/android.hardware.camera.xml:system/etc/permissions/android.hardware.camera.xml \
	frameworks/native/data/etc/android.hardware.location.gps.xml:system/etc/permissions/android.hardware.location.gps.xml \
	frameworks/native/data/etc/android.hardware.sensor.accelerometer.xml:system/etc/permissions/android.hardware.sensor.accelerometer.xml \
	frameworks/native/data/etc/android.hardware.sensor.light.xml:system/etc/permissions/android.hardware.sensor.light.xml \
	frameworks/native/data/etc/android.hardware.sensor.proximity.xml:system/etc/permissions/android.hardware.sensor.proximity.xml \
	frameworks/native/data/etc/android.hardware.telephony.cdma.xml:system/etc/permissions/android.hardware.telephony.cdma.xml \
	frameworks/native/data/etc/android.hardware.touchscreen.multitouch.jazzhand.xml:system/etc/permissions/android.hardware.touchscreen.multitouch.jazzhand.xml \
	frameworks/native/data/etc/android.hardware.usb.accessory.xml:system/etc/permissions/android.hardware.usb.accessory.xml \
	frameworks/native/data/etc/android.hardware.wifi.direct.xml:system/etc/permissions/android.hardware.wifi.direct.xml \
	frameworks/native/data/etc/android.hardware.wifi.xml:system/etc/permissions/android.hardware.wifi.xml \
	frameworks/native/data/etc/android.software.sip.voip.xml:system/etc/permissions/android.software.sip.voip.xml \
	frameworks/native/data/etc/com.android.nfc_extras.xml:system/etc/permissions/com.android.nfc_extras.xml \
	frameworks/native/data/etc/handheld_core_hardware.xml:system/etc/permissions/handheld_core_hardware.xml \

# Audio
PRODUCT_PACKAGES += \
	alsa.msm8960 \
        audio.a2dp.default \
        audio.primary.msm8960 \
        audio_policy.msm8960 \
        libalsa-intf \
        libaudioparameter \
        libaudioutils

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilts/lib/libsrsprocessing.so:obj/lib/libsrsprocessing.so

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilts/lib/libacdbloader.so:system/lib/libacdbloader.so \
	$(LOCAL_PATH)/prebuilts/lib/libalsautils.so:system/lib/libalsautils.so \
	$(LOCAL_PATH)/prebuilts/lib/libaudcal.so:system/lib/libaudcal.so \
	$(LOCAL_PATH)/prebuilts/lib/libaudioalsa.so:system/lib/libaudioalsa.so \
	$(LOCAL_PATH)/prebuilts/lib/libsrsprocessing.so:system/lib/libsrsprocessing.so

# Bluetooth
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilts/bin/bluetoothd:system/bin/bluetoothd \
	$(LOCAL_PATH)/prebuilts/bin/bt_ssp_debug_mode.sh:system/bin/bt_ssp_debug_mode.sh \
	$(LOCAL_PATH)/prebuilts/bin/bt_testmode.sh:system/bin/bt_testmode.sh \
	$(LOCAL_PATH)/prebuilts/bin/bt_testmode_new.sh:system/bin/bt_testmode_new.sh \
	$(LOCAL_PATH)/prebuilts/bin/btnvtool:system/bin/btnvtool \
 	$(LOCAL_PATH)/prebuilts/bin/hciattach:system/bin/hciattach \
	$(LOCAL_PATH)/prebuilts/bin/hci_qcomm_init:system/bin/hci_qcomm_init \
 	$(LOCAL_PATH)/prebuilts/bin/hciconfig:system/bin/hciconfig \
	$(LOCAL_PATH)/prebuilts/bin/hcitool:system/bin/hcitool \
	$(LOCAL_PATH)/prebuilts/bin/init.btprop.sh:system/bin/init.btprop.sh \
	$(LOCAL_PATH)/prebuilts/etc/bluetooth/audio.conf:system/etc/bluetooth/audio.conf \
	$(LOCAL_PATH)/prebuilts/etc/bluetooth/auto_pairing.conf:system/etc/bluetooth/auto_pairing.conf \
	$(LOCAL_PATH)/prebuilts/etc/bluetooth/blacklist.conf:system/etc/bluetooth/blacklist.conf \
	$(LOCAL_PATH)/prebuilts/etc/bluetooth/input.conf:system/etc/bluetooth/input.conf \
	$(LOCAL_PATH)/prebuilts/etc/bluetooth/main.conf:system/etc/bluetooth/main.conf \
	$(LOCAL_PATH)/prebuilts/etc/bluetooth/network.conf:system/etc/bluetooth/network.conf \
	$(LOCAL_PATH)/prebuilts/lib/libbluedroid.so:system/lib/libbluedroid.so \
	$(LOCAL_PATH)/prebuilts/lib/libbluetooth.so:system/lib/libbluetooth.so \
	$(LOCAL_PATH)/prebuilts/lib/libbluetoothd.so:system/lib/libbluetoothd.so \
	$(LOCAL_PATH)/prebuilts/lib/libbtio.so:system/lib/libbtio.so

# Camera
PRODUCT_PACKAGES += \
	libcameraservice \
	libcamera_client

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilts/lib/liboemcamera.so:obj/lib/liboemcamera.so

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilts/bin/mm-qcamera-daemon:system/bin/mm-qcamera-daemon \
        $(LOCAL_PATH)/prebuilts/bin/mm-qcamera-test:system/bin/mm-qcamera-test \
        $(LOCAL_PATH)/prebuilts//bin/mm-qcamera-testsuite-client:system/bin/mm-qcamera-testsuite-client \
        $(LOCAL_PATH)/prebuilts/bin/v4l2-qcamera-app:system/bin/v4l2-qcamera-app \
    $(LOCAL_PATH)/prebuilts/lib/hw/camera.goldfish.so:system/lib/hw/camera.goldfish.so \
    $(LOCAL_PATH)/prebuilts/lib/hw/camera.msm8960.so:system/lib/hw/camera.msm8960.so \
        $(LOCAL_PATH)/prebuilts/lib/liboemcamera.so:system/lib/liboemcamera.so

# Display Firmware
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilts/etc/firmware/a225p5_pm4.fw:system/etc/firmware/a225p5_pm4.fw \
        $(LOCAL_PATH)/prebuilts/etc/firmware/a225_pfp.fw:system/etc/firmware/a225_pfp.fw \
        $(LOCAL_PATH)/prebuilts/etc/firmware/a225_pm4.fw:system/etc/firmware/a225_pm4.fw \
        $(LOCAL_PATH)/prebuilts/etc/firmware/a300_pfp.fw:system/etc/firmware/a300_pfp.fw \
        $(LOCAL_PATH)/prebuilts/etc/firmware/a300_pm4.fw:system/etc/firmware/a300_pm4.fw \
        $(LOCAL_PATH)/prebuilts/etc/firmware/leia_pfp_470.fw:system/etc/firmware/leia_pfp_470.fw \
        $(LOCAL_PATH)/prebuilts/etc/firmware/leia_pm4_470.fw:system/etc/firmware/leia_pm4_470.fw \
        $(LOCAL_PATH)/prebuilts/lib/egl/egl.cfg:system/lib/egl/egl.cfg \
        $(LOCAL_PATH)/prebuilts/lib/egl/eglsubAndroid.so:system/lib/egl/eglsubAndroid.so \
        $(LOCAL_PATH)/prebuilts/lib/egl/libEGL_adreno200.so:system/lib/egl/libEGL_adreno200.so \
        $(LOCAL_PATH)/prebuilts/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
        $(LOCAL_PATH)/prebuilts/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
        $(LOCAL_PATH)/prebuilts/lib/egl/libGLESv2S3D_adreno200.so:system/lib/egl/libGLESv2S3D_adreno200.so \
        $(LOCAL_PATH)/prebuilts/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
        $(LOCAL_PATH)/prebuilts/lib/libc2d2_a3xx.so:system/lib/libc2d2_a3xx.so \
        $(LOCAL_PATH)/prebuilts/lib/libc2d2_z180.so:system/lib/libc2d2_z180.so \
        $(LOCAL_PATH)/prebuilts/lib/libC2D2.so:system/lib/libC2D2.so \
        $(LOCAL_PATH)/prebuilts/lib/libgsl.so:system/lib/libgsl.so \
        $(LOCAL_PATH)/prebuilts/lib/libllvm-a3xx.so:system/lib/libllvm-a3xx.so \
        $(LOCAL_PATH)/prebuilts/lib/libOpenCL.so:system/lib/libOpenCL.so \
        $(LOCAL_PATH)/prebuilts/lib/libOpenVG.so:system/lib/libOpenVG.so \
        $(LOCAL_PATH)/prebuilts/lib/libsc-a2xx.so:system/lib/libsc-a2xx.so \
        $(LOCAL_PATH)/prebuilts/lib/libsc-a3xx.so:system/lib/libsc-a3xx.so

PRODUCT_PACKAGES += \
        copybit.msm8960 \
        gralloc.default \
        gralloc.msm8960 \
        hwcomposer.msm8960 \
        libc2dcolorconvert \
        libgenlock \
        libhwcexternal \
        libhwcservice \
        libmemalloc \
        liboverlay \
        libqdutils \
        libQcomUI \
	libtilerenderer

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilts/lib/libI420colorconvert.so:system/lib/libI420colorconvert.so

# Filesystem management tools
PRODUCT_PACKAGES += \
        make_ext4fs \
        setup_fs

#GPS
PRODUCT_PACKAGES += \
        gps.default \
        libgps.utils \
        libloc_adapter \
        libloc_eng

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilts/lib/libgps.so:system/lib/libgps.so \
        $(LOCAL_PATH)/prebuilts/lib/libloc_api_v02.so:system/lib/libloc_api_v02.so \
        $(LOCAL_PATH)/prebuilts/lib/libloc_ext.so:system/lib/libloc_ext.so

# HDMI
PRODUCT_PACKAGES += \
	hdmid

# Keyboard/Touchscreen
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilts/usr/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
        $(LOCAL_PATH)/prebuilts/usr/keylayout/Fts-touchscreen.kl:system/usr/keylayout/Fts-touchscreen.kl \
        $(LOCAL_PATH)/prebuilts/usr/keylayout/keypad_8960.kl:system/usr/keylayout/keypad_8960.kl \
        $(LOCAL_PATH)/prebuilts/usr/keylayout/msm8960-snd-card_Button_Jack.kl:system/usr/keylayout/msm8960-snd-card_Button_Jack.kl \
        $(LOCAL_PATH)/prebuilts/usr/keylayout/syna-touchscreen.kl:system/usr/keylayout/syna-touchscreen.kl \
	$(LOCAL_PATH)/prebuilts/usr/idc/Fts-touchscreen.idc:system/usr/idc/Fts-touchscreen.idc \
	$(LOCAL_PATH)/prebuilts/usr/idc/syna-touchscreen.idc:system/usr/idc/syna-touchscreen.idc

# Lights
PRODUCT_PACKAGES += \
        lights.msm8960

# Media/OMX
PRODUCT_PACKAGES += \
	libdashplayer \
        libdivxdrmdecrypt \
        libmm-omxcore \
	libOmxAacEnc \
	libOmxAmrEnc \
        libOmxCore \
	libOmxEvrcEnc \
	libOmxQcelp13Enc \
        libOmxVdec \
        libOmxVenc \
        libstagefrighthw \
	mm-aenc-omxaac-test \
	mm-aenc-omxamr-test \
	mm-aenc-omxevrc-test \
	mm-aenc-omxqcelp13-test \
        mm-vdec-omx-test \
        mm-venc-omx-test720p \
        mm-video-driver-test \
        mm-video-encdrv-test \
	qcmediaplayer

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilts/etc/media_codecs.xml:system/etc/media_codecs.xml \
        $(LOCAL_PATH)/prebuilts/etc/media_profiles.xml:system/etc/media_profiles.xml

# Misc (for now)
PRODUCT_PACKAGES += \
	applypatch \
	applypatch_static \
	badblocks \
	check_prereq \
	librs_jni \
	libwebcore \
	libxml2 \
	Torch

# nfc
PRODUCT_PACKAGES += \
	com.android.nfc_extras \
	libnfc \
	libnfc_ndef

# Power

# Qcom init scripts & softap
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilts/etc/init.qcom.bt.sh:system/etc/init.qcom.bt.sh \
        $(LOCAL_PATH)/prebuilts/etc/init.qcom.coex.sh:system/etc/init.qcom.coex.sh \
        $(LOCAL_PATH)/prebuilts/etc/init.qcom.fm.sh:system/etc/init.qcom.fm.sh \
        $(LOCAL_PATH)/prebuilts/etc/init.qcom.modem_links.sh:system/etc/init.qcom.modem_links.sh \
        $(LOCAL_PATH)/prebuilts/etc/init.qcom.post_boot.sh:system/etc/init.qcom.post_boot.sh \
        $(LOCAL_PATH)/prebuilts/etc/init.qcom.sdio.sh:system/etc/init.qcom.sdio.sh \
        $(LOCAL_PATH)/prebuilts/etc/init.qcom.wifi.sh:system/etc/init.qcom.wifi.sh

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilts/etc/qcom/softap/hostapd_default.conf:system/etc/qcom/softap/hostapd_default.conf \
        $(LOCAL_PATH)/prebuilts/lib/libQWiFiSoftApCfg.so:system/lib/libQWiFiSoftApCfg.so

# Sensors
PRODUCT_PACKAGES += \
	libsensorservice

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilts/lib/libsensor1.so:system/lib/libsensor1.so \
        $(LOCAL_PATH)/prebuilts/lib/hw/sensors.goldfish.so:system/lib/hw/sensors.goldfish.so \
        $(LOCAL_PATH)/prebuilts/lib/hw/sensors.msm8960.so:system/lib/hw/sensors.msm8960.so

# Thermald
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilts/etc/thermald.conf:system/etc/thermald.conf

# Vold
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilts/etc/vold.fstab:system/etc/vold.fstab

# Wifi
PRODUCT_PACKAGES += \
	hostapd \
	hostapd_cli \
	libwpa_client \
	wpa_cli \
	wpa_supplicant

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilts/bin/wiperiface_v02:system/bin/wiperiface \
        $(LOCAL_PATH)/prebuilts/etc/wiperconfig.xml:system/etc/wiperconfig.xml \
        $(LOCAL_PATH)/prebuilts/etc/firmware/wlan/prima/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
        $(LOCAL_PATH)/prebuilts/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
        $(LOCAL_PATH)/prebuilts/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
        $(LOCAL_PATH)/prebuilts/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
        $(LOCAL_PATH)/prebuilts/etc/wifi/p2p_supplicant.conf:system/etc/wifi/p2p_supplicant.conf \
        $(LOCAL_PATH)/prebuilts/lib/libwiperjni_v02.so:system/lib/libwiperjni.so

# USB
PRODUCT_PACKAGES += \
        com.android.future.usb.accessory

PRODUCT_PROPERTY_OVERRIDES += \
	dalvik.vm.execution-mode=int:jit \
	dalvik.vm.dexopt-flags=m=y \
        dalvik.vm.dexopt-data-only=1

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_elden
PRODUCT_DEVICE := elden

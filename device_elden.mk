$(call inherit-product, $(SRC_TARGET_DIR)/product/languages_full.mk)

# The gps config appropriate for this device
$(call inherit-product, device/common/gps/gps_us_supl.mk)

DEVICE_PACKAGE_OVERLAYS += device/zte/elden/overlay

PRODUCT_AAPT_CONFIG := normal hdpi xhdpi
PRODUCT_AAPT_PREF_CONFIG := xhdpi

PRODUCT_TAGS += dalvik.gc.type-precise

$(call inherit-product, frameworks/native/build/phone-xhdpi-1024-dalvik-heap.mk)

$(call inherit-product, build/target/product/full_base_telephony.mk)

$(call inherit-product-if-exists, vendor/zte/elden/elden-vendor.mk)

LOCAL_PATH := device/zte/elden
ifeq ($(TARGET_PREBUILT_KERNEL),)
	LOCAL_KERNEL := $(LOCAL_PATH)/kernel
else
	LOCAL_KERNEL := $(TARGET_PREBUILT_KERNEL)
endif

PRODUCT_COPY_FILES += \
    $(LOCAL_KERNEL):kernel

## Ramdisk
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/ramdisk/init.2ndstg.rc:root/init.2ndstg.rc \
        $(LOCAL_PATH)/ramdisk/init.elden.rc:root/init.elden.rc \
        $(LOCAL_PATH)/ramdisk/init.qcom.class_core.sh:root/init.qcom.class_core.sh \
        $(LOCAL_PATH)/ramdisk/init.qcom.class_main.sh:root/init.qcom.class_main.sh \
        $(LOCAL_PATH)/ramdisk/init.qcom.rc:root/init.qcom.rc \
        $(LOCAL_PATH)/ramdisk/init.qcom.sh:root/init.qcom.sh \
        $(LOCAL_PATH)/ramdisk/init.qcom.usb.rc:root/init.qcom.usb.rc \
        $(LOCAL_PATH)/ramdisk/init.qcom.usb.sh:root/init.qcom.usb.sh \
        $(LOCAL_PATH)/ramdisk/init.target.rc:root/init.target.rc \
        $(LOCAL_PATH)/ramdisk/ueventd.rc:root/ueventd.qcom.rc \
        $(LOCAL_PATH)/ramdisk/logo.bmp:root/logo.bmp \
        $(LOCAL_PATH)/ramdisk/sbin/ueventd:root/sbin/ueventd \
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

# APN
PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilts/etc/apns-conf.xml:system/etc/apns-conf.xml	

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
	$(LOCAL_PATH)/prebuilts/lib/libacdbloader.so:system/lib/libacdbloader.so \
	$(LOCAL_PATH)/prebuilts/lib/libalsautils.so:system/lib/libalsautils.so \
	$(LOCAL_PATH)/prebuilts/lib/libaudcal.so:system/lib/libaudcal.so \
	$(LOCAL_PATH)/prebuilts/lib/libaudioalsa.so:system/lib/libaudioalsa.so

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
	camera.msm8960 \
	libcameraservice \
	libcamera_client

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilts/bin/mm-qcamera-daemon:system/bin/mm-qcamera-daemon \
        $(LOCAL_PATH)/prebuilts/bin/mm-qcamera-test:system/bin/mm-qcamera-test \
        $(LOCAL_PATH)/prebuilts//bin/mm-qcamera-testsuite-client:system/bin/mm-qcamera-testsuite-client \
        $(LOCAL_PATH)/prebuilts/bin/v4l2-qcamera-app:system/bin/v4l2-qcamera-app \
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
        $(LOCAL_PATH)/prebuilts/lib/egl/libGLES_android.so:system/lib/egl/libGLES_android.so.so \
        $(LOCAL_PATH)/prebuilts/lib/egl/libGLESv1_CM_adreno200.so:system/lib/egl/libGLESv1_CM_adreno200.so \
        $(LOCAL_PATH)/prebuilts/lib/egl/libGLESv2_adreno200.so:system/lib/egl/libGLESv2_adreno200.so \
        $(LOCAL_PATH)/prebuilts/lib/egl/libGLESv2S3D_adreno200.so:system/lib/egl/libGLESv2S3D_adreno200.so \
        $(LOCAL_PATH)/prebuilts/lib/egl/libq3dtools_adreno200.so:system/lib/egl/libq3dtools_adreno200.so \
        $(LOCAL_PATH)/prebuilts/lib/libC2D2.so:system/lib/libC2D2.so \
        $(LOCAL_PATH)/prebuilts/lib/libgsl.so:system/lib/libgsl.so \
        $(LOCAL_PATH)/prebuilts/lib/libllvm-a3xx.so:system/lib/libllvm-a3xx.so \
        $(LOCAL_PATH)/prebuilts/lib/libOpenCL.so:system/lib/libOpenCL.so \
        $(LOCAL_PATH)/prebuilts/lib/libOpenVG.so:system/lib/libOpenVG.so \
        $(LOCAL_PATH)/prebuilts/lib/libsc-a2xx.so:system/lib/libsc-a2xx.so \
        $(LOCAL_PATH)/prebuilts/lib/libsc-a3xx.so:system/lib/libsc-a3xx.so \

PRODUCT_PACKAGES += \
        copybit.msm8960 \
        gralloc.msm8960 \
        hwcomposer.msm8960 \
        libc2dcolorconvert \
        libgenlock \
        libmemalloc \
        liboverlay

PRODUCT_COPY_FILES += \
	$(LOCAL_PATH)/prebuilts/lib/libI420colorconvert.so:system/lib/libI420colorconvert.so \
	$(LOCAL_PATH)/prebuilts/lib/libtilerenderer.so:system/lib/libtilerenderer.so

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
        $(LOCAL_PATH)/prebuilts/etc/gps.conf:system/etc/gps.conf \
        $(LOCAL_PATH)/prebuilts/lib/libgps.so:system/lib/libgps.so \
        $(LOCAL_PATH)/prebuilts/lib/libloc_api_v02.so:system/lib/libloc_api_v02.so \
        $(LOCAL_PATH)/prebuilts/lib/libloc_ext.so:system/lib/libloc_ext.so

# HDMI
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilts/bin/hdmid:system/bin/hdmid

# Keyboard/Touchscreen
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilts/usr/keychars/qwerty.kcm:system/usr/keychars/qwerty.kcm \
        $(LOCAL_PATH)/prebuilts/usr/keychars/qwerty2.kcm:system/usr/keychars/qwerty2.kcm \
        $(LOCAL_PATH)/prebuilts/usr/keylayout/atmel-touchscreen.kl:system/usr/keylayout/atmel-touchscreen.kl \
        $(LOCAL_PATH)/prebuilts/usr/keylayout/AVRCP.kl:system/usr/keylayout/AVRCP.kl \
        $(LOCAL_PATH)/prebuilts/usr/keylayout/Fts-touchscreen.kl:system/usr/keylayout/Fts-touchscreen.kl \
        $(LOCAL_PATH)/prebuilts/usr/keylayout/keypad_8960.kl:system/usr/keylayout/keypad_8960.kl \
        $(LOCAL_PATH)/prebuilts/usr/keylayout/msm8960-snd-card_Button_Jack.kl:system/usr/keylayout/msm8960-snd-card_Button_Jack.kl \
        $(LOCAL_PATH)/prebuilts/usr/keylayout/qwerty.kl:system/usr/keylayout/qwerty.kl \
        $(LOCAL_PATH)/prebuilts/usr/keylayout/syna-touchscreen.kl:system/usr/keylayout/syna-touchscreen.kl \
	$(LOCAL_PATH)/prebuilts/usr/idc/Fts-touchscreen.idc:system/usr/idc/Fts-touchscreen.idc

# Lights
PRODUCT_PACKAGES += \
        lights.msm8960

# Media/OMX
PRODUCT_PACKAGES += \
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
        mm-video-encdrv-test

PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilts/etc/media_codecs.xml:system/etc/media_codecs.xml \
        $(LOCAL_PATH)/prebuilts/etc/media_profiles.xml:system/etc/media_profiles.xml

# Misc (for now)
PRODUCT_PACKAGES += \
	applypatch \
	applypatch_static \
	badblocks \
	check_prereq \
	libwebcore \
	libxml2

# nfc
PRODUCT_PACKAGES += \
	libnfc \
        com.android.nfc_extras

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
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilts/lib/hw/sensors.goldfish.so:system/lib/hw/sensors.goldfish.so \
        $(LOCAL_PATH)/prebuilts/lib/hw/sensors.msm8960.so:system/lib/hw/sensors.msm8960.so

# Wifi
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilts/bin/hostapd:system/bin/hostapd \
        $(LOCAL_PATH)/prebuilts/bin/hostapd_cli:system/bin/hostapd_cli \
        $(LOCAL_PATH)/prebuilts/bin/wiperiface_v02:system/bin/wiperiface_v02 \
        $(LOCAL_PATH)/prebuilts/bin/wpa_cli:system/bin/wpa_cli \
        $(LOCAL_PATH)/prebuilts/bin/wpa_supplicant:system/bin/wpa_supplicant \
        $(LOCAL_PATH)/prebuilts/etc/init.wlanprop.sh:system/etc/init.wlanprop.sh \
        $(LOCAL_PATH)/prebuilts/etc/wiperconfig.xml:system/etc/wiperconfig.xml \
        $(LOCAL_PATH)/prebuilts/etc/firmware/wlan/prima/WCNSS_cfg.dat:system/etc/firmware/wlan/prima/WCNSS_cfg.dat \
        $(LOCAL_PATH)/prebuilts/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini:system/etc/firmware/wlan/prima/WCNSS_qcom_cfg.ini \
        $(LOCAL_PATH)/prebuilts/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin:system/etc/firmware/wlan/prima/WCNSS_qcom_wlan_nv.bin \
        $(LOCAL_PATH)/prebuilts/etc/wifi/wpa_supplicant.conf:system/etc/wifi/wpa_supplicant.conf \
        $(LOCAL_PATH)/prebuilts/etc/wifi/p2p_supplicant.conf:system/etc/wifi/p2p_supplicant.conf \
        $(LOCAL_PATH)/prebuilts/lib/libwiperjni_v02.so:system/lib/libwiperjni_v02.so \
        $(LOCAL_PATH)/prebuilts/lib/libwpa_client.so:system/lib/libwpa_client.so

## Wifi kernel module (this does not get built with kernel source)
PRODUCT_COPY_FILES += \
        $(LOCAL_PATH)/prebuilts/lib/modules/prima/prima_wlan.ko:system/lib/modules/prima/prima_wlan.ko

# USB
PRODUCT_PACKAGES += \
        com.android.future.usb.accessory

PRODUCT_PROPERTY_OVERRIDES += \
	ro.feature.ztedrm.support=1 \
        ril.subscription.types=NV \
        persist.sys.usb.menu=enable \
        persist.sys.usb.config=mtp \
        ro.config.sec_storage=1 \
	drm.service.enabled=true \
	ro.config.multimode_cdma=true \
	persist.radio.apm_sim_not_pwdn=1 \
	ro.vendor.extension_library=/system/lib/libqc-opt.so \
	persist.sys.ztelog.enable=0 \
	ro.telephony.default_network=4 \
	persist.radio.add_power_save=1 \
	ro.com.google.clientidbase.ms=android-metropcs-us \
	ro.com.google.clientidbase.yt=android-zte \
	ro.com.google.clientidbase.am=android-zte \
	ro.com.google.clientidbase.gmm=android-zte

PRODUCT_BUILD_PROP_OVERRIDES += BUILD_UTC_DATE=0
PRODUCT_NAME := full_elden
PRODUCT_DEVICE := elden

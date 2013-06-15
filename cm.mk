## Specify phone tech before including full_phone
$(call inherit-product, vendor/cm/config/cdma.mk)

# Release name
PRODUCT_RELEASE_NAME := elden

# Inherit some common CM stuff.
$(call inherit-product, vendor/cm/config/common_full_phone.mk)

# Inherit device configuration
$(call inherit-product, device/zte/elden/device_elden.mk)

## Device identifier. This must come after all inclusions
PRODUCT_DEVICE := elden
PRODUCT_NAME := cm_elden
PRODUCT_BRAND := zte
PRODUCT_MODEL := elden
PRODUCT_MANUFACTURER := zte

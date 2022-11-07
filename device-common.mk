#
# Copyright (C) 2020 The Android Open-Source Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

-include vendor/google_devices/gs201/proprietary/telephony/device-vendor.mk
include device/google/gs201/device.mk
include device/google/gs101/tts/voice_packs.mk

# Telephony
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.carrierlock.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.hardware.telephony.carrierlock.xml

# Android Verified Boot
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.software.verified_boot.xml:$(TARGET_COPY_OUT_VENDOR)/etc/permissions/android.software.verified_boot.xml

# Factory OTA
-include vendor/unbundled_google/packages/FactoryOtaPrebuilt/factoryota.mk

# Set system properties identifying the chipset
PRODUCT_VENDOR_PROPERTIES += ro.soc.manufacturer=Google
PRODUCT_VENDOR_PROPERTIES += ro.soc.model=GS201

PRODUCT_PRODUCT_PROPERTIES += \
    persist.vendor.testing_battery_profile=2

# The default value of this variable is false and should only be set to true when
# the device allows users to retain eSIM profiles after factory reset of user data.
PRODUCT_PRODUCT_PROPERTIES += \
    masterclear.allow_retain_esim_profiles_after_fdr=true

# ZramWriteback
-include hardware/google/pixel/mm/device_gki.mk

# ConnectivityThermalPowermanager
include hardware/google/pixel/connectivity_thermal_power_manager/connectivity_thermal_power_manager.mk

# EUICC
PRODUCT_PACKAGES += \
    EuiccSupportPixelOverlay
    
PRODUCT_COPY_FILES += \
    frameworks/native/data/etc/android.hardware.telephony.euicc.xml:$(TARGET_COPY_OUT_PRODUCT)/etc/permissions/android.hardware.telephony.euicc.xml
    
# Soong Namespaces
PRODUCT_SOONG_NAMESPACES += \
    packages/modules/Bluetooth/android/app
    
# Camera
PRODUCT_PRODUCT_PROPERTIES += \
    ro.vendor.camera.extensions.package=com.google.android.apps.camera.services \
    ro.vendor.camera.extensions.service=com.google.android.apps.camera.services.extensions.service.PixelExtensions
    
# Properties
TARGET_VENDOR_PROP := device/google/gs201/vendor.prop

# Properties
TARGET_SYSTEM_PROP := device/google/gs201/system.prop

# Enable updating of APEXes
$(call inherit-product, $(SRC_TARGET_DIR)/product/updatable_apex.mk)

# Camera
PRODUCT_PRODUCT_PROPERTIES += \
    ro.vendor.camera.extensions.package=com.google.android.apps.camera.services \
    ro.vendor.camera.extensions.service=com.google.android.apps.camera.services.extensions.service.PixelExtensions
    
# Manifests
DEVICE_MANIFEST_FILE += \
    device/google/gs201/android.hardware.security.rkp-service.citadel.xml \
    device/google/gs201/manifest_radio_ds.xml

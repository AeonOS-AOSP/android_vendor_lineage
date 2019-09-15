PRODUCT_VERSION_MAJOR = 16
PRODUCT_VERSION_MINOR = 0

AEON_VERSION := 1.0

CURRENT_DEVICE := $(LINEAGE_BUILD)
DEVICE_LIST := $(file < vendor/official_devices/OTA/aeon.devices)
MAINTAINER_LIST := $(file < vendor/official_devices/OTA/aeon.maintainers)

AEON_BUILDTYPE := COMMUNITY

ifneq ($(filter $(CURRENT_DEVICE),$(DEVICE_LIST)),)
    ifneq ($(AEON_MAINTAINER),)
        ifneq ($(filter $(AEON_MAINTAINER),$(MAINTAINER_LIST)),)
            AEON_BUILDTYPE := OFFICIAL
        endif
    endif
endif

# Internal version
LINEAGE_VERSION := AeonOS-$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR)-$(shell date +%Y%m%d)-$(LINEAGE_BUILD)-$(AEON_VERSION)-$(AEON_BUILDTYPE)

# Display version
LINEAGE_DISPLAY_VERSION := $(AEON_VERSION)

# AeonOS version properties
PRODUCT_SYSTEM_PROPERTIES += \
    ro.aeon.build.version=$(AEON_VERSION) \
    ro.aeon.display.version=$(LINEAGE_DISPLAY_VERSION) \
    ro.aeon.version=$(PRODUCT_VERSION_MAJOR).$(PRODUCT_VERSION_MINOR) \
    ro.aeon.releasetype=$(AEON_BUILDTYPE) \
    ro.aeon.maintainer=$(AEON_MAINTAINER)

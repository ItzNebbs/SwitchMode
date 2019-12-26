ARCHS = arm64 arm64e
FINALPACKAGE = 1

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SwitchMode
$(TWEAK_NAME)_FILES = $(wildcard *.xm)
$(TWEAK_NAME)_FRAMEWORKS = UIKit
$(TWEAK_NAME)_EXTRA_FRAMEWORKS += Cephei
$(TWEAK_NAME)_CFLAGS = -Wno-error -Wno-return-type -Wno-objc-method-access -Wno-objc-property-no-attribute

include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 backboardd"
SUBPROJECTS += switchmode
include $(THEOS_MAKE_PATH)/aggregate.mk
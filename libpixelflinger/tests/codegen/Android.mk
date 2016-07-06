LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

ifneq ($(filter x86%,$(TARGET_ARCH)),)
LOCAL_SRC_FILES:= \
    codegen.cpp
else
LOCAL_SRC_FILES:= \
    codegen.cpp.arm
endif

LOCAL_SHARED_LIBRARIES := \
	libcutils \
    libpixelflinger

LOCAL_C_INCLUDES := \
	$(LOCAL_PATH)/../..

ifneq ($(filter x86%,$(TARGET_ARCH)),)
LOCAL_STATIC_LIBRARIES := libenc
endif

LOCAL_MODULE:= test-opengl-codegen

LOCAL_CFLAGS:= -Wall -Werror

LOCAL_MODULE_TAGS := tests

include $(BUILD_NATIVE_TEST)

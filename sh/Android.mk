LOCAL_PATH:=		$(call my-dir)

include $(CLEAR_VARS)

# mksh source files
LOCAL_SRC_FILES:=	mksh/lalloc.c mksh/edit.c mksh/eval.c mksh/exec.c \
			mksh/expr.c mksh/funcs.c mksh/histrap.c mksh/jobs.c \
			mksh/lex.c mksh/main.c mksh/misc.c mksh/shf.c \
			mksh/syn.c mksh/tree.c mksh/var.c
# mksh "compat" source files
LOCAL_SRC_FILES+=	mksh/setmode.c
# add-on source files
LOCAL_SRC_FILES+=	arc4rootdom.c printf.c

# integrated tree
LOCAL_MODULE:=		sh
LOCAL_SYSTEM_SHARED_LIBRARIES:= libc
# NDK
#LOCAL_MODULE:=		mksh
#LOCAL_MODULE_TAGS:=	eng

LOCAL_C_INCLUDES:=	$(LOCAL_PATH)/mksh
# from Makefrag.inc: CFLAGS, CPPFLAGS
LOCAL_CFLAGS:=		-fno-strict-aliasing -fstack-protector-all -fwrapv \
			-Wall -Wextra \
			-DNO_STRTOD \
			-DMKSH_ASSUME_UTF8=0 -DMKSH_NOPWNAM \
			-D_GNU_SOURCE \
			-DHAVE_ATTRIBUTE_BOUNDED=0 -DHAVE_ATTRIBUTE_FORMAT=1 \
			-DHAVE_ATTRIBUTE_NONNULL=1 -DHAVE_ATTRIBUTE_NORETURN=1 \
			-DHAVE_ATTRIBUTE_UNUSED=1 -DHAVE_ATTRIBUTE_USED=1 \
			-DHAVE_SYS_PARAM_H=1 -DHAVE_SYS_MKDEV_H=0 \
			-DHAVE_SYS_MMAN_H=1 -DHAVE_SYS_SYSMACROS_H=1 \
			-DHAVE_LIBGEN_H=1 -DHAVE_LIBUTIL_H=0 -DHAVE_PATHS_H=1 \
			-DHAVE_STDBOOL_H=1 -DHAVE_STRINGS_H=1 -DHAVE_GRP_H=1 \
			-DHAVE_ULIMIT_H=0 -DHAVE_VALUES_H=0 -DHAVE_STDINT_H=1 \
			-DHAVE_RLIM_T=0 -DHAVE_SIG_T=1 -DHAVE_SYS_SIGNAME=1 \
			-DHAVE_SYS_SIGLIST=1 -DHAVE_STRSIGNAL=0 \
			-DHAVE_ARC4RANDOM=1 -DHAVE_ARC4RANDOM_PUSHB=1 \
			-DHAVE_GETRUSAGE=1 -DHAVE_KILLPG=0 -DHAVE_MKNOD=1 \
			-DHAVE_MKSTEMP=1 -DHAVE_NICE=1 -DHAVE_REVOKE=0 \
			-DHAVE_SETLOCALE_CTYPE=0 -DHAVE_LANGINFO_CODESET=0 \
			-DHAVE_SETMODE=0 -DHAVE_SETRESUGID=1 \
			-DHAVE_SETGROUPS=1 -DHAVE_STRCASESTR=1 \
			-DHAVE_STRLCPY=1 -DHAVE_ARC4RANDOM_DECL=1 \
			-DHAVE_ARC4RANDOM_PUSHB_DECL=0 -DHAVE_FLOCK_DECL=1 \
			-DHAVE_REVOKE_DECL=1 -DHAVE_SYS_SIGLIST_DECL=1 \
			-DHAVE_PERSISTENT_HISTORY=1 \
			-DMKSH_PRINTF_BUILTIN \
			-DHAVE_CONFIG_H -DCONFIG_H_FILENAME=\"sh.h\"

include $(BUILD_EXECUTABLE)

ifeq (0,1)
### build mksh-small

include $(CLEAR_VARS)

# mksh source files
LOCAL_SRC_FILES:=	mksh/lalloc.c mksh/edit.c mksh/eval.c mksh/exec.c \
			mksh/expr.c mksh/funcs.c mksh/histrap.c mksh/jobs.c \
			mksh/lex.c mksh/main.c mksh/misc.c mksh/shf.c \
			mksh/syn.c mksh/tree.c mksh/var.c

LOCAL_MODULE:=		mksh-small
LOCAL_MODULE_TAGS:=	eng
# comment this out for the NDK
LOCAL_SYSTEM_SHARED_LIBRARIES:= libc

LOCAL_C_INCLUDES:=	$(LOCAL_PATH)/mksh
# from Makefrag.inc: CFLAGS, CPPFLAGS
LOCAL_CFLAGS:=		-fno-strict-aliasing -fstack-protector-all -fwrapv \
			-Wall -Wextra \
			-DMKSH_ASSUME_UTF8=0 -DMKSH_SMALL -DMKSH_NO_LIMITS \
			-fno-inline -D_GNU_SOURCE \
			-DHAVE_ATTRIBUTE_BOUNDED=0 -DHAVE_ATTRIBUTE_FORMAT=1 \
			-DHAVE_ATTRIBUTE_NONNULL=1 -DHAVE_ATTRIBUTE_NORETURN=1 \
			-DHAVE_ATTRIBUTE_UNUSED=1 -DHAVE_ATTRIBUTE_USED=1 \
			-DHAVE_SYS_PARAM_H=1 -DHAVE_SYS_MKDEV_H=0 \
			-DHAVE_SYS_MMAN_H=1 -DHAVE_SYS_SYSMACROS_H=1 \
			-DHAVE_LIBGEN_H=1 -DHAVE_LIBUTIL_H=0 -DHAVE_PATHS_H=1 \
			-DHAVE_STDBOOL_H=1 -DHAVE_STRINGS_H=1 -DHAVE_GRP_H=1 \
			-DHAVE_ULIMIT_H=0 -DHAVE_VALUES_H=0 -DHAVE_STDINT_H=1 \
			-DHAVE_RLIM_T=0 -DHAVE_SIG_T=1 -DHAVE_SYS_SIGNAME=1 \
			-DHAVE_SYS_SIGLIST=1 -DHAVE_STRSIGNAL=0 \
			-DHAVE_ARC4RANDOM=1 -DHAVE_ARC4RANDOM_PUSHB=0 \
			-DHAVE_GETRUSAGE=1 -DHAVE_KILLPG=0 -DHAVE_MKNOD=0 \
			-DHAVE_MKSTEMP=1 -DHAVE_NICE=1 -DHAVE_REVOKE=0 \
			-DHAVE_SETLOCALE_CTYPE=0 -DHAVE_LANGINFO_CODESET=0 \
			-DHAVE_SETMODE=1 -DHAVE_SETRESUGID=1 \
			-DHAVE_SETGROUPS=1 -DHAVE_STRCASESTR=1 \
			-DHAVE_STRLCPY=1 -DHAVE_ARC4RANDOM_DECL=1 \
			-DHAVE_ARC4RANDOM_PUSHB_DECL=1 -DHAVE_FLOCK_DECL=1 \
			-DHAVE_REVOKE_DECL=1 -DHAVE_SYS_SIGLIST_DECL=1 \
			-DHAVE_PERSISTENT_HISTORY=0

include $(BUILD_EXECUTABLE)

### end mksh-small
endif

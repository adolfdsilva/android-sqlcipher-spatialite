LOCAL_PATH := $(call my-dir)
include ${CLEAR_VARS}

#-------------------------
# start icu project import
#-------------------------

ICU_COMMON_PATH := icu4c/common
ICU_COMMON_FULL_PATH := $(LOCAL_PATH)/icu4c/common

# new icu common build begin

icu_src_files := \
        $(ICU_COMMON_PATH)/cmemory.c          $(ICU_COMMON_PATH)/cstring.c          \
        $(ICU_COMMON_PATH)/cwchar.c           $(ICU_COMMON_PATH)/locmap.c           \
        $(ICU_COMMON_PATH)/punycode.c         $(ICU_COMMON_PATH)/putil.c            \
        $(ICU_COMMON_PATH)/uarrsort.c         $(ICU_COMMON_PATH)/ubidi.c            \
        $(ICU_COMMON_PATH)/ubidiln.c          $(ICU_COMMON_PATH)/ubidi_props.c      \
        $(ICU_COMMON_PATH)/ubidiwrt.c         $(ICU_COMMON_PATH)/ucase.c            \
        $(ICU_COMMON_PATH)/ucasemap.c         $(ICU_COMMON_PATH)/ucat.c             \
        $(ICU_COMMON_PATH)/uchar.c            $(ICU_COMMON_PATH)/ucln_cmn.c         \
        $(ICU_COMMON_PATH)/ucmndata.c                            \
        $(ICU_COMMON_PATH)/ucnv2022.c         $(ICU_COMMON_PATH)/ucnv_bld.c         \
        $(ICU_COMMON_PATH)/ucnvbocu.c         $(ICU_COMMON_PATH)/ucnv.c             \
        $(ICU_COMMON_PATH)/ucnv_cb.c          $(ICU_COMMON_PATH)/ucnv_cnv.c         \
        $(ICU_COMMON_PATH)/ucnvdisp.c         $(ICU_COMMON_PATH)/ucnv_err.c         \
        $(ICU_COMMON_PATH)/ucnv_ext.c         $(ICU_COMMON_PATH)/ucnvhz.c           \
        $(ICU_COMMON_PATH)/ucnv_io.c          $(ICU_COMMON_PATH)/ucnvisci.c         \
        $(ICU_COMMON_PATH)/ucnvlat1.c         $(ICU_COMMON_PATH)/ucnv_lmb.c         \
        $(ICU_COMMON_PATH)/ucnvmbcs.c         $(ICU_COMMON_PATH)/ucnvscsu.c         \
        $(ICU_COMMON_PATH)/ucnv_set.c         $(ICU_COMMON_PATH)/ucnv_u16.c         \
        $(ICU_COMMON_PATH)/ucnv_u32.c         $(ICU_COMMON_PATH)/ucnv_u7.c          \
        $(ICU_COMMON_PATH)/ucnv_u8.c                             \
        $(ICU_COMMON_PATH)/udatamem.c         \
        $(ICU_COMMON_PATH)/udataswp.c         $(ICU_COMMON_PATH)/uenum.c            \
        $(ICU_COMMON_PATH)/uhash.c            $(ICU_COMMON_PATH)/uinit.c            \
        $(ICU_COMMON_PATH)/uinvchar.c         $(ICU_COMMON_PATH)/uloc.c             \
        $(ICU_COMMON_PATH)/umapfile.c         $(ICU_COMMON_PATH)/umath.c            \
        $(ICU_COMMON_PATH)/umutex.c           $(ICU_COMMON_PATH)/unames.c           \
        $(ICU_COMMON_PATH)/unorm_it.c         $(ICU_COMMON_PATH)/uresbund.c         \
        $(ICU_COMMON_PATH)/ures_cnv.c         $(ICU_COMMON_PATH)/uresdata.c         \
        $(ICU_COMMON_PATH)/usc_impl.c         $(ICU_COMMON_PATH)/uscript.c          \
        $(ICU_COMMON_PATH)/ushape.c           $(ICU_COMMON_PATH)/ustrcase.c         \
        $(ICU_COMMON_PATH)/ustr_cnv.c         $(ICU_COMMON_PATH)/ustrfmt.c          \
        $(ICU_COMMON_PATH)/ustring.c          $(ICU_COMMON_PATH)/ustrtrns.c         \
        $(ICU_COMMON_PATH)/ustr_wcs.c         $(ICU_COMMON_PATH)/utf_impl.c         \
        $(ICU_COMMON_PATH)/utrace.c           $(ICU_COMMON_PATH)/utrie.c            \
        $(ICU_COMMON_PATH)/utypes.c           $(ICU_COMMON_PATH)/wintz.c            \
        $(ICU_COMMON_PATH)/utrie2_builder.c   $(ICU_COMMON_PATH)/icuplug.c          \
        $(ICU_COMMON_PATH)/propsvec.c         $(ICU_COMMON_PATH)/ulist.c            \
        $(ICU_COMMON_PATH)/uloc_tag.c

icu_src_files += \
  $(ICU_COMMON_PATH)/bmpset.cpp      $(ICU_COMMON_PATH)/unisetspan.cpp   \
        $(ICU_COMMON_PATH)/brkeng.cpp      $(ICU_COMMON_PATH)/brkiter.cpp      \
        $(ICU_COMMON_PATH)/caniter.cpp     $(ICU_COMMON_PATH)/chariter.cpp     \
        $(ICU_COMMON_PATH)/dictbe.cpp      $(ICU_COMMON_PATH)/locbased.cpp     \
        $(ICU_COMMON_PATH)/locid.cpp       $(ICU_COMMON_PATH)/locutil.cpp      \
        $(ICU_COMMON_PATH)/normlzr.cpp     $(ICU_COMMON_PATH)/parsepos.cpp     \
        $(ICU_COMMON_PATH)/propname.cpp    $(ICU_COMMON_PATH)/rbbi.cpp         \
        $(ICU_COMMON_PATH)/rbbidata.cpp    $(ICU_COMMON_PATH)/rbbinode.cpp     \
        $(ICU_COMMON_PATH)/rbbirb.cpp      $(ICU_COMMON_PATH)/rbbiscan.cpp     \
        $(ICU_COMMON_PATH)/rbbisetb.cpp    $(ICU_COMMON_PATH)/rbbistbl.cpp     \
        $(ICU_COMMON_PATH)/rbbitblb.cpp    $(ICU_COMMON_PATH)/resbund_cnv.cpp  \
        $(ICU_COMMON_PATH)/resbund.cpp     $(ICU_COMMON_PATH)/ruleiter.cpp     \
        $(ICU_COMMON_PATH)/schriter.cpp    $(ICU_COMMON_PATH)/serv.cpp         \
        $(ICU_COMMON_PATH)/servlk.cpp      $(ICU_COMMON_PATH)/servlkf.cpp      \
        $(ICU_COMMON_PATH)/servls.cpp      $(ICU_COMMON_PATH)/servnotf.cpp     \
        $(ICU_COMMON_PATH)/servrbf.cpp     $(ICU_COMMON_PATH)/servslkf.cpp     \
        $(ICU_COMMON_PATH)/triedict.cpp    $(ICU_COMMON_PATH)/ubrk.cpp         \
        $(ICU_COMMON_PATH)/uchriter.cpp    $(ICU_COMMON_PATH)/uhash_us.cpp     \
        $(ICU_COMMON_PATH)/uidna.cpp       $(ICU_COMMON_PATH)/uiter.cpp        \
        $(ICU_COMMON_PATH)/unifilt.cpp     $(ICU_COMMON_PATH)/unifunct.cpp     \
        $(ICU_COMMON_PATH)/uniset.cpp      $(ICU_COMMON_PATH)/uniset_props.cpp \
        $(ICU_COMMON_PATH)/unistr_case.cpp $(ICU_COMMON_PATH)/unistr_cnv.cpp   \
        $(ICU_COMMON_PATH)/unistr.cpp      $(ICU_COMMON_PATH)/unistr_props.cpp \
        $(ICU_COMMON_PATH)/unormcmp.cpp    $(ICU_COMMON_PATH)/unorm.cpp        \
        $(ICU_COMMON_PATH)/uobject.cpp     $(ICU_COMMON_PATH)/uset.cpp         \
        $(ICU_COMMON_PATH)/usetiter.cpp    $(ICU_COMMON_PATH)/uset_props.cpp   \
        $(ICU_COMMON_PATH)/usprep.cpp      $(ICU_COMMON_PATH)/ustack.cpp       \
        $(ICU_COMMON_PATH)/ustrenum.cpp    $(ICU_COMMON_PATH)/utext.cpp        \
        $(ICU_COMMON_PATH)/util.cpp        $(ICU_COMMON_PATH)/util_props.cpp   \
        $(ICU_COMMON_PATH)/uvector.cpp     $(ICU_COMMON_PATH)/uvectr32.cpp     \
        $(ICU_COMMON_PATH)/errorcode.cpp                    \
        $(ICU_COMMON_PATH)/bytestream.cpp  $(ICU_COMMON_PATH)/stringpiece.cpp  \
        $(ICU_COMMON_PATH)/mutex.cpp       $(ICU_COMMON_PATH)/dtintrv.cpp      \
        $(ICU_COMMON_PATH)/ucnvsel.cpp     $(ICU_COMMON_PATH)/uvectr64.cpp     \
        $(ICU_COMMON_PATH)/locavailable.cpp         $(ICU_COMMON_PATH)/locdispnames.cpp   \
        $(ICU_COMMON_PATH)/loclikely.cpp            $(ICU_COMMON_PATH)/locresdata.cpp     \
        $(ICU_COMMON_PATH)/normalizer2impl.cpp      $(ICU_COMMON_PATH)/normalizer2.cpp    \
        $(ICU_COMMON_PATH)/filterednormalizer2.cpp  $(ICU_COMMON_PATH)/ucol_swp.cpp       \
        $(ICU_COMMON_PATH)/uprops.cpp      $(ICU_COMMON_PATH)/utrie2.cpp \
  $(ICU_COMMON_PATH)/charstr.cpp     $(ICU_COMMON_PATH)/uts46.cpp \
  $(ICU_COMMON_PATH)/udata.cpp

# This is the empty compiled-in icu data structure
# that we need to satisfy the linker.
icu_src_files += $(ICU_COMMON_PATH)/../stubdata/stubdata.c

# new icu common build end

icu_c_includes := \
        $(ICU_COMMON_FULL_PATH) \
        $(ICU_COMMON_FULL_PATH)/../i18n

# We make the ICU data directory relative to $ANDROID_ROOT on Android, so both
# device and sim builds can use the same codepath, and it's hard to break one
# without noticing because the other still works.

icu_local_cflags += -D_REENTRANT -O3 -DU_COMMON_IMPLEMENTATION -fvisibility=hidden 
icu_local_cflags += -DHAVE_ANDROID_OS=1
icu_local_cflags += '-DICU_DATA_DIR_PREFIX_ENV_VAR="SQLCIPHER_ICU_PREFIX"'
icu_local_cflags += '-DICU_DATA_DIR="/icu"'
icu_local_cflags += -include $(LOCAL_PATH)/VisibilityIcu.h

icu_export_cflags := -DHAVE_ANDROID_OS=1 \
	-include $(LOCAL_PATH)/VisibilityIcu.h

#
# Build for the target (device).
#

include $(CLEAR_VARS)
LOCAL_SRC_FILES := $(icu_src_files)
LOCAL_C_INCLUDES := $(icu_c_includes)
LOCAL_CFLAGS := $(icu_local_cflags) -DPIC -fPIC
LOCAL_EXPORT_CFLAGS := $(icu_export_cflags)
LOCAL_EXPORT_C_INCLUDES := $(ICU_COMMON_FULL_PATH)
LOCAL_CPP_FEATURES := rtti
LOCAL_MODULE := libicuuc
include $(BUILD_STATIC_LIBRARY)

#----------
# end icuuc
#----------


#--------------
# start icui18n
#--------------
include $(CLEAR_VARS)
ICU_I18N_PATH := icu4c/i18n
ICU_I18N_FULL_PATH := $(LOCAL_PATH)/icu4c/i18n

# start new icu18n

src_files := \
        $(ICU_I18N_PATH)/bocsu.c     $(ICU_I18N_PATH)/ucln_in.c  $(ICU_I18N_PATH)/decContext.c \
        $(ICU_I18N_PATH)/ulocdata.c  $(ICU_I18N_PATH)/utmscale.c $(ICU_I18N_PATH)/decNumber.c

src_files += \
  $(ICU_I18N_PATH)/indiancal.cpp   $(ICU_I18N_PATH)/dtptngen.cpp $(ICU_I18N_PATH)/dtrule.cpp   \
  $(ICU_I18N_PATH)/persncal.cpp    $(ICU_I18N_PATH)/rbtz.cpp     $(ICU_I18N_PATH)/reldtfmt.cpp \
  $(ICU_I18N_PATH)/taiwncal.cpp    $(ICU_I18N_PATH)/tzrule.cpp   $(ICU_I18N_PATH)/tztrans.cpp  \
  $(ICU_I18N_PATH)/udatpg.cpp      $(ICU_I18N_PATH)/vtzone.cpp                \
        $(ICU_I18N_PATH)/anytrans.cpp    $(ICU_I18N_PATH)/astro.cpp    $(ICU_I18N_PATH)/buddhcal.cpp \
        $(ICU_I18N_PATH)/basictz.cpp     $(ICU_I18N_PATH)/calendar.cpp $(ICU_I18N_PATH)/casetrn.cpp  \
        $(ICU_I18N_PATH)/choicfmt.cpp    $(ICU_I18N_PATH)/coleitr.cpp  $(ICU_I18N_PATH)/coll.cpp     \
        $(ICU_I18N_PATH)/cpdtrans.cpp    $(ICU_I18N_PATH)/csdetect.cpp $(ICU_I18N_PATH)/csmatch.cpp  \
        $(ICU_I18N_PATH)/csr2022.cpp     $(ICU_I18N_PATH)/csrecog.cpp  $(ICU_I18N_PATH)/csrmbcs.cpp  \
        $(ICU_I18N_PATH)/csrsbcs.cpp     $(ICU_I18N_PATH)/csrucode.cpp $(ICU_I18N_PATH)/csrutf8.cpp  \
        $(ICU_I18N_PATH)/curramt.cpp     $(ICU_I18N_PATH)/currfmt.cpp  $(ICU_I18N_PATH)/currunit.cpp \
        $(ICU_I18N_PATH)/datefmt.cpp     $(ICU_I18N_PATH)/dcfmtsym.cpp $(ICU_I18N_PATH)/decimfmt.cpp \
        $(ICU_I18N_PATH)/digitlst.cpp    $(ICU_I18N_PATH)/dtfmtsym.cpp $(ICU_I18N_PATH)/esctrn.cpp   \
        $(ICU_I18N_PATH)/fmtable_cnv.cpp $(ICU_I18N_PATH)/fmtable.cpp  $(ICU_I18N_PATH)/format.cpp   \
        $(ICU_I18N_PATH)/funcrepl.cpp    $(ICU_I18N_PATH)/gregocal.cpp $(ICU_I18N_PATH)/gregoimp.cpp \
        $(ICU_I18N_PATH)/hebrwcal.cpp    $(ICU_I18N_PATH)/inputext.cpp $(ICU_I18N_PATH)/islamcal.cpp \
        $(ICU_I18N_PATH)/japancal.cpp    $(ICU_I18N_PATH)/measfmt.cpp  $(ICU_I18N_PATH)/measure.cpp  \
        $(ICU_I18N_PATH)/msgfmt.cpp      $(ICU_I18N_PATH)/name2uni.cpp $(ICU_I18N_PATH)/nfrs.cpp     \
        $(ICU_I18N_PATH)/nfrule.cpp      $(ICU_I18N_PATH)/nfsubs.cpp   $(ICU_I18N_PATH)/nortrans.cpp \
        $(ICU_I18N_PATH)/nultrans.cpp    $(ICU_I18N_PATH)/numfmt.cpp   $(ICU_I18N_PATH)/olsontz.cpp  \
        $(ICU_I18N_PATH)/quant.cpp       $(ICU_I18N_PATH)/rbnf.cpp     $(ICU_I18N_PATH)/rbt.cpp      \
        $(ICU_I18N_PATH)/rbt_data.cpp    $(ICU_I18N_PATH)/rbt_pars.cpp $(ICU_I18N_PATH)/rbt_rule.cpp \
        $(ICU_I18N_PATH)/rbt_set.cpp     $(ICU_I18N_PATH)/regexcmp.cpp $(ICU_I18N_PATH)/regexst.cpp  \
        $(ICU_I18N_PATH)/rematch.cpp     $(ICU_I18N_PATH)/remtrans.cpp $(ICU_I18N_PATH)/repattrn.cpp \
        $(ICU_I18N_PATH)/search.cpp      $(ICU_I18N_PATH)/simpletz.cpp $(ICU_I18N_PATH)/smpdtfmt.cpp \
        $(ICU_I18N_PATH)/sortkey.cpp     $(ICU_I18N_PATH)/strmatch.cpp $(ICU_I18N_PATH)/strrepl.cpp  \
        $(ICU_I18N_PATH)/stsearch.cpp    $(ICU_I18N_PATH)/tblcoll.cpp  $(ICU_I18N_PATH)/timezone.cpp \
        $(ICU_I18N_PATH)/titletrn.cpp    $(ICU_I18N_PATH)/tolowtrn.cpp $(ICU_I18N_PATH)/toupptrn.cpp \
        $(ICU_I18N_PATH)/translit.cpp    $(ICU_I18N_PATH)/transreg.cpp $(ICU_I18N_PATH)/tridpars.cpp \
        $(ICU_I18N_PATH)/ucal.cpp        $(ICU_I18N_PATH)/ucol_bld.cpp $(ICU_I18N_PATH)/ucol_cnt.cpp \
        $(ICU_I18N_PATH)/ucol.cpp        $(ICU_I18N_PATH)/ucoleitr.cpp $(ICU_I18N_PATH)/ucol_elm.cpp \
        $(ICU_I18N_PATH)/ucol_res.cpp    $(ICU_I18N_PATH)/ucol_sit.cpp $(ICU_I18N_PATH)/ucol_tok.cpp \
        $(ICU_I18N_PATH)/ucsdet.cpp      $(ICU_I18N_PATH)/ucurr.cpp    $(ICU_I18N_PATH)/udat.cpp     \
        $(ICU_I18N_PATH)/umsg.cpp        $(ICU_I18N_PATH)/unesctrn.cpp $(ICU_I18N_PATH)/uni2name.cpp \
        $(ICU_I18N_PATH)/unum.cpp        $(ICU_I18N_PATH)/uregexc.cpp  $(ICU_I18N_PATH)/uregex.cpp   \
        $(ICU_I18N_PATH)/usearch.cpp     $(ICU_I18N_PATH)/utrans.cpp   $(ICU_I18N_PATH)/windtfmt.cpp \
        $(ICU_I18N_PATH)/winnmfmt.cpp    $(ICU_I18N_PATH)/zonemeta.cpp $(ICU_I18N_PATH)/zstrfmt.cpp  \
        $(ICU_I18N_PATH)/numsys.cpp      $(ICU_I18N_PATH)/chnsecal.cpp \
        $(ICU_I18N_PATH)/cecal.cpp       $(ICU_I18N_PATH)/coptccal.cpp $(ICU_I18N_PATH)/ethpccal.cpp \
        $(ICU_I18N_PATH)/brktrans.cpp    $(ICU_I18N_PATH)/wintzimpl.cpp $(ICU_I18N_PATH)/plurrule.cpp \
        $(ICU_I18N_PATH)/plurfmt.cpp     $(ICU_I18N_PATH)/dtitvfmt.cpp $(ICU_I18N_PATH)/dtitvinf.cpp \
        $(ICU_I18N_PATH)/tmunit.cpp      $(ICU_I18N_PATH)/tmutamt.cpp  $(ICU_I18N_PATH)/tmutfmt.cpp  \
        $(ICU_I18N_PATH)/colldata.cpp    $(ICU_I18N_PATH)/bmsearch.cpp $(ICU_I18N_PATH)/bms.cpp      \
  $(ICU_I18N_PATH)/currpinf.cpp    $(ICU_I18N_PATH)/uspoof.cpp   $(ICU_I18N_PATH)/uspoof_impl.cpp \
  $(ICU_I18N_PATH)/uspoof_build.cpp     \
  $(ICU_I18N_PATH)/regextxt.cpp    $(ICU_I18N_PATH)/selfmt.cpp   $(ICU_I18N_PATH)/uspoof_conf.cpp \
  $(ICU_I18N_PATH)/uspoof_wsconf.cpp $(ICU_I18N_PATH)/ztrans.cpp $(ICU_I18N_PATH)/zrule.cpp  \
  $(ICU_I18N_PATH)/vzone.cpp       $(ICU_I18N_PATH)/fphdlimp.cpp $(ICU_I18N_PATH)/fpositer.cpp\
  $(ICU_I18N_PATH)/locdspnm.cpp    $(ICU_I18N_PATH)/decnumstr.cpp $(ICU_I18N_PATH)/ucol_wgt.cpp

# end new icu18n

c_includes = \
        $(ICU_I18N_FULL_PATH)

#
# Build for the target (device).
#

include $(CLEAR_VARS)

LOCAL_SRC_FILES := $(src_files)
LOCAL_C_INCLUDES := $(c_includes) abi/cpp/include
LOCAL_CFLAGS += -D_REENTRANT -DPIC -DU_I18N_IMPLEMENTATION -fPIC -fvisibility=hidden
LOCAL_CFLAGS += -O3
LOCAL_EXPORT_C_INCLUDES := $(ICU_I18N_FULL_PATH)
LOCAL_CPP_FEATURES := rtti
LOCAL_STATIC_LIBRARIES += libicuuc
LOCAL_MODULE := libicui18n

include $(BUILD_STATIC_LIBRARY)

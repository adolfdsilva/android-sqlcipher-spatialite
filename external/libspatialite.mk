include ${CLEAR_VARS}

LOCAL_SRC_FILES := \
 libspatialite/src/gaiaaux/gg_sqlaux.c \
  libspatialite/src/gaiaexif/gaia_exif.c \
  libspatialite/src/gaiageo/gg_advanced.c \
  libspatialite/src/gaiageo/gg_endian.c \
  libspatialite/src/gaiageo/gg_ewkt.c \
  libspatialite/src/gaiageo/gg_extras.c \
  libspatialite/src/gaiageo/gg_geodesic.c \
  libspatialite/src/gaiageo/gg_geoJSON.c \
  libspatialite/src/gaiageo/gg_geometries.c \
  libspatialite/src/gaiageo/gg_geoscvt.c \
  libspatialite/src/gaiageo/gg_gml.c \
  libspatialite/src/gaiageo/gg_kml.c \
  libspatialite/src/gaiageo/gg_relations.c \
  libspatialite/src/gaiageo/gg_transform.c \
  libspatialite/src/gaiageo/gg_vanuatu.c \
  libspatialite/src/gaiageo/gg_wkb.c \
  libspatialite/src/gaiageo/gg_wkt.c \
  libspatialite/src/spatialite/metatables.c \
  libspatialite/src/spatialite/mbrcache.c \
  libspatialite/src/spatialite/spatialite.c \
  libspatialite/src/spatialite/statistics.c \
  libspatialite/src/spatialite/virtualfdo.c \
  libspatialite/src/spatialite/virtualnetwork.c \
  libspatialite/src/spatialite/virtualspatialindex.c \
  libspatialite/src/srsinit/epsg_inlined_extra.c \
  libspatialite/src/srsinit/epsg_inlined_wgs84_00.c \
  libspatialite/src/srsinit/epsg_inlined_wgs84_01.c \
  libspatialite/src/srsinit/srs_init.c \
  libspatialite/src/versioninfo/version.c

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/libspatialite/src/headers \
    $(LOCAL_PATH)/libspatialite-includes

LOCAL_MODULE := libspatialite

TARGET-process-src-files-tags += $(call add-src-files-target-cflags, libspatialite/src/gaiageo/gg_transform.c, -include math.h)

LOCAL_LDLIBS := -ldl -llog

LOCAL_CFLAGS := \
  -fvisibility=hidden \
  -DOMIT_GEOCALLBACKS \
  -DOMIT_EPSG \
  -DOMIT_ICONV \
  -DVERSION="\"4.0.0\""

LOCAL_STATIC_LIBRARIES := proj4 geos libsqlcipher_android
LOCAL_SHARED_LIBRARIES += stlport_shared

include $(BUILD_SHARED_LIBRARY)


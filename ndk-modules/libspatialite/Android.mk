LOCAL_PATH := $(call my-dir)
include ${CLEAR_VARS}

LOCAL_SRC_FILES := \
  libspatialite/src/gaiaaux/gg_sqlaux.c \
  libspatialite/src/gaiaaux/gg_utf8.c \
  libspatialite/src/gaiaexif/gaia_exif.c \
  libspatialite/src/gaiageo/gg_advanced.c \
  libspatialite/src/gaiageo/gg_endian.c \
  libspatialite/src/gaiageo/gg_geodesic.c \
  libspatialite/src/gaiageo/gg_geometries.c \
  libspatialite/src/gaiageo/gg_geoscvt.c \
  libspatialite/src/gaiageo/gg_relations.c \
  libspatialite/src/gaiageo/gg_lwgeom.c \
  libspatialite/src/gaiageo/gg_extras.c \
  libspatialite/src/gaiageo/gg_shape.c \
  libspatialite/src/gaiageo/gg_transform.c \
  libspatialite/src/gaiageo/gg_wkb.c \
  libspatialite/src/gaiageo/gg_wkt.c \
  libspatialite/src/gaiageo/gg_vanuatu.c \
  libspatialite/src/gaiageo/gg_ewkt.c \
  libspatialite/src/gaiageo/gg_geoJSON.c \
  libspatialite/src/gaiageo/gg_kml.c \
  libspatialite/src/gaiageo/gg_gml.c \
  libspatialite/src/gaiageo/gg_voronoj.c \
  libspatialite/src/gaiageo/gg_xml.c \
  libspatialite/src/geopackage/gpkg_add_tile_triggers.c \
  libspatialite/src/geopackage/gpkg_add_rt_metadata_triggers.c \
  libspatialite/src/geopackage/gpkg_get_normal_row.c \
  libspatialite/src/geopackage/gpkg_get_normal_zoom.c \
  libspatialite/src/geopackage/gpkg_point_to_tile.c \
  libspatialite/src/geopackage/gpkgGetImageType.c \
  libspatialite/src/geopackage/gpkgCreateBaseTables.c \
  libspatialite/src/geopackage/gpkgCreateTilesTable.c \
  libspatialite/src/geopackage/gpkgCreateTilesZoomLevel.c \
  libspatialite/src/spatialite/mbrcache.c \
  libspatialite/src/spatialite/spatialite.c \
  libspatialite/src/spatialite/spatialite_init.c \
  libspatialite/src/spatialite/metatables.c \
  libspatialite/src/spatialite/statistics.c \
  libspatialite/src/spatialite/extra_tables.c \
  libspatialite/src/spatialite/virtualdbf.c \
  libspatialite/src/spatialite/virtualXL.c \
  libspatialite/src/spatialite/virtualfdo.c \
  libspatialite/src/spatialite/virtualnetwork.c \
  libspatialite/src/spatialite/virtualspatialindex.c \
  libspatialite/src/spatialite/virtualshape.c \
  libspatialite/src/spatialite/virtualxpath.c \
  libspatialite/src/shapefiles/shapefiles.c \
  libspatialite/src/shapefiles/validator.c \
  libspatialite/src/virtualtext/virtualtext.c \
  libspatialite/src/wfs/wfs_in.c \
  libspatialite/src/dxf/dxf_parser.c \
  libspatialite/src/dxf/dxf_loader.c \
  libspatialite/src/dxf/dxf_load_distinct.c \
  libspatialite/src/dxf/dxf_load_mixed.c \
  libspatialite/src/dxf/dxf_writer.c \
  libspatialite/src/md5/md5.c \
  libspatialite/src/md5/gaia_md5.c \
  libspatialite/src/srsinit/epsg_inlined_extra.c \
  libspatialite/src/srsinit/epsg_inlined_wgs84_00.c \
  libspatialite/src/srsinit/epsg_inlined_wgs84_01.c \
  libspatialite/src/srsinit/srs_init.c \
  libspatialite/src/versioninfo/version.c

LOCAL_C_INCLUDES := \
    $(LOCAL_PATH)/libspatialite/src/headers \
    $(LOCAL_PATH)/config

LOCAL_MODULE := libspatialite

LOCAL_CFLAGS := \
  -fvisibility=hidden \
  -DOMIT_GEOCALLBACKS \
  -DOMIT_EPSG \
  -DOMIT_ICONV \
  -DVERSION="\"4.1.1\""

LOCAL_STATIC_LIBRARIES := proj4 geos

LOCAL_EXPORT_C_INCLUDES := $(LOCAL_PATH)/libspatialite/src/headers
LOCAL_EXPORT_LDLIBS := -llog -lz

include $(BUILD_STATIC_LIBRARY)

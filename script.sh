#!/bin/bash +x

for FILE in /data/input/*.geojson; do
  echo Processing ${FILE}
  TARGET_FILE=/data/output/$(basename ${FILE})
  ogr2ogr input.shp ${FILE}
  ogr2ogr -f "GeoJSON" ${TARGET_FILE} input.shp \
      -dialect sqlite \
      -sql "SELECT ST_union(geometry) as geometry, DN FROM input GROUP BY DN" \
      -lco RFC7946=YES -lco WRITE_NAME=NO
done

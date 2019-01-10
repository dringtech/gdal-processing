#!/bin/bash +x

for FILE in /data/input/*.geojson; do
  TARGET_FILE=/data/output/$(basename ${FILE})
  ogr2ogr input.shp ${FILE}
  ogr2ogr -f "GeoJSON" ${TARGET_FILE} input.shp \
      -dialect sqlite \
      -sql "SELECT ST_union(geometry), DN as geometry FROM input GROUP BY DN"
done

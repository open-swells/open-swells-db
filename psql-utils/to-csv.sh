#!/bin/bash

export PGPASSWORD="psql_pw"

# Export point data from PostgreSQL
psql -U evan -d wave_forecast -c "\COPY (
    SELECT ST_X(geom) AS lon, ST_Y(geom) AS lat, wave_height
    FROM wave_forecast
    WHERE datetime BETWEEN '2024-12-19T00:00:00' AND '2024-12-20T00:00:00'
) TO '/tmp/output.csv' WITH CSV HEADER;"

# Interpolate to raster
gdal_grid -zfield wave_height -a invdist:power=2.0:smoothing=1.0 \
    -txe -180 180 -tye -90 90 -outsize 360 180 -of GTiff \
    /tmp/output.csv /tmp/interpolated.tif

# Generate contours
gdal_contour -a contour -i 5 -f GeoJSON /tmp/interpolated.tif /var/www/html/contours.geojson


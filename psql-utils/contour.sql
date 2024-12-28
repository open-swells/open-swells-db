SELECT
    ST_AsGeoJSON((ST_Dump(ST_Contour(raster, 5))).geom) AS geom,
    (ST_Dump(ST_Contour(raster, 5))).val AS contour_value
FROM amplitude_raster;


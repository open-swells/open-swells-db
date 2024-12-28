SELECT
    jsonb_build_object(
        'type', 'Feature',
        'geometry', ST_AsGeoJSON((ST_Dump(ST_Contour(raster, 5))).geom)::jsonb,
        'properties', jsonb_build_object(
            'contour_value', (ST_Dump(ST_Contour(raster, 5))).val
        )
    ) AS feature
FROM amplitude_raster;


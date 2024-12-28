/* creates global raster grid (360x180) and fills grid with wave_height */ 
CREATE TABLE amplitude_raster AS
SELECT
    ST_Union(
        ST_SetValue(
            ST_MakeEmptyRaster(
                360, 180, -180, 90, 1.0, -1.0, 0, 0, 4326
            ),
            ST_PixelAsPoints(ST_SetSRID(geom, 4326)),
            wave_height
        )
    ) AS raster
FROM wave_forecast;
 

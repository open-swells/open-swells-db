-- Load the SpatiaLite extension (if running manually)
.load mod_spatialite

-- Initialize SpatiaLite metadata
SELECT InitSpatialMetadata(1);

-- Create the wave_forecast table
CREATE TABLE wave_forecast (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    datetime TEXT NOT NULL,
    wave_height REAL NOT NULL,
    wave_period REAL NOT NULL,
    wave_direction REAL NOT NULL
);

-- Add spatial columns for latitude and longitude
SELECT AddGeometryColumn('wave_forecast', 'geom', 4326, 'POINT', 'XY');

-- Create a spatial index
SELECT CreateSpatialIndex('wave_forecast', 'geom');


CREATE USER evan WITH PASSWORD 'psql_pw';
CREATE DATABASE wave_forecast OWNER evan;
\c wave_forecast
CREATE EXTENSION postgis;

CREATE TABLE wave_forecast (
    id SERIAL PRIMARY KEY,
    datetime TIMESTAMP NOT NULL,
    wave_height REAL NOT NULL,
    wave_period REAL NOT NULL,
    wave_direction REAL NOT NULL,
    geom GEOMETRY(Point, 4326) -- Geometry column for spatial data
);

-- Create a spatial index
CREATE INDEX wave_forecast_geom_idx ON wave_forecast USING GIST (geom);



## arch linux

#### sqlite3

To rebuild db: 
```bash
sqlite3 main.db < schema.sql
```

In db to select: 
```sql
SELECT load_extension('mod_spatialite');
SELECT InitSpatialMetadata(1);
SELECT id, datetime, wave_height, wave_period, wave_direction, AsText(geom) AS geom_text FROM wave_forecast;
```

#### postgres

To access postgres db command line
```
sudo -u postgres psql
```

switch to db: 
```
CREATE EXTENSION postgis;
```

to enable postgresql for the first time, initialize db cluster: 
```
sudo -iu postgres initdb --local en_US.UTF-8 -D /var/lib/postgres/data
```

some commands to try: 
```
\c wave_forecast (change to wave forecast db)
\l
\dt
\d wave_forecast
select id, wave_height, ST_AsText(geom) AS geometry_text FROM wave_forecast LIMIT 5;
```

## void linux 

#### postgres
init: sudo -u postgres initdb -D /var/lib/postgresql/data
start: sudo -u postgres /usr/lib/psql16/bin/pg_ctl -D /var/lib/postgresql/data start
stop: ^ 
access: sudo -u postgres psql
create db schema: sudo -u postgres psql -f setup_wave_forecast.sql

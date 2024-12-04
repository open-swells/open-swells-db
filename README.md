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
select id, ST_AsText(geom) AS geometry_text FROM wave_forecast LIMIT 5;
```
    

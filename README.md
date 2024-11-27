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



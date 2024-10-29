-- user table
CREATE TABLE IF NOT EXISTS users (
    uid TEXT PRIMARY KEY
);

-- (many-to-many user ids to buoy ids)
CREATE TABLE IF NOT EXISTS user_buoys (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    uid TEXT NOT NULL,
    buoy_id TEXT NOT NULL,
    FOREIGN KEY (uid) REFERENCES users (uid) ON DELETE CASCADE
);


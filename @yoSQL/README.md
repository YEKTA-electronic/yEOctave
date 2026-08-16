# yeSQL - SQLite Helper for Octave
**By: Yekta Electronics Co.**

## Requirements
- sqlite package: `pkg install -forge sqlite`

## Quick Start
```matlab
db = yeSQL('mydata.db');
db.createTable('sensors', struct('id','INTEGER PRIMARY KEY','name','TEXT','value','REAL'));
db.insert('sensors', struct('name','temp','value',23.5));
result = db.select('sensors');
db.close();
```

## API Reference

| Method | Description |
|--------|-------------|
| `yeSQL(dbPath)` | Open/create database (use `:memory:` for in-memory) |
| `createTable(name, schema)` | Create table from struct schema |
| `dropTable(name)` | Delete table |
| `insert(name, data)` | Insert struct or struct array |
| `select(name, cols, where, order)` | Query rows, returns struct array |
| `update(name, data, where)` | Update matching rows |
| `deleteRows(name, where)` | Delete matching rows |
| `exec(sql)` | Execute non-query SQL |
| `query(sql)` | Execute SELECT, returns struct array |
| `rowCount(name, where)` | Count rows |
| `executeRaw(sql)` | Raw SQL, returns raw result |
| `close()` | Close connection |

## Example

```matlab
db = yeSQL('sensors.db');

% Create
db.createTable('readings', struct(...
    'id', 'INTEGER PRIMARY KEY', ...
    'sensor', 'TEXT', ...
    'temp', 'REAL', ...
    'ts', 'TEXT DEFAULT CURRENT_TIMESTAMP'));

% Insert
db.insert('readings', struct('sensor','A1','temp',22.3));
db.insert('readings', struct('sensor','B2','temp',19.8));

% Query
hot = db.select('readings', {'sensor','temp'}, 'temp > 20', 'temp DESC');

% Update
db.update('readings', struct('temp',23.0), 'sensor = ''A1''');

% Delete
db.deleteRows('readings', 'temp < 0');

db.close();
```

## License

Yekta Electronics Co.

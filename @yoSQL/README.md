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

## Example

```matlab

```

## License

Yekta Electronics Co.

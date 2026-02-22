# IMPORTING AND EXPORTING DATA
## Using COPY to Import DATA
```sql
COPY table_name
FROM 'C:\YourDirectory\your_file.csv'
WITH (FORMAT CSV, HEADER);
```
### Input and Output file format

- `FORMAT format_name`: specify type of file (CSV/TEXT/BINARY)
- `HEADER`: header row
- `DELMINITER 'character'`: mark limited character

### Understanding Census Columns and Data Types
> [!NOTE]
> Be careful with data Type

## Importing a Subset of Columns with COPY




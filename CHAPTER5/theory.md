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

```sql
COPY supervisor_salaries
FROM '/mnt/datassd/CodeHub/SQL/CHAPTER5/supervisor_salaries.csv'
WITH (FORMAT CSV,HEADER);
```
> [!BUG]
> ERROR:  invalid input syntax for type integer: "Anytown"
> CONTEXT:  COPY supervisor_salaries, line 2, column id: "Anytown" 
>
> SQL state: 22P02

> [!NOTE]
> B/c is the auto-incrementing `id` but my own csv file begins with the text column `town`

> [!FIX]
> ```sql
> COPY supervisor_salaries (town,supervisor,salary)
> FROM '/mnt/datassd/CodeHub/SQL/CHAPTER5/supervisor_salaries.csv'
> WITH (FORMAT CSV,HEADER);
> ```


> [!TIP]
> `(town,supervisor,salary)` -> specifying which columns inserted




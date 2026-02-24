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
> CONTEXT:  COPY supervisorsalaries, line 2, column id: "Anytown" 
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

*ADD CONDITION*

```sql
COPY supervisor_salaries (town, supervisor, salary)
FROM '/mnt/datassd/CodeHub/SQL/CHAPTER5/supervisor_salaries.csv'
WITH (FORMAT CSV, HEADER)
WHERE town = 'Bigville';
```

## Adding a Value to a Column During Import

- Create the ***TEMPORARY TABLE***
```sql
CREATE TEMPORARY TABLE supervisor_salaries_temp
	(LIKE supervisor_salaries INCLUDING ALL);
```
> [!TIP]
> Create Temporary table until end your database session
> Just copy ATTRIBUTRE

- Import DATA
```sql
COPY supervisor_salaries_temp (town,supervisor,salary)
FROM '/mnt/datassd/CodeHub/SQL/CHAPTER5/supervisor_salaries.csv'
WITH (FORMAT CSV, HEADER);
```
- Fill the second column with 'Mills'
```sql
INSERT INTO supervisor_salaries (town, county, supervisor, salary)
SELECT town, 'Mills', supervisor,salary
FROM supervisor_salaries_temp;
```
| id | town | county | supervisor | salary |
|:---:|:---:|:---:|:---:|:---:|
|1|"Anytown"| |"Jones"|67000.00|	
|2|"Bumblyburg"| |"Larry"|74999.00|	
|3|"Moetown"| |"Smith"|52100.00|
|4|"Bigville"| |"Kao"|81500.00|
|5|"New Brillig"| |"Carroll"|102690.00|	
|6|"Anytown"| "Mills" |"Jones"|67000.00|	
|7|"Bumblyburg"| "Mills" |"Larry"|74999.00|	
|8|"Moetown"| "Mills" |"Smith" |52100.00|
|9|"Bigville"| "Mills" |"Kao"|81500.00|
|10|"New Brillig"| "Mills" |"Carroll"|102690.00|	


## Exporting All Data
```sql
COPY us_counties_pop_est_2019
TO '/mnt/datassd/CodeHub/SQL/CHAPTER5/us_counties_export.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');
```

```txt
state_fips|county_fips|region|state_name|county_name|
01|001|3|Alabama|Autauga County
```
- Choices of Columns
```sql
COPY us_counties_pop_est_2019
(county_name, internal_point_lat, internal_point_lon)
TO 'C:\YourDirectory\us_counties_latlon_export.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');
```



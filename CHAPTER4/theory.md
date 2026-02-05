# ***Data Types***


## Characters

| Char(n)  | Varchar(n) | text |
| :--------------: | :---------------: | :---------------: |
| another is space | another is nothing | unlimied length |
| maximum with n number | maximum with n number | longest is gigabytes |

```sql
-- export data to file text
copy char_data_types to 'D:\begin\SQL\CHAPTER4/typetest.txt'
with (FORMAT CSV, header, delimiter '|')
```
> [!CAUTION]
> You can see in the text file has more white-spaces with datatypes of ***var***

## Nummbers
- Have two Types
- Integer
- Fixed-point and floating point
### Integers
#### Standard
| datatypes | Storage data |
| :---------------: | :---------------: | 
| smallint | 2 bytes |
| Integer | 4 bytes |
| bigint | 8 bytes |
#### Auto-Incrementing Integers

| Data Types | Storage |
| :--------------: | :---------------: |
| smallserial | 2 bytes |
| serial | 4 bytes |
| bigserial | 8 bytes |
```sql
create table people(
	id serial,
	perona_name varchar(100)
);
```
> [!TIP]
> ***Auto-Incrementing*** 
> ```sql
> -- Auto incrementinng with IDENTITY
> -- Set whole system 
> generated always as IDENTITY;
> -- for each table
> create table human(
> 	id integer generated always as IDENTITY,
> 	persona_name varchar(20)
> )
> ```

### Decimal Nummbers
#### Fixed-point number
| numeric(Precision,scale) | decimal(Precision,scale) |
| -------------- | --------------- |
| Precision: maximum digits left and right of number | Precision: maximum digits in right number |
| scale: number of digits after point | Scale number of digits after point(default is zero) |

#### Floating-  and Fixed-poinnt Types 
| Data Types | Storage size | Storage type |
| :---------------: | :---------------: | :---------------: |
| real | 4 bytes | Floating-point |
| numeric,decimal | variable | Fixed-point |
| double Percision | 8 bytes | Floating-point |


## Datetime and Datetime 

|Data type| Storage size| Description| Range|
|:---:|:---:|:---:|:---:|
|timestamp| 8 bytes |Date and time| 4713 BC to 294276 AD|
|date| 4 bytes |Date (no time) |4713 BC to 5874897 AD|
|time| 8 bytes |Time (no date) |00:00:00 to 24:00:00|
|interval| 16 bytes |Time interval |+/− 178,000,000 years|


```sql
create table date_time_types(
	timestmao_column timestamp with time zone,
	interval_column interval
);
```
> [!NOTE]
> ***time zone***: specifying the organization 

```sql
insert into date_time_types
values
	('2022-12-31 01:00 EST', '2 days'),
	('2022-12-31 01:00 -8','1 month'),
	('2022-12-31 01:00 Australia/Melbourne','1 century'),
	(now(),'1 week');
```

> [OUTPUT]

|timestmap_column| interval_column|
|:---: |:---: |
|"2022-12-31 13:00:00+07"	|"2 days"|
|"2022-12-31 16:00:00+07"	|"1 mon"|
|"2022-12-30 21:00:00+07"	|"100 years"|
|"2026-02-05 19:35:52.212069+07"|"7 days"|

## Using Miscellaneous Types 
- Boolean
- Geometric Types
- Text search Types
- Network address Types
- universally unique identifier
- Range
- binary
- XML

## Transforming Values from One Type to Another with CAST
```sql
select timestmao_column , cast(timestmao_column as varchar(10))
from date_time_types;
select numeric_column,
	cast(numeric_column as integer),
	cast(numeric_column as text)
from number_data_types;
```
> [!BUG]
> the float out of bound of the integer



```sql
select cast(char_columns as integer) from char_data_types
```
> [!BUG]
> invalid input syntax for type integer

> [!NOTE]
> letter cannot be converted to integer

> [!TIP]
> ***NOTATION***
> ```sql 
> select timestmao_column :: varchar(10)
> from date_time_types;
> ```






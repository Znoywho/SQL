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
| numeric(Percision,scale) | decimal(Percision,scale) |
| -------------- | --------------- |
| Percision: maximum digits left and right of number | Percision: maximum digits in right number |
| scale: number of digits after point | Scale number of digits after point(default is zero) |

#### Floating-  and Fixed-poinnt Types 
| Data Types | Storage size | Storage type |
| :---------------: | :---------------: | :---------------: |
| real | 4 bytes | Floating-point |
| numeric,decimal | variable | Fixed-point |
| double Percision | 8 bytes | Floating-point |


















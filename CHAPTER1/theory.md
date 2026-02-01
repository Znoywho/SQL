```sql
CREATE TABLE TEACHER (
	ID bigserial,
	first_name varchar(25),
	last_name varchar(50),
	school varchar(50),
	hire_date date,
	salary numeric
);
```
|Operator|Function|
|:---------------:|:---------------:|
|=|Equal to|
|<> or !=|Not Equal to|
|>|Greater than|
|<|Less than|
|>=|Greater than or equal to|
|<=|Less than or equalt to|
|BETWEEN|Within a range|
|IN|Match one of a set of values|
|LIKE|Match a pattern(Case sensitive add ***%*** signal in the last line)|
|ILKIKE|Match a pattern(Case insensitive ***%***  signal in the last line)|
|NOT|Negates a condition|

> [!NOTE]
> ***LIKE and ILIKE***
> ***Percent sign %*** A wildcard matching one or more characters
> ***Underscore (_)*** A wildcard matching just one character

```sql
LIKE 'b%'
LIKE '%ak%'
LIKE '_baker'
LIKE 'ba_er'
```





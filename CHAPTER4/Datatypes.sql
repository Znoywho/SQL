create table eagle_watch(
	observation_date date,
	eagles_seen integer,
	notes text
);

-- 3 catogories
-- characterq
-- Numbers
-- Dates & Times

create table char_data_types(
	char_columns char(10),
	varchar_column varchar(10),
	text_column text
);

insert into char_data_types
values 
	('hao','hao','hao'),
	('depzai','depzai','depzai');
-- export data to file text
copy char_data_types to 'D:\begin\SQL\CHAPTER4/typetest.txt'
with (FORMAT CSV, header, delimiter '|')

create table people(
	id serial,
	perona_name varchar(100)
);

-- Auto incrementinng with IDENTITY
-- Set whole system 
generated always as IDENTITY;
-- for each table
create table human(
	id integer generated always as IDENTITY,
	persona_name varchar(20)
)


create table number_data_types(
	numeric_column numeric(20,5),
	real_column real,
	double_column double precision
);
INSERT INTO number_data_types
VALUES
(.7, .7, .7),
(2.13579, 2.13579, 2.13579),
(2.1357987654, 2.1357987654, 2.1357987654);

select * from  number_data_types;














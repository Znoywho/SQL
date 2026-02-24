create table us_counties_pop_est_2019 (
	state_fips text,
	county_fips text,
	region smallint,
	state_name text,
	county_name text,
	area_land bigint,
	area_water bigint,
	internal_point_lat numeric(10,7),
	internal_point_lon numeric(10,7),
	pop_est_2018 integer,
	pop_est_2019 integer,
	births_2018 integer,
	deaths_2019 integer,
	international_migr_2019 integer,
	domestic_migr_2019 integer,
	residual_2019 integer,
	CONSTRAINT counties_2019_key PRIMARY KEY (state_fips,county_fips)
);

drop table us_counties_pop_est_2019;

COPY us_counties_pop_est_2019
FROM '/mnt/datassd/CodeHub/SQL/CHAPTER5/us_counties_pop_est_2019.csv'
WITH (FORMAT CSV, HEADER);

select * from us_counties_pop_est_2019;

select county_name, state_name, area_land
from us_counties_pop_est_2019
order by area_land DESC
limit 3;

select county_name, state_name, internal_point_lat, internal_point_lon
from us_counties_pop_est_2019
order by internal_point_lon
limit 5;

create table supervisor_salaries (
	id integer GENERATED ALWAYS AS IDENTITY PRIMARY KEY,
	town text,
	county text,
	supervisor text,
	start_date date,
	salary numeric(10,2),
	benefits numeric(10,2)
);

COPY supervisor_salaries
FROM '/mnt/datassd/CodeHub/SQL/CHAPTER5/supervisor_salaries.csv'
WITH (FORMAT CSV,HEADER);

-- FIXED 
COPY supervisor_salaries (town,supervisor,salary) -- specifying columns 
FROM '/mnt/datassd/CodeHub/SQL/CHAPTER5/supervisor_salaries.csv'
WITH (FORMAT CSV,HEADER);

select * from supervisor_salaries;

DELETE FROM supervisor_salaries;

DROP TABLE supervisor_salaries;



COPY supervisor_salaries (town, supervisor, salary)
FROM '/mnt/datassd/CodeHub/SQL/CHAPTER5/supervisor_salaries.csv'
WITH (FORMAT CSV, HEADER)
WHERE town = 'Bigville';

CREATE TEMPORARY TABLE supervisor_salaries_temp
	(LIKE supervisor_salaries INCLUDING ALL);
-- Create Temporary table until end your database session
-- Just copy ATTRIBUTRE

SELECT * FROM supervisor_salaries_temp;


COPY supervisor_salaries_temp (town,supervisor,salary)
FROM '/mnt/datassd/CodeHub/SQL/CHAPTER5/supervisor_salaries.csv'
WITH (FORMAT CSV, HEADER);
-- IMPORT DATA

SELECT * FROM supervisor_salaries_temp;

DROP TABLE supervisor_salaries_temp;

INSERT INTO supervisor_salaries (town, county, supervisor, salary)
SELECT town, 'Mills', supervisor,salary
FROM supervisor_salaries_temp;
-- Insert the second column county is Mills

COPY us_counties_pop_est_2019
TO '/mnt/datassd/CodeHub/SQL/CHAPTER5/us_counties_export.txt'
WITH (FORMAT CSV, HEADER, DELIMITER '|');













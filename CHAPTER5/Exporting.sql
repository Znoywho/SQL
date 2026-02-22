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

im



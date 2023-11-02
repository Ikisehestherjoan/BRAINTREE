/*
5. Find the sum of gpd_per_capita by year and the count of countries for each year that have non-null gdp_per_capita where 
(i) the year is before 2012 and (ii) the country has a null gdp_per_capita in 2012. Your result should have the columns:

year
country_count
total
*/
-- Year before 2012
SELECT CONCAT(ROUND(SUM(gdp_per_capita),0),'%') TOTAL ,COUNT(country_name) COUNTRY_COUNT ,year YEAR FROM gdb
WHERE gdp_per_capita is not null and year < 2012
GROUP BY year
;
/*
TOTAL COUNTRY_COUNT YEAR 
2122157%	197	2004
2302027%	197	2005
2506862%	196	2006
2871278%	196	2007
3091797%	194	2008
*/

-- the country has a null gdp_per_capita in 2012
SELECT CONCAT(ROUND(SUM(gdp_per_capita),2),'%') TOTAL ,COUNT(country_name) COUNTRY_COUNT,year YEAR FROM gdb
WHERE gdp_per_capita =''  and year = 2012
GROUP BY year;
/*
NO values

*/

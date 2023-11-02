/*
4a. What is the count of countries and sum of their related gdp_per_capita values for the year 2007 where the string 'an' (case insensitive) appears anywhere in the country name?
4b. Repeat question 4a, but this time make the query case sensitive.
*/
-- Case sensitive
SELECT COUNT(country_name) AS country_count, concat(ROUND(SUM((gdp_per_capita)),0),'%') AS TOTAL FROM gdb
WHERE year = 2007 AND country_name LIKE '%an%'; 

/*
country_count TOTAL
58	888340%
*/

-- Case Insensitive
SELECT COUNT(country_name) AS country_count, concat(ROUND(SUM((gdp_per_capita)),0),'%') AS TOTAL FROM gdb
WHERE year = 2007 AND country_name LIKE BINARY '%an%'; 
/*
country_count TOTAL
56	845004%
*/
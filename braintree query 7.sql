/*
7. Find the country with the highest average gdp_per_capita for each continent for all years.
 Now compare your list to the following data set. Please describe any and all mistakes that you can find with the data set below. 
Include any code that you use to help detect these mistakes.
*/
SELECT * FROM (
SELECT 
      DISTINCT continent_name, country_name,
       gdp_per_capita, 
       DENSE_RANK() OVER(PARTITION BY continent_name ORDER BY gdp_per_capita) Ranks
FROM gdb
ORDER BY continent_name,Ranks ) ranked_table
WHERE Ranks = 1
;
/*
continent_name country_name gdp_per_capital Ranks
Africa	Burundi	121.8593036	1
Asia	Afghanistan	220.0562878	1
Europe	Moldova	720.9409321	1
North America	Haiti	400.9321739	1
Oceania	Papua New Guinea	660.1899982	1
South America	Bolivia	954.9220895	1
*/


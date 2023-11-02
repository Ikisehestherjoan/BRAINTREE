/* 6. All in a single query, execute all of the steps below and provide the results as your final answer:
a. create a single list of all per_capita records for year 2009 that includes columns:
continent_name
country_code
country_name
gdp_per_capita
b. order this list by:
continent_name ascending
characters 2 through 4 (inclusive) of the country_name descending
c. create a running total of gdp_per_capita by continent_name
d. return only the first record from the ordered list for which each continent's running total of gdp_per_capita meets or exceeds $70,000.00 with the following columns:

continent_name
country_code
country_name
gdp_per_capita
running_total*/

SELECT continent_name,
country_code,
country_name,
CONCAT(ROUND(gdp_per_capita,0),'%') gdp_per_capital  FROM gdb
WHERE gdp_per_capita >= 70000  
ORDER BY continent_name ASC,substring(country_name,2,3) DESC
;
/*
 continent_name,country_code, country_name,gdp_per_capital
 Asia	QAT	Qatar	84813%
Asia	QAT	Qatar	90805%
Asia	QAT	Qatar	93825%
Asia	QAT	Qatar	72773%
Asia	MAC	Macao SAR, China	78275%
Europe	CHE	Switzerland	70370%
Europe	CHE	Switzerland	83087%
Europe	CHE	Switzerland	78928%
Europe	LUX	Luxembourg	90016%
Europe	LUX	Luxembourg	99282%
Europe	LUX	Luxembourg	74389%
Europe	LUX	Luxembourg	80925%
Europe	LUX	Luxembourg	103858%
Europe	LUX	Luxembourg	111913%
Europe	LUX	Luxembourg	112029%
Europe	LUX	Luxembourg	106920%
Europe	LUX	Luxembourg	102679%
Europe	NOR	Norway	86156%
Europe	NOR	Norway	99173%
Europe	NOR	Norway	99636%
Europe	NOR	Norway	72960%
Europe	NOR	Norway	83556%
Europe	NOR	Norway	95190%
Europe	NOR	Norway	78457%
Europe	MCO	Monaco	123264%
Europe	MCO	Monaco	153042%
Europe	MCO	Monaco	170633%
Europe	MCO	Monaco	145230%
Europe	MCO	Monaco	135689%
-----------------------------
------------------------------
*/

/*
2. List the countries ranked 10-12 in each continent by the percent of year-over-year growth descending from 2011 to 2012.
The percent of growth should be calculated as: ((2012 gdp - 2011 gdp) / 2011 gdp)
The list should include the columns:
rank,continent_name,country_code,country_name,growth_percent
*/

CREATE Table gdb(
SELECT map.continent_code,map.country_code,cont.continent_name,co.country_name,per.year,per.gdp_per_capita
FROM continent_map map
JOIN countries co ON map.country_code =co.country_code
JOIN continents cont ON map.continent_code = cont.continent_code
JOIN per_capita per ON co.country_code = per.country_code
WHERE map.continent_code = cont.continent_code OR map.continent_code <> cont.continent_code );

CREATE TABLE GDP_Growth_Rank (
SELECT 
    t1.continent_name,
    t1.country_code,
    t1.country_name,
    CONCAT(ROUND(((t2.gdp_2012 - t1.gdp_2011) / t1.gdp_2011) * 100,2),'%') AS growth_percent
           
           ,RANK() OVER (PARTITION BY t1.continent_name order by ((t2.gdp_2012 - t1.gdp_2011) / t1.gdp_2011) desc)  as drank
FROM
    (SELECT 
        continent_name,
            country_code,
            country_name,
            gdp_per_capita AS 'gdp_2011'
    FROM
       gdb
    WHERE
        year = 2011) t1
        INNER JOIN
    (SELECT DISTINCT
        country_code, gdp_per_capita AS 'gdp_2012'
    FROM
        gdb
    WHERE
        year = 2012) t2 ON t1.country_code = t2.country_code);
        
SELECT country_name,drank,continent_name FROM gdp_growth_rank
WHERE drank BETWEEN 10 AND 12
ORDER BY continent_name;
/*
country_name,drank,continent_name
Rwanda	10	Africa
Guinea	11	Africa
Nigeria	12	Africa
Uzbekistan	10	Asia
Iraq	11	Asia
Philippines	12	Asia
Montenegro	10	Europe
Sweden	11	Europe
Iceland	12	Europe
Guatemala	10	North America
Honduras	11	North America
Antigua and Barbuda	12	North America
Fiji	10	Oceania
Tuvalu	11	Oceania
Kiribati	12	Oceania
Argentina	10	South America
Paraguay	11	South America
Brazil	12	South America
*/
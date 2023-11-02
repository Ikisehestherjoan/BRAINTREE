/* 3. For the year 2012, create a 3 column, 1 row report showing the percent share of gdp_per_capita for the following regions:
(i) Asia, (ii) Europe, (iii) the Rest of the World. 
Your result should look something like
Asia	Europe	Rest of World
28.3%	42.2%	29.4%
*/
-- calculating the total sum of each continent
SELECT continent_name, sum(gdp_per_capita) AS TOTAL FROM braintree.gdb
WHERE year = 2012
GROUP BY continent_name;
/*
continent_name,TOTAL 
Africa	281270.67474119994
Europe	2211672.485194
South America	210228.294156
North America	751111.6450172
Oceania	298545.10057199997
Africa	281270.67474119994
Europe	2211672.485194
South America	210228.294156
North America	751111.6450172
Oceania	298545.10057199997
*/
/*3 For the year 2012, create a 3 column, 1 row report showing the percent share of gdp_per_capita for the following regions:

(i) Asia, (ii) Europe, (iii) the Rest of the World. Your result should look something like

 Asia  | Europe | Rest of World 
------ | ------ | -------------
28.3%  | 42.2%  | 29.4%*/



SELECT 
    CONCAT(ROUND(((SELECT 
                            SUM(gdp_per_capita)
                        FROM
                            braintree.gdb
                        WHERE
                            year = 2012 AND continent_name = 'Asia') / (SELECT 
                            SUM(gdp_per_capita)
                        FROM
                            braintree.gdb
                        WHERE
                            year = 2012)) * 100,
                    1),
            '%') AS 'Asia' ,
-- SELECT 
    CONCAT(ROUND(((SELECT 
                            SUM(gdp_per_capita)
                        FROM
                            braintree.gdb
                        WHERE
                            year = 2012 AND continent_name = 'Europe') / (SELECT 
                            SUM(gdp_per_capita)
                        FROM
                            braintree.gdb
                        WHERE
                            year = 2012)) * 100,
                    1),
            '%') AS 'Europe',           
    CONCAT(ROUND(((SELECT 
                            SUM(gdp_per_capita)
                        FROM
                            braintree.gdb
                        WHERE
                            year = 2012 AND continent_name != 'Asia'
                                AND continent_name != 'Europe') / (SELECT 
                            SUM(gdp_per_capita)
                        FROM
                            braintree.gdb
                        WHERE
                            year = 2012)) * 100,
                    1),
            '%') AS 'Rest of World';
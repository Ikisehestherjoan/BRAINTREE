/* 
1. Data Integrity Checking & Cleanup
Alphabetically list all of the country codes in the continent_map table that appear more than once.
 Display any values where country_code is null as country_code = "FOO" and make this row appear first in the list,
 even though it should alphabetically sort to the middle. Provide the results of this query as your answer.
For all countries that have multiple rows in the continent_map table, 
delete all multiple records leaving only the 1 record per country. 
The record that you keep should be the first one when sorted by the continent_code alphabetically ascending.
 Provide the query/ies and explanation of step(s) that you follow to delete these records.
*/
-- FIRST I HAD TO CREATE A DATA BASE SCHEMA AND IMORT THE DATA INTO THE TABLE USING TABLE DATA IMPORT WIZARD
USE braintreequery;
show tables; -- DISPLAYS THE TABLE NAME
/*
continent_map
continents
countries
per_capita
*/

/* Replace '' empty strings with NULL*/

UPDATE continent_map
SET
    country_code = CASE 
    WHEN country_code = '' 
		THEN NULL ELSE country_code 
    END,
    continent_code = CASE 
    WHEN continent_code = '' 
		THEN NULL ELSE continent_code 
    END;

-- Alphabetically list all of the country codes in the continent_map table that appear more than once.
SELECT 
    COALESCE(country_code, 'FOO') AS country_code_coalesce
FROM
    braintreequery.continent_map
GROUP BY country_code
HAVING COUNT(*) > 1
ORDER BY country_code;    
/*
country_code_coalesce
FOO
ARM
AZE
CYP
GEO
KAZ
RUS
*/
/*
For all countries that have multiple rows in the continent_map table, 
delete all multiple records leaving only the 1 record per country. 
The record that you keep should be the first one when sorted by the continent_code alphabetically ascending.
 Provide the query/ies and explanation of step(s) that you follow to delete these records.*/
 

 -- Create a temporary table with a new column ID as a row_number on the table after order by contry_code, continent_code*/
 CREATE TABLE t1 (
 SELECT row_number() over (order by country_code, continent_code asc) as 'ID',country_code
      ,continent_code
  FROM braintreequery.continent_map );
  
  SELECT * FROM t1;
  
CREATE TABLE t2 (Select MIN(ID) as ID from t1 group by country_code );

SELECT * FROM T2;
 
/*Delete the rows that dont have a min ID number after group by country_code*/
Delete From t1 where ID NOT IN(select ID from t2) ;

/*Reset continent_map table*/
Delete From continent_map;

SELECT * FROM continent_map;
/*Refill continent_map from temp_table*/
insert into continent_map
  select country_code, continent_code from t1;
 
 /*drop temporary tables*/
 DROP TABLE t1;
 DROP TABLE t2;
 
 SELECT * FROM continent_map;
 
 /*
 ALA	EU
ALB	EU
AND	EU
ANT	NA
ARE	AS
ARG	SA
ARM	AF
ASM	OC
ATA	AN
ATF	AN
ATG	NA
AUS	OC
AUT	EU
AZE	AS
BDI	AF
BEL	EU
BEN	AF
BES	NA
BFA	AF
BGD	AS
BGR	EU
BHR	AS
BHS	NA
BIH	EU
BLM	NA
BLR	EU
BLZ	NA
 */
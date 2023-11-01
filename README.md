# BRAINTREE
### Introduction
# SQL Mastery Challenge

## Introduction

Welcome to the SQL Mastery Challenge, where I aim to demonstrate my proficiency in SQL, a pivotal skill for the day-to-day responsibilities of the role I'm applying for. This challenge presents an opportunity to showcase my ability to work with SQL in its purest form to provide accurate solutions to a set of questions and data-related tasks.

Before delving into the challenge, it's important to note a few key points:

1. **SQL Mastery**: All tasks in this challenge will be completed using SQL. Whether it's MS SQL, Postgres, MySQL, or any other variant, I will rely solely on SQL to derive the correct answers. This challenge is designed to emphasize my SQL capabilities independently of other tools like R, SAS, or similar software.

2. **Handling Imperfect Data**: This dataset may contain blank or null values. I will work with this data as I find it, recognizing that this is common in real-world scenarios. I will also provide explanations for any issues or workarounds required to arrive at the answers.

3. **No Gotchas**: There are no hidden tricks or traps. It is designed to evaluate typical SQL skills needed for the job. Some questions may appear unconventional, but they are meant to assess SQL proficiency rather than posing actual inquiries applicable to the dataset.

4. **Not an Excel Exercise**: While Excel is a valuable data tool, this challenge is exclusively SQL-based. Even though Excel could potentially be used to answer these questions, the primary focus is on assessing technical SQL capabilities.


### Instructions
# Project Instructions - SQL Database Creation and Querying
Welcome to the SQL Database Creation and Querying project. Here are the detailed instructions to guide you through this task:

1. **Database Creation:**
   - Created a SQL database using the attached CSV files.

2. **Questionnaire:**
   - Use the database to answer the following questions.
   - All answers that return money values should be rounded to 2 decimal points and preceded by the "$" symbol (e.g. "$1432.10").
   - All answers that return percent values should be between -100.00 to 100.00, rounded to 2 decimal points, and followed by the "%" symbol (e.g. "58.30%").

3. **File Naming:**
   - Copy & paste the questions from the section below into a new plain .txt file named.

4. **Providing Results:**
   - Provide all of the results of my work as answers.

5. **Code Submission:**
   - Provide all code, including what you used to create the database and import data, and answers related to each question immediately below the question.
 
### Questions Solved

1\. Data Integrity Checking & Cleanup

- Alphabetically list all of the country codes in the continent_map table that appear more than once. Display any values where country_code is null as country_code = "FOO" and make this row appear first in the list, even though it should alphabetically sort to the middle. Provide the results of this query as your answer.

- For all countries that have multiple rows in the continent_map table, delete all multiple records leaving only the 1 record per country. The record that you keep should be the first one when sorted by the continent_code alphabetically ascending. Provide the query/ies and explanation of step(s) that you follow to delete these records.

2\. List the countries ranked 10-12 in each continent by the percent of year-over-year growth descending from 2011 to 2012.

The percent of growth should be calculated as: ((2012 gdp - 2011 gdp) / 2011 gdp)

The list should include the columns:

- rank
- continent_name
- country_code
- country_name
- growth_percent

3\. For the year 2012, create a 3 column, 1 row report showing the percent share of gdp_per_capita for the following regions:

(i) Asia, (ii) Europe, (iii) the Rest of the World. Your result should look something like

 Asia  | Europe | Rest of World 
------ | ------ | -------------
25.0%  | 25.0%  | 50.0%

4a\. What is the count of countries and sum of their related gdp_per_capita values for the year 2007 where the string 'an' (case insensitive) appears anywhere in the country name?

4b\. Repeat question 4a, but this time make the query case sensitive.

5\. Find the sum of gpd_per_capita by year and the count of countries for each year that have non-null gdp_per_capita where (i) the year is before 2012 and (ii) the country has a null gdp_per_capita in 2012. Your result should have the columns:

- year
- country_count
- total

6\. All in a single query, execute all of the steps below and provide the results as your final answer:

a. create a single list of all per_capita records for year 2009 that includes columns:

- continent_name
- country_code
- country_name
- gdp_per_capita

b. order this list by:

- continent_name ascending
- characters 2 through 4 (inclusive) of the country_name descending

c. create a running total of gdp_per_capita by continent_name

d. return only the first record from the ordered list for which each continent's running total of gdp_per_capita meets or exceeds $70,000.00 with the following columns:

- continent_name
- country_code
- country_name
- gdp_per_capita
- running_total

7\. Find the country with the highest average gdp_per_capita for each continent for all years. Now compare your list to the following data set. Please describe any and all mistakes that you can find with the data set below. Include any code that you use to help detect these mistakes.

rank | continent_name | country_code | country_name | avg_gdp_per_capita 
---- | -------------- | ------------ | ------------ | -----------------
   1 | Africa         | SYC          | Seychelles   |         $11,348.66
   1 | Asia           | KWT          | Kuwait       |         $43,192.49
   1 | Europe         | MCO          | Monaco       |        $152,936.10
   1 | North America  | BMU          | Bermuda      |         $83,788.48
   1 | Oceania        | AUS          | Australia    |         $47,070.39
   1 | South America  | CHL          | Chile        |         $10,781.71

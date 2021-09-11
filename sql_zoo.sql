
-- SELECT basics

/*
1. The example uses a WHERE clause to show the population of 'France'. Note that strings (pieces of text that are data) should be in 'single quotes';
*/

SELECT population FROM world
  WHERE name = 'Germany'

/*  
2.Checking a list The word IN allows us to check if an item is in a list. The example shows the name and population for the countries 'Brazil', 'Russia', 'India' and 'China'.
Show the name and the population for 'Sweden', 'Norway' and 'Denmark'.
*/

SELECT name,population FROM world
WHERE name IN ('Sweden','Norway','Denmark')

/*
3.Which countries are not too small and not too big? BETWEEN allows range checking (range specified is inclusive of boundary values). The example below shows countries with an area of 250,000-300,000 sq. km. Modify it to show the country and the area for countries with an area between 200,000 and 250,000.
*/

SELECT name, area FROM world
  WHERE area BETWEEN 200000 AND 250000
  

--SELECT from WORLD Tutorial
 
 /*
 1. Read the notes about this table. Observe the result of running this SQL command to show the name, continent and population of all countries.
 */
 
 SELECT name, continent, population FROM world
 
 /*
 2. How to use WHERE to filter records. Show the name for the countries that have a population of at least 200 million. 200 million is 200000000, there are eight zeros.
 */
 
 SELECT name FROM world
WHERE population >= 200000000

/*
3. Give the name and the per capita GDP for those countries with a population of at least 200 million.
*/

SELECT name, gdp/population as GDP
FROM world
WHERE population >= 200000000

/*
4. Show the name and population in millions for the countries of the continent 'South America'. Divide the population by 1000000 to get population in millions.
*/

SELECT name, population/1000000 as population
FROM world
where continent='South America'

/*
5. Show the name and population for France, Germany, Italy
*/

SELECT name, population
FROM world
WHERE name IN ('France','Germany','Italy')

/*
6. Show the countries which have a name that includes the word 'United'
*/

SELECT name
FROM world
WHERE name like '%United%'

/*
7. Two ways to be big: A country is big if it has an area of more than 3 million sq km or it has a population of more than 250 million.
Show the countries that are big by area or big by population. Show name, population and area.
*/

SELECT name,population,area
FROM world
WHERE area > 3000000 OR population > 250000000

/*
8.
Exclusive OR (XOR). Show the countries that are big by area (more than 3 million) or big by population (more than 250 million) but not both. Show name, population and area.

Australia has a big area but a small population, it should be included.
Indonesia has a big population but a small area, it should be included.
China has a big population and big area, it should be excluded.
United Kingdom has a small population and a small area, it should be excluded.
*/

SELECT name,population,area
FROM world
WHERE area > 3000000 XOR population > 250000000

/*
9. Show the name and population in millions and the GDP in billions for the countries of the continent 'South America'. Use the ROUND function to show the values to two decimal places.
For South America show population in millions and GDP in billions both to 2 decimal places.
*/

SELECT name
,ROUND(population/1000000,2) as population_in_milions
,ROUND(gdp/1000000000,2) as gdp_in_billions
FROM world
WHERE continent='South America'

/*
10. Show the name and per-capita GDP for those countries with a GDP of at least one trillion (1000000000000; that is 12 zeros). Round this value to the nearest 1000.
Show per-capita GDP for the trillion dollar countries to the nearest $1000.
*/

SELECT name,round(gdp/population,-3) as gdp_per_capita
FROM world
WHERE gdp >= 1000000000000

/*
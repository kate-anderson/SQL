--Q1 List all countries in 'North America' and sort high to low
SELECT *
FROM COUNTRY
WHERE REGION='North America'
ORDER BY AREA desc;

--Q2 How many countries are there in region 'South America'? Show the number
SELECT COUNT(*)
FROM COUNTRY
WHERE REGION='South America';

--Q3 Find all the countries (show name and region) with the word 'Republic' in their names.
SELECT NAME, REGION
FROM COUNTRY
WHERE NAME LIKE '%Republic%';

--Q4 List the names of all the countries that satisfy: population between 50000000 and 100000000, not in 'Africa', and area less than 1000000. sort by gdp in desc
SELECT NAME
FROM COUNTRY
WHERE POPULATION BETWEEN 50000000 AND 100000000
    AND REGION != 'Africa'
    AND AREA < 1000000
ORDER BY GDP desc;

--Q5 List the regions (distinct) of all countries with gdp > 0.1
SELECT DISTINCT REGION
FROM COUNTRY
WHERE GDP > 0.1;

--Q6
SELECT NAME
FROM COUNTRY
WHERE GDP < 0.0 
AND REGION NOT IN ('North America', 'Asia', 'Europe', 'Oceania', 'Artic Region')
ORDER BY GDP asc;

--Q7
SELECT DISTINCT REGION, COUNT(POPULATION) AS total_pop
FROM COUNTRY
GROUP BY REGION
ORDER BY total_pop desc;

--Q8
SELECT REGION, MIN(GDP) AS min_gdp, MAX(GDP) AS max_gdp
FROM COUNTRY
GROUP BY REGION
ORDER BY REGION asc;

--Q9
SELECT DISTINCT REGION, COUNT(DISTINCT NAME) AS countries
FROM COUNTRY
GROUP BY REGION
HAVING COUNT(DISTINCT NAME) > 15
ORDER BY countries asc;

--Q10
SELECT *
FROM (SELECT NAME, POPULATION/AREA AS pop_density
FROM COUNTRY
WHERE POPULATION IS NOT NULL
    AND AREA IS NOT NULL
ORDER BY pop_density desc)
WHERE ROWNUM <=10;

--Q11
CREATE TABLE City(
    name varchar2(50) NOT NULL,
    country varchar2(60),
    population number(11,0),
    capital varchar2(1),
    CONSTRAINT city_PK primary key(name),
    CONSTRAINT country_FK foreign key(country) REFERENCES Country(name)
    );
	
--Q12
INSERT INTO CITY VALUES('Washington D.C.', 'United States', 681170, 'Y');
INSERT INTO CITY VALUES('London', 'United Kingdom', 8788000, 'Y');
INSERT INTO CITY VALUES('Iowa City', 'United States', 74398, 'N');
INSERT INTO CITY(name, country, capital) VALUES('Peoria', 'United States', 'N');

SELECT *
FROM City;

--Q13
UPDATE City
SET POPULATION = POPULATION + 100
WHERE country = 'United States';

SELECT name, population
FROM City;

--Q14
DELETE FROM city
WHERE capital='N';

SELECT * 
FROM city;
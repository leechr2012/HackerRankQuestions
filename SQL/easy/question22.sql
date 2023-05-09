-- Given the CITY and COUNTRY tables, query the names of all cities where the CONTINENT is 'Africa'.

-- Note: CITY.CountryCode and COUNTRY.Code are matching key columns.

SELECT City.Name as City_Name
FROM CITY
JOIN COUNTRY ON CITY.CountryCode = COUNTRY.Code
WHERE CONTINENT = 'Africa'

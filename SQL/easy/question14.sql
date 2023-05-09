-- Query the list of CITY names from STATION that do not start with vowels and do not end with vowels.
-- Your result cannot contain duplicates.

SELECT DISTINCT City
FROM Station
WHERE City REGEXP '^[^aeiou]' AND City REGEXP '[^aeiou]$'

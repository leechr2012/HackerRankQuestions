-- Query the list of CITY names ending with vowels (a, e, i, o, u) from STATION. Your result cannot contain duplicates.

SELECT DISTINCT City
FROM Station
WHERE City REGEXP '[aeiouAEIOU]$'

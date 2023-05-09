-- Which country has a population that is more than United Kingdom but less than Germany? Show the name and the population.

SELECT name, population
FROM world
WHERE population >
    (SELECT population
        FROM world
        WHERE name = 'United Kingdom'
    )
AND population <
    (SELECT population
        FROM world
        WHERE name = 'Germany'
    );

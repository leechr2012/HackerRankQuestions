-- https://www.hackerrank.com/challenges/harry-potter-and-wands/problem

SELECT w.id, wp.age, w.coins_needed, w.power
FROM Wands w
JOIN Wands_Property wp
ON w.code = wp.code
WHERE wp.is_evil = 0
AND w.coins_needed = (SELECT MIN(coins_needed)
FROM wands ws
WHERE ws.code = w.code
AND ws.power = w.power)
ORDER BY w.power DESC, wp.age DESC

-- https://www.hackerrank.com/challenges/challenges/problem?isFullScreen=true

WITH CTE AS(
    SELECT c.hacker_id AS hacker_id, h.name AS name, COUNT(c.challenge_id) AS num_challenges
    FROM Challenges c JOIN Hackers h ON c.hacker_id = h.hacker_id GROUP BY c.hacker_id, h.name )

SELECT *
FROM CTE
WHERE num_challenges IN(
    SELECT num_challenges
    FROM CTE
    GROUP BY num_challenges
    HAVING COUNT(*) <= 1 OR num_challenges = (SELECT MAX(num_challenges) FROM CTE))
ORDER BY num_challenges DESC, hacker_id ASC;

-- 1. WITH CTE AS(...): This line begins a Common Table Expression (CTE) that creates a temporary table named "CTE".
-- The purpose of this CTE is to compute the number of challenges created by each hacker, which will be used later in the main query.

-- 2. SELECT c.hacker_id AS hacker_id, h.name AS name, COUNT(c.challenge_id) AS num_challenges:
-- This line selects the hacker_id and name columns from the Hackers table and the number of challenges created by each hacker from the Challenges table.
-- The COUNT function is used to count the number of rows in the Challenges table for each hacker.

-- 3. FROM Challenges c JOIN Hackers h ON c.hacker_id = h.hacker_id:
-- This line specifies that we want to join the Challenges table with the Hackers table based on the hacker_id column.

-- 4. GROUP BY c.hacker_id, h.name: This line groups the results by hacker_id and name,
-- so that the COUNT function counts the number of challenges for each unique hacker.

-- 5. SELECT * FROM CTE WHERE num_challenges IN(...): This line begins the main query that selects the columns
-- from the CTE and filters the results based on the number of challenges created by each hacker.

-- 6. SELECT num_challenges FROM CTE GROUP BY num_challenges HAVING COUNT(*) <= 1 OR num_challenges = (SELECT MAX(num_challenges) FROM CTE)):
-- This line selects the unique number of challenges created by the hackers from the CTE andchecks whether the count of that number is
-- less than or equal to 1 or the number of challenges is the maximum number of challenges created by any hacker.

-- 7. ORDER BY num_challenges DESC, hacker_id ASC: This line orders the results first by the number of challenges in
-- descending order and then by the hacker_id in ascending order (i.e., in case there are multiple hackers with the same number of challenges,
-- they will be sorted by their hacker_id).

-- 8. So, the final output of this query will be a list of hackers with their hacker_id, name,
-- and the total number of challenges they created, sorted in descending order by the total number of challenges.
-- If there are multiple hackers who created the same number of challenges, they will be sorted by their hacker_id.
-- Additionally, if the number of challenges is less than the maximum number of challenges created, those hackers will be excluded from the results.

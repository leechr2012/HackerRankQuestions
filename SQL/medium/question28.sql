-- https://www.hackerrank.com/challenges/contest-leaderboard/problem

SELECT H.hacker_id, H.name, SUM(T.max_score) AS total_score
FROM Hackers AS H
JOIN ( SELECT S.hacker_id, MAX(S.score) AS max_score
      FROM Submissions AS S
      GROUP BY S.hacker_id, S.challenge_id ) AS T
ON H.hacker_id = T.hacker_id
GROUP BY H.hacker_id, H.name
HAVING total_score IS NOT NULL AND total_score > 0
ORDER BY total_score DESC, H.hacker_id ASC;

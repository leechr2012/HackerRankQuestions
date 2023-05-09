SELECT h.hacker_id, h.name
FROM Hackers h
INNER JOIN Submissions s
ON h.hacker_id = s.hacker_id
INNER JOIN Challenges c
ON c.challenge_id = s.challenge_id
INNER JOIN Difficulty d
ON c.difficulty_level = d.difficulty_level
WHERE s.score = d.score
GROUP BY h.hacker_id, h.name
HAVING COUNT(*) > 1
ORDER BY COUNT(*) DESC, h.hacker_id;

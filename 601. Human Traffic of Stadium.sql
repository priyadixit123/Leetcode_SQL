https://leetcode.com/problems/human-traffic-of-stadium/description/

Sol

WITH Filtered AS (
  SELECT *
  FROM Stadium
  WHERE people >= 100
),
Grouped AS (
  SELECT *,
         id - ROW_NUMBER() OVER (ORDER BY id) AS grp
  FROM Filtered
),
Consecutives AS (
  SELECT grp
  FROM Grouped
  GROUP BY grp
  HAVING COUNT(*) >= 3
)
SELECT id, visit_date, people
FROM Grouped
WHERE grp IN (SELECT grp FROM Consecutives)
ORDER BY visit_date;

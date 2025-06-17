https://leetcode.com/problems/restaurant-growth/description/
Sol:
WITH DailyTotal AS (
    SELECT
        visited_on,
        SUM(amount) AS amount
    FROM Customer
    GROUP BY visited_on
),
MovingAvg AS (
    SELECT
        a.visited_on,
        (
            SELECT SUM(b.amount)
            FROM DailyTotal b
            WHERE b.visited_on BETWEEN DATEADD(DAY, -6, a.visited_on) AND a.visited_on
        ) AS total_amount
    FROM DailyTotal a
)
SELECT
    m.visited_on,
    m.total_amount AS amount,
    ROUND(CAST(m.total_amount AS FLOAT) / 7, 2) AS average_amount
FROM MovingAvg m
WHERE m.visited_on >= DATEADD(DAY, 6, (SELECT MIN(visited_on) FROM Customer))
ORDER BY m.visited_on;

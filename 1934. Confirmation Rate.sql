https://leetcode.com/problems/confirmation-rate/?envType=study-plan-v2&envId=top-sql-50


1934. Confirmation Rate


Solution :


# Write your MySQL query statement below
WITH ConfirmationsSummary AS (
    SELECT
        user_id,
        SUM(CASE WHEN action = 'confirmed' THEN 1 ELSE 0 END) AS confirmed_count,
        COUNT(*) AS total_count
    FROM
        Confirmations
    GROUP BY
        user_id
),
UsersConfirmationRate AS (
    SELECT
        s.user_id,
        COALESCE(ROUND(cs.confirmed_count * 1.0 / cs.total_count, 2), 0.00) AS confirmation_rate
    FROM
        Signups s
    LEFT JOIN
        ConfirmationsSummary cs
    ON
        s.user_id = cs.user_id
)
SELECT
    user_id,
    confirmation_rate
FROM
    UsersConfirmationRate;

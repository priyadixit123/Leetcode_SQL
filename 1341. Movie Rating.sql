https://leetcode.com/problems/movie-rating/submissions/1669555473/
Sol:

-- CTE to get the user who rated the most movies
WITH TopUser AS (
    SELECT TOP 1 u.name AS results
    FROM MovieRating mr
    JOIN Users u ON mr.user_id = u.user_id
    GROUP BY u.user_id, u.name
    ORDER BY COUNT(*) DESC, u.name ASC
),

-- CTE to get the movie with highest average rating in Feb 2020
TopMovie AS (
    SELECT TOP 1 m.title AS results
    FROM MovieRating mr
    JOIN Movies m ON mr.movie_id = m.movie_id
    WHERE mr.created_at >= '2020-02-01' AND mr.created_at < '2020-03-01'
    GROUP BY m.movie_id, m.title
    ORDER BY AVG(CAST(mr.rating AS FLOAT)) DESC, m.title ASC
)

-- Final result combining both
SELECT * FROM TopUser
UNION ALL
SELECT * FROM TopMovie;

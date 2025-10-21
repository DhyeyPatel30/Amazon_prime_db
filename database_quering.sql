-- 1. List all users with their subscription plans
SELECT u.user_id, u.name, s.plan_name, s.duration_months, s.price FROM Users u JOIN Subscriptions s ON u.subscription_id = s.subscription_id;

-- 2. Display all movies with their genres and ratings
SELECT m.movie_id, m.title, m.release_year, g.genre_name, m.rating 
FROM Movies m 
JOIN moviegenres mg ON m.movie_id = mg.movie_id
JOIN genres g ON mg.genre_id = g.genre_id
ORDER BY m.title;

-- 3. List all devices registered by each user
SELECT u.name, d.device_type, d.device_name, d.last_used FROM Users u JOIN devices d ON d.user_id = u.user_id;

-- 4. Get top 10 longest movies
SELECT m.title, m.release_year, m.duration_min, m.rating FROM Movies m ORDER BY m.duration_min DESC LIMIT 10;

-- 5. Get total number of reviews by each user
SELECT u.name, COUNT(r.review_id) AS total_reviews
FROM users u
LEFT JOIN reviews r ON u.user_id = r.user_id
GROUP BY u.name
ORDER BY total_reviews DESC;

-- 6. Show each user’s most recently watched movie
SELECT u.name, m.title, w.watch_date
FROM users u
JOIN watchhistory w ON u.user_id = w.user_id
JOIN movies m ON w.movie_id = m.movie_id
WHERE w.watch_date = (
    SELECT MAX(w2.watch_date)
    FROM watchhistory w2
    WHERE w2.user_id = u.user_id
);

-- 7. Find all movies that have never been reviewed
SELECT m.title, g.genre_name
FROM movies m
LEFT JOIN reviews r ON m.movie_id = r.movie_id
JOIN moviegenres mg ON m.movie_id = mg.movie_id
JOIN genres g ON mg.genre_id = g.genre_id
WHERE r.review_id IS NULL
ORDER BY m.title;

-- 8. Rank movies based on average user rating
SELECT m.title,
       AVG(r.rating) AS avg_rating,
       RANK() OVER (ORDER BY AVG(r.rating) DESC) AS rank_position
FROM movies m
JOIN reviews r ON m.movie_id = r.movie_id
GROUP BY m.title;

-- 9. Find most watched genres overall
SELECT g.genre_name, COUNT(*) AS total_watches
FROM watchhistory w
JOIN movies m ON w.movie_id = m.movie_id
JOIN moviegenres mg ON m.movie_id = mg.movie_id
JOIN genres g ON mg.genre_id = g.genre_id
GROUP BY g.genre_name
ORDER BY total_watches DESC;

-- 10. Calculate total time (in minutes) users have spent watching
SELECT u.name, SUM(m.duration_min * (w.progress_percentage / 100)) AS total_minutes_watched
FROM users u
JOIN watchhistory w ON u.user_id = w.user_id
JOIN movies m ON w.movie_id = m.movie_id
GROUP BY u.name
ORDER BY total_minutes_watched DESC;

-- 11. Add a new movie entry
INSERT INTO movies (title, release_year, duration_min)
VALUES ('Echoes of Tomorrow', 2024, 125);

-- 12. Update a user’s name
UPDATE users
SET name = 'Tony Stark'
WHERE user_id = 3;

-- 13. Delete reviews with a NULL rating
DELETE FROM reviews
WHERE rating IS NULL;

-- 14. User engagement score (based on reviews + watch history)
SELECT u.user_id, u.name,
       COUNT(DISTINCT w.history_id) * 2 + COUNT(r.review_id) AS engagement_score
FROM users u
LEFT JOIN watchhistory w ON u.user_id = w.user_id
LEFT JOIN reviews r ON u.user_id = r.user_id
GROUP BY u.user_id, u.name
ORDER BY engagement_score DESC;

-- 15. Genre-wise average movie rating
SELECT g.genre_name, AVG(r.rating) AS avg_genre_rating
FROM genres g
JOIN moviegenres mg ON g.genre_id = mg.genre_id
JOIN movies m ON mg.movie_id = m.movie_id
JOIN reviews r ON m.movie_id = r.movie_id
GROUP BY g.genre_name
ORDER BY avg_genre_rating DESC;

-- 16. Identify the most-watched movie per genre
SELECT g.genre_name, m.title, COUNT(*) AS total_views
FROM watchhistory w
JOIN movies m ON w.movie_id = m.movie_id
JOIN moviegenres mg ON m.movie_id = mg.movie_id
JOIN genres g ON mg.genre_id = g.genre_id
GROUP BY g.genre_name, m.title
ORDER BY g.genre_name, total_views DESC;

-- 17. Find all reviews for a specific movie
SELECT r.review_id, u.name, r.rating
FROM Reviews r
JOIN Users u ON r.user_id = u.user_id
JOIN Movies m ON r.movie_id = m.movie_id
WHERE m.title = 'Enhanced dedicated workforce';

-- 18. List all watch history of a specific user
SELECT u.name, m.title, m.release_year, m.rating , w.watch_date, w.progress_percentage
FROM Movies m
JOIN watchhistory w ON m.movie_id = w.movie_id
JOIN Users u ON w.user_id = u.user_id
WHERE w.user_id = 3;

-- 19. Total revenue from all subscriptions
SELECT SUM(price) AS Total_Revenue FROM Subscriptions;

-- 20. Total revenue by each subscriptions
SELECT 
    s.plan_name,
    s.price AS plan_price,
    COUNT(u.user_id) AS total_users,
    SUM(s.price) AS total_revenue
FROM subscriptions s
JOIN users u ON s.subscription_id = u.subscription_id
GROUP BY s.plan_name, s.price;

-- 21. Find the most-watched genre per user
SELECT 
    u.user_id,
    u.name AS user_name,
    g.genre_name,
    watch_count
FROM (
    SELECT 
        wh.user_id,
        mg.genre_id,
        COUNT(*) AS watch_count,
        RANK() OVER (PARTITION BY wh.user_id ORDER BY COUNT(*) DESC) AS genre_rank
    FROM watchhistory wh
    JOIN moviegenres mg ON wh.movie_id = mg.movie_id
    GROUP BY wh.user_id, mg.genre_id
) ranked
JOIN users u ON ranked.user_id = u.user_id
JOIN genres g ON ranked.genre_id = g.genre_id
WHERE ranked.genre_rank = 1
ORDER BY u.user_id;

-- 22. Genre popularity (based on total watches)
SELECT 
    g.genre_name,
    COUNT(wh.history_id) AS total_watches
FROM watchhistory wh
JOIN moviegenres mg ON wh.movie_id = mg.movie_id
JOIN genres g ON mg.genre_id = g.genre_id
GROUP BY g.genre_name
ORDER BY total_watches DESC;


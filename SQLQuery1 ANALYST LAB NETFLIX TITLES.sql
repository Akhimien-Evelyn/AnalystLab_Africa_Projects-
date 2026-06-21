-- Display first 10 rows
SELECT TOP 10 * FROM netflix_titles

-- Total row count
SELECT COUNT(*) AS total_rows FROM netflix_titles

-- Column names and data types
SELECT COLUMN_NAME, DATA_TYPE, CHARACTER_MAXIMUM_LENGTH
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'netflix_titles'

-- Count nulls per column
SELECT
    SUM(CASE WHEN director    IS NULL THEN 1 ELSE 0 END) AS null_director,
    SUM(CASE WHEN cast        IS NULL THEN 1 ELSE 0 END) AS null_cast,
    SUM(CASE WHEN country     IS NULL THEN 1 ELSE 0 END) AS null_country,
    SUM(CASE WHEN date_added  IS NULL THEN 1 ELSE 0 END) AS null_date,
    SUM(CASE WHEN rating      IS NULL THEN 1 ELSE 0 END) AS null_rating,
    SUM(CASE WHEN Duration_Value    IS NULL THEN 1 ELSE 0 END) AS null_duration
FROM netflix_titles

-- Check for duplicate show_ids
SELECT show_id, COUNT(*) AS cnt
FROM netflix_titles
GROUP BY show_id
HAVING COUNT(*) > 1

-- Identify erroneous values in rating column
SELECT show_id, title, rating, Duration_Value
FROM netflix_titles
WHERE rating NOT IN (
    'G','PG','PG-13','R','NC-17',
    'TV-Y','TV-Y7','TV-Y7-FV','TV-G','TV-PG',
    'TV-14','TV-MA','NR','UR'
) OR rating IS NULL

-- Movies vs TV Shows count
SELECT type, COUNT(*) AS total
FROM netflix_titles
GROUP BY type
ORDER BY total DESC

-- Content added per year
SELECT
    YEAR(CAST(date_added AS DATE)) AS year_added,
    COUNT(*) AS titles_added
FROM netflix_titles
WHERE date_added IS NOT NULL
GROUP BY YEAR(CAST(date_added AS DATE))
ORDER BY year_added

-- Top 10 countries by number of titles
SELECT TOP 10 country, COUNT(*) AS total
FROM netflix_titles
WHERE country IS NOT NULL
GROUP BY country
ORDER BY total DESC

-- Rating distribution
SELECT rating, COUNT(*) AS count,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 2) AS pct
FROM netflix_titles
GROUP BY rating
ORDER BY count DESC

-- Average movie duration
SELECT
    AVG(CAST(REPLACE(Duration_Value, ' min', '') AS INT)) AS avg_duration_min,
    MIN(CAST(REPLACE(Duration_Value, ' min', '') AS INT)) AS min_duration,
    MAX(CAST(REPLACE(Duration_Value, ' min', '') AS INT)) AS max_duration
FROM netflix_titles
WHERE type = 'Movie' AND Duration_Value LIKE '%min%'

-- Top 10 directors by number of titles
SELECT TOP 10 director, COUNT(*) AS titles
FROM netflix_titles
WHERE director NOT IN ('Unknown') AND director IS NOT NULL
GROUP BY director
ORDER BY titles DESC

-- Adult vs family content ratio
SELECT
    CASE
        WHEN rating IN ('TV-MA','R','NC-17') THEN 'Adult'
        WHEN rating IN ('TV-Y','TV-Y7','G','TV-G','PG')  THEN 'Family'
        ELSE 'Teen/General'
    END AS audience,
    COUNT(*) AS total,
    ROUND(COUNT(*) * 100.0 / SUM(COUNT(*)) OVER(), 1) AS pct
FROM netflix_titles
GROUP BY
    CASE
        WHEN rating IN ('TV-MA','R','NC-17') THEN 'Adult'
        WHEN rating IN ('TV-Y','TV-Y7','G','TV-G','PG')  THEN 'Family'
        ELSE 'Teen/General'
    END
ORDER BY total DESC

-- Oldest and newest titles
SELECT TOP 5 title, type, release_year, country
FROM netflix_titles
ORDER BY release_year ASC;

SELECT TOP 5 title, type, release_year, country
FROM netflix_titles
ORDER BY release_year DESC
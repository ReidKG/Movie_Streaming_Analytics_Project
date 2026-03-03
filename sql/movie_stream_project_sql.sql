-- ===============================
-- Movie Streaming Analytics Schema
-- ===============================

-- Create Movies table
CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(100) NOT NULL,
    genre VARCHAR(50),
    studio VARCHAR(50),
    release_year INT
);

-- Create Streams table
CREATE TABLE streams (
    stream_id INT PRIMARY KEY,
    movie_id INT NOT NULL,
    user_id INT NOT NULL,
    watch_time INT,          -- watch time in minutes
    stream_date DATE,
    FOREIGN KEY (movie_id) REFERENCES movies(movie_id)
);

select *
from movies;

select *
from streams;

-- 1. Which movies had the most total streams?
select title, count(s.stream_id) as	total_streams
from movies m
join streams s on m.movie_id = s.movie_id
group by m.title
order by total_streams desc
;

-- 2. What’s the average watch time per genre?
select m.genre, avg(watch_time_minutes) as avg_min
from movies m
join streams s on m.movie_id = s.movie_id
group by genre
order by avg_min desc
;

-- 3. Which country streams the most movies overall?
select country, sum(watch_time_minutes) as minutes
from streams
group by country
order by minutes desc
;

-- 4. Do higher-rated movies get streamed more often?
select title, rating, count(streams.movie_id) as total_stream
from movies
join streams on movies.movie_id = streams.movie_id
group by title, rating
order by total_stream desc
;

-- 5. Which studio has the highest total revenue in this dataset?
select studio, sum(revenue_million) as revenue
from movies
group by studio
order by revenue desc
;

-- 6. Top 5 movies by total watch time (total minutes watched)?
select title, sum(watch_time_minutes) as minutes
from movies
join streams on movies.movie_id = streams.movie_id
group by title
order by minutes desc
limit 5
;

-- 7. Trend: How many streams per year?
select year(stream_date) as year,
-- count(stream_date)
count(*) as streams
from streams
group by year(stream_date)
;

-- 8. Which genre generates the highest revenue per stream?
select genre, sum(revenue_million) / count(stream_id) as revenue_per_stream
from movies
join streams on movies.movie_id = streams.movie_id
group by genre
order by revenue_per_stream desc
;

-- 9. Which users (user_id) are the most active streamers?
select user_id, count(*) as total_streams
from streams
group by user_id
order by total_streams desc
;
# 🎬 Movie Streaming Analytics Project  

## 📌 Overview  
This project analyzes a **mock movie streaming dataset** consisting of:  
- **Movies table** (10 rows): Metadata about films (title, genre, rating, studio, revenue).  
- **Streams table** (200 rows): User-level viewing activity (user ID, stream date, watch time, country).  

The goal is to practice **SQL joins, aggregations, and business-style analytics questions**.  

---

## 📂 Dataset Structure  

**1. `movies` table**  
| Column            | Type        | Description |
|-------------------|------------|-------------|
| movie_id          | INT (PK)   | Unique identifier for each movie |
| title             | VARCHAR    | Movie title |
| genre             | VARCHAR    | Movie genre (Action, Drama, Comedy, etc.) |
| release_year      | INT        | Year movie was released |
| studio            | VARCHAR    | Production studio |
| rating            | DECIMAL    | Average rating (1–10 scale) |
| revenue_million   | DECIMAL    | Revenue in millions (USD) |

**2. `streams` table**  
| Column            | Type        | Description |
|-------------------|------------|-------------|
| stream_id         | INT (PK)   | Unique identifier for each stream |
| user_id           | INT        | User watching |
| movie_id          | INT (FK)   | Links to `movies.movie_id` |
| stream_date       | DATE       | Date of the stream |
| watch_time_minutes| INT        | Duration watched |
| country           | VARCHAR    | Country of the viewer |

---

## ❓ Analysis Questions  

1. Which movies had the most total streams?  
2. What’s the average watch time per genre?  
3. Which country streams the most movies overall?  
4. Do higher-rated movies get streamed more often?  
5. Which studio has the highest total revenue in this dataset?  
6. Top 5 movies by total watch time (minutes watched)?  
7. Trend: How many streams per year?  
8. Which genre generates the highest revenue per stream?  
9. Which users (user_id) are the most active streamers?  

---

## 🛠️ Example SQL Queries  

**Most Streamed Movies**  
```sql
SELECT m.title, COUNT(s.stream_id) AS total_streams
FROM movies m
JOIN streams s ON m.movie_id = s.movie_id
GROUP BY m.title
ORDER BY total_streams DESC;
```

**Average Watch Time by Genre**  
```sql
SELECT m.genre, AVG(s.watch_time_minutes) AS avg_watch_time
FROM movies m
JOIN streams s ON m.movie_id = s.movie_id
GROUP BY m.genre
ORDER BY avg_watch_time DESC;
```

---

## 🚀 How to Use  

1. **Download the CSV files** (`movies.csv` & `streams.csv`).  
2. **Upload into MySQL Workbench** (use Table Data Import Wizard).  
   - Import `movies.csv` first.  
   - Then import `streams.csv` (mapped to `movies.movie_id`).  
3. Run the included **SQL scripts** for analysis.  
4. (Optional) Export results to **Excel** or **Power BI** for visualization.  

---

## 📊 Skills Demonstrated  
- SQL **joins** (INNER JOIN on `movie_id`)  
- SQL **aggregations** (COUNT, SUM, AVG)  
- **Trend analysis** using `YEAR()` on dates  
- **Top-N analysis** with `ORDER BY … LIMIT`  
- Translating **business-style questions** into SQL  

---

## 📎 Next Steps  
- Build dashboards in **Power BI** or **Tableau**  
- Add **visualizations** (streams per year, genre breakdown, top movies)  
- Extend dataset with **user demographics** for deeper insights  

--- 

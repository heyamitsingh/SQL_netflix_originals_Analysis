# 🎬 Netflix Originals Data Analysis: Exploring Trends and Insights  

## 📌 Overview  
This project analyzes the **Netflix Originals dataset** to extract meaningful insights and identify viewing/content trends. Using **PostgreSQL**, the project demonstrates how SQL can be leveraged for data analysis, reporting, and decision-making support.  

The project covers:  
- Database schema design and ERD creation  
- Writing efficient SQL queries for analysis  
- Exploring patterns in Netflix Original shows and movies  
- Deriving insights that can help understand Netflix’s content strategy  

---

## 🗂 Project Structure  

Netflix-Originals-Analysis/

- data/ # Sample dataset (CSV/SQL dump)
- scripts/ # SQL queries (schema, analysis, transformations)
- docs/ # Documentation (ERD, Project Details)
- README.md # Project overview


---

## 🛠️ Tools & Technologies  
- **Database**: PostgreSQL  
- **SQL Concepts Used**:  
  - `GROUP BY`, `HAVING`, `ORDER BY`, `LIMIT`  
  - `JOINS`  
  - `WINDOW FUNCTIONS`  
  - `SUBQUERIES`  

---

## 📂 Dataset  
- **Source**: Provided as part of the Internshala SQL project  
- **Description**: Contains details about Netflix Originals including:  
  - `title` – Name of the movie/show  
  - `genre` – Genre of the content  
  - `premiere_date` – Date the content premiered on Netflix  
  - `language` – Original language of the content  
  - `runtime` – Duration of the movie/show  
  - `imdb_score` – IMDb rating of the title  

---

## 🏗️ Database Design  
- The dataset was modeled into a relational structure in PostgreSQL.  
- Normalization was applied to reduce redundancy and improve query performance.  
- **Entity-Relationship Diagram (ERD):**  
  ![ERD](docs/ERD.png)  

---

## 🔍 Key SQL Queries  
Important analyses performed:  
1. **The average IMDb scores for each genre of Netflix Originals.**
2. **Genres having an average IMDb score higher than 7.5.**
3. **Listed Netflix Original titles in descending order of their IMDb scores.**
4. **Retrieved the top 10 longest Netflix Originals by runtime.**
5. **Retrieved the titles of Netflix Originals along with their respective genres.**
6. **Ranked Netflix Originals based on their IMDb scores within each genre.**
7. **Netflix Originals having IMDb scores higher than the average IMDb score of all titles**
8. **Number of Netflix Originals are there in each genre.**
9. **Names of genre having more than 5 Netflix Originals with an IMDb score higher than 8.**
10. **Top 3 genres with the highest average IMDb scores, and numbers of Netflix Originals do they have.**
---

Acknowledgments

Dataset provided by Internshala SQL project

Tools: PostgreSQL, dbdiagram.io (for ERD)

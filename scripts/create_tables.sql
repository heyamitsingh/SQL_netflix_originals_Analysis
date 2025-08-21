/*Syntax to create netflix table*/

CREATE TABLE netflix (
	title varchar(200) NOT NULL,
	genre_id varchar(10),
	runtime int,
	imdb_score numeric(5,2),
	language varchar(50),
	premiere_date date
);

/*Syntax to create genre table*/

CREATE TABLE genre (
	genre_id varchar(10),
	genre_name varchar(50)
);
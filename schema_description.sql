CREATE DATABASE IF NOT EXISTS amazon_prime_db;
USE amazon_prime_db;

CREATE TABLE Users (
    user_id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100),
    email VARCHAR(100) UNIQUE,
    password_hash VARCHAR(255),
    signup_date DATE,
    subscription_id INT
);

CREATE TABLE Subscriptions (
    subscription_id INT PRIMARY KEY AUTO_INCREMENT,
    plan_name VARCHAR(50),
    price DECIMAL(6,2),
    duration_months INT
);

CREATE TABLE Movies (
    movie_id INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255),
    release_year YEAR,
    duration_min INT,
    rating VARCHAR(10)  -- e.g., PG, R
);

CREATE TABLE Genres (
    genre_id INT PRIMARY KEY AUTO_INCREMENT,
    genre_name VARCHAR(50)
);

CREATE TABLE MovieGenres (
    movie_id INT,
    genre_id INT,
    PRIMARY KEY(movie_id, genre_id),
    FOREIGN KEY(movie_id) REFERENCES Movies(movie_id),
    FOREIGN KEY(genre_id) REFERENCES Genres(genre_id)
);

CREATE TABLE WatchHistory (
    history_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    movie_id INT,
    watch_date DATETIME,
    progress_percentage INT,
    FOREIGN KEY(user_id) REFERENCES Users(user_id),
    FOREIGN KEY(movie_id) REFERENCES Movies(movie_id)
);

CREATE TABLE Reviews (
    review_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    movie_id INT,
    rating INT,  -- 1 to 5
    review_text TEXT,
    review_date DATE,
    FOREIGN KEY(user_id) REFERENCES Users(user_id),
    FOREIGN KEY(movie_id) REFERENCES Movies(movie_id)
);

CREATE TABLE Devices (
    device_id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    device_type VARCHAR(50),
    device_name VARCHAR(100),
    last_used DATETIME,
    FOREIGN KEY(user_id) REFERENCES Users(user_id)
);

SELECT COUNT(*) FROM Users;
SELECT COUNT(*) FROM Movies;
SELECT COUNT(*) FROM WatchHistory;
SELECT COUNT(*) FROM Reviews;
SELECT COUNT(*) FROM Subscriptions;
SELECT COUNT(*) FROM Devices;
SELECT COUNT(*) FROM MovieGenres;

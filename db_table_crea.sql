CREATE TABLE IF NOT EXISTS director (
    director_id INT AUTO_INCREMENT PRIMARY KEY,
    director_first_name VARCHAR(100) NOT NULL,
    director_last_name VARCHAR(100) NOT NULL,
    UNIQUE (director_first_name, director_last_name)
);

CREATE TABLE IF NOT EXISTS movie (
    movie_id INT AUTO_INCREMENT PRIMARY KEY,
    movie_title VARCHAR(255) NOT NULL UNIQUE,
    movie_duration INTEGER NOT NULL,
    movie_release_year INTEGER NOT NULL,
    director_id INTEGER NOT NULL,
    FOREIGN KEY (director_id) REFERENCES director(director_id),
    INDEX (director_id),
    INDEX (movie_release_year)
);

CREATE TABLE IF NOT EXISTS actor (
    actor_id INT AUTO_INCREMENT PRIMARY KEY,
    actor_first_name VARCHAR(100) NOT NULL,
    actor_last_name VARCHAR(100) NOT NULL,
    actor_birth_date DATE NOT NULL,
    INDEX (actor_last_name), 
    INDEX (actor_first_name, actor_last_name), 
    INDEX (actor_birth_date)
);

CREATE TABLE IF NOT EXISTS role (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(100) NOT NULL,
    movie_id INTEGER NOT NULL,
    actor_id INTEGER NOT NULL,
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
    FOREIGN KEY (actor_id) REFERENCES actor(actor_id),
    INDEX (movie_id),
    INDEX (actor_id)
);

CREATE TABLE IF NOT EXISTS user (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    user_first_name VARCHAR(100) NOT NULL,
    user_last_name VARCHAR(100) NOT NULL,
    user_email VARCHAR(255) NOT NULL UNIQUE,
    user_password VARCHAR(255) NOT NULL, 
    user_role VARCHAR(50) NOT NULL,
    INDEX (user_email),

);

CREATE TABLE IF NOT EXISTS favorite_movie (
    user_id INTEGER NOT NULL,
    movie_id INTEGER NOT NULL,
    PRIMARY KEY (user_id, movie_id),
    FOREIGN KEY (user_id) REFERENCES user(user_id),
    FOREIGN KEY (movie_id) REFERENCES movie(movie_id),
    INDEX(user_id),
    INDEX(movie_id)
);



CREATE TABLE IF NOT EXISTS user_modif (
    user_modif_id INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
    user_modif_date DATETIME NOT NULL,
    user_id INT NOT NULL,
    modif_column_name VARCHAR(255) NOT NULL,
    old_value VARCHAR(255),
    new_value VARCHAR(255),
    KEY user_id (user_id),
    FOREIGN KEY (user_id) REFERENCES user (user_id),
);

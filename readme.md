JEUX DE REQUETE SQL

- les titres et dates de sortie des films du plus récent au plus ancien :
    SELECT 
        movie_title, movie_release_year 
    FROM 
        movie 
    ORDER BY 
        movie_release_year DESC;


- les noms, prénoms et âges des acteurs/actrices de plus de 30 ans dans l'ordre alphabétique :
    SELECT 
        actor_last_name,
        actor_first_name,
        TIMESTAMPDIFF(YEAR, actor_birth_date, CURDATE())
    FROM 
        actor
    WHERE 
        TIMESTAMPDIFF(YEAR, actor_birth_date, CURDATE()) > 30
    ORDER BY 
        actor_last_name;


- la liste des films pour un acteur/actrice donné
    SELECT 
        actor.actor_first_name, actor.actor_last_name
    FROM 
        actor
    INNER JOIN 
        role ON actor.actor_id = role.actor_id
    INNER JOIN 
        movie ON role.movie_id = movie.movie_id
    WHERE 
        WHERE movie.movie_title = "Inception" AND role.role_type = "main";


- ajouter un film
    INSERT INTO 
        `movie` (`movie_id`, `movie_title`, `movie_duration`, `movie_release_year`, `director_id`) 
    VALUES
        (1, 'Inception', 148, 2010, 1),


- ajouter un acteur/actrice
    INSERT INTO 
        `actor` (`actor_id`, `actor_first_name`, `actor_last_name`, `actor_birth_date`) 
    VALUES
        (5, 'Kate', 'Winslet', '1975-10-05');

- modifier un film
    UPDATE 
        movie
    SET 
        release_year = "2011"
    WHERE 
        movie_title = "Inception";


- supprimer un acteur/actrice
    DELETE FROM 
        actor
    WHERE 
        actor_last_name = "Dicaprio";


- afficher les 3 derniers acteurs/actrices ajouté(e)s
    SELECT 
        * 
    FROM 
        actor
    ORDER BY 
        actor_id DESC
    LIMIT 
        3;

        Note : j'aurai pu faire autrement en ajoutant une colonne genre "added_date" ou alors en utilisant un trigger :)


- Lister grâce à une procédure stockée les films d'un réalisateur donné en paramètre




- Garder grâce à un trigger une trace de toutes les modifications apportées à la table des utilisateurs. Ainsi, une table d'archive conservera la date de la mise à jour, l'identifiant de l'utilisateur concerné, l'ancienne valeur ainsi que la nouvelle.

    => ajout table d'archive
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




    => trigger
        DELIMITER $$
        CREATE TRIGGER `after_user_update` AFTER UPDATE ON `user`
        FOR EACH ROW
        BEGIN
        IF OLD.user_first_name != NEW.user_first_name THEN
            INSERT INTO user_modif (user_modif_date, user_id, modif_column_name, old_value, new_value) 
            VALUES (CURRENT_TIMESTAMP, OLD.user_id, 'user_first_name', OLD.user_first_name, NEW.user_first_name);
        END IF;

        IF OLD.user_last_name != NEW.user_last_name THEN
            INSERT INTO user_modif (user_modif_date, user_id, modif_column_name, old_value, new_value) 
            VALUES (CURRENT_TIMESTAMP, OLD.user_id, 'user_last_name', OLD.user_last_name, NEW.user_last_name);
        END IF;
        END $$
        DELIMITER ;



# Utiliser une image de MySQL comme base
FROM mysql:8.0

# Définir les variables d'environnement pour MySQL (à adapter selon vos besoins)
ENV MYSQL_ROOT_PASSWORD=my-secret-pw
ENV MYSQL_DATABASE=mydatabase
ENV MYSQL_USER=user
ENV MYSQL_PASSWORD=password

# Copier le script SQL pour générer la BDD dans le container
COPY ./path-to-your-sql-script.sql /docker-entrypoint-initdb.d/

# Exposer le port 3306
EXPOSE 3306

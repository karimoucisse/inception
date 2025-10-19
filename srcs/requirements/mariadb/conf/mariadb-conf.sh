#!/bin/bash
set -e

# Démarrer MariaDB sans systemd
echo "Starting MariaDB..."
mysqld_safe &

# Attendre que le serveur démarre
sleep 5

echo "Creating user 'jtech'..."
# mariadb -e "ALTER USER 'root'@'%' IDENTIFIED BY 'tonmotdepasse';"
mariadb -e "CREATE USER IF NOT EXISTS 'jtech'@'%' IDENTIFIED BY 'azerty123';"
mariadb -e "GRANT ALL PRIVILEGES ON *.* TO 'jtech'@'%' WITH GRANT OPTION;"
mariadb -e "FLUSH PRIVILEGES;"

echo "MariaDB ready and user created."

# Garder le conteneur en vie
wait

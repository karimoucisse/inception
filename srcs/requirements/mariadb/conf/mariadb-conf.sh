#!/bin/bash
set -e

echo "Starting MariaDB..."
mysqld_safe &

sleep 5

echo "Creating DATABASE $SQL_DATABASE..."
CREATE DATABASE $SQL_DATABASE;


echo "Creating user $SQL_USER..."
# mariadb -e "ALTER USER 'root'@'%' IDENTIFIED BY 'tonmotdepasse';"
mariadb -e "CREATE USER IF NOT EXISTS $SQL_USER@'%' IDENTIFIED BY $SQL_PASSWORD;"
mariadb -e "GRANT ALL PRIVILEGES ON *.* TO '$SQL_USER@'%' WITH GRANT OPTION;"
mariadb -e "FLUSH PRIVILEGES;"

echo "MariaDB ready and user created."

wait

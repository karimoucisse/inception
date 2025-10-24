#!/bin/bash
set -e

echo "🚀 Starting MariaDB setup..."

# Vérifier que les variables sont bien reçues
echo "DB_NAME=$DB_NAME"
echo "DB_USER=$DB_USER"

if [ -z "$DB_NAME" ] || [ -z "$DB_USER" ] || [ -z "$DB_PASS" ]; then
  echo "❌ Missing environment variables: DB_NAME, DB_USER, or DB_PASS"
  env  # debug
  exit 1
fi

# Démarrer MariaDB temporairement pour configurer la base
echo "Starting MariaDB temporarily..."
mysqld_safe --skip-networking &
sleep 5

# Création de la base et de l'utilisateur
echo "Creating database and user..."
mariadb -e "CREATE DATABASE IF NOT EXISTS \`${DB_NAME}\`;"
mariadb -e "CREATE USER IF NOT EXISTS '${DB_USER}'@'%' IDENTIFIED BY '${DB_PASS}';"
mariadb -e "GRANT ALL PRIVILEGES ON \`${DB_NAME}\`.* TO '${DB_USER}'@'%' WITH GRANT OPTION;"
mariadb -e "FLUSH PRIVILEGES;"

echo "✅ MariaDB configured successfully."

# Arrêter le serveur temporaire proprement
mysqladmin shutdown

# Redémarrer en mode normal (foreground)
exec mysqld_safe

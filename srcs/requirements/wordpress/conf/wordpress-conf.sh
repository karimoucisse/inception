#!/bin/bash

echo "Starting Wordpress install"

echo "DB_NAME=$DB_NAME"
echo "DB_USER=$DB_USER"

if [ -z "$DB_NAME" ] || [ -z "$DB_USER" ] || [ -z "$DB_PASS" ] ; then
  echo "❌ Missing environment variables: DB_NAME, DB_USER, DB_PASS"
  env
  exit 1
fi

echo "Waiting for MariaDB to be ready..."
until mariadb -hmariadb -u"$DB_USER" -p"$DB_PASS" -e "SHOW DATABASES;" > /dev/null 2>&1; do
  sleep 2
done
echo "MariaDB is up!"


wget https://wordpress.org/latest.tar.gz

sleep 5

tar -xzvf latest.tar.gz

mv  wordpress /var/www/

rm -rf latest.tar.gz

chown -R www-data:www-data /var/www/wordpress

chmod -R 755 /var/www/wordpress

echo "Starting Wordpress CLI install"

# wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

# sleep 5

# chmod +x wp-cli.phar
# mv wp-cli.phar /usr/local/bin/wp

# Télécharge directement wp-cli et WordPress
wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar
chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp core download --path=/var/www/wordpress --allow-root


# wp config create	--allow-root \
# 					--dbname=\'${DB_NAME}\' \
# 					--dbuser=\'${DB_USER}\' \
# 					--dbpass=\'${DB_PASS}\' \
# 					--dbhost='mariadb:3306' --path='/var/www/wordpress'


# download wordpress core files
# wp core download --allow-root
# create wp-config.php file with database details
wp core config --dbhost=mariadb:3306 --dbname="$DB_NAME" --dbuser="$DB_USER" --dbpass="$DB_PASS" --allow-root
# install wordpress with the given title, admin username, password and email
wp core install --url="$DOMAIN_NAME" --title="$WP_TITLE" --admin_user="$ADMIN_USER" --admin_password="$ADMIN_PASS" --admin_email="$ADMIN_EMAIL" --allow-root
#create a new user with the given username, email, password and role
# Available role: 'administrator', 'editor', 'author', 'contributor', 'subscriber'
wp user create "$SIMPLE_USER" "$SIMPLE_USER_EMAIL" --user_pass="$SIMPLE_USER_PASS" --role="$USER_ROLE"

mkdir -p /run/php
/usr/sbin/php-fpm7.4 -F

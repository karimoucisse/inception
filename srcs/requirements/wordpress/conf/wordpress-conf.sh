#!/bin/bash

echo "Starting Wordpress install"

echo "DB_NAME=$DB_NAME"
echo "DB_USER=$DB_USER"

if [ -z "$DB_NAME" ] || [ -z "$DB_USER" ] || [ -z "$DB_PASS" ] ; then
  echo "❌ Missing environment variables: DB_NAME, DB_USER, DB_PASS"
  env
  exit 1
fi

wget https://wordpress.org/latest.tar.gz

sleep 5

tar -xzvf latest.tar.gz

mv  wordpress /var/www/

rm -rf latest.tar.gz

chown -R www-data:www-data /var/www/wordpress

chmod -R 755 /var/www/wordpress

echo "Starting Wordpress CLI install"

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

sleep 5

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp config create	--allow-root \
					--dbname=\'${DB_NAME}\' \
					--dbuser=\'${DB_USER}\' \
					--dbpass=\'${DB_PASS}\' \
					--dbhost='mariadb:3306' --path='/var/www/wordpress'

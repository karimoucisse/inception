#!/bin/bash

WORDPRESS_PATH = '/var/www/wordpress'

echo "Starting Wordpress install"

wget https://wordpress.org/latest.tar.gz

sleep 5

tar -xzvf latest.tar.gz

# mv wordpress/* /var/www/

rm -rf latest.tar.gz

chown -R www-data:www-data /var/www/wordpress

chmod -R 755 /var/www/wordpress

echo "Starting Wordpress CLI install"

wget https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar

sleep 5

wp config create	--allow-root \
					--dbname=$SQL_DATABASE \
					--dbuser=$SQL_USER \
					--dbpass=$SQL_PASSWORD \
					--dbhost=mariadb:3306 --path=$WORDPRESS_PATH

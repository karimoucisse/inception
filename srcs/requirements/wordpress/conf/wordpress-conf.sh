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

chmod +x wp-cli.phar
mv wp-cli.phar /usr/local/bin/wp

wp config create	--allow-root \
					--dbname='wordpress' \
					--dbuser='test'\
					--dbpass='test123' \
					--dbhost='mariadb:3306' --path='/var/www/wordpress'

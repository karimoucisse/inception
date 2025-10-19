FROM debian:12

RUN apt-get update -y && apt-get upgrade -y && \
	apt-get install -y php-fpm\
	php-mysql\
	mariadb-client \
	wget

RUN mkdir -p /var/www

WORKDIR /var/www

EXPOSE 80

COPY conf/wordpress-conf.sh /var/www/wordpress-conf.sh

RUN chmod +x /var/www/wordpress-conf.sh


ENTRYPOINT [ "/var/www/wordpress-conf.sh" ]

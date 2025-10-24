FROM debian:12

RUN apt-get update -y && apt-get upgrade -y && \
	apt-get install -y php-fpm\
	php-mysql\
	mariadb-client \
	wget

RUN mkdir -p /var/www

# WORKDIR /var/www

EXPOSE 80

COPY conf/wordpress-conf.sh /wordpress-conf.sh

RUN chmod +x /wordpress-conf.sh


ENTRYPOINT [ "/wordpress-conf.sh" ]

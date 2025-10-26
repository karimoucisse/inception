FROM debian:13.0

RUN apt-get -y update && apt-get -y upgrade && \
	apt-get -y install nginx openssl

RUN mkdir -p /etc/nginx/sites-enabled/ /etc/nginx/sites-available/ /etc/nginx/tls \
			/var/www/site /var/www/wordpress

COPY conf/nginx.conf /etc/nginx/nginx.conf

# SSL CONF
RUN openssl req -x509 -nodes -days 365 -out /etc/nginx/tls/tls.crt \
	-keyout /etc/nginx/tls/tls.key \
	-subj "/C=FR/ST=IDF/L=Paris/O=42/OU=42/CN=login.42.fr"

COPY conf/tls/tls.conf /etc/nginx/sites-available/tls.conf
RUN ln -s /etc/nginx/sites-available/tls.conf /etc/nginx/sites-enabled/tls.conf

# WEB SITE CONF
# COPY content/index.html /var/www/site/
# COPY conf/sites/site.conf /etc/nginx/sites-available/site.conf
# RUN ln -s /etc/nginx/sites-available/site.conf /etc/nginx/sites-enabled/site.conf

RUN mkdir -p /var/www/wordpress
RUN chown -R www-data:www-data /var/www/wordpress

# EXPOSE 80 443

CMD ["nginx", "-g", "daemon off;"]




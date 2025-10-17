FROM debian:13.0

RUN apt-get update && apt-get upgrade -y

RUN apt-get install -y nginx openssl
RUN apt-get clean

RUN mkdir -p /etc/ssl/private
RUN mkdir -p /etc/ssl/certs
# sudo openssl req -x509 -nodes -days 365 -newkey rsa:2048 -keyout
# /etc/nginx/ssl/nginx-selfsigned.key -out /etc/nginx/ssl/nginx-selfsigned.crt


# RUN openssl req -x509 -nodes -out /etc/nginx/ssl/inception.crt -keyout \
#     /etc/ssl/inception.key -subj \
# 	"/C=MO/ST=KH/L=KH/O=42/OU=42/CN=domain_name.fr/UID=admin_name"

RUN bash $PWD/conf/tsl-key_gen.bash

# COPY ./conf/nginx.conf /etc/nginx/nginx.conf

ADD $PWD/conf/nginx.conf /etc/nginx/nginx.conf

EXPOSE 80
EXPOSE 443

CMD ["nginx", "-g", "daemon off;"]

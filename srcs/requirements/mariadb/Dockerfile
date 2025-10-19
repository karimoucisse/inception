FROM debian:12.0

RUN apt-get update -y && apt-get upgrade -y && \
	apt-get install -y mariadb-server

COPY conf/50-custom.conf /etc/mysql/mariadb.conf.d/50-custom.conf

EXPOSE 3306




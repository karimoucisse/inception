FROM debian:12.0

RUN apt-get -y update && apt-get -y upgrade && \
	apt-get -y install mariadb-server

RUN mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY conf/50-custom.conf /etc/mysql/mariadb.conf.d/50-custom.conf


EXPOSE 3306

COPY conf/mariadb-conf.sh /mariadb-conf.sh

RUN chmod +x /mariadb-conf.sh

ENTRYPOINT ["./mariadb-conf.sh"]


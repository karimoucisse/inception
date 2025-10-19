FROM debian:12.0

RUN apt-get update -y && apt-get upgrade -y && \
	apt-get install -y mariadb-server && \
	mkdir -p /run/mysqld && chown -R mysql:mysql /run/mysqld

COPY conf/50-custom.conf /etc/mysql/mariadb.conf.d/50-custom.conf


EXPOSE 3306

COPY conf/mariadb-conf.sh /mariadb-conf.sh

RUN chmod +x /mariadb-conf.sh

ENTRYPOINT ["./mariadb-conf.sh"]


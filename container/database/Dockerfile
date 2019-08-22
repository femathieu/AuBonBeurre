FROM ubuntu:18.04

RUN apt-get update
RUN apt-get install vim -y
RUN apt-get install mariadb-server -y

COPY ./container/database/start.sh /
COPY ./container/database/database_user.sql /
COPY ./container/database/AUBONBEURRE.sql /

RUN sed -i -e "s/bind-address\s*=\s*127.0.0.1/bind-address = 0.0.0.0/g" /etc/mysql/mariadb.conf.d/50-server.cnf

CMD ["/bin/bash", "/start.sh"]

#
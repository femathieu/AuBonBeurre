FROM debian:9.9

RUN apt-get update -y
RUN apt-get upgrade -y

RUN apt-get install build-essential libssl-dev zlib1g-dev -y
RUN apt-get install libbz2-dev libreadline-dev libsqlite3-dev wget curl llvm -y
RUN apt-get install libncurses5-dev libncursesw5-dev xz-utils tk-dev -y
RUN apt-get install cron -y

RUN wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz
RUN tar xzf Python-3.7.4.tgz -C /usr/src

WORKDIR /usr/src/Python-3.7.4
RUN ./configure --enable-optimizations
RUN make altinstall

RUN apt-get install vim -y
RUN mkdir /opt/aubonbeurre

##RUN python3.7 -m pip install pip
RUN python3.7 -m pip install --upgrade pip
RUN python3.7 -m pip install PyMySQL

COPY ./container/unity/start.sh /

EXPOSE 15555

CMD ["/bin/bash", "/start.sh"]

FROM debian:9.9

RUN apt-get update -y
RUN apt-get install build-essential -y && apt-get install libncurses5-dev libgdbm-dev libnss3-dev libssl-dev libreadline-dev libffi-dev -y && apt-get install zlib1g -y && apt-get install wget -y 

WORKDIR /usr/src
RUN wget https://www.python.org/ftp/python/3.7.4/Python-3.7.4.tgz

RUN tar xzf Python-3.7.4.tgz

WORKDIR Python-3.7.4
RUN ./configure --enable-optimizations
RUN make altinstall
# RUN make
# RUN make install

COPY ./container/unity/start.sh /

CMD ["/bin/bash", "/start.sh"]

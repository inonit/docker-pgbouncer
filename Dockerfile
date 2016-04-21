FROM            debian:jessie
MAINTAINER      Inonit AS <support@inonit.no>
ENV             VERSION 1.7.2


RUN             apt-get update && apt-get upgrade -y
RUN             apt-get install -yq \
                    automake autoconf build-essential libevent-dev libssl-dev libc-ares-dev

ADD             https://pgbouncer.github.io/downloads/files/1.7.2/pgbouncer-1.7.2.tar.gz /usr/local/src
RUN             tar -zxvf /usr/local/src/pgbouncer-1.7.2.tar.gz -C /usr/local/src

WORKDIR         /usr/local/src/pgbouncer-1.7.2
RUN             ./configure --prefix=/usr/local --with-libevent=/usr/lib --with-cares=/usr/lib --with-openssl=/usr/lib
RUN             make && make install
RUN             mkdir -p /etc/pgbouncer

EXPOSE          6432/tcp

ENTRYPOINT      ["pgbouncer"]
CMD             ["/etc/pgbouncer/pgbouncer.ini"]

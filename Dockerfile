FROM ubuntu
RUN  apt-get update
RUN  DEBIAN_FRONTEND=noninteractive apt-get -y install make gcc libssl-dev
ADD  . /opt/nicedocker
RUN  cd /opt/nicedocker/src && make TARGET=linux2628 USE_OPENSSL=1 && make PREFIX=/usr/local/haproxy install
RUN  useradd haproxy
ADD  conf /etc/haproxy

EXPOSE  80 443
CMD  ["/opt/nicedocker/run.sh"]

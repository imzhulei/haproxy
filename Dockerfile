FROM ubuntu
#RUN  apt-get update
#RUN  DEBIAN_FRONTEND=noninteractive apt-get -y install haproxy
ADD  . /opt/nicedocker
RUN  cd /opt/nicedocker/src && make TARGET=linux2628 USE_OPENSSL=1 && make PREFIX=/usr/local/haproxy install
ADD  ./haproxy.cfg /etc/haproxy/haproxy.cfg
EXPOSE  80
CMD  ["/usr/local/haproxy/sbin/haproxy", "-f", "/etc/haproxy/haproxy.cfg"]

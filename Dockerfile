FROM ubuntu
RUN  apt-get update
RUN  DEBIAN_FRONTEND=noninteractive apt-get -y install haproxy
RUN  sed -i 's/ENABLED=0/ENABLED=1/' /etc/default/haproxy

ADD  ./haproxy.cfg /etc/haproxy/haproxy.cfg
ADD  . /opt/nicedocker
EXPOSE  80
CMD  ["haproxy", "-db", "-f", "/etc/haproxy/haproxy.cfg"]

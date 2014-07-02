FROM ubuntu
RUN  apt-get update
RUN  DEBIAN_FRONTEND=noninteractive apt-get -y install haproxy
ADD  ./haproxy.cfg /etc/haproxy/haproxy.cfg
ADD  . /opt/nicedocker
EXPOSE  80
CMD  ["haproxy", "-f", "/etc/haproxy/haproxy.cfg"]

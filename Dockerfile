FROM ubuntu
RUN  apt-get update
RUN  DEBIAN_FRONTEND=noninteractive apt-get -y install haproxy
ADD  . /opt/nicedocker
ADD  haproxy.cfg /etc/haproxy/haproxy.cfg

EXPOSE  80 443
CMD  ["/opt/nicedocker/run.sh"]

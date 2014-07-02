haproxy
=======

soft loadbalancer, support L4/L7

Build
-----

  docker build -t nicescale/haproxy .

Run
-----

  docker run -d -p 80:80 nicescale/haproxy

You can put your conf in volume for editting, and add frontend/backend to haproxy.cfg

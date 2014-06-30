#!/bin/bash

docker run  -d -v $HOME/haproxy.cfg:/etc/haproxy/haproxy.cfg -p 80:80 nicescale/haproxy

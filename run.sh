#!/bin/sh

HAPROXY=/usr/sbin/haproxy
CONF=/etc/haproxy/haproxy.cfg

grep -E "stats auth" $CONF | grep -q '{random}' &&
PASS=$(echo `for i in {1..5}; do echo $RANDOM; done`|md5sum|cut -c1-10) &&
sed -i "s/{random}/$PASS/" $CONF &&
echo "Your haproxy stats password: $PASS"

exec $HAPROXY -f $CONF

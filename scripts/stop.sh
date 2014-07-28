#!/bin/bash

set -e

HAPROXY=/usr/local/haproxy/sbin/haproxy
CONF=/etc/haproxy/haproxy.cfg

get_sid() {
  cdir=`dirname $0`
  cd $cdir/..
  tdir=`pwd`
  sid=`basename $tdir`
  echo $sid
}

sid=`get_sid`
if docker top $sid > /dev/null; then
  /usr/local/bin/nicedocker exec $sid sh -c "$HAPROXY -f $CONF -sf \$(ps ax|grep haprox[y]|cut -c1-5)"
  count=0
  while [ $count -lt 15 ]; do
    docker ps | grep -q $sid || break
    sleep 0.5
    count=$((count+1))
  done
  docker top $sid > /dev/null 2>&1 && docker kill $sid
else
  echo service $sid no run.
fi

exit 0

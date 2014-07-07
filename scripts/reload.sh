#!/bin/bash

HAPROXY=/usr/local/haproxy/sbin/haproxy
CONF=/etc/haproxy/haproxy.cfg
PID=/var/run/haproxy.pid

get_sid() {
  cdir=`dirname $0`
  cd $cdir/..
  tdir=`pwd`
  sid=`basename $tdir`
  echo $sid
}

sid=`get_sid`
/usr/local/bin/nicedocker exec $sid sh -c "$HAPROXY -f $CONF -p $PID -sf \$(cat $PID)"

#!/bin/bash

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
/usr/local/bin/nicedocker exec $sid sh -c "$HAPROXY -f $CONF -sf \$(ps ax|grep haprox[y]|cut -c1-5)"

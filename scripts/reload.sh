#!/bin/bash

get_sid() {
  cdir=`dirname $0`
  cd $cdir/..
  tdir=`pwd`
  sid=`basename $tdir`
  echo $sid
}

sid=`get_sid`
/usr/local/bin/nicedocker exec $sid sh -c '/usr/local/haproxy/sbin/haproxy -f /etc/haproxy/haproxy.cfg -p /var/run/haproxy.pid -sf `cat /var/run/haproxy.pid`'

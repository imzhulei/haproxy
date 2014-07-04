#!/bin/bash

CONFIG=/etc/haproxy/haproxy.cfg
PID=/var/run/haproxy.pid

gen_conf() {
  cd /etc/haproxy

  cat global.cfg >> $CONFIG
  echo >> $CONFIG
  for l in $(ls listen); do
    echo "# $l" >> $CONFIG
    cat listen/$l >> $CONFIG
    echo >> $CONFIG
  done

  for fb in $(ls frontback); do
    echo "# $fb" >> $CONFIG
    cat frontback/$fb >> $CONFIG
    echo >> $CONFIG
  done
}

gen_conf

if [ -z "$1" ]; then
  exec /usr/local/haproxy/sbin/haproxy -f $CONFIG -p $PID
elif [ "$1" = "reload" ]; then
  /usr/local/haproxy/sbin/haproxy -f $CONFIG -p $PID -sf `cat $PID`
fi

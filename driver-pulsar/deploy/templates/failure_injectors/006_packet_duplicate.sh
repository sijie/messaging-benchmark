#!/bin/bash

tc -p qdisc ls dev eth0 | grep netem
RC=$?

if [[ $RC -eq 0 ]]; then
  tc qdisc del dev eth0 root netem
fi

echo "injecting network packet duplication for 10 mins - 'tc qdisc add dev eth0 root netem duplicate 10%'"
tc qdisc add dev eth0 root netem duplicate 10%
sleep 600
echo "10 mins elapsed. network packet duplication is done."
tc qdisc del dev eth0 root netem

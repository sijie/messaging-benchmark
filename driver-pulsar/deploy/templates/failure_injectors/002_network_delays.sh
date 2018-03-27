#!/bin/bash

tc -p qdisc ls dev eth0 | grep netem
RC=$?

if [[ $RC -eq 0 ]]; then
  tc qdisc del dev eth0 root netem
fi

echo "injecting network delays for 5 mins - 'tc qdisc add dev eth0 root netem delay 100ms 20ms distribution normal'"
tc qdisc add dev eth0 root netem delay 100ms 20ms distribution normal
sleep 300
echo "5 mins elapsed. network delay injection is done."
tc qdisc del dev eth0 root netem

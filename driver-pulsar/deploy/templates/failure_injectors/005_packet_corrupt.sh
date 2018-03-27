#!/bin/bash

tc -p qdisc ls dev eth0 | grep netem
RC=$?

if [[ $RC -eq 0 ]]; then
  tc qdisc del dev eth0 root netem
fi

echo "injecting network packet corruption for 10 mins - 'tc qdisc add dev eth0 root netem corrupt 10%'"
tc qdisc add dev eth0 root netem corrupt 10%
sleep 300
echo "10 mins elapsed. network packet corruption injection is done."
tc qdisc del dev eth0 root netem

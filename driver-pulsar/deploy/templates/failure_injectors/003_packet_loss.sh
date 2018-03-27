#!/bin/bash

tc -p qdisc ls dev eth0 | grep netem
RC=$?

if [[ $RC -eq 0 ]]; then
  tc qdisc del dev eth0 root netem
fi

echo "injecting packet loss for 10 mins - 'tc qdisc add dev eth0 root netem loss 0.3% 25%'"
tc qdisc add dev eth0 root netem loss 0.3% 25%
sleep 600
echo "10 mins elapsed. network packet loss injection is done."
tc qdisc del dev eth0 root netem

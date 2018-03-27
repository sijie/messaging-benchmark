#!/bin/bash

tc -p qdisc ls dev eth0 | grep netem
RC=$?

if [[ $RC -eq 0 ]]; then
  tc qdisc del dev eth0 root netem
fi

echo "injecting variants of network failures for 10 mins - 'tc qdisc add dev eth0 root netem delay 50ms reorder 25% 50% loss 2%'"
tc qdisc add dev eth0 root netem delay 50ms reorder 25% 50% loss 2%
sleep 600
echo "10 mins elapsed. network failure injection is done."
tc qdisc del dev eth0 root netem

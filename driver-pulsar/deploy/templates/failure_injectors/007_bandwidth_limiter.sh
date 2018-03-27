#!/bin/bash

tc -p qdisc ls dev eth0 | grep tbf
RC=$?

if [[ $RC -eq 0 ]]; then
  tc qdisc del dev eth0 root tbf rate 400mbit burst 32kbit latency 200ms
fi

echo "limiting network bandwidth to 400mbit for 5 mins - 'tc qdisc add dev eth0 root tbf rate 400mbit burst 32kbit latency 200ms'"
tc qdisc add dev eth0 root tbf rate 400mbit burst 32kbit latency 200ms
sleep 300
echo "5 mins elapsed. limiting network bandwidth is done."
tc qdisc del dev eth0 root tbf rate 400mbit burst 32kbit latency 200ms

#!/bin/bash

PID=`ps aux | grep java | grep PulsarBrokerStarter | awk '{ print $2 }'`
if [[ "$PID" == "" ]]; then
    echo "Broker process is not found. Exiting ..."
    exit 1
fi
echo "Killing broker $PID"
kill -9 $PID
echo "Killed broker $PID"

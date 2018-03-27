# !/bin/bash

PID=`ps aux | grep java | grep BookieServer | awk '{ print $2 }'`
if [[ "$PID" == "" ]]; then
    echo "Bookie process is not found. Exiting ..."
    exit 1
fi
echo "Killing bookie $PID"
kill -9 $PID
echo "Killed bookie $PID"

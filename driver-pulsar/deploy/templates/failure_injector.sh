#!/bin/bash

FILES=$1

NUM_INJECTORS=`ls $FILES | wc -l | tr -d '[:space:]'`
echo "There are ${NUM_INJECTORS} injectors available."

INJECTOR_ID=$(( ( RANDOM % $((NUM_INJECTORS)) ) ))
INJECTOR_ID_PREFIX=`printf "%03d" $INJECTOR_ID`
INJECTOR_FILE=`ls $FILES | grep $INJECTOR_ID_PREFIX`

echo "Picked up failure injector $INJECTOR_ID - $INJECTOR_FILE"

DELAY_MINS=$(( ( RANDOM % 40 ) ))
DELAY_SECONDS=$(( $((DELAY_MINS)) * 60))

echo "Delay executing failure injector in ${DELAY_SECONDS} seconds."
sleep ${DELAY_SECONDS}

$FILES/$INJECTOR_FILE

echo "Finished running failure injector : $FILES/$INJECTOR_FILE"

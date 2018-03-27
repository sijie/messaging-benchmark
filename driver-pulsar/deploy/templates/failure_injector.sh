#!/bin/bash
#
# Licensed to the Apache Software Foundation (ASF) under one
# or more contributor license agreements.  See the NOTICE file
# distributed with this work for additional information
# regarding copyright ownership.  The ASF licenses this file
# to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance
# with the License.  You may obtain a copy of the License at
#
#   http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing,
# software distributed under the License is distributed on an
# "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
# KIND, either express or implied.  See the License for the
# specific language governing permissions and limitations
# under the License.
#


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

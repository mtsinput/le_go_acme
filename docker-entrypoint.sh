#!/bin/bash

set -e
legobin=/usr/bin/lego

>&2 echo running: "$legobin" "$@"
let pause=$OBTAIN_PERIOD_HOURS*60*60
>&2 echo "Will be wait for $pause seconds between renew"

#set -m

while true

do

>&2 echo "Try to obtain certificate"
>&2 exec "$legobin" "$@"

sleep $pause

done &

while true; do sleep 60 ; echo "Waiting for next renew run..."; done

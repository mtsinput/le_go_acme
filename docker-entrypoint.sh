#!/bin/bash

set -e

legobin=/usr/bin/lego

>&2 echo running: "$legobin" "$@"
>&2 echo "Will be wait for $OBTAIN_PERIOD_HOURS hours between renew"
counter=0

while [[ true ]];
do sleep 3600;
  if [[ "$counter" == "$OBTAIN_PERIOD_HOURS" ]]; 
  then
	echo "Start obtain certificate" &&
	exec "$legobin" "$@" &
	let counter=0 &&
	echo "Finish obtain certificate"
  else
	let counter=$counter+1 &&
	let remainh=$OBTAIN_PERIOD_HOURS-$counter &&
	echo "Next renew after $remainh hours"
  fi;
done &

while [[ true ]]; do sleep 3600 ; echo "Waiting for next renew run..."; done

#!/usr/bin/env bash

#create a loop that asks names until given a right one, the loop will stop
while read -p "Mata in ett namn " name ; do
	if  [ "${name}" = "stop" ] ; then
		echo "Du valde att avsluta programmet."
		break
	fi
	echo "Du skrev in ${name}"
	echo "Nu fortsätter programmet..."

done

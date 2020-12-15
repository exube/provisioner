#!/bin/bash

function exit_fail {
	1>&2 echo "$1"
	exit 1
}

if [ -z "$1" -o -z "$2" ]; then
	exit_fail "Usage: $0 <MMDD> <hh:MM:SS> [AM/PM]"
fi

casino_date="$1"
casino_logname="${casino_date}_Dealer_schedule"
casino_time="$2 $3"

if [ ! -f "$casino_logname" ]; then
	exit_fail "Date not found: '$casino_date'"
fi

grep -Gi "$casino_time" "$casino_logname" | awk -F $'\t' '{print $1 "," $3;}'

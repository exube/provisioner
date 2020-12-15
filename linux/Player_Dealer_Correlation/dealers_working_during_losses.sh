#!/bin/bash

casino_losses="$(grep -H -E -- '[[:blank:]]-' Player_Analysis/[0-9]* | tee "Player_Analysis/Roulette_Losses" | sed -E 's@^[^/]*/([0-9]{4})[^:]+:@\1\t@')"
while IFS=$'\t' read -r casino_date casino_time UNUSED; do
	casino_dealer=$(grep "$casino_time" "Dealer_Analysis/${casino_date}_Dealer_schedule" | awk 'BEGIN {FS="\t";} {print $3;}')
	echo "$casino_date,$casino_time,$casino_dealer"
done <<< "$casino_losses"

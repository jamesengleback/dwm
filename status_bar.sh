#!/bin/bash

while true
do
	charge=$(cat /sys/class/power_supply/BAT0/capacity)
	connected=$(cat /sys/class/power_supply/BAT0/status)
	if [ "$connected" = "Charging" ];then
		icon='⚡'
	else
		icon=' '
	fi
	if [[ $charge -lt 15 ]]; then
		warning='⚠ '
	else
		warning='  '
	fi
	xsetroot -name "$warning $icon $charge% $(date)"
	sleep 1
done

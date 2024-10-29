#!/bin/bash

speed=$(awk -F': ' '/cpu MHz/ {sum += $2; count++} END {printf "%.2f", sum/count/1000}' /proc/cpuinfo)
temp=$(sensors | awk '/^Package id 0:/ {print int($4)}' | tr -d '+')
load=$(cat /proc/loadavg | awk '{print $1}')
echo "${load} - ${temp}°C"

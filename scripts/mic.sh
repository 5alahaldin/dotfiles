#!/bin/bash

arg=$1
[ $arg = "up"     ] && amixer set Capture 5%+
[ $arg = "down"   ] && amixer set Capture 5%-
[ $arg = "toggle" ] && amixer set Capture toggle

pkill -RTMIN+29 dwmblocks
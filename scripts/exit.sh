#!/bin/bash

choice=$(printf "Reboot\nShutdown\nSleep\nHibernate" | dmenu -i -p "Choose action: ") 
case "$choice" in
    "Reboot")     doas reboot ;;
    "Shutdown")   doas shutdown now ;;
    "Sleep")      doas systemctl suspend ;;
    "Hibernate")  doas systemctl hibernate ;;
esac
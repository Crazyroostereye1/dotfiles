#!/bin/bash

while true; do
docked=$(lsusb | grep "Dell dock" | xargs)
echo $docked
if [ -n $docked ];
then
  echo "Not Docked"
  hyprctl keyword unbind ,switch:on:Lid Switch
  hyprctl keyword unbind ,switch:off:Lid Switch
  hyprctl keyword bind ,switch:on:Lid Switch,exec,swaylock -S --effect-blur 5x5 --clock --indicator-idle-visible
else
  echo "Docked"
  hyprctl keyword unbind ,switch:on:Lid Switch
  hyprctl keyword bind ,switch:on:Lid Switch,exec,hyprctl keyword monitor "eDP-1, disable"
  hyprctl keyword bind ,switch:off:Lid Switch,exec,hyprctl keyword monitor "eDP-1,2256x1504@60.0,0x1560,1.0"
fi
sleep 1
done

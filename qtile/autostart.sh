#!/usr/bin/env bash

picom  &
cbatticon  -i notification /sys/class/power_supply/BAT1 &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
xfce4-power-manager &
dunst &
nm-applet &


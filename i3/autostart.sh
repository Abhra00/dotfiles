#!/usr/bin/env bash

set-bg &
picom  &
/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
xfce4-power-manager &
dunst &
nm-applet &


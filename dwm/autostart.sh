#!/bin/sh

# Start dwmblocks status bar
dwmblocks&

# Remap caps lock key to function as escape
setxkbmap -option caps:escape

# Set the keyboard repeat rate to be faster
xset r rate 200 30

# Start the compositor
picom --experimental-backend&

# Set appropriate monitor layout
autorandr -c

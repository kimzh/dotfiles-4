#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

#export fg_a="#FF93a1a1"
#export bg_a="#FF002b36"
#export fg_prefix_a="#FFcb4b16"
#export sep_a="#FF2aa198"
#export bar_primary_a="#FF93a1a1"
#export bar_seperator_a="#FF268bd2"
#export bar_secondary_a="#FF657b83"
#
#export i3_a="#FFb58900"
#export inet_prefix_a="#FFcb4b16"
#export inactive_prefix_a="#FF586e75"
#export active_prefix_a="#FF859900"
#export mpd_prefix_a="#FF839496"
#export vol_prefix_a="#FF6c71c4"
#export cpu_prefix_a="#FF268bd2"
#export mem_prefix_a="#FF2aa198"
#export bat_prefix_a="#FFdc322f"
#export time_a="#FF859900"

#source ~/.cache/wal/colors.sh
#color: #FF${color0/'#'}
#export fg_a="#FF${color15/'#'}"
#export bg_a="#AA${color0/'#'}"
#export fg_prefix_a="#FFcb4b16"
#export sep_a="#FF2aa198"
#export bar_primary_a="#FF93a1a1"
#export bar_seperator_a="#FF268bd2"
#export bar_secondary_a="#FF657b83"

#export i3_a="#FF${color6/'#'}"
#export inet_prefix_a="#FF${color7/'#'}"
#export inactive_prefix_a="#FF${color4/'#'}"
#export active_prefix_a="#FF${color14/'#'}"
#export mpd_prefix_a="#FF"${color8/'#'}
#export vol_prefix_a="#FF${color9/'#'}"
#export cpu_prefix_a="#FF${color10/'#'}"
#export mem_prefix_a="#FF${color11/'#'}"
#export bat_prefix_a="#FF${color12/'#'}"
#export time_a="#FF${color13/'#'}"



# Launch bars depending on which machine I'm on

if [ "$(hostname -s)" = "beryllium" ]; then
	polybar barl &
	polybar barr &
    polybar barc &
else
	polybar bar0 &
    if [ "$(autorandr | grep '(current)' | cut -d ' ' -f 1)" = "lghtop" ]; then
        polybar bar1lgh &
    else
        polybar bar1 &
    fi
fi

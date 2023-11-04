#!/usr/bin/env bash

/usr/bin/pactl set-sink-volume 0 +5%
pkill -n sleep

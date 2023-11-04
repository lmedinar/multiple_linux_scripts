#!/usr/bin/env bash

/usr/bin/pactl set-sink-mute 0 toggle
pkill -n sleep

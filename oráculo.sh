#!/usr/bin/bash

echo "$(shuf -n $1 ~/scripts/dics/combinado --random-source=/dev/urandom | tr '\n' ' ')"

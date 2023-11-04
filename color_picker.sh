#!/usr/bin/env bash

colorpicker --one-shot | awk '{print $9}' | tail -c +2 | head -c -1 | xsel -ib

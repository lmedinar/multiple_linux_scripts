#!/bin/bash
find /usr/share/man/man1 -type f | shuf | awk -F '/' '/1/ {print $6}' | sed 's/.gz//g'| head -5 | dmenu -i -p 'Manuales aleatorios generados: ' | xargs urxvt -e man

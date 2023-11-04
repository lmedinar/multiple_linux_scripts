#!/usr/bin/env bash

current=$(setxkbmap -query | awk 'FNR == 3 { print $2 }')
if [ $current == "latam" ]
then
    setxkbmap -layout es mac
    echo "Se ha cambiado el layout a 'es mac'."
else
    setxkbmap latam   
    echo "Se ha cambiado el layout a 'latam'."
fi

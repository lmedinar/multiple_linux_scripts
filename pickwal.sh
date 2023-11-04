#!/bin/bash
cd $HOME/scripts
var=$(ls *wall.sh | dmenu -nb "#550000" -nf "#FF9999" -sb "#992222" -i -p 'Cambiar wallpaper con: ')
bash $HOME/scripts/$var

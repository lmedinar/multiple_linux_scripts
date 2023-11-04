#!/bin/bash
# Gives a dmenu promt to mount unmounted drives
# if they are in fstab they are mounted automatically
# otherwise, you'll be prompted to give a mountpoint to a directory
# enetering a new directory will promt to create it

pgrep -x dmenu && exit
# mountable=$(blkid -o list | grep "not mounted" | awk '{print $1;}')
mountable=$(lsblk -lp -o NAME,SIZE,MOUNTPOINTS | awk '$1~/[[:digit:]]/ && $3 == ""')
[[ "$mountable" = "" ]] && exit 1
chosen=$(echo "$mountable" | dmenu -i -p "¿Qué dispositivo montar?" -nb "#550000" -nf "#FF9999" -sb "#992222" | awk '{print $1}')
[[ "$chosen" = "" ]] && exit 1
#lxsu -d mount "$chosen" && exit 0

# dirs=$(find mp/* -type d -maxdepth 0 2>/dev/null)
# mountpoint=$(echo "$dirs" | dmenu -i -p "Seleccione punto de montaje." -nb "#550000" -nf "#FF9999" -sb "#992222")
# [[ "$mountpoint" = "" ]] && exit 1
# if [[ ! -d "$mountpoint" ]]; then
#     mkdiryn=$(echo -e "No\nSí" | dmenu -i -p "$mounpoint no existe. ¿Crearlo?")
#     [[ "$mkdiryn" = Sí ]] && sudo mkdir -p "$mountpoint"
# fi

# lxsu -d mount -o user,rw $chosen $mountpoint && pgrep -x dunst && notify-send "$chosen fue montado en $mountpoint/"
# lxsu -d mount -o relatime,utf8,user,flush,gid=100,dmask=000,fmask=111 $chosen $mountpoint && pgrep -x dunst && notify-send "$chosen fue montado en $mountpoint/"
udisksctl mount -b $chosen && notify-send "$chosen fue montado en /run/media/"

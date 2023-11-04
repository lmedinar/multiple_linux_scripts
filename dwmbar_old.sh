#!/usr/bin/env bash

espera_actualizacion="2s"
espera_act_seg=2
bytes_viejos=0
max_light=$(cat /sys/class/backlight/intel_backlight/max_brightness)
counter=0
disp_updates=0
cmus_status=""
cmus_song="--"

while true; do
    current_light=$(cat /sys/class/backlight/intel_backlight/actual_brightness)
    stat_conn=$(nmcli device | awk 'NR==2 { print $3 }')
    name_conn=$(nmcli device | awk 'NR==2 { print $4 }')
    disp_fecha=$(date +"%d/%m/%y : %A")
    disp_vol=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))
    disp_hora=$(date +%H:%M)
    bytes_lo=$(awk 'NR==3 { print $2}' /proc/net/dev )
    bytes_et=$(awk 'NR==4 { print $2}' /proc/net/dev )
    bytes_wr=$(awk 'NR==5 { print $2}' /proc/net/dev )
    bytes_nuevos=$((bytes_et+bytes_lo+bytes_wr))
    vel_bytes=$(echo "scale=1; ($bytes_nuevos-$bytes_viejos)/1000/$espera_act_seg" | bc -l)
    bytes_viejos="$bytes_nuevos"
    light_percent=$(echo "scale=0; $current_light*100/$max_light" | bc -l)
    cpu_usado=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')
    mem_usada=$(free -t | awk 'NR == 2 {printf "%.1f", $3/$2*100}')
    disp_temp=$(sensors -u | awk 'NR == 29 {printf "%.0f", $2}')
    disp_batt=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk 'NR==20 {print $2}')
    
    if [ "$stat_conn" = "conectado" ]
    then
        disp_conn="$name_conn : $vel_bytes kb/s"
    else
        disp_conn="Desconectado"
    fi
        
    if (( counter % 2000 == 0 )) # Revisamos cada 66 minutos
    then
        disp_updates=$( pacman -Qu | wc -l )
    fi
    counter=$(( counter + 1 ))

    if [ "$(cmus-remote -Q | awk 'NR==1 {print $1}')" = "status" ]
    then
        c_stat=$(cmus-remote -Q | awk 'NR==1 { printf $2 }')
        case $c_stat in
            stopped)
                cmus_status="⏹"
                ;;
            playing)
                cmus_status="▶"
                ;;
            paused)
                cmus_status="⏸"
                ;;
            *)
                cmus_status="🎵"
        esac

        if [ $(cmus-remote -Q | awk 'NR==7 { printf $2 }') = "title" ]
        then
            nombre_can=$(cmus-remote -Q | awk 'NR==7')
            # cmus_song="$( echo $nombre_can | cut -d" "  -f3- )" # No sirve si hay asteríscos
            nombre_can=$(echo "${nombre_can#* }")
            cmus_song=$(echo "${nombre_can#* }")
        fi
    else
        cmus_status="🎵"
        cmus_song="Sin música"
    fi


    
    xsetroot -name "$cmus_status $cmus_song | 📶 $disp_conn | 🔊 $disp_vol | ☀ $light_percent% | 🔥 $disp_temp °C | ⊡ $cpu_usado | ⊞ $mem_usada% | ▼: $disp_updates | 🔋 $disp_batt | 📅 $disp_fecha | 🕝 $disp_hora"
    sleep $espera_actualizacion
done

#!/usr/bin/env bash

espera_actualizacion="1s"
espera_act_seg=2.3
bytes_lo=$(awk 'NR==3 { print $2}' /proc/net/dev )
bytes_et=$(awk 'NR==4 { print $2}' /proc/net/dev )
bytes_wr=$(awk 'NR==5 { print $2}' /proc/net/dev )
bytes_descarga_viejos=$((bytes_et+bytes_lo+bytes_wr))
max_light=$(cat /sys/class/backlight/intel_backlight/max_brightness)
# counter=0 # Usado para monitorear updates
# disp_updates=0 # Usado para monitorear updates
cmus_status=""
cmus_song="--"
continuar_barra=1
(
while true; do
    ky_layout=$(setxkbmap -query | awk 'FNR == 3 { print $2 }')
    current_light=$(cat /sys/class/backlight/intel_backlight/actual_brightness)
    stat_conn=$(nmcli device | awk 'NR==2 { print $2 }')
    name_conn=$(nmcli device | awk 'NR==2 { print $4 }')
    disp_fecha=$(date +"%A   %d/%m/%y")
    disp_hora=$(date +%H:%M)
    bytes_lo=$(awk 'NR==3 { print $2}' /proc/net/dev )
    bytes_et=$(awk 'NR==4 { print $2}' /proc/net/dev )
    bytes_wr=$(awk 'NR==5 { print $2}' /proc/net/dev )
    subida_lo=$(awk 'NR==3 { print $10}' /proc/net/dev )
    subida_et=$(awk 'NR==4 { print $10}' /proc/net/dev )
    subida_wr=$(awk 'NR==5 { print $10}' /proc/net/dev )
    bytes_descarga_nuevos=$((bytes_et+bytes_lo+bytes_wr))
    bytes_subida_nuevos=$((subida_et+subida_lo+subida_wr))
    vel_bytes_descarga=$(echo "scale=1; ($bytes_descarga_nuevos-$bytes_descarga_viejos)/1000/$espera_act_seg" | bc -l)
    vel_bytes_subida=$(echo "scale=1; ($bytes_subida_nuevos-$bytes_subida_viejos)/1000/$espera_act_seg" | bc -l)
    bytes_descarga_viejos="$bytes_descarga_nuevos"
    bytes_subida_viejos="$bytes_subida_nuevos"
    light_percent=$(echo "scale=0; $current_light*100/$max_light" | bc -l)
    cpu_usado=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1"%"}')
    mem_usada=$(free -t | awk 'NR == 2 {printf "%.1f", $3/$2*100}')
    disp_temp=$(sensors -u | awk 'NR == 48 {printf "%.0f", $2}')
    disp_batt=$(upower -i /org/freedesktop/UPower/devices/battery_BAT0 | awk 'NR==20 {print $2}')
    estado_caps=$(xset -q | grep Caps | awk '{ print $4 }')

    if [ "$estado_caps" = "on" ]
    then
	disp_caps="◆"
    else
	disp_caps="◇"
    fi

    disp_conn="$name_conn ⯆$vel_bytes_descarga kb/s ⯅$vel_bytes_subida kb/s"


    # Usado para monitorear updates
    # if (( counter % 2000 == 0 )) # Revisamos cada 66 minutos
    # then
        # disp_updates=$( pacman -Qu | wc -l )
    # fi
    # counter=$(( counter + 1 ))

    if [ "$(cmus-remote -Q | awk 'NR==1 {print $1}')" = "status" ]
    then
        c_stat=$(cmus-remote -Q | awk 'NR==1 { printf $2 }')
        case $c_stat in
            stopped)
                cmus_status="■"
                ;;
            playing)
                cmus_status="▶"
                ;;
            paused)
                cmus_status="‖"
                ;;
            *)
                cmus_status="🎧"
        esac

        title_found=0
        if [ $(cmus-remote -Q | awk 'NR==7 { printf $2 }') = "title" ]
        then
            title_found=1
            nombre_can=$(cmus-remote -Q | awk 'NR==7')
            # cmus_song="$( echo $nombre_can | cut -d" "  -f3- )" # No sirve si hay asteríscos
            nombre_can=$(echo "${nombre_can#* }") # eliminamos primeras palabras
            nombre_can=$(echo "${nombre_can#* }")
            cmus_song=$(echo "$nombre_can") # el nombre al final
            caract=$(echo $cmus_song | wc -c)
            if (( caract > 28 ))
            then
                cmus_song="${nombre_can:0:28}…" # cortamos el string para que no quede largo
            fi
        fi
        if [ $(cmus-remote -Q | awk 'NR==8 { printf $2 }') = "title" ]
        then
            title_found=1
            nombre_can=$(cmus-remote -Q | awk 'NR==8')
            # cmus_song="$( echo $nombre_can | cut -d" "  -f3- )" # No sirve si hay asteríscos
            nombre_can=$(echo "${nombre_can#* }") # eliminamos primeras palabras
            nombre_can=$(echo "${nombre_can#* }")
            cmus_song=$(echo "$nombre_can") # el nombre al final
            caract=$(echo $cmus_song | wc -c)
            if (( caract > 28 ))
            then
                cmus_song="${nombre_can:0:28}…" # cortamos el string para que no quede largo
            fi
        fi
        if [ $(cmus-remote -Q | awk 'NR==9 { printf $2 }') = "title" ]
        then
            title_found=1
            nombre_can=$(cmus-remote -Q | awk 'NR==9')
            # cmus_song="$( echo $nombre_can | cut -d" "  -f3- )" # No sirve si hay asteríscos
            nombre_can=$(echo "${nombre_can#* }") # eliminamos primeras palabras
            nombre_can=$(echo "${nombre_can#* }")
            cmus_song=$(echo "$nombre_can") # el nombre al final
            caract=$(echo $cmus_song | wc -c)
            if (( caract > 28 ))
            then
                cmus_song="${nombre_can:0:28}…" # cortamos el string para que no quede largo
            fi
        fi
        if (( title_found == 0 ))
        then
            cmus_song="Sin título…"
        fi
    else
        cmus_status="🎧"
        cmus_song="---"
    fi

    muted_status=$( pacmd list-sinks | awk '/muted/ { print $2 }' | awk 'NR==1' )
    if  [ $muted_status = "yes" ]
    then
	disp_vol="MUTE"
    else
        disp_vol=$(awk -F"[][]" '/Left:/ { print $2 }' <(amixer sget Master))
    fi

    #Acá incluimos el campo de la batería para cuando la compre T-T
    # xsetroot -name " $cmus_status $cmus_song | 🔊 $disp_vol | $disp_caps $ky_layout | 📶 $disp_conn |★ $light_percent% | 🌶 $disp_temp °C | ⚙ $cpu_usado | 🐜 $mem_usada% | 🔌 $disp_batt | $disp_fecha | $disp_hora |"
    xsetroot -name " $cmus_status $cmus_song | 🔊 $disp_vol  ★$light_percent% | ⇪$disp_caps  $ky_layout | 📶 $disp_conn | ⚙ $cpu_usado  ⩩ $mem_usada%  T $disp_temp°C | $disp_fecha   $disp_hora |"
    sleep $espera_actualizacion

    pgrep -x dwm || break
done
) </dev/null >/dev/null 2>&1 &

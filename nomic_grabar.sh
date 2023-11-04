#!/bin/bash

# Usamos este script para hacer screencast con ffmpeg

# Primero seleccionamos automáticamente el nombre del archivo

if [[ -f $HOME/Vídeos/mi_video.mkv ]]
then
    n=1
    while [[ -f $HOME/Vídeos/mi_video_$n.mkv ]]
    do
        n=$((n+1))
    done
    filename="$HOME/Vídeos/mi_video_$n.mkv"
else
    filename="$HOME/Vídeos/mi_video.mkv"
fi

# El comando para ffmpeg

# Audio + Mic
#ffmpeg -video_size 1366x768 -framerate 30 -f x11grab -i :0.0 -f pulse -filter_complex amerge -ac 2 -i 0 -f pulse -ac 2 -i 3 -c:v libx264rgb -crf 0 -preset ultrafast $filename

# No mic

# ffmpeg -video_size 1366x768 -async 1 -framerate 30 -f x11grab -i :0.0 -f pulse -ac 2 -i 0 -acodec aac -preset ultrafast $filename
ffmpeg -video_size 1366x768 -framerate 30 -f x11grab -i :0.0 -preset ultrafast $filename

       # Para grabar sonido del sistema usar: -f pulse -ac 2 -i 0 -c:v libx264rgb \
       # Para grabar sonido del micrófono usar: -f pulse -i default \
       # Para grabar ambos: -f pulse -filter_complex amerge -ac 2 -i 0 -f pulse -ac 2 -i 1

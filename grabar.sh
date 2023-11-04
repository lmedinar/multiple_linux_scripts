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
    filename="$HOME/Videos/mi_video_$n.mkv"
    audioname="$HOME/Videos/mi_video_$n.wav"
else
    filename="$HOME/Videos/mi_video.mkv"
    audioname="$HOME/Videos/mi_video.wav"
fi

# El comando para ffmpeg

# Audio + Mic

# ffmpeg -video_size 1366x768 -framerate 15 -f x11grab -i :0.0 -f pulse -i 3 -c:a flac -c:v libx264 -preset veryfast $filename

# ffmpeg -video_size 1366x768 -framerate 15 -f x11grab -i :0.0 -f pulse -i 3 -c:v libx264 -c:a flac  -preset ultrafast $filename  $audioname

# ffmpeg -s 1360x768 -framerate 30 -f x11grab -i :0.0+0,0 -f pulse -filter_complex amerge -ac 2 -i 0 -f pulse -ac 2 -i 3 -c:v libx264rgb -crf 0 -preset ultrafast -af $filename

#############################################################
# echo "Grabando, los archivos se guardarán en ~/Vídeos..." #
# echo "Presione una tecla para interrumpir..."             #
# read                                                      #
# killall ffmpeg                                            #
#############################################################

       # Para grabar sonido del sistema usar: -f pulse -ac 2 -i 0 -c:v libx264rgb \
       # Para grabar sonido del micrófono usar: -f pulse -i default \
       # Para grabar ambos: -f pulse -filter_complex amerge -ac 2 -i 0 -f pulse -ac 2 -i 1

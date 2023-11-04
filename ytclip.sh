#!/usr/bin/env bash

yt_formato=$1
yt_inicio=$2
yt_final=$3
yt_urlbase=$4
salida=$5

echo "Obteniendo urls para descargar VIDEO desde:"
echo "$yt_urlbase"
url_video=$(yt-dlp -f $yt_formato -g "$yt_urlbase" | awk 'NR==1')
echo "Obteniendo urls para descargar AUDIO desde:"
echo "$yt_urlbase"
url_audio=$(yt-dlp -f $yt_formato -g "$yt_urlbase" | awk 'NR==2')

# COMANDO BASE
# ffmpeg -ss $yt_inicio -i "$url_video" -t $yt_duracion -ss $yt_inicio -i "$url_audio" -t $yt_duracion -map 0:v -map 1:a -c:v libx264 -c:a aac $salida
ffmpeg -ss $yt_inicio -to $yt_final -i "$url_video" -ss $yt_inicio -to $yt_final -i "$url_audio" -map 0:v -map 1:a -c:v libx264 -c:a aac $salida

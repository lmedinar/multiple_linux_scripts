#!/usr/bin/env bash

# ffmpeg -i input.flac -ab 320k -map_metadata 0 -id3v2_version 3 output.mp3

for filename in "$@"
do
    if [ "${filename##*.}" = "mp3" ]
    then
	echo ""
	echo "Se convertirá el archivo $filename..."
	echo ""
	nombre="${filename%.*}"
	ffmpeg -i "$filename" -c:a libvorbis -qscale:a 6 "$nombre.ogg" && rm "$filename"
    elif [ "${filename##*.}" = "wav" ]
    then
	echo ""
	echo "Se convertirá el archivo $filename..."
	echo ""
	nombre="${filename%.*}"
	ffmpeg -i "$filename" -c:a libvorbis -qscale:a 6 "$nombre.ogg" && rm "$filename"
    else
	echo "El archivo $filename no es MP3 o WAV, se omitirá..."
    fi
done	    

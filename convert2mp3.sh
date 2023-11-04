#!/usr/bin/env bash

# ffmpeg -i input.flac -ab 320k -map_metadata 0 -id3v2_version 3 output.mp3

for filename in "$@"
do
    if [ "${filename##*.}" = "flac" ]
    then
	echo ""
	echo "Se convertirá el archivo $filename..."
	echo ""
	nombre="${filename%.*}"
	ffmpeg -i "$filename" -ab 320k -map_metadata 0 -id3v2_version 3 "$nombre.mp3" && rm "$filename"
    elif [ "${filename##*.}" = "wav" ]
    then
	echo ""
	echo "Se convertirá el archivo $filename..."
	echo ""
	nombre="${filename%.*}"
	ffmpeg -i "$filename" -ab 320k -map_metadata 0 -id3v2_version 3 "$nombre.mp3" && rm "$filename"
    elif [ "${filename##*.}" = "webm" ]
    then
	echo ""
	echo "Se convertirá el archivo $filename..."
	echo ""
	nombre="${filename%.*}"
	ffmpeg -i "$filename" -ab 320k -map_metadata 0 -id3v2_version 3 "$nombre.mp3" && rm "$filename"
    elif [ "${filename##*.}" = "m4a" ]
    then
	echo ""
	echo "Se convertirá el archivo $filename..."
	echo ""
	nombre="${filename%.*}"
	ffmpeg -i "$filename" -c:v copy -c:a libmp3lame -q:a 4 -ab 320k -map_metadata 0 -id3v2_version 3 "$nombre.mp3" && rm "$filename"
    else
	echo "El archivo $filename no es FLAC o WAV, se omitirá..."
    fi
done	    

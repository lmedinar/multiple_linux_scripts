#!/bin/bash
# Reads a given directory and picks a random file.

# The directory you want to use. You could use "$1" instead if you
# wanted to parametrize it.
#DIR="$HOME/Wallpapers/"
#declare -a backends=('wal' 'colorz' 'colorthief' 'haishoku')
# DIR="$1"

# Internal Field Separator set to newline, so file names with
# spaces do not break our script.
#IFS='
#'

#if [[ -d "${DIR}" ]]
#then
    # Runs ls on the given dir, and dumps the output into a matrix,
    # it uses the new lines character as a field delimiter, as explained above.
#    file_matrix=($(ls "${DIR}"))
#    num_files=${#file_matrix[*]}
    # This is the command you want to run on a random file.
    # Change "ls -l" by anything you want, it's just an example.
#    wal -i "${DIR}/${file_matrix[$((RANDOM%num_files))]}" --backend $#{backends[$RANDOM % ${#backends[@]}]}
#fi
#wal -i "${DIR}" -a 95 --backend ${backends[$RANDOM % 4]}
wal_steam -w
cp .cache/wal/colors-speedcrunch.json .local/share/SpeedCrunch/color-schemes/walTheme.json

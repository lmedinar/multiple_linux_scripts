#!/bin/bash
# Reads a given directory and picks a random file.

# The directory you want to use. You could use "$1" instead if you
# wanted to parametrize it.
#declare -a backends=('wal' 'colorz' 'colorthief' 'haishoku')
# DIR="$1"

# Internal Field Separator set to newline, so file names with
# spaces do not break our script.
IFS='
'
killall xrootgif
killall dunst

DIR="$HOME/Imágenes/Wallpapers/"
if [[ -d "${DIR}" ]]
then
    # Runs ls on the given dir, and dumps the output into a matrix,
    # it uses the new lines character as a field delimiter, as explained above.
    file_matrix=($(ls "${DIR}"))
    num_files=${#file_matrix[*]}
    # This is the command you want to run on a random file.
    # Change "ls -l" by anything you want, it's just an example.
    wallpaperset="${DIR}${file_matrix[$((RANDOM%num_files))]}"
    wal -a 90 -i $wallpaperset #--backend $#{backends[$RANDOM % ${#backends[@]}]}
fi
#declare -a backends=('wal' 'colorthief' 'haishoku' 'wal' 'wal' 'wal')
#wal -i "${DIR}" -a 90 --backend ${backends[$RANDOM % 6]}
#wal -i "${DIR}" -a 90

sed -i.bak '16c\exec --no-startup-id wal -R - 90' $HOME/.config/i3/config
sed -i.bak '17c\ ' $HOME/.config/i3/config
sed -i.bak '3c\wal -R -a 90 &' $HOME/.local/share/dwm/autostart.sh
sed -i.bak '4c\ ' $HOME/.local/share/dwm/autostart.sh
# wal_steam -w
bash /home/kixune/scripts/wal-discord/wal-discord -t
# cp ~/.cache/wal/colors-speedcrunch.json ~/.local/share/SpeedCrunch/color-schemes/walTheme.json
cp ~/.cache/wal/dunstrc ~/.config/dunst/dunstrc
cp ~/.cache/wal/kdeglobals ~/.config/kdeglobals
cp ~/.cache/wal/colors.Xresources $HOME
rm ~/.Xresources
mv ~/colors.Xresources ~/.Xresources
notify-send 'Nuevo wallpaper:' "$wallpaperset"
cp /home/staineko/.cache/wal/waltheme.css /home/staineko/Notas/.obsidian/snippets/walltheme.css

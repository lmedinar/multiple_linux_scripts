#!/bin/bash
# Reads a given directory and picks a random file.

# The directory you want to use. You could use "$1" instead if you
# wanted to parametrize it.
#declare -a backends=('wal' 'colorz' 'colorthief' 'haishoku')
# DIR="$1"

# Internal Field Separator set to newline, so file names withr
# spaces do not break our script.
IFS='
'

DIR="$HOME/Imágenes/PixelArt/"

if [[ -d "${DIR}" ]]
then
    # Runs ls on the given dir, and dumps the output into a matrix,
    # it uses the new lines character as a field delimiter, as explained above.
    file_matrix=($(ls "${DIR}"))
    num_files=${#file_matrix[*]}
    # This is the command you want to run on a random file.
    # Change "ls -l" by anything you want, it's just an example.
    my_wallpaper="${DIR}${file_matrix[$((RANDOM%num_files))]}"
fi
#declare -a backends=('wal' 'colorthief' 'haishoku' 'wal' 'wal' 'wal')
#wal -i "${DIR}" -a 90 --backend ${backends[$RANDOM % 6]}
#wal -i "${DIR}" -a 90
killall xrootgif
wal -a 90 -ni $my_wallpaper && # {backends[$RANDOM % ${#backends[@]}]}
xrootgif -q --daemon $my_wallpaper
var_wall="17c\\exec --no-startup-id xrootgif -q --daemon $my_wallpaper"
var_wall_dwm="4c\\xrootgif -q --daemon $my_wallpaper &"
sed -i.bak '16c\exec --no-startup-id wal -Rn -a 90' $HOME/.config/i3/config
sed -i.bak $var_wall $HOME/.config/i3/config
sed -i.bak '3c\wal -Rn -a 90 &' $HOME/.local/share/dwm/autostart.sh
sed -i.bak $var_wall_dwm $HOME/.local/share/dwm/autostart.sh
wal_steam -w
bash /home/kixune/scripts/wal-discord/wal-discord -t
cp ~/.cache/wal/colors-speedcrunch.json ~/.local/share/SpeedCrunch/color-schemes/walTheme.json   
cp ~/.cache/wal/dunstrc ~/.config/dunst/dunstrc
cp ~/.cache/wal/kdeglobals ~/.config/kdeglobals
cp ~/.cache/wal/colors.Xresources $HOME
cp /home/staineko/.cache/wal/waltheme.css /home/staineko/Notas/.obsidian/snippets/walltheme.css
rm ~/.Xresources
mv ~/colors.Xresources ~/.Xresources
killall dunst
notify-send 'Nuevo wallpaper:' "$my_wallpaper"

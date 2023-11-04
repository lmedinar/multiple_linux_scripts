#!/bin/bash
revert() {
  rm /tmp/*screen*.png
  xset dpms 0 0 0
}
lock_active=1
pgrep i3lock || lock_active=0
if [ $lock_active = 0  ]
   then
       trap revert HUP INT TERM
       xset +dpms dpms 0 0 300
       maim -d 0.05 /tmp/screen.jpg
       # convert -canny 20x20 -scale 10% -scale 1000% /tmp/locking_screen.png /tmp/screen_blur.png
       # convert -blur 20x20 -colorize 20,2,2 /tmp/locking_screen.png /tmp/screen_blur.png
       # convert -scale 31% -scale 21% -colorize 30,2,2 /tmp/screen.jpg /tmp/screen_blur.png
       convert -scale 20% -scale 15% -gaussian-blur 5 -colorize 30,2,2 /tmp/screen.jpg /tmp/screen_blur.png
       convert -composite /tmp/screen_blur.png ~/scripts/hexagon.png -gravity Center -geometry 1366x768 /tmp/lscreen.png
       i3lock -k --radius 150 --ring-width 30 --ring-color=80000080 --inside-color=00000000 --insidever-color=50505080 --ringver-color=50300080 --insidewrong-color=600000C0 --ringwrong-color=200000E0 --keyhl-color=FF8080B0 --bshl-color=5050F080 --separator-color=000000FF --time-color=FFFFFFEE --date-color=FFFFFFEE --timeoutline-color=000000FF --timeoutline-width=0  --time-size=50 --time-font="HackGen Console" --date-font="HackGen Console" --dateoutline-color=000000FF --dateoutline-width=0 --date-size=30 --date-str="%a - %d/%m/%y" --verif-color=FFFFFFFF --verifoutline-width=0 --verifoutline-color=000000FF --verif-font="HackGen Console" --verif-size=25 --verif-text="COMPROBANDO…" --wrong-text="CONTRASEÑA EQUIVOCADA" --wrong-color=FFFFFFFF --wrongoutline-color=000000FF --wrongoutline-width=0 --wrong-font="HackGen Console" --wrong-size=25 --greeter-text="$(fortune -sn 100 -e | tr '\n' ' ' | tr '\t' ' ' | awk '{$1=$1};1')" --greeter-font="HackGen Console" --greeter-size=20 --greeter-color=FFFFFFFF --greeteroutline-color=000000FF --greeteroutline-width=0 --greeter-pos="683:682" -L -i /tmp/lscreen.png
              # i3lock -k --radius 350 --ring-width 10 --ring-color=80000080 --inside-color=00000000 --insidever-color=50505080 --ringver-color=50300080 --insidewrong-color=600000C0 --ringwrong-color=200000E0 --keyhl-color=FF8080B0 --bshl-color=5050F080 --separator-color=000000FF --time-color=000000FF --date-color=000000FF --timeoutline-color=000000FF --timeoutline-width=0  --time-size=40 --time-font="HackGen Console" --date-font="HackGen Console" --dateoutline-color=000000FF --dateoutline-width=0 --date-size=20 --date-str="%a - %d/%m/%y" --verif-color=000000FF --verifoutline-width=0 --verifoutline-color=000000FF --verif-font="HackGen Console" --verif-size=25 --verif-text="COMPROBANDO…" --wrong-text="CONTRASEÑA EQUIVOCADA" --wrong-color=000000FF --wrongoutline-color=000000FF --wrongoutline-width=0 --wrong-font="HackGen Console" --wrong-size=25 L -i /tmp/lscreen.png

       #pgrep xlock || xlock +usefirst -showdate -erasemode losira -erasedelay 400000 -mode lament

       #scrot -d 1 /tmp/locking_screen.png
       # convert -blur 0x10 /tmp/locking_screen.png /tmp/screen_blur.png
       #convert -blur 10x5 -colorize 40,2,2 /tmp/locking_screen.png /tmp/screen_blur.png
       # convert -scale 10% -scale 1000% -colorize 50,1,1 /tmp/locking_screen.png /tmp/screen_blur.png
       # convert -canny 10x10 -blur 0x10 /tmp/locking_screen.png /tmp/screen_blur.png
       # i3lock -i /tmp/screen.png
       revert
fi

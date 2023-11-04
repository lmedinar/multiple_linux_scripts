#!/bin/bash
# pkill -f /dev/video || mpv --geometry=-0-0 --autofit=25% --brightness=-4  --contrast=30 --gamma=15 --vf=hflip --saturation=-100 --profile=low-latency av://v4l2:/dev/video0
# pkill -f /dev/video || mpv --geometry=-0-0 --autofit=25% --brightness=-4 --saturation=-30  --contrast=60 --gamma=-35 --vf=hflip --profile=low-latency av://v4l2:/dev/video
# pkill -f /dev/video || mpv --geometry=-0-0 --autofit=25% --gamma=-5 --contrast=5 --brightness=-10 --vf=hflip --profile=low-latency av://v4l2:/dev/video0
# pkill -f /dev/video || mpv --geometry=-0-0 --autofit=28% --brightness=-10  --contrast=40 --gamma=10 --vf=hflip --saturation=-25 --profile=low-latency av://v4l2:/dev/video0
# pkill -f /dev/video || mpv --geometry=-0-0 --autofit=28% --brightness=-20  --contrast=20 --gamma=10 --vf=hflip --saturation=-25 --profile=low-latency av://v4l2:/dev/video0
# pkill -f /dev/video || mpv --geometry=-0-0 --autofit=25% --vf=hflip --profile=low-latency av://v4l2:/dev/video0
# pkill -f /dev/video || mpv --geometry=-0-0 --autofit=25% --vf=hflip --profile=low-latency --untimed av://v4l2:/dev/video0
# pkill -f /dev/video || mpv --geometry=-0-0 --autofit=25% --vf=hflip --profile=low-latency --untimed --on-all-workspaces --autofit-smaller=220x220  av://v4l2:/dev/video0
# pkill -f /dev/video || mpv --title="Webcam-A" --ontop --on-all-workspaces --geometry=25%-0-0 --vf=hflip --profile=low-latency --untimed av://v4l2:/dev/video0

# activo=$(pgrep -f 'python avatar2.py')
# if [[ -z $activo ]]; then
    # cd ~/scripts/face-landmarks
    # python avatar2.py
# else
    # pkill -f 'python avatar2.py'
# fi

pkill -f /dev/video || mpv --title="cara_mpv" --geometry=30%-5-5 --ontop --on-all-workspaces --vf=hflip --profile=low-latency --untimed av://v4l2:/dev/video0

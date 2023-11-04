#!/bin/bash
scrot -o $HOME/post.png &&
    xclip -selection clipboard -t image/png -i $HOME/post.png

#!/bin/bash
 maim -squ post.png &&
    xclip -selection clipboard -t image/png -i $HOME/post.png

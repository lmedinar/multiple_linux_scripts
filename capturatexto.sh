#!/bin/bash
maim -squ txt.png
        tesseract -l spa $HOME/txt.png $HOME/txt &&
        # sed -i '$d' posttxt.txt &&
        # sed '$ s/.$//' posttxt.txt &&
        # cat post.txt | xclip -selection clipboard
	cat txt.txt | xsel -ib # Otra forma de trabajar con el clipboard


        

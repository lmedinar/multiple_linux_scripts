#!/usr/bin/env python

import sys
import os
from copy import copy

# from time import sleep


class colors:
    reset = "\033[0m"
    bold = "\033[01m"
    disable = "\033[02m"
    underline = "\033[04m"
    reverse = "\033[07m"
    strikethrough = "\033[09m"
    invisible = "\033[08m"

    class fg:
        black = "\033[30m"
        red = "\033[31m"
        green = "\033[32m"
        orange = "\033[33m"
        blue = "\033[34m"
        purple = "\033[35m"
        cyan = "\033[36m"
        lightgrey = "\033[37m"
        darkgrey = "\033[90m"
        lightred = "\033[91m"
        lightgreen = "\033[92m"
        yellow = "\033[93m"
        lightblue = "\033[94m"
        pink = "\033[95m"
        lightcyan = "\033[96m"

    class bg:
        black = "\033[40m"
        red = "\033[41m"
        green = "\033[42m"
        orange = "\033[43m"
        blue = "\033[44m"
        purple = "\033[45m"
        cyan = "\033[46m"
        lightgrey = "\033[47m"
        black = "\033[30m"
        red = "\033[31m"
        green = "\033[32m"
        orange = "\033[33m"
        blue = "\033[34m"
        purple = "\033[35m"
        cyan = "\033[36m"
        lightgrey = "\033[37m"
        darkgrey = "\033[90m"
        lightred = "\033[91m"
        lightgreen = "\033[92m"
        yellow = "\033[93m"
        lightblue = "\033[94m"
        pink = "\033[95m"
        lightcyan = "\033[96m"

    class bg:
        black = "\033[40m"
        red = "\033[41m"
        green = "\033[42m"
        orange = "\033[43m"
        blue = "\033[44m"
        purple = "\033[45m"
        cyan = "\033[46m"
        lightgrey = "\033[47m"


try:
    pxWidth = int(sys.argv[1])
except:
    print(
        colors.bold
        + colors.fg.orange
        + "ERROR: Debe indicar una anchura seguida de los archivos a convertir desde la terminal... \n"
        + "Por ejemplo: $ reducemp4.py 480 archivo1 archivo2"
        + colors.reset
    )
    quit()
n_archivos = len(sys.argv)
if n_archivos < 3:
    print(
        colors.bold
        + colors.fg.orange
        + "ERROR: Debe indicar una anchura seguida de los archivos a convertir desde la terminal... \n"
        + "Por ejemplo: $ reducemp4.py 480 archivo1 archivo2"
        + colors.reset
    )
    quit()
archivos = sys.argv[2::]
for arch in archivos:
    print(colors.fg.blue + "Converting: " + colors.reset + arch)
    print("Expected width: " + str(pxWidth))
    # sleep(10)
    currentWidth = pxWidth * 1
    output = arch + ".OUT.mp4"
    comandoTerminado = 1
    while comandoTerminado:
        print(
            colors.bold
            + colors.fg.cyan
            + "Probando conversión con ancho de "
            + str(currentWidth)
            + "px..."
            + colors.reset
        )
        comando = (
            'ffmpeg -i "'
            + arch
            + '" -vf scale='
            + str(currentWidth)
            + ':-1 -vcodec libx265 -crf 28 "'
            + output
            + '"'
        )
        print(colors.fg.green + "Probando comando:")
        print(colors.fg.cyan + comando + colors.reset)
        # sleep(8)
        comandoTerminado = os.system(comando)
        if comandoTerminado:
            os.system('rm "' + output + '"')
            currentWidth -= 1
    print("¡Conversión terminada!\n\n")

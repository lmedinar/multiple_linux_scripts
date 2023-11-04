#!/usr/bin/env python

import sys
import os.path


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


# EJEMPLO PARA COLORES
# print(
#             colors.bold
#             + colors.fg.purple
#             + "El archivo no contiene enlaces..."
#             + colors.reset
#         )


if len(sys.argv) < 2:
    print(
        colors.bold
        + colors.fg.purple
        + "ERROR: Este script requiere un archivo de texto como argumento... Todos los argumentos que le sigan serán una blacklist"
        + colors.reset
    )
else:
    if not os.path.isfile(sys.argv[1]):
        print(
            colors.bold
            + colors.fg.purple
            + f"ERROR: No se encontró el archivo '{sys.argv[1]}'..."
            + colors.reset
        )
        quit()
    count = 0
    appendString = 0
    nArgs = len(sys.argv)
    # print(nArgs)
    for line in open(sys.argv[1]):
        omitirEncabezado = 0
        if line.strip() == "":
            continue
        if line.strip().isdigit():
            continue
        if nArgs > 2:
            for blacklist in sys.argv[2::]:
                if blacklist in line:
                    omitirEncabezado = 1
        if omitirEncabezado:
            continue
        if not appendString:
            printer = line.replace("- ", "")
        else:
            printer += line
            printer = printer.replace("- ", "")
            appendString = 0
        if printer.strip()[-1] == "-":
            appendString = 1
            continue
        print(printer, end="")
        # if "-" in printer:
        #     count += 1
        # if count == 3:
        #     quit()

    # Continuamos con normalidad

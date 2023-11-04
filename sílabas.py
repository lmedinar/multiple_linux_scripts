#!/usr/bin/env python

from syltippy import syllabize

##################################################
# # total arguments                              #
# n = len(sys.argv)                              #
# print("Total arguments passed:", n)            #
#                                                #
# # Arguments passed                             #
# print("\nName of Python script:", sys.argv[0]) #
#                                                #
# print("\nArguments passed:", end=" ")          #
# for i in range(1, n):                          #
#     print(sys.argv[i], end=" ")                #
##################################################


# entrada = """Entrada multilínea de prueba
# para ver cómo se cuentan las sílabas,
# y ver si vale la pena implementar."""
# filename = "sílabas.py"

# for frase in entrada.split("\n"):
#     sílabas, estrés = syllabize(frase)
#     print(f"{len(sílabas):2d} | {estrés:2d} | {'-'.join(sílabas)}")

# Read File Python One-Liner

# print 'Number of arguments:', len(sys.argv), 'arguments.'
# print 'Argument List:', str(sys.argv)

# if len(sys.argv) == 1 or sys.argv is None:
# print(
# """ERROR: Este programa necesita un archivo de entrada...
# Ejemplo:
# sílabas archivo.txt"""
# )
# else:
# texto = " ".join(sys.argv[1:]).split("\\n")

import fileinput

print(" Smin Smax Estrés")
with fileinput.input() as f_input:  # This gets the piped data for you
    for frase in f_input:
        if frase.strip() == "":
            print("")
        else:
            frase_2 = "".join(frase.split()).lower()
            # frase_2.maketrans("áéíóú", "aeiou")
            # print(frase_2)
            frase_2 = frase_2.replace(",", "")
            frase_2 = frase_2.replace(";", "")
            frase_2 = frase_2.replace(":", "")
            sílabas, estrés = syllabize(frase_2)
            cadena = f"{len(sílabas):2d} | {estrés:2d} | {'-'.join(sílabas)}"
            cadena = cadena.replace("é-a", "É⬛A")
            cadena = cadena.replace("a-e", "A⬛E")
            cadena = cadena.replace("e-e", "E⬛E")
            cadena = cadena.replace("e-a", "E⬛A")
            cadena = cadena.replace("e-e", "E⬛E")
            cadena = cadena.replace("ó-a", "Ó⬛A")
            cadena = cadena.replace("o-a", "O⬛A")
            cadena = cadena.replace("ó-e", "Ó⬛E")
            cadena = cadena.replace("e-o", "E⬛O")
            cadena = cadena.replace("o-e", "O⬛E")
            cadena = cadena.replace("í-a", "Í⬛A")
            cadena = cadena.replace("o-he", "O⬛HE")
            cadena = cadena.replace("a-ha", "A⬛HA")
            cadena = cadena.replace("e-ha", "E⬛HA")
            count = 0
            for s in cadena:
                if s == "⬛":
                    count += 1
            print(f"| {int(cadena[0:2]) - count:2d} | ", end="")
            print(cadena)

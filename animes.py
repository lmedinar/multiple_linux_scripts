#!/usr/bin/env python

import requests
import sys
import json

if len(sys.argv) < 2:
    print("ERROR: Ingrese términos de búsqueda...")
elif sys.argv[1] == "-h" or sys.argv[1] == "--help":
    print(
        """
             _           _____ _____ 
            (_)         |  ___/  ___|
  __ _ _ __  _ _ __ ___ | |__ \ `--. 
 / _` | '_ \| | '_ ` _ \|  __| `--. \\
| (_| | | | | | | | | | | |___/\__/ /
 \__,_|_| |_|_|_| |_| |_\____/\____/ 

Buscador de anime en español, versión alpha 0.0.1

Busca un anime online y lo manda al reproductor mpv.

$ animes -h o animes --help
Muestra este mensaje de ayuda

$ animes <terminos de búsqueda>
Inicia búsqueda de anime, debe seleccionar el anime y episodio.
"""
    )
else:
    buscar = " ".join(sys.argv[1:]).replace(" ", "+")
    url_base = "https://jkanime.net/ajax/ajax_search/?q="
    result_init = requests.get(url_base + buscar)
    if result_init.status_code // 100 == 2:  # extracción exitosa
        resultados = json.loads(result_init.content)
        animes = resultados["animes"]
        if len(animes) == 0:
            print("No se encontraron resultados")
        else:
            print("Resultados:")
            n = 1
            for an in animes:
                episodios_init = requests.get(
                    "https://jkanime.net/ajax/last_episode/" + an["id"] + "/"
                )
                last_ep = json.loads(episodios_init.content)
                an["episodios"] = last_ep[0]["number"]
                print(f"({n}) ", end="")
                print("Nombre: " + an["title"])
                print("Tipo: " + an["type"], end="\t")
                estado = "Finalizada" if an["status"] == "finished" else "En emisión"
                print("Estado: " + estado)
                print("Episodios subidos: " + an["episodios"])
                print("")
                print("Obteniendo info...", end="\r")
                n += 1
            # print("")
            opciones = f"(1-{len(animes)})" if len(animes) > 1 else "(1)"
            sel = int(input(f"Seleccione el anime que desea mirar {opciones}: ")) - 1
            slug_sel = animes[sel]["slug"]
            caps = animes[sel]["episodios"]
            capis = f"(1-{caps})" if int(caps) > 1 else "(1)"
            epi = input(f"Seleccione el episodio {capis}: ")
            enlace = "https://jkanime.net/" + slug_sel + "/" + epi
            print(enlace)

    else:
        print(
            "No se pudo obtener la información, revise su conexión o el estado del sitio..."
        )

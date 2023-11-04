#!/usr/bin/env python

import requests
from bs4 import BeautifulSoup
import time


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


headers = {
    "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_2) AppleWebKit/601.3.9 (KHTML, like Gecko) Version/9.0.2 Safari/601.3.9"
}


url = "https://articulo.mercadolibre.com.mx/MLM-849745175-filamento-pla-175-mm-precision-dimensional-002-mm-1-kg-_JM"
print(colors.fg.blue + "Obteniendo datos dedesde:\n" + url + colors.reset)
r = requests.get(url, headers=headers)
print(
    f"Status: {r.status_code}"
)  # Nos dice si se pudo acceder al sitio, 200 es que funciona
soup = BeautifulSoup(r.content, "html.parser")  # le hacemos parse al contenido
marca = soup.select_one(
    "#root-app > div > div.ui-pdp-container.ui-pdp-container--pdp > div > div.ui-pdp-container__col.col-2.ui-pdp-container--column-left.pb-40 > div.ui-pdp-container__col.col-1.ui-vip-core-container--content-left > div.ui-pdp-container__row.ui-pdp-container__row--technical-specifications > div > div.ui-pdp-specs__table > table > tbody > tr:nth-child(1) > td > span"
).text
precio = soup.select_one(
    "#root-app > div > div.ui-pdp-container.ui-pdp-container--pdp > div > div.ui-pdp-container__col.col-1.ui-pdp-container--column-right.mt-16.pr-16.ui-pdp--relative > div > div.ui-pdp-container__row.ui-pdp-component-list.pr-16.pl-16 > div > div.ui-pdp-container__row.ui-pdp-container__row--price > div > div.ui-pdp-price__second-line > span.andes-money-amount.ui-pdp-price__part.andes-money-amount--cents-superscript.andes-money-amount--compact > span.andes-money-amount__fraction"
).text
titulo = soup.select_one(
    "#root-app > div > div.ui-pdp-container.ui-pdp-container--pdp > div > div.ui-pdp-container__col.col-1.ui-pdp-container--column-right.mt-16.pr-16.ui-pdp--relative > div > div.ui-pdp-container__row.ui-pdp-component-list.pr-16.pl-16 > div > div.ui-pdp-container__row.ui-pdp-container__row--header > div > div.ui-pdp-header__title-container > h1"
).text
puntuacion_url = soup.select_one(
    "#root-app > div > div.ui-pdp-container.ui-pdp-container--pdp > div > div.ui-pdp-container__col.col-1.ui-pdp-container--column-right.mt-16.pr-16.ui-pdp--relative > div > div.ui-pdp-container__row.ui-pdp-component-list.pr-16.pl-16 > div > div.ui-pdp-container__row.ui-pdp-container__row--header > div > div.ui-pdp-header__info > a"
)
puntuacion_url = "https://mercadolibre.com.mx" + puntuacion_url.attrs["href"]
time.sleep(1)
r_puntos = requests.get(url, headers=headers)
soup_puntos = BeautifulSoup(
    r_puntos.content, "html.parser"
)  # le hacemos parse al contenido
estrellas = soup_puntos.select_one(".ui-review-view__rating__summary__average").text

print(colors.bold + colors.fg.red + "Producto: " + colors.reset + titulo)
print(colors.bold + colors.fg.red + "Marca: " + colors.reset + marca)
print(colors.bold + colors.fg.red + "Precio: " + colors.reset + "$" + precio)
print(
    colors.bold + colors.fg.red + "Valoración: " + colors.reset + estrellas + " / 5.0"
)
print("")

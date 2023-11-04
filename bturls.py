#!/usr/bin/env python

import requests
import os
from bs4 import BeautifulSoup

# headers = {"User-Agent": "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/70.0.3538.77 Safari/537.36"}
# headers = {'User-Agent': 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_11_5)\
            # AppleWebKit/537.36 (KHTML, like Gecko) Cafari/537.36'}
headers = {'User-Agent': 'Mozilla/5.0 (Windows NT 6.2; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/75.0.3770.100 Safari/537.36'}

testurl = "https://btdig.com/341fcbb55ae1c6635376fcb1d16ba85ff9f7fbc0"

# Funciones para guardar y leer archivos html
def save_html(html, path):
    with open(path, 'wb') as f:
        f.write(html)

def open_html(path):
    with open(path, 'rb') as f:
        return f.read()
    
print("Revisando torrent en " + testurl + " ...")
instrucción = "curl --output ~/scripts/sitio.html " + testurl
exit_code = os.system(instrucción)
if exit_code == 0:
    raw = open_html("/home/staineko//scripts/sitio.html")
    sopa = BeautifulSoup(raw, "html.parser") # parseamos
    n_archivos = sopa.select_one("body > center > div:nth-child(1) > div > center > table > tbody > tr:nth-child(8) > td:nth-child(2)").text.strip()
    tamaño = sopa.select_one("body > center > div:nth-child(1) > div > center > table > tbody > tr:nth-child(6) > td:nth-child(2)").text.strip()
    print("Archivos: " + n_archivos)
    print("Tamaño: " + tamaño)
else:
    print("Error, el comando curl falló")

#!/usr/bin/env python

import requests, sys
import time
from bs4 import BeautifulSoup

RES_T = "Congratulations"
BT_URL_SEC = "http://btdigggink2pdqzqrik3blmqemsbntpzwxottujilcdjfz56jumzfsyd.onion/"
BT_URL = "https://btdig.com/"

def save_html(html, path):
    with open(path, 'wb') as f:
        f.write(html)

def open_html(path):
    with open(path, 'rb') as f:
        return f.read()


argumentos = sys.argv
if len(argumentos) < 2:
    print("Error: hay que ingresar argumentos")
else:
    del argumentos[0]
    # print ("Argumentos:")
    # print(argumentos)
    print("Iniciando conexión de prueba...")
    r = requests.get("https://check.torproject.org/")
    if r.status_code == 200:
        # Conexión exitosa, ahora vemos si estamos bajo la red segura
        sopa_t = BeautifulSoup(r.content, "html.parser")
        estado_t = sopa_t.select_one("body div.content h1")
        estado_t2 = str(estado_t)[28:43]
        if estado_t2 == RES_T:
            print("Conexión segura establecida, procediendo a revisar enlaces...\n")
            #Revisamos todos los enlaces uno a uno
            for enlace in argumentos:
                priv = BT_URL_SEC + enlace.split("/")[-1]
                print("Obteniendo info del enlace: " + priv)
                r = requests.get(priv)
                if r.status_code == 200:
                    sopa = BeautifulSoup(r.content, "html.parser")
                    archivos = sopa.select_one("body > center:nth-child(2) > div:nth-child(1) > div:nth-child(2) > center:nth-child(1) > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(8) > td:nth-child(2)").text.strip()
                    print("Archivos: " + archivos)
                    
                    
                else:
                    print("Error de conexión (" + str(r.status_code) + "), revisar enlace")
        else:
            print("Error: la conexión no es segura, se revisará los enlaces en 5 segundos...")
            time.sleep(5)
            for enlace in argumentos:
                normal = BT_URL + enlace.split("/")[-1]
                print("Obteniendo info del enlace: " + normal)
                r = requests.get(normal)
                if r.status_code == 200:
                    sopa = BeautifulSoup(r.content, "html.parser")
                    archivos = sopa.select_one("body > center:nth-child(2) > div:nth-child(1) > div:nth-child(2) > center:nth-child(1) > table:nth-child(1) > tbody:nth-child(1) > tr:nth-child(8) > td:nth-child(2)").text.strip()
                    print("Archivos: " + archivos)
                else:
                    print("Error de conexión (" + str(r.status_code) + "), revisar enlace")
                # Hacemos una pausa antes del siguiente enlace, pero si es el útimo link salimos
                if elnace != arguemntos[-1]:
                    time.sleep(10)
                else:
                    print("Información obtenida")
            
    else:
        print("Error: no se pudo verificar la conexión...")
        

url_test = "https://btdig.com/a0d110aed1ea753b5618373a7ce1afb142561ba9"
url_test.split("/")[-1]

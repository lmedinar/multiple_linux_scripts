#!/usr/bin/env python

import datetime


def calculateAge(dob):
    today = datetime.date.today()
    age = today.year - dob.year - ((today.month, today.day) < (dob.month, dob.day))

    return age


def calculate_days_left(originalDate, currentDate):
    date1 = currentDate
    date2 = datetime.date(originalDate.year, originalDate.month, originalDate.day)
    delta = date2 - date1
    days = delta.total_seconds() / 60 / 60 / 24

    return days


print("Introduce tu fecha de nacimiento...")
día = int(input("Día: "))
mes = int(input("Mes: "))
año = int(input("Año: "))
print("--- --- --- --- ---")
print(f"Usted tiene {calculateAge(datetime.date(año, mes, día))} años de edad")
currentDate = datetime.date.today()
daysLeft = calculate_days_left(datetime.date(currentDate.year, mes, día), currentDate)
if daysLeft < 0:
    daysLeft = calculate_days_left(
        datetime.date(currentDate.year + 1, mes, día), currentDate
    )
print(f"Faltan {int(daysLeft)} días para su próximo cumpleaños")
print("--- --- --- --- ---")

# MERL920629UH9

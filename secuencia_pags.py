#!/usr/bin/env python
import numpy as np

num = input("Inidique el número de páginas de su documento: ")
n = int(num)
sec = np.zeros(n)
var_a = n
var_b = 1
for i in range(n // 2):
    sec[2 * i] = var_a
    sec[2 * i + 1] = var_b
    var_a -= 1
    var_b += 1
n_var = 3
while n_var <= n:
    aux = sec[n_var - 1] * 1
    sec[n_var - 1] = sec[n_var] * 1
    sec[n_var] = 1 * aux
    n_var += 4
for val in sec:
    print(str(int(val)), end="")
    if val != sec[-1]:
        print(",", end="")
print()

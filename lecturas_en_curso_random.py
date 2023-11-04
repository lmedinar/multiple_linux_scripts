#!/usr/bin/env python

from random import choice

fn_libros = "/home/staineko/Notas/000. PENDIENTES/Lecturas en curso.md"
print("- [ ] **Lectura:** " + choice([line.strip() for line in open(fn_libros)]))

fn_cursos = "/home/staineko/Notas/000. PENDIENTES/Cursos.md"
print("- [ ] **Curso:** " + choice([line.strip() for line in open(fn_cursos)]))

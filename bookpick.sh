#!/bin/bash

My_BOOK=


BOOK_DIR=$(pwd)

# Internal Field Separator set to newline, so file names with
# spaces do not break our script.
IFS='
'
MY_BOOK=$(find -type f | grep .pdf | shuf -n1)

# MY_BOOK=$(find $BOOK_DIR/ -name $(ls -R1 $BOOK_DIR | grep .pdf | shuf -n1))
NUMPAG=$(pdfinfo $MY_BOOK | grep Pages | awk '{print $2}')
okular $MY_BOOK -p $((1 + RANDOM % $NUMPAG)) &
echo $MY_BOOK

# Generamos números aleatorios
# echo "100 páginas: $((1 + RANDOM % 100))"
# echo "300 páginas: $((1 + RANDOM % 300))"
# echo "600 páginas: $((1 + RANDOM % 600))"
# echo "1000 páginas: $((1 + RANDOM % 1000))"
# echo "1500 páginas: $((1 + RANDOM % 1500))"
# echo "2000 páginas: $((1 + RANDOM % 2000))"

exit 0

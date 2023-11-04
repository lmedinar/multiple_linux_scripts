#!/bin/bash

cd /home/staineko/Libros
My_BOOK=

# Internal Field Separator set to newline, so file names with
# spaces do not break our script.
IFS='
'
MY_BOOK=$(find -type f | grep .pdf | shuf -n1)
MY_BOOK_FORMAT_1=$(readlink -f $MY_BOOK)
MY_BOOK_FORMAT_2=${MY_BOOK_FORMAT_1// /%20}
MY_BOOK_FORMAT_3=${MY_BOOK_FORMAT_2:1}
# MY_BOOK_FORMAT_3=$(echo "$MY_BOOK_FORMAT_3" | sed 's/\//%5C/g')

# MY_BOOK=$(find $BOOK_DIR/ -name $(ls -R1 $BOOK_DIR | grep .pdf | shuf -n1))
NUMPAG=$(pdfinfo $MY_BOOK | grep Pages | awk '{print $2}')
# okular $MY_BOOK -p $((1 + RANDOM % $NUMPAG)) &
echo "[Documento](file:///$MY_BOOK_FORMAT_3)"
echo "Página aleatoria: $((1 + RANDOM % $NUMPAG))"

exit 0

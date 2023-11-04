#!/bin/bash

# Internal Field Separator set to newline, so file names with
# spaces do not break our script.
IFS='
'
MYFILE=$(find -name $(ls -pR1 | grep -v :| grep -v /| sed -r '/^\s*$/d' | shuf -n1))
echo $MYFILE
xdg-open $MYFILE
exit 0


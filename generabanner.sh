#!/usr/bin/env bash

fortune -sn 300 | sed -r "s/\x1B\[(([0-9]{1,2})?(;)?([0-9]{1,2})?)?[m,K,H,f,J]//g" > ~/.emacs.d/banner.txt 

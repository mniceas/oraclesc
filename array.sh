#!/bin/bash

#declare array_teste
#array_teste=(`php -i | grep extension_dir`)
#echo ${array_teste[2]}

declare phpdir
phpdir=(`php -i | grep php.ini`)
echo ${phpdir[10]}

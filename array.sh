#!/bin/bash

#declare array_teste
#array_teste=(`php -i | grep extension_dir`)
#echo ${array_teste[2]}

declare phpdir
phpdir=(`php -i | grep 'php.ini' | cut -c 37-50`)
ini='apache2/php.ini'
sudo echo "extensionteste=oci8.so" >> $phpdir$ini

#declare phpv
#phpv=(`php -i | grep 'PHP Version' | cut -c 16-21`)
#echo $phpv


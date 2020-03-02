#!/bin/bash

declare array_teste
array_teste=(`php -i | grep extension_dir`)
#echo ${array_teste[2]}
eval ls -l ${array_teste[2]}
#declare phpdir
#phpdir=(`php -i | grep 'php.ini' | cut -c 37-50`)
#ini='apache2/php.ini'
#sudo echo "extensionteste=oci8.so" >> $phpdir$ini

#declare phpv
#phpv=(`php -i | grep 'PHP Version' | cut -c 16-21`)
#echo $phpv

#declare phpdir
#phpdir=(`php -i | grep 'php.ini' | cut -c 37-50`)
#ini='apache2/php.ini'
#echo $phpdir
#Baixando a extensão para PHP 7.3
#eval wget http://raptorgames.myscriptcase.com/oci8.so
#Movendo extensão para o diretório correto
#eval sudo cp -avr oci8.so ${extdir[2]}
#Declarando variável no php.ini
#sudo echo "extension=oci8.so" >> $phpdir$ini
#echo $phpdir$ini

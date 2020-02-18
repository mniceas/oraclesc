#!/bin/bash

read -p "Você quer baixar os clients do Oracle? (y/n)" choice
case $choice in
y|Y ) eval wget http://cdn1.netmake.com.br/download/Conexao/Oracle/Linux/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm && wget http://cdn1.netmake.com.br/download/Conexao/Oracle/Linux/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm;;
n|Y ) echo "Boa, jogador";;
* ) echo "Bixo, digite direito.";;
esac

<<COMMENT
#Instalando o Alien
eval sudo apt-get install alien

#Convertendo de RPM para DEB
eval sudo alien ~/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm && sudo alien ~/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm

#Instalando os pacotes
eval sudo dpkg -i oracle-instantclient12.1-basic_12.1.0.2.0-2_amd64.deb && sudo dpkg -i oracle-instantclient12.1-devel_12.1.0.2.0-2_amd64.deb

#Recuperando as variáveis
#extdir="$(eval php -i | grep extension_dir)"
#phpinipath="$eval php -i | grep php.ini"
#extpath = ${extdir}

#Recuperando diretório de extensões
declare extdir
extdir=(`php -i | grep extension_dir`)
#echo ${extdir[2]}

#Recuperando diretório do php.ini
declare phpdir
phpdir=(`php -i | grep php.ini`)
#echo ${phpdir[10]}

#Baixando a extensão para PHP 7.3
eval wget http://raptorgames.myscriptcase.com/oci8.so

#Movendo extensão para o diretório correto
eval sudo cp -avr oci8.so ${extdir[2]}

#Declarando variável no php.ini
echo "extension=oci8.so" >> ${phpdir[10]}
COMMENT

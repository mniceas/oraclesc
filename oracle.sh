#!/bin/bash

#Baixando os clients
eval wget http://cdn1.netmake.com.br/download/Conexao/Oracle/Linux/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm && wget http://cdn1.netmake.com.br/download/Conexao/Oracle/Linux/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm

#Instalando o Alien
eval sudo apt-get install alien

#Convertendo de RPM para DEB
eval sudo alien ~/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm && sudo alien ~/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm

#Instalando os pacotes
eval sudo dpkg -i oracle-instantclient12.1-basic_12.1.0.2.0-2_amd64.deb && sudo dpkg -i oracle-instantclient12.1-devel_12.1.0.2.0-2_amd64.deb

#Recuperando as variáveis
extdir="$(eval php -i | grep extension_dir)"
phpinipath="$eval php -i | grep php.ini"

extpath = ${extdir}

#Baixando a extensão para PHP 7.3
eval wget http://raptorgames.myscriptcase.com/oci8.so

#Movendo extensão para o diretório correto
eval sudo cp -avr oci8.so ${extpath}

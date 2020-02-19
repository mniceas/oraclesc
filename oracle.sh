#!/bin/bash

basic=http://cdn1.netmake.com.br/download/Conexao/Oracle/Linux/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
devel=http://cdn1.netmake.com.br/download/Conexao/Oracle/Linux/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm

read -p $(whoami)", deseja instalar e configurar o driver do Oracle? (y/n)" choice
case $choice in
y|Y ) 
echo "Agora vai, meu patrão."
eval wget $basic && wget $devel
#Identificando versão do PHP
declare phpv
phpv=(`php -i | grep 'PHP Version' | cut -c 16-21`)
#echo $phpv
#Atualizando o sistema
eval y|sudo apt-get update && apt-get upgrade
#Instalando o Alien
eval y|sudo apt-get install alien
#Convertendo de RPM para DEB
eval sudo alien ~/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm && sudo alien ~/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
#Instalando os pacotes
eval sudo dpkg -i oracle-instantclient12.1-basic_12.1.0.2.0-2_amd64.deb && sudo dpkg -i oracle-instantclient12.1-devel_12.1.0.2.0-2_amd64.deb
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
sudo echo "extension=oci8.so" >> ${phpdir[10]}
#Adicionando a diretiva LD_LIBRARY_PATH no envvars
sudo echo "export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib/" >> /etc/apache2/envvars
#Reiniciando o serviço do Apache
eval sudo service apache2 restart;;

n|N ) echo "Falow.";;

* ) echo "Bixo, digite direito.";;
esac

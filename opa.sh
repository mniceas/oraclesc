#!/bin/bash
#bixo=`pwd`
#echo $bixo
basic=http://cdn1.netmake.com.br/download/Conexao/Oracle/Linux/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
devel=http://cdn1.netmake.com.br/download/Conexao/Oracle/Linux/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm
rpmdevel=oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm
rpmbasic=oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
develdeb=oracle-instantclient12.1-basic_12.1.0.2.0-2_amd64.deb
basicdeb=oracle-instantclient12.1-devel_12.1.0.2.0-2_amd64.deb

#read -p $(whoami)", deseja instalar e configurar o driver do Oracle? (y/n)" choice
#case $choice in
#y|Y )
#echo ""
#echo "Agora vai, meu patrão."
#echo ""
eval wget $basic && wget $devel
#Identificando versão do PHP
#declare phpv
#phpv=(`php -i | grep 'PHP Version' | cut -c 16-21`)
#echo $phpv
#Atualizando o sistema
#eval sudo apt-get -y update && apt-get -y upgrade
#Instalando o Alien
#eval sudo apt-get -y install alien libaio1 libncurses5 gcc-multilib g++-multilib libpam0g ksh unixodbc-dev unixodbc
#Convertendo de RPM para DEB
cpath=`pwd`
eval sudo alien $cpath/$rpmdevel && sudo alien $cpath/$rpmbasic

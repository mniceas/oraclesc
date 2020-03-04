##
# @author: Matheus Nicéas
# @email: niceas49@hotmail.com
# @date: 2020-02-10 14:44
#
##
#!/bin/bash

#Links Necesários
basic=http://cdn1.netmake.com.br/download/Conexao/Oracle/Linux/oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
devel=http://cdn1.netmake.com.br/download/Conexao/Oracle/Linux/oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm
rpmdevel=oracle-instantclient12.1-devel-12.1.0.2.0-1.x86_64.rpm
rpmbasic=oracle-instantclient12.1-basic-12.1.0.2.0-1.x86_64.rpm
develdeb=oracle-instantclient12.1-basic_12.1.0.2.0-2_amd64.deb
basicdeb=oracle-instantclient12.1-devel_12.1.0.2.0-2_amd64.deb
extoci=http://raptorgames.myscriptcase.com/oci8.so

read -p $(whoami)", deseja instalar e configurar o driver do Oracle? (y/n)" choice
case $choice in
y|Y ) 
echo ""
echo "Agora vai, meu patrão."
echo ""
eval wget $basic && wget $devel
#Identificando versão do PHP
declare phpv
phpv=(`php -i | grep 'PHP Version' | cut -c 16-21`)
echo $phpv
#Atualizando o sistema
eval sudo apt-get -y update && apt-get -y upgrade
#Instalando o Alien
eval sudo apt-get -y install alien libaio1 libncurses5 gcc-multilib g++-multilib libpam0g ksh unixodbc-dev unixodbc
#Convertendo de RPM para DEB
cpath=`pwd`
eval sudo alien $cpath/$rpmdevel && sudo alien $cpath/$rpmbasic
#Instalando os pacotes
eval sudo dpkg -i $develdeb && sudo dpkg -i $basicdeb
#Recuperando diretório de extensões
declare extdir
extdir=(`php -i | grep extension_dir`)
echo ${extdir[2]}
#Recuperando diretório do php.ini
declare phpdir
phpdir=(`php -i | grep 'php.ini' | cut -c 37-50`)
ini='apache2/php.ini'
#echo $phpdir
#Baixando a extensão para PHP 7.3
eval wget $extoci
#Movendo extensão para o diretório correto
eval sudo cp -avr oci8.so ${extdir[2]}
eval ls -l ${extdir[2]}
#Declarando variável no php.ini
sudo echo "" >> $phpdir$ini
sudo echo "extension=oci8.so" >> $phpdir$ini
#Adicionando a diretiva LD_LIBRARY_PATH no envvars
sudo echo "export LD_LIBRARY_PATH=/usr/lib/oracle/12.1/client64/lib/" >> /etc/apache2/envvars
#Reiniciando o serviço do Apache
eval sudo service apache2 restart;;

n|N ) echo "Até outro dia.";;

* ) echo "Bixo, digite direito..."
echo "Bote y ou n."
cpath=`pwd`
eval sudo bash $cpath/oracle.sh;;
esac

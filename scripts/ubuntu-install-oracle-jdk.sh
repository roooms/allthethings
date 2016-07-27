#!/usr/bin/env bash

sudo mkdir /opt/jdk
if [[ -f "/setup/java/jdk-8u51-linux-x64.tar.gz" ]]; then
    sudo tar xf /setup/java/jdk-8u51-linux-x64.tar.gz -C /opt/jdk
else
    wget --no-check-certificate --no-cookies --header "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u51-b16/jdk-8u51-linux-x64.tar.gz -O ~/jdk-8u51-linux-x64.tar.gz
    sudo tar xf ~/jdk-8u51-linux-x64.tar.gz -C /opt/jdk
fi

sudo update-alternatives --install /usr/bin/java java /opt/jdk/jdk1.8.0_51/bin/java 2000
sudo update-alternatives --install /usr/bin/javac javac /opt/jdk/jdk1.8.0_51/bin/javac 2000
sudo update-alternatives --install /usr/bin/jar jar /opt/jdk/jdk1.8.0_51/bin/jar 2000
update-alternatives --display java
update-alternatives --display javac
java -version


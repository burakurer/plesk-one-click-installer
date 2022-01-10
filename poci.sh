#!/bin/bash

if (($EUID != 0)); then
    echo "Lutfen dosyayi root olarak baslatin"
    exit
fi

centos() {
    printf "\E[31mSistem guncellemeleri denetleniyor\E[0m\n"
    sleep 5
    yum upgrade -y
    yum update -y
    printf "\E[31mSistem guncellemeleri tamamlandi\E[0m\n"
    sleep 5
    printf "\E[31mPlesk kurulumu baslatiliyor\E[0m\n"
    sleep 5
    sh <(curl https://autoinstall.plesk.com/one-click-installer || wget -O – https://autoinstall.plesk.com/one-click-installer)
    printf "\E[31mPlesk kurulumu basariyla tamamlandi\E[0m\n"
}

ubuntu() {
    printf "\E[31mSistem guncellemeleri denetleniyor\E[0m\n"
    sleep 5
    apt-get upgrade -y
    apt-get update -y
    printf "\E[31mSistem guncellemeleri tamamlandi\E[0m\n"
    sleep 5
    printf "\E[31mPlesk kurulumu baslatiliyor\E[0m\n"
    sleep 5
    sh <(curl https://autoinstall.plesk.com/one-click-installer || wget -O – https://autoinstall.plesk.com/one-click-installer)
}

printf "\E[31mBu bash scripti burakurer.com tarafindan yazilmistir\E[0m\n"
echo "Isletim sistemi seciniz"
echo -e "\nCentos [1]\nUbuntu [2]"
read os

if [ $os == 1 ]; then
    centos
elif [ $os == 2 ]; then
    ubuntu
else
    echo "Gecerli bir isletim sistemi girilmedi!"
    exit
fi

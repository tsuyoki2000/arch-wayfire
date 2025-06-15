#!/bin/bash

##########################################################################
# Chaotic-AUR リポジトリを pacman の設定に追加するためのシェルスクリプト #
##########################################################################

# Chaotic-AUR リポジトリのキーをインポート
sudo pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com
sudo pacman-key --lsign-key 3056513887B78AEB

# Chaotic-AUR リポジトリのパッケージをダウンロードしてインストール
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' --noconfirm
sudo pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst' --noconfirm

# pacman.conf に Chaotic-AUR リポジトリを追加
sudo sh -c 'echo "" >> /etc/pacman.conf'
sudo sh -c 'echo "[chaotic-aur]" >> /etc/pacman.conf'
sudo sh -c 'echo "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf'

#sudo echo -e "" >> /etc/pacman.conf
#sudo echo -e "[chaotic-aur]" >> /etc/pacman.conf
#sudo echo -e "Include = /etc/pacman.d/chaotic-mirrorlist" >> /etc/pacman.conf

# パッケージデータベースを更新
sudo pacman -Sy

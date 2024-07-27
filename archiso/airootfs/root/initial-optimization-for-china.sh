#!/bin/bash

# change mirrors
# reflector --country China --protocol http --latest 3 --save /etc/pacman.d/mirrorlist
echo '>> use china mirrors <<'
sudo echo 'Server = https://mirrors.ustc.edu.cn/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist
sudo echo 'Server = http://mirrors.jxust.edu.cn/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist
sudo echo 'Server = http://mirrors.zju.edu.cn/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist
sudo echo 'Server = https://mirrors.xjtu.edu.cn/archlinux/$repo/os/$arch' >> /etc/pacman.d/mirrorlist

# archlinuxcn
#sudo echo '[archlinuxcn]' >> /etc/pacman.conf
#sudo echo 'Server = https://mirrors.ustc.edu.cn/archlinuxcn/$arch' >> /etc/pacman.conf
#sudo pacman-key --lsign-key "farseerfc@archlinux.org"


# update
echo '>> update && upgrade <<'
sudo pacman -Syyu

# flatpak mirror
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
sudo flatpak remote-modify flathub --url=https://mirror.sjtu.edu.cn/flathub

# 配置输入法 https://fcitx-im.org/wiki/Using_Fcitx_5_on_Wayland
echo '>> fcitx5 gtk config <<'
if [[ -z $(grep 'gtk-im-module=fcitx' ~/.gtkrc-2.0)  ]]; then
echo 'gtk-im-module="fcitx"' >> ~/.gtkrc-2.0
fi

if [[ -z $(grep 'gtk-im-module=fcitx' ~/.config/gtk-3.0/settings.ini)  ]]; then
echo 'gtk-im-module=fcitx' >> ~/.config/gtk-3.0/settings.ini
fi

if [[ -z $(grep 'gtk-im-module=fcitx' ~/.config/gtk-4.0/settings.ini)  ]]; then
echo 'gtk-im-module=fcitx' >> ~/.config/gtk-4.0/settings.ini
fi

# fix 
echo '>> keep time <<'
sudo timedatectl set-local-rtc true

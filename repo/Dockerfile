#FROM archlinux
FROM archlinux:base-devel
RUN pacman-key --init
#RUN pacman-key --lsign-key "lilac@build.archlinuxcn.org"
#RUN echo 'Server = https://mirrors.cernet.edu.cn/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist 
RUN echo '[archlinuxcn]' >> /etc/pacman.conf 
RUN echo 'Server = https://mirrors.cernet.edu.cn/archlinuxcn/$arch' >> /etc/pacman.conf
RUN pacman -Syu --noconfirm
RUN pacman -Sy --noconfirm --needed git sudo archlinuxcn-keyring
# https://aur.chaotic.cx/docs
RUN pacman-key --recv-key 3056513887B78AEB --keyserver keyserver.ubuntu.com && \
pacman-key --lsign-key 3056513887B78AEB && \
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-keyring.pkg.tar.zst' && \
pacman -U 'https://cdn-mirror.chaotic.cx/chaotic-aur/chaotic-mirrorlist.pkg.tar.zst'
RUN echo '[chaotic-aur]' >> /etc/pacman.conf 
RUN echo 'Include = /etc/pacman.d/chaotic-mirrorlist' >> /etc/pacman.conf
RUN pacman -Syu --noconfirm
RUN useradd -m -G wheel -s /bin/bash pkgbuilder
RUN usermod -aG wheel pkgbuilder
RUN echo '%wheel ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers
USER pkgbuilder
WORKDIR /app

# alias dockerpkg='docker run -it --rm -v /home/deng/myresources/archworks/pkgbuilder:/app:rw archpkgbuilder:v20240914 /bin/bash'
# dockerpkg -c 'cd /app/wechat-universal-bwrap && makepkg -s --noconfirm'

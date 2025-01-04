#FROM archlinux
FROM archlinux:base-devel
RUN pacman-key --init
#RUN pacman-key --lsign-key "lilac@build.archlinuxcn.org"
#RUN echo 'Server = https://mirrors.cernet.edu.cn/archlinux/$repo/os/$arch' > /etc/pacman.d/mirrorlist 
RUN echo '[archlinuxcn]' >> /etc/pacman.conf 
RUN echo 'Server = https://repo.archlinuxcn.org/$arch' >> /etc/pacman.conf
RUN pacman -Syu --noconfirm
RUN pacman -Sy --noconfirm --needed git sudo archlinuxcn-keyring
# https://aur.chaotic.cx/docs
RUN echo '[chaotic-aur]' >> /etc/pacman.conf 
RUN echo 'SigLevel = Optional TrustAll' >> /etc/pacman.conf 
RUN echo 'Server = https://de-4-mirror.chaotic.cx/chaotic-aur/$arch' >> /etc/pacman.conf
RUN pacman -Syu --noconfirm
RUN useradd -m -G wheel -s /bin/bash pkgbuilder
RUN usermod -aG wheel pkgbuilder
RUN echo '%wheel ALL=(ALL:ALL) NOPASSWD: ALL' >> /etc/sudoers
USER pkgbuilder
WORKDIR /app

# alias dockerpkg='docker run -it --rm -v /home/deng/myresources/archworks/pkgbuilder:/app:rw archpkgbuilder:v20240914 /bin/bash'
# dockerpkg -c 'cd /app/wechat-universal-bwrap && makepkg -s --noconfirm'

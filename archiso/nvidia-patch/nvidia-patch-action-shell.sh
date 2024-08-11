#iso patch
cp -rf archiso/nvidia-patch/etc/* archiso/airootfs/etc/
#packages
cat archiso/nvidia-patch/packages.x86_64.append >> archiso/packages.x86_64
#build
sed -i 's/iso_name="archlinux"/iso_name="archlinux-for-nvidia"/g' archiso/profiledef.sh
#chroot
cat archiso/nvidia-patch/etc.calamares.modules.shellprocess-final.conf.append >> archiso/airootfs/etc/calamares/modules/shellprocess-final.conf
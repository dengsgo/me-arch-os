mkdir -p archiso/airootfs/etc/skel/.local/share/icons

# Cursor Icon
wget https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.7/Bibata-Modern-Ice.tar.xz
tar -Jxf Bibata-Modern-Ice.tar.xz
cp -rf Bibata-Modern-Ice archiso/airootfs/etc/skel/.local/share/icons/
ls -al archiso/airootfs/etc/skel/.local/share/icons/
echo "Cursor Icon Path: archiso/airootfs/etc/skel/.local/share/icons/"
ls -al archiso/airootfs/etc/skel/.local/share/icons/Bibata-Modern-Ice

# Icon
wget -O Qogir.tar.xz https://sourceforge.net/projects/mearch/files/theme/Icons-01-Qogir-2024-07-29.tar.xz/download
tar -Jxf Qogir.tar.xz
cp -rf Qogir archiso/airootfs/etc/skel/.local/share/icons/
ls -al archiso/airootfs/etc/skel/.local/share/icons/
echo "Icons Path: archiso/airootfs/etc/skel/.local/share/icons/"
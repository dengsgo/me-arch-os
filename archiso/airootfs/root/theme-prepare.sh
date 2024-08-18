# Cursor Icon
wget https://github.com/ful1e5/Bibata_Cursor/releases/download/v2.0.7/Bibata-Modern-Ice.tar.xz
tar -Jxf Bibata-Modern-Ice.tar.xz
mkdir -p archiso/airootfs/usr/share/icons
cp -rf Bibata-Modern-Ice archiso/airootfs/usr/share/icons/
ls -al archiso/airootfs/usr/share/icons/
echo "Cursor Icon Path: archiso/airootfs/usr/share/icons/Bibata-Modern-Ice"
ls -al archiso/airootfs/usr/share/icons/Bibata-Modern-Ice
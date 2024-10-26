mkdir -p archiso/airootfs/etc/skel/.local/share/icons

# local repo
mkdir -p /mearch-os/repo
wget -O mearch-os-repo.tar.gz https://sourceforge.net/projects/mearch/files/package/mearch-os-repo.tar.gz/download
tar -zxvf mearch-os-repo.tar.gz
cp -rf x86_64 /mearch-os/repo/

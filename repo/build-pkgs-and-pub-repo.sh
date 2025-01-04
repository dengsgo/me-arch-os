# const var
repo_db="mearch-os.db.tar.gz"
tar_target="mearch-os-repo.tar.gz"

buildpkg() {
    echo "==== Building $1 ====="
    cd repo/$1 && \
    makepkg -s --noconfirm && \
    mv *.pkg.tar.zst ../x86_64/
    pwd
    cd ../..
}

# repo arch directory
mkdir -p repo/x86_64

buildpkg "mearch-os-release"
buildpkg "mearch-os-repo"
buildpkg "cursor-bibata"
buildpkg "icons-qogir"
buildpkg "calamares"
buildpkg "mkinitcpio-openswap"

echo "==== Arch Directory ====="
ls -al repo/x86_64

# echo "==== Building ckbcomp ====="
# cd repo/ckbcomp && \
# makepkg -s --noconfirm && \
# mv *.pkg.tar.zst ../x86_64/

# pwd
# cd ../..

echo "==== Download ckbcomp ====="
sudo pacman -Sw --noconfirm ckbcomp microsoft-edge-stable-bin
wget -O repo/x86_64/klassy-6.2.breeze6.2.1-1-x86_64.pkg.tar.zst https://download.opensuse.org/repositories/home:/paul4us/Arch/x86_64/klassy-6.2.breeze6.2.1-1-x86_64.pkg.tar.zst
cp /var/cache/pacman/pkg/ckbcomp-*.pkg.tar.zst repo/x86_64/
cp /var/cache/pacman/pkg/microsoft-edge-stable-bin-*.pkg.tar.zst repo/x86_64/

echo "==== Arch Directory ====="
ls -al repo/x86_64

echo "==== Repo-Add Packages ====="
cd repo/x86_64 && \
ls -al | grep .pkg.tar.zst | grep -v debug | awk '{print $9}' | xargs repo-add $repo_db

pwd
cd ../..

echo "==== Repo TAR ====="
cd repo && \
tar zcvf $tar_target x86_64

chmod -R 777 x86_64

echo "==== Show: mearch-os-repo.tar.gz ====="
ls -al $tar_target

# now , use GitHub Actions to publish. bye
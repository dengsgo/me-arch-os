# const var
repo_db="mearch-os.db.tar.gz"
tar_target="mearch-os-repo.tar.gz"

# repo arch directory
mkdir -p repo/x86_64

echo "==== Building calamares ====="
cd repo/calamares-3.3.9 && \
makepkg -s --noconfirm && \
mv *.pkg.tar.zst ../x86_64/

pwd
cd ../..

echo "==== Arch Directory ====="
ls -al repo/x86_64

echo "==== Building mkinitcpio-openswap ====="
cd repo/mkinitcpio-openswap && \
makepkg -s --noconfirm && \
mv *.pkg.tar.zst ../x86_64/

pwd
cd ../..

echo "==== Building ckbcomp ====="
cd repo/ckbcomp && \
makepkg -s --noconfirm && \
mv *.pkg.tar.zst ../x86_64/

pwd
cd ../..

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

echo "==== Show: mearch-os-repo.tar.gz ====="
ls -al $tar_target

# now , use GitHub Actions to publish. bye
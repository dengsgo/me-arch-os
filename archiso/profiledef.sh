#!/usr/bin/env bash
# shellcheck disable=SC2034

iso_name="archlinux"
iso_label="MEARCH_$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y%m%d)"
iso_publisher="MeArch <https://www.yoytang.com>"
iso_application="MeArch Live/Rescue DVD"
iso_version="$(date --date="@${SOURCE_DATE_EPOCH:-$(date +%s)}" +%Y.%m.%d-%H)"
install_dir="arch"
buildmodes=('iso')
bootmodes=('bios.syslinux.mbr' 'bios.syslinux.eltorito'
           'uefi-ia32.systemd-boot.esp' 'uefi-x64.systemd-boot.esp'
           'uefi-ia32.systemd-boot.eltorito' 'uefi-x64.systemd-boot.eltorito')
arch="x86_64"
pacman_conf="pacman.conf"
airootfs_image_type="squashfs"
airootfs_image_tool_options=('-comp' 'xz' '-Xbcj' 'x86' '-b' '1M' '-Xdict-size' '1M')
bootstrap_tarball_compression=('zstd' '-c' '-T0' '--auto-threads=logical' '--long' '-19')
file_permissions=(
  ["/etc/shadow"]="0:0:400"
  ["/root"]="0:0:750"

  ["/root/.automated_script.sh"]="0:0:755"
  ["/root/.gnupg"]="0:0:700"
  ["/root/.config"]="0:0:700"
  ["/root/initial-optimization-for-china.sh"]="0:0:777"
  ["/root/install-nvidia-after-hook.sh"]="0:0:777"
  ["/root/.config/plasmashellrc"]="0:0:666"
  ["/root/.config/kactivitymanagerdrc"]="0:0:666"
  ["/root/.config/plasma-org.kde.plasma.desktop-appletsrc"]="0:0:666"
  ["/usr/local/bin/choose-mirror"]="0:0:755"
  ["/usr/local/bin/Installation_guide"]="0:0:755"
  ["/usr/local/bin/livecd-sound"]="0:0:755"
  ["/etc/polkit-1/rules.d"]="0:0:750"
  ["/etc/sudoers.d"]="0:0:750"
  ["/etc/environment"]="0:0:644"
  ["/usr/local/bin/alci-make-a-pure-arch"]="0:0:755"
  ["/usr/local/bin/alci-displaymanager-check"]="0:0:755"
  ["/usr/local/bin/get-nemesis-on-alci"]="0:0:755"
  ["/usr/local/bin/fix-keys"]="0:0:755"
)

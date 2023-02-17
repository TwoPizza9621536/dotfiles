#!/usr/bin/env bash

echo "Installing Packages"

packages=(
  arc-theme breeze-cursor-theme distrobox epson-inkjet-printer-escpr
  f33-backgrounds-gnome gnome-tweaks htop langpacks-en langpacks-ja
  langpacks-zh_CN materia-gtk-theme onedrive openssl papirus-icon-theme
  podman-docker simple-scan wl-clipboard yakuake zsh
)

rpm-ostree install $packages

unset packages

rpm-ostree install \
  https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
  https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm

sudo rpm-ostree apply-live --allow-replacement

rpm-ostree update \
  --uninstall rpmfusion-free-release-$(rpm -E %fedora).noarch \
  --uninstall rpmfusion-nonfree-release-$(rpm -E %fedora).noarch \
  --install rpmfusion-free-release \
  --install rpmfusion-nonfree-release \
  --install intel-media-driver \
  --install mozilla-openh264 \
  --install steam-devices

sudo rpm-ostree apply-live --allow-replacement

sudo systemctl disable NetworkManager-wait-online.service
sudo systemctl mask NetworkManager-wait-online.service

flatpaks=(
  Calendar
  Contacts
  Connections
  Evince
  Maps
)

for flatpak in $flatpaks; do
  flatpak uninstall --system --delete-data $flatpak -y
done

unset flatpak flatpaks


#!/usr/bin/env bash

echo "Installing Toolbox Bootstrap"

packages=(
  "@C Development Tools and Libraries" "@Development Libraries"
  "@Development Tools" bzip2-devel cmake gdbm-devel gd-devel langpacks-en
  libcurl-devel libedit-devel libffi-devel libjpeg-turbo-devel libtidy-devel
  libpq-devel libxslt-devel libyaml-devel libzip-devel mlocate oniguruma-devel
  openssl-devel perl-App-cpanminus pip readline-devel sqlite-devel re2c tk-devel
  wl-clipboard zsh
)

toolbox create

toolbox run echo 'fastestmirror=True' | sudo tee -a /etc/dnf/dnf.conf
toolbox run echo 'max_parallel_downloads=10' | sudo tee -a /etc/dnf/dnf.conf
toolbox run echo 'deltarpm=True' | sudo tee -a /etc/dnf/dnf.conf
toolbox run echo 'defaultyes=True' | sudo tee -a /etc/dnf/dnf.conf

toolbox run sudo dnf -y install $packages
toolbox run sudo dnf -y upgrade
toolbox run sudo dnf clean all

unset packages

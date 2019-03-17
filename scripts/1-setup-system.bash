#!/bin/bash
set -eu


# Variables
# TODO put these in a separate file

tztest=UTC
tzconf=Etc/UTC

localetest=en_US.utf8
localeconf=en_US.UTF-8

psqlver=10
pgisver=2.4

packages=(
    postgresql-$psqlver
    postgresql-contrib-$psqlver
    postgresql-$psqlver-postgis-$pgisver
)


# Setup

echo = Update package cache
sudo apt-get update
echo

echo = Ensure timezone
# Note: Vagrant and AWS EC2 use UTC by default
if [ "$(date +%Z)" != "$tztest" ]
then
  printf '%s\n' "$tzconf" | sudo tee /etc/timezone >/dev/null
  sudo dpkg-reconfigure -f noninteractive tzdata
fi
echo

echo = Generate locale
if ! localedef --list | grep -qxF -e "$localetest"
then
  sudo locale-gen "$localeconf"
fi
echo

echo = Install packages
sudo apt-get --assume-yes install "${packages[@]}"
echo

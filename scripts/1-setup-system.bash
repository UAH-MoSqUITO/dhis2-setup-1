#!/bin/bash
set -eu


# Variables
# TODO put these in a separate file

tztest=UTC
tzconf=Etc/UTC

localetest=en_US.utf8
localeconf=en_US.UTF-8


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

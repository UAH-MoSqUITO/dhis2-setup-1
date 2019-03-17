#!/bin/bash
set -eu

echo = Update package cache
sudo apt-get update
echo

echo = Ensure UTC timezone
# Note: Vagrant and AWS EC2 use UTC by default
if [ "$(date +%Z)" != UTC ]
then
  cat Etc/UTC | sudo tee /etc/timezone >/dev/null
  sudo dpkg-reconfigure -f noninteractive tzdata
fi
echo

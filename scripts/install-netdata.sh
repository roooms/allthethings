#!/usr/bin/env bash

sudo apt-get update --fix-missing && sudo apt-get install --yes zlib1g-dev uuid-dev libmnl-dev gcc make git autoconf autoconf-archive autogen automake pkg-config curl jq nodejs

git clone https://github.com/firehol/netdata.git --depth=1

pushd netdata
sudo ./netdata-installer.sh --dont-wait
sudo cp system/netdata-lsb /etc/init.d/netdata
sudo chmod +x /etc/init.d/netdata
sudo update-rc.d netdata defaults
popd

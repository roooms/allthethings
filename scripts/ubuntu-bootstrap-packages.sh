#!/usr/bin/env bash

# useful packages for most builds
sudo apt-get update --fix-missing
sudo apt-get install --yes \
autoconf \
autogen \
automake \
avahi-daemon \
build-essential \
curl \
dnsmasq \
dstat \
gcc \
git \
iperf \
libdigest-hmac-perl \
libmnl-dev \
libpam0g-dev \
make \
pkg-config \
python-pip \
r-base \
r-cran-plyr \
r-cran-ggplot2 \
s3cmd \
sysstat \
tidy \
uuid-dev \
vim \
wget \
zlib1g-dev

# vim syntax highlighting for easy escript, app.config and vm.args editing
echo \
"syntax on
filetype on
au BufNewFile,BufRead app*.config set filetype=erlang
au BufNewFile,BufRead *.escript set filetype=erlang
au BufNewFile,BufRead vm*.args set filetype=sh" | tee -a ~/.vimrc

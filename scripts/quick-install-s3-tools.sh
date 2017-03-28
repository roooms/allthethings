#!/usr/bin/env bash

config_path="$(dirname "${BASH_SOURCE[0]}")/../config"

# s3curl
sudo wget https://raw.githubusercontent.com/rtdp/s3curl/master/s3curl.pl -O /usr/local/bin/s3curl.pl && sudo chmod +x /usr/local/bin/s3curl.pl
cp -v "${config_path}"/s3curl/dot_s3curl ~/.s3curl && chmod 600 ~/.s3curl

# s3cmd
cp -v "${config_path}"/s3cmd/dot_s3cfg ~/.s3cfg && chmod 600 ~/.s3cfg

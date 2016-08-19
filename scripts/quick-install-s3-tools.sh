#!/usr/bin/env bash

# s3curl
wget https://raw.githubusercontent.com/rtdp/s3curl/master/s3curl.pl -O ~/s3curl.pl && chmod u+x ~/s3curl.pl
cp -v /setup/config/s3curl/dot_s3curl ~/.s3curl && chmod 600 ~/.s3curl

# s3cmd
cp -v /setup/config/s3cmd/dot_s3cfg ~/.s3cfg && chmod 600 ~/.s3cfg

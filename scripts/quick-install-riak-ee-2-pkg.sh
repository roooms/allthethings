#!/usr/bin/env bash

sudo dpkg -P riak-ee
sudo dpkg -i /setup/riak-ee/riak-ee_2.0.6-1_amd64.deb

/setup/scripts/quick-configure-riak-2-pkg.sh

sudo riak start
sudo riak-admin wait-for-service riak_kv

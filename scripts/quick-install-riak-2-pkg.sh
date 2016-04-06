#!/usr/bin/env bash

sudo dpkg -P riak
sudo dpkg -i /setup/riak/riak_2.1.1-1_amd64.deb

/setup/scripts/quick-configure-riak-2-pkg.sh

sudo riak start
sudo riak-admin wait-for-service riak_kv

#!/usr/bin/env bash

export riak_package="riak/riak_2.0.7-1_amd64.deb"
#export riak_package="riak/riak_2.1.1-1_amd64.deb"
#export riak_package="riak-ee/riak-ee_2.1.3-1_amd64.deb"

/setup/scripts/quick-uninstall-pkg.sh

sudo dpkg -i /setup/${riak_package}

/setup/scripts/quick-configure-riak-2-pkg.sh

read -r -p "Start Riak? [y/N] " response
if [[ ${response} =~ ^([yY])$ ]]; then
    sudo riak start
    sudo riak-admin wait-for-service riak_kv
fi

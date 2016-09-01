#!/usr/bin/env bash

script_path="$(dirname ${BASH_SOURCE[0]})"
riak_package="/setup/riak/riak_2.0.7-1_amd64.deb"
#riak_package="/setup/riak/riak_2.1.1-1_amd64.deb"
#riak_package="/setup/riak-ee/riak-ee_2.1.3-1_amd64.deb"

${script_path}/quick-uninstall-pkg.sh

sudo dpkg -i ${riak_package}

${script_path}/quick-configure-riak-2-pkg.sh

read -r -p "Start Riak? [y/N] " response
if [[ ${response} =~ ^([yY])$ ]]; then
    sudo riak start
    sudo riak-admin wait-for-service riak_kv
fi

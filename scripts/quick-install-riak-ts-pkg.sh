#!/usr/bin/env bash

script_path="$(dirname "${BASH_SOURCE[0]}")"
riak_package="/setup/riak-ts/riak-ts_1.4.0-1_amd64.deb"

"${script_path}"/quick-uninstall-pkg.sh

sudo dpkg -i ${riak_package}

"${script_path}"/quick-configure-riak-2-pkg.sh

read -r -p "Start Riak? [y/N] " response
if [[ ${response} =~ ^([yY])$ ]]; then
    sudo riak start
    sudo riak-admin wait-for-service riak_kv
fi

"${script_path}"/install-riak-python-client.sh

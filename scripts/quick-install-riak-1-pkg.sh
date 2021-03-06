#!/usr/bin/env bash

script_path="$(dirname "${BASH_SOURCE[0]}")"
riak_package="/setup/riak/riak_1.4.12-1_amd64.deb"
#riak_package="/setup/riak-ee/riak-ee_1.4.12-2_amd64.deb"

"${script_path}"/quick-uninstall-pkg.sh

check_package_exists() {
    if [[ ! -f "${1}" ]]; then
        echo "Couldn't find ${1}"
        exit 1
    fi
}

check_package_exists ${riak_package}

sudo dpkg -i ${riak_package}

"${script_path}"/quick-configure-riak-1-pkg.sh

read -r -p "Start Riak? [y/N] " response
if [[ ${response} =~ ^([yY])$ ]]; then
    sudo riak start
    sudo riak-admin wait-for-service riak_kv
fi

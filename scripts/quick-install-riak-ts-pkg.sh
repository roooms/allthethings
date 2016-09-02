#!/usr/bin/env bash

script_path="$(dirname ${BASH_SOURCE[0]})"
riak_package="/setup/riak-ts/riak-ts_1.4.0-1_amd64.deb"

${script_path}/quick-uninstall-pkg.sh

sudo dpkg -i ${riak_package}

${script_path}/quick-configure-riak-2-pkg.sh

read -r -p "Start Riak? [y/N] " response
if [[ ${response} =~ ^([yY])$ ]]; then
    sudo riak start
    sudo riak-admin wait-for-service riak_kv
fi

${script_path}/install-riak-python-client.sh

# initial table setup
sudo su riak
riak-admin bucket-type create GeoCheckin '{"props":{"table_def": "CREATE TABLE GeoCheckin (myfamily varchar not null, myseries varchar not null, time timestamp not null, weather varchar not null, temperature double, PRIMARY KEY ((myfamily, myseries, quantum(time, 15, 'm')), myfamily, myseries, time))"}}'
riak-admin bucket-type activate GeoCheckin
riak-admin bucket-type status GeoCheckin
exit

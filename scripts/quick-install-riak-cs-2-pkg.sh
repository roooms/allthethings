#!/usr/bin/env bash

script_path="$(dirname ${BASH_SOURCE[0]})"
riak_package="/setup/riak/riak_2.0.5-1_amd64.deb"
riak_cs_package="/setup/riak-cs/riak-cs_2.0.1-1_amd64.deb"
stanchion_package="/setup/stanchion/stanchion_2.0.0-1_amd64.deb"

${script_path}/quick-uninstall-pkg.sh

sudo dpkg -i ${riak_package} \
             ${riak_cs_package} \
             ${stanchion_package}

${script_path}/quick-configure-riak-2-pkg.sh
${script_path}/quick-configure-riak-cs-2-pkg.sh
${script_path}/quick-configure-stanchion-2-pkg.sh

sudo riak start
sudo riak-admin wait-for-service riak_kv

tar xf /setup/riak-cs/riak-cs_users.tar.gz -C /tmp
tar xf /setup/riak-data-migrator/riak-data-migrator-0.2.9-bin.tar.gz -C /tmp

java -jar /tmp/riak-data-migrator-0.2.9/riak-data-migrator-0.2.9.jar -l -r /tmp/riak-cs_users -a -h localhost

echo "Admin user installed"
echo "key_id: OZ6D0GWO2DOUCXMB6I3H"
echo "key_secret: ra3KmFveS-SqCoFIta58Mqd3qN7umE2hnunGag=="

sudo riak-cs start
sudo stanchion start

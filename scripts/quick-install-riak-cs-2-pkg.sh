#!/usr/bin/env bash

export riak_package="riak/riak_2.1.4-1_amd64.deb"
#export riak_package="riak/riak_2.1.1-1_amd64.deb"
#export riak_package="riak-ee/riak-ee_2.1.3-1_amd64.deb"
export riak-cs_package="riak-cs/riak-cs_2.1.1-1_amd64.deb"
export stanchion_package="stanchion/stanchion_2.1.0-1_amd64.deb"

/setup/scripts/quick-uninstall-pkg.sh

sudo dpkg -i /setup/${riak_package} \
             /setup/${riak-cs_package} \
             /setup/${stanchion_package}

/setup/scripts/quick-configure-riak-2-pkg.sh
/setup/scripts/quick-configure-riak-cs-2-pkg.sh
/setup/scripts/quick-configure-stanchion-2-pkg.sh

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

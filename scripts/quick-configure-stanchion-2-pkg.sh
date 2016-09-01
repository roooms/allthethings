#!/usr/bin/env bash

stanchion_hostname="$(hostname --fqdn)"
stanchion_ipaddr="0.0.0.0"

# stanchion configuration
echo "nodename = stanchion@${stanchion_hostname}" | sudo tee -a /etc/stanchion/stanchion.conf
echo "listener = ${stanchion_ipaddr}:8085" | sudo tee -a /etc/stanchion/stanchion.conf

# this relies on riak-data-migrator import of moss.users
echo "admin.key = OZ6D0GWO2DOUCXMB6I3H" | sudo tee -a /etc/stanchion/stanchion.conf
echo "admin.secret = ra3KmFveS-SqCoFIta58Mqd3qN7umE2hnunGag==" | sudo tee -a /etc/stanchion/stanchion.conf

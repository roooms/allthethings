#!/usr/bin/env bash

export riak_cs_hostname="$(hostname --fqdn)"
export riak_cs_ipaddr="0.0.0.0"
export riak_cs_version="$(sudo riak-cs version)"

# redirect port 80 to 8080 for local traffic
sudo iptables --table nat --insert OUTPUT --protocol tcp --out-interface lo --dport 80 --jump REDIRECT --to-ports 8080 -v

# riak configuration for riak-cs
echo "buckets.default.allow_mult = true" | sudo tee -a /etc/riak/riak.conf
echo "storage_backend = riak_cs_kv_multi_backend" | sudo tee -a /etc/riak/riak.config
sed -e "s/X.X.X/${riak_cs_version}/g" /setup/config/riak-cs/advanced.config | sudo tee /etc/riak-cs/advanced.config

# riak-cs configuration
echo "nodename = riak-cs@${riak_cs_hostname}" | sudo tee -a /etc/riak-cs/riak-cs.conf
echo "listener = ${riak_cs_ipaddr}:8080" | sudo tee -a /etc/riak-cs/riak-cs.conf

# riak-cs-ee configuration
# todo: consider proxy_get

# this relies on riak-data-migrator import of moss.users
echo "admin.key = OZ6D0GWO2DOUCXMB6I3H" | sudo tee -a /etc/riak-cs/riak-cs.conf
echo "admin.secret = ra3KmFveS-SqCoFIta58Mqd3qN7umE2hnunGag==" | sudo tee -a /etc/riak-cs/riak-cs.conf

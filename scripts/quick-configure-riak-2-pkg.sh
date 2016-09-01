#!/usr/bin/env bash

riak_hostname="$(hostname --fqdn)"
riak_ipaddr="0.0.0.0"

# riak configuration
echo "nodename = riak@${riak_hostname}" | sudo tee -a /etc/riak/riak.conf
echo "anti_entropy = passive" | sudo tee -a /etc/riak/riak.conf
echo "listener.http.internal = ${riak_ipaddr}:8098" | sudo tee -a /etc/riak/riak.conf
echo "listener.protobuf.internal = ${riak_ipaddr}:8087" | sudo tee -a /etc/riak/riak.conf
echo "ring_size = 16" | sudo tee -a /etc/riak/riak.conf
echo "javascript.map_pool_size = 0" | sudo tee -a /etc/riak/riak.conf
echo "javascript.reduce_pool_size = 0" | sudo tee -a /etc/riak/riak.conf
echo "javascript.hook_pool_size = 0" | sudo tee -a /etc/riak/riak.conf

# riak-ee configuration
[ -f "/etc/riak/advanced.config" ] && sed -e "s/127.0.0.1/${riak_ipaddr}/g" /etc/riak/advanced.config | sudo tee /etc/riak/advanced.config

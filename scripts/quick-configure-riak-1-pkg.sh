#!/usr/bin/env bash

riak_hostname="$(hostname --fqdn)"
riak_ipaddr="0.0.0.0"

# riak app.config configuration
sed -e "s/127.0.0.1/${riak_ipaddr}/g" \
    -e "s/%{ring_creation_size, 64}/{ring_creation_size, 16}/g" \
    -e "s/{anti_entropy, {on/{anti_entropy, {off/g" \
    -e "s/{map_js_vm_count, 8 }/{map_js_vm_count, 0 }/g" \
    -e "s/{reduce_js_vm_count, 6 }/{reduce_js_vm_count, 0 }/g" \
    -e "s/{hook_js_vm_count, 2 }/{hook_js_vm_count, 0 }/g" \
    /etc/riak/app.config | sudo tee /etc/riak/app.config

sed -e "s/127.0.0.1/${riak_hostname}/g" \
    /etc/riak/vm.args | sudo tee /etc/riak/vm.args

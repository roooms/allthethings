#!/usr/bin/env bash

export riak_hostname="$(hostname --fqdn)"
export riak_ipaddr="0.0.0.0"

# riak configuration
/setup/scripts/quick-configure-riak-2-pkg.sh

# riak-ee configuration
sed -e 's/127.0.0.1/0.0.0.0/g' /etc/riak/advanced.config | sudo tee /etc/riak/advanced.config

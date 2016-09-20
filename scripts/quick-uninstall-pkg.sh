#!/usr/bin/env bash

sudo riak-cs stop
sudo stanchion stop
sudo riak stop

sudo dpkg -P riak-cs stanchion riak riak-ts riak-ee
sudo rm -rfv /etc/riak/ /usr/lib/riak /var/lib/riak/
sudo rm -rfv /etc/riak-cs/ /usr/lib/riak-cs/ /var/lib/riak-cs/
sudo rm -rfv /etc/stanchion/ /usr/lib/stanchion/ /var/lib/stanchion/

# todo: this could be cleaned up to check if something is running/installed before attempting stop/removal

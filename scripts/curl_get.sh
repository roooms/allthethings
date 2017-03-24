#!/usr/bin/env bash

# defaults
riak_ip="localhost"
riak_port="8098"
bucket_type="default"
bucket="b1"
first_key="001"
last_key="100"

usage()
{
    echo "Usage: $0 -s [riak_ip] -p [riak_port] -t [bucket_type] -b [bucket] -f [first_key] -l [last_key]"
}

# get options
while getopts "hs:p:t:b:f:l:" option; do
    case $option in
        h)
            usage
            exit
        ;;
        s)
            riak_ip=$OPTARG
        ;;
        p)
            riak_port=$OPTARG
        ;;
        t)
            bucket_type=$OPTARG
        ;;
        b)
            bucket=$OPTARG
        ;;
        f)
            first_key=$OPTARG
        ;;
        l)
            last_key=$OPTARG
        ;;
    esac
done

# define bucket url based on Riak version
if [ $bucket_type != "default" ]; then
    riak_bucket_url="http://${riak_ip}:${riak_port}/types/${bucket_type}/buckets/${bucket}"
else
    riak_bucket_url="http://${riak_ip}:${riak_port}/buckets/${bucket}"
fi

# curl the bucket properties and check for a HTTP 200 response
riak_http_check=$(curl --silent --head "${riak_bucket_url}/props" | head --lines 1 | grep "200")

# run loop
if [[ -n ${riak_http_check} ]]; then
    for key in $(eval echo "{$first_key..$last_key}"); do
        riak_key_url="${riak_bucket_url}/keys/${key}"
        echo "[info] GET ${riak_key_url}" \
        && curl -s -XGET "${riak_key_url}"
    done
else
    echo "[error] ${riak_bucket_url}/props did not return an HTTP 200 response"
fi

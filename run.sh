#!/bin/bash

client='saccy'

docker run \
    --rm \
    -d \
    -p 1194:1194/udp \
    -e EASYRSA_BATCH=1 \
    -e PUBLIC_DNS="$(curl -s http://169.254.169.254/latest/meta-data/public-hostname)" \
    -e CLIENT=${client} \
    -e DEBUG=1 \
    -v /tmp/docker_out/:/docker_out/:Z \
    --cap-add=NET_ADMIN \
    saccy/docker_ovpn

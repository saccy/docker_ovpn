#!/bin/sh

public_dns=$PUBLIC_DNS
client='client'

touch /etc/openvpn/vars &> /dev/null
ovpn_genconfig -u udp://$public_dns &> /dev/null
ovpn_initpki nopass &> /dev/null
easyrsa build-client-full $client nopass &> /dev/null
ovpn_getclient $client > /docker_out/$client.ovpn
echo 'start client cert'
cat /docker_out/$client.ovpn
echo 'end client cert'
ovpn_run &> /dev/null

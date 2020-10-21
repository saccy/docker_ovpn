#!/bin/sh

touch /etc/openvpn/vars &> /dev/null
ovpn_genconfig -u udp://$PUBLIC_DNS &> /dev/null
ovpn_initpki nopass &> /dev/null
easyrsa build-client-full $CLIENT nopass &> /dev/null
ovpn_getclient $CLIENT > /docker_out/$CLIENT.ovpn
echo 'start client cert'
cat /docker_out/$CLIENT.ovpn
echo 'end client cert'
ovpn_run &> /dev/null

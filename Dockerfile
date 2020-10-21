FROM kylemanna/openvpn:latest

COPY files/start_ovpn.sh /start_ovpn.sh

RUN mkdir /docker_out

RUN chmod 755 /start_ovpn.sh

ENTRYPOINT [ "/start_ovpn.sh" ]

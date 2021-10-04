FROM debian:11

RUN apt update && apt install -y \
	openvpn \
	git

COPY server.conf /etc/openvpn/server/
COPY client.conf /etc/openvpn/client/

RUN cd /root && git clone https://github.com/OpenVPN/easy-rsa

WORKDIR /root/easy-rsa/easyrsa3/

COPY scripts/* /usr/local/bin/
RUN chmod +x /usr/local/bin/*

ENV EASYRSA_BATCH="yes" \
	EASYRSA_PKI="/etc/openvpn/pki"

VOLUME ["/etc/openvpn"]

EXPOSE 1194/udp

CMD ["run_openvpn"]

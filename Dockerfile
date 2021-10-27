FROM debian:10

LABEL maintainer="Paul Morris"
ARG NORDVPN_VER=3.11.0-1

HEALTHCHECK --start-period=1m --interval=10m \
	CMD if test "$( curl -m 25 -s https://api.nordvpn.com/v1/helpers/ips/insights | jq -r '.["protected"]' )" != "true" ; then exit 1; fi

RUN apt-get update -y && \
    apt-get install -y dante-server curl jq nano && \
    curl https://repo.nordvpn.com/deb/nordvpn/debian/pool/main/nordvpn-release_1.0.0_all.deb --output /tmp/nordrepo.deb && \
    apt-get install -y /tmp/nordrepo.deb && \
    apt-get update -y && \
    apt-get install -y nordvpn${NORDVPN_VER:+=$NORDVPN_VER} && \
    apt-get remove -y nordvpn-release && \
    apt-get autoremove -y && \
    apt-get autoclean -y && \
    rm -rf \
		/tmp/* \
		/var/cache/apt/archives/* \
		/var/lib/apt/lists/* \
		/var/tmp/*

COPY configs/config /
COPY configs/start.sh /
COPY configs/sockd.conf /etc/
RUN chmod 777 /start.sh
RUN chmod 777 /config
RUN touch /var/log/dante.log
RUN adduser --disabled-password --gecos "" --shell /usr/sbin/nologin vpn
RUN mkdir -p /run/nordvpn

ENTRYPOINT [ "/start.sh" ]

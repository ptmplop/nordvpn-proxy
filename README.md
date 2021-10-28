# nordvpn-proxy

Run the container as follows:
docker run -it --rm --cap-add NET_ADMIN -p 1080:1080 -e USER=<nordvpn-username> -e PASS='<nordvpn password>' -e COUNTRY=Singapore ptmplop/nordvpn-proxy:latest

Countries that require a space can be used as follows:
COUNTRY='Hong Kong' OR COUNTRY=Hong_Kong
COUNTRY='United Kingdom' OR COUNTRY=United_Kingdom

An invalid entry on the country will display a list of available countries.

You can run multiple containers on different ports if necessary.

# nordvpn-proxy

Run the container as follows: <br>
<code>docker run -it --rm --cap-add NET_ADMIN -p 1080:1080 -e USER={nord user} -e PASS='{nord pwd}' -e COUNTRY={} ptmplop/nordvpn-proxy:latest  </code> 
<br><br>Countries that require a space can be used as follows:  <br>
COUNTRY='Hong Kong' OR COUNTRY=Hong_Kong  <br>
COUNTRY='United Kingdom' OR COUNTRY=United_Kingdom  <br>

An invalid entry on the country will display a list of available countries. <br>

You can run multiple containers on different ports if necessary.

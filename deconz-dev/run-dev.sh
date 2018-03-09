#!/bin/bash

#url=$(wget "https://www.dresden-elektronik.de/funktechnik/products/software/pc/deconz/" -O - |grep "(Raspbian Linux)"|sed -e "s/.*href=\"//" -e "s/\"\ .deCONZ.*//"|head -n 1|sed -e "s/\?L=.*\&amp;eID/\?eID/" -e "s/amp\;//")
url='https://www.dresden-elektronik.de/rpi/deconz-dev/deconz-dev-2.05.11.deb'
wget $url -O deconz.deb
dpkg -i deconz.deb

chown root:root /usr/bin/deCONZ*
echo "deCONZ starting"
mkdir -p /root/.local/share/dresden-elektronik/deCONZ/
ln -s /config/deconz.db  /root/.local/share/dresden-elektronik/deCONZ/zll.db
/usr/bin/deCONZ -platform minimal --auto-connect=1 --dbg-info=1  --http-port=80

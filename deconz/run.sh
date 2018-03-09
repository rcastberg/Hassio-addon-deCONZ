#!/bin/bash

wget -qN http://www.dresden-elektronik.de/rpi/deconz/deconz-latest.deb
dpkg -i deconz-latest.deb

chown root:root /usr/bin/deCONZ*
echo "deCONZ starting"
mkdir -p /root/.local/share/dresden-elektronik/deCONZ/
ln -s /config/deconz.db  /root/.local/share/dresden-elektronik/deCONZ/zll.db
/usr/bin/deCONZ -platform minimal --auto-connect=1 --dbg-info=1  --http-port=80

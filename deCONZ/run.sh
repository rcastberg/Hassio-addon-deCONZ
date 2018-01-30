#!/bin/bash

wget -qN http://www.dresden-elektronik.de/rpi/deconz/deconz-latest.deb
dpkg -i deconz-latest.deb

chown root:root /usr/bin/deCONZ*
echo "deCONZ starting"
/usr/bin/deCONZ -platform minimal --auto-connect=1 --dbg-info=1  --http-port=80

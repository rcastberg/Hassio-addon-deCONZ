#!/bin/bash
echo "deCONZ started"

wget -N http://www.dresden-elektronik.de/rpi/deconz/deconz-latest.deb
dpkg -i deconz-latest.deb

sed -i -- 's/$APPNAME $OPTIONS $EXTRA_OPTIONS/xvfb-run $APPNAME $OPTIONS $EXTRA_OPTIONS/g' /usr/bin/deCONZ-autostart.sh


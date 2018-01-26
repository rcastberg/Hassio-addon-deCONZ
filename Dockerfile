#armhf:FROM resin/rpi-raspbian:jessie

ENV LANG C.UTF-8
ENV VERSION %%VERSION%%
LABEL \
    io.hass.version="1" \
    io.hass.type="addon" \
    io.hass.arch="armhf"

# install packets
RUN apt-get update && apt-get upgrade && \
    apt-get install -y \
        wget \
        dpkg \
        libglib2.0-0 \
        libqt4-network \
        libqt4-xml \
        libqt4-gui \
        libqt4-sql \
        libqtcore4 \
        libqtdbus4 \
        qtcore4-l10n \
        libqt4-dbus \
        libqt4-script \
        libqt4-test \
        qdbus \
        qtchooser \
        libqt4-core \
        lxde \
        lightdm \
        xinit \
        xvfb \
        net-tools \
        iproute2 \
        iputils-ping \
        libqt5core5a \
        libqt5network5 \
        libqt5widgets5 \
        libqt5gui5 \
        libqt5serialport5 \
        libqt5websockets5 \
        libqt5sql5 \
        wiringpi \
        sqlite3 \
        && rm -rf /var/lib/apt/lists/*

RUN wget http://www.dresden-elektronik.de/rpi/deconz/deconz-latest.deb
RUN dpkg -i deconz-latest.deb
RUN mkdir /root/otau

COPY run.sh /
COPY config.txt /boot/
COPY cmdline.txt /boot/

RUN chmod a+x /run.sh
RUN sed -i -- 's/$APPNAME $OPTIONS $EXTRA_OPTIONS/xvfb-run $APPNAME $OPTIONS $EXTRA_OPTIONS/g' /usr/bin/deCONZ-autostart.sh
RUN sh -c 'echo "enable_uart=1" >> /boot/config.txt'
RUN sh -c 'echo "dtoverlay=pi3-miniuart-bt-overlay" >> /boot/config.txt'
CMD [ "/usr/bin/deCONZ-autostart.sh", "/run.sh" ]

# run with docker run --net host deconz &

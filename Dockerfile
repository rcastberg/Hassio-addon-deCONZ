FROM resin/rpi-raspbian:jessie

ENV LANG C.UTF-8
ENV VERSION %%VERSION%%
LABEL \
    io.hass.version="1" \
    io.hass.type="addon" \
    io.hass.arch="armhf"

# install packets
RUN apt-get update && apt-get upgrade 
RUN apt-get install -y \
        wget \
        dpkg \
        libglib2.0-0 \
        qdbus \
        qtchooser \
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
        sqlite3 
RUN rm -rf /var/lib/apt/lists/*

COPY config.txt /boot/
COPY cmdline.txt /boot/
RUN sh -c 'echo "enable_uart=1" >> /boot/config.txt'
RUN sh -c 'echo "dtoverlay=pi3-miniuart-bt-overlay" >> /boot/config.txt'

COPY run.sh /
RUN chmod a+x /run.sh


CMD [ "/run.sh" ]

# run with docker run --net host deconz &

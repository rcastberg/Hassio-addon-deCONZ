deCONZ
---------
This add-on allows deCONZ (from dresend-elektronik.de) to be managed directly from homeassistant (from the web part, not the rpi gui)
Installation doesn't work from within homeassistant, yet...
At the moment it needs to be executed manually from the rpi with:
```
docker run --net host deconz &
```
add this to your config to add it to homeassistant:
 ```yaml
panel_iframe:
  deconz:
    title: 'deCONZ'
    url: 'http://hassio.local:80/'
    icon: mdi:chart-donut-variant
 ```
To use utilize the zigbee devices in homeassistant, use the REST api: http://dresden-elektronik.github.io/deconz-rest-doc/ 
![homeassistant deCONZ gui](./image.png)

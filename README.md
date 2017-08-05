deCONZ
---------
This add-on allows deCONZ (from dresend-elektronik.de) to be managed directly from homeassistant (through the web service, not the rpi gui)
add this to your config to add it to homeassistant:
 ```yaml
panel_iframe:
  deconz:
    title: 'deCONZ'
    url: 'http://hassio.local:80/'
    icon: mdi:chart-donut-variant
 ```

![homeassistant deCONZ gui](./image.png)

# Z-Stack 1.2.2.a.44539 coordinator firmwares
This directory contains various CC2530, CC2530_CC2591 and CC2531 coordinator firmwares. There are 3 flavours available: `DEFAULT`, `MAX_DEVICES` and `MAX_STABILITY`.

## What firmware to choose?
As mentioned above, there are 3 different kind of flavours to choose from. What firmware to choose highly depends on what Zigbee network you are planning to use it with. If you don't know what to choose, it's good to start with the `DEFAULT` firmware. Later you can always reflash your device with a different firmware.

In order to make a good choice, it's recommended to first read [the Zigbee2mqtt FAQ about device limit](http://www.zigbee2mqtt.io/information/FAQ.html#i-read-that-zigbee2mqtt-has-a-limit-of-15-devices-is-this-true) and [Zigbee network](http://www.zigbee2mqtt.io/information/zigbee_network.html).

### Default
- Allows for 15 **directly** connected devices to the coordinator
- Should be fine for networks till +- 30/35 devices.

### Max stability
- Allows for 5 **directly** connected devices to the coordinator
- Reported to work fine for 50+ devices (limit not known yet)
- Should be used when experiencing stability issues with the `DEFAULT` firmware.

### Max devices
- Allows for 44 **directly** connected devices to the coordinator
- Should only be used when:
  - All devices will be in close range of the coordinator
  - You won't have routers in your network (or almost none)

## Compiling the firmware
In case you want to compile the firmware yourself, read [COMPILE.md](./COMPILE.md).

## Notes
- The CC2530_CC2591 firmware is also compatible with CC2530 + RFX2401 devices like the GBA GB2530S Zigbee USB-Stick.

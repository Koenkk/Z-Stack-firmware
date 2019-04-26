# Z-Stack coordinator firmwares
This repository contains various Z-Stack coordinator firmwares.

## Overiew
<table>
  <tr>
    <td><b>Z-Stack</b></td>
    <td><b>Device</b></td>
    <td><b>Zigbee</b></td>
    <td><b>Direct children</b></td>
    <td><b>Source routing</b></td>
    <td><b># of 3.0 devices</b></td>
    <td><b>Notes</b></td>
  </tr>
  <tr>
    <td rowspan="4">Z-Stack_Home_1.2</td>
    <td>CC2531</td>
    <td>1.2 HA</td>
    <td>25</td>
    <td>No</td>
    <td>-</td>
    <td> </td>
  </tr>
  <tr>
    <td>CC2530</td>
    <td>1.2 HA</td>
    <td>21</td>
    <td>No</td>
    <td>-</td>
    <td> </td>
  </tr>
  <tr>
    <td>CC2530 + CC2591</td>
    <td>1.2 HA</td>
    <td>21</td>
    <td>No</td>
    <td>-</td>
    <td> </td>
  </tr>
  <tr>
    <td>CC2530 + CC2592</td>
    <td>1.2 HA</td>
    <td>21</td>
    <td>No</td>
    <td>-</td>
    <td> </td>
  </tr>
  <tr>
    <td>Z-Stack_3.0.x</td>
    <td>CC2531</td>
    <td>3.0</td>
    <td>15</td>
    <td>No</td>
    <td>40</td>
    <td><a href="https://github.com/Koenkk/zigbee2mqtt/issues/1445">#1445</a></td>
  </tr>
  <tr>
    <td>Z-Stack_3.x.0</td>
    <td>CC2652R</td>
    <td>3.0</td>
    <td>20</td>
    <td>No</td>
    <td>40</td>
    <td><a href="https://github.com/Koenkk/zigbee2mqtt/issues/1429">#1429</a></td>
  </tr>
</table>

### Legend
- *Z-Stack:* Z-Stack is the Zigbee stack for Texas Instruments Zigbee devices
- *Device:* The Zigbee hardware
- *Zigbee:* Zigbee version, for more information read [What's New in Zigbee 3.0](http://www.ti.com/lit/an/swra615/swra615.pdf)
- *Direct children:* Number of children that directly can join the coordinator. Note that this is **not** the maximum network size. For more information, read [the Zigbee2mqtt FAQ about device limit](http://www.zigbee2mqtt.io/information/FAQ.html#i-read-that-zigbee2mqtt-has-a-limit-of-15-devices-is-this-true)
- *Source routing:* Allows the coordinator to remember the routes to the devices. Improves performance for larger (40+ nodes) networks. For more information read [Large ZigBee Networks and Source Routing
](http://cms.digi.com/resources/documentation/digidocs/90001537/references/r_large_zigbee_networks-source_routing.htm?TocPath=Working%20with%20Zigbee%7C_____14)
- *# of 3.0 devices:* Number of Zigbee 3.0 devices that can join the network. Does not apply to Zigbee 1.2 coordinator (no limit).

## Compiling the firmware
In case you want to compile the firmware yourself, you can find a `COMPILE.md` for each firmware.

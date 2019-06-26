# Z-Stack coordinator firmwares
This repository contains various Z-Stack coordinator firmwares.

## Overiew
<table>
  <tr>
    <td><b>Z-Stack</b></td>
    <td><b>Type</b></td>
    <td><b>Device</b></td>
    <td><b>Zigbee</b></td>
    <td><b>Direct children</b></td>
    <td><b>Notes</b></td>
  </tr>
  <tr>
    <td rowspan="4">Z-Stack_Home_1.2</td>
    <td rowspan="4">Default</td>
    <td>CC2531</td>
    <td>1.2 HA</td>
    <td>20</td>
    <td></td>
  </tr>
  <tr>
    <td>CC2530</td>
    <td>1.2 HA</td>
    <td>16</td>
    <td></td>
  </tr>
  <tr>
    <td>CC2530 + CC2591</td>
    <td>1.2 HA</td>
    <td>16</td>
    <td></td>
  </tr>
  <tr>
    <td>CC2530 + CC2592</td>
    <td>1.2 HA</td>
    <td>16</td>
    <td></td>
  </tr>
    <tr>
    <td rowspan="4">Z-Stack_Home_1.2</td>
    <td rowspan="4">Source routing</td>
    <td>CC2531</td>
    <td>1.2 HA</td>
    <td>5</td>
    <td></td>
  </tr>
  <tr>
    <td>CC2530</td>
    <td>1.2 HA</td>
    <td>5</td>
    <td></td>
  </tr>
  <tr>
    <td>CC2530 + CC2591</td>
    <td>1.2 HA</td>
    <td>5</td>
    <td></td>
  </tr>
  <tr>
    <td>CC2530 + CC2592</td>
    <td>1.2 HA</td>
    <td>5</td>
    <td></td>
  </tr>
  <tr>
    <td>Z-Stack_3.0.x</td>
    <td>Default</td>
    <td>CC2531</td>
    <td>3.0</td>
    <td>15</td>
    <td>
      - <a href="https://github.com/Koenkk/zigbee2mqtt/issues/1445">WIP (see #1445)</a>
      <br/>
      - Max 40 Zigbee 3.0 devices
    </td>
  </tr>
  <tr>
    <td>Z-Stack_3.x.0</td>
    <td>Default</td>
    <td>CC2652R</td>
    <td>3.0</td>
    <td>20</td>
    <td>
      - <a href="https://github.com/Koenkk/zigbee2mqtt/issues/1429">WIP (see #1429)</a>
      <br/>
      - Max 40 Zigbee 3.0 devices
    </td>
  </tr>
</table>

### I'm a Zigbee2mqtt users, which one should I use?
This depends:
- Zigbee 3.0 coordinators are still WIP and therefore not recommended for production.
- If you have a network of 1 - 30 devices, the Z-Stack_Home_1.2 **default** firmware is recommended.
- If you have a network of 30+ devices, the Z-Stack_Home_1.2 **source routing** firmware is recommended.
- Note that the **source routing** firmware only supports 5 direct children, therefore you need to have routers in range of the coordinator.

### Legend
- *Z-Stack:* Z-Stack is the Zigbee stack for Texas Instruments Zigbee devices
- *Type:* The source routing firmware allows the coordinator to remember the routes to the devices. Improves performance for larger (40+ nodes) networks. For more information read [Large ZigBee Networks and Source Routing
](http://cms.digi.com/resources/documentation/digidocs/90001537/references/r_large_zigbee_networks-source_routing.htm?TocPath=Working%20with%20Zigbee%7C_____14). Because of memory limitations, the number of direct children are reduced for these firmwares.
- *Device:* The Zigbee hardware
- *Zigbee:* Zigbee version, for more information read [What's New in Zigbee 3.0](http://www.ti.com/lit/an/swra615/swra615.pdf)
- *Direct children:* Number of children that directly can join the coordinator. Note that this is **not** the maximum network size. For more information, read [the Zigbee2mqtt FAQ about device limit](http://www.zigbee2mqtt.io/information/FAQ.html#i-read-that-zigbee2mqtt-has-a-limit-of-15-devices-is-this-true)

#### Notes
- Due to new security requirements in Zigbee 3.0, Zigbee 3.0 coordinators can only support a limited amount of Zigbee 3.0 devices. For Zigbee 1.2 coordinators there is no limit on the max number of Zigbee 3.0 devices that can join.

## Compiling the firmware
In case you want to compile the firmware yourself, you can find a `COMPILE.md` for each firmware.

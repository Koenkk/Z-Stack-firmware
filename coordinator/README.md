# Z-Stack coordinator firmwares
This directory contains various Z-Stack coordinator firmwares.

## Overiew
<table>
  <tr>
    <td><b>Z-Stack</b></td>
    <td><b>Device</b></td>
    <td><b>Zigbee</b></td>
    <td><b>Direct children</b></td>
    <td><b>Routes</b></td>
    <td><b>Notes</b></td>
  </tr>
  <tr>
    <td rowspan="2">Z-Stack_Home_1.2 (default)</td>
    <td>CC2531</td>
    <td>1.2 HA</td>
    <td>20</td>
    <td>30/0</td>
    <td></td>
  </tr>
  <tr>
    <td>CC2530, CC2530 + CC2591, CC2530 + CC2592</td>
    <td>1.2 HA</td>
    <td>16</td>
    <td>30/0</td>
    <td></td>
  </tr>
  <tr>
    <td>Z-Stack_Home_1.2 (source_routing)</td>
    <td>CC2531, CC2530, CC2530 + CC2591, CC2530 + CC2592</td>
    <td>1.2 HA</td>
    <td>5</td>
    <td>40/40</td>
    <td></td>
  </tr>
  <tr>
    <td rowspan="3">Z-Stack_3.0.x</td>
    <td>CC2531</td>
    <td>3.0</td>
    <td>15</td>
    <td>40/0</td>
    <td>
      - <a href="https://github.com/Koenkk/zigbee2mqtt/issues/1445">Discussion #1445</a>
      <br/>
      - Max 40 Zigbee 3.0 devices
    </td>
  </tr>
  <tr>
    <td>CC2530, CC2530 + CC2591, CC2530 + CC2592</td>
    <td>3.0</td>
    <td>10</td>
    <td>40/0</td>
    <td>
      - <a href="https://github.com/Koenkk/zigbee2mqtt/issues/1445">Discussion #1445</a>
      <br/>
      - Max 40 Zigbee 3.0 devices
    </td>
  </tr>
    <tr>
    <td>CC2538 + CC2592</td>
    <td>3.0</td>
    <td>100</td>
    <td>200/400</td>
    <td>
      - <a href="https://github.com/Koenkk/zigbee2mqtt/issues/1568">Discussion #1568</a>
      <br/>
      - Max 200 Zigbee 3.0 devices
    </td>
  </tr>
  <tr>
    <td rowspan="2">Z-Stack_3.x.0</td>
    <td>CC2652P, CC2652R, CC2652RB, CC1352P-2</td>
    <td>3.0</td>
    <td>50</td>
    <td>100/200</td>
    <td>
      - <a href="https://github.com/Koenkk/zigbee2mqtt/issues/1429">Discussion #1429</a>
      <br/>
      - Max 200 Zigbee 3.0 devices
    </td>
  </tr>
</table>

### I'm using a CC2530 or CC2531, which firmware should I use?
This depends:
- Zigbee 3.0 firmwares are **not** recommended for the CC2530 and CC2531 (since those are not powerful enough)
- If you have a network of 1 - 15 devices, the Z-Stack_Home_1.2 **default** firmware is recommended.
- If you have a network of 15+ devices, the Z-Stack_Home_1.2 **source routing** firmware is recommended.
- Note that the **source routing** firmware only supports 5 direct children, therefore you need to have routers in range of the coordinator.

### Legend
- *Z-Stack:* Z-Stack is the Zigbee stack for Texas Instruments Zigbee devices
- *Device:* The Zigbee hardware
- *Zigbee:* Zigbee version, for more information read [What's New in Zigbee 3.0](http://www.ti.com/lit/an/swra615a/swra615a.pdf)
- *Direct children:* Number of children that directly can join the coordinator. Note that this is **not** the maximum network size. For more information, read [the Zigbee2MQTT FAQ about device limit](http://www.zigbee2mqtt.io/information/FAQ.html#i-read-that-zigbee2mqtt-has-a-limit-of-15-devices-is-this-true)
- *Routes:* This indicates how many routes the coordinator can keep in memory. For example 100/200 would mean that: 100 normal routes and 200 source routes can be kept in memory. 0 source routes mean that source routing is disabled. Source routes improve the performance for larger (40+ nodes) networks. For more information read [Large ZigBee Networks and Source Routing
](http://cms.digi.com/resources/documentation/digidocs/90001537/references/r_large_zigbee_networks-source_routing.htm?TocPath=Working%20with%20Zigbee%7C_____14).

#### Notes
- Due to new security requirements in Zigbee 3.0, Zigbee 3.0 coordinators can only support a limited amount of Zigbee 3.0 devices. For Zigbee 1.2 coordinators there is no limit on the max number of Zigbee 3.0 devices that can join.

## Compiling the firmware
In case you want to compile the firmware yourself, you can find a `COMPILE.md` for each firmware.

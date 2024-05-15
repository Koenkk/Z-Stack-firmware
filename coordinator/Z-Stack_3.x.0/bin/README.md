# Tested adapters

**WARNING:** Make sure you flash the correct firmware! Flashing the **wrong** firmware might lock your bootloader preventing future flashing. If you are a Zigbee2MQTT user and don't know what to pick click the **Coordinator firmware** link of your adapter on: https://www.zigbee2mqtt.io/guide/adapters/.
The list of supported firmware versions and Zigbee adapters in alphabetical order is below:

<table>
<thead>
  <tr>
    <th>Adapter</th>
    <th>TI Chip/Module Used</th>
    <th>Firmware to Flash</th>
    <th>BSL Trigger Pin (1)</th>
    <th>Auto-BSL (2)</th>
    <th>RF Switch Control Pins (3)</th>
    <th>LED(s)</th>
    <th>Hardware Flow Control</th>
  </tr>
</thead>
<tbody>
  <tr>
    <td>CircuitSetup.us Zigbee Stick</a></td>
    <td>CC2652P<br>(RFSTAR RF-BM-2652P2 PCB Ant.)<br></td>
    <td>CC1352P2_CC2652P_launchpad_*.zip</td>
    <td>DIO_15</td>
    <td>No</td>
    <td>DIO_28: 2.4Ghz<br>DIO_29: 20dBm PA</td>
    <td>DIO_6 (Green)<br>DIO_7 (Red)<br></td>
    <td>?</td>
  </tr>
  <tr>
  <td><a href="https://github.com/codm/cc2652-raspberry-pi-module">cod.m Zigbee CC2652P RPi Module</a></td>
    <td>CC2652P<br>(RFSTAR RF-BM-2652P2)</td>
    <td>CC1352P2_CC2652P_launchpad_*.zip</td>
    <td>DIO_15</td>
    <td>No</td>
    <td>DIO_28: 2.4Ghz<br>DIO_29: 20dBm PA</td>
    <td>N/A</td>
    <td>?</td>
  </tr>
<tr>
    <td><a href="https://shop.codm.de/en/automation/zigbee/40/zigbee-coordinator-cc2652p7-PoE">cod.m Zigbee Coordinator CC2652P7 (CZC-1.0)</a></td>
    <td>CC2652P7<br>(RFSTAR RF-BM-2652P4I)</td>
    <td>CC1352P7_coordinator_20230507.zip</td>
    <td>DIO_15</td>
    <td>Yes</td>
    <td>N/A</td>
    <td>DIO_7 (Orange)</td>
    <td>N/A</td>
  </tr>
  <tr>
    <td><a href="https://github.com/codm/cc2652p2-tcp-zigbee">cod.m ZigBee CC2652P2 TCP Coordinator V0.2</a></td>
    <td>CC2652P<br>(RFSTAR RF-BM-2652P2)</td>
    <td>CC1352P2_CC2652P_launchpad_*.zip</td>
    <td>DIO_15</td>
    <td>No</td>
    <td>DIO_28: 2.4Ghz<br>DIO_29: 20dBm PA</td>
    <td>DIO_7 (Green)<br>DIO_6 (Red)<br></td>
    <td>?</td>
  </tr>
  <tr>
    <td>cyijun <a href="https://github.com/cyijun/OpenZ3Gateway">OpenZ3Gateway</a></td>
    <td>CC2652P<br>(RFSTAR RF-BM-2652P2 SMA Ant.)<br></td>
    <td>CC1352P2_CC2652P_launchpad_*.zip</td>
    <td>DIO_15</td>
    <td>No</td>
    <td>DIO_28: 2.4Ghz<br>DIO_29: 20dBm PA</td>
    <td>DIO_7 (Green)<br>DIO_6 (Red)<br></td>
    <td>?</td>
  </tr>
  <tr>
    <td>Egony Stick V4<br>(Ebyte ver.)</td>
    <td>CC2652P<br>(Ebyte E72-2G4M20S1E)</td>
    <td>CC1352P2_CC2652P_other_*.zip</td>
    <td>DIO_15</td>
    <td>Yes<br>(from Rev.2.0)</td>
    <td>DIO_5: 20dBm PA<br>DIO_6: 2.4GHz</td>
    <td>DIO_8 (Green)<br>DIO_7 (Red)<br></td>
    <td>?</td>
  </tr>
  <tr>
    <td>Egony Stick V4<br>(RFSTAR ver.)</td>
    <td>CC2652P<br>(RFSTAR RF-BM-2652P2)</td>
    <td>CC1352P2_CC2652P_launchpad_*.zip</td>
    <td>DIO_15</td>
    <td>Yes</td>
    <td>DIO_28: 2.4Ghz<br>DIO_29: 20dBm PA</td>
    <td>DIO_7 (Green)<br>DIO_6 (Red)<br></td>
    <td>?</td>
  </tr>
  <tr>
    <td>Electrolama zoe2</td>
    <td>CC1352P<br>(Ebyte E79)<br></td>
    <td>CC1352P2_CC2652P_other_*.zip</td>
    <td>DIO_15</td>
    <td>No</td>
    <td>DIO_5: 20dBm PA ??<br>DIO_6: 2.4GHz ??</td>
    <td>DIO_7 (Pink)</td>
    <td>?</td>
  </tr>
  <tr>
    <td>Electrolama zzh</td>
    <td>CC2652R</td>
    <td>CC2652R_*.zip</td>
    <td>DIO_13</td>
    <td>No</td>
    <td>N/A</td>
    <td>DIO_7 (Pink)</td>
    <td>?</td>
  </tr>
  <tr>
    <td>Electrolama zzhp</td>
    <td>CC2652P</td>
    <td>CC1352P2_CC2652P_other_*.zip</td>
    <td>DIO_15</td>
    <td>Yes</td>
    <td>DIO_5: 20dBm PA ??<br>DIO_6: 2.4GHz ??</td>
    <td>DIO_7 (Pink)</td>
    <td>?</td>
  </tr>
  <tr>
    <td>Electrolama zzhp-lite</td>
    <td>CC2652P<br>(Ebyte E72)<br></td>
    <td>CC1352P2_CC2652P_other_*.zip</td>
    <td>DIO_15</td>
    <td>Yes</td>
    <td>DIO_5: 20dBm PA ??<br>DIO_6: 2.4GHz ??<br></td>
    <td>DIO_7 (Pink)</td>
    <td>?</td>
  </tr>
  <tr>
    <td><a href="https://github.com/Gio-dot/Z-Bee-Duo">Gio-dot Z-Bee Duo with CC2652P</a></td>
    <td>CC2652P<br>(Ebyte E72-2G4M20S1E)</td>
    <td>CC1352P2_CC2652P_other_*.zip</td>
    <td>DIO_15</td>
    <td>Yes<br>(from Rev.2.0)</td>
    <td>DIO_5: 20dBm PA<br>DIO_6: 2.4GHz</td>
    <td>DIO_8 (Green)<br>DIO_7 (Red)<br></td>
    <td>?</td>
  </tr>
  <tr>
    <td><a href="https://github.com/Gio-dot/Z-Bee-Duo">Gio-dot Z-Bee Duo with CC2652P</a></td>
    <td>CC2652P<br>(RFSTAR RF-BM-2652P2)<br></td>
    <td>CC1352P2_CC2652P_launchpad_*.zip</td>
    <td>DIO_15</td>
    <td>Yes</td>
    <td>DIO_28: 2.4Ghz<br>DIO_29: 20dBm PA</td>
    <td>DIO_7 (Green)<br>DIO_6 (Red)<br></td>
    <td>?</td>
  </tr>
  <tr>
    <td>Slaesh's CC2652RB stick</td>
    <td>CC2652RB</td>
    <td>CC2652RB_*.zip</td>
    <td>DIO_13</td>
    <td>Yes</td>
    <td>N/A</td>
    <td>DIO_7 (Blue)</td>
    <td>?</td>
  </tr>
    <tr>
    <td><a href="https://smartlight.me/smart-home-devices/zigbee-devices/zigbee-coordinator-v4-cc2652p">SMLIGHT SLZB-02 USB Zigbee Adapter</td>
    <td>CC2652P<br>(Ebyte E72-2G4M20S1E)</td>
    <td>CC1352P2_CC2652P_other_*.zip</td>
    <td>DIO_15</td>
    <td>No<br></td>
    <td>DIO_5: 20dBm PA<br>DIO_6: 2.4GHz</td>
    <td>DIO_8 (Green)<br>DIO_7 (Red)<br></td>
    <td>?</td>
  </tr>
  <tr>
    <td><a href="https://smartlight.me/smart-home-devices/zigbee-devices/smlight-zigbee-lan-adapter-slzb-05en">SMLIGHT SLZB-05 Ethernet Zigbee Adapter</td>
    <td>CC2652P<br>(Ebyte E72-2G4M20S1E)</td>
    <td>CC1352P2_CC2652P_other_*.zip</td>
    <td>DIO_15</td>
    <td>Yes<br>(from Rev.3.0)<br></td>
    <td>DIO_5: 20dBm PA<br>DIO_6: 2.4GHz</td>
    <td>DIO_8 (Green)<br>DIO_7 (Red)<br></td>
    <td>?</td>
  </tr>
    <tr>
    <td><a href="https://smlight.tech/product/slzb-06/">SMLIGHT SLZB-06 POE Ethernet WiFi USB Zigbee adapter</td>
    <td>CC2652P</td>
    <td>CC1352P2_CC2652P_other_*.zip</td>
    <td>DIO_15</td>
    <td>Yes<br></td>
    <td>DIO_5: 20dBm PA<br>DIO_6: 2.4GHz</td>
    <td>DIO_8 (Green)<br>DIO_7 (Red)<br></td>
    <td>?</td>
  </tr>
  <tr>
    <td>SONOFF Zigbee 3.0 USB Dongle Plus by ITead</td>
    <td>CC2652P</td>
    <td>CC1352P2_CC2652P_launchpad_*.zip</td>
    <td>DIO_15</td>
    <td>Yes</td>
    <td>DIO_29: 20dBm PA</td>
    <td>DIO_7(Not welded)<br>Power LED(Red)</td>
    <td>DIO13: TX<br>DIO12:RC<br>DIO19: CTS(DIP switch ON)<br>DIO18: RTS(DIP switch ON)</td>
  </tr>
  <tr>
    <td>TI LAUNCHXL-CC1352P-2</td>
    <td>CC1352P</td>
    <td>CC1352P2_CC2652P_launchpad_*.zip</td>
    <td>DIO_15</td>
    <td>No</td>
    <td>DIO_28: 2.4Ghz<br>DIO_29: 20dBm PA<br>DIO_30: Sub-1GHz</td>
    <td>DIO_6 (Red)<br>DIO_7 (Green)<br></td>
    <td>?</td>
  </tr>
  <tr>
    <td>TI LAUNCHXL-CC26xR1</td>
    <td>CC2652R</td>
    <td>CC2652R_*.zip<br></td>
    <td>DIO_13</td>
    <td>No</td>
    <td>N/A</td>
    <td>DIO_6 (Red)<br>DIO_7 (Green)<br></td>
    <td>?</td>
  </tr>
  <tr>
    <td>TI LP-CC1352P7</td>
    <td>CC1352P7</td>
    <td>CC1352P7_*.zip<br></td>
    <td>?</td>
    <td>No</td>
    <td>?</td>
    <td>?</td>
    <td>?</td>
  </tr>
  </tr>
    <tr>
    <td>TI LP-CC2652R7</td>
    <td>CC1352P7</td>
    <td>CC1352P7_*.zip<br></td>
    <td>?</td>
    <td>No</td>
    <td>?</td>
    <td>N/A</td>
    <td>?</td>
  </tr>
  <tr>
    <td>Tube's CC2652P2 USB Coordinator<br></td>
    <td>CC2652P<br>(RFSTAR RF-BM-2652P2)<br></td>
    <td>CC1352P2_CC2652P_launchpad_*.zip</td>
    <td>DIO_15</td>
    <td>N/A</td>
    <td>DIO_28: 2.4Ghz<br>DIO_29: 20dBm PA</td>
    <td>N/A</td>
    <td>?</td>
  </tr>
  <tr>
    <td>Tube's Zigbee Gateways (CC2652P2 variant)<br></td>
    <td>CC2652P<br>(RFSTAR RF-BM-2652P2)<br></td>
    <td>CC1352P2_CC2652P_launchpad_*.zip</td>
    <td>DIO_15</td>
    <td>N/A</td>
    <td>DIO_28: 2.4Ghz<br>DIO_29: 20dBm PA</td>
    <td>N/A</td>
    <td>?</td>
  </tr>
  <tr>
    <td>Tube's Zigbee PoE (Power Over Ethernet) Serial Coordinator (CC2652P2 variant)<br></td>
    <td>CC2652P<br>(RFSTAR RF-BM-2652P2)<br></td>
    <td>CC1352P2_CC2652P_launchpad_*.zip</td>
    <td>DIO_15</td>
    <td>N/A</td>
    <td>DIO_28: 2.4Ghz<br>DIO_29: 20dBm PA</td>
    <td>N/A</td>
    <td>?</td>
  </tr>
  <tr>
    <td><a href="https://zig-star.com">ZigStar Stick v4</a></td>
    <td>CC2652P<br>(RFSTAR RF-BM-2652P2)<br></td>
    <td>CC1352P2_CC2652P_launchpad_*.zip</td>
    <td>DIO_15</td>
    <td>Only for CH340C ver.</td>
    <td>DIO_28: 2.4Ghz<br>DIO_29: 20dBm PA</td>
    <td>DIO_6 (Green)<br>DIO_7 (Red)<br></td>
    <td>?</td>
  </tr>
</tbody>
</table>


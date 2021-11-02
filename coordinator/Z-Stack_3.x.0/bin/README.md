# Tested adapters

**WARNING:** Make sure you flash the correct firmware! Flashing the **wrong** firmware might lock your bootloader preventing future flashing. If you are a Zigbee2MQTT user and don't know what to pick click the **Coordinator firmware** link of your adapter on: https://www.zigbee2mqtt.io/information/supported_adapters.html.

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
    <td><a href="https://zig-star.com">ZigStar Stick v4</a></td>
    <td>CC2652P<br>(RFSTAR RF-BM-2652P2)<br></td>
    <td>CC1352P2_CC2652P_launchpad_*.zip</td>
    <td>DIO_15</td>
    <td>Only for CH340C ver.</td>
    <td>DIO_28: 2.4Ghz<br>DIO_29: 20dBm PA</td>
    <td>DIO_6 (Green)<br>DIO_7 (Red)<br></td>
    <td>?</td>
  </tr>
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
    <td>cod.m Zigbee CC2652P RPi Module</td>
    <td>CC2652P<br>(RFSTAR RF-BM-2652P2)</td>
    <td>CC1352P2_CC2652P_launchpad_*.zip</td>
    <td>DIO_15</td>
    <td>Yes</td>
    <td>DIO_28: 2.4Ghz<br>DIO_29: 20dBm PA</td>
    <td>DIO_7 (Green)<br>DIO_6 (Red)<br></td>
    <td>?</td>
  </tr>
  <tr>
    <td>Gio-dot Z-Bee Duo with CC2652P</td>
    <td>CC2652P<br>(Ebyte E72-2G4M20S1E)</td>
    <td>CC1352P2_CC2652P_other_*.zip</td>
    <td>DIO_15</td>
    <td>Yes<br>(from Rev.2.0)</td>
    <td>DIO_5: 20dBm PA<br>DIO_6: 2.4GHz</td>
    <td>DIO_8 (Green)<br>DIO_7 (Red)<br></td>
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
    <td>SONOFF Zigbee 3.0 USB Dongle Plus by ITead</td>
    <td>CC2652P</td>
    <td>CC1352P2_CC2652P_launchpad_*.zip</td>
    <td>?</td>
    <td>No</td>
    <td>DIO_29: 20dBm PA</td>
    <td>?</td>
    <td>DIO13: TX<br>DIO12:RC<br>DIO19: CTS<br>DIO18: RTS</td>
  </tr>
</tbody>
</table>


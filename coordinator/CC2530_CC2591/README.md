# CC2530_CC2591 coordinator firmware
1. Copy `..\firmware.patch` to `Z-Stack Home 1.2.2a.44539`
2. Open Git Bash, go to `Z-Stack Home 1.2.2a.44539` and apply the patch using `git apply firmware.patch`.
3. Open `Z-Stack Home 1.2.2a.44539\Projects\zstack\ZNP\CC253x\znp.eww` with IAR Embedded workbench for 8051.
4. You will get a warning: *The project file 'CC253(0/1).ewp' is in an old format. Would you like to convert it for use with this version?*. Press **yes** for both.
5. In the dropdown, set target to *CC2530 - ProdHex*.
![Target](images/target.png)
6. Right-click on *CC2530 - ProdHex** (or *CC2530 - ProdSBL for SBL) and press options. Go to C/C++ compiler -> preprocessor. Change the *Defined symbols* to:
```c
FIRMWARE_CC2530_CC2591_DEFAULT

// Uncomment this if you want to compile the SBL (.bin) firmware:
// FIRMWARE_SBL 
```
7. Press OK.
8. Right-click on *CC2530 - ProdHex** (or *CC2530 - ProdSBL for SBL) and click *Rebuild all*.
9. Once finished, you can find the `CC2530ZNP-Prod.hex` file in `Z-Stack Home 1.2.2a.44539\Projects\zstack\ZNP\CC253x\dev`.

**NOTE:** This Firmware is also compatible with CC2530 + RFX2401 Device like the GBA GB2530S Zigbee USB-Stick.

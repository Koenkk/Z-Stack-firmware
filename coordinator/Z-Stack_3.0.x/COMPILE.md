# CC2530, CC2530_CC2591, CC2530_CC2592, CC2531

## Setup development environment
1. Download and install [Z-STACK-3.0.2](http://www.ti.com/tool/Z-STACK).
2. Download and install [IAR Embedded Workbench for 8051](https://www.iar.com/iar-embedded-workbench/#!?architecture=8051).

*NOTE: For IAR Embedded Workbench for 8051 you need either the full (paid) version or the 30-days evaluation version.*

## Compiling
1. Copy `firmware_CC2531_CC2530.patch` to `Z-Stack 3.0.2`
2. Open Git Bash, go to `Z-Stack 3.0.2` and apply the patch using `git apply firmware_CC2531_CC2530.patch --ignore-space-change`.
3. Open `Z-Stack 3.0.2\Projects\zstack\ZNP\CC253x\znp.eww` with IAR Embedded workbench for 8051.
4. Select the correct target:
  - For CC2531 select *CC2531 - ZNP-with-SBL*
  - For CC2530, CC2530_CC2591, CC2530_CC2592 select *CC2530 - ZNP-with-SBL*
  - If you want to compile the `.bin` firmware, select *ZNP-without-SBL*
5. Right-click on your target and press options. Go to C/C++ compiler -> preprocessor. First remove all *Defined symbols* and depending on what you want to compile add one of the following:
- Device type: `FIRMWARE_CC2530`, `FIRMWARE_CC2530_CC2591`, `FIRMWARE_CC2531` or `FIRMWARE_CC2530_CC2592`
- If you chose for *ZNP-without-SBL* add `FIRMWARE_SBL`.
6. Go to General Options -> Stack/Heap -> Stack sizes -> and change `XDATA` to `0x400`.
7. Press OK.
8. Right-click on your target and click *Rebuild all*.
9. Once finished, you can find the `CC253(0|1)ZNP-Prod.(hex|bin)` file in `Z-Stack 3.0.2\Projects\zstack\ZNP\CC253x\dev`.

# CC2538_CC2592_MODKAMRU_V3

Available [here](https://github.com/jethome-ru/zigbee-firmware/tree/master/ti/coordinator/cc2538_cc2592#modkam-v3-differences-form-the-original-ti-znp-z-stack-302).

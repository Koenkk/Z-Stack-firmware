# Compiling the firmware

## Setup development environment
1. Download and install [Z-STACK-3.0.2](http://www.ti.com/tool/Z-STACK).
2. Download and install [IAR Embedded Workbench for 8051](https://www.iar.com/iar-embedded-workbench/#!?architecture=8051).

*NOTE: For IAR Embedded Workbench for 8051 you need either the full (paid) version or the 30-days evaluation version.*

## Compiling
1. Copy `firmware.patch` to `Z-Stack 3.0.2`
2. Open Git Bash, go to `Z-Stack 3.0.2` and apply the patch using `git apply firmware.patch --ignore-space-change`.
3. Open `Z-Stack 3.0.2\Projects\zstack\ZNP\CC253x\znp.eww` with IAR Embedded workbench for 8051.
4. Select the correct target:
  - For CC2531 select *CC2531 - ZNP-with-SBL*
  - For CC2530, CC2530_CC2591, CC2530_CC2592 select *CC2530 - ZNP-with-SBL* (not available yet)
5. Right-click on your target and press options. Go to C/C++ compiler -> preprocessor. Depending on what you want to compile, add one of the following symbols to *Defined symbols*:
- `FIRMWARE_CC2530` (not available yet)
- `FIRMWARE_CC2530_CC2591` (not available yet)
- `FIRMWARE_CC2530_CC2592` (not available yet)
- `FIRMWARE_CC2531`
6. Go to General Options -> Stack/Heap -> Stack sizes -> and change `XDATA` to `0x400`.
7. Press OK.
8. Right-click on your target and click *Rebuild all*.
9. Once finished, you can find the `CC253(0|1)ZNP-Prod.(hex|bin)` file in `Z-Stack 3.0.2\Projects\zstack\ZNP\CC253x\dev`.

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
5. Right-click on your target and press options. Go to C/C++ compiler -> preprocessor. Depending on what you want to compile, add one of the following symbols to *Defined symbols*:
- Device type: `FIRMWARE_CC2530`, `FIRMWARE_CC2530_CC2591`, `FIRMWARE_CC2531` or `FIRMWARE_CC2530_CC2592`
- If you chose for *ZNP-without-SBL* add `FIRMWARE_SBL`.
6. Go to General Options -> Stack/Heap -> Stack sizes -> and change `XDATA` to `0x400`.
7. Press OK.
8. Right-click on your target and click *Rebuild all*.
9. Once finished, you can find the `CC253(0|1)ZNP-Prod.(hex|bin)` file in `Z-Stack 3.0.2\Projects\zstack\ZNP\CC253x\dev`.

# CC2538_CC2592_MODKAMRU_V3

## Setup development environment
1. Download and install [Z-STACK-3.0.2](http://www.ti.com/tool/Z-STACK).
2. Download and install [IAR Embedded Workbench for ARM](https://www.iar.com/iar-embedded-workbench/#!?architecture=Arm).

*NOTE: For IAR Embedded Workbench for ARM you need either the full (paid) version or the 30-days evaluation version.*

## Compiling
1. Copy `firmware_CC2538_CC2592_MODKAMRU_V3.patch` to `Z-Stack 3.0.2`
2. Open Git Bash, go to `Z-Stack 3.0.2` and apply the patch using:
 `git apply --reject --whitespace=fix firmware_CC2538_CC2592_MODKAMRU_V3.patch`
3. Open `Z-Stack 3.0.2\Projects\zstack\ZNP\CC2538\ZNP.eww` with IAR Embedded workbench for ARM.
4. Select `CC2538ZNP-Debug` target.
5. Right-click on your target and press options. Go to C/C++ compiler -> preprocessor. Depending on what you want to compile, correct the following symbols in *Defined symbols*:
- to use USB interface: `HAL_UART_USB`, `xHAL_UART=TRUE`, `xZNP_ALT`;
- to use UART interface without flow control: `xHAL_UART_USB`, `HAL_UART=TRUE`, `ZNP_ALT`;
- to use UART interface with flow control enabled: `xHAL_UART_USB`, `HAL_UART=TRUE`, `xZNP_ALT`.
6. Go to Output Converter, check `Generate additional output` checkbox, select `Intel Extended hex` output format and uncheck `Override default` checkbox.
7. Press OK.
8. Right-click on your target and click *Rebuild all*.
9. Once finished, you can find the `ZNP.hex` file in `Z-Stack 3.0.2\Projects\zstack\ZNP\CC2538\CC2538ZNP-Debug\Exe\`.


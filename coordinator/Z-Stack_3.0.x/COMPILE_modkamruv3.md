# Compiling the MODKAMRU V3 firmware

## Setup development environment
1. Download and install [Z-STACK-3.0.2](http://www.ti.com/tool/Z-STACK).
2. Download and install [IAR Embedded Workbench for 8051](https://www.iar.com/iar-embedded-workbench/#!?architecture=8051).

*NOTE: For IAR Embedded Workbench for 8051 you need either the full (paid) version or the 30-days evaluation version.*

## Compiling
1. Copy `modkamruv3.patch` to `Z-Stack 3.0.2`
2. Open Git Bash, go to `Z-Stack 3.0.2` and apply the patch using:
 `git apply --reject --whitespace=fix modkamruv3.patch`
3. Open `Z-Stack 3.0.2\Projects\zstack\ZNP\CC2538\ZNP.eww` with IAR Embedded workbench for 8051.
4. Select `CC2538ZNP-Debug` target.
5. Right-click on your target and press options. Go to C/C++ compiler -> preprocessor. Depending on what you want to compile, correct the following symbols in *Defined symbols*:
- to use USB interface: `HAL_UART_USB`, `xHAL_UART=TRUE`, `xZNP_ALT`;
- to use UART interface without flow contorl: `xHAL_UART_USB`, `HAL_UART=TRUE`, `ZNP_ALT`;
- to use UART interface with flow contorl enabled: `xHAL_UART_USB`, `HAL_UART=TRUE`, `xZNP_ALT`.
6. Go to Output Converter, check `Generate additional output` checkbox, select `Intel Extended hex` output format and uncheck `Override default` checkbox.
7. Press OK.
8. Right-click on your target and click *Rebuild all*.
9. Once finished, you can find the `ZNP.hex` file in `Z-Stack 3.0.2\Projects\zstack\ZNP\CC2538\CC2538ZNP-Debug\Exe\`.

# CC2530 coordinator firmware
1. Open `Z-Stack Home 1.2.2a.44539\Projects\zstack\ZNP\CC253x\znp.eww` with IAR Embedded workbench for 8051.
2. You will get a warning: *The project file 'CC253(0/1).ewp' is in an old format. Would you like to convert it for use with this version?*. Press **yes** for both.
3. In the dropdown, set target to *CC2530 - ProdHex*. Edit following:
OnBoard.c find:
```
 #elif defined CC2530_MK
   znpCfg1 = ZNP_CFG1_SPI;
```
Replace ZNP_CFG1_SPI with ZNP_CFG1_UART.
znp_app.c find:
```
if (ZNP_CFG1_UART == znpCfg1)
```
And replace by:
```
uartConfig.baudRate = HAL_UART_BR_115200;
uartConfig.flowControl = FALSE;//Old value true
```   
4. Right-click on *CC2530 - ProdHex** and press options. Go to C/C++ compiler -> preprocessor. Change the *Defined symbols* to:
```
FEATURE_SYSTEM_STATS
ASSERT_RESET
xPOWER_SAVING
FAKE_CRC_SHDW
TC_LINKKEY_JOIN
ENABLE_MT_SYS_RESET_SHUTDOWN
SECURE=1
INTER_PAN
ZTOOL_P1
CC2530_MK
```
6. Press OK.
7. Right-click on *CC2530 - ProdHex** and click *Rebuild all*.
![Target](images/cc2530build.png)
8. Once finished, you can find the `CC2530ZNP-Prod.hex` file in `Z-Stack Home 1.2.2a.44539\Projects\zstack\ZNP\CC253x\dev`.


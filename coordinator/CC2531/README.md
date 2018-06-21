# CC2531 coordinator firmware
1. Open `Z-Stack Home 1.2.2a.44539\Projects\zstack\ZNP\CC253x\znp.eww` with IAR Embedded workbench for 8051.
2. You will get a warning: *The project file 'CC253(0/1).ewp' is in an old format. Would you like to convert it for use with this version?*. Press **yes** for both.
3. In the dropdown, set target to *CC2531 - ProdHex*.
![Target](images/target.png)
4. Right-click on *CC2531 - ProdHex** and press options. Go to C/C++ compiler -> preprocessor. Change the *Defined symbols* to:
```
CC2531ZNP
ASSERT_RESET
FAKE_CRC_SHDW
TC_LINKKEY_JOIN
SECURE=1
NWK_MAX_DEVICE_LIST=0
MAXMEMHEAP=3600
INTER_PAN
```
6. Press OK.
7. Right-click on *CC2531 - ProdHex** and click *Rebuild all*.
8. Once finished, you can find the `CC2531ZNP-Prod.hex` file in `Z-Stack Home 1.2.2a.44539\Projects\zstack\ZNP\CC253x\dev`.


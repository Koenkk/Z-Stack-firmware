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
NWK_MAX_DEVICE_LIST=20
MAXMEMHEAP=3199
INTER_PAN
INCLUDE_REVISION_INFORMATION
CONCENTRATOR_ENABLE=1
CONCENTRATOR_DISCOVERY_TIME=120
MAX_RTG_SRC_ENTRIES=65
SRC_RTG_EXPIRY_TIME=2
CONCENTRATOR_ROUTE_CACHE=1
MTO_RREQ_LIMIT_TIME=5000
LINK_DOWN_TRIGGER=5
NWK_ROUTE_AGE_LIMIT=10
BCAST_DELIVERY_TIME=100
DEF_NWK_RADIUS=5
NWK_ROUTE_AGE_LIMIT=15
DEFAULT_ROUTE_REQUEST_RADIUS=15
ROUTE_DISCOVERY_TIME=10
ZDNWKMGR_MIN_TRANSMISSIONS=0
NWK_LINK_STATUS_PERIOD=23
MAX_NEIGHBOR_ENTRIES=16
```
5. Go to General Options -> Stack/Heap -> and change `XDATA` to `0X300`.
6. Press OK.
7. Create `Z-Stack Home 1.2.2a.44539\Components\mt\revision_info.h` with contents `#define CODE_REVISION_NUMBER 20180507`.
8. In `NWK\nwk_globals.c` change the following constants.
```c
#define NWK_MAX_DATABUFS_WAITING    32    // Waiting to be sent to MAC
#define NWK_MAX_DATABUFS_SCHEDULED  20    // Timed messages to be sent
#define NWK_MAX_DATABUFS_CONFIRMED  20    // Held after MAC confirms
#define NWK_MAX_DATABUFS_TOTAL      48    // Total number of buffers
```
9. Right-click on *CC2531 - ProdHex** and click *Rebuild all*.
10. Once finished, you can find the `CC2531ZNP-Prod.hex` file in `Z-Stack Home 1.2.2a.44539\Projects\zstack\ZNP\CC253x\dev`.

# CC2530 + CC2591 coordinator firmware
1. Open `Z-Stack Home 1.2.2a.44539\Projects\zstack\ZNP\CC253x\znp.eww` with IAR Embedded workbench for 8051.
2. You will get a warning: *The project file 'CC253(0/1).ewp' is in an old format. Would you like to convert it for use with this version?*. Press **yes** for both.
3. In the dropdown, set target to *CC2530 - ProdHex*. 
4. In `ZMain\OnBoard.c` replace:
```c
#elif defined CC2530_MK
    znpCfg1 = ZNP_CFG1_SPI;
```

by 

```c
#elif defined CC2530ZNP
    znpCfg1 = ZNP_CFG1_UART;
```

5. In `App\znp_app.c` replace:

```c
uartConfig.baudRate             = ZNP_UART_BAUD;
#ifdef ZNP_ALT
    uartConfig.flowControl          = FALSE;
#else
    uartConfig.flowControl          = TRUE;
```

by

```c
uartConfig.baudRate = HAL_UART_BR_115200;
uartConfig.flowControl = FALSE;
```

6.  In `MT\MT_SYS.c` change the body of function `static void powerOffSoc(void)` to:

```c
  HAL_DISABLE_INTERRUPTS();
  STIF = 0; //HAL_SLEEP_TIMER_CLEAR_INT;
  if (ZNP_CFG1_UART == znpCfg1)
  {
    HalUARTSuspend();
  }

  /* Prep CC2530 power mode */
  //HAL_SLEEP_PREP_POWER_MODE(3);
  SLEEPCMD &= ~PMODE; /* clear mode bits */
  SLEEPCMD |= 3;      /* set mode bits  to PM3 */
  while (!(STLOAD & LDRDY));
  SystemReset();
```

7. In `App\znp_app.c` below `MT_UartRegisterTaskID(znpTaskId);` add:

```c
    //Add TX Setting
    #ifdef HAL_PA_LNA
      ZMacSetTransmitPower(TX_PWR_PLUS_19);
    #else
      ZMacSetTransmitPower(TX_PWR_PLUS_4);
    #endif
```

8. Right-click on *CC2530 - ProdHex** and press options. Go to C/C++ compiler -> preprocessor. Change the *Defined symbols* to:
```c
CC2530ZNP
ASSERT_RESET
FAKE_CRC_SHDW
TC_LINKKEY_JOIN
SECURE=1
NWK_MAX_DEVICE_LIST=15
MAXMEMHEAP=3135
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
FEATURE_SYSTEM_STATS
xPOWER_SAVING
ENABLE_MT_SYS_RESET_SHUTDOWN
ZTOOL_P1
HAL_LCD=FALSE
HAL_ADC=FALSE
HAL_UART_DMA_RX_MAX=128
HAL_PA_LNA
```

9. Go to General Options -> Stack/Heap -> and change `XDATA` to `0X300`.
10. Press OK.
11. Create `Z-Stack Home 1.2.2a.44539\Components\mt\revision_info.h` with contents `#define CODE_REVISION_NUMBER 20181030`.
12. In `NWK\nwk_globals.c` change the following constants.
```c
#define NWK_MAX_DATABUFS_WAITING    32    // Waiting to be sent to MAC
#define NWK_MAX_DATABUFS_SCHEDULED  20    // Timed messages to be sent
#define NWK_MAX_DATABUFS_CONFIRMED  20    // Held after MAC confirms
#define NWK_MAX_DATABUFS_TOTAL      48    // Total number of buffers
```
13. Right-click on *CC2530 - ProdHex** and click *Rebuild all*.
14. Once finished, you can find the `CC2530ZNP-Prod.hex` file in `Z-Stack Home 1.2.2a.44539\Projects\zstack\ZNP\CC253x\dev`.
You can rename it to `CC2530_CC2591ZNP-Prod.hex` to not confuse it with the file for the cc2530 without amplifiers.


# 20211217
- SimpleLink SDK 5.30.01.01 ([changelog](https://software-dl.ti.com/simplelink/esd/simplelink_cc13xx_cc26xx_sdk/5.30.01.01/exports/changelog.html))
- Increase memory heap
- Turn on/off leds when joining is enabled/disabled
- Fix Xiaomi E1 devices not (fully) working
- Allow setting transmit power for CC2652P/CC1352P greater than 5dBm (max 20dBm), default transmit power is set to 9dBm

# 20210708
- SimpleLink SDK 5.10.00.48 ([changelog](http://software-dl.ti.com/simplelink/esd/simplelink_cc13x2_26x2_sdk/5.10.00.48/exports/changelog.html))
- Increase MAC buffers, increases performance on message burst and reduces MAC_TRANSACTION_OVERFLOW errors
- LED control
- Fix joining not working when joining is only permitted on specific router
- Forward message to host even when profileID does not match

# 20210120
- Optimize network parameters (according to https://www.ti.com/lit/an/swra650b/swra650b.pdf)
- Change default CC2652R/CC2652RB/CC1352P-2/CC2652P transmit power from 0dBm to 5dBm
- Potential fix for Hue end devices disconnecting
- SimpleLink SDK 4.40.00.44 ([changelog](http://software-dl.ti.com/simplelink/esd/simplelink_cc13x2_26x2_sdk/4.40.00.44/exports/changelog.html))

# 20201026
- SimpleLink SDK 4.30.00.54 ([changelog](http://software-dl.ti.com/simplelink/esd/simplelink_cc13x2_26x2_sdk/4.30.00.54/exports/changelog.html))
- Expose `AssocAdd` function

# 20200925
- SimpleLink SDK 4.20.01.04 ([changelog](http://software-dl.ti.com/simplelink/esd/simplelink_cc13x2_26x2_sdk/4.20.01.04/exports/changelog.html))
- Allow support for Samsung SmartThings PGC410EU presence sensor ([link](https://github.com/Koenkk/zigbee2mqtt/issues/4055))
- Fix commands to long sleeping end devices failing when directly connected to coordinator (e.g. Xiaomi JTYJ-GD-01LM/BW)

# 20200805
- Expose `AssocRemove` function
- SimpleLink SDK 4.20.00.35 ([changelog](http://software-dl.ti.com/simplelink/esd/simplelink_cc13x2_26x2_sdk/4.20.00.35/exports/changelog.html))

# 20200417
- SimpleLink SDK 4.10.00.78 ([changelog](http://software-dl.ti.com/simplelink/esd/simplelink_cc13x2_26x2_sdk/4.10.00.78/exports/changelog.html)) (+ SimpleLink SDK 3.40.00.02 ([changelog](http://software-dl.ti.com/simplelink/esd/simplelink_cc13x2_26x2_sdk/3.40.00.02/exports/changelog.html)))
- Remove and rediscover route on source route failure (should fix issues with e.g. Hue enddevices dropping off) ([more info](https://e2e.ti.com/support/wireless-connectivity/zigbee-and-thread/f/158/t/883629))
- Fix devices not able to reconnect when attempt unsecured rejoin ([more info](https://e2e.ti.com/support/wireless-connectivity/zigbee-and-thread/f/158/p/882650/3265311))
- Enable parent announce, fixes devices not reachable when changing parents while coordinator is down.

# 20191106
- Increase max number of Zigbee 3.0 devices that can join to 200

# 20191015
- Increased group command buffer

# 20191010
- Update to `SIMPLELINK-CC13X2-26X2-SDK_3.30.00.03`
- Add CC1352P_2 firmware

# 20190426
- Initial version.
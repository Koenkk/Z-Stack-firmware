# 20200831
- SimpleLink SDK 4.20.01.04 ([changelog](http://software-dl.ti.com/simplelink/esd/simplelink_cc13x2_26x2_sdk/4.20.01.04/exports/changelog.html))
- Allow support for Samsung SmartThings PGC410EU presence sensor ([link](https://github.com/Koenkk/zigbee2mqtt/issues/4055))

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
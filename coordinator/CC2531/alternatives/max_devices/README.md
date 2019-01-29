# Max Devices Alternative Build

This build makes some alterations in order to support 44 devices and 1 router on a single CC2531 device instead of the typical ~16 devices and ~16 routers.

To build this version, follow the exact same instructions at `../../README.md` except:
- For step 6. Use `FIRMWARE_CC2531_MAX_DEVICES` instead of `FIRMWARE_CC2531_DEFAULT` and go to General Options -> Stack/Heap -> Stack sizes -> and change `XDATA` to `0X300`.

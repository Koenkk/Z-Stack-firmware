# Max Devices Alternative Build

This build makes some alterations in order to support 44 devices and 1 router on a single CC2531 device instead of the typical ~16 devices and ~16 routers.

To build this version yourself, follow the exact same instructions at `../../README.md` with the following changes to Defined Symbols:

* Change `NWK_MAX_DEVICE_LIST` to 44
* Change `MAX_NEIGHBOR_ENTRIES` to 1

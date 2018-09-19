# Max Devices Alternative Build

This build makes some alterations in order to support 44 devices and 1 router on a single CC2531 device instead of the typical ~16 devices and ~16 routers.

Specific details on how this was achieved:

* decreased XDATA stack offset to 0x300 (default) gives a good amount of extra ram and allows approx 20 more devices to be joined
  * The default in my IAR project was 0x4D0, but this note here http://processors.wiki.ti.com/index.php/Zigbee_Known_Issues_and_Proposed_Fixes#Soft_Reset.2FFreezing.2FStack_Overflow_due_to_BDB_REPORTING_on_CC2530.2FCC2531 makes me believe that this is non-standard and preventative against issues when BDB_REPORTING is enabled which it is not in this build.
* decreased MAX_NEIGHBOR_ENTRIES to 1. MAX_NEIGHBOR_ENTRIES is used for routers only, so this reduces the number of routers allowed on the network to increase the number of devices allowed

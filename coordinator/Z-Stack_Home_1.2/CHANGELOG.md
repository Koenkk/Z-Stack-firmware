# 20190425
- Unified firmwares, only one firmware for every device
- Increased direct children to 25 for CC2531 and 21 for CC2530
- Disabled source routing
- Decreased XDATA size

# 20190315
- Restructured repo
- Added `MAX_STABILITY` firmware

# 20190223
- Reduced memory footprint
- Increased number of routes to remember to 40
- Disabled route expiry

# 20190222
- Decreased binding and group table size to 1, allows for more memory allocated to the heap. It's not used by Zigbee2mqtt anyway.
- Reverted size of data buffers to default, a buffer full error is now properly handled by Zigbee2mqtt.

# 20190218
- Fixed `MAXMEMHEAP`
- Forward messages to endpoint 10 and 11 to 1.

# 20190217
- Forward incoming messages from all groups (not only the ones that are in the group list)

# 20190215
- Re-flash firmware without having to repair devices.
- Fixed error 17 when executing many group commands at once.
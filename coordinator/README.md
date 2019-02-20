# Z-Stack coordinator firmware
Relative to the default Z-Stack coordinator, the firmware has the following modifications:
- Increased memory heap for improved stability.
- Improved configuration parameters for larger Zigbee networks.
- Increased number of devices that can directly be connected to the coordinator.
- Forwarding of all Zigbee group messages, even when the coordinator is not in the group.
- Forwarding of Zigbee messages to endpoint 10 and 11 to 1. (required for zigbee-shepherd).
- Disabled multicasting to properly address Zigbee groups.
- Increased data buffer sizes.
- Increased transmit power for CC2530 + CC2591.
- Versioning (revision number).
- Changes to properly use a CC2530 or CC2530 + CC2591 via UART.
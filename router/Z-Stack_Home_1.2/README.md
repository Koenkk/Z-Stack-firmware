# Z-Stack_Home 1.2 router firmware
Firmwares have been taken from: https://ptvo.info/ , no sources and compilation instructions are available. Credits go to [ptvoinfo](https://github.com/ptvoinfo).

## Buttons

* S1 button: only changes the state of the green LED.
* S2 button: repairs CC2531 (see below)

## Lights

* Short fast blinks (one per second) – the router is connecting to a network.
* Short long blinks (one per 4 seconds) – normal operations.
* Three short blinks – the router cannot send a report to a coordinator.

## Pairing

Flash firmware and permit joining to a network on your coordinator.

## Re-pairing

* CC2530, CC2531: Power on, wait 2 seconds, power off, repeat this cycle three times.
* CC2531: Power on, press and hold down the S2 button for 5 seconds.

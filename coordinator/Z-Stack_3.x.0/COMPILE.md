# Compiling the firmware

## Setup development environment
1. Download and install [SIMPLELINK-CC13X2-26X2-SDK_4.30.00.54](http://www.ti.com/tool/download/SIMPLELINK-CC13X2-26X2-SDK).
1. Download and install [Code Composer Studio 10.1.1.00004](http://www.ti.com/tool/CCSTUDIO).

## Compiling
1. Start Code Composer Studio
1. Go to *File -> Import -> Code Composer Studio -> CCS Projects -> Select* search-directory: `simplelink_cc13x2_26x2_sdk_4_20_00_35/examples/rtos`. Select `znp_CC26X2R1_LAUNCHXL_tirtos_css`, `znp_CC1352P_2_LAUNCHXL_tirtos_css` and `znp_CC2652RB_LAUNCHXL_tirtos_css`. Press *Finish*.
1. In Code Composer Studio, expand the 3 projects and for each open `znp.syscfg`, change `Minimal Poll Period (ms)` to `1000`, change it back to `100` immediately and save the file.
1. Go to your CCS workspace and copy `firmware.patch` to the root.
1. Open Git Bash, go to your CCS root and apply the patch using `git apply firmware.patch --ignore-space-change`.
1. Build both projects; right click -> *Build project*.
1. Once finished, the firmware can be found under `znp_[CC26X2R1/CC1352P_2/CC2652RB]_LAUNCHXL_tirtos_ccs/default/znp_[CC26X2R1/CC1352P_2]_LAUNCHXL_tirtos_ccs.hex`
    - Note: by default the **launchpad** variant of the CC1352P2_CC2652P (= `znp_CC1352P_2_LAUNCHXL_tirtos_ccs.hex`) is build. To build the **other** variant comment `#define LAUNCHPAD_CONFIG 1` in `preinclude.h`.
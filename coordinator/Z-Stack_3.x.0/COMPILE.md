# Compiling the firmware

## Setup development environment
1. Download and install [SIMPLELINK-CC13X2-26X2-SDK_3.40.00.02](http://www.ti.com/tool/download/SIMPLELINK-CC13X2-26X2-SDK).
2. Download and install [Code Composer Studio 9.3.0.00012](http://www.ti.com/tool/CCSTUDIO).

## Compiling
1. Start Code Composer Studio
2. Go to *File -> Import -> Code Composer Studio -> CCS Projects -> Select* search-directory: `simplelink_cc13x2_26x2_sdk_3_40_00_02/examples/rtos`. Select `znp_CC26X2R1_LAUNCHXL_tirtos_css`, `znp_CC1352P_2_LAUNCHXL_tirtos_css` and `znp_CC2652RB_LAUNCHXL_tirtos_css`. Press *Finish*.
3. Go to your CCS workspace and copy `firmware.patch` to the root.
4. Open Git Bash, go to your CCS root and apply the patch using `git apply firmware.patch --ignore-space-change`.
5. Build both projects; right click -> *Build project*.
6. Once finished, the firmware can be found under `znp_[CC26X2R1/CC1352P_2/CC2652RB]_LAUNCHXL_tirtos_ccs/default/znp_[CC26X2R1/CC1352P_2]_LAUNCHXL_tirtos_ccs.hex`

# Compiling the firmware

## Setup development environment
1. Download and install [SIMPLELINK-CC13X2-26X2-SDK](http://www.ti.com/tool/download/SIMPLELINK-CC13X2-26X2-SDK).
2. Download and install [Code Composer Studio 9.0.0](http://www.ti.com/tool/CCSTUDIO).

## Compiling
1. Start Code Composer Studio
2. Go to *File -> Import -> Code Composer Studio -> CCS Projects -> Select* search-directory: `simplelink_cc13x2_26x2_sdk_3_10_00_53/examples/rtos/CC26X2R1_LAUNCHXL/zstack/znp/tirtos/ccs`. Should discover `znp_CC26X2R1_LAUNCHXL_tirtos_css`, press *Finish*.
3. Go to your Code Composer Studio workspace and copy `firmware.patch` to `znp_CC26X2R1_LAUNCHXL_tirtos_ccs`.
4. Open Git Bash, go to `znp_CC26X2R1_LAUNCHXL_tirtos_ccs` and apply the patch using `git apply firmware.patch`.
5. Right click on *znp_CC26X2R1_LAUNCHXL_tirtos_css [Active - default]* and click *Build project*.
6. Once finished, the firmware can be found under `simplelink_cc13x2_26x2_sdk_3_10_00_53/default/znp_CC26X2R1_LAUNCHXL_tirtos_ccs.hex`
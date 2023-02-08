# Compiling the firmware

## Setup development environment
1. Download and install [SIMPLELINK-CC13XX-CC26XX-SDK_6_30_00_84](https://www.ti.com/tool/download/SIMPLELINK-CC13XX-CC26XX-SDK)
1. Download and install [Code Composer Studio 12.1.0.00007](http://www.ti.com/tool/CCSTUDIO)

## Compiling
1. Start Code Composer Studio
1. Go to *File -> Import -> Code Composer Studio -> CCS Projects -> Select* search-directory: `simplelink_cc13xx_cc26xx_sdk_6_30_00_84/examples/rtos`. 
1. Select:
    - `zr_genericapp_CC26X2R1_LAUNCHXL_tirtos7_ticlang`
    - `zr_genericapp_CC1352P_2_LAUNCHXL_tirtos7_ticlang`
    - `zr_genericapp_LP_CC2652RB_tirtos7_ticlang` 
4. Press *Finish*.
1. In Code Composer Studio, expand the 3 projects and for each open `zr_genericapp.syscfg`, expand `Power Management` and change `Minimal Poll Period (ms)` to `1000`, change it back to `100` immediately and save the file.
1. Go to your CCS workspace and copy `firmware.patch` to the root.
1. Open Git Bash, go to your CCS root and apply the patch using `git apply firmware.patch --ignore-space-change`.
1. Build the 3 projects; right click -> *Build project*.
    - **Important:** by default the **launchpad** variant of the CC1352P2_CC2652P (= `zr_genericapp_CC1352P_2_LAUNCHXL_tirtos7_ticlang`) is build. To build the **other** variant comment `#define LAUNCHPAD_CONFIG 1` in `preinclude.h` (located under `Stack/Config/`), don't forget to save.
1. Once finished, the firmware can be found under `zr_genericapp_[CC26X2R1/CC1352P_2/CC2652RB]_LAUNCHXL_tirtos7_ticlang/default/zr_genericapp_[CC26X2R1/CC2652RB/CC1352P_2]_LAUNCHXL_tirtos7_ticlang.hex`
    - `zr_genericapp_CC26X2R1_LAUNCHXL_tirtos7_ticlang.hex` -> CC2652R
    - `zr_genericapp_LP_CC2652RB_tirtos7_ticlang.hex` -> CC2652RB
    - `zr_genericapp_CC1352P_2_LAUNCHXL_tirtos7_ticlang.hex` -> CC1352P-2 and CC2652P
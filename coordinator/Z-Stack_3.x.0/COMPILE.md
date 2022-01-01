# Compiling the firmware

## Setup development environment
1. Download and install [SIMPLELINK-CC13XX-CC26XX-SDK_5.30.01.01](https://www.ti.com/tool/download/SIMPLELINK-CC13XX-CC26XX-SDK)
1. Download and install [Code Composer Studio 11.0.0.00012](http://www.ti.com/tool/CCSTUDIO)

## Compiling
1. Start Code Composer Studio
1. Go to *File -> Import -> Code Composer Studio -> CCS Projects -> Select* search-directory: `simplelink_cc13xx_cc26xx_sdk_5_30_01_01/examples/rtos`. Select `znp_CC26X2R1_LAUNCHXL_tirtos_css`, `znp_CC1352P_2_LAUNCHXL_tirtos_css` and `znp_LP_CC2652RB_tirtos_ccs`. Press *Finish*.
1. In Code Composer Studio, expand the 3 projects and for each open `znp.syscfg`, change `Minimal Poll Period (ms)` to `1000`, change it back to `100` immediately and save the file.
1. Go to your CCS workspace and copy `firmware.patch` to the root.
1. Open Git Bash, go to your CCS root and apply the patch using `git apply firmware.patch --ignore-space-change`.
1. Build the 3 projects; right click -> *Build project*.
    - **Important:** by default the **launchpad** variant of the CC1352P2_CC2652P (= `znp_CC1352P_2_LAUNCHXL_tirtos_ccs`) is build. To build the **other** variant comment `#define LAUNCHPAD_CONFIG 1` in `preinclude.h` (located under `Stack/Config/`), don't forget to save.
1. Once finished, the firmware can be found under `znp_[CC26X2R1/CC1352P_2/CC2652RB]_LAUNCHXL_tirtos_ccs/default/znp_[CC26X2R1/CC2652RB/CC1352P_2]_LAUNCHXL_tirtos_ccs.hex`
    - `znp_CC26X2R1_LAUNCHXL_tirtos_ccs.hex` -> CC2652R
    - `znp_CC2652RB_LAUNCHXL_tirtos_ccs.hex` -> CC2652RB
    - `znp_CC1352P_2_LAUNCHXL_tirtos_ccs.hex` -> CC1352P-2 and CC2652P


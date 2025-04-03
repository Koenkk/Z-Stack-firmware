# Compiling the firmware

## Setup development environment

1. Download and install [SIMPLELINK-LOWPOWER-F2-SDK 8.30.01.01](https://www.ti.com/tool/download/SIMPLELINK-LOWPOWER-F2-SDK/8.30.01.01)
1. Download and install [Code Composer Studio 20.1.0](https://www.ti.com/tool/download/CCSTUDIO/20.1.0)

## Compiling

1. Create a folder called `workspace` in the folder where the SDK is installed. In the SDK installation folder you should see files like `Makefile` and `license_simplelink_cc13xx_cc26xx_sdk_8_30_01_01.txt`.
1. Start Code Composer Studio, it will ask you to select a workspace folder, select the `workspace` folder you created in the previous step.
1. Go to _File -> Import Projects -> Browse_ and select: `simplelink_cc13xx_cc26xx_sdk_8_30_01_01/examples/rtos`.
1. Select:
   - `znp_CC1352P_2_LAUNCHXL_tirtos7_ticlang`
   - `znp_CC26X2R1_LAUNCHXL_tirtos7_ticlang`
   - `znp_LP_CC1352P7_4_tirtos7_ticlang`
   - `znp_LP_CC2652R7_tirtos7_ticlang`
   - `znp_LP_CC2652RB_tirtos7_ticlang`
   - `znp_LP_EM_CC2674P10_tirtos7_ticlang`
1. Press _Finish_.
1. In Code Composer Studio, expand the 5 projects and for each open `znp.syscfg`, expand `Power Management` and change `Minimal Poll Period (ms)` to `1000`, change it back to `100` immediately and save the file.
1. Copy `*.patch` to the SDK installation folder, open a Git Bash in this folder and apply the patch using `git apply *.patch --ignore-space-change`.
1. Build the 5 projects; right click -> _Build project_.
   - **Important:** by default the **launchpad** variant of the CC1352P2_CC2652P (= `znp_CC1352P_2_LAUNCHXL_tirtos7_ticlang`) is build. To build the **other** variant comment `#define LAUNCHPAD_CONFIG 1` in `preinclude.h` (located under `Stack/Config/`), don't forget to save.
1. Once finished, the firmware can be found under `znp_*_tirtos7_ticlang/default/znp_*_tirtos7_ticlang.hex`
   - `znp_CC1352P_2_LAUNCHXL_tirtos7_ticlang.hex` -> CC1352P-2 and CC2652P based boards
   - `znp_CC26X2R1_LAUNCHXL_tirtos7_ticlang.hex` -> CC2652R based boards
   - `znp_LP_CC1352P7_4_tirtos7_ticlang.hex` -> CC1352P7 based boards
   - `znp_LP_CC2652R7_tirtos7_ticlang.hex` -> CC2652R7 based boards
   - `znp_LP_CC2652RB_tirtos7_ticlang.hex` -> CC2652RB based boards

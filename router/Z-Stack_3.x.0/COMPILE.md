# Compiling the firmware

## Setup development environment
1. Download and install [SIMPLELINK-CC13X2-26X2-SDK_4.40.00.44](http://www.ti.com/tool/download/SIMPLELINK-CC13X2-26X2-SDK).
1. Download and install [Code Composer Studio 10.2.0.00009](http://www.ti.com/tool/CCSTUDIO).

## Compiling
1. Start Code Composer Studio
1. Go to *File -> Import -> Code Composer Studio -> CCS Projects -> Select* search-directory: `simplelink_cc13x2_26x2_sdk_4_40_00_44/examples/rtos`. Click OK (or Open) in the file browser window
1. Select:
 - `zr_genericapp_CC26X2R1_LAUNCHXL_tirtos_ccs`
 - `zr_genericapp_CC1352P_2_LAUNCHXL_tirtos_ccs`
 - `zr_genericapp_CC2652RB_LAUNCHXL_tirtos_ccs`. 
4. Press *Finish*.
1. In Code Composer Studio, expand the 3 projects and for each open `znp.syscfg`, change `Minimal Poll Period (ms)` to `1000`, change it back to `100` immediately and save the file.
1. Go to your CCS workspace and copy `firmware.patch` to the root.
1. Open Git Bash, go to your CCS root and apply the patch using `git apply firmware.patch --ignore-space-change`.
1. **Only** for `zr_genericapp_CC1352P_2_LAUNCHXL_tirtos_css`:
    - Right click on `znp.syscfg` -> *Delete*
    - Right click on `zr_genericapp_CC1352P_2_LAUNCHXL_tirtos_css` -> *Properties*.
        - Go to *(CCS) Build* - *ARM Compiler* - *Include Options* -> Under *Add dir to #include search path (--include_path, -l)* add `${PROJECT_ROOT}/syscfg` as the **last** entry.
        - Go to *(CCS) Build* - *ARM Linker* - *File Search Path* -> Under *Include library file or command file as input (--library, -l)* change `${PROJECT_BUILD_DIR}/syscfg/ti_utils_build_linker.cmd.genlibs` to `${PROJECT_ROOT}/syscfg/ti_utils_build_linker.cmd.genlibs`
8. Build the 3 projects; right click -> *Build project*.
    - **Important:** by default the **launchpad** variant of the CC1352P2_CC2652P (= `zr_genericapp_CC1352P_2_LAUNCHXL_tirtos_ccs`) is build. To build the **other** variant comment `#define LAUNCHPAD_CONFIG 1` in `preinclude.h` (located under `Stack/Config/`), don't forget to save.
9. Once finished, the firmware can be found under `zr_genericapp_[CC26X2R1/CC1352P_2/CC2652RB]_LAUNCHXL_tirtos_ccs/default/zr_genericapp_[CC26X2R1/CC2652RB/CC1352P_2]_LAUNCHXL_tirtos_ccs.hex`
    - `zr_genericapp_CC26X2R1_LAUNCHXL_tirtos_ccs.hex` -> CC2652R
    - `zr_genericapp_CC2652RB_LAUNCHXL_tirtos_ccs.hex` -> CC2652RB
    - `zr_genericapp_CC1352P_2_LAUNCHXL_tirtos_ccs.hex` -> CC1352P-2 and CC2652P


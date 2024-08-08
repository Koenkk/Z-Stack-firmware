# Compiling the firmware

## Setup development environment

1. Download and install [SIMPLELINK-LOWPOWER-F2-SDK 7.41.00.17](https://www.ti.com/tool/download/SIMPLELINK-LOWPOWER-F2-SDK/7.41.00.17)
1. Download and install [Code Composer Studio 12.6.0](https://www.ti.com/tool/download/CCSTUDIO/12.6.0)

## Compiling

1. Create a folder called `workspace` in the folder where the SDK is installed. In the SDK installation folder you should see files like `Makefile` and `license_simplelink_cc13xx_cc26xx_sdk_7_41_00_17.txt`.
1. Start Code Composer Studio, it will ask you to select a workspace folder, select the `workspace` folder you created in the previous step.
1. Go to _Window -> Preferences -> Products_ Add `<path_to_this_repository>/simplelink_f2_examples_sdk/cc13xx_cc26xx_sdk` to _Product discovery path_. Close with `Apply and Close`.
1. Build the SDK `make --directory='<path_to_this_repository>/simplelink_f2_examples_sdk/cc13xx_cc26xx_sdk' build-ticlang`
1. Go to _File -> Import -> Code Composer Studio -> CCS Projects -> Select_ search-directory: `<path_to_this_repository>/simplelink_f2_examples_sdk/examples/rtos`.
1. Select:
   - `znp_CC1352P_2_LAUNCHXL_tirtos7_ticlang`
   - `znp_CC26X2R1_LAUNCHXL_tirtos7_ticlang`
   - `znp_LP_CC1352P7_4_tirtos7_ticlang`
   - `znp_LP_CC2652R7_tirtos7_ticlang`
   - `znp_LP_CC2652RB_tirtos7_ticlang`
1. Press _Finish_.
1. In Code Composer Studio, expand the 5 projects and for each open `znp.syscfg`, expand `Power Management` and change `Minimal Poll Period (ms)` to `1000`, change it back to `100` immediately and save the file.
1. Copy `firmware.patch` to the SDK installation folder, open a Git Bash in this folder and apply the patch using `git apply --ignore-space-change firmware.patch`.
1. Build the 5 projects; right click -> *Build project*.
   - **Important:** by default the **launchpad** variant of the CC1352P2_CC2652P (= `znp_CC1352P_2_LAUNCHXL_tirtos7_ticlang`) is build. To build the **other** variant comment `#define LAUNCHPAD_CONFIG 1` in `preinclude.h` (located under `Stack/Config/`), don't forget to save.
1. Once finished, the firmware can be found under `znp_*_tirtos7_ticlang/default/znp_*_tirtos7_ticlang.hex`
   - `znp_CC1352P_2_LAUNCHXL_tirtos7_ticlang.hex` -> CC1352P-2 and CC2652P based boards
   - `znp_CC26X2R1_LAUNCHXL_tirtos7_ticlang.hex` -> CC2652R based boards
   - `znp_LP_CC1352P7_4_tirtos7_ticlang.hex` -> CC1352P7 based boards
   - `znp_LP_CC2652R7_tirtos7_ticlang.hex` -> CC2652R7 based boards
   - `znp_LP_CC2652RB_tirtos7_ticlang.hex` -> CC2652RB based boards

## Binary `maclib_*.a` changes in `firmware.patch`

Note that the `firmware.patch` patches the binary `maclib_*.a` files.
These changes are required to fix the coordinator crashing when the TX power is set to 5+.
In SDK 7.10.02.23 TI made changes to `macSetTxPowerVal` which introduced this issue.
The patch reverts these changes.
The patched `maclib_*.a` files were provided by a TI employee and will only work for the 7.41.00.17 SDK.


## Docker build environment

This repo includes a Container file, to help with setting up a build environment without the need to download and install things manually. [Docker](https://docker.com) or [Podman](https://podman.io) can be used. The following example uses docker.

1. This step builds the container locally. This step may be skipped if using a [released container](https://github.com/Koenkk/pkgs/container/Z-Stack-firmware) from this repository instead.
```console
$ docker build \
    --file '../../Containerfile' \
    --rm \
    --tag 'z-stack:dev' \
    '../../'
```

> __Note:__ The above instruction assumes we are in the coordinator/Z-Stack_3.x.0 directory, which is why we refer to the repo root. Replace `../../` with `./` if run from the root.

> __:Warning:__ The build of the container will download CCS. While docker keeps a cached copy on subsequent builds, this download can take a while and is not immediately obvious it is happening.

1. Enter the container so that the firmware can be built.
```console
$ docker run \
    --interactive \
    --rm \
    --tty \
    --volume './:/src' \
    --volume '../../simplelink_f2_examples_sdk:/sdk' \
    --volume './workspace:/build/workspace' \
    --workdir '/build/workspace' \
    'z-stack:dev' \
    '/bin/bash'
```

> *Warning:* It is required that this repository has been cloned recursively and the Simple Link being volume mounted to `/sdk` as described above. Also the various `znp.syscfg` files are volume mounted to `/src`. This last path is not per-say needed and later where `znp.syscfg` gets copied could also be copied directly from the host. This is just a preference for the most part.

> __Note:__ The local directory `./workspace` is volume-mounted into the containers `/build/workspace` directory to be able to keep files from the container, but can be freely removed when done.

Within the container, we now follow similar steps as above, however the SDK needs be compiled and registered first.

1. First, the SDK libraries will need to be compiled.
`#  make --directory='/sdk/cc13xx_cc26xx_sdk' --jobs=$(($(nproc) - 1)) build-ticlang`

1. Next, register the SDK to CCS
`# eclipse -noSplash -application com.ti.common.core.initialize -ccs.productDiscoveryPath '/sdk/cc13xx_cc26xx_sdk/'`

> *TIP:* Entering the container is convenient, but not required. Instead of using `/bin/bash` to enter a shell, commands can be put there instead as well. Even adding the word `eclipse` is not even needed in that case. E.g. `docker run ... --help` will already work. The SDK is registered in this case automatically as well. An alias could be set to the long docker comamnd, and thus `zstack --help` could be even used (assuming zstack is the name of the alias). This can be convenient when developing on the stack, and wanting to rebuild based on the change.

### Launching eclipse in the container
To launch eclipse in the container to test/check things out. This does require a X11 compatible host.
 ```
--env DISPLAY="${DISPLAY}" --volume '/tmp/.X11-unix' --network='host'
```
> __Note:__ The network mapping is required for local X11 forwarding to work due to the `DISPLAY` variable assuming `localhost`.

Within the container, eclipse does require `libswt-gtk-4-java epiphany-browser` installed (ccs/eclipse does come with chromium, but epiphany is an easy way to fulfill its missing dependencies).

Almost certainly some additional security mechanisms need to be bypassed, where a quick (and dangerous) hack is to `xhost +` on the host before launching the container.

Finally start `eclipse -data '/build/workspace'` from within the container and it will then pop up a UI window on the host.

> __Note:__ Optionally, a VNC in docker solution or X11 forwarding over ssh can also be used, but that is out of scope for here.

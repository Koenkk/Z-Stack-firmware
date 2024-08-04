# Compiling the firmware

## Setup development environment
1. Download and install [simplelink_cc13xx_cc26xx_sdk_7_10_00_98](https://www.ti.com/tool/SIMPLELINK-CC13XX-CC26XX-SDK#downloads)
1. Download and install [Code Composer Studio 12.3.0.00005](http://www.ti.com/tool/CCSTUDIO)

## Compiling
1. Create a folder called `workspace`.
1. Start Code Composer Studio, it will ask you to select a workspace folder, select the `workspace` folder you created in the previous step.
1. Go to *File -> Import -> Code Composer Studio -> CCS Projects -> Select* search-directory: `simplelink_cc13xx_cc26xx_sdk_7_10_00_98/examples/rtos`. 
1. Select whichever of the projects needed:
    - `znp_CC26X2R1_LAUNCHXL_tirtos7_ticlang`
    - `znp_CC1352P_2_LAUNCHXL_tirtos7_ticlang`
    - `znp_LP_CC2652RB_tirtos7_ticlang`
    - `znp_LP_CC1352P7_4_tirtos7_ticlang`
    - `znp_LP_CC2652R7_tirtos7_ticlang`
1. Press *Finish*.
1. Close Code Composer Studio and then copy the appropriate `syscfg` file as `znp.syscfg` into the appropriate workspace folder(s).
    (For example copy `znp_CC26X2R1_LAUNCHXL_tirtos7_ticlang.syscfg` into `workspace/znp_CC26X2R1_LAUNCHXL_tirtos7_ticlang/znp.syscfg`.
1. Copy `patches/*` to the SDK installation folder, open a Git Bash in this folder and apply the patch using `git apply *.patch --ignore-space-change`.
1. Open Code Compose Studio again.
1. Build the project(s); right click -> *Build project*.
    - **Important:** by default the **launchpad** variant of the CC1352P2_CC2652P (= `znp_CC1352P_2_LAUNCHXL_tirtos7_ticlang`) is build. To build the **other** variant comment `#define LAUNCHPAD_CONFIG 1` in `preinclude.h` (located under `Stack/Config/`), don't forget to save.
1. Once finished, the firmware can be found under `znp_*_tirtos7_ticlang/default/znp_*_tirtos7_ticlang.hex`
    - `znp_CC26X2R1_LAUNCHXL_tirtos7_ticlang.hex` -> CC2652R
    - `znp_LP_CC2652RB_tirtos7_ticlang.hex` -> CC2652RB
    - `znp_CC1352P_2_LAUNCHXL_tirtos7_ticlang.hex` -> CC1352P-2 and CC2652P
    - `znp_LP_CC1352P7_4_tirtos7_ticlang.hex` -> CC1352P7
    - `znp_LP_CC2652R7_tirtos7_ticlang.hex` -> CC2652R7

## Docker build environment
This repo includes a Container file, to help with setting up a build environment without the need to download and install things manually. [Docker](https://docker.com) or [Podman](https://podman.io) can be used. The following example uses docker.

1. This step builds the container locally. This step may be skipped if using a [released container](https://github.com/Koenkk/pkgs/container/Z-Stack-firmware) from this repository instead.
```console
$ docker build \
    --file 'Containerfile' \
    --rm \
    --tag 'z-stack:dev' \
    'https://github.com/Koenkk/Z-Stack-firmware.git#master'
```

> __Note:__ The URL in the example can be replace with a '.' when the repository has been cloned locally and having `cd`ed into the repository directory.

> __:Warning:__ The build of the container will download the SDK and CCS. While docker keeps a cached copy on subsequent builds, this download can take a while and is not immediately obvious it is happening.

1. Enter the container so that the firmware can be built.
```console
$ docker run \
    --interactive \
    --rm \
    --tty \
    --volume './workspace:/build/workspace' \
    --workdir '/build/workspace' \
    'z-stack:dev' \
    '/bin/bash'
```

> *TIP:* This document assumes that docker is pulling the container directly from git, advanced users, that are modifying patches, probably want to overwrite the included patches by making them available within the container using `--volume './coordinator/Z-Stack-3.x.0/:/src'`.

> __Note:__ The local directory `./workspace` is volume-mounted into the containers `/build/workspace` directory to be able to keep files from the container, but can be freely removed when done.

1. Within the container, import the relevant project into the workspace
`# eclipse -noSplash -data "${HOME}/workspace" -application 'com.ti.ccstudio.apps.projectImport' -ccs.location "${SLF2_SDK}/examples/rtos/CC1352P_2_LAUNCHXL/zstack/znp/tirtos7/ticlang/znp_CC1352P_2_LAUNCHXL_tirtos7_ticlang.projectspec"`

1. Copy the board configuration file
`# cp '/src/znp_CC1352P_2_LAUNCHXL_tirtos7_ticlang.syscfg' "${HOME}/workspace/znp_CC1352P_2_LAUNCHXL_tirtos7_ticlang/znp.syscfg"`

1. Compile!
`# eclipse -noSplash -data "${HOME}/workspace" -application 'com.ti.ccstudio.apps.projectBuild' -ccs.projects 'znp_CC1352P_2_LAUNCHXL_tirtos7_ticlang'`
The output can then be found `./workspace/znp_CC1352P_2_LAUNCHXL_tirtos7_ticlang/default/znp_CC1352P_2_LAUNCHXL_tirtos7_ticlang.hex` on the host.

> __Note:__ The path used here depends on the location used in the previous step.

### Launching eclipse in the container
To launch eclipse in the container to test/check things out, a trick for advanced users is to run the container as root `--user root` (to install additional packages) and pass as a volume the current X session. This does require a X11 compatible host.
 ```
--env DISPLAY="${DISPLAY}" --volume '/tmp/.X11-unix'
```
Within the container, eclipse does require `libswt-gtk-4-java epiphany-browser` installed (ccs/eclipse does come with chromium, but epiphany is an easy way to full fill its missing dependencies).

Almost certainly some additional security mechanisms need to be bypassed, where a quick (and dangerous) hack is to `xhost +` on the host, best before launching the container.

Finally start `eclipse -data '/build/workspace'` from within the container and it will then pop up a UI window on the host.

> __Note:__ Optionally, a VNC in docker solution can also be used, but that is out of scope for here.

# SPDX-License-Identifier: MIT
#
# Copyright (C) 2024 Olliver Schinagl <oliver@schinagl.nl>

ARG UBUNTU_VERSION="22.04"
ARG TARGET_ARCH="library"

FROM index.docker.io/${TARGET_ARCH}/ubuntu:${UBUNTU_VERSION}

ARG SLF2_COMPONENTS="PF_CC2X"

# Remember to supply/update both version fields.
ARG SLF2_VERSION="7.10.00.98"
ARG SLF2_VERSION_PATH="7_10_00_98"
ADD "https://dr-download.ti.com/software-development/software-development-kit-sdk/MD-BPlR3djvTV/${SLF2_VERSION}/simplelink_cc13xx_cc26xx_sdk_${SLF2_VERSION_PATH}__linux.zip" "/tmp/ccs_install/"

ARG CCS_VERSION="12.3.0"
ARG CCS_RELEASE="00005"
ADD "https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-J1VdearkvK/${CCS_VERSION}/CCS${CCS_VERSION}.${CCS_RELEASE}_linux-x64.tar.gz" "/tmp/ccs_install/"

ARG SKIP_PATCHING

ENV SKIP_PATCHING="${SKIP_PATCHING}"
ENV HOME="/build"
ENV CCS_VERSION=${CCS_VERSION}.${CCS_RELEASE}
ENV SLF2_VERSION=${SLF2_VERSION}
ENV SLF2_COMPONENTS=${SLF2_COMPONENTS}
ENV SLF2_SDK="${HOME}/simplelink_cc13xx_cc26xx_sdk"

COPY "./coordinator/Z-Stack_3.x.0/znp_*.syscfg" "/src/"
COPY "./coordinator/Z-Stack_3.x.0/patches" "/src/patches/"
RUN apt-get update && apt-get install --yes \
        'build-essential' \
        'cmake' \
        'git' \
        'libc6-i386' \
        'libgconf-2-4' \
        'libncurses5' \
        'libtinfo5' \
        'libusb-0.1-4' \
        'python3' \
        'unzip' \
    && \
    rm -f -r '/var/cache/apt' && \
    rm -f -r '/var/lib/apt' && \
    echo 'Extracting CCS ...' && \
    tar -xvf "/tmp/ccs_install/CCS${CCS_VERSION:?}_linux-x64.tar.gz" -C '/tmp/ccs_install' && \
    echo 'Installing CCS ...' && \
    "/tmp/ccs_install/CCS${CCS_VERSION}_linux-x64/ccs_setup_${CCS_VERSION}.run" \
        --enable-components "${SLF2_COMPONENTS:?}" \
        --mode unattended \
        --prefix '/opt/ti/' \
    && \
    echo 'Extracting the SDK ...' && \
    unzip "/tmp/ccs_install/simplelink_cc13xx_cc26xx_sdk_${SLF2_VERSION_PATH:?}__linux.zip" \
        -d "${HOME}" \
    && \
    echo 'Wrapping things up' && \
    ln -f -s \
        "${SLF2_SDK}_${SLF2_VERSION_PATH}" \
        "${SLF2_SDK}" \
    && \
    ln -f -s \
        "$(find '/opt/ti/ccs/utils' -type d -iname 'sysconfig_*')" \
        '/opt/ti/ccs/utils/sysconfig' \
    && \
    rm -f -r "${SLF2_SDK}/docs" && \
    rm -f -r "${SLF2_SDK}/examples/nortos" && \
    rm -f -r '/tmp/ccs_install' && \
    ( test -n "${SKIP_PATCHING:-}" && exit 0 || cd "${SLF2_SDK}" && git apply --ignore-space-change '/src/patches/0'*'.patch' ) && \
    echo 'Installation complete'

ENV PATH="/opt/ti/ccs/eclipse/:/opt/ti/ccs/utils/sysconfig/:${PATH}"

# SPDX-License-Identifier: MIT
#
# Copyright (C) 2024 Olliver Schinagl <oliver@schinagl.nl>

ARG UBUNTU_VERSION="22.04"
ARG TARGET_ARCH="library"

FROM index.docker.io/${TARGET_ARCH}/ubuntu:${UBUNTU_VERSION}

ENV HOME="/build"

ARG SLF2_COMPONENTS="PF_CC2X"
ENV SLF2_COMPONENTS="${SLF2_COMPONENTS}"

ARG CCS_VERSION="12.5.0"
ARG CCS_RELEASE="00007"
ADD "https://dr-download.ti.com/software-development/ide-configuration-compiler-or-debugger/MD-J1VdearkvK/${CCS_VERSION}/CCS${CCS_VERSION}.${CCS_RELEASE}_linux-x64.tar.gz" "/tmp/ccs_install/"
ENV CCS_VERSION=${CCS_VERSION}.${CCS_RELEASE}

RUN apt-get update && apt-get install --yes \
        'tini' \
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
    echo 'Wrapping things up' && \
    rm -f -r '/tmp/ccs_install' && \
    ln -f -s \
        '/opt/ti/xdctools_'*'_core' \
        '/opt/ti/xdctools_core' \
    && \
    ln -f -s \
        '/opt/ti/ccs/utils/sysconfig_'* \
        '/opt/ti/ccs/utils/sysconfig' \
    && \
    ln -f -s \
        '/opt/ti/ccs/tools/compiler/ti-cgt-armllvm_'* \
        '/opt/ti/ccs/tools/compiler/ti-cgt-armllvm' \
    && \
    echo 'Installation complete'

ENV PATH="/opt/ti/ccs/eclipse:/opt/ti/ccs/utils/sysconfig/:${PATH}"
ENV XDC_INSTALL_DIR="/opt/ti/xdctools_core"
ENV SYSCONFIG_TOOL="sysconfig_cli.sh"
ENV CMAKE="cmake"
ENV PYTHON="python3"
ENV TICLANG_ARMCOMPILER="/opt/ti/ccs/tools/compiler/ti-cgt-armllvm"

COPY "container-entrypoint.sh" "/init"

ENTRYPOINT [ "/usr/bin/tini", "--", "/init" ]

#!/bin/sh
# SPDX-License-Identifier: GPL-2.0-or-later
#
# Copyright (C) 2024 Olliver Schinagl <oliver@schinagl.nl>
#
# A beginning user should be able to docker run image bash (or sh) without
# needing to learn about --entrypoint
# https://github.com/docker-library/official-images#consistency

set -eu
if [ -n "${DEBUG_TRACE_SH:-}" ] && \
   [ "${DEBUG_TRACE_SH:-}" != "${DEBUG_TRACE_SH#*"$(basename "${0}")"*}" ] || \
   [ "${DEBUG_TRACE_SH:-}" = 'all' ]; then
	set -x
fi

bin='eclipse'

# Prefix args with $bin if $1 is not a valid command
if ! command -v -- "${1:-}" > '/dev/null' 2>&1; then
	# Always register the SDK on a valid command
	eclipse -noSplash -application com.ti.common.core.initialize -ccs.productDiscoveryPath "${SLF2_SDK}"
	set -- "${bin:?}" "${@}"
fi
exec "${@}"

exit 0

#!/usr/bin/env bash

###############################################################################
# Copyright 2020 The Apollo Authors. All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
###############################################################################

# Fail on first error.
set -e

cd "$(dirname "${BASH_SOURCE[0]}")"
. ./installer_base.sh

TARGET_ARCH="$(uname -m)"
VERSION="3.1.2"

BIN_NAME=""
CHECKSUM=""

if [ "$TARGET_ARCH" == "x86_64" ]; then
  BIN_NAME="shfmt_v${VERSION}_linux_amd64"
  CHECKSUM="c5794c1ac081f0028d60317454fe388068ab5af7740a83e393515170a7157dce"

elif [ "$TARGET_ARCH" == "aarch64" ]; then
  BIN_NAME="shfmt_v${VERSION}_linux_arm"
  CHECKSUM="e13cf317cc653d33e6b6d1cfe36fa891052c6211190a2ada7a46367417726c44"

else
  error "Target arch ${TARGET_ARCH} not supported yet"
  exit 1
fi

DOWNLOAD_LINK="https://github.com/mvdan/sh/releases/download/v${VERSION}/${BIN_NAME}"
download_if_not_cached "${BIN_NAME}" "${CHECKSUM}" "${DOWNLOAD_LINK}"

cp -f "${BIN_NAME}" "${SYSROOT_DIR}/bin/shfmt"

chmod a+x "${SYSROOT_DIR}/bin/shfmt"

ok "Successfully installed shfmt ${VERSION}."

# cleanup
rm -rf "${BIN_NAME}"

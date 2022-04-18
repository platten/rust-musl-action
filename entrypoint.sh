#!/bin/bash
set -Eeuxo pipefail
cd ${GITHUB_WORKSPACE}
if [ -z ${RUST_TOOLCHAIN+x} ]; then
    echo "Using default toolchain";
  else
    echo "Using TOOLCHAIN: '$RUST_TOOLCHAIN'"
    rustup override set $RUST_TOOLCHAIN
fi
if [ -z ${TARGET+x} ]; then
    echo "Using default target";
  else
    echo "Using TARGET: '$TARGET'"
    rustup target add $TARGET
fi
bash -c "$*"

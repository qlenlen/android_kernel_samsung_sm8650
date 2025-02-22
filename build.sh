#!/bin/bash

KERNEL_DEFCONFIG=gki_defconfig

CLANG_DIR="/home/tools/clang/19.1"
export PATH="$CLANG_DIR/bin:$PATH"

echo "**** Kernel defconfig is set to $KERNEL_DEFCONFIG ****"
echo -e "***************************************************"

args="LLVM=1 LLVM_IAS=1 ARCH=arm64"

make -j$(nproc --all) \
  -C $(pwd) \
  O=$(pwd)/out \
  ${args} \
  $KERNEL_DEFCONFIG

make -j$(nproc --all) \
  -C $(pwd) \
  O=$(pwd)/out \
  ${args}

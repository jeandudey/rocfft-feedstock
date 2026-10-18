#!/bin/bash

set -xeuo pipefail

cmake -GNinja ${CMAKE_ARGS} \
    -DGPU_TARGETS=${CONDA_FORGE_DEFAULT_ROCM_GPU_TARGETS} \
    -DAMDGPU_TARGETS=${CONDA_FORGE_DEFAULT_ROCM_GPU_TARGETS} \
    -DROCFFT_KERNEL_CACHE_ENABLE:BOOL=OFF \
    -DSQLITE_USE_SYSTEM_PACKAGE:BOOL=ON \
    -Bbuild -S.
cmake --build ./build
cmake --install ./build

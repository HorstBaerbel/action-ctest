#!/bin/bash

# Terminate upon errors
set -e
# Run cmake to configure
mkdir ${INPUT_SOURCEDIR}/${INPUT_BUILDDIR}
cd ${INPUT_SOURCEDIR}/${INPUT_BUILDDIR}
cmake ${INPUT_CMAKEOPTIONS} ..
# Build
make -j$(nproc)
# Test
ctest --output-on-failure ${INPUT_CTESTOPTIONS}
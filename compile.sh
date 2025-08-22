#!/bin/bash

CPU="r9"
#CPU="rt"
#CPU="i7"

TOOLDIR="/home/jin/iree-build/tools"
#TOOLDIR="/media/jin/nvme1n1p1/iree-build/tools"


## For r9
COMPILEOPT="--iree-hal-target-device=local --iree-hal-target-backends=llvm-cpu --iree-llvmcpu-target-cpu-features=host --iree-llvmcpu-enable-ukernels=all --mlir-print-ir-after-all --mlir-print-ir-before-all --mlir-print-local-scope --mlir-disable-threading"
#COMPILEOPT="--iree-hal-target-device=local --iree-hal-target-backends=llvm-cpu --iree-llvmcpu-target-cpu-features=host --iree-llvmcpu-enable-ukernels=all --mlir-print-ir-after-all --mlir-print-ir-before-all --mlir-print-local-scope"

## For i7
#COMPILEOPT="--iree-hal-target-device=local --iree-hal-target-backends=llvm-cpu --iree-llvmcpu-target-cpu-features=host --iree-llvmcpu-enable-ukernels=all --mlir-print-ir-after-all --mlir-print-ir-before-all --mlir-print-local-scope --mlir-disable-threading"
#COMPILEOPT="--iree-hal-target-device=local --iree-hal-target-backends=llvm-cpu --iree-llvmcpu-target-cpu-features=host --iree-llvmcpu-enable-ukernels=all --mlir-print-ir-after-all --mlir-print-ir-before-all --mlir-print-local-scope"

## For rt
#COMPILEOPT="--iree-hal-target-device=local --iree-hal-target-backends=llvm-cpu --iree-llvmcpu-target-cpu-features=host --iree-llvmcpu-enable-ukernels=all --mlir-print-ir-after-all --mlir-print-ir-before-all --mlir-print-local-scope --mlir-disable-threading"
#COMPILEOPT="--iree-hal-target-device=local --iree-hal-target-backends=llvm-cpu --iree-llvmcpu-target-cpu-features=host --iree-llvmcpu-enable-ukernels=all --mlir-print-ir-after-all --mlir-print-ir-before-all --mlir-print-local-scope"

MODEL="llama"
MLIRFILE="${MODEL}_linalg_matmul.mlir"
OUTFILE="${CPU}/${MODEL}.vmfb"

${TOOLDIR}/iree-compile ${COMPILEOPT} ${MLIRFILE} -o ${OUTFILE} 2> ${CPU}/dump.mlir


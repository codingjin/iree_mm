#!/bin/bash

CPU="r9"
#CPU="rt"
#CPU="i7"

TOOLDIR="/home/jin/iree-build/tools"
#TOOLDIR="/media/jin/nvme1n1p1/iree-build/tools"


#COMPILEOPT="--iree-hal-target-device=local --iree-hal-target-backends=llvm-cpu --iree-llvmcpu-target-cpu=znver4 --iree-llvmcpu-target-cpu-features=host --iree-llvmcpu-enable-ukernels=all --mlir-print-ir-after-all --mlir-print-ir-before-all --mlir-print-local-scope --mlir-disable-threading"
COMPILEOPT="--iree-hal-target-device=local --iree-hal-target-backends=llvm-cpu --iree-llvmcpu-target-cpu=znver4 --iree-llvmcpu-target-cpu-features=host --iree-llvmcpu-enable-ukernels=all --mlir-print-ir-after-all --mlir-print-ir-before-all --mlir-print-local-scope"

#COMPILEOPT="--iree-hal-target-device=local --iree-hal-target-backends=llvm-cpu --iree-llvmcpu-target-cpu=corei7 --iree-llvmcpu-target-cpu-features=host --iree-llvmcpu-enable-ukernels=all --mlir-print-ir-after-all --mlir-print-ir-before-all --mlir-print-local-scope --mlir-disable-threading"
#COMPILEOPT="--iree-hal-target-device=local --iree-hal-target-backends=llvm-cpu --iree-llvmcpu-target-cpu=corei7 --iree-llvmcpu-target-cpu-features=host --iree-llvmcpu-enable-ukernels=all --mlir-print-ir-after-all --mlir-print-ir-before-all --mlir-print-local-scope"

MODEL="llama"
MLIRFILE="${MODEL}_linalg_matmul.mlir"
OUTFILE="${CPU}/${MODEL}_multithread.vmfb"

${TOOLDIR}/iree-compile ${COMPILEOPT} ${MLIRFILE} -o ${OUTFILE} 2> ${CPU}/dump.mlir


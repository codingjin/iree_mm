#!/bin/bash

CPU="r9"
TOOLDIR="/home/jin/iree-build/tools"
COMPILEOPT="--iree-hal-target-backends=llvm-cpu --iree-llvmcpu-target-cpu-features=host  --mlir-print-ir-after-all --mlir-print-ir-before-all --mlir-disable-threading --mlir-print-local-scope"
#COMPILEOPT="--iree-hal-target-backends=llvm-cpu --iree-llvmcpu-target-cpu-features=host  --mlir-print-ir-after-all --mlir-print-ir-before-all --mlir-print-local-scope"
MLIRFILE="llama_linalg_matmul.mlir"

OUTFILE="${CPU}/llama.vmfb"

${TOOLDIR}/iree-compile ${COMPILEOPT} ${MLIRFILE} -o ${OUTFILE} 2> ${CPU}/dump.mlir


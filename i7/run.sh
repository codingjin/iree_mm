#!/bin/bash

#CPU="r9"
#CPU="rt"
CPU="i7"

#TOOLDIR="/home/jin/iree-build/tools"
TOOLDIR="/media/jin/nvme1n1p1/iree-build/tools"
# Check if correct number of arguments provided
if [ $# -ne 3 ]; then
    echo "Usage: $0 <M> <N> <K>"
    echo "Example: $0 1024 2048 128"
    exit 1
fi

# Matrix dimensions
M=$1
N=$2
K=$3

# Validate that arguments are positive integers
if ! [[ "$M" =~ ^[0-9]+$ ]] || ! [[ "$N" =~ ^[0-9]+$ ]] || ! [[ "$K" =~ ^[0-9]+$ ]]; then
    echo "Error: M, N, and K must be positive integers"
    echo "Provided: M=$M, N=$N, K=$K"
    exit 1
fi


# Construct module and function names based on dimensions
model="llama"
iterations=1000
module_file="${model}.vmfb"
function_name="matmul_${M}x${N}x${K}_f32_f32"
verification_function_name="matmul_${M}x${N}x${K}_f32_f32_with_verification"

echo "$CPU Problem Size: M=$M N=$N K=$K"
echo "module: $module_file"
echo "function: $function_name"

sum_seconds=0.0
# 10 * 100
for ((r=1; r<=10; r++)); do
    #echo "10 Warmups ..."
    for ((i=1; i<=10; i++)); do
        "$TOOLDIR"/iree-run-module --module="$module_file" --function="$function_name" > /dev/null 2>&1
    done
    #echo "Warmup done"

    # Run the timing and capture output
    timing_output=$( { time {
        for ((i=1; i<=100; i++)); do
            "$TOOLDIR"/iree-run-module --module="$module_file" --function="$function_name" > /dev/null 2>&1
        done
    }; } 2>&1 )

    # Verification failure information would display as error message!
    "$TOOLDIR"/iree-run-module --module="$module_file" --function="$verification_function_name" > /dev/null 

    # Extract real time from output (format: "real 0m45.123s")
    real_time=$(echo "$timing_output" | grep "real" | awk '{print $2}')

    # Convert time to seconds (handle format like "0m45.123s")
    if [[ $real_time == *"m"* ]]; then
        # Format: XmY.Zs
        minutes=$(echo "$real_time" | sed 's/m.*//')
        seconds=$(echo "$real_time" | sed 's/.*m//' | sed 's/s//')
        total_seconds=$(echo "$minutes * 60 + $seconds" | bc -l)
    else
        # Format: Y.Zs (no minutes)
        total_seconds=$(echo "$real_time" | sed 's/s//')
    fi

    sum_seconds=$(echo "$sum_seconds + $total_seconds" | bc -l)
    #printf "sum_seconds=$sum_seconds total_seconds=$total_seconds\n"
done

# Calculate GFLOPS
# Formula: GFLOPS = 2.0 * M * N * K * iterations / sum_realtime / 1e9
gflops_raw=$(echo "scale=3; 2.0 * $M * $N * $K * $iterations / $sum_seconds / 1000000000" | bc -l)
gflops=$(echo "($gflops_raw + 0.5) / 1" | bc)

# Display results
#echo "Matrix dimensions: M=$M, N=$N, K=$K"
#echo "Number of iterations: $iterations"
#echo "Total real time: $total_seconds seconds"
#echo "Average time per iteration: $(echo "scale=6; $total_seconds / $iterations" | bc -l) seconds"
#echo "Raw GFLOPS (per iteration): $gflops_raw"
printf "GFLOPS: $gflops\n\n\n"

# Optional: Show the raw timing output for verification
#echo ""
#echo "Raw timing output:"
#echo "$timing_output"

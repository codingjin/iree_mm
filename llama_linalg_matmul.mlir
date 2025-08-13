// (1) 4096x4096 × 4096x128 = 4096x128
func.func @matmul_4096x128x4096_f32_f32() {
  %lhs = util.unfoldable_constant dense<0.3> : tensor<4096x4096xf32>
  %rhs = util.unfoldable_constant dense<0.11> : tensor<4096x128xf32>
  %c0 = arith.constant 0.0 : f32
  %init = tensor.empty() : tensor<4096x128xf32>
  %CC = linalg.fill ins(%c0 : f32) outs(%init : tensor<4096x128xf32>) -> tensor<4096x128xf32>
  %D = linalg.matmul ins(%lhs, %rhs: tensor<4096x4096xf32>, tensor<4096x128xf32>)
                    outs(%CC: tensor<4096x128xf32>) -> tensor<4096x128xf32>
  return
}

// (2) 128x4096 × 4096x8192 = 128x8192
func.func @matmul_128x8192x4096_f32_f32() {
  %lhs = util.unfoldable_constant dense<0.3> : tensor<128x4096xf32>
  %rhs = util.unfoldable_constant dense<0.11> : tensor<4096x8192xf32>
  %c0 = arith.constant 0.0 : f32
  %init = tensor.empty() : tensor<128x8192xf32>
  %CC = linalg.fill ins(%c0 : f32) outs(%init : tensor<128x8192xf32>) -> tensor<128x8192xf32>
  %D = linalg.matmul ins(%lhs, %rhs: tensor<128x4096xf32>, tensor<4096x8192xf32>)
                    outs(%CC: tensor<128x8192xf32>) -> tensor<128x8192xf32>
  return
}

// (3) 128x8192 × 8192x4096 = 128x4096
func.func @matmul_128x4096x8192_f32_f32() {
  %lhs = util.unfoldable_constant dense<0.3> : tensor<128x8192xf32>
  %rhs = util.unfoldable_constant dense<0.11> : tensor<8192x4096xf32>
  %c0 = arith.constant 0.0 : f32
  %init = tensor.empty() : tensor<128x4096xf32>
  %CC = linalg.fill ins(%c0 : f32) outs(%init : tensor<128x4096xf32>) -> tensor<128x4096xf32>
  %D = linalg.matmul ins(%lhs, %rhs: tensor<128x8192xf32>, tensor<8192x4096xf32>)
                    outs(%CC: tensor<128x4096xf32>) -> tensor<128x4096xf32>
  return
}

// (4) 4096x4096 × 4096x4096 = 4096x4096
func.func @matmul_4096x4096x4096_f32_f32() {
  %lhs = util.unfoldable_constant dense<0.3> : tensor<4096x4096xf32>
  %rhs = util.unfoldable_constant dense<0.11> : tensor<4096x4096xf32>
  %c0 = arith.constant 0.0 : f32
  %init = tensor.empty() : tensor<4096x4096xf32>
  %CC = linalg.fill ins(%c0 : f32) outs(%init : tensor<4096x4096xf32>) -> tensor<4096x4096xf32>
  %D = linalg.matmul ins(%lhs, %rhs: tensor<4096x4096xf32>, tensor<4096x4096xf32>)
                    outs(%CC: tensor<4096x4096xf32>) -> tensor<4096x4096xf32>
  return
}

// (5) 4095x4095 × 4095x127 = 4095x127
func.func @matmul_4095x127x4095_f32_f32() {
  %lhs = util.unfoldable_constant dense<0.3> : tensor<4095x4095xf32>
  %rhs = util.unfoldable_constant dense<0.11> : tensor<4095x127xf32>
  %c0 = arith.constant 0.0 : f32
  %init = tensor.empty() : tensor<4095x127xf32>
  %CC = linalg.fill ins(%c0 : f32) outs(%init : tensor<4095x127xf32>) -> tensor<4095x127xf32>
  %D = linalg.matmul ins(%lhs, %rhs: tensor<4095x4095xf32>, tensor<4095x127xf32>)
                    outs(%CC: tensor<4095x127xf32>) -> tensor<4095x127xf32>
  return
}

// (6) 127x4095 × 4095x8191 = 127x8191
func.func @matmul_127x8191x4095_f32_f32() {
  %lhs = util.unfoldable_constant dense<0.3> : tensor<127x4095xf32>
  %rhs = util.unfoldable_constant dense<0.11> : tensor<4095x8191xf32>
  %c0 = arith.constant 0.0 : f32
  %init = tensor.empty() : tensor<127x8191xf32>
  %CC = linalg.fill ins(%c0 : f32) outs(%init : tensor<127x8191xf32>) -> tensor<127x8191xf32>
  %D = linalg.matmul ins(%lhs, %rhs: tensor<127x4095xf32>, tensor<4095x8191xf32>)
                    outs(%CC: tensor<127x8191xf32>) -> tensor<127x8191xf32>
  return
}

// (7) 127x8191 × 8191x4095 = 127x4095
func.func @matmul_127x4095x8191_f32_f32() {
  %lhs = util.unfoldable_constant dense<0.3> : tensor<127x8191xf32>
  %rhs = util.unfoldable_constant dense<0.11> : tensor<8191x4095xf32>
  %c0 = arith.constant 0.0 : f32
  %init = tensor.empty() : tensor<127x4095xf32>
  %CC = linalg.fill ins(%c0 : f32) outs(%init : tensor<127x4095xf32>) -> tensor<127x4095xf32>
  %D = linalg.matmul ins(%lhs, %rhs: tensor<127x8191xf32>, tensor<8191x4095xf32>)
                    outs(%CC: tensor<127x4095xf32>) -> tensor<127x4095xf32>
  return
}

// (8) 4095x4095 × 4095x4095 = 4095x4095
func.func @matmul_4095x4095x4095_f32_f32() {
  %lhs = util.unfoldable_constant dense<0.3> : tensor<4095x4095xf32>
  %rhs = util.unfoldable_constant dense<0.11> : tensor<4095x4095xf32>
  %c0 = arith.constant 0.0 : f32
  %init = tensor.empty() : tensor<4095x4095xf32>
  %CC = linalg.fill ins(%c0 : f32) outs(%init : tensor<4095x4095xf32>) -> tensor<4095x4095xf32>
  %D = linalg.matmul ins(%lhs, %rhs: tensor<4095x4095xf32>, tensor<4095x4095xf32>)
                    outs(%CC: tensor<4095x4095xf32>) -> tensor<4095x4095xf32>
  return
}

// (9) 4097x4097 × 4097x129 = 4097x129
func.func @matmul_4097x129x4097_f32_f32() {
  %lhs = util.unfoldable_constant dense<0.3> : tensor<4097x4097xf32>
  %rhs = util.unfoldable_constant dense<0.11> : tensor<4097x129xf32>
  %c0 = arith.constant 0.0 : f32
  %init = tensor.empty() : tensor<4097x129xf32>
  %CC = linalg.fill ins(%c0 : f32) outs(%init : tensor<4097x129xf32>) -> tensor<4097x129xf32>
  %D = linalg.matmul ins(%lhs, %rhs: tensor<4097x4097xf32>, tensor<4097x129xf32>)
                    outs(%CC: tensor<4097x129xf32>) -> tensor<4097x129xf32>
  return
}

// (10) 129x4097 × 4097x8193 = 129x8193
func.func @matmul_129x8193x4097_f32_f32() {
  %lhs = util.unfoldable_constant dense<0.3> : tensor<129x4097xf32>
  %rhs = util.unfoldable_constant dense<0.11> : tensor<4097x8193xf32>
  %c0 = arith.constant 0.0 : f32
  %init = tensor.empty() : tensor<129x8193xf32>
  %CC = linalg.fill ins(%c0 : f32) outs(%init : tensor<129x8193xf32>) -> tensor<129x8193xf32>
  %D = linalg.matmul ins(%lhs, %rhs: tensor<129x4097xf32>, tensor<4097x8193xf32>)
                    outs(%CC: tensor<129x8193xf32>) -> tensor<129x8193xf32>
  return
}

// (11) 129x8193 × 8193x4097 = 129x4097
func.func @matmul_129x4097x8193_f32_f32() {
  %lhs = util.unfoldable_constant dense<0.3> : tensor<129x8193xf32>
  %rhs = util.unfoldable_constant dense<0.11> : tensor<8193x4097xf32>
  %c0 = arith.constant 0.0 : f32
  %init = tensor.empty() : tensor<129x4097xf32>
  %CC = linalg.fill ins(%c0 : f32) outs(%init : tensor<129x4097xf32>) -> tensor<129x4097xf32>
  %D = linalg.matmul ins(%lhs, %rhs: tensor<129x8193xf32>, tensor<8193x4097xf32>)
                    outs(%CC: tensor<129x4097xf32>) -> tensor<129x4097xf32>
  return
}

// (12) 4097x4097 × 4097x4097 = 4097x4097
func.func @matmul_4097x4097x4097_f32_f32() {
  %lhs = util.unfoldable_constant dense<0.3> : tensor<4097x4097xf32>
  %rhs = util.unfoldable_constant dense<0.11> : tensor<4097x4097xf32>
  %c0 = arith.constant 0.0 : f32
  %init = tensor.empty() : tensor<4097x4097xf32>
  %CC = linalg.fill ins(%c0 : f32) outs(%init : tensor<4097x4097xf32>) -> tensor<4097x4097xf32>
  %D = linalg.matmul ins(%lhs, %rhs: tensor<4097x4097xf32>, tensor<4097x4097xf32>)
                    outs(%CC: tensor<4097x4097xf32>) -> tensor<4097x4097xf32>
  return
}



// Verification
func.func @matmul_4096x128x4096_f32_f32_with_verification() {
  // Original matrix multiplication setup
  %lhs = util.unfoldable_constant dense<0.3> : tensor<4096x4096xf32>
  %rhs = util.unfoldable_constant dense<0.11> : tensor<4096x128xf32>
  %c0 = arith.constant 0.0 : f32
  %init = tensor.empty() : tensor<4096x128xf32>
  %CC = linalg.fill ins(%c0 : f32) outs(%init : tensor<4096x128xf32>) -> tensor<4096x128xf32>
  %D = linalg.matmul ins(%lhs, %rhs: tensor<4096x4096xf32>, tensor<4096x128xf32>)
                    outs(%CC: tensor<4096x128xf32>) -> tensor<4096x128xf32>

  // Verification logic
  // Expected result: each element should be 0.3 * 0.11 * 4096 = 135.168
  %expected_value = arith.constant 135.17 : f32
  %expected_tensor = tensor.splat %expected_value : tensor<4096x128xf32>
  
  // Calculate absolute difference between computed and expected results
  %diff = linalg.sub ins(%D, %expected_tensor : tensor<4096x128xf32>, tensor<4096x128xf32>)
                    outs(%init : tensor<4096x128xf32>) -> tensor<4096x128xf32>
  
  // Take absolute value of differences
  %abs_diff_init = tensor.empty() : tensor<4096x128xf32>
  %abs_diff = linalg.abs ins(%diff : tensor<4096x128xf32>) 
                        outs(%abs_diff_init : tensor<4096x128xf32>) -> tensor<4096x128xf32>
  
  // Define tolerance for floating-point comparison
  %tolerance = arith.constant 0.03 : f32
  %tolerance_tensor = tensor.splat %tolerance : tensor<4096x128xf32>
  
  // Check if all differences are within tolerance (element-wise comparison)
  %comparison_init = tensor.empty() : tensor<4096x128xi1>
  %within_tolerance = linalg.generic {
    indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, 
                     affine_map<(d0, d1) -> (d0, d1)>, 
                     affine_map<(d0, d1) -> (d0, d1)>],
    iterator_types = ["parallel", "parallel"]
  } ins(%abs_diff, %tolerance_tensor : tensor<4096x128xf32>, tensor<4096x128xf32>) 
    outs(%comparison_init : tensor<4096x128xi1>) {
  ^bb0(%arg0: f32, %arg1: f32, %arg2: i1):
    %cmp = arith.cmpf ole, %arg0, %arg1 : f32
    linalg.yield %cmp : i1
  } -> tensor<4096x128xi1>
  
  // Reduce to check if ALL elements pass the test
  %true_constant = arith.constant true
  %all_correct_init = tensor.empty() : tensor<i1>
  %all_correct_filled = linalg.fill ins(%true_constant : i1) outs(%all_correct_init : tensor<i1>) -> tensor<i1>
  %verification_result = linalg.reduce ins(%within_tolerance : tensor<4096x128xi1>) 
                                       outs(%all_correct_filled : tensor<i1>)
                                       dimensions = [0, 1]
  (%in: i1, %init_val: i1) {
    %and_result = arith.andi %in, %init_val : i1
    linalg.yield %and_result : i1
  }
  
  // Optional: Print or assert the verification result
  // For debugging, you might want to extract the scalar value:
  %final_result = tensor.extract %verification_result[] : tensor<i1>
  
  // You could add an assertion here if your MLIR dialect supports it:
  cf.assert %final_result, "Matrix multiplication verification failed"
  
  return
}


func.func @matmul_4095x127x4095_f32_f32_with_verification() {
  // Original matrix multiplication setup
  %lhs = util.unfoldable_constant dense<0.3> : tensor<4095x4095xf32>
  %rhs = util.unfoldable_constant dense<0.11> : tensor<4095x127xf32>
  %c0 = arith.constant 0.0 : f32
  %init = tensor.empty() : tensor<4095x127xf32>
  %CC = linalg.fill ins(%c0 : f32) outs(%init : tensor<4095x127xf32>) -> tensor<4095x127xf32>
  %D = linalg.matmul ins(%lhs, %rhs: tensor<4095x4095xf32>, tensor<4095x127xf32>)
                    outs(%CC: tensor<4095x127xf32>) -> tensor<4095x127xf32>

  // Verification logic
  // Expected result: each element should be 0.3 * 0.11 * 4095 = 135.135
  %expected_value = arith.constant 135.14 : f32
  %expected_tensor = tensor.splat %expected_value : tensor<4095x127xf32>
  
  // Calculate absolute difference between computed and expected results
  %diff = linalg.sub ins(%D, %expected_tensor : tensor<4095x127xf32>, tensor<4095x127xf32>)
                    outs(%init : tensor<4095x127xf32>) -> tensor<4095x127xf32>
  
  // Take absolute value of differences
  %abs_diff_init = tensor.empty() : tensor<4095x127xf32>
  %abs_diff = linalg.abs ins(%diff : tensor<4095x127xf32>) 
                        outs(%abs_diff_init : tensor<4095x127xf32>) -> tensor<4095x127xf32>
  
  // Define tolerance for floating-point comparison
  %tolerance = arith.constant 0.03 : f32
  %tolerance_tensor = tensor.splat %tolerance : tensor<4095x127xf32>
  
  // Check if all differences are within tolerance (element-wise comparison)
  %comparison_init = tensor.empty() : tensor<4095x127xi1>
  %within_tolerance = linalg.generic {
    indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, 
                     affine_map<(d0, d1) -> (d0, d1)>, 
                     affine_map<(d0, d1) -> (d0, d1)>],
    iterator_types = ["parallel", "parallel"]
  } ins(%abs_diff, %tolerance_tensor : tensor<4095x127xf32>, tensor<4095x127xf32>) 
    outs(%comparison_init : tensor<4095x127xi1>) {
  ^bb0(%arg0: f32, %arg1: f32, %arg2: i1):
    %cmp = arith.cmpf ole, %arg0, %arg1 : f32
    linalg.yield %cmp : i1
  } -> tensor<4095x127xi1>
  
  // Reduce to check if ALL elements pass the test
  %true_constant = arith.constant true
  %all_correct_init = tensor.empty() : tensor<i1>
  %all_correct_filled = linalg.fill ins(%true_constant : i1) outs(%all_correct_init : tensor<i1>) -> tensor<i1>
  %verification_result = linalg.reduce ins(%within_tolerance : tensor<4095x127xi1>) 
                                       outs(%all_correct_filled : tensor<i1>)
                                       dimensions = [0, 1]
  (%in: i1, %init_val: i1) {
    %and_result = arith.andi %in, %init_val : i1
    linalg.yield %and_result : i1
  }
  
  // Optional: Print or assert the verification result
  // For debugging, you might want to extract the scalar value:
  %final_result = tensor.extract %verification_result[] : tensor<i1>
  
  // You could add an assertion here if your MLIR dialect supports it:
  cf.assert %final_result, "Matrix multiplication verification failed"
  
  return
}


func.func @matmul_4097x129x4097_f32_f32_with_verification() {
  // Original matrix multiplication setup
  %lhs = util.unfoldable_constant dense<0.3> : tensor<4097x4097xf32>
  %rhs = util.unfoldable_constant dense<0.11> : tensor<4097x129xf32>
  %c0 = arith.constant 0.0 : f32
  %init = tensor.empty() : tensor<4097x129xf32>
  %CC = linalg.fill ins(%c0 : f32) outs(%init : tensor<4097x129xf32>) -> tensor<4097x129xf32>
  %D = linalg.matmul ins(%lhs, %rhs: tensor<4097x4097xf32>, tensor<4097x129xf32>)
                    outs(%CC: tensor<4097x129xf32>) -> tensor<4097x129xf32>

  // Verification logic
  // Expected result: each element should be 0.3 * 0.11 * 4097 = 135.201
  %expected_value = arith.constant 135.20 : f32
  %expected_tensor = tensor.splat %expected_value : tensor<4097x129xf32>
  
  // Calculate absolute difference between computed and expected results
  %diff = linalg.sub ins(%D, %expected_tensor : tensor<4097x129xf32>, tensor<4097x129xf32>)
                    outs(%init : tensor<4097x129xf32>) -> tensor<4097x129xf32>
  
  // Take absolute value of differences
  %abs_diff_init = tensor.empty() : tensor<4097x129xf32>
  %abs_diff = linalg.abs ins(%diff : tensor<4097x129xf32>) 
                        outs(%abs_diff_init : tensor<4097x129xf32>) -> tensor<4097x129xf32>
  
  // Define tolerance for floating-point comparison
  %tolerance = arith.constant 0.03 : f32
  %tolerance_tensor = tensor.splat %tolerance : tensor<4097x129xf32>
  
  // Check if all differences are within tolerance (element-wise comparison)
  %comparison_init = tensor.empty() : tensor<4097x129xi1>
  %within_tolerance = linalg.generic {
    indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, 
                     affine_map<(d0, d1) -> (d0, d1)>, 
                     affine_map<(d0, d1) -> (d0, d1)>],
    iterator_types = ["parallel", "parallel"]
  } ins(%abs_diff, %tolerance_tensor : tensor<4097x129xf32>, tensor<4097x129xf32>) 
    outs(%comparison_init : tensor<4097x129xi1>) {
  ^bb0(%arg0: f32, %arg1: f32, %arg2: i1):
    %cmp = arith.cmpf ole, %arg0, %arg1 : f32
    linalg.yield %cmp : i1
  } -> tensor<4097x129xi1>
  
  // Reduce to check if ALL elements pass the test
  %true_constant = arith.constant true
  %all_correct_init = tensor.empty() : tensor<i1>
  %all_correct_filled = linalg.fill ins(%true_constant : i1) outs(%all_correct_init : tensor<i1>) -> tensor<i1>
  %verification_result = linalg.reduce ins(%within_tolerance : tensor<4097x129xi1>) 
                                       outs(%all_correct_filled : tensor<i1>)
                                       dimensions = [0, 1]
  (%in: i1, %init_val: i1) {
    %and_result = arith.andi %in, %init_val : i1
    linalg.yield %and_result : i1
  }
  
  // Optional: Print or assert the verification result
  // For debugging, you might want to extract the scalar value:
  %final_result = tensor.extract %verification_result[] : tensor<i1>
  
  // You could add an assertion here if your MLIR dialect supports it:
  cf.assert %final_result, "Matrix multiplication verification failed"
  
  return
}


func.func @matmul_128x8192x4096_f32_f32_with_verification() {
  // Original matrix multiplication setup
  %lhs = util.unfoldable_constant dense<0.3> : tensor<128x4096xf32>
  %rhs = util.unfoldable_constant dense<0.11> : tensor<4096x8192xf32>
  %c0 = arith.constant 0.0 : f32
  %init = tensor.empty() : tensor<128x8192xf32>
  %CC = linalg.fill ins(%c0 : f32) outs(%init : tensor<128x8192xf32>) -> tensor<128x8192xf32>
  %D = linalg.matmul ins(%lhs, %rhs: tensor<128x4096xf32>, tensor<4096x8192xf32>)
                    outs(%CC: tensor<128x8192xf32>) -> tensor<128x8192xf32>

  // Verification logic
  // Expected result: each element should be 0.3 * 0.11 * 4096 = 135.168
  %expected_value = arith.constant 135.17 : f32
  %expected_tensor = tensor.splat %expected_value : tensor<128x8192xf32>
  
  // Calculate absolute difference between computed and expected results
  %diff = linalg.sub ins(%D, %expected_tensor : tensor<128x8192xf32>, tensor<128x8192xf32>)
                    outs(%init : tensor<128x8192xf32>) -> tensor<128x8192xf32>
  
  // Take absolute value of differences
  %abs_diff_init = tensor.empty() : tensor<128x8192xf32>
  %abs_diff = linalg.abs ins(%diff : tensor<128x8192xf32>) 
                        outs(%abs_diff_init : tensor<128x8192xf32>) -> tensor<128x8192xf32>
  
  // Define tolerance for floating-point comparison
  %tolerance = arith.constant 0.03 : f32
  %tolerance_tensor = tensor.splat %tolerance : tensor<128x8192xf32>
  
  // Check if all differences are within tolerance (element-wise comparison)
  %comparison_init = tensor.empty() : tensor<128x8192xi1>
  %within_tolerance = linalg.generic {
    indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, 
                     affine_map<(d0, d1) -> (d0, d1)>, 
                     affine_map<(d0, d1) -> (d0, d1)>],
    iterator_types = ["parallel", "parallel"]
  } ins(%abs_diff, %tolerance_tensor : tensor<128x8192xf32>, tensor<128x8192xf32>) 
    outs(%comparison_init : tensor<128x8192xi1>) {
  ^bb0(%arg0: f32, %arg1: f32, %arg2: i1):
    %cmp = arith.cmpf ole, %arg0, %arg1 : f32
    linalg.yield %cmp : i1
  } -> tensor<128x8192xi1>
  
  // Reduce to check if ALL elements pass the test
  %true_constant = arith.constant true
  %all_correct_init = tensor.empty() : tensor<i1>
  %all_correct_filled = linalg.fill ins(%true_constant : i1) outs(%all_correct_init : tensor<i1>) -> tensor<i1>
  %verification_result = linalg.reduce ins(%within_tolerance : tensor<128x8192xi1>) 
                                       outs(%all_correct_filled : tensor<i1>)
                                       dimensions = [0, 1]
  (%in: i1, %init_val: i1) {
    %and_result = arith.andi %in, %init_val : i1
    linalg.yield %and_result : i1
  }
  
  // Optional: Print or assert the verification result
  // For debugging, you might want to extract the scalar value:
  %final_result = tensor.extract %verification_result[] : tensor<i1>
  
  // You could add an assertion here if your MLIR dialect supports it:
  cf.assert %final_result, "Matrix multiplication verification failed"
  
  return
}


func.func @matmul_127x8191x4095_f32_f32_with_verification() {
  // Original matrix multiplication setup
  %lhs = util.unfoldable_constant dense<0.3> : tensor<127x4095xf32>
  %rhs = util.unfoldable_constant dense<0.11> : tensor<4095x8191xf32>
  %c0 = arith.constant 0.0 : f32
  %init = tensor.empty() : tensor<127x8191xf32>
  %CC = linalg.fill ins(%c0 : f32) outs(%init : tensor<127x8191xf32>) -> tensor<127x8191xf32>
  %D = linalg.matmul ins(%lhs, %rhs: tensor<127x4095xf32>, tensor<4095x8191xf32>)
                    outs(%CC: tensor<127x8191xf32>) -> tensor<127x8191xf32>

  // Verification logic
  // Expected result: each element should be 0.3 * 0.11 * 4095 = 135.135
  %expected_value = arith.constant 135.14 : f32
  %expected_tensor = tensor.splat %expected_value : tensor<127x8191xf32>
  
  // Calculate absolute difference between computed and expected results
  %diff = linalg.sub ins(%D, %expected_tensor : tensor<127x8191xf32>, tensor<127x8191xf32>)
                    outs(%init : tensor<127x8191xf32>) -> tensor<127x8191xf32>
  
  // Take absolute value of differences
  %abs_diff_init = tensor.empty() : tensor<127x8191xf32>
  %abs_diff = linalg.abs ins(%diff : tensor<127x8191xf32>) 
                        outs(%abs_diff_init : tensor<127x8191xf32>) -> tensor<127x8191xf32>
  
  // Define tolerance for floating-point comparison
  %tolerance = arith.constant 0.03 : f32
  %tolerance_tensor = tensor.splat %tolerance : tensor<127x8191xf32>
  
  // Check if all differences are within tolerance (element-wise comparison)
  %comparison_init = tensor.empty() : tensor<127x8191xi1>
  %within_tolerance = linalg.generic {
    indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, 
                     affine_map<(d0, d1) -> (d0, d1)>, 
                     affine_map<(d0, d1) -> (d0, d1)>],
    iterator_types = ["parallel", "parallel"]
  } ins(%abs_diff, %tolerance_tensor : tensor<127x8191xf32>, tensor<127x8191xf32>) 
    outs(%comparison_init : tensor<127x8191xi1>) {
  ^bb0(%arg0: f32, %arg1: f32, %arg2: i1):
    %cmp = arith.cmpf ole, %arg0, %arg1 : f32
    linalg.yield %cmp : i1
  } -> tensor<127x8191xi1>
  
  // Reduce to check if ALL elements pass the test
  %true_constant = arith.constant true
  %all_correct_init = tensor.empty() : tensor<i1>
  %all_correct_filled = linalg.fill ins(%true_constant : i1) outs(%all_correct_init : tensor<i1>) -> tensor<i1>
  %verification_result = linalg.reduce ins(%within_tolerance : tensor<127x8191xi1>) 
                                       outs(%all_correct_filled : tensor<i1>)
                                       dimensions = [0, 1]
  (%in: i1, %init_val: i1) {
    %and_result = arith.andi %in, %init_val : i1
    linalg.yield %and_result : i1
  }
  
  // Optional: Print or assert the verification result
  // For debugging, you might want to extract the scalar value:
  %final_result = tensor.extract %verification_result[] : tensor<i1>
  
  // You could add an assertion here if your MLIR dialect supports it:
  cf.assert %final_result, "Matrix multiplication verification failed"
  
  return
}


func.func @matmul_129x8193x4097_f32_f32_with_verification() {
  // Original matrix multiplication setup
  %lhs = util.unfoldable_constant dense<0.3> : tensor<129x4097xf32>
  %rhs = util.unfoldable_constant dense<0.11> : tensor<4097x8193xf32>
  %c0 = arith.constant 0.0 : f32
  %init = tensor.empty() : tensor<129x8193xf32>
  %CC = linalg.fill ins(%c0 : f32) outs(%init : tensor<129x8193xf32>) -> tensor<129x8193xf32>
  %D = linalg.matmul ins(%lhs, %rhs: tensor<129x4097xf32>, tensor<4097x8193xf32>)
                    outs(%CC: tensor<129x8193xf32>) -> tensor<129x8193xf32>

  // Verification logic
  // Expected result: each element should be 0.3 * 0.11 * 4097 = 135.201
  %expected_value = arith.constant 135.201 : f32
  %expected_tensor = tensor.splat %expected_value : tensor<129x8193xf32>
  
  // Calculate absolute difference between computed and expected results
  %diff = linalg.sub ins(%D, %expected_tensor : tensor<129x8193xf32>, tensor<129x8193xf32>)
                    outs(%init : tensor<129x8193xf32>) -> tensor<129x8193xf32>
  
  // Take absolute value of differences
  %abs_diff_init = tensor.empty() : tensor<129x8193xf32>
  %abs_diff = linalg.abs ins(%diff : tensor<129x8193xf32>) 
                        outs(%abs_diff_init : tensor<129x8193xf32>) -> tensor<129x8193xf32>
  
  // Define tolerance for floating-point comparison
  %tolerance = arith.constant 0.03 : f32
  %tolerance_tensor = tensor.splat %tolerance : tensor<129x8193xf32>
  
  // Check if all differences are within tolerance (element-wise comparison)
  %comparison_init = tensor.empty() : tensor<129x8193xi1>
  %within_tolerance = linalg.generic {
    indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, 
                     affine_map<(d0, d1) -> (d0, d1)>, 
                     affine_map<(d0, d1) -> (d0, d1)>],
    iterator_types = ["parallel", "parallel"]
  } ins(%abs_diff, %tolerance_tensor : tensor<129x8193xf32>, tensor<129x8193xf32>) 
    outs(%comparison_init : tensor<129x8193xi1>) {
  ^bb0(%arg0: f32, %arg1: f32, %arg2: i1):
    %cmp = arith.cmpf ole, %arg0, %arg1 : f32
    linalg.yield %cmp : i1
  } -> tensor<129x8193xi1>
  
  // Reduce to check if ALL elements pass the test
  %true_constant = arith.constant true
  %all_correct_init = tensor.empty() : tensor<i1>
  %all_correct_filled = linalg.fill ins(%true_constant : i1) outs(%all_correct_init : tensor<i1>) -> tensor<i1>
  %verification_result = linalg.reduce ins(%within_tolerance : tensor<129x8193xi1>) 
                                       outs(%all_correct_filled : tensor<i1>)
                                       dimensions = [0, 1]
  (%in: i1, %init_val: i1) {
    %and_result = arith.andi %in, %init_val : i1
    linalg.yield %and_result : i1
  }
  
  // Optional: Print or assert the verification result
  // For debugging, you might want to extract the scalar value:
  %final_result = tensor.extract %verification_result[] : tensor<i1>
  
  // You could add an assertion here if your MLIR dialect supports it:
  cf.assert %final_result, "Matrix multiplication verification failed"
  
  return
}


func.func @matmul_128x4096x8192_f32_f32_with_verification() {
  // Original matrix multiplication setup
  %lhs = util.unfoldable_constant dense<0.3> : tensor<128x8192xf32>
  %rhs = util.unfoldable_constant dense<0.11> : tensor<8192x4096xf32>
  %c0 = arith.constant 0.0 : f32
  %init = tensor.empty() : tensor<128x4096xf32>
  %CC = linalg.fill ins(%c0 : f32) outs(%init : tensor<128x4096xf32>) -> tensor<128x4096xf32>
  %D = linalg.matmul ins(%lhs, %rhs: tensor<128x8192xf32>, tensor<8192x4096xf32>)
                    outs(%CC: tensor<128x4096xf32>) -> tensor<128x4096xf32>

  // Verification logic
  // Expected result: each element should be 0.3 * 0.11 * 8192 = 270.336
  %expected_value = arith.constant 270.336 : f32
  %expected_tensor = tensor.splat %expected_value : tensor<128x4096xf32>
  
  // Calculate absolute difference between computed and expected results
  %diff = linalg.sub ins(%D, %expected_tensor : tensor<128x4096xf32>, tensor<128x4096xf32>)
                    outs(%init : tensor<128x4096xf32>) -> tensor<128x4096xf32>
  
  // Take absolute value of differences
  %abs_diff_init = tensor.empty() : tensor<128x4096xf32>
  %abs_diff = linalg.abs ins(%diff : tensor<128x4096xf32>) 
                        outs(%abs_diff_init : tensor<128x4096xf32>) -> tensor<128x4096xf32>
  
  // Define tolerance for floating-point comparison
  %tolerance = arith.constant 0.03 : f32
  %tolerance_tensor = tensor.splat %tolerance : tensor<128x4096xf32>
  
  // Check if all differences are within tolerance (element-wise comparison)
  %comparison_init = tensor.empty() : tensor<128x4096xi1>
  %within_tolerance = linalg.generic {
    indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, 
                     affine_map<(d0, d1) -> (d0, d1)>, 
                     affine_map<(d0, d1) -> (d0, d1)>],
    iterator_types = ["parallel", "parallel"]
  } ins(%abs_diff, %tolerance_tensor : tensor<128x4096xf32>, tensor<128x4096xf32>) 
    outs(%comparison_init : tensor<128x4096xi1>) {
  ^bb0(%arg0: f32, %arg1: f32, %arg2: i1):
    %cmp = arith.cmpf ole, %arg0, %arg1 : f32
    linalg.yield %cmp : i1
  } -> tensor<128x4096xi1>
  
  // Reduce to check if ALL elements pass the test
  %true_constant = arith.constant true
  %all_correct_init = tensor.empty() : tensor<i1>
  %all_correct_filled = linalg.fill ins(%true_constant : i1) outs(%all_correct_init : tensor<i1>) -> tensor<i1>
  %verification_result = linalg.reduce ins(%within_tolerance : tensor<128x4096xi1>) 
                                       outs(%all_correct_filled : tensor<i1>)
                                       dimensions = [0, 1]
  (%in: i1, %init_val: i1) {
    %and_result = arith.andi %in, %init_val : i1
    linalg.yield %and_result : i1
  }
  
  // Optional: Print or assert the verification result
  // For debugging, you might want to extract the scalar value:
  %final_result = tensor.extract %verification_result[] : tensor<i1>
  
  // You could add an assertion here if your MLIR dialect supports it:
  cf.assert %final_result, "Matrix multiplication verification failed"
  
  return
}

func.func @matmul_127x4095x8191_f32_f32_with_verification() {
  // Original matrix multiplication setup
  %lhs = util.unfoldable_constant dense<0.3> : tensor<127x8191xf32>
  %rhs = util.unfoldable_constant dense<0.11> : tensor<8191x4095xf32>
  %c0 = arith.constant 0.0 : f32
  %init = tensor.empty() : tensor<127x4095xf32>
  %CC = linalg.fill ins(%c0 : f32) outs(%init : tensor<127x4095xf32>) -> tensor<127x4095xf32>
  %D = linalg.matmul ins(%lhs, %rhs: tensor<127x8191xf32>, tensor<8191x4095xf32>)
                    outs(%CC: tensor<127x4095xf32>) -> tensor<127x4095xf32>

  // Verification logic
  // Expected result: each element should be 0.3 * 0.11 * 8191 = 270.303
  %expected_value = arith.constant 270.303 : f32
  %expected_tensor = tensor.splat %expected_value : tensor<127x4095xf32>
  
  // Calculate absolute difference between computed and expected results
  %diff = linalg.sub ins(%D, %expected_tensor : tensor<127x4095xf32>, tensor<127x4095xf32>)
                    outs(%init : tensor<127x4095xf32>) -> tensor<127x4095xf32>
  
  // Take absolute value of differences
  %abs_diff_init = tensor.empty() : tensor<127x4095xf32>
  %abs_diff = linalg.abs ins(%diff : tensor<127x4095xf32>) 
                        outs(%abs_diff_init : tensor<127x4095xf32>) -> tensor<127x4095xf32>
  
  // Define tolerance for floating-point comparison
  %tolerance = arith.constant 0.03 : f32
  %tolerance_tensor = tensor.splat %tolerance : tensor<127x4095xf32>
  
  // Check if all differences are within tolerance (element-wise comparison)
  %comparison_init = tensor.empty() : tensor<127x4095xi1>
  %within_tolerance = linalg.generic {
    indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, 
                     affine_map<(d0, d1) -> (d0, d1)>, 
                     affine_map<(d0, d1) -> (d0, d1)>],
    iterator_types = ["parallel", "parallel"]
  } ins(%abs_diff, %tolerance_tensor : tensor<127x4095xf32>, tensor<127x4095xf32>) 
    outs(%comparison_init : tensor<127x4095xi1>) {
  ^bb0(%arg0: f32, %arg1: f32, %arg2: i1):
    %cmp = arith.cmpf ole, %arg0, %arg1 : f32
    linalg.yield %cmp : i1
  } -> tensor<127x4095xi1>
  
  // Reduce to check if ALL elements pass the test
  %true_constant = arith.constant true
  %all_correct_init = tensor.empty() : tensor<i1>
  %all_correct_filled = linalg.fill ins(%true_constant : i1) outs(%all_correct_init : tensor<i1>) -> tensor<i1>
  %verification_result = linalg.reduce ins(%within_tolerance : tensor<127x4095xi1>) 
                                       outs(%all_correct_filled : tensor<i1>)
                                       dimensions = [0, 1]
  (%in: i1, %init_val: i1) {
    %and_result = arith.andi %in, %init_val : i1
    linalg.yield %and_result : i1
  }
  
  // Optional: Print or assert the verification result
  // For debugging, you might want to extract the scalar value:
  %final_result = tensor.extract %verification_result[] : tensor<i1>
  
  // You could add an assertion here if your MLIR dialect supports it:
  cf.assert %final_result, "Matrix multiplication verification failed"
  
  return
}


func.func @matmul_129x4097x8193_f32_f32_with_verification() {
  // Original matrix multiplication setup
  %lhs = util.unfoldable_constant dense<0.3> : tensor<129x8193xf32>
  %rhs = util.unfoldable_constant dense<0.11> : tensor<8193x4097xf32>
  %c0 = arith.constant 0.0 : f32
  %init = tensor.empty() : tensor<129x4097xf32>
  %CC = linalg.fill ins(%c0 : f32) outs(%init : tensor<129x4097xf32>) -> tensor<129x4097xf32>
  %D = linalg.matmul ins(%lhs, %rhs: tensor<129x8193xf32>, tensor<8193x4097xf32>)
                    outs(%CC: tensor<129x4097xf32>) -> tensor<129x4097xf32>

  // Verification logic
  // Expected result: each element should be 0.3 * 0.11 * 8193 = 270.369
  %expected_value = arith.constant 270.369 : f32
  %expected_tensor = tensor.splat %expected_value : tensor<129x4097xf32>
  
  // Calculate absolute difference between computed and expected results
  %diff = linalg.sub ins(%D, %expected_tensor : tensor<129x4097xf32>, tensor<129x4097xf32>)
                    outs(%init : tensor<129x4097xf32>) -> tensor<129x4097xf32>
  
  // Take absolute value of differences
  %abs_diff_init = tensor.empty() : tensor<129x4097xf32>
  %abs_diff = linalg.abs ins(%diff : tensor<129x4097xf32>) 
                        outs(%abs_diff_init : tensor<129x4097xf32>) -> tensor<129x4097xf32>
  
  // Define tolerance for floating-point comparison
  %tolerance = arith.constant 0.03 : f32
  %tolerance_tensor = tensor.splat %tolerance : tensor<129x4097xf32>
  
  // Check if all differences are within tolerance (element-wise comparison)
  %comparison_init = tensor.empty() : tensor<129x4097xi1>
  %within_tolerance = linalg.generic {
    indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, 
                     affine_map<(d0, d1) -> (d0, d1)>, 
                     affine_map<(d0, d1) -> (d0, d1)>],
    iterator_types = ["parallel", "parallel"]
  } ins(%abs_diff, %tolerance_tensor : tensor<129x4097xf32>, tensor<129x4097xf32>) 
    outs(%comparison_init : tensor<129x4097xi1>) {
  ^bb0(%arg0: f32, %arg1: f32, %arg2: i1):
    %cmp = arith.cmpf ole, %arg0, %arg1 : f32
    linalg.yield %cmp : i1
  } -> tensor<129x4097xi1>
  
  // Reduce to check if ALL elements pass the test
  %true_constant = arith.constant true
  %all_correct_init = tensor.empty() : tensor<i1>
  %all_correct_filled = linalg.fill ins(%true_constant : i1) outs(%all_correct_init : tensor<i1>) -> tensor<i1>
  %verification_result = linalg.reduce ins(%within_tolerance : tensor<129x4097xi1>) 
                                       outs(%all_correct_filled : tensor<i1>)
                                       dimensions = [0, 1]
  (%in: i1, %init_val: i1) {
    %and_result = arith.andi %in, %init_val : i1
    linalg.yield %and_result : i1
  }
  
  // Optional: Print or assert the verification result
  // For debugging, you might want to extract the scalar value:
  %final_result = tensor.extract %verification_result[] : tensor<i1>
  
  // You could add an assertion here if your MLIR dialect supports it:
  cf.assert %final_result, "Matrix multiplication verification failed"
  
  return
}




func.func @matmul_4096x4096x4096_f32_f32_with_verification() {
  // Original matrix multiplication setup
  %lhs = util.unfoldable_constant dense<0.3> : tensor<4096x4096xf32>
  %rhs = util.unfoldable_constant dense<0.11> : tensor<4096x4096xf32>
  %c0 = arith.constant 0.0 : f32
  %init = tensor.empty() : tensor<4096x4096xf32>
  %CC = linalg.fill ins(%c0 : f32) outs(%init : tensor<4096x4096xf32>) -> tensor<4096x4096xf32>
  %D = linalg.matmul ins(%lhs, %rhs: tensor<4096x4096xf32>, tensor<4096x4096xf32>)
                    outs(%CC: tensor<4096x4096xf32>) -> tensor<4096x4096xf32>

  // Verification logic
  // Expected result: each element should be 0.3 * 0.11 * 4096 = 135.168
  %expected_value = arith.constant 135.17 : f32
  //%expected_value = arith.constant 135.0 : f32
  %expected_tensor = tensor.splat %expected_value : tensor<4096x4096xf32>
  
  // Calculate absolute difference between computed and expected results
  %diff = linalg.sub ins(%D, %expected_tensor : tensor<4096x4096xf32>, tensor<4096x4096xf32>)
                    outs(%init : tensor<4096x4096xf32>) -> tensor<4096x4096xf32>
  
  // Take absolute value of differences
  %abs_diff_init = tensor.empty() : tensor<4096x4096xf32>
  %abs_diff = linalg.abs ins(%diff : tensor<4096x4096xf32>) 
                        outs(%abs_diff_init : tensor<4096x4096xf32>) -> tensor<4096x4096xf32>
  
  // Define tolerance for floating-point comparison
  %tolerance = arith.constant 0.03 : f32
  %tolerance_tensor = tensor.splat %tolerance : tensor<4096x4096xf32>
  
  // Check if all differences are within tolerance (element-wise comparison)
  %comparison_init = tensor.empty() : tensor<4096x4096xi1>
  %within_tolerance = linalg.generic {
    indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, 
                     affine_map<(d0, d1) -> (d0, d1)>, 
                     affine_map<(d0, d1) -> (d0, d1)>],
    iterator_types = ["parallel", "parallel"]
  } ins(%abs_diff, %tolerance_tensor : tensor<4096x4096xf32>, tensor<4096x4096xf32>) 
    outs(%comparison_init : tensor<4096x4096xi1>) {
  ^bb0(%arg0: f32, %arg1: f32, %arg2: i1):
    %cmp = arith.cmpf ole, %arg0, %arg1 : f32
    linalg.yield %cmp : i1
  } -> tensor<4096x4096xi1>
  
  // Reduce to check if ALL elements pass the test
  %true_constant = arith.constant true
  %all_correct_init = tensor.empty() : tensor<i1>
  %all_correct_filled = linalg.fill ins(%true_constant : i1) outs(%all_correct_init : tensor<i1>) -> tensor<i1>
  %verification_result = linalg.reduce ins(%within_tolerance : tensor<4096x4096xi1>) 
                                       outs(%all_correct_filled : tensor<i1>)
                                       dimensions = [0, 1]
  (%in: i1, %init_val: i1) {
    %and_result = arith.andi %in, %init_val : i1
    linalg.yield %and_result : i1
  }
  
  // Optional: Print or assert the verification result
  // For debugging, you might want to extract the scalar value:
  %final_result = tensor.extract %verification_result[] : tensor<i1>
  
  // You could add an assertion here if your MLIR dialect supports it:
  cf.assert %final_result, "Matrix multiplication verification failed"
  
  return
}


func.func @matmul_4095x4095x4095_f32_f32_with_verification() {
  // Original matrix multiplication setup
  %lhs = util.unfoldable_constant dense<0.3> : tensor<4095x4095xf32>
  %rhs = util.unfoldable_constant dense<0.11> : tensor<4095x4095xf32>
  %c0 = arith.constant 0.0 : f32
  %init = tensor.empty() : tensor<4095x4095xf32>
  %CC = linalg.fill ins(%c0 : f32) outs(%init : tensor<4095x4095xf32>) -> tensor<4095x4095xf32>
  %D = linalg.matmul ins(%lhs, %rhs: tensor<4095x4095xf32>, tensor<4095x4095xf32>)
                    outs(%CC: tensor<4095x4095xf32>) -> tensor<4095x4095xf32>

  // Verification logic
  // Expected result: each element should be 0.3 * 0.11 * 4095 = 135.135
  %expected_value = arith.constant 135.14 : f32
  //%expected_value = arith.constant 135.0 : f32
  %expected_tensor = tensor.splat %expected_value : tensor<4095x4095xf32>
  
  // Calculate absolute difference between computed and expected results
  %diff = linalg.sub ins(%D, %expected_tensor : tensor<4095x4095xf32>, tensor<4095x4095xf32>)
                    outs(%init : tensor<4095x4095xf32>) -> tensor<4095x4095xf32>
  
  // Take absolute value of differences
  %abs_diff_init = tensor.empty() : tensor<4095x4095xf32>
  %abs_diff = linalg.abs ins(%diff : tensor<4095x4095xf32>) 
                        outs(%abs_diff_init : tensor<4095x4095xf32>) -> tensor<4095x4095xf32>
  
  // Define tolerance for floating-point comparison
  %tolerance = arith.constant 0.03 : f32
  %tolerance_tensor = tensor.splat %tolerance : tensor<4095x4095xf32>
  
  // Check if all differences are within tolerance (element-wise comparison)
  %comparison_init = tensor.empty() : tensor<4095x4095xi1>
  %within_tolerance = linalg.generic {
    indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, 
                     affine_map<(d0, d1) -> (d0, d1)>, 
                     affine_map<(d0, d1) -> (d0, d1)>],
    iterator_types = ["parallel", "parallel"]
  } ins(%abs_diff, %tolerance_tensor : tensor<4095x4095xf32>, tensor<4095x4095xf32>) 
    outs(%comparison_init : tensor<4095x4095xi1>) {
  ^bb0(%arg0: f32, %arg1: f32, %arg2: i1):
    %cmp = arith.cmpf ole, %arg0, %arg1 : f32
    linalg.yield %cmp : i1
  } -> tensor<4095x4095xi1>
  
  // Reduce to check if ALL elements pass the test
  %true_constant = arith.constant true
  %all_correct_init = tensor.empty() : tensor<i1>
  %all_correct_filled = linalg.fill ins(%true_constant : i1) outs(%all_correct_init : tensor<i1>) -> tensor<i1>
  %verification_result = linalg.reduce ins(%within_tolerance : tensor<4095x4095xi1>) 
                                       outs(%all_correct_filled : tensor<i1>)
                                       dimensions = [0, 1]
  (%in: i1, %init_val: i1) {
    %and_result = arith.andi %in, %init_val : i1
    linalg.yield %and_result : i1
  }
  
  // Optional: Print or assert the verification result
  // For debugging, you might want to extract the scalar value:
  %final_result = tensor.extract %verification_result[] : tensor<i1>
  
  // You could add an assertion here if your MLIR dialect supports it:
  cf.assert %final_result, "Matrix multiplication verification failed"
  
  return
}


func.func @matmul_4097x4097x4097_f32_f32_with_verification() {
  // Original matrix multiplication setup
  %lhs = util.unfoldable_constant dense<0.3> : tensor<4097x4097xf32>
  %rhs = util.unfoldable_constant dense<0.11> : tensor<4097x4097xf32>
  %c0 = arith.constant 0.0 : f32
  %init = tensor.empty() : tensor<4097x4097xf32>
  %CC = linalg.fill ins(%c0 : f32) outs(%init : tensor<4097x4097xf32>) -> tensor<4097x4097xf32>
  %D = linalg.matmul ins(%lhs, %rhs: tensor<4097x4097xf32>, tensor<4097x4097xf32>)
                    outs(%CC: tensor<4097x4097xf32>) -> tensor<4097x4097xf32>

  // Verification logic
  // Expected result: each element should be 0.3 * 0.11 * 4097 = 135.201
  %expected_value = arith.constant 135.20 : f32
  //%expected_value = arith.constant 134.0 : f32
  %expected_tensor = tensor.splat %expected_value : tensor<4097x4097xf32>
  
  // Calculate absolute difference between computed and expected results
  %diff = linalg.sub ins(%D, %expected_tensor : tensor<4097x4097xf32>, tensor<4097x4097xf32>)
                    outs(%init : tensor<4097x4097xf32>) -> tensor<4097x4097xf32>
  
  // Take absolute value of differences
  %abs_diff_init = tensor.empty() : tensor<4097x4097xf32>
  %abs_diff = linalg.abs ins(%diff : tensor<4097x4097xf32>) 
                        outs(%abs_diff_init : tensor<4097x4097xf32>) -> tensor<4097x4097xf32>
  
  // Define tolerance for floating-point comparison
  %tolerance = arith.constant 0.03 : f32
  %tolerance_tensor = tensor.splat %tolerance : tensor<4097x4097xf32>
  
  // Check if all differences are within tolerance (element-wise comparison)
  %comparison_init = tensor.empty() : tensor<4097x4097xi1>
  %within_tolerance = linalg.generic {
    indexing_maps = [affine_map<(d0, d1) -> (d0, d1)>, 
                     affine_map<(d0, d1) -> (d0, d1)>, 
                     affine_map<(d0, d1) -> (d0, d1)>],
    iterator_types = ["parallel", "parallel"]
  } ins(%abs_diff, %tolerance_tensor : tensor<4097x4097xf32>, tensor<4097x4097xf32>) 
    outs(%comparison_init : tensor<4097x4097xi1>) {
  ^bb0(%arg0: f32, %arg1: f32, %arg2: i1):
    %cmp = arith.cmpf ole, %arg0, %arg1 : f32
    linalg.yield %cmp : i1
  } -> tensor<4097x4097xi1>
  
  // Reduce to check if ALL elements pass the test
  %true_constant = arith.constant true
  %all_correct_init = tensor.empty() : tensor<i1>
  %all_correct_filled = linalg.fill ins(%true_constant : i1) outs(%all_correct_init : tensor<i1>) -> tensor<i1>
  %verification_result = linalg.reduce ins(%within_tolerance : tensor<4097x4097xi1>) 
                                       outs(%all_correct_filled : tensor<i1>)
                                       dimensions = [0, 1]
  (%in: i1, %init_val: i1) {
    %and_result = arith.andi %in, %init_val : i1
    linalg.yield %and_result : i1
  }
  
  // Optional: Print or assert the verification result
  // For debugging, you might want to extract the scalar value:
  %final_result = tensor.extract %verification_result[] : tensor<i1>
  
  // You could add an assertion here if your MLIR dialect supports it:
  cf.assert %final_result, "Matrix multiplication verification failed"
  
  return
}


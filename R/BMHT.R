# Based on the formula 6 ('Half-thresholding' strategy in constructing gene coexpression networks)

# d_{ci}(BMHT) is the function we’re defining.
# x_{ij} and y_{ij} are the elements of x and y, respectively, at the jth position.
# n is the length of the vectors.
# The square root symbol √ denotes the square root of a number.
# The square symbol ^2 denotes the square of a number.
# The summation symbol ∑ denotes the sum of the sequence of numbers.
# The fraction symbol / denotes division.


d_ci <- function(x, y) {
  # Ensure x and y are vectors of the same length
  if (length(x) != length(y)) {
    stop("x and y must be vectors of the same length")
  }
  
  # Calculate the sum of squared differences
  sum_of_squares <- sum((x - y)^2)
  
  # Calculate d_ci
  d_ci <- sqrt(sum_of_squares / length(x))
  
  return(d_ci)
}


############# Based on the formula 7 #############

indicator_function <- function(M, p_c_T1, p_c_T2, d_ci) {
  # Ensure p_c_T1 and p_c_T2 are vectors of the same length
  if (length(p_c_T1) != length(p_c_T2)) {
    stop("p_c_T1 and p_c_T2 must be vectors of the same length")
  }
  
  # Calculate the sum of indicator function values
  sum_of_indicators <- sum(sapply(1:M, function(m) {
    if (d_ci(p_c_T1[m], p_c_T2[m]) >= d_ci(p_c_T1, p_c_T2)) {
      return(1)
    } else {
      return(0)
    }
  }))
  
  # Calculate the final result
  result <- sum_of_indicators / M
  
  return(result)
}

##### Based on the formula 8 - (The maximum clique analysis)


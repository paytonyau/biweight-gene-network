# Based on the formula 6 (The 'biweight midcorrelation and half-thresholding' method (BMHT))

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
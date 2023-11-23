# Based on the equation number 5 (Biweight midcorrelation)

# bicolor(x, y) is the function we’re defining.
# x and y are the input vectors.
# x_i and y_i are the elements of x and y, respectively.
# m is the length of the vectors.
# med(x) and med(y) represent the median of x and y, respectively.
# w_i(x) and w_i(y) are weight functions applied to x and y, respectively.
# The summation symbol ∑ denotes the sum of the sequence of numbers.
# The square root symbol √ denotes the square root of a number.
# The square symbol ^2 denotes the square of a number.


bicolor <- function(x, y) {
  # Ensure x and y are vectors of the same length
  if (length(x) != length(y)) {
    stop("x and y must be vectors of the same length")
  }

  # Calculate medians
  med_x <- median(x)
  med_y <- median(y)

  # Define weight functions w_i(x) and w_i(y)
  # Note: You may need to replace these with the actual weight functions
  w_x <- function(i) { 1 }
  w_y <- function(i) { 1 }

  # Calculate numerator and denominator
  numerator <- sum((x - med_x) * sapply(1:length(x), w_x) * (y - med_y) * sapply(1:length(y), w_y))
  denominator <- sqrt(sum((x - med_x) * sapply(1:length(x), w_x))^2) * sqrt(sum((y - med_y) * sapply(1:length(y), w_y))^2)

  # Calculate and return bicolor
  bicolor <- numerator / denominator
  return(bicolor)
}

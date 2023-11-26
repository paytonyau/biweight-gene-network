#### The 'biweight midcorrelation and half-thresholding' method (BMHT)
#############  Based on the formula 6 ############# 
# calculates the average coexpression change between a gene and its informative coexpression genes

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

############# The permutation p-value (Based on the formula 7) ############# 
# M = permutations

indicator_function <- function(x, y, M, d_c) {
  # Ensure x and y are vectors of the same length
  if (length(x) != length(y)) {
    stop("x and y must be vectors of the same length")
  }
  # Calculate the sum of indicator function values
  sum_vector <- rep(0, M)
  for (m in 1:M) {
    # Permute the vectors
    x_perm <- sample(x)
    y_perm <- sample(y)
    # Calculate the differential coexpression for the permuted vectors
    d_c_perm <- d_ci(x_perm, y_perm)
    # Update the indicator function value
    sum_vector[m] <- as.numeric(d_c_perm >= d_c)
  }
  # Calculate the final result
  result <- sum(sum_vector) / M
  return(result)
}

################## The maximum clique analysis (Based on the formula 8) ################

apply_conditions <- function(A1, A2, T1, T2) {
  A1[A1 >= T1] <- 1
  A1[A1 < T1] <- 0
  A2[A2 <= T2] <- 1
  A2[A2 > T2] <- 0
  A <- A1 & A2
  return(A)
}

############### example use for formula 8
## Set the seed for reproducibility
# set.seed(123)

## Create two 5x5 matrices of random values
# A1 <- matrix(rnorm(25), nrow=5)
# A2 <- matrix(rnorm(25), nrow=5)

## Define the thresholds
# T1 <- 0
# T2 <- 0

## Apply the conditions
# A <- apply_conditions(A1, A2, T1, T2)

## Print the result
# print(A)

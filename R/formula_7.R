############# Based on the formula 7 (the permutation p-value) ############# 

indicator_function <- function(x, y, M, d_c) {
  # Ensure x and y are vectors of the same length
  if (length(x) != length(y)) {
    stop("x and y must be vectors of the same length")
  }
  # Calculate the sum of indicator function values
  sum_vector <- rep(0, M)
  for (m in 1:M) {
    sum_vector[m] <- as.numeric(d_c(x[m, , drop = FALSE], y[m, , drop = FALSE]) >= d_c(x, y))
  }
  # Calculate the final result
  result <- sum(sum_vector) / M
  return(result)
}

####### example use
## Set the seed for reproducibility
# set.seed(123)

# Create two 100x100 matrices of random gene expressions
# X <- matrix(rnorm(10000), nrow=100, ncol=100)
# Y <- matrix(rnorm(10000), nrow=100, ncol=100)

# Name the rows and columns
# rownames(X) <- paste0("Gene_", 1:100)
# colnames(X) <- paste0("Sample_", 1:100)
# rownames(Y) <- paste0("Gene_", 1:100)
# colnames(Y) <- paste0("Sample_", 1:100)

## Call the function
# NOTE: 100 = number of genes, d_ci is the BMHT function
indicator_function_result <- indicator_function(X, Y, 100, d_ci)

#### The 'biweight midcorrelation and half-thresholding' method (BMHT)
#############  Based on the formula 6 ############# 
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

indicator_function <- function(x, y, M, d_c) {
  # Ensure x and y are vectors of the same length
  if (length(x) != length(y)) {
    stop("x and y must be vectors of the same length")
  }
  # Calculate the sum of indicator function values
  sum_vector <- rep(0, M)
  for (m in 1:M) {
    sum_vector[m] <- as.numeric(d_c(x[m, , drop = FALSE], 
                                    y[m, , drop = FALSE]) >= d_c(x, y))
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
# indicator_function_result <- indicator_function(X, Y, 100, d_ci)

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

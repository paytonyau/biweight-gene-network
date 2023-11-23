##### Based on the formula 8 - (The maximum clique analysis)
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

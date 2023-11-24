##### The “Differential Coexpression Threshold” Strategy #####
assign_A_G <- function(A_GN, A_GD, T1, T2) {
  A_G <- array(0, dim(A_GN))
  
  # Case 1: A_GN(i, j) >= T1
  A_G[A_GN >= T1] <- 1
  
  # Case 2: A_GD(i, j) <= T2
  A_G[A_GD <= T2] <- 1
  
  # Case 3: A_GN(i, j) <= T1 and A_GD(i, j) >= T2
  A_G[(A_GN <= T1) & (A_GD >= T2)] <- A_GN[(A_GN <= T1) & (A_GD >= T2)] & A_GD[(A_GN <= T1) & (A_GD >= T2)]
  
  # Case 4: A_GN(i, j) >= T1 and A_GD(i, j) <= T2
  A_G[(A_GN >= T1) & (A_GD <= T2)] <- A_GN[(A_GN >= T1) & (A_GD <= T2)] & A_GD[(A_GN >= T1) & (A_GD <= T2)]
  
  return(A_G)
}

####### example run ######
# Create the A_GN and A_GD arrays
A_GN <- array(runif(100), dim = c(5, 20))
A_GD <- array(runif(100), dim = c(5, 20))

# Print the A_GN array
print(A_GN)

# Print the A_GD array
print(A_GD)

# Set the thresholds
T1 <- 0.5
T2 <- 0.5

# Assign values to the A_G array
A_G <- assign_A_G(A_GN, A_GD, T1, T2)

# Print the A_G array
print(A_G)

# Generate the normal matrix
set.seed(123)
normal <- matrix(rnorm(10000), nrow=100, ncol=100)
rownames(normal) <- paste0("Gene_", 1:100)

# Generate the disease matrix
disease <- matrix(rnorm(8000, mean=10), nrow=100, ncol=80)
rownames(disease) <- paste0("Gene_", 1:100)
##############################

# Initialize an empty data frame to store the results
results <- data.frame(Comparison1=character(), 
                      Comparison2=character(), 
                      Bicol=numeric(), 
                      BMHT=numeric())

# Loop over all pairs of genes
for (i in 1:(nrow(normal)-1)) {
  for (j in (i+1):nrow(normal)) {
    # Extract the expression levels for the two genes
    x <- normal[i, ]
    y <- normal[j, ]
    
    # Calculate the Biweight Midcorrelation and differential coexpression
    bicol_result <- bicol(x, y)
    d_ci_result <- d_ci(x, y)
    
    # Store the results
    results <- rbind(results, data.frame(Comparison1=rownames(normal)[i], 
                                         Comparison2=rownames(normal)[j], 
                                         Bicol=bicol_result, 
                                         BMHT=d_ci_result))
  }
}

# Print the results
print(results)

#######################

#### For the `Store the maximum p-value`
# Storing the maximum p-value in this context serves a specific purpose. 
# When comparing the differential coexpression of a gene under normal and disease conditions, you perform a permutation test for each condition. 
# This results in two p-values: one for the normal condition and one for the disease condition.

# The maximum of these two p-values is taken as a conservative estimate of the statistical significance of the differential coexpression for that gene. 
# If either of the p-values is large (typically greater than 0.05), it suggests that the observed differential coexpression could have occurred by chance under that condition.
# By taking the maximum, you ensure that you only consider the gene to be differentially coexpressed if it is statistically significant under both conditions.

# This is a common approach in multiple testing scenarios, where you want to control the overall error rate. 
# However, it's worth noting that this is a very conservative approach and could potentially miss some truly differentially coexpressed genes if their p-value is just above the threshold in one condition. 
# Other methods, such as the Benjamini-Hochberg procedure, provide a less conservative control of the error rate and might be more appropriate depending on the specific research question and data. 


### For the `apply_conditions` 
# The thresholds T1 and T2 in the apply_conditions function are parameters that you would typically choose based on the specific requirements of your analysis. 
# These thresholds determine which genes are considered to be coexpressed under normal and disease conditions, respectively.
# Choosing appropriate values for T1 and T2 can be challenging, as it often involves a trade-off between sensitivity and specificity. 
# If the thresholds are too low, you might identify too many genes as being coexpressed, including some that are not truly coexpressed (false positives). 
# On the other hand, if the thresholds are too high, you might miss some truly coexpressed genes (false negatives).

# One common approach is to choose the thresholds based on the distribution of coexpression values. 
# For example, you might set T1 and T2 to be the 95th percentile of the coexpression values under normal and disease conditions, respectively. 
# This would mean that only the top 5% of coexpression values are considered to be significant.
# Another approach is to use cross-validation or a similar technique to choose the thresholds that maximize some measure of performance, such as the area under the receiver operating characteristic curve (AUC-ROC).
# In any case, the choice of thresholds should be guided by the specific goals of your analysis and the characteristics of your data. 
# It’s also important to report the thresholds you used in any publications or presentations, so that others can reproduce your results.

# Initialize an empty data frame to store the results
results <- data.frame(Gene=character(), 
                      P_Value=numeric(),
                      BH=numeric())

# Number of permutations
M <- 2
T1 = 0.25
T2 = 0.25
  
# Loop over all genes
for (i in 1:nrow(normal)) {
  # Initialize an empty vector to store the p-values for each comparison
  p_values_gene <- numeric(nrow(normal) - 1)
  
  # Extract the expression levels for the gene in the normal and disease conditions
  x_normal <- normal[i, ]
  x_disease <- disease[i, ]
  
  # Apply conditions
  x_normal <- apply_conditions(x_normal, x_normal, T1, T2)
  x_disease <- apply_conditions(x_disease, x_disease, T1, T2)
  
  # Loop over all other genes
  for (j in setdiff(1:nrow(normal), i)) {
    # Extract the expression levels for the other gene in the normal and disease conditions
    y_normal <- normal[j, ]
    y_disease <- disease[j, ]
    
    # Apply conditions
    y_normal <- apply_conditions(y_normal, y_normal, T1, T2)
    y_disease <- apply_conditions(y_disease, y_disease, T1, T2)
    
    # Calculate the original differential coexpression value
    d_ci_normal <- d_ci(x_normal, y_normal)
    d_ci_disease <- d_ci(x_disease, y_disease)
    
    # Run the indicator function
    p_value_normal <- indicator_function(x_normal, y_normal, M, d_ci_normal)
    p_value_disease <- indicator_function(x_disease, y_disease, M, d_ci_disease)
    
    # Store the maximum p-value
    p_values_gene[j] <- max(p_value_normal, p_value_disease)
  }
  
  # Store the p-values for this gene
  p_value <- mean(p_values_gene, na.rm = TRUE)
  results <- rbind(results, data.frame(Gene=paste0("Gene_", i), P_Value=p_value))
}

# Apply the Benjamini-Hochberg correction
results$BH <- p.adjust(results$P_Value, method="BH")

# Print the results
print(results)

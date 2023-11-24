
# Gene coexpression using Biweight midcorrelation coefficient approach

In this project, Zheng et al. use the biweight midcorrelation for constructing binary networks. They employ Biweight Midcorrelation, a measure less sensitive to outliers than the traditional Pearson correlation, to assess similarity between gene expression profiles. The first paper used the method called the ‘half-thresholding’ strategy[^1], and another study utilised the ‘Differential Coexpression Threshold’ strategy[^2] to eliminate non-informative correlation pairs, thus enabling the calculation of the differential coexpression value for each gene.


 [^1]:Zheng, C. H., Yuan, L., Sha, W., & Sun, Z. L. (2014). Gene differential coexpression analysis based on biweight correlation and maximum clique. _BMC bioinformatics_, _15 Suppl 15_(Suppl 15), S3. https://doi.org/10.1186/1471-2105-15-S15-S3
 [^2]:Yuan, L., Zheng, C. H., Xia, J. F., & Huang, D. S. (2015). Module Based Differential Coexpression Analysis Method for Type 2 Diabetes. _BioMed research international_, _2015_, 836929. https://doi.org/10.1155/2015/836929

Below is the code based on the formulas from the papers

[1. **Biweight midcorrelation coefficients**]

(https://github.com/paytonyau/biweight-gene-network/tree/main/Rbicol.R)

[2. **The 'half-thresholding' strategy**]

Formula 6: (https://github.com/paytonyau/biweight-gene-network/tree/main/Rformula_6.R)

Formula 7: (https://github.com/paytonyau/biweight-gene-network/tree/main/Rformula_7.R)

[3. **The Maximum Clique**]

(https://github.com/paytonyau/biweight-gene-network/tree/main/Rmax_clique.R)

[4. **The “Differential Coexpression Threshold” Strategy**]

(https://github.com/paytonyau/biweight-gene-network/tree/main/diff_coexp_threshold.R)

[5. **The Maximum Clique Concept & k-Clique Algorithm**]

(https://github.com/paytonyau/biweight-gene-network/tree/main/max_clique_k-clique.R)

## Example
[6. **Pending**]


## The package is under development. 


### Additional reading:
Ebru Temizhan, Hamit Mirtagioglu, & Mehmet Mendes. (2022). Which Correlation Coefficient Should Be Used for Investigating Relations between Quantitative Variables?. _American Scientific Research Journal for Engineering, Technology, and Sciences_, _85_(1), 265–277. Retrieved from https://asrjetsjournal.org/index.php/American_Scientific_Journal/article/view/7326

Song, L., Langfelder, P., & Horvath, S. (2012). Comparison of co-expression measures: mutual information, correlation, and model based indices. _BMC bioinformatics_, _13_, 328. https://doi.org/10.1186/1471-2105-13-328


"BioTranslate: Turning Bioscience Publications into Packages" is a mini project dedicated to bridging the gap between publised models to packages in the field of biosciences.

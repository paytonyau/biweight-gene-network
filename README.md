
# Gene differential coexpression analysis based on biweight correlation and maximum clique

In this project, Zheng et al. present a robust approach to differential coexpression analysis in gene expression data. They employ Biweight Midcorrelation, a measure less sensitive to outliers than the traditional Pearson correlation, to assess similarity between gene expression profiles. Their method incorporates a ‘half-thresholding’ strategy to eliminate non-informative correlation pairs, thus enabling the calculation of the differential coexpression value for each gene[^1]. 

 [^1]:Zheng, C. H., Yuan, L., Sha, W., & Sun, Z. L. (2014). Gene differential coexpression analysis based on biweight correlation and maximum clique. _BMC bioinformatics_, _15 Suppl 15_(Suppl 15), S3. https://doi.org/10.1186/1471-2105-15-S15-S3


Below is the code based on the formulas from the paper

[1. **Biweight midcorrelation coefficients**]
(https://github.com/paytonyau/GeneGeneInteraction/tree/main/R/bicol.R)

[2. **The 'half-thresholding' strategy**]
Formula 6: (https://github.com/paytonyau/GeneGeneInteraction/tree/main/R/formula_6.R)
Formula 7: (https://github.com/paytonyau/GeneGeneInteraction/tree/main/R/formula_7.R)

[3. **Apply maximum clique analysis to select gene subset**]
(https://github.com/paytonyau/GeneGeneInteraction/tree/main/R/max_clique.R)


### The package is under development. 


#### Additional reading:
Yuan, L., Zheng, C. H., Xia, J. F., & Huang, D. S. (2015). Module Based Differential Coexpression Analysis Method for Type 2 Diabetes. _BioMed research international_, _2015_, 836929. https://doi.org/10.1155/2015/836929

Ebru Temizhan, Hamit Mirtagioglu, & Mehmet Mendes. (2022). Which Correlation Coefficient Should Be Used for Investigating Relations between Quantitative Variables?. _American Scientific Research Journal for Engineering, Technology, and Sciences_, _85_(1), 265–277. Retrieved from https://asrjetsjournal.org/index.php/American_Scientific_Journal/article/view/7326

Song, L., Langfelder, P., & Horvath, S. (2012). Comparison of co-expression measures: mutual information, correlation, and model based indices. _BMC bioinformatics_, _13_, 328. https://doi.org/10.1186/1471-2105-13-328

Despite the wealth of models and formulas presented in scientific publications, there is often a lack of progression into programming packages that can be utilised by others. "BioTranslate: Turning Bioscience Publications into Applications" is a project dedicated to bridging the gap between theoretical knowledge and practical application in the field of biosciences. 

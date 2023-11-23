# Gene differential coexpression analysis based on biweight correlation and maximum clique

In this project, Zheng et al. present a robust approach to differential coexpression analysis in gene expression data. They employ Biweight Midcorrelation, a measure less sensitive to outliers than the traditional Pearson correlation, to assess similarity between gene expression profiles. Their method incorporates a ‘half-thresholding’ strategy to eliminate non-informative correlation pairs, thus enabling the calculation of the differential coexpression value for each gene. Experimental results on simulated data demonstrate that their approach outperforms three existing differential coexpression analysis methods[^1]. 

 [^1]:Zheng, C. H., Yuan, L., Sha, W., & Sun, Z. L. (2014). Gene differential coexpression analysis based on biweight correlation and maximum clique. _BMC bioinformatics_, _15 Suppl 15_(Suppl 15), S3. https://doi.org/10.1186/1471-2105-15-S15-S3


Here is a brief description of each step in the analysis from the authors:
1. **Input gene expression data**: This is the initial step where the gene expression data is collected and prepared for analysis.

2. **Calculate biweight midcorrelation coefficients between all gene pairs**: Biweight midcorrelation is a measure of similarity between gene expression profiles that is less sensitive to outliers than the commonly used Pearson correlation.

3. **Filter out non-informative correlation pairs using the 'half-thresholding' strategy**: This strategy keeps a link in both coexpression networks if at least one of the two coexpression values exceeds the threshold.

4. **Calculate differential coexpression value of gene**: This step involves calculating the change in coexpression of a gene across different conditions or time points.

5. **Select differentially coexpressed gene pairs**: This step involves identifying gene pairs whose coexpression patterns differ significantly between conditions or over time.

6. **Apply maximum clique analysis to select gene subset**: Maximum clique analysis is a method used to find the largest subset of genes that are all directly connected to each other in the coexpression network.


#### The package is under development. 


"BioTranslate: Turning Bioscience Publications into Applications" is a project dedicated to bridging the gap between theoretical knowledge and practical application in the field of biosciences. Despite the wealth of models and formulas presented in scientific publications, there is often a lack of progression into programming packages that can be utilised by others. This project aims to address this issue, transforming valuable scientific findings into practical tools. With a focus on biosciences, BioTranslate seeks to provide valuable insights for biological and clinical research. By translating these theoretical models into practical applications, we can facilitate a more comprehensive understanding of the field and contribute to the advancement of bioscience research. 



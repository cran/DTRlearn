\name{DTRlearn-package}
\alias{DTRlearn-package}
\alias{DTRlearn}
\docType{package}
\title{
Dynamic Treatment Regimens Learning 
}
\description{


Dynamic treatment regimens (DTRs) are sequential decision rules tailored at each stage by time-varying subject-specific features and intermediate outcomes observed in previous stages.  For many complex chronic disorders, DTRs  operationalize the sequential process of medical decision-making. Sequential Multiple Assignment Randomized Trials (SMARTs) are proposed to best construct DTRs which offer a causal interpretation of their comparisons through randomization at each critical decision point. Machine learning methods such as O-learning (Zhao et. al. 2012,2014), Q-learning (Murphy et. al. 2007, Zhao et.al. 2009) and P-learning (Liu et. al. 2014, 2015) have been proposed to estimate the optimal individualized treatment from a SMART. %They can also be used to analysis observational data provided estimation for the distribution of the treatment. 

This package implements these 3 main types of algorithms to estimate the optimal DTR. The algorithms consider a continuous outcome (the larger indicates better clinical results), and allow two treatment choices for each stage coded by 1 and -1.
}
\details{
\tabular{ll}{
Package: \tab DTRlearn\cr
Type: \tab Package\cr
Version: \tab 1.1\cr
Date: \tab 2015-10-26\cr
License: \tab GPL-2\cr
}
}
\author{Ying Liu \cr
Yuanjia Wang\cr
Donglin Zeng
}
\references{

Liu, Y., Zeng, D., Wang, Y. (2014). Use of personalized Dynamic Treatment Regimes (DTRs) and Sequential Multiple Assignment Randomized Trials (SMARTs) in mental health studies. Shanghai archives of psychiatry, 26(6), 376.
\url{http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4311115/}\cr

Liu et al. (2015). Under double-blinded review.\cr

Zhao, Y., Zeng, D., Rush, A. J., & Kosorok, M. R. (2012). \emph{Estimating individualized treatment rules using outcome weighted learning.} Journal of the American Statistical Association, 107(499), 1106-1118.\cr

Zhao, Y. Q., Zeng, D., Laber, E. B., & Kosorok, M. R. (2014). \emph{New statistical learning methods for estimating optimal dynamic treatment regimes.} Journal of the American Statistical Association, (just-accepted), 00-00.\cr
Watkins, C. J. C. H. (1989). \emph{Learning from delayed rewards (Doctoral dissertation,} University of Cambridge).\cr

Murphy, S. A., Oslin, D. W., Rush, A. J., & Zhu, J. (2007). \emph{Methodological challenges in constructing effective treatment sequences for chronic psychiatric disorders.} Neuropsychopharmacology, 32(2), 257-262.\cr

Zhao, Y., Kosorok, M. R., & Zeng, D. (2009). \emph{Reinforcement learning design for cancer clinical trials.} Statistics in medicine, 28(26), 3294.\cr

}
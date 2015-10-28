\name{Plearning}
\alias{Plearning}

\title{
Plearning
}
\description{This is the Plearning to estimate optimal multistage DTR. It implements improved Olearning to estimate optimal treatment rules for each stage backwardly. And it also borrows idea from Q-learning to utilize the estimated optimal outcomes for later stages.}
\usage{
Plearning(X,AA,RR,n,K,pi,pentype = "lasso",kernel ="linear",
sigma=c(0.03,0.05,0.07),clinear=2^(-2:2),m=4,e=1e-05)}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{X}{is either a matrix shared among all stages; or list of feature matrices, where feature matrices from different stages can have different dimensions.}
  \item{AA}{a list of K, each element \code{A[[i]]} is the treatment assignment vector for stage i.}
  \item{RR}{a list of K, each element \code{R[[i]]} is the outcome vector for stage i.}
  \item{n}{sample size}
  \item{K}{number of stages}
  \item{pi}{a list of K, the i'th  element is the randomization probability at stage i}
  \item{pentype}{the type of regression used to take residual, 'lasso' is the default, using lasso regression; 'LSE' is the ordianry least square regression. as in the function \code{\link{wsvm}}}
  \item{clinear}{is grid of tuning parameter for \code{\link{wsvm}}, and we use cross validation to choose the tuning parameter here. }
  \item{m}{number of folds in cross validation for \code{\link{Olearning_Single}}. }
  \item{e}{The rounding error for to compute bias in \code{\link{wsvm}}}
  \item{kernel}{The choice of kernel for Improved O-learning, default is \code{'linear'}, can also be \code{'rbf'}}
  \item{sigma}{if \code{'rbf'} is chosen for kernel, the grid of sigma to serach by cross validation.}
}

\value{
\item{models}{ a list of models of class 'linearcl'}
}
\references{
Liu, Y., Zeng, D., Wang, Y. (2014). Use of personalized Dynamic Treatment Regimes (DTRs) and Sequential Multiple Assignment Randomized Trials (SMARTs) in mental health studies. Shanghai archives of psychiatry, 26(6), 376.
\url{http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4311115/}\cr

Liu et al. (2015). Under double-blinded review.\cr
}
\author{
Ying Liu  yl2802@cumc.columbia.edu
\url{http://www.columbia.edu/~yl2802/}
}
%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{Olearning_Single}}, \code{\link{Qlearning_Single}}
}
\examples{
n_cluster=10
pinfo=10
pnoise=20
example2=make_2classification(n_cluster,pinfo,pnoise,100)
pi=list()
pi[[2]]=pi[[1]]=rep(1,100)
modelP=Plearning(example2$X,example2$A,example2$R,100,2,pi)
}
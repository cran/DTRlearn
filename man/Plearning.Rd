\name{Plearning}
\alias{Plearning}

\title{
Plearning
}
\description{This is the Plearning to learn optimal multistage DRT.}
\usage{
Plearning(X,AA,RR,n,K,pi,pentype = "lasso",kernel ="linear",
sigma=c(0.03,0.05,0.07),clinear=2^(-2:2),m=4,e=1e-05)}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{X}{is either a matrix share among different stages, or list of feature matrix, row is sample, feature matrix of different stages can have different dimensions.}
  \item{AA}{List of K, \code{A[[i]]} is the treatment assignment vector for stage i.}
  \item{RR}{List of K, \code{R[[i]]} is the outcome vector for stage i.}
  \item{n}{sample size}
  \item{K}{number of stages}
  \item{pi}{list of K, the i'th  element is the randomization probability at stage i}
  \item{pentype}{The regression used to take residual, 'lasso' is the default, using lasso regression; 'LSE' is the ordianry least square. see also \code{\link{wsvm}}}
  \item{clinear}{is grid of tuning parameter for \code{\link{wsvm}}, see also \code{\link{Olearning_Single}}}
  \item{m}{number of folds in cross validation. see also }
  \item{e}{The rounding error for that numerically, \eqn{|\alpha|<e}, we consider \eqn{\alpha=0}.}
  \item{kernel}{The choice of kernel for Improved O-learning, default is \code{'linear'}, can also be \code{'rbf'}}
  \item{sigma}{if \code{'rbf'} is chosen for kernel, the grid of sigma to serach by cross validation.}
}

\value{
\item{models}{list of models of class 'linearcl'}
}
\references{
Use of personalized Dynamic Treatment Regimes (DTRs) and Sequential Multiple Assignment Randomized Trials (SMARTs) in mental health studies
\url{http://www.ncbi.nlm.nih.gov/pmc/articles/PMC4311115/}\cr

The methodology paper is under double blinded review.
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
example2=make_2classification(n_cluster,pinfo,pnoise,200)
test=make_2classification(n_cluster,pinfo,pnoise,200,example2$centroids)
pi=list()
pi[[2]]=pi[[1]]=rep(1,200)
modelP=Plearning(example2$X,example2$A,example2$R,200,2,pi)
}
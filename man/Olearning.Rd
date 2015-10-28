\name{Olearning}
\alias{Olearning}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Multiple stage Improved Olearning}
\description{This function implements multiple stage O-learning (with improved single stage O-learing) to find optimal DTR by backward induction.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
Olearning(X,AA,RR,n,K,pi, pentype="lasso",kernel="linear",
sigma=c(0.03,0.05,0.07),clinear = 2^(-2:2), m = 4, e = 1e-05)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{X}{is either a matrix shared among all stages; or list of feature matrices, where feature matrices from different stages can have different dimensions.}
  \item{AA}{a list of K, each element \code{A[[i]]} is the treatment assignment vector for stage i.}
  \item{RR}{a list of K, each element \code{R[[i]]} is the outcome vector for stage i.}
 \item{n}{sample size}
  \item{K}{number of stages}
  \item{pi}{a list of K, the i'th  element is the randomization probability at stage i}
    \item{pentype}{the type of regression used to take residual, 'lasso' is the default, using lasso regression; 'LSE' is the ordianry least square regression. as in the function \code{\link{wsvm}}}
  \item{kernel}{The choice of kernel for Improved O-learning, default is \code{'linear'}, can also be \code{'rbf'}}
 \item{sigma}{ if kernel='rbf', sigma is the grid of tuning parameter for 'rbf' kernal to run cross validation to choose from, the default is (0.03, 0.05, 0.07)}
\item{clinear}{
is grid of tuning parameter for \code{\link{wsvm}}, which cross validation was run to choose from. the default is 2^(-2:2)}
  \item{m}{number of folds in cross validation for \code{\link{Olearning_Single}}. }
\item{e}{The rounding error for computing bias in \code{\link{wsvm}}}
}
\value{
\item{models}{ a list of models of class 'linearcl'}
}
\references{
Liu et al. (2015). Under double-blinded review.

Zhao, Y., Zeng, D., Rush, A. J., & Kosorok, M. R. (2012). \emph{Estimating individualized treatment rules using outcome weighted learning.} Journal of the American Statistical Association, 107(499), 1106-1118.\cr

Zhao, Y. Q., Zeng, D., Laber, E. B., & Kosorok, M. R. (2014). \emph{New statistical learning methods for estimating optimal dynamic treatment regimes.} Journal of the American Statistical Association, (just-accepted), 00-00.\cr
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{Olearning_Single}}
}

\examples{
n_cluster=10
pinfo=10
pnoise=20
example2=make_2classification(n_cluster,pinfo,pnoise,200)
test=make_2classification(n_cluster,pinfo,pnoise,200,example2$centroids)
pi=list()
pi[[2]]=pi[[1]]=rep(1,200)
modelO=Olearning(example2$X,example2$A,example2$R,200,2,pi)
}
\keyword{models}

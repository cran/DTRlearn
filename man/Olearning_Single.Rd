\name{Olearning_Single}
\alias{Olearning_Single}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Single stage improved O-learning
}
\description{
Improved outcome weighted learning, first take residuals; and then use cross validation to choose best tuninng parameter for \code{\link{wsvm}}. Return the O-learning models with best tuning parameters.
%%  ~~ A concise (1-5 lines) description of what the function does. ~~
}
\usage{
Olearning_Single(H,A,R2,pi=rep(1, n),pentype ="lasso",kernel="linear",
sigma = c(0.03, 0.05, 0.07),clinear = 2^(-2:2), m = 4,e = 1e-05)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{H}{
a n by p matrix, n is the sample size, p is the number of feature variables.
}
  \item{A}{
a vector of n entries coded 1 and -1 for the treatment assignments 
}
  \item{R2}{
The vector of outcome variable, larger is more desirable.
}
  \item{pi}{
The vector of randomization probability \eqn{P(A|X)}, or the estimated observed probability.
}
  \item{pentype}{
The regression used to take residual, 'lasso' is the default, using lasso regression; 'LSE' is the ordianry least square.
}
  \item{kernel}{Kernel function for weighted SVM, can be \code{'linear'} or \code{'rbf'} (radial basis kernel), default is \code{'linear'}. When \code{'rbf'} is specified, one can specify the \code{sigma} parameter for radial basis kernel.
%%     ~~Describe \code{kernel} here~~
}
  \item{sigma}{A grid of tuning parameter for 'rbf' kernal for cross validation, when kernel='rbf', the default is \eqn{c(0.03, 0.05, 0.07)}
%%     ~~Describe \code{sigma} here~~
}
  \item{clinear}{a grid of tuning parameter C for cross validation,the default is \eqn{2^(-2:2)}. C is tuning parameter as defined in \code{\link{wsvm}}
%%     ~~Describe \code{clinear} here~~
}
  \item{m}{Folds of cross validation. the training and test ratio is (m-1):1.
%%     ~~Describe \code{m} here~~
}
  \item{e}{The rounding 
%%     ~~Describe \code{e} here~~
}
}

\value{
\item{model}{A Class of }
}
\references{
Zhao, Y., Zeng, D., Rush, A. J., & Kosorok, M. R. (2012). \emph{Estimating individualized treatment rules using outcome weighted learning.} Journal of the American Statistical Association, 107(499), 1106-1118.\cr
}
\author{
Ying Liu
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{Olearning}}
}
\examples{
n_cluster=5
pinfo=10
pnoise=10
n_sample=50
set.seed(3)
example=make_classification(n_cluster,pinfo,pnoise,n_sample)
pi=list()
pi[[2]]=pi[[1]]=rep(1,n_sample)
modelrbf=Olearning_Single(example$X,example$A,example$R,kernel='rbf',m=3,sigma=0.05)
modellinear=Olearning_Single(example$X,example$A,example$R)
}

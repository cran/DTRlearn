\name{Olearning_Single}
\alias{Olearning_Single}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Improved single stage O-learning with cross validation
}
\description{
Improved outcome weighted learning, first take residuals; and then use cross validation to choose best tuning parameter for \code{\link{wsvm}}. Return the O-learning models with best tuning parameters. Improving from Zhao 2012, the improved outcome weighted learning first take main effect out by regression; the weights are absolute value of the residual; more details can be found in Liu et al. (2015).
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
a vector of outcome variable, larger is more desirable.
}
  \item{pi}{
a vector of randomization probability \eqn{P(A|X)}, or the estimated observed probability.
}
  \item{pentype}{
the type of regression used to take residual, 'lasso' is the default (lasso regression); 'LSE' is the ordinary least square regression.
}
  \item{kernel}{kernel function for weighted SVM, can be \code{'linear'} or \code{'rbf'} (radial basis kernel), default is \code{'linear'}. When \code{'rbf'} is specified, one can specify the \code{sigma} parameter for radial basis kernel.
%%     ~~Describe \code{kernel} here~~
}
  \item{sigma}{a grid of tuning parameter sigma for 'rbf' kernel for cross validation, when kernel='rbf', the default is \eqn{c(0.03, 0.05, 0.07)}
%%     ~~Describe \code{sigma} here~~
}
  \item{clinear}{a grid of tuning parameter C for cross validation,the default is \eqn{2^(-2:2)}. C is tuning parameter as defined in \code{\link{wsvm}}
%%     ~~Describe \code{clinear} here~~
}
  \item{m}{folds of cross validation for choosing tuning parameters C and sigma. If \code{'lasso'} is specified for \code{'pentype'}, m is also the folds CV for \code{\link{cv.glmnet}} in the step of taking residual.
}
  \item{e}{the rounding error when computing bias in \code{\link{wsvm}} }
}

\value{
It returns model estimated from \code{\link{wsvm}} with the best tuning parameters picked by cross validation.
If kernel \code{'linear'} is specified, it returns an object of class \code{'linearcl'}, and it is a list include the following elements:
\item{alpha1}{the scaled solution for the dual problem: \eqn{alpha1_i=\alpha_i A_i wR_i} }
\item{bias}{the intercept \eqn{\beta_0} in \eqn{f(X)=\beta_0+X\beta}.}
\item{fit}{a vector of estimated values for \eqn{\hat{f(x)}} in training data, \eqn{fit=bias+X\beta=bias+X*X'*alpha1}.}
\item{beta}{The  coefficients \eqn{\beta} for linear SVM, \eqn{f(X)=bias+X\beta}.}

If kernel \code{'rbf'} is specified, it returns an object of class \code{'rbfcl'}, and it is a list include the following elements:
\item{alpha1 }{the scaled solution for the dual problem: \eqn{alpha1_i=\alpha_i A_i wR_i} and \eqn{X\beta= K(X,X)*alpha1} }
\item{bias}{the intercept \eqn{\beta_0} in \eqn{f(X)=\beta_0+h(X)\beta}.}
\item{fit}{a vector of estimated values for \eqn{\hat{f(x)}} in training data, \eqn{fit=\beta_0+h(X)\beta=bias+K(X,X)*alpha1}.}
\item{Sigma}{the bandwidth parameter for the rbf kernel}
\item{X}{the matrix of training feature variable}


}
\references{
Liu et al. (2015). Under double-blinded review.

Zhao, Y., Zeng, D., Rush, A. J., & Kosorok, M. R. (2012). \emph{Estimating individualized treatment rules using outcome weighted learning.} Journal of the American Statistical Association, 107(499), 1106-1118.\cr
}
\author{
Ying Liu 
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{Olearning}};\code{\link{wsvm}}
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

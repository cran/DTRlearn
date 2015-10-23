\name{wsvm}
\alias{wsvm}
%need to include reference and instructions on cite
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Improved Single Stage O-learning}
\description{The wsvm is an implementation of improved single stage outcome weighted learning. It solve the optimization problem of maximizing the expected value function by transforming it into a classification problem, mapping the feature variables to the optimal treatment choice. The function wsvm implements weighted SVM with gaussian or linear kernel. Improving from Zhao 2012, the improved outcome weighted learning first take main effect out by regression; the weights are absolute value of the residual; more details can be found in our paper in submission.
}
\usage{
wsvm(X, A, wR, kernel = "linear", sigma = 0.05, C = 1, e = 1e-05)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{X}{a n by p matrix, n is the sample size, p is the number of feature variables.
%%     ~~Describe \code{X} here~~
}
  \item{A}{a vector of n entries coded 1 and -1 for the treatment assignments}
  \item{wR}{This is weighted outcome computed before hand, it is the outcome \eqn{R_i} weighted by inverse randomzation or observational probability. \eqn{wR_i=R_i/\pi_i}}
  \item{kernel}{Kernel function for weighted SVM, can be \code{'linear'} or \code{'rbf'} (radial basis kernel), default is \code{'linear'}. When \code{'rbf'} is specified, one can specify the \code{sigma} parameter for radial basis kernel.}
  \item{sigma}{Tuning parameter for 'rbf' kernal, this is from rbfdot function in kernlab, \eqn{Kernel(x,y)=exp(-sigma*(x-y)^2)}}
  \item{C}{ C is the tuning parameter for weighted SVM
  \deqn{\min \frac{1}{2}\|\beta\|^2+C\Sigma_{i=1}^N x_i |wR_i|}{min 0.5|\beta|^2 + C \Sigma\xi_i|wR_i|},  subject to \eqn{\xi_i\ge 0} ,\eqn{sign(wR_i)A_i(X_i\beta+\beta_0\ge 1-\xi_i)}}
  \item{e}{The rounding error for that numerically, \eqn{|\alpha|<e}, we consider \eqn{\alpha=0}.}}
  
\value{
If kernel \code{'linear'} is specified, it returns a an object of class \code{'linearcl'}, and including the following elements:
\item{alpha1}{It is the scaled solution for the dual problem, that \eqn{X\beta= X*X'*alpha1} }
\item{bias}{The intercept \eqn{\beta_0} in \eqn{f(X)}.}
\item{fit}{Estimated value for f(x), \eqn{fit=bias+X\beta=bias+X*X'*alpha1}.}
\item{beta}{The  coefficients for linear SVM, \eqn{f(X)=bias+X*beta}.}

If kernel \code{'rbf'} is specified, it returns a an object of class \code{'rbfcl'}, and including the following elements:
\item{alpha1 }{It is the scaled solution for the dual problem, that \eqn{X\beta= K(X,X)*alpha1} }
\item{bias}{The intercept \eqn{\beta_0} in \eqn{f(X)}.}
\item{fit}{Estimated value for f(x), \eqn{fit=bias+h(X)\beta=bias+K(X,X)*alpha1}.}
\item{Sigma}{The bandwidth parameter for the rbf kernel}
\item{X}{The training feature variable matrix}

}
\references{
Zhao, Y., Zeng, D., Rush, A. J., & Kosorok, M. R. (2012). \emph{Estimating individualized treatment rules using outcome weighted learning.} Journal of the American Statistical Association, 107(499), 1106-1118.\cr
}
\author{Ying Liu
yl2802@cumc.columbia.edu
\url{http://www.columbia.edu/~yl2802/}
%%  ~~who you are~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{\code{\link{plot.linearcl}}  \code{\link{predict.linearcl}} \code{\link{predict.rbfcl}}
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
#generating random asigned treatment vector A
n=200
A=2*rbinom(n,1,0.5)-1
p=20
mu=numeric(p)
Sigma=diag(p)
#feature variable is multi variate normal
X=mvrnorm(n,mu,Sigma)
#the outcome is generated where the true optimal treatment 
#is sign of the interaction term(of treatment and feature)
R=X[,1:3]\%*\%c(1,1,-2)+X[,3:5]\%*\%c(1,1,-2)*A+rnorm(n)

# linear SVM
model1=wsvm(X,A,R)
#Check the total number that agress with the true optimal treatment among n=200 patients
sum(sign(model1$fit)==sign(X[,3:5]\%*\%c(1,1,-2)))

# SVM with rbf kernel and sigma=0.05
model2=wsvm(X,A,R,'rbf',0.05)
#Check the total number that agress with the true optimal treatment among n=200 patients
sum(sign(model2$fit)==sign(X[,3:5]\%*\%c(1,1,-2)))
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
%\keyword{  }
%\keyword{ ~kwd2 }% __ONLY ONE__ keyword per line

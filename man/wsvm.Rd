\name{wsvm}
\alias{wsvm}
%need to include reference and instructions on cite
%- Also NEED an '\alias' for EACH other topic documented here.
\title{weighted SVM}
\description{This function transforms the a weighted SVM problem into its dual form, and solves it by the quadratic programing applying \code{\link[kernlab]{ipop}} in package \code{kernlab}. This is the core step in the improved single stage outcome weighted learning (Liu et.al.2015), and now it can takes positive and negative outcomes as an improvement from Zhao et.al.2012. The function \code{wsvm} can implement weighted SVM with gaussian or linear kernel. O-learning target at maximizing the expected value function by transforming it into a classification problem, mapping the feature variables X to the optimal treatment choice, which is \eqn{sign(f(x))=sign(h(x)\beta+\beta_0)}. 
The original problem weighted SVM problem is \eqn{\min \frac{1}{2}\|\beta\|^2+C\Sigma_{i=1}^N x_i |wR_i|}{min 0.5|\beta|^2 + C \Sigma\xi_i|wR_i|,}  subject to \eqn{\xi_i\ge 0} ,\eqn{sign(wR_i)A_i(X_i\beta+\beta_0\ge 1-\xi_i)}

The transformed dual problem is 
\eqn{\min_{\alpha} 0.5\sum_i\sum_j \alpha_i wR_i A_i X_i^T X_j A_j wR_j \alpha_j - \sum_i |wR_i| \alpha_i,} subject to \eqn{0\le\alpha_i\le C,} and \eqn{\sum_i\alpha_i wR_i A_i=0}.

}
\usage{
wsvm(X, A, wR, kernel = "linear", sigma = 0.05, C = 1, e = 1e-05)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{X}{a n by p matrix, n is the sample size, p is the number of feature variables.
%%     ~~Describe \code{X} here~~
}
  \item{A}{a vector of the treatment assignments coded by 1 and -1.}
  \item{wR}{a vector of weighted outcomes computed before hand, it is the outcome \eqn{R_i} weighted by inverse randomzation or observational probability. \eqn{wR_i=R_i/\pi_i}}
  \item{kernel}{the kernel function for weighted SVM, can be \code{'linear'} or \code{'rbf'} (radial basis kernel), default is \code{'linear'}. When \code{'rbf'} is specified, one can specify the \code{sigma} parameter for radial basis kernel.}
  \item{sigma}{the tuning parameter for 'rbf' kernal, this is from \code{\link[kernlab]{rbfdot}} function in package \code{kernlab}, \eqn{Kernel(x,y)=exp(-sigma*(x-y)^2)}}
  \item{C}{the tuning parameter for weighted SVM in the primal problem
  \eqn{\min \frac{1}{2}\|\beta\|^2+C\Sigma_{i=1}^N x_i |wR_i|}{min 0.5|\beta|^2 + C \Sigma\xi_i|wR_i|,} subject to \eqn{\xi_i\ge 0,} \eqn{sign(wR_i)A_i(X_i\beta+\beta_0\ge 1-\xi_i)}}
  \item{e}{the rounding error when computing the bias, for the varaibles \eqn{\alpha_i}'s in the dual problem, if \eqn{|\alpha_i|<e}, we consider \eqn{\alpha=0}.}}
  
\value{
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
#feature variable is multivariate normal distributed
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


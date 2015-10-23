\name{plot.linearcl}
\alias{plot.linearcl}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plot the linear coefficients}
\description{
Plot the standardized coefficients from SVM with linear kernel, i.e. it devides the coefficients for a  selected set of variables by the L2 norm.}
\usage{
## S3 method for class 'linearcl'
\method{plot}{linearcl}(x, index = NULL, names = NULL,
ylab = "std coefficients", xlab = "", col = "gray",...)
%\method{plot}{linearcl}(model, \dots)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
Single stage Olearning model with SVM classifier and linear kernel with class \code{'linearcl'}
}
   \item{index}{
is the vector of indexes of variables to plot.
}
  \item{names}{
is the vector of names of each variables to appear in the plot. If not specified, the names would be V1-Vp
}
  \item{ylab}{
The label for y yaxis.
}
  \item{xlab}{
The label for x yaxis.
}
  \item{col}{
color to fill the bars in the plot.
}
\item{...}{further arguments passed to or from other methods.}
}

\author{
Ying Liu  yl2802@cumc.columbia.edu
\url{http://www.columbia.edu/~yl2802/}
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{Olearning_Single}}
}
\examples{
n=200
A=2*rbinom(n,1,0.5)-1
p=20
mu=numeric(p)
Sigma=diag(p)
X=mvrnorm(n,mu,Sigma)
R=X[,1:3]\%*\%c(1,1,-2)+X[,3:5]\%*\%c(1,1,-2)*A+rnorm(n)
model1=Olearning_Single(X,A,R)
plot(model1)
}

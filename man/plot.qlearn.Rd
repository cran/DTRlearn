\name{plot.qlearn}
\alias{plot.qlearn}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{Plot the linear coefficients of interaction
}
\description{
Plot the standardized coefficients from linear regression, i.e. it devides the coefficients for a  selected set of variables by the L2 norm.
}
\usage{
## S3 method for class 'qlearn'
\method{plot}{qlearn}(x, index = NULL, names = NULL, 
ylab = "std coefficients", xlab = "", col = "gray", ...)
%\method{plot}{qlearn}(model)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{x}{
Single stage  Qlearning model of class \code{qlearn}
}
  \item{index}{
is the vector of indexes of variables to plot.
}
  \item{names}{
is the vector of names of each variables to appear in the plot. If not specified, the names would be V1-Vp
}
  \item{ylab}{
The label for y yaxis.defalt is "std coefficients"
}
  \item{xlab}{
The label for x yaxis.
}
  \item{col}{
color to fill the bars in the plot.}

\item{...}{further arguments passed to or from other methods.}
}

\author{
Ying Liu  yl2802@cumc.columbia.edu
\url{http://www.columbia.edu/~yl2802/}
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{Qlearning_Single}}
}
\examples{
n=200
A=2*rbinom(n,1,0.5)-1
p=20
mu=numeric(p)
Sigma=diag(p)
X=mvrnorm(n,mu,Sigma)
R=X[,1:3]\%*\%c(1,1,-2)+X[,3:5]\%*\%c(1,1,-2)*A+rnorm(n)
modelQ=Qlearning_Single(X,A,R)
plot(modelQ)
}

\name{predict.linearcl}
\alias{predict.linearcl}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Predict
}
\description{
This function predicts the optimal treatments with model of class \code{'linearcl'}, which is estimated by \code{\link{wsvm}} with \code{'linear'} kernel.
}
\usage{
\method{predict}{linearcl}(object, x,...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{model of class \code{'linearcl'}}
  \item{x}{a matrix of feature variables, n by p}
  \item{...}{further arguments passed to or from other methods.}
}

\value{
a vector of optimal treatments, each entry is for a row in x, the matrix of new feature variables.
}

\author{
Ying Liu 
}


%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{wsvm}} 
}
\examples{
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
m=100
Xtest=mvrnorm(m,mu,Sigma)
predict(model1,Xtest)
}
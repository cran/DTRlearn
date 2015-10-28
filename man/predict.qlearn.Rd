\name{predict.qlearn}
\alias{predict.qlearn}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Predict optimal treatment by Qlearning
}
\description{
This function predicts optimal treatments for a given Q-learning model of class \code{'qlearn'}.
}
\usage{
%## S3 method for class 'qlearn'
\method{predict}{qlearn}(object, x,...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{ a model with class 'qlearn'}
   \item{x}{a matrix of feature variables,has p columns that is p dimensions of feature variables}
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
\code{\link{Qlearning_Single}}
}
\examples{
n=200
A=2*rbinom(n,1,0.5)-1
p=10
mu=numeric(p)
Sigma=diag(p)
X=mvrnorm(n,mu,Sigma)
R=X[,1:3]\%*\%c(1,1,-2)+X[,3:5]\%*\%c(1,1,-2)*A+rnorm(n)

model1=Qlearning_Single(X,A,R)
m=100
Xtest=mvrnorm(m,mu,Sigma)
predict(model1,Xtest)
}


\name{predict.qlearn}
\alias{predict.qlearn}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Predict optimal treatment by Qlearning
}
\description{
This is function to predict optimal treatment for given Q-learning model of class \code{qlearn} and feature variable x
}
\usage{
## S3 method for class 'qlearn'
\method{predict}{qlearn}(object, x,...)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{object}{with class 'qlearn'}
   \item{x}{a matrix of feature varaibles,has p colunms, p dimensions of feature variables}
   \item{...}{further arguments passed to or from other methods.}
}
\value{
a vector of optimal treatment for each row of x
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


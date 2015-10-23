\name{predict.rbfcl}
\alias{predict.rbfcl}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Predict
}
\description{
predict the best treatment for model with class 'linearcl' produced by \code{\link{wsvm}} with rbf kernel
}
\usage{
## S3 method for class 'rbfcl'
\method{predict}{rbfcl}(object, x,...)
}
%- maybe also 'usage' for other objects documented here.
 \arguments{
  \item{object}{model of class 'rbfcl'}
  \item{x}{a matrix of feature varaibles, n by p}
  \item{...}{further arguments passed to or from other methods.}
}

\value{
a vector of optimal treatment for each row of x
}

\author{
Ying Liu 
yl2802@cumc.columbia.edu  
\url{http://www.columbia.edu/~yl2802/}
}

\seealso{
\code{\link{wsvm}}, \code{\link{Olearning_Single}}
}
\examples{
n_cluster=5
pinfo=10
pnoise=10
n=50
m=20
example1=make_classification(n_cluster,pinfo,pnoise,n)
test=make_classification(n_cluster,pinfo,pnoise,m,example1$centroids)
model1=Olearning_Single(example1$X,example1$A,example1$R)
Atp=predict(model1,test$X)
V1=mean(test$R[Atp==test$A])

model2=wsvm(example1$X,example1$A,example1$R,'rbf',0.05)
model2=Olearning_Single(example1$X,example1$A,example1$R,kernel='rbf',m=3)
Atp=predict(model2,test$X)
}

\name{make_classification}
\alias{make_classification}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Data Simulation for single stage 
}
\description{
It generates simulated datasets to test single stage DTR learning algorithms.
The outcomes are generated based on a pattern mixture model using a latent variable with 2 categories. Category 1 has the optimal treatment y=1, and category 2 has y=-1. The feature variables X has a multivariate normal distribution.
Specifically, we generate centroids of the classes from a multivariate normal distribution mean 0 and std 5. We add the centroids to the first pinfo dimension of the vectors of feature variables X simulated from multivariate normal distribution with \code{pinfo}+\code{pnoise} dimensions. 
The observed treatment assignments \code{A} are  completely random  to be 1 and -1 with probability 0.5, and the outcomes are generated as: \eqn{R_1=0, R_2= 1.5A*y+N(0,1)}.   
}
\usage{
make_classification(n_cluster, pinfo, pnoise, n_sample, centroids = 0)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{n_cluster}{
number of clusters.
}
  \item{pinfo}{
number of informative variables, dimensions of the centroids related to the latent class of the sample.
}
  \item{pnoise}{
number of noise variables.
}
  \item{n_sample}{
sample size
}
  \item{centroids}{
For a training set, do not assign centroids, the centroids are generated randomly by the function. 
For a testing set, one wants to assign the same set of centroids as the training set. It is a matrix of dimension n_cluster by p. 
}
}

\value{
\item{X}{The feature variable matrix, it is a n_sample by pinfo+pnoise matrix generated from multivariate normal distribution. Where the noises are with mean 0 and std 1. The informative variables are shifted to centered at the randomly generated centroids. }
\item{A}{The treatment assignment vector}
\item{y}{The true optimal treatment vector}
\item{R}{Outcomes vector}
\item{centroids}{are from pinfo dimensional multivariate normal distribution. }
}
\references{
This function borrows idea from a python comparable function make_classification in scikit_learn
\url{http://scikit-learn.org/stable/modules/generated/sklearn.datasets.make_classification.html#sklearn.datasets.make_classification}
}
\author{
Ying Liu  yl2802@cumc.columbia.edu
%\url{http://www.columbia.edu/~yl2802/}
}


\seealso{\code{\link{make_2classification}} for generating simulation data for 2 stages

}
\examples{
n_cluster=10
pinfo=10
pnoise=20
example1=make_classification(n_cluster,pinfo,pnoise,100)
test=make_classification(n_cluster,pinfo,pnoise,100,example1$centroids)
model1=Olearning_Single(example1$X,example1$A,example1$R)
Atp=predict(model1,test$X)
V1=mean(test$R[Atp==test$A])

model2=wsvm(example1$X,example1$A,example1$R,'rbf',0.05)
Atp=predict(model2,test$X)
V2=mean(test$R[Atp==test$A])
#in this very non-linear case, one can compare V1 with V2 (the empirical value on testing set),
#and can see the better of model2 using rbf kernel
#to model1 using linear kernel. 
#the true optimal value here is 1.5
}


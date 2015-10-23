\name{make_2classification}
\alias{make_2classification}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Data Simulation for 2 stages
}
\description{
It gives simulated data.
The outcomes are generated based on a pattern mixture model using a latent variable with 4 categories.  For each category, X has a multivariate normal distribution and each category is assigned a vector of optimal treatments V.
Specifically, we generate centroids of the classes from a multivariate normal distribution mean 0 and std 5. We add the centroids to the first pinfo dimension of the vectors of feature variables X simulated from multivariate normal distribution with \code{pinfo}+\code{pnoise} dimensions. 

Then we assign optimal treatments \eqn{y=(A_1^*, A_2^*)} from (1,1),(1,-1),(-1,-1),(-1,1) to each latent category. The observed treatment assignments \eqn{A=(A_1,A_2)} are  completely random  to be 1 and -1 with probability 0.5, and the outcomes are generated as: R_1=0, R_2= A'y+N(0,1).   Therefore the mean optimal outcome $R_1+R_2$ is $2$ when the treatment assignments are equal to the optimal treatment for a given a latent group in both stages. 
}
\usage{
make_2classification(n_cluster, pinfo, pnoise, n_sample, centroids = 0)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
 \item{n_cluster}{
number of cluster.
}
  \item{pinfo}{
number of infomative variables, dimentions of the centroids related to the latent class of the sample.
}
  \item{pnoise}{
number of noise variable.
}
  \item{n_sample}{
number of sample to generate
}
  \item{centroids}{
For a training set, donot assign centroids, this value is generated randomly by the function. For a testing set, one want to assign the same set of centroids as the training set. it is a matrix of dimention n_cluster by p. 
}
}

\value{
\item{X}{Feature variable matrix, it is a n_sample by pinfo+pnoise matrix generated from multivariate normal distribution. Where the noises are with mean 0 and std 1. The informative variables are shifted to centered at the randomly generate centroids. }
\item{A}{List of 2, \code{A[[1]]} and \code{A[[2]]} are the treatment assignment vectors for stage 1 and 2.}
\item{y}{List of 2, \code{y[[1]]} and \code{y[[2]]} are the true optimal treatment for stage 1 and 2}
\item{R}{List of 2, \code{R[[1]]} is vector of \code{n_sample} zeros, \code{R[[2]]} is the final outcomes vector}
\item{centroids}{centers of each cluster, are from pinfo dimentional multivariate normal distribution. }
}



\seealso{
\code{\link{make_classification}}
}
\examples{
n_cluster=5
pinfo=10
pnoise=10
n_sample=50
example2=make_2classification(n_cluster,pinfo,pnoise,n_sample)
pi=list()
pi[[2]]=pi[[1]]=rep(1,n_sample)
set.seed(3)
modelO=Olearning(example2$X,example2$A,example2$R,n_sample,2,pi)
modelP=Plearning(example2$X,example2$A,example2$R,n_sample,2,pi)
modelQ=Qlearning(example2$X,example2$A,example2$R,2)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.

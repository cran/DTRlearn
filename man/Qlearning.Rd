\name{Qlearning}
\alias{Qlearning}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Q-learning 
}
\description{
This funciton impletment multiple stage Q-learning.
}
\usage{
Qlearning(X,AA,RR,K,pentype="lasso",m=4)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
 \item{X}{is either a matrix shared among all stages; or a list of feature matrices, where feature matrices from different stages can have different dimensions.}
  \item{AA}{a list of K, each element \code{A[[i]]} is the vector of treatment assignments  for stage i.}
  \item{RR}{a list of K, each element \code{R[[i]]} is the outcome vector for stage i.}
  \item{K}{number of stages}
  \item{pentype}{the type of regression implemented in Q-learning, the default is 'lasso', another choice is 'LSE'}
  \item{m}{number of folds of cross validation for in \code{\link[glmnet]{cv.glmnet}} in regression model when \code{'lasso'} is selected}
%%     ~~Describe \code{pentype} here~~
}


\value{
it returns a list of K models with class \code{'qlearn'}.

}
\references{
Watkins, C. J. C. H. (1989). \emph{Learning from delayed rewards (Doctoral dissertation,} University of Cambridge).\cr

Murphy, S. A., Oslin, D. W., Rush, A. J., & Zhu, J. (2007). \emph{Methodological challenges in constructing effective treatment sequences for chronic psychiatric disorders.} Neuropsychopharmacology, 32(2), 257-262.\cr

Zhao, Y., Kosorok, M. R., & Zeng, D. (2009). \emph{Reinforcement learning design for cancer clinical trials.} Statistics in medicine, 28(26), 3294.\cr


}
\author{
Ying Liu
}
%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
\code{\link{Qlearning_Single}}
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
n_cluster=10
pinfo=10
pnoise=20
example2=make_2classification(n_cluster,pinfo,pnoise,200)
test=make_2classification(n_cluster,pinfo,pnoise,200,example2$centroids)
pi=list()
pi[[2]]=pi[[1]]=rep(1,200)
modelQ=Qlearning(example2$X,example2$A,example2$R,2)
}
% Add one or more standard keywords, see file 'KEYWORDS' in the
% R documentation directory.
\keyword{models}


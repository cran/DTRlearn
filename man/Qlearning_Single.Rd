\name{Qlearning_Single}
\alias{Qlearning_Single}
%- Also NEED an '\alias' for EACH other topic documented here.
\title{
Single Stage Q learning
}
\description{
It implements single stage Q-learning. Q-learning estimates optimal treatment option by fitting a regression model with treatment, feature variable and their interactions. The optimal treatment option is the the sign of the interaction term which maximize the predicted value from the regression model.
}
\usage{
Qlearning_Single(H, A, R, pentype = "lasso",m=4)
}
%- maybe also 'usage' for other objects documented here.
\arguments{
  \item{H}{a n by p matrix, n is the sample size, p is the number of feature variables.}
  \item{A}{a vector of treatment assignments coded 1 and -1.}
  \item{R}{a vector of outcomes, larger is more desirable.}
 \item{pentype}{The type of regression in Q-learning, 'lasso' is the default lasso regression; 'LSE' is the ordinary least square.}
 \item{m}{needed when pentype='lasso', the number of folds in cross validation for picking tuning parameter for lasso in \code{\link[glmnet]{cv.glmnet}}}
}

\value{
It returns a class of \code{'qlearn'}, that consists of two components:
\item{co}{the coefficient of the regression model, it is a 2p+2 vector. The design matrix is X=(Intercept, H, A, diag(A)*H)}

\item{Q}{The predicted optimal outcome from the regression model}
}
\references{
Watkins, C. J. C. H. (1989). \emph{Learning from delayed rewards (Doctoral dissertation,} University of Cambridge).\cr

Murphy, S. A., Oslin, D. W., Rush, A. J., & Zhu, J. (2007). \emph{Methodological challenges in constructing effective treatment sequences for chronic psychiatric disorders.} Neuropsychopharmacology, 32(2), 257-262.\cr

Zhao, Y., Kosorok, M. R., & Zeng, D. (2009). \emph{Reinforcement learning design for cancer clinical trials.} Statistics in medicine, 28(26), 3294.\cr
}

\author{
Ying Liu  yl2802@cumc.columbia.edu
\url{http://www.columbia.edu/~yl2802/}
}

\seealso{\code{\link{Qlearning}}}
\examples{
n=200
A=2*rbinom(n,1,0.5)-1
p=20
mu=numeric(p)
Sigma=diag(p)
X=mvrnorm(n,mu,Sigma)
R=X[,1:3]\%*\%c(1,1,-2)+X[,3:5]\%*\%c(1,1,-2)*A+rnorm(n)
modelQ=Qlearning_Single(X,A,R)
}
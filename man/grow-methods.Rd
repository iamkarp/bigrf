\name{grow-methods}
\docType{methods}
\alias{grow}
\alias{grow-methods}
\alias{grow,bigcforest-method}
\title{Methods for Function \code{grow} in Package \pkg{bigrf}}
\description{
 Grow more trees in a random forest.
}
\usage{
  \S4method{grow}{bigcforest}(forest, x, y=NULL, ntrees=500L, reuse.cache=FALSE, trace=FALSE)
}
\arguments{
  \item{forest}{
    A random forest of class \code{"\linkS4class{bigcforest}"}.
  }
  \item{x}{
    A \code{\link{big.matrix}}, \code{matrix} or \code{data.frame} of predictor variables. The data must not have changed, otherwise unexpected modelling results may occur. If a \code{matrix} or \code{data.frame} is specified, it will be converted into a \code{big.matrix} for computation.
  }
  \item{y}{
    An integer or factor vector of response variables that was used in growing the forest. Must be specified for supervised learning. The data must not have changed, otherwise unexpected modelling results may occur.
  }
  \item{ntrees}{
    The number of additional trees to grow in the forest.
  }
  \item{reuse.cache}{
    \code{TRUE} to reuse disk caches from previous tree-growing runs, which may significantly reduce initialization time for large data sets. Currently, only the \code{big.matrix}'s \code{asave}, \code{b} and \code{x} (for unsupervised learning only) are reused. If \code{TRUE}, user must ensure that the files \file{asave}, \file{asave.desc}, \file{b}, \file{b.desc}, \file{x} (unspervised learning) and \file{x.desc} (unsupervised learning) in \code{forest@cachepath} have not been modified or deleted since the previous run.
  }
  \item{trace}{
    \code{TRUE} to turn on verbose output, \code{FALSE} otherwise. Due to the way \code{\link{\%dopar\%}} handles the output of the tree-building iterations, you may not see the verbose output in some GUIs like RStudio. For best results, run R from the command line in order to see all the verbose output.
  }
}
\details{
%%  ~~ If necessary, more details than the description above ~~
}
\value{
  The object supplied as the \code{forest} argument, with additional trees grown.
}
\section{Methods}{
  \describe{
    \item{\code{signature(forest = "bigcforest")}}{
      Grow more trees in the given classification forest.
    }
  }
}
\references{
%% ~put references to the literature/web site here ~
}
\author{
%%  ~~who you are~~
}
\note{
%%  ~~further notes~~
}

%% ~Make other sections like Warning with \section{Warning }{....} ~

\seealso{
%% ~~objects to See Also as \code{\link{help}}, ~~~
}
\examples{
# Classify cars in the Cars93 data set by type (Compact, Large,
# Midsize, Small, Sporty, or Van).

# Load data.
data(Cars93, package="MASS")
x <- Cars93
y <- Cars93$Type

# Select variables with which to train model.
vars <- c(4:22)

# Run model, build 50 trees.
forest <- bigrfc(x, y, ntree=50L, varselect=vars)

# Grow 30 more trees.
forest <- grow(forest, x, y, ntree=30L)
}
\keyword{methods}
\keyword{models}
\keyword{tree}
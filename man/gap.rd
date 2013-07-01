\name{gap}
\alias{gap}
\title{The gap statistic}
\description{
 Use the Gap statistic to determine the best number of clusters in a data set 
}
\usage{
gap(X,Kmax=10,B=100,ref.gen="PC",cl.lab=NULL,...)

}
\arguments{
  \item{X}{a numeric data matrix whose rows are to be clustered using a specified clustering algorithm (default is hierarchical clustering with average linkage and Euclidean distance, see below for other options)}
  \item{Kmax}{the maximum number of clusters to be evaluated.}
  \item{B}{the number of reference data sets to be generated in the calculation of the gap statistic.}
  \item{ref.gen}{a text string specifying how the reference data should be generated. Options are "PC" (reference data are generated uniformly over a box aligned with the principal components of the data) and "range" (reference data are generated uniformly over the range of the data). See the referenced paper for more details.}
  \item{cl.lab}{optional list of length \code{Kmax} giving vectors of cluster labels for the rows in \code{X} when partitioned into \code{1,..,Kmax} clusters.}
  \item{\dots}{other optional parameters including:   
  	\describe{
      \item{\code{cl.method}:}{the desired clustering method. Options currently include "hclust" (default) and "kmeans".}
      \item{\code{linkage}:}{the desired linkage to be applied if \code{cl.method="hclust"}. Default is "average", see the parameter \code{method} in \code{\link{hclust}} for other options.}
      \item{\code{dist.method}:}{the desired distance measure to be applied if \code{cl.method="hclust"}. Default is "euclidean". Other options include those supported by \code{\link{dist}} (under \code{method}), "sq.euclidean" (squared Euclidean distance) and "cor" (1 minus correlation distance).} 
      \item{\code{cor.method}:}{the correlation measure to be used if \code{dist.method="cor"}. Default is "pearson", see the parameter \code{method} in \code{\link{cor}} for other options.}
      \item{\code{nstart}:}{the number of initial center sets to be applied if \code{cl.method="kmeans"}. Default is 10. See \code{\link{kmeans}} for details on this.}
    }
  }
}

\details{The rows in \code{X} are partitioned into k = 1,..,Kmax clusters, and the Gap statistic is calculated for each partition. The best partition, and hence the best number of clusters, is selected using the Gap criterion (see the reference below).   
}

\value{
  \item{hatK}{the best number of clusters according to the Gap criterion.}
  \item{lab.hatK}{a vector of same length as the number of rows in \code{X} assigning a group label to each case (row) in \code{X} based on the best partition as evaluated by Gap.}
  \item{gap}{a vector of length \code{Kmax} giving the Gap statistic for each evaluated partition.}
  \item{sk}{a vector of length \code{Kmax} giving the standard errors of the Gap statistics.}
  \item{W}{a vector of length \code{Kmax} giving the total within-cluster dispersion for each evaluated partition.} 
}


                                                              
\references{Tibshirani et al., "Estimating the number of clusters in a data set via the gap statistic", Journal of the Royal Statistical Society B, 63, 2001}

\author{Gro Nilsen}


\examples{
#Load a simulated data set with 5 clusters
data(exData1)
X = exData1$X
groups = exData1$groups

#Run gap (limit the number of reference data sets to decrease computing time):
res <- gap(X, B=10)

#Compare predicted groups to true groups:
cbind(res$lab.hatK, groups)

#Plot the total within-cluster dispersion and the gap-curve +/- standard errors:
par(mfrow=c(2,1))
plot(1:length(res$W), res$W, type="b")
plot(1:length(res$gap), res$gap, type="b", ylim=c(min(res$gap-res$sk),
max(res$gap+res$sk)), pch=19)
points(1:length(res$sk), res$gap+res$sk, cex=0.7, pch=8)
points(1:length(res$sk), res$gap-res$sk, cex=0.7, pch=8)
segments(x0=1:length(res$sk), y0=res$gap-res$sk, y1=res$gap+res$sk)

}

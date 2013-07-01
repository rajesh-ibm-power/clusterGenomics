\name{part}
\alias{part}
\title{Partitioning Algorithm based on Recursive Thresholding}
\description{
The PART method estimates the number of clusters in a data set. It is based on recursive application of the Gap statistic and is able to discover both top-level clusters as well as subclusters nested within the main clusters. 
 }
\usage{
part(X,Kmax=10,minSize=8,minDist=NULL,cl.lab=NULL,...)
}
\arguments{
  \item{X}{a numeric data matrix whose rows are to be clustered using a specified clustering algorithm (default is hierarchical clustering with average linkage and Euclidean distance, see below for other options).}
  \item{Kmax}{the maximum number of clusters to be evaluated in the first (global) run.}
  \item{minSize}{the minimum number of objects required in each cluster.}
  \item{minDist}{optional stopping threshold indicating the minimum distance required between two tentative clusters considered for a tentative split. If unspecified the minimum distance is determined by the value of \code{q}, see below.}
  \item{cl.lab}{optional list of length \code{Kmax} giving vectors of cluster labels for the rows in \code{X} when partitioned into \code{1,..,Kmax} clusters.}
  \item{\dots}{other optional parameters. These include the parameters \code{B} (default 100) and \code{ref.gen} (default "PC") to be passed on to \code{\link{gap}}, as well as:   
  	\describe{
  	  \item{\code{q}:}{the fraction of dendrogram heights (from the top) used to determine the stopping threshold; only applied if \code{minDist} is unspecified. Default is 0.25, set \code{q=1} if no stopping threshold should be applied.}
      \item{\code{Kmax.rec}:}{the maximum number of clusters to consider in each recursive run. Default is 5.}
      \item{\code{cl.method}:}{the desired clustering method. Options currently include "hclust" (default) and "kmeans".}
      \item{\code{linkage}:}{the desired linkage to be applied if \code{cl.method="hclust"}. Default is "average", see the parameter \code{method} in \code{\link{hclust}} for other options.}
      \item{\code{dist.method}:}{the desired distance measure to be applied if \code{cl.method="hclust"}. Default is "euclidean". Other options include those supported by \code{\link{dist}} (under \code{method}), "sq.euclidean" (squared Euclidean distance) and "cor" (1 minus correlation distance).} 
      \item{\code{cor.method}:}{the correlation measure to be used if \code{dist.method="cor"}. Default is "pearson", see the parameter \code{method} in \code{\link{cor}} for other options.}
      \item{\code{nstart}:}{the number of initial center sets to be applied if \code{cl.method="kmeans"}. Default is 10. See \code{\link{kmeans}} for details on this.}
    }
  }
}

\details{PART applies the Gap statistic (Tibshirani et al., 2001) to obtain a global estimate of the number of clusters. If more than one cluster is found, the Gap statistic is re-optimized on each subset of cases corresponding to a cluster. If only one cluster is found, a tentative binary split is made and the objective function is re-optimized on the two tentative clusters. The procedure is repeated recursively until a stopping threshold is reached or the subset under evaluation has less than \code{2*minSize} cases. Significant clusters (those discovered by Gap) are returned; a tentative cluster is only returned if significant sub-clusters were found solely in the other branch of the tentative split. See Nilsen et al. (2013, preprint) for more details.
}

\value{
  \item{hatK}{the best number of clusters according PART.}
  \item{lab.hatK}{a vector of same length as the number of rows in \code{X} assigning a group label to each case (row) in \code{X} based on the best partition as evaluated by PART.}
  \item{outliers}{a vector indicating which objects are classified as outliers by PART. If no objects are classified as outliers it returns the value \code{NULL}.}

}

\seealso{\code{\link{gap}}, \code{\link{plotHeatmap}}}
                                                              
\references{Nilsen et al., "Identifying clusters in genomics data by recursive partitioning", 2013 (in review)} 

\author{Gro Nilsen}


\examples{

## Example 1 ##
#Load a simulated data set with 5 clusters
data(exData1)
X = exData1$X
groups1 = exData1$groups

#Run PART (limit the number of reference data sets to decrease computing time):
res <- part(X, B=10)

#Compare predicted groups to true groups in the data set:
cbind(res$lab.hatK, groups1)

## Visualize results ##
#Transpose the data matrix such that samples are shown in columns:
tX <- t(X) 
#Cluster rows and columns using the same clustering method as applied in PART:
rowclust = hclust(dist(tX,method="euclidean"),method="average")
colclust = hclust(dist(t(tX), method="euclidean"),method="average")
#Order data matrix according to order in clustering og plot heatmap:
X2 = tX[rowclust$order, colclust$order]
par(mar=c(0,0,0,0))
plotHeatmap(X2)
#Add column-dendrogram with leaves colored according to the clusters found by PART: 
plotTreeCol(clust=colclust,groups=res$lab.hatK[colclust$order])
#Add color-bar to indicate the true clusters in the data set:
plotColorbarCol(groups=groups1[colclust$order]) 


## Example 2 ##
# Load a simulated data set with 4 clusters:
data(exData2)
Y = exData2$Y
groups2 = exData2$groups

# Run PART with default clustering method:
res2 = part(Y, B=10)

# Compare predicted groups to true groups in the data set:
cbind(res2$lab.hatK, groups2)

# Visualize results
# Cluster rows and columns using the same clustering method as applied in PART:
rowclust = hclust(dist(Y,method="euclidean"),method="average")
colclust = hclust(dist(t(Y), method="euclidean"),method="average")
# Order data matrix according to order in clustering og plot heatmap:
Y2 = Y[rowclust$order, colclust$order]
par(mar=c(0,0,0,0))
heat = plotHeatmap(Y2)
# Add row-dendrogram with leaves colored according to the clusters found by PART: 
plotTreeRow(clust=rowclust,groups=res2$lab.hatK[rowclust$order])
# Add column-dendrogram:
plotTreeCol(clust=colclust)
#Add color-bar to show the true group memberships:
plotColorbarRow(groups=groups2[rowclust$order]) 


## Some examples showing how to change clustering method and distance measure ##

#Run PART with complete linkage:
res3 <- part(Y, B=10, linkage="complete")

#Run PART with 1 - Pearson correlation distance
res4 <- part(Y, B=10, dist.method="cor")

#Run PART with 1 minus Spearman correlation distance:
res5 <- part(Y, B=10, dist.method="cor", cor.method="spearman")
 

}

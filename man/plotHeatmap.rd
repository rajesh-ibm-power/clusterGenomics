\name{plotHeatmap}
\alias{plotHeatmap}
\title{Plot a heatmap}
\description{Displays a matrix as a heatmap, i.e. as a grid of colored rectangles with colors corresponding to the values in the matrix.}
\usage{
plotHeatmap(X, margin, fast=FALSE, colorscale="green-black-red", 
              pch=".", cex=10)
}
\arguments{
  \item{X}{a numerical matrix.}
  \item{margin}{optional vector of length 2 specifying the margins around the heatmap. The first component specifies the width of the inner margin (default value is 0.05) and the second component specifies the width of the outer margin (default value is 0.4). The inner margin surrounds the heatmap on all sides, while the outer margin is only present on the left side and top side of the heatmap. See details below for explanation on how to use this parameter.}
  \item{fast}{logical value indicating whether to use a fast method or not to plot the heatmap. The fast method plots the entire heatmap with a single call to \code{plot.xy} and renders individual matrix values as points with shape and size determined by the parameters \code{pch} and \code{cex} (see below). The default method plots the heatmap as a sequence of polygons and while more visually pleasing may be slow when the matrix is large.}
  \item{colorscale}{color scale used to represent the numerical values in \code{X}. The name of the color scale consists of three colors separated by hyphens; these represent the left, middle and right range of the numerical scale. The numerical scale is always symmetric around zero, and the three colors represent the values \code{-max(abs(X))}, \code{0} and \code{max(abs(X))}, respectively. Other options are "red-black-green", "green-white-red", "red-white-green" and "blue-white-red".}
  \item{pch}{plot character used to display a rectangle in the heatmap (only used if \code{fast=TRUE}).}
  \item{cex}{plot character size (only used if \code{fast=TRUE}).}
}

\details{Displays a numerical matrix as an pseudo-color heatmap where rows and columns in the heatmap correspond to rows and columns in the matrix, respectively. The lower left corner of the heatmap corresponds to the first element \code{X[1,1]} of the matrix. The parameter \code{margin} is used to specify appropriate margins around the heatmap when this is to be combined with color bars and/or cluster dendrograms. Color bars (produced with the functions \code{\link{plotColorbarRow}} and \code{\link{plotColorbarCol}}) are plotted in the inner margin area, while cluster dendrograms (produced with the functions \code{\link{plotTreeRow}} and \code{\link{plotTreeCol}}) are plotted in the outer margin area. Both margins should be specified as a number between 0 and 1, and to leave no margins around the heatmap let \code{margin=c(0,0)}.
}

\value{A list with three elements \code{colorscale}, \code{value.range} and \code{color.range}. The list is mainly intended to be used as input for the function \code{plotColorRange}.}

\seealso{\code{\link{plotColorbarCol}}, \code{\link{plotColorbarRow}}, \code{\link{plotTreeCol}}, \code{\link{plotTreeRow}}, \code{\link{plotColorRange}}.}
                                                              
\references{Nilsen et al., "Identifying clusters in genomics data by recursive partitioning", 2013 (in review)} 

\author{Ole Christian Lingjaerde}


\examples{
## Create a data matrix
A = cbind(matrix(rnorm(70*20),nrow=70), matrix(3+rnorm(70*20),nrow=70))
B = cbind(-1 + matrix(rnorm(40*30),nrow=40), matrix(1+rnorm(40*10),nrow=40))
X = rbind(A,B)[sample(110), sample(40)]

## Cluster rows and columns
rowclust = hclust(dist(X, method="euclidean"), method="complete")
colclust = hclust(dist(t(X), method="euclidean"), method="average")

## Plot data in original order and in clustered order
par(mfrow=c(1,2))
plotHeatmap(X, c(0,0))
plotHeatmap(X[rowclust$order, colclust$order])
plotTreeRow(rowclust)
plotTreeCol(colclust)

## Identify groups with PART and color the leaves of the dendrogram accordingly
rowgroups = part(X, B=10, linkage="complete")$lab.hatK
colgroups = part(t(X), B=10)$lab.hatK
plotHeatmap(X[rowclust$order, colclust$order])
plotTreeRow(rowclust, rowgroups[rowclust$order])
plotTreeCol(colclust, colgroups[colclust$order])

}

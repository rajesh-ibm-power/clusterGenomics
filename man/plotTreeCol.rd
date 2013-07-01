\name{plotTreeCol}
\alias{plotTreeCol}
\title{Add a column dendrogram to a heatmap.}
\description{Plots a column dendrogram above a heatmap created with \code{plotHeatmap}.}
\usage{
plotTreeCol(clust, groups, margin)
}
\arguments{
  \item{clust}{output from call to \code{hclust} to cluster the columns in the heatmap.}
  \item{groups}{optional vector of the same length as the number of columns in the heatmap, and with values specifying the colors of the leaves in the dendrogram.}
  \item{margin}{optional vector of length 2 specifying the margins around the heatmap. The first component specifies the width of the inner margin (default value is 0.05) and the second component specifies the width of the outer margin (default value is 0.4). The inner margin surrounds the heatmap on all sides, while the outer margin is only present on the left side and top side of the heatmap. See details in help file for \code{plotHeatmap} for explanation on how to use this parameter.}
}

\details{This method is designed to be used in conjunction with the method \code{plotHeatmap}. The argument value \code{margin} should match the one used in the call to \code{\link{plotHeatmap}}; for details on how to use this argument, see the help file for that method. The default values are the same as in \code{plotHeatmap}, hence if no \code{margin} is specified in the call to \code{plotHeatmap}, then no \code{margin} needs to be specified in the call to \code{plotTreeCol} either.
}

\seealso{\code{\link{plotHeatmap}}, \code{\link{plotColorbarCol}}, \code{\link{plotColorbarRow}}, \code{\link{plotTreeRow}}, \code{\link{plotColorRange}}}
                                                              
\references{Nilsen et al., "Identifying clusters in genomics data by recursive partitioning", 2013 (in review)} 

\author{Ole Christian Lingjaerde}


\examples{
## See example in the help file for plotHeatmap.

}

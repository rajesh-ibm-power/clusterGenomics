\name{plotColorbarCol}
\alias{plotColorbarCol}
\title{Add a colorbar above a heatmap.}
\description{Plots a color bar above a heatmap created with \code{plotHeatmap} to annotate the columns.}
\usage{
plotColorbarCol(groups, margin)
}
\arguments{
  \item{groups}{optional vector of the same length as the number of columns in the heatmap, and with values specifying the colors of the leaves in the dendrogram.}
  \item{margin}{optional vector of length 2 specifying the margins around the heatmap. The first component specifies the width of the inner margin (default value is 0.05) and the second component specifies the width of the outer margin (default value is 0.4). The inner margin surrounds the heatmap on all sides, while the outer margin is only present on the left side and top side of the heatmap. See details in help file for \code{plotHeatmap} for explanation on how to use this parameter.}
}
\details{This method is designed to be used in conjunction with the method \code{\link{plotHeatmap}}. The argument value \code{margin} should match the one used in the call to \code{plotHeatmap}; for details on how to use this argument, see the help file for that method. The default values are the same as in \code{plotHeatmap}, hence if no \code{margin} is specified in the call to \code{plotHeatmap}, then no \code{margin} need to be specified in the call to \code{plotColorbarCol} either.
}

\seealso{\code{\link{plotHeatmap}}, \code{\link{plotColorbarRow}}}
                                                              
\references{Nilsen et al., "Identifying clusters in genomics data by recursive partitioning", 2013 (in review)} 

\author{Ole Christian Lingjaerde}


\examples{
## Create a dummy data set with 50 rows and 100 columns
X = matrix(rnorm(50*100), 50)
colgroups = sample(1:3, 100, replace=TRUE)

## Plot a heatmap and then add a color bar on the left side
margin = c(0.1, 0)
plotHeatmap(X, margin)
plotColorbarCol(colgroups, margin)
}

\name{plotColorRange}
\alias{plotColorRange}
\title{Plot color scale.}
\description{Plots the color scale used by the method \code{plotHeatmap}.}
\usage{
plotColorRange(colrange)
}
\arguments{
  \item{colrange}{output from call to \code{plotHeatmap}.}
}

\details{This method is designed to be used in conjunction with \code{\link{plotHeatmap}} and plots the color range used in a call to the latter method. It does not create a new graphics device if one is already open, so it is typically preceded by a call to \code{windows()} or a similar method.
}

\seealso{\code{plotHeatmap}}
                                                              
\references{Nilsen et al., "Identifying clusters in genomics data by recursive partitioning", 2013 (in review)} 

\author{Ole Christian Lingjaerde}


\examples{
## Create a dummy data set with 50 rows and 100 columns
X = matrix(rnorm(50*100), 50)

## Create a screen with 3 x 3 virtual panels and use the last two rows for the 
## heatmap
layout(matrix(c(2,3,3,1,1,1,1,1,1),3,3,byrow=TRUE))
par(mar=c(2,2,2,2))

## Plot heatmap and then the color range above the heatmap
crange = plotHeatmap(X, c(0,0))  # c(0,0) specifies no margin around heatmap
plotColorRange(crange)
}

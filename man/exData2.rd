\name{exData2}
\alias{exData2}
\docType{data}
\title{
A simulated data set with 4 true clusters
}
\description{
A 100-dimensional simulated data set which has 4 true clusters (a data set generated from simulation scenario E in the referenced paper).
}
\usage{
data(exData2)
}
\format{A list with components \code{Y} and \code{groups} where the former is a 100 x 100 data matrix and the latter is a vector of length 100 giving the groups label for each case (row) in \code{Y}. 
} 
\source{Nilsen et al., "Identifying clusters in genomics data by recursive partitioning", 2013 (in review)
}

\examples{
#Get data
data(exData2)
}

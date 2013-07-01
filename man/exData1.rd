\name{exData1}
\alias{exData1}
\docType{data}
\title{
A simulated data set with 5 true clusters
}
\description{
A two-dimensional simulated data set which has 5 true clusters (the second data set in Figure 1 in the referenced paper).
}
\usage{
data(exData1)
}
\format{A list with components \code{X} and \code{groups} where the former is a 65 x 2 data matrix and the latter is a vector of length 65 giving the groups label for each case (row) in \code{X}. 
} 
\source{Nilsen et al., "Identifying clusters in genomics data by recursive partitioning", 2013 (in review)
}

\examples{
#Get data
data(exData1)
}

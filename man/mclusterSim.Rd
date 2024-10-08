% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/mclusterSim.R
\name{mclusterSim}
\alias{mclusterSim}
\title{mclusterSim}
\usage{
mclusterSim(
  clusters,
  ont = "HDO",
  organism = "hsa",
  measure = "Wang",
  combine = "BMA"
)
}
\arguments{
\item{clusters}{A list of gene clusters}

\item{ont}{one of "HDO", "HPO" and "MPO"}

\item{organism}{organism}

\item{measure}{one of "Wang", "Resnik", "Rel", "Jiang", and "Lin".}

\item{combine}{One of "max", "avg", "rcmax", "BMA" methods, for combining semantic similarity scores of multiple DO terms associated with gene/protein.}
}
\value{
similarity matrix
}
\description{
Pairwise semantic similarity for a list of gene clusters
}
\examples{
\dontrun{
cluster1 <- c("835", "5261","241")
cluster2 <- c("578","582")
cluster3 <- c("307", "308", "317")
clusters <- list(a=cluster1, b=cluster2, c=cluster3)
mclusterSim(clusters, measure="Wang")
}
}
\author{
Guangchuang Yu
}

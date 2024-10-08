% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/geneSim.R
\name{geneSim}
\alias{geneSim}
\title{geneSim}
\usage{
geneSim(
  geneID1,
  geneID2 = NULL,
  ont = "HDO",
  organism = "hsa",
  measure = "Wang",
  combine = "BMA"
)
}
\arguments{
\item{geneID1}{entrez gene vector}

\item{geneID2}{entrez gene vector}

\item{ont}{one of "HDO" and "MPO"}

\item{organism}{one of "hsa" and "mmu"}

\item{measure}{one of "Wang", "Resnik", "Rel", "Jiang", and "Lin".}

\item{combine}{One of "max", "avg", "rcmax", "BMA" methods, for combining semantic similarity scores of multiple DO terms associated with gene/protein.}
}
\value{
score matrix
}
\description{
measuring similarities bewteen two gene vectors.
}
\details{
provide two entrez gene vectors, this function will calculate their similarity.
}
\examples{
g <- c("835", "5261","241", "994")
geneSim(g)
}
\author{
Guangchuang Yu \url{https://yulab-smu.top}
}

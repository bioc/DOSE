% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/gseAnalyzer.R
\name{gseDO}
\alias{gseDO}
\title{DO Gene Set Enrichment Analysis}
\usage{
gseDO(
  geneList,
  ont = "HDO",
  organism = "hsa",
  exponent = 1,
  minGSSize = 10,
  maxGSSize = 500,
  pvalueCutoff = 0.05,
  pAdjustMethod = "BH",
  verbose = TRUE,
  seed = FALSE,
  by = "fgsea",
  ...
)
}
\arguments{
\item{geneList}{order ranked geneList}

\item{ont}{one of "HDO", "HPO" or "MPO"}

\item{organism}{one of "hsa" and "mmu"}

\item{exponent}{weight of each step}

\item{minGSSize}{minimal size of each geneSet for analyzing}

\item{maxGSSize}{maximal size of each geneSet for analyzing}

\item{pvalueCutoff}{pvalue Cutoff}

\item{pAdjustMethod}{p value adjustment method}

\item{verbose}{print message or not}

\item{seed}{logical}

\item{by}{one of 'fgsea' or 'DOSE'}

\item{...}{other parameter}
}
\value{
gseaResult object
}
\description{
perform gsea analysis
}
\author{
Yu Guangchuang
}
\keyword{manip}

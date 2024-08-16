gseDisease <- function(geneList,
                       organism = "hsa",
                       exponent=1,
                       minGSSize = 10,
                       maxGSSize = 500,
                       eps = 1e-10,
                       pvalueCutoff=0.05,
                       pAdjustMethod="BH",
                       verbose=TRUE,
                       seed=FALSE,
                       by = 'fgsea',
                       ontology,
                       ...) {

    annoData <- get_anno_data(ontology)

    res <- GSEA_internal(geneList          = geneList,
                         exponent          = exponent,
                         minGSSize         = minGSSize,
                         maxGSSize         = maxGSSize,
                         eps               = eps,
                         pvalueCutoff      = pvalueCutoff,
                         pAdjustMethod     = pAdjustMethod,
                         verbose           = verbose,
                         seed              = seed,
                         USER_DATA         = annoData,
                         by                = by,
                         ...)

    if (is.null(res))
        return(res)

    if (organism == "hsa") {
        res@organism <- "Homo sapiens"
    } else {
        res@organism <- "Mus musculus"
    }
    res@setType <- ontology
    res@keytype <- "ENTREZID"
    return(res)
}

##' DO Gene Set Enrichment Analysis
##'
##'
##' perform gsea analysis
##' @param geneList order ranked geneList
##' @param ont one of "HDO", "HPO" or "MPO"
##' @param organism one of "hsa" and "mm"
##' @param exponent weight of each step
##' @param minGSSize minimal size of each geneSet for analyzing
##' @param maxGSSize maximal size of each geneSet for analyzing
##' @param pvalueCutoff pvalue Cutoff
##' @param pAdjustMethod p value adjustment method
##' @param verbose print message or not
##' @param seed logical
##' @param by one of 'fgsea' or 'DOSE'
##' @param ... other parameter
##' @return gseaResult object
##' @export
##' @author Yu Guangchuang
##' @keywords manip
gseDO <- function(geneList,
                  ont = "HDO",
                  organism = "hsa",
                  exponent=1,
                  minGSSize = 10,
                  maxGSSize = 500,
                  pvalueCutoff=0.05,
                  pAdjustMethod="BH",
                  verbose=TRUE,
                  seed=FALSE,
                  by = 'fgsea', 
                  ...) {
     

    gseDisease(geneList          = geneList,
               exponent          = exponent,
               minGSSize         = minGSSize,
               maxGSSize         = maxGSSize,
               pvalueCutoff      = pvalueCutoff,
               pAdjustMethod     = pAdjustMethod,
               verbose           = verbose,
               seed              = seed,
               by                = by,
               ontology          = ont, 
               ...)

}

##' NCG Gene Set Enrichment Analysis
##'
##'
##' perform gsea analysis
##' @inheritParams gseDO
##' @return gseaResult object
##' @export
##' @author Yu Guangchuang
##' @keywords manip
gseNCG <- function(geneList,
                   exponent=1,
                   minGSSize = 10,
                   maxGSSize = 500,
                   pvalueCutoff=0.05,
                   pAdjustMethod="BH",
                   verbose=TRUE,
                   seed=FALSE,
                   by = 'fgsea',
                   ...) {
                  

    gseDisease(geneList          = geneList,
               exponent          = exponent,
               minGSSize         = minGSSize,
               maxGSSize         = maxGSSize,
               pvalueCutoff      = pvalueCutoff,
               pAdjustMethod     = pAdjustMethod,
               verbose           = verbose,
               seed              = seed,
               by                = by,
               ontology          = "NCG", 
               ...)
    


}

##' DisGeNET Gene Set Enrichment Analysis
##'
##'
##' perform gsea analysis
##' @inheritParams gseDO
##' @return gseaResult object
##' @export
##' @author Yu Guangchuang
##' @keywords manip
gseDGN <- function(geneList,
                   exponent=1,
                   minGSSize = 10,
                   maxGSSize = 500,
                   pvalueCutoff=0.05,
                   pAdjustMethod="BH",
                   verbose=TRUE,
                   seed=FALSE,
                   by = 'fgsea',
                   ...) {
                   

    gseDisease(geneList          = geneList,
               exponent          = exponent,
               minGSSize         = minGSSize,
               maxGSSize         = maxGSSize,
               pvalueCutoff      = pvalueCutoff,
               pAdjustMethod     = pAdjustMethod,
               verbose           = verbose,
               seed              = seed,
               by                = by,
               ontology          = "DisGeNET",
               ...)
}

enrichDisease <- function(gene,
                          organism = "hsa",
                          pvalueCutoff = 0.05,
                          pAdjustMethod = "BH",
                          universe,
                          minGSSize = 10,
                          maxGSSize = 500,
                          qvalueCutoff = 0.2,
                          readable = FALSE,
                          ontology){

    organism <- match.arg(organism, c("hsa", "mm"))

    annoData <- get_anno_data(ontology)
    
    res <- enricher_internal(gene = gene,
                             pvalueCutoff = pvalueCutoff,
                             pAdjustMethod = pAdjustMethod,
                             universe = universe,
                             minGSSize = minGSSize,
                             maxGSSize = maxGSSize,
                             qvalueCutoff = qvalueCutoff,
                             USER_DATA = annoData)

    if (is.null(res))
        return(res)
    if (organism == "hsa") {
        res@organism <- "Homo sapiens"
    } else {
        res@organism <- "Mus musculus"
    }
    
    res@keytype <- "ENTREZID"
    res@ontology <- ontology

    if(readable) {
        if (organism == "hsa") {
            res <- setReadable(res, 'org.Hs.eg.db')
        } else {
            res <- setReadable(res, 'org.Mm.eg.db')
        }
    }
    return(res)
}


get_anno_data <- function(ontology) {
    if (ontology == "NCG") {
        annoData <- get_NCG_data()
    } else if (ontology == "DisGeNET") {
        annoData <- get_DGN_data()
    } else if (ontology == "snpDisGeNET") {
        annoData <- get_VDGN_data()
    } else if (ontology %in% c("HDO", "MPO", "HPO")) {
        annoData <- get_dose_data(ontology)
    } else {
        stop("ontology not supported yet...")
    }
    
    return(annoData)
}

get_dose_data <- function(ontology = "HPO") {
    .DOSEEnv <- get_dose_env()
    .env <- sprintf(".%s_DOSE_Env", ontology)
    if (exists(.env, envir=.DOSEEnv)) {
        res <- get(.env, envir = .DOSEEnv)
        return(res)
    }

    assign(.env, new.env(), envir = .DOSEEnv)
    ret_env <- get(.env, envir = .DOSEEnv)

    TERM2ALLEG <- get_ont2allgene(ontology) 
    EG2ALLTERM <- get_gene2allont(ontology) 

    termmap <- GOSemSim:::get_onto_data(
        ontology, 
        table="term", 
        output = "data.frame")

    PATH2NAME.df <- unique(termmap)
    PATH2NAME <- setNames(PATH2NAME.df[,2], PATH2NAME.df[,1])        

    assign("EXTID2PATHID", EG2ALLTERM, envir = ret_env)
    assign("PATHID2EXTID", TERM2ALLEG, envir = ret_env)
    assign("PATHID2NAME", PATH2NAME, envir = ret_env)

    return(ret_env)    
}


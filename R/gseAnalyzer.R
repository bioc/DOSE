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

    if (ontology == "NCG") {
        annoData <- get_NCG_data()
    } else if (ontology == "DisGeNET") {
        annoData <- get_DGN_data()
    } else if (ontology == "snpDisGeNET") {
        annoData <- get_VDGN_data()
    } else if (ontology == "DO" || ontology == "DOLite") {
        if (organism == "hsa") {
            annoData <- get_DO_data(ontology)
        } else {
            annoData <- get_MPO_data(ont = "DO")
        }
        
    } else if (ontology == "MPO") {
        annoData <- get_MPO_data(ont = "MPO")
    } else if (ontology == "HPO") {
        annoData <- get_HPO_data()        
    } else {
        stop("ontology not supported yet...")
    }

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
##' @param organism one of "hsa" and "mmu"
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
               ontology          = "DO", 
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

##' MPO Gene Set Enrichment Analysis
##'
##'
##' perform gsea analysis
##' @inheritParams gseDO
##' @return gseaResult object
##' @export
##' @author Erqiang Hu
##' @keywords manip
gseMPO <- function(geneList,
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
               ontology          = "MPO",
               ...)
}

##' MPO Gene Set Enrichment Analysis
##'
##'
##' perform gsea analysis
##' @inheritParams gseDO
##' @return gseaResult object
##' @export
##' @author Erqiang Hu
##' @keywords manip
gseHPO <- function(geneList,
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
               ontology          = "HPO",
               ...)
}

## ##' extract gsea result of selected geneSet
## ##'
## ##'
## ##' @title gsInfo
## ##' @param object gseaResult object
## ##' @param geneSetID gene set ID
## ##' @return data.frame
## ##' @author Guangchuang Yu
## ## @export
## gsInfo <- function(object, geneSetID) {
##     geneList <- object@geneList

##     if (is.numeric(geneSetID))
##         geneSetID <- object@result[geneSetID, "ID"]

##     geneSet <- object@geneSets[[geneSetID]]
##     exponent <- object@params[["exponent"]]
##     df <- gseaScores(geneList, geneSet, exponent, fortify=TRUE)
##     df$ymin=0
##     df$ymax=0
##     pos <- df$position == 1
##     h <- diff(range(df$runningScore))/20
##     df$ymin[pos] <- -h
##     df$ymax[pos] <- h
##     df$geneList <- geneList

##     return(df)
## }


## ##' visualize analyzing result of GSEA
## ##'
## ##' plotting function for gseaResult
## ##' @importFrom ggplot2 ggplot
## ##' @importFrom ggplot2 geom_linerange
## ##' @importFrom ggplot2 geom_line
## ##' @importFrom ggplot2 geom_vline
## ##' @importFrom ggplot2 geom_hline
## ##' @importFrom ggplot2 xlab
## ##' @importFrom ggplot2 ylab
## ##' @importFrom ggplot2 xlim
## ##' @importFrom ggplot2 aes
## ##' @importFrom ggplot2 ggplotGrob
## ##' @importFrom ggplot2 geom_segment
## ##' @importFrom ggplot2 ggplot_gtable
## ##' @importFrom ggplot2 ggplot_build
## ##' @importFrom grid grid.newpage
## ##' @importFrom grid viewport
## ##' @importFrom grid grid.layout
## ##' @importFrom grid pushViewport
## ##' @importFrom grid unit
## ##' @importFrom grid gpar
## ##' @importFrom grid grid.text
## ##' @importFrom grid unit.pmax
## ##' @importFrom grid textGrob
## ##' @importFrom grid grid.draw
## ##' @importFrom grDevices dev.interactive
## ##' @param gseaResult gseaResult object
## ##' @param geneSetID geneSet ID
## ##' @param by one of "runningScore" or "position"
## ##' @param title plot title
## ##' @param color color of line segments
## ##' @param color.line color of running enrichment score line
## ##' @param color.vline color of vertical line which indicating the maximum/minimal running enrichment score
## ##' @return ggplot2 object
## ##' @export
## ##' @author Yu Guangchuang
## gseaplot <- function (gseaResult, geneSetID, by = "all", title = "", color='black', color.line="green", color.vline="#FA5860"){
##     by <- match.arg(by, c("runningScore", "preranked", "all"))
##     x <- y <- ymin <- ymax <- xend <- yend <- runningScore <- es <- pos <- geneList <- NULL
##     gsdata <- gsInfo(gseaResult, geneSetID)
##     p <- ggplot(gsdata, aes(x = x)) +
##         theme_dose() + xlab("Position in the Ranked List of Genes")
##     if (by == "runningScore" || by == "all") {
##         p.res <- p + geom_linerange(aes(ymin=ymin, ymax=ymax), color=color)
##         p.res <- p.res + geom_line(aes(y = runningScore), color=color.line, size=1)
##         enrichmentScore <- gseaResult@result[geneSetID, "enrichmentScore"]
##         ## es.df <- data.frame(es = which(p$data$runningScore ==
##         ##                                    enrichmentScore))
##         es.df <- data.frame(es = which.min(abs(p$data$runningScore - enrichmentScore)))
##         p.res <- p.res + geom_vline(data = es.df, aes(xintercept = es),
##                                     colour = color.vline, linetype = "dashed")
##         p.res <- p.res + ylab("Running Enrichment Score")
##         p.res <- p.res + geom_hline(aes(yintercept = 0))
##     }
##     if (by == "preranked" || by == "all") {
##         df2 <- data.frame(x = which(p$data$position == 1))
##         df2$y <- p$data$geneList[df2$x]
##         p.pos <- p + geom_segment(data=df2, aes(x=x, xend=x, y=y, yend=0), color=color)

##         ## p.pos <- p + geom_vline(data = df2, aes(xintercept = pos),
##         ##                         colour = "#DAB546", alpha = 0.3)
##         ## p.pos <- p.pos + geom_line(aes(y = geneList), colour = "red")
##         ## p.pos <- p.pos + geom_hline(aes(yintercept = 0))
##         p.pos <- p.pos + ylab("Ranked list metric") + xlim(0, length(p$data$geneList))
##     }
##     if (by == "runningScore")
##         return(p.res)
##     if (by == "preranked")
##         return(p.pos)
##     p.pos <- p.pos + xlab(NULL) + theme(axis.text.x = element_blank(),
##                                       axis.ticks.x = element_blank())
##     ##p.res <- p.res + theme(axis.title.x = element_text(vjust = -0.3))

##     p.pos <- p.pos + ggtitle(title) + theme(plot.title=element_text(hjust='center'))
##     gp1<- ggplot_gtable(ggplot_build(p.res))
##     gp2<- ggplot_gtable(ggplot_build(p.pos))
##     maxWidth = unit.pmax(gp1$widths[2:3], gp2$widths[2:3])
##     gp1$widths[2:3] <- maxWidth
##     gp2$widths[2:3] <- maxWidth
##     text.params <- gpar(fontsize=15, fontface="bold", lineheight=0.8)
##     textgp <- textGrob(title, gp=text.params)

##     ## grid.arrange(textgp, gp2, gp1, ncol=1, heights=c(0.1, 0.7, 0.7))

##     if (dev.interactive())
##         grid.newpage()

##     pushViewport(viewport(layout = grid.layout(3, 1, heights = unit(c(0.1, 0.7, 0.7), "null"))))

##     gp2$vp = viewport(layout.pos.row = 2, layout.pos.col = 1)
##     grid.draw(gp2)

##     gp1$vp = viewport(layout.pos.row = 3, layout.pos.col = 1)
##     grid.draw(gp1)

##     textgp$vp = viewport(layout.pos.row = 1, layout.pos.col = 1)
##     grid.draw(textgp)

##     invisible(list(runningScore = p.res, preranked = p.pos))
## }

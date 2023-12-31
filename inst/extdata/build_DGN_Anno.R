# download from https://www.disgenet.org/downloads
# 1. ALL gene-disease associations
# 2. ALL variant-disease associations
#x <- read.delim("all_gene_disease_associations.tsv", comment.char="#", stringsAsFactor=F)
x <- read.delim("all_gene_disease_associations.tsv", comment.char="#", stringsAsFactor=F, encoding = "latin1")
d2n <- unique(x[, c("diseaseId", "diseaseName")])
d2g <- unique(x[, c("diseaseId", "geneId")])

.DGN_DOSE_Env <- DOSE:::build_Anno(d2g, d2n)


## save(.DGN_DOSE_Env, file="DGN_DOSE_Env.rda", compress='xz')

DGN_EXTID2PATHID = get("EXTID2PATHID", envir=.DGN_DOSE_Env)
DGN_PATHID2EXTID = get("PATHID2EXTID", envir = .DGN_DOSE_Env)
DGN_PATHID2NAME = get("PATHID2NAME", envir = .DGN_DOSE_Env)

## Warning: found non-ASCII strings
## 'Primary Sj<ef><bf><bd>gren's syndrome' in object 'DGN_PATHID2NAME'
## 'Secondary Sj<ef><bf><bd>gren's syndrome' in object 'DGN_PATHID2NAME'
## 'Henoch-Sch<ef><bf><bd>nlein nephritis' in object 'DGN_PATHID2NAME'
##
## Sjögren
##
## DGN_PATHID2NAME['umls:C0151449'] <- "Primary Sjogren's syndrome"
## DGN_PATHID2NAME['umls:C0151450'] <- "Secondary Sjogren's syndrome"
## DGN_PATHID2NAME['umls:C0403528'] <- 'Henoch-Schonlein nephritis'

DGN_PATHID2NAME <- iconv(DGN_PATHID2NAME, "ASCII", "UTF-8") 

save(DGN_EXTID2PATHID, file = "DGN_EXTID2PATHID.rda", compress='xz')
save(DGN_PATHID2EXTID, file="DGN_PATHID2EXTID.rda", compress='xz')
save(DGN_PATHID2NAME, file="DGN_PATHID2NAME.rda", compress='xz')



y <- read.delim("all_variant_disease_associations.tsv", comment.char="#", stringsAsFactor=F)
d2n <- unique(y[, c("diseaseId", "diseaseName")])
d2s <- unique(y[, c("diseaseId", "snpId")])


.VDGN_DOSE_Env <- DOSE:::build_Anno(d2s, d2n)

## save(.VDGN_DOSE_Env, file="VDGN_DOSE_Env.rda", compress='xz')


VDGN_EXTID2PATHID = get("EXTID2PATHID", envir=.VDGN_DOSE_Env)
VDGN_PATHID2EXTID = get("PATHID2EXTID", envir = .VDGN_DOSE_Env)
VDGN_PATHID2NAME = get("PATHID2NAME", envir = .VDGN_DOSE_Env)

VDGN_PATHID2NAME <- iconv(VDGN_PATHID2NAME, "ASCII", "UTF-8")

save(VDGN_EXTID2PATHID, file = "VDGN_EXTID2PATHID.rda", compress='xz')
save(VDGN_PATHID2EXTID, file="VDGN_PATHID2EXTID.rda", compress='xz')
save(VDGN_PATHID2NAME, file="VDGN_PATHID2NAME.rda", compress='xz')



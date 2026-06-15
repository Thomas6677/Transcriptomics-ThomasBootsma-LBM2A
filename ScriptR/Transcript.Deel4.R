setwd("C:/Users/thoma/OneDrive - NHL Stenden/j2p2/Gegevens/Transcript")
library(Rsubread)
library(Rsamtools)
library(DESeq2)
library(KEGGREST)
library(EnhancedVolcano)
library(pathview)
library(goseq)
library(org.Hs.eg.db)
library(GenomicFeatures)
library(txdbmaker)
library(GenomicRanges)
library(ggplot2)
library("geneLenDataBase")
library(clusterProfiler)

#KEGG_ANALYSE
read.table("ResultatenTRANSCRIPT2.csv")
counts <- read.csv("Human_countmatrix.csv", row.names = 1)
head(counts)

resultaten[1] <- NULL
resultaten[2:5] <- NULL

pathview(
  gene.data = resultaten,
  pathway.id = "eco02026",  
  species = "eco",          
  gene.idtype = "KEGG",     
  limit = list(gene = 5)    
)


supportedOrganisms()


KEG.wall <- goseq(pwf, "hg19","geneSymbol", test.cats=c("KEGG"))

Enriched.kegg <- KEG.wall[KEG.wall$over_represented_pvalue < 0.05, ]

write.csv(Enriched.kegg , "Enrichedkeg.csv")

head(Enriched.kegg[, c(
  "category",
  "over_represented_pvalue",
  "numDEInCat",
  "numInCat"
)])


head(Enriched.kegg)
read.table("Enrichedkeg.csv")
BiocManager::install("clusterProfiler")
library(pathview)
library(clusterProfiler)
library(org.Hs.eg.db)

sig_results <- resultaten[
  resultaten$padj < 0.05 &
    abs(resultaten$log2FoldChange) > 1,
]

gene.data <- resultaten$log2FoldChange
names(gene.data) <- rownames(resultaten)

names(gene.data) <- sub("\\..*", "", names(gene.data))

gene.df <- bitr(
  names(gene.data),
  fromType = "SYMBOL",
  toType = "ENTREZID",
  OrgDb = org.Hs.eg.db
)

head(rownames(resultaten))

gene.data <- gene.data[gene.df$SYMBOL]

names(gene.data) <- gene.df$ENTREZID

pathview(
  gene.data = gene.data,
  pathway.id = "05323",
  species = "hsa"
  , limit = list(gene = 5)    
)
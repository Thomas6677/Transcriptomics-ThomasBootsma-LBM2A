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

#Hier is de ECHTE HELE Human count matrix gebruikt IPV DE SUBSETS

count1 <- read.table("count_matrix_RA.txt")
head(count1)
library(DESeq2)
library(KEGGREST)
library(EnhancedVolcano)
library(pathview)
sample_names <- c(
  "normal1",
  "normal2",
  "normal3",
  "normal4",
  "rheuma1",
  "rheuma2",
  "rheuma3",
  "rheuma4"
)

treatment <- c(
  "normal",
  "normal",
  "normal",
  "normal",
  "rheuma",
  "rheuma",
  "rheuma",
  "rheuma"
)

treatment_table <- data.frame(
  treatment,
  row.names = sample_names
)



head(treatment_table)

dds <- DESeqDataSetFromMatrix(countData = count1,
                              colData = treatment_table,
                              design = ~ treatment)
dds <- DESeq(dds)
resultaten <- results(dds)

write.table(resultaten, file = 'ResultatenTRANSCRIPT2.csv', row.names = TRUE, col.names = TRUE)
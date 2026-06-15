setwd("C:/Users/thoma/OneDrive - NHL Stenden/j2p2/Gegevens/Transcript")
getwd()
install.packages('BiocManager')
# Package downloaden
BiocManager::install('Rsubread')
# Package laden
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

browseVignettes('Rsubread')

#Indexeren
buildindex(basename = 'ref_human', reference = 'GCF_000001405.40_GRCh38.p14_genomic.fna',memory = 4000,indexSplit = TRUE)
align.normal1 <- align(
  index = "ref_human",
  readfile1 = "SRR4785819_1_subset40k.fastq",
  readfile2 = "SRR4785819_2_subset40k.fastq",
  output_file = "normal1.BAM")



align.normal2 <- align(
  index = "ref_human",
  readfile1 = "SRR4785820_1_subset40k.fastq",
  readfile2 = "SRR4785820_2_subset40k.fastq",
  output_file = "normal2.BAM")


align.normal3 <- align(
  index = "ref_human",
  readfile1 = "SRR4785828_1_subset40k.fastq",
  readfile2 = "SRR4785828_2_subset40k.fastq",
  output_file = "normal3.BAM")


align.normal4 <- align(
  index = "ref_human",
  readfile1 = "SRR4785831_1_subset40k.fastq",
  readfile2 = "SRR4785831_2_subset40k.fastq",
  output_file = "normal4.BAM")


align.rheuma1 <- align(
  index = "ref_human",
  readfile1 = "SRR4785979_1_subset40k.fastq",
  readfile2 = "SRR4785979_2_subset40k.fastq",
  output_file = "rheuma1.BAM")

align.rheuma2 <- align(
  index = "ref_human",
  readfile1 = "SRR4785980_1_subset40k.fastq",
  readfile2 = "SRR4785980_2_subset40k.fastq",
  output_file = "rheuma2.BAM")

align.rheuma3 <- align(
  index = "ref_human",
  readfile1 = "SRR4785986_1_subset40k.fastq",
  readfile2 = "SRR4785986_2_subset40k.fastq",
  output_file = "rheuma3.BAM",)


align.rheuma4 <- align(
  index = "ref_human",
  readfile1 = "SRR4785988_1_subset40k.fastq",
  readfile2 = "SRR4785988_2_subset40k.fastq",
  output_file = "rheuma4.BAM")






# Sorteer BAM-bestanden
lapply(samples, function(s) {sortBam(file = paste0(s,'.BAM'), destination = paste0(s, '.sorted'))})
# Indexeer de gesorteerde BAM-file
lapply(samples, function(s) {indexBam(file = paste0(s, '.sorted.bam'))})

allsamples <- c("normal1.BAM", "normal2.BAM", "normal3.BAM", "normal4.BAM", "rheuma1.BAM", "rheuma2.BAM" , "rheuma3.BAM" , "rheuma4.BAM")

count_matrix <- featureCounts(
  files = allsamples,
  annot.ext = "genomic.gtf",
  isPairedEnd = TRUE,
  isGTFAnnotationFile = TRUE,
  GTF.featureType = "gene", 
  GTF.attrType = "gene_id",
  useMetaFeatures = TRUE)
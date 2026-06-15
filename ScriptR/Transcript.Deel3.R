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


resultaten <- read.table(file = "ResultatenTRANSCRIPT2.csv")

head(resultaten)

colData(dds)
counts(dds)

sum(resultaten$padj < 0.05 & resultaten$log2FoldChange > 1, na.rm = TRUE)
sum(resultaten$padj < 0.05 & resultaten$log2FoldChange < -1, na.rm = TRUE)

hoogste_fold_change <- resultaten[order(resultaten$log2FoldChange, decreasing = TRUE), ]
laagste_fold_change <- resultaten[order(resultaten$log2FoldChange, decreasing = FALSE), ]
laagste_p_waarde <- resultaten[order(resultaten$padj, decreasing = FALSE), ]

EnhancedVolcano(resultaten,
                lab = rownames(resultaten),
                x = 'log2FoldChange',
                y = 'padj')
dev.copy(png, 'VolcanoplotTRANSCRIPTT.png', 
         width = 8,
         height = 10,
         units = 'in',
         res = 500)
dev.off()

#GO ANALYSE

DEG <- rownames(resultaten %>%
                  filter(padj < 0.05) %>% filter(log2FoldChange > 1))
head(DEG)
head(ALL)
class(DEG)
DEG.vector <- c(t(DEG))
ALL.vector<-c(t(ALL))


gene.vector = as.integer(ALL.vector%in%DEG.vector)
names(gene.vector) = ALL.vector
#lets explore this new vector a bit
head(gene.vector)
tail(gene.vector)


pwf <- nullp(gene.vector,"hg19","geneSymbol")


GO.wall <- goseq(pwf,"hg19","geneSymbol")

#How many enriched GO terms do we have
class(GO.wall)
head(GO.wall)
nrow(GO.wall)

enriched.GO <- GO.wall$category[GO.wall$over_represented_pvalue<.05]
#NOTE: They recommend using a more stringent multiple testing corrected p value here

#How many GO terms do we have now?
class(enriched.GO)
head(enriched.GO)
length(enriched.GO)

goResults <- goseq(pwf, "hg19","geneSymbol", test.cats=c("GO:BP"))
write.csv(counts, "goResults.csv")
KEG.wall <- goseq(pwf, "hg19","geneSymbol", test.cats=c("KEGG"))
head(goResults)
goResults %>% 
  top_n(15, wt=-over_represented_pvalue) %>% 
  mutate(hitsPerc=numDEInCat*100/numInCat) %>% 
  ggplot(aes(x=hitsPerc, 
             y=term, 
             colour=over_represented_pvalue, 
             size=numDEInCat)) +
  geom_point() +
  expand_limits(x=0) +
  labs(x="Hits (%)", y="GO term", colour="p value", size="Count")

library(ggplot2)
# Transcriptomische analyse van reumatoïde artritis laat sterke activatie van chemokine- en cytokinesignalering zien

# Inleiding

Reumatoïde artritis (RA) is een chronische auto-immuunziekte die wordt gekenmerkt door langdurige ontsteking van de synoviale gewrichten. Deze ontsteking leidt uiteindelijk tot kraakbeenafbraak, boterosie en verlies van gewrichtsfunctie. Binnen het synovium spelen verschillende immuuncellen, waaronder T-cellen, B-cellen, macrofagen en neutrofielen, een belangrijke rol bij het onderhouden van de inflammatoire respons.

Cytokines en chemokines zijn essentiële regulatoren van deze immuunreacties. Vooral chemokines uit de CXC-familie, zoals CXCL1, CXCL8 en CXCL13, zijn sterk betrokken bij immuuncelrekrutering en inflammatie binnen RA-weefsel. Deze chemokines binden aan receptoren zoals CXCR1, CXCR2, CXCR3 en CXCR5, waardoor immuuncellen naar ontstoken gewrichten worden aangetrokken. Verhoogde expressie van deze pathways wordt geassocieerd met ziekteprogressie, chronische inflammatie en gewrichtsschade bij RA-patiënten.

RNA-sequencing (RNA-seq) maakt het mogelijk om genexpressie op grote schaal te analyseren en verschillen tussen gezonde en zieke weefsels te identificeren. Met behulp van differential expression analyse kunnen genen en pathways worden opgespoord die betrokken zijn bij ziekteprocessen. Daarnaast kunnen GO- en KEGG-pathway analyses inzicht geven in de biologische functies en signaalroutes die geassocieerd zijn met differentieel geëxpresseerde genen.

In dit onderzoek werd RNA-seq analyse uitgevoerd op samples van gezonde controles en patiënten met reumatoïde artritis. De focus van het onderzoek ligt op cytokine- en chemokinesignalering binnen inflammatoire pathways. Hierbij werd specifiek gekeken naar de rol van chemokines uit de CXC-familie en hun receptoren binnen de pathogenese van reumatoïde artritis.

## Doelstelling

Het doel van dit onderzoek is het identificeren van differentieel geëxpresseerde genen en verrijkte biologische pathways bij reumatoïde artritis met behulp van RNA-seq analyse. Hierbij ligt de nadruk op cytokine-cytokine receptor interacties en chemokine-gemedieerde immuuncelrekrutering.

# Materialen en Methoden

## Dataset

Voor dit onderzoek werden publieke RNA-seq datasets gebruikt afkomstig van gezonde controles en patiënten met reumatoïde artritis van Platzer et al. (2019). De sequencing data bestond uit paired-end FASTQ bestanden.

## Read alignment

De RNA-seq reads werden uitgelijnd tegen het humane referentiegenoom GRCh38 met behulp van het R-package Rsubread. Eerst werd een index opgebouwd van het referentiegenoom, waarna de paired-end reads werden gemapt naar het genoom.

## Genereren van count matrix

Na alignment werden de BAM-bestanden gesorteerd en geïndexeerd met behulp van Rsamtools. Vervolgens werd featureCounts gebruikt om reads toe te wijzen aan genen op basis van een GTF-annotatiebestand. Dit resulteerde in een count matrix met het aantal reads per gen voor ieder sample.

## Differential expression analyse

Differential expression analyse werd uitgevoerd met het R-package DESeq2. Hierbij werden de reumatoïde artritis samples vergeleken met gezonde controles. Genen werden beschouwd als significant differentieel geëxpresseerd wanneer zij voldeden aan:

* adjusted p-value < 0.05
* |log2FoldChange| > 1

De resultaten werden gevisualiseerd met behulp van een volcano plot.

## GO enrichment analyse

Gene Ontology (GO) enrichment analyse werd uitgevoerd met het package goseq. Hierbij werd gecorrigeerd voor genlengtebias door gebruik te maken van een probability weighting function (PWF). Significante GO-termen werden geselecteerd op basis van over-represented p-values kleiner dan 0.05.

## KEGG pathway analyse

KEGG enrichment analyse werd uitgevoerd met goseq om biologische pathways te identificeren die verrijkt waren in de differentieel geëxpresseerde genen. Vervolgens werden significante pathways gevisualiseerd met het package Pathview.

## Pathway visualisatie

Voor pathway visualisatie werden log2FoldChange waarden gekoppeld aan ENTREZ gene identifiers. Met behulp van Pathview werden pathway diagrams gegenereerd waarin upregulatie werd weergegeven in rood en downregulatie in groen.

## Software en packages

Alle analyses werden uitgevoerd in R. Hierbij werden onder andere de volgende packages gebruikt:

* Rsubread
* Rsamtools
* DESeq2
* goseq
* pathview
* clusterProfiler
* ggplot2
* org.Hs.eg.db

# Bronnen
Murayama, M. A., Shimizu, J., Miyabe, C., Yudo, K., & Miyabe, Y. (2023). Chemokines and chemokine receptors as promising targets in rheumatoid arthritis. Frontiers in immunology, 14, 1100869. https://doi.org/10.3389/fimmu.2023.1100869

Khandia, R., Singhal, S., Sharma, K., & colleagues. (2025). Investigating potential biomarkers and therapeutic targets for patients with systemic lupus erythematosus (SLE) and rheumatoid arthritis (RA) through the utilization of cytokine profiling. Reumatología Clínica, 21(1), 101805

Wright, H. L., Lyon, M., Chapman, E. A., Moots, R. J., & Edwards, S. W. (2021). Rheumatoid Arthritis Synovial Fluid Neutrophils Drive Inflammation Through Production of Chemokines, Reactive Oxygen Species, and Neutrophil Extracellular Traps. Frontiers in immunology, 11, 584116. https://doi.org/10.3389/fimmu.2020.584116

Makarem, Y. S., Ahmed, E. A., Makboul, M., Farghaly, S., Mostafa, N., El Zohne, R. A., & Goma, S. H. (2024). CXCL10 as a biomarker of interstitial lung disease in patients with rheumatoid arthritis. Reumatologia clinica, 20(1), 1–7. https://doi.org/10.1016/j.reumae.2023.12.005




# Transcriptomische analyse van reumatoïde artritis laat sterke activatie van chemokine- en cytokinesignalering zien

# Inleiding

Reumatoïde artritis (RA) is een chronische auto-immuunziekte die wordt gekenmerkt door langdurige ontsteking van de synoviale gewrichten. Deze ontsteking leidt uiteindelijk tot kraakbeenafbraak, boterosie en verlies van gewrichtsfunctie. Binnen het synovium spelen verschillende immuuncellen, waaronder T-cellen, B-cellen, macrofagen en neutrofielen, een belangrijke rol bij het onderhouden van de inflammatoire respons (Wright et al., 2021).

Cytokines en chemokines vormen essentiële regulatoren van deze immuunreacties. Vooral chemokines uit de CXC-familie, zoals CXCL1, CXCL8, CXCL10 en CXCL13, zijn sterk betrokken bij immuuncelrekrutering en inflammatie binnen RA-weefsel. Deze chemokines binden aan receptoren zoals CXCR1, CXCR2, CXCR3 en CXCR5, waardoor immuuncellen naar ontstoken gewrichten worden aangetrokken. Verhoogde expressie van deze pathways wordt geassocieerd met ziekteprogressie, chronische inflammatie en gewrichtsschade bij RA-patiënten (Murayama et al., 2023).

Daarnaast zijn verschillende CXCL-chemokines beschreven als potentiële biomarkers voor ziekteactiviteit en complicaties bij RA. Zo wordt verhoogde expressie van CXCL10 geassocieerd met inflammatoire activiteit en interstitiële longaandoeningen bij patiënten met reumatoïde artritis (Makarem et al., 2024). Ook cytokineprofilering laat zien dat chemokine- en cytokinesignalering belangrijke potentiële therapeutische targets vormen binnen RA-pathologie (Khandia et al., 2025).

RNA-sequencing (RNA-seq) maakt het mogelijk om genexpressie op grote schaal te analyseren en verschillen tussen gezonde en zieke weefsels te identificeren. Met behulp van differential expression analyse kunnen genen en pathways worden opgespoord die betrokken zijn bij ziekteprocessen. Daarnaast kunnen GO- en KEGG-pathway analyses inzicht geven in de biologische functies en signaalroutes die geassocieerd zijn met differentieel geëxpresseerde genen.

In dit onderzoek werd RNA-seq analyse uitgevoerd op publieke datasets afkomstig uit een eerdere studie van Platzer et al. (2019), waarin genexpressiepatronen bij reumatoïde artritis werden onderzocht. De focus van dit onderzoek ligt op cytokine- en chemokinesignalering binnen inflammatoire pathways. Hierbij werd specifiek gekeken naar de rol van chemokines uit de CXC-familie en hun receptoren binnen de pathogenese van reumatoïde artritis.

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

# Resultaten

## Differential expression analyse

Om verschillen in genexpressie tussen reumatoïde artritis (RA) samples en gezonde controles te onderzoeken, werd differential expression analyse uitgevoerd met DESeq2. Genen werden als significant beschouwd wanneer zij voldeden aan een adjusted p-value kleiner dan 0.05 en een absolute log2FoldChange groter dan 1. De resultaten werden gevisualiseerd met behulp van een volcano plot, waarbij upgereguleerde genen in rood en downgereguleerde genen ook in het rood zijn weergegeven.

![Volcano plot](Afbeeldingen/VolcanoplotTRANSCRIPTT.png)

*Figuur 1. Volcano plot van differentieel geëxpresseerde genen tussen reumatoïde artritis samples en gezonde controles.*

De analyse liet een groot aantal significant differentieel geëxpresseerde genen zien. Meerdere van deze genen waren betrokken bij immuunresponsen, inflammatoire processen en cytokinesignalering.

---

## GO enrichment analyse

Om biologische processen te identificeren die verrijkt waren binnen de differentieel geëxpresseerde genen, werd GO enrichment analyse uitgevoerd met behulp van goseq. Hierbij werd gecorrigeerd voor genlengtebias.

De analyse liet sterke verrijking zien van immuun- en ontstekingsgerelateerde processen, waaronder immuunrespons, leukocytactivatie, cytokinesignalering en immuuncelmigratie. Deze resultaten suggereren verhoogde activatie van pathways die betrokken zijn bij chronische inflammatie en immuunactivatie binnen RA-weefsel, de resultaten zijn gevisualiseerd in figuur 2.
![GO ANALYSE](Afbeeldingen/Rplot.png)

*Figuur 2. GO ANALYSE gevisluariseerd. Hoe groter de stip, deste meer het voorkomt. Hoe donkerder de stip deste meer significant verschil gevonden is *

---

## KEGG pathway analyse

KEGG enrichment analyse identificeerde meerdere significant verrijkte pathways die betrokken zijn bij inflammatie en immuunregulatie. De meest verrijkte pathways waren de Rheumatoid Arthritis pathway (hsa05323), de Cytokine-cytokine receptor interaction pathway (hsa04060) en de Toll-like receptor signaling pathway (hsa04620).

Binnen de Rheumatoid Arthritis pathway werd verhoogde expressie gevonden van meerdere inflammatoire cytokines, chemokines en immuunreceptoren die betrokken zijn bij synoviale ontsteking en gewrichtsschade.

![Rheumatoid arthritis pathway](Afbeeldingen/hsa05323.pathview.png)

*Figuur 3. KEGG Rheumatoid Arthritis pathway. Rood geeft verhoogde genexpressie weer en groen verlaagde genexpressie.*

---

## Cytokine-cytokine receptor interacties

De Cytokine-cytokine receptor interaction pathway liet sterke activatie zien van meerdere chemokines uit de CXC-familie en hun receptoren. Vooral verhoogde expressie van CXCL1, CXCL2, CXCL3, CXCL5, CXCL6, CXCL8, CXCL10 en CXCL13 werd waargenomen. Daarnaast werden ook verhoogde expressieniveaus gevonden van de receptoren CXCR1, CXCR2, CXCR3 en CXCR5.

Deze expressiepatronen wijzen op sterke activatie van chemokine-gemedieerde immuuncelrekrutering binnen RA-weefsel. De verhoogde expressie van CXCL1, CXCL2, CXCL5 en CXCL8 suggereert verhoogde neutrofielmigratie en acute inflammatoire activatie via de CXCR1/CXCR2 signaling as. Daarnaast wijzen verhoogde expressieniveaus van CXCL10, CXCL11 en CXCL13 op activatie van T-cel- en B-celgerelateerde immuunresponsen die betrokken zijn bij chronische auto-immuunactiviteit.

De verhoogde expressie van CXCL13 en CXCR5 is bijzonder interessant, omdat deze interactie betrokken is bij B-celrekrutering en de vorming van inflammatoire lymfoïde structuren binnen het synovium van RA-patiënten.

![Cytokine pathway](Afbeeldingen/hsa04060.pathview.png)

*Figuur 4. KEGG Cytokine-cytokine receptor interaction pathway met verhoogde expressie van meerdere chemokines en chemokinereceptoren.*

---

## Interpretatie van chemokinesignalering

De resultaten suggereren dat zowel innate als adaptive immune responses sterk geactiveerd zijn binnen de RA-samples. De activatie van de CXCL–CXCR signaling as wijst op verhoogde recrutering van neutrofielen, T-cellen en B-cellen naar ontstoken gewrichten. Hierdoor ontstaat een versterkte inflammatoire omgeving die waarschijnlijk bijdraagt aan chronische ontsteking en gewrichtsschade.

Daarnaast ondersteunen verhoogde expressieniveaus van inflammatoire cytokines en Toll-like receptor signaling pathways het bestaan van een sterk pro-inflammatoir micro-omgeving binnen RA-weefsel. Deze bevindingen komen overeen met bestaande literatuur waarin chemokines en cytokines worden beschreven als belangrijke regulatoren van RA-pathologie en potentiële therapeutische targets.



# Bronnen
Murayama, M. A., Shimizu, J., Miyabe, C., Yudo, K., & Miyabe, Y. (2023). Chemokines and chemokine receptors as promising targets in rheumatoid arthritis. Frontiers in immunology, 14, 1100869. https://doi.org/10.3389/fimmu.2023.1100869

Khandia, R., Singhal, S., Sharma, K., & colleagues. (2025). Investigating potential biomarkers and therapeutic targets for patients with systemic lupus erythematosus (SLE) and rheumatoid arthritis (RA) through the utilization of cytokine profiling. Reumatología Clínica, 21(1), 101805

Wright, H. L., Lyon, M., Chapman, E. A., Moots, R. J., & Edwards, S. W. (2021). Rheumatoid Arthritis Synovial Fluid Neutrophils Drive Inflammation Through Production of Chemokines, Reactive Oxygen Species, and Neutrophil Extracellular Traps. Frontiers in immunology, 11, 584116. https://doi.org/10.3389/fimmu.2020.584116

https://bioinformatics-core-shared-training.github.io/cruk-summer-school-2020/RNAseq/extended_html/06_Gene_set_testing.html

Makarem, Y. S., Ahmed, E. A., Makboul, M., Farghaly, S., Mostafa, N., El Zohne, R. A., & Goma, S. H. (2024). CXCL10 as a biomarker of interstitial lung disease in patients with rheumatoid arthritis. Reumatologia clinica, 20(1), 1–7. https://doi.org/10.1016/j.reumae.2023.12.005

Platzer, A., Nussbaumer, T., Karonitsch, T., Smolen, J. S., & Aletaha, D. (2019). Analysis of gene expression in rheumatoid arthritis and related conditions offers insights into sex-bias, gene biotypes and co-expression patterns. PloS one, 14(7), e0219698. https://doi.org/10.1371/journal.pone.0219698


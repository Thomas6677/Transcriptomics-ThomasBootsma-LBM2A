# Transcriptomische analyse van reumatoïde artritis laat sterke activatie van chemokine- en cytokinesignalering zien

## Inleiding

Reumatoïde artritis (RA) is een chronische auto-immuunziekte die wordt gekenmerkt door langdurige ontsteking van de gewrichten. Deze ontsteking leidt uiteindelijk tot kraakbeenbeschadiging, botafbraak en verlies van gewrichtsfunctie. Verschillende immuuncellen, waaronder T-cellen, B-cellen, macrofagen en neutrofielen, spelen een belangrijke rol in het ontstaan en onderhouden van deze ontstekingsreactie.

Chemokines vormen een belangrijke groep signaalmoleculen die verantwoordelijk zijn voor het aantrekken van immuuncellen naar ontstoken weefsel. Vooral chemokines uit de CXC-familie, zoals CXCL1, CXCL8 en CXCL13, zijn sterk betrokken bij inflammatoire processen binnen het synovium van RA-patiënten. Deze chemokines binden aan receptoren zoals CXCR1, CXCR2, CXCR3 en CXCR5, waardoor immuuncellen worden geactiveerd en gerekruteerd naar het gewricht.

In dit onderzoek werd RNA-seq analyse uitgevoerd op reumatoïde artritis samples en gezonde controles om differentieel tot expressie komende genen te identificeren. Vervolgens werden GO- en KEGG-pathway analyses uitgevoerd om biologische processen en signaalroutes te onderzoeken die betrokken zijn bij RA. De focus van dit onderzoek ligt op cytokine-cytokine receptor interacties en chemokinesignalering, omdat deze pathways sterk geassocieerd zijn met ontsteking, immuuncelrekrutering en chronische auto-immuniteit.

## Workflow

1. RNA-seq reads werden uitgelijnd tegen het humane GRCh38 referentiegenoom met behulp van Rsubread.
2. FeatureCounts werd gebruikt om een count matrix te genereren.
3. Differential expression analyse werd uitgevoerd met DESeq2.
4. Significante genen werden geselecteerd op basis van:

   * adjusted p-value < 0.05
   * |log2FoldChange| > 1
5. GO enrichment analyse werd uitgevoerd met goseq.
6. KEGG pathway analyse werd gebruikt om verrijkte biologische pathways te identificeren.
7. Pathview werd gebruikt om pathway-specifieke genexpressie visueel weer te geven.

## Belangrijkste resultaten

De KEGG analyse liet sterke verrijking zien van verschillende immuun- en ontstekingsgerelateerde pathways, waaronder:

* Rheumatoid arthritis (hsa05323)
* Cytokine-cytokine receptor interaction (hsa04060)
* Toll-like receptor signaling pathway (hsa04620)

Binnen de cytokine-cytokine receptor interaction pathway werd sterke upregulatie gevonden van meerdere chemokines uit de CXC-familie, waaronder:

* CXCL1
* CXCL2
* CXCL3
* CXCL5
* CXCL6
* CXCL8
* CXCL10
* CXCL13

Deze chemokines spelen een belangrijke rol bij:

* recrutering van neutrofielen
* T-cel activatie
* B-cel migratie
* inflammatoire signalering

Daarnaast werden verhoogde expressieniveaus gevonden van de receptoren:

* CXCR1
* CXCR2
* CXCR3
* CXCR5

Deze resultaten suggereren verhoogde activatie van zowel innate als adaptive immune responses binnen RA-weefsel.

## Interpretatie

De sterke activatie van de CXCL–CXCR signaleringsas wijst op verhoogde immuuncelmigratie naar ontstoken gewrichten. Vooral de CXCL8–CXCR2 as lijkt betrokken bij neutrofielrekrutering en acute inflammatie, terwijl de CXCL13–CXCR5 as waarschijnlijk een rol speelt bij B-cel recrutering en chronische auto-immuunactivatie.

Daarnaast ondersteunen verhoogde expressieniveaus van IL6, IL1β en Toll-like receptor signaling het bestaan van een sterk pro-inflammatoir micro-omgeving binnen RA-weefsel.

Deze bevindingen sluiten aan bij bestaande literatuur waarin chemokines en cytokines worden beschreven als potentiële biomarkers en therapeutische targets voor reumatoïde artritis.

## Conclusie

RNA-seq analyse van RA-samples liet sterke activatie zien van immuun- en ontstekingsgerelateerde pathways. Vooral chemokines uit de CXC-familie en hun receptoren waren sterk upgereguleerd. De resultaten suggereren dat chemokine-gemedieerde immuuncelrekrutering een centrale rol speelt in de pathogenese van reumatoïde artritis.

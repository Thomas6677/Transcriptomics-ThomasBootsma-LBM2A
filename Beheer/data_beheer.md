# Data- en scriptbeheer

Een goede organisatie van data en scripts is belangrijk binnen bioinformatica onderzoek. Tijdens RNA-seq analyses worden grote hoeveelheden data gegenereerd en verwerkt. Zonder een duidelijke structuur kunnen bestanden verloren gaan of analyses moeilijk reproduceerbaar worden. Goed data- en scriptbeheer zorgt ervoor dat analyses overzichtelijk, reproduceerbaar en controleerbaar blijven.

Binnen dit onderzoek werden de analyses opgesplitst in vier afzonderlijke scripts. Door iedere analysefase in een apart script uit te voeren bleef de workflow overzichtelijk en konden fouten eenvoudiger worden opgespoord.

## Scriptindeling

### Script 1 — Alignment en preprocessing

In het eerste script werden de RNA-seq reads uitgelijnd tegen het humane referentiegenoom GRCh38 met behulp van het package Rsubread. Vervolgens werden de BAM-bestanden gesorteerd en geïndexeerd. Daarna werd met featureCounts een count matrix gegenereerd op basis van een GTF-annotatiebestand.

Gebruikte packages:

* Rsubread
* Rsamtools

### Script 2 — Count matrix verwerking

In het tweede script werd eerst gewerkt met een subset van de RNA-seq data om de analysepipeline te testen. Daarna werd de volledige count matrix ingelezen en opgeslagen voor verdere analyse. Door deze stap apart uit te voeren bleef de verwerking van grote datasets overzichtelijk.

Gebruikte packages:

* DESeq2

### Script 3 — Differential expression en GO analyse

In het derde script werd differential expression analyse uitgevoerd met DESeq2. De resultaten werden gevisualiseerd met een volcano plot via EnhancedVolcano. Vervolgens werd GO enrichment analyse uitgevoerd met goseq om biologische processen te identificeren die verrijkt waren binnen de differentieel geëxpresseerde genen.

Gebruikte packages:

* DESeq2
* EnhancedVolcano
* goseq
* org.Hs.eg.db
* GenomicFeatures
* txdbmaker
* GenomicRanges
* geneLenDataBase
* ggplot2

### Script 4 — KEGG pathway analyse

In het vierde script werd KEGG enrichment analyse uitgevoerd om inflammatoire pathways te identificeren die betrokken zijn bij reumatoïde artritis. De pathways werden gevisualiseerd met Pathview, waarbij verhoogde genexpressie in rood en verlaagde expressie in groen werd weergegeven.

Gebruikte packages:

* KEGGREST
* pathview
* clusterProfiler
* org.Hs.eg.db

## Structuur van bestanden

Binnen het project werd gebruik gemaakt van een duidelijke mappenstructuur waarbij scripts, resultaten en afbeeldingen van elkaar gescheiden werden opgeslagen. Dit maakt bestanden eenvoudiger terug te vinden en voorkomt verwarring tijdens analyses.

Voorbeelden van gebruikte mappen:

* Scripts/
* Afbeeldingen/
* Resultaten/
* Documentatie/

Daarnaast werden duidelijke bestandsnamen gebruikt, zoals:

* `VolcanoplotTRANSCRIPTT.png`
* `GO_results.csv`
* `Enrichedkegg.csv`

Hierdoor bleef direct zichtbaar welke analyse bij welk bestand hoorde.

## Versiebeheer en GitHub

Voor het delen en beheren van scripts werd GitHub gebruikt. GitHub maakt het mogelijk om scripts online op te slaan, wijzigingen bij te houden en analyses reproduceerbaar te maken. Daarnaast zorgt versiebeheer ervoor dat oudere versies van scripts behouden blijven wanneer analyses worden aangepast.

Door scripts en resultaten via GitHub beschikbaar te maken blijft het onderzoek transparant en reproduceerbaar voor andere onderzoekers.

## Belang van reproduceerbaarheid

Binnen bioinformatica is reproduceerbaarheid een belangrijk onderdeel van wetenschappelijk onderzoek. Door duidelijke scripts, goede documentatie en overzichtelijke opslag van bestanden kunnen analyses opnieuw worden uitgevoerd en gecontroleerd. Dit verhoogt de betrouwbaarheid van de resultaten en maakt samenwerking tussen onderzoekers eenvoudiger.

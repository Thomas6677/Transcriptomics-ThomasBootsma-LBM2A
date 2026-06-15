# Data stewardship

Data stewardship richt zich op het verantwoord beheren, organiseren en delen van onderzoeksdata.
Binnen bioinformatica is dit belangrijk omdat analyses vaak bestaan uit grote datasets en meerdere analyse-stappen. 
Goed data management zorgt ervoor dat analyses reproduceerbaar, veilig en overzichtelijk blijven.

Binnen dit onderzoek werd gebruik gemaakt van publieke RNA-seq datasets afkomstig uit Platzer et al. (2019). 
Omdat met grote sequencing datasets werd gewerkt, was een duidelijke organisatie van bestanden en scripts belangrijk.
Daarom werden analyses opgesplitst in meerdere scripts die afzonderlijke onderdelen van de workflow bevatten, waaronder alignment, differential expression analyse,
GO enrichment analyse en KEGG pathway analyse.

De scripts en resultaten werden opgeslagen in een gestructureerde mappenstructuur waarbij data, scripts,
afbeeldingen en resultaten van elkaar gescheiden werden opgeslagen.
Daarnaast werden duidelijke bestandsnamen gebruikt zodat bestanden eenvoudig teruggevonden konden worden.

Voor versiebeheer en documentatie werd GitHub gebruikt.
GitHub maakt het mogelijk om wijzigingen binnen scripts bij te houden en analyses reproduceerbaar te maken voor andere onderzoekers.
Door scripts openbaar beschikbaar te maken wordt transparantie binnen het onderzoek vergroot.

Binnen het onderzoek werd uitsluitend gebruik gemaakt van publieke datasets zonder persoonlijke patiëntgegevens. 
Hierdoor waren geen aanvullende privacymaatregelen noodzakelijk. 
Bij onderzoek met gevoelige of klinische data zouden anonimisering,
beveiligde opslag en beperkte toegang belangrijke onderdelen van data stewardship zijn.

Het publiceren van scripts en analysepipelines draagt bij aan open science en reproduceerbaarheid binnen bioinformatica onderzoek.
Hierdoor kunnen andere onderzoekers analyses controleren, herhalen en verder uitbreiden.

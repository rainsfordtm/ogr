---
title: 'Presentation'
date: 2024-12-17
weight: 2
summary: Read about the corpus and why it was created
---

\[[Introduction](#introduction)\]
\[[History](#history)\]
\[[Sources and bibliography](#sources-and-bibliography)\]

## Introduction

The Old Gallo-Romance (OGR) corpus contrains richly annotated versions of the
all Gallo-Romance texts preserved in manuscripts copied before c1130. Since most of the texts
are well-known and excellent corpora of Old French (notably the _Base de français médiéval_ at
[bfm.ens-lyon.fr](http://bfm.ens-lyon.fr)) are already available, it's reasonable to ask: why do we
need this corpus too?

### 1. Unique features of the OGR corpus

The OGR differs from existing corpora and indeed published editions in important ways.

#### 1.1 Unified early Gallo-Romance 

The OGR corpus contains both Old French and Old Occitan texts. The textual record for the period in
question is extremely sparse, the texts do not clearly belong to a single literary tradition
and none of the them is written in the same Gallo-Romance variety.  More importantly, a number
of the texts from this period show effects of contact between northern and southern 
Gallo-Romance varieties, notably the _Passion_ of Clermont, or originate
from regions such as Poitou near the linguistic border between the northern and southern
Gallo-Romance areas. 

In short, the textual record for this early period does not neatly reflect a clear linguistic
division between the two areas, and as such a unified Gallo-Romance corpus provides a more
representative overview of the available data.

#### 1.2 Manuscript oriented

The OGR corpus focuses on manuscripts, not texts. The only manuscripts included are those copied before
c1130, which provides a clear _terminus ad quem_ for any observed linguistic development,
since any possible modernization by later scribes is excluded. Furthermore, the OGR includes
a diplomatic edition of the text verified against photographs of the manuscript. The original
word division and manuscript abbreviations are recorded and corrections to the text are
avoided, except in the most obvious of cases, and even here they are clearly marked.

Some of this information is recoverable in critical editions --- although typically not the original
word division --- but is absent from most electronic corpora, which eliminate the critical
apparatus of the print edition and provide only the editor's normalized base text.

#### 1.3 Fully lemmatized and morphologically annotated

The lemmatization and morphosyntactic annotation in the OGR corpus has been manually verified for
every text. As there is no shortage of detailed philological discussion
of these texts --- print critical editions typically include a fully glossed list of forms and
often a translation --- manual verification is informed by the philological tradition.

#### 1.4 Phonologically and metrically annotated

Each text in the corpus is phonologically transcribed. The transcriptions are parsed into
syllables, and in the verse texts, each syllable is assigned a metrical position within the
line of verse, or is marked as elided.

While more speculative and informed by my own research interests, this annotation facilitates
research into the morphophonology of the texts.

### 2. Research facilitated by the OGR corpus

The OGR corpus is designed primarily to facilitate research into the phonology, morphology,
and morphosyntax of early Gallo-Romance, in addition to the study of versification.
However, it is hoped that the lemmatization and morphosyntactic annotation will increase
the accessibility of these often difficult texts for researchers in all areas who wish to
explore early Gallo-Romance data in more detail.

The OGR corpus does not include treebank annotation and I do not envisage adding it in the near
future.
However, most of the northern Gallo-Romance texts were manually parsed during the SRCMF project and
are available as part of the Profiterole treebank [https://universaldependencies.org/treebanks/fro_profiterole/index.html](https://universaldependencies.org/treebanks/fro_profiterole/index.html).

Two of my papers use the OGR: [Rainsford \(2022\)](https://doi.org/10.1051/shsconf/202213802007), which gives a detailed
presentation of the corpus, and Rainsford (2024), which examines
sandhi phenomena, enclisis and proclisis in these old Gallo-Romance
texts.

### 3. Why c1130?

The cut-off date for inclusion in the OGR corpus is fixed at c1130,
roughly the date at which the Hildesheim manuscript of the _Life of
Saint Alexis_ was copied but before the Oxford manuscript of the 
_Song of Roland_. The date itself is arbitrary but it allows
the OGR to include only those texts which are traditionally considered
to be the "early monuments" of Gallo-Romance. These texts are united
by their individuality. Except for the _Life of Saint Alexis_, each text
is preserved only in a single manuscript. They are all written in a different
variety of Gallo-Romance, and have little in common with each other
in terms of their poetic form.
Many are chance survivors, but even those which are not cannot easily be
connected to the literary traditions that develop in the twelfth century. 
In short, the OGR is a collection of early, "oddball" texts.

With this in mind, there is a deliberate omission from the corpus. In the southern
Gallo-Romance area, legal documents began to be written in the vernacular,
at least in part, towards the end of the eleventh century (see Brunel 1926).
These documents are linguistically very interesting but it makes little
sense to include only those copied before 1130 and exclude the rest,
since these are not oddball survivors but the first examples of an
emerging textual tradition.

## History

The OGR began life during my time as a postdoc on the SRCMF project at the ENS de Lyon,
where I was able to collaborate with Alexei Lavrentiev and Céline Barbance-Guillot
to produce new editions of the _Serments_ and _Eulalie_ texts. Subsequently,
Christiane Marchello-Nizia invited me to collaborate on the creation of a multi-facet edition
of the edition of the _Life of Saint Alexis_
(Rainsford and Marchello-Nizia 2024). All of these editions are now also available in
the [_Base de français médiéval_](http://bfm.ens-lyon.fr).
The style of the editions in the OGR, and in some cases the stylesheets
themselves, draw heavily on Alexei Lavrentiev's work for the BFM.
I'm grateful to the BFM team (Céline Guillot-Barbance and Alexey Lavrentiev)
and to the developers of the TXM software (Serge Heiden and Mathieu
Decorde) for their support, inspiration and encouragement over the years.

As a British Academy Post-Doctoral Fellow at the University of Oxford, I continued to develop
the tools used to build the metrically and syntactically annotated corpus developed during 
[my doctoral thesis](https://dx.doi.org/10.17863/CAM.16503). 
These tools were used to produce an initial version of the _Boeci_ text, annotated both
metrically and syntactically in
[joint work with Olga Scrivner](http://dx.doi.org/10.18419/opus-15350),
who also introduced me to the ANNIS software. 

The phonological transcriptions were developed for 
[a paper published in 2020](https://dx.doi.org/10.2218/pihph.5.2020.4433) on the the 
syllable structure of Early Old French, and the [dataset](https://dx.doi.org/10.18710/XYMXPC), which
also includes a transcription of all the forms in the _Song of Roland_ , was published in
the TROLLing repository.

A preview version of the corpus (v0.1.3) was released on ogr-corpus.org in June 2021.
Version 0.4 of the corpus was presented at the
_Congrès mondial de linguistique française_
in Orleans in July 2022, and the paper was published in the conference
proceedings \([Rainsford 2022](https://doi.org/10.1051/shsconf/202213802007)\).
The first complete version of the corpus was released in January 2025.

### Version history

+ 2 January 2025: Version 1.0 released and website updated.
+ 14 June 2022: Website updated to corpus version 0.4.
+ 18 March 2022: Version 0.4 released on GitHub, six further texts added.
+ 7 December 2021: Version 0.3 released. All formats fully implemented (TXM binary, relANNIS, PAULA-XML, TEI-P5).
License changed to CC BY-NC-SA 4.0.
+ 4 August 2021: Preview version 0.2 for TXM 0.8.1 and ANNIS 3.6 released. ANNIS portal online.
+ 8 June 2021: Preview version 0.1.4 for TXM 0.8.1 released.
+ 1 June 2021: Website online, preview version 0.1.3 for TXM released.

## Sources and bibliography

### Sources

+ The source texts are all in the public domain in the EU.
+ The normalized transcriptions, part-of-speech annotation and lemmatization in the following texts
were adapted from the [_Base de Français médiéval_](http://bfm.ens-lyon.fr):
_Serments_, _Eulalie_, _Alexis_, _Passion_, _SLeger_.
The re-use and re-distribution of this data in the OGR is in accordance with the provisions of the
[ETALAB](https://www.etalab.gouv.fr/licence-ouverte-open-licence) licence.
+ The transcriptions of _Alba_ and _PassAugsb_ are based on Frank and Hartmann (1997)
and have not been checked against the base manuscript. The transcription
of _ChansLas_ is based on Bischoff (1984) and has not been checked
against the base manuscript.
+ The transcription of _Jonas_, in particular the resolution of the Tironian notes
and the reconstruction of missing text, is based on De Poerck (1955).
+ A previous annotated version of the Boeci text was created in collaboration with Olga Scrivner
[(Rainsford and Scrivner 2014)](https://drive.google.com/file/d/1aAqLIcT3SyZ3_4fbTTAm7StcaQoRZDfh/view?usp=sharing).
+ All other transcriptions and annotations are my own original work, 
established on the basis of manuscript images and finalized in consultation
with the published material listed in the bibliography below.

### Bibliography

+ Avalle, D'Arco Silvio. 1962. _Cultura e lingua francese delle origini nella 'Passion’_. Milan: Ricciardi. (_Passion_)
+ Avalle, D'Arco Silvio. 1965. _Protostoria delle lingue romanze: dal dec. VII ai giuramenti di Strasburgo e con particolare riguardo al territorio gallo-romanzo_. Turino: Giappichelli. (_Serments_)
+ Avalle, D'Arco Silvio. 1967. _Monumenti prefranciani: il sermone di Valenciennes e il Sant Lethgier_. Turin: Giappichelli. (_Jonas_, _SLeger_)
+ Avalle, D'Arco Silvio, and Raffaello Monterosso, eds. 1965. _Sponsus: Dramma delle vergini prudenti e delle vergini stolte_. Milan: Ricciardi. (_Spons_, _PrDieu_, _PrVierge2_, _PrVierge3_)
+ Berschin, Helmut, Walter Berschin, and Rolf Schmidt. 1981. ‹Augsburger Passionslied›. Ein neuer romanischer Text des X. Jahrhunderts.
In _Lateinische Dichtungen des X. und XI. Jahrhunderts: Festgabe für Walther Bulst zum 80. Geburtstag_,
edited by Walther Bulst, Walter Berschin, and Reinhard Düchting, 251-79. Heidelberg: Schneider.
+ Bischoff, Bernhard, ed. 1984. _Anecdota Novissima: Texte des vierten bis sechzehnten Jahrhunderts_. Stuttgart: Hiersemann. (_ChansLas_)
+ Blumenthal, Peter, and Achim Stein, eds. 2002. _Tobler-Lommatzsch: Altfranzösisches Wörterbuch_. Stuttgart: Steiner.
+ Brunel, Clovis. 1926. _Les Plus Anciennes Chartes en langue provençale. Recueil des pièces originales antérieures au XIIIe siècle, publiées avec une étude morphologique_. Paris: A. Picard.
+ Brunel-Lobrichon, Geneviève. 2003. Le manuscrit du _Sponsus_ et ses poésies bilingues. Édition et traduction de deux poèmes à la Vierge (XIe siècle).
In _La tradition vive: mélanges d'histoire des textes en l'honneur de Louis Holtz_, edited by Pierre Lardet, 401-15. 
Turnhout: Brepols. (_PrDieu_, _PrVierge2_, _PrVierge3_)
+ De Poerck, Guy. 1955. Le sermon bilingue sur Jonas du ms. Valenciennes 521 (475). _Romanica Gandensia_ 4: 31-66. (_Jonas_).
+ De Poerck, Guy. 1963. Les plus anciens textes de la langue française comme témoins de l’époque. _Revue de Linguistique Romane_ 27: 1-34.
+ De Poerck, Guy. 1964. Le ms. Clermont-Ferrand 240 (anc. 189), les Scriptoria d'Auvergne et les origines spirituelles de la vie française de Saint Léger.
_Scriptorium_ 18: 11-33. (_Passion_, _SLeger_)
+ Foerster, Wendelin. 1879. Épitre farcie de la Saint-Étienne. En vieux français du XIIe siècle.
_Revue des langues romanes_ 16: 5-15. (_EpSEt_)
+ Frank, Barbara, and Jörg Hartmann, eds. 1997. _Inventaire systématique des premiers documents des langues romanes_.
5 vols. Tübingen: Narr.
+ Gersbach, M. 1965. Eine altfranzösische Formel zu einem Gottesurteil. _Vox Romanica_ 24: 64-75. (_EpreuveJudic_)
+ Guillot-Barbance, Céline, Serge Heiden, and Alexei Lavrentiev. 2017. Base de français médiéval :
une base de référence de sources médiévales ouverte et libre au service de la communauté scientifique. _Diachroniques_ 7: 168-84.
+ Hilty, Gerold. 1995. Les plus anciens monuments de la langue occitane. 
In _Cantarem d'aquestz trobadors: studi occitanici in onore di Giuseppe Tavani_, edited by Luciano Rossi and Giuseppe Tavani, 25-45. Alessandria: Edizioni dell'Orso.
+ Lafont, Robert, ed. 1998. _La Chanson de sainte Foi : texte occitan du XIe siècle_. Geneva: Droz. (_SFoi_)
+ Lazzerini, Lucia. 1986. À propos de l'aube de Fleury’. _Romania_ 107: 552–53. (_Alba_)
+ Lazzerini, Lucia. 1993. A proposito di due Liebesstrophen pretrobadoriche. _Cultura Neolatina_ 53: 123-34. (_ChansLas_)
+ Linskill, Joseph. 1937. _Saint Léger : étude de la langue du manuscrit de Clermont-Ferrand_. Paris: Droz. (_SLeger_)
+ Meneghetti, Maria Luisa. 1998. L'Alba di Fleury: un Osterlied. 
In _Miscellanea Mediaevalia: Mélanges Offerts à Philippe Ménard_, edited by Jean-Claude Faucon, 969-83. Paris: Champion. (_Alba_)
+ Mölk, Ulrich. 1996. Zwei Fragmente galloromanischer Weltlicher Lyrik des 11. Jahrhunderts.
In _Ensi firent li ancessor : mélanges de philologie médiévale offerts à Marc-René Jung_, edited
by Marc René Jung, Luciano Rossi, Christine Jacob-Hugon, and Ursula Bähler, 47-51. Alessandria: Edizioni dell'Orso. (_ChansLas_)
+ Mölk, Ulrich, and Günter Holtus. 1999. Alberics Alexanderfragment. Neuausgabe und Kommentar.
_Zeitschrift für romanische Philologie (ZrP)_ 115: 582-625. (_AlexAlb_)
+ Monaci, Ernesto, ed. 1910. _Facsimili di documenti per la storia delle lingue e delle letterature romanze_. Rome: Anderson.
+ Paden, William D. 2007. The language of the tenth‑century Occitan charms from Clermont‑Ferrand.
In _L'Art de la philologie : Mélanges en l'honneur de Leena Löfstedt_, edited
by Juhani Härmä, Elina Suomela-Härmä, and Olli Välikangas, 185-97. Helsinki: Société néophilologique. (_BenClerm_)
+ Rainsford, Thomas. 2022. _Old Gallo-Romance (OGR) Corpus_ :
annotation phonologique et métrique des plus anciens textes gallo-romans. 
_SHS Web of Conferences_ 138: 02007.
[https://doi.org/10.1051/shsconf/202213802007](https://doi.org/10.1051/shsconf/202213802007).
+ Rainsford, Thomas. 2024. Proclisis and enclisis in early Gallo-Romance:
evidence from sandhi phenomena. In
_Historical and Sociolinguistic Approaches to the French Language_, edited
by Janice Carruthers, Mairi McLaughlin, and Olivia Walsh, 25-48. Oxford: Oxford University Press.
[https://doi.org/10.1093/oso/9780192894366.003.0002](https://doi.org/10.1093/oso/9780192894366.003.0002).
+ Rainsford, Thomas, and Christiane Marchello-Nizia, eds. 2024. _Vie de Saint Alexis_. Lyon: ENS de Lyon. [http://catalog.bfm-corpus.org/AlexisRaM](http://catalog.bfm-corpus.org/AlexisRaM).
+ Rainsford, Thomas, and Olga Scrivner. 2014. Metrical Annotation for a Verse Treebank.
In _Proceedings of the Thirteenth International Workshop on Treebanks and Linguistic Theories (TLT13),_
edited by Verena Henrich, Erhard Hinrichs, Daniël de Kok, Petya Osenova, and Adam Przepiórkowski,
149-159. Tübingen: University of Tübingen. [http://dx.doi.org/10.18419/opus-15350](http://dx.doi.org/10.18419/opus-15350).
+ Storey, Christopher, ed. 1968. _La Vie de Saint Alexis: texte du manuscrit de Hildesheim (L)_. Paris: Minard. (_Alexis_)
+ Thomas, Antoine, ed. 1925. _La Chanson de Sainte Foi d'Agen : poème provençal du XIe siècle_. Paris: Champion. (_SFoi_)
+ Thomas, Lucien-Paul, ed. 1951. _Le 'Sponsus': (mystère des vierges sages et des vierges folles_. Paris: Pr. Univ. de France. (_Spons_)
+ Zufferey, François. 2007. Perspectives nouvelles sur l'Alexandre d’Auberi de Besançon.
_Zeitschrift für romanische Philologie (ZrP)_ 123: 385-418.
+ Zufferey, François. 2020. _La chanson de saint Alexis: essai d'édition critique de la version primitive, avec
apparat synoptique de tous les témoins_. Paris: Société des anciens textes français. (_Alexis_)
+ Zumthor, Paul. 1984. Un trompe‑l'œil Linguistique ? Le refrain de l'aube bilingue de Fleury. _Romania_ 105: 171-92. (_Alba_)

### Website

This website is hosted in the [bwCloud](https://www.bw-cloud.org/en/) and is built with 
[hugo](https://gohugo.io/) using the 
Whisper theme by [Rob Austin](https://www.zerostatic.io/).



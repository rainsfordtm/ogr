---
title: 'Presentation'
date: 2022-06-14
weight: 2
summary: Read about the corpus and why it was created
---

When complete, the Old Gallo-Romance (OGR) corpus will contain richly annotated versions of the
all texts preserved in Gallo-Romance manuscripts from before _c_ 1130. Since most of the texts
are well-known and excellent corpora of Old French (notably the _Base de français médiéval_ at
[bfm.ens-lyon.fr](http://bfm.ens-lyon.fr)) are already available, it's reasonable to ask: why do we
need this corpus too?

## Unique features of the OGR corpus

The OGR differs from existing corpora and indeed published editions in important ways.

### 1. Unified early Gallo-Romance 

The OGR corpus contains both Old French and Old Occitan texts. The textual record for the period in
question is extremely sparse, the texts do not clearly belong to a single literary tradition
and none of the them is written in the same Gallo-Romance variety.  More importantly, a number
of the texts from this period show effects of contact between northern and southern 
Gallo-Romance varieties, notably the [_Passion_ of Clermont](/docs/texts/#passion), or originate
from regions such as Poitou near the linguistic border between the northern and southern
Gallo-Romance areas. 

In short, the textual record for this early period does not neatly reflect a clear linguistic
division between the two areas, and as such a unified Gallo-Romance corpus provides a more
representative overview of the available data.

### 2. Manuscript oriented

The OGR corpus focuses on manuscripts, not texts. The only manuscripts included are those copied before
_c_ 1130, which provides a clear _terminus ad quem_ for any observed linguistic development,
since any possible modernization by later scribes is excluded. Furthermore, the OGR includes
a diplomatic edition of the text verified against photographs of the manuscript. The original
word division and manuscript abbreviations are recorded and corrections to the text are
avoided, except in the most obvious of cases, and even here they are clearly marked.

Some of this information is recoverable in critical editions --- although typically not the original
word division --- but is absent from most electronic corpora, which eliminate the critical
apparatus of the print edition and provide only the editor's normalized base text.

### 3. Fully lemmatized and morphologically annotated

The lemmatization and morphosyntactic annotation in the OGR corpus has been manually verified for
every text. As there is no shortage of detailed philological discussion
of these texts --- print critical editions typically include a fully glossed list of forms and
often a translation --- manual verification is informed by the philological tradition.

### 4. Phonologically and metrically annotated

Each text in the corpus is phonologically transcribed. The transcriptions are parsed into
syllables, and in the verse texts, each syllable is assigned a metrical position within the
line of verse, or is marked as elided.

While more speculative and informed by my own research interests, this annotation facilitates
research into the morphophonology of the texts.

## Research facilitated by the OGR corpus

The OGR corpus is designed primarily to facilitate research into the phonology, morphology,
and morphosyntax of early Gallo-Romance, in addition to the study of versification.

However, it is hoped that the lemmatization and morphosyntactic annotation will increase
the accessibility of these often difficult texts for researchers in all areas who wish to
explore early Gallo-Romance data in more detail.

The OGR corpus does not include treebank annotation and I do not envisage adding it in the near
future.
However, most of the northern Gallo-Romance texts were manually parsed during the SRCMF project and
are available to download at [srcmf.org](http://www.srcmf.org).

## Brief history of the OGR corpus

The OGR began life during my time as a postdoc on the SRCMF project at the ENS de Lyon,
where I was able to collaborate with Alexei Lavrentiev and Céline Barbance-Guillot
to produce new editions of the _Serments_ and _Eulalie_ texts. Subsequently,
Christiane Marchello-Nizia invited me to collaborate on the creation of a multi-facet edition
of the edition of the _Life of Saint Alexis_, which involved retranscribing and
reannotating the whole text. All of these editions are now also available in
the [_Base de français médiéval_](http://bfm.ens-lyon.fr).

As a British Academy Post-Doctoral Fellow at the University of Oxford, I continued to develop
the tools used to build the metrically and syntactically annotated corpus developed during 
[my doctoral thesis](https://dx.doi.org/10.17863/CAM.16503). 
These tools were used to produce an initial version of the _Boeci_ text, annotated both
metrically and syntactically in
[joint work with Olga Scrivner](https://drive.google.com/file/d/1aAqLIcT3SyZ3_4fbTTAm7StcaQoRZDfh/view?usp=sharing),
who also introduced me to the ANNIS software.

The phonological transcriptions were developed for 
[a paper published in 2020](https://dx.doi.org/10.2218/pihph.5.2020.4433) on the the 
syllable structure of Early Old French, and the [dataset](https://dx.doi.org/10.18710/XYMXPC), which
also includes a transcription of all the forms in the _Song of Roland_ , was published in
the TROLLing repository.

A preview version of the corpus (v0.1.3) was released on ogr-corpus.org in June 2021.
The corpus will be presented (in French) at the [Congrès mondial de linguistique française](https://cmlf2022.sciencesconf.org/)
in Orleans in July 2022.

---
title: 'Annotation 1: Overview'
date: 2024-12-17
weight: 10
summary: Read the documentation of the annotation scheme.
---

\[[next](/docs/annotation-segs)\]

\[[1. Units annotated](#1-units-annotated)\] \[[2. ANNIS and TXM versions](#2-annis-and-txm-versions)\]
\[[3. Text in other languages](#3-text-in-other-languages)\]

## 1. Units annotated

There are __four__ basic annotated units in the OGR:

+ __Segments__: A single phonological segment. See [Annotation 2: Segments](/docs/annotation-segs).
+ __Words__: A syntactically independent sequence of __Segments__. 
Clitics are treated as __Words__. See [Annotation 3: Words](/docs/annotation-word).
+ __Syllables__: Sequence of __Segments__ consisting minimally of a vocalic nucleus. 
Since __Words__ are syntactically rather than prosodically defined, a __Syllable__ can
contain more than one word.
See [Annotation 4: Syllables and meter](/docs/annotation-sylls).
+ __Lines__: Sequence of both __Words__ and __Syllables__ forming a line of verse.

Units larger than the __Word__ (e.g. _laisses_ or paragraphs, manuscript pagination) are 
encoded using TEI markup.

## 2. ANNIS and TXM versions

Annotation differs between the [ANNIS and TXM versions](/docs/download). 

+ __ANNIS__ supports multiple layers of tokenization and all units are represented as separate spans.
+ __TXM__ supports only word-level tokenization and all annotation is (as far as possible) realized as word-level tags. 

This annotation guide refers to the ANNIS version unless otherwise specified.

## 3. Text in other languages

Passages which are not written in Gallo-Romance, most of which are in
Latin, are not annotated, with the following exceptions:

+ All __Words__ in verse texts are phonologically and metrically annotated.
A simplified transcription is used for Latin words.
+ Borrowed __Words__ within clauses written in Romance are pos-tagged
and lemmatized.
+ In _Jonas_, some __Words__ written in shorthand are transcribed in
Latin orthography but interpreted as Romance words. These are pos-tagged
and lemmatized as if they were Romance terms.

\[[next](/docs/annotation-segs)\]


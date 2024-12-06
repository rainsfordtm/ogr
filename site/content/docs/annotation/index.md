---
title: 'Annotation 1: Overview'
date: 2021-07-29
weight: 3
summary: Read the documentation of the annotation scheme.
---

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

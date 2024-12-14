---
title: 'Corpus'
date: 2024-12-14
weight: 2
summary: Access the corpus
---

## Quick links

+ [__ANNIS web interface.__](http://www.ogr-corpus.org/annis-gui-3.6.0)
+ [Download latest release from GitHub](https://github.com/rainsfordtm/ogr/releases)

## 1. ANNIS web interface

__Recommended for phonological/metrical queries referencing segments and syllables.__

[__Click here to start ANNIS web.__](http://www.ogr-corpus.org/annis-gui-3.6.0)

### 1.1 Access

There are __two__ similar version of the corpus in the portal (see also [Annotation 4: Syllables and Meter](/docs/annotation-sylls)):
+ __ogr040__: standard version with all texts but without extra metrical annotation for verse.
+ __ogrsv040__: syllabic verse texts only with extra metrical annotation.

### 1.2 Tips

A __video tutorial__ for the ANNIS portal is in preparation. In the meantime, here are some __tips__ to get you started with
the corpus:

+ The __query syntax__ is explained in the online help in the portal and in the [ANNIS User Guide](http://korpling.github.io/ANNIS/3.6/user-guide/index.html).
+ The __corpus annotation__ is documented in the [Annotation pages](/docs/annotation) on this site. 
+ __Sample queries__ are provided in the portal.

Among the __less obvious features__ of ANNIS are:
+ "More>Frequency Analysis". A highly customizable interface for the __quantitative analysis__ of any property of the
results identified by a query.
+ "Document Browser". Click on the document icon next to the corpus to view __normalized and diplomatic versions__ of the
texts.

## 2. TXM desktop

__Recommended for simpler, non-phonological queries__

[__Click here to download corpus.__](https://github.com/rainsfordtm/ogr/releases/download/ogr040/ogr040-txm.zip)

### 2.1 Installation

1. Download and install TXM 0.8.1 from 
[https://txm.gitpages.huma-num.fr/textometrie/index.html.](https://txm.gitpages.huma-num.fr/textometrie/index.html)
1. Unzip the `ogr040-txm.zip` archive to any location on your computer.
1. In TXM, select `File > Load` and load the file `OGR040.txm` contained in the .zip.

### 2.2 Tips

By default, the concordance and index will show a basic normalized form of each word.
This can be changed to the diplomatic form by setting the concordance to display
`dipl` rather than `word` as the basic form.

A diplomatic edition is also included. This can be enabled by selecting `dipl` as
well as or instead of `default` in the bottom left of the edition window.

You can try out some of the sample queries [given here](/docs/sample-queries).

### 2.3 Technical note

The TXM binary, including the HTML edition of the corpus, is generated from the TEI P5
sources by adding the files in [this zip archive](https://github.com/rainsfordtm/ogr/releases/download/ogr040/ogr040-txm-import.zip) to the
folder containing the TEI XML files and running TXM's "XML Zero + CSV" import.

## 3. ANNIS offline

[__Click here to download corpus.__](https://github.com/rainsfordtm/ogr/releases/download/ogr040/ogr040-annis.zip)

If you need to use the corpus offline, you can also --- with a little effort --- install ANNIS locally.

1. Download and install PostgreSQL and ANNIS Kickstarter 3.6 following the instructions in the [ANNIS User Guide](http://korpling.github.io/ANNIS/3.6/user-guide/installation-kickstarter.html).
1. Unzip the `ogr040-annis.zip` archive to any location on your computer.
1. In ANNIS Kickstarter, click "Import Corpus" and the folder `relANNIS/ogr040`. Repeat for `relANNIS/ogrsv040`.
1. Click "Launch ANNIS frontend".

## 4. TEI P5

[__Click here to download corpus.__](https://github.com/rainsfordtm/ogr/releases/download/ogr040/ogr040-tei.zip)

The TEI P5 archive encodes each text and all annotation in a single TEI-compliant XML
file. __Lines__, __Words__ and __Segments__ are encoded inline while __Syllables__ are
encoded in standoff.

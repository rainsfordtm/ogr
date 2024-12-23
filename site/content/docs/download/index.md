---
title: 'Corpus'
date: 2024-12-17
weight: 3
summary: Access the corpus
---

Quick access the corpus:

+ [Web interface (ANNIS)](http://www.ogr-corpus.org:5712)
+ [Download](https://github.com/rainsfordtm/ogr/releases)

Read more about the different versions:

+ [1. ANNIS web](#1-annis-web) for all types of queries online
+ [2. TXM](#2-txm) for non-phonological queries in a simpler interface
+ [3. ANNIS offline](#3-annis-offline) for all types of queries offline
+ [4. XML-TEI P5](#4-xml-tei-p5) if you want to use your own tools

## 1. ANNIS web

__Recommended for phonological/metrical queries referencing segments and syllables.__

[__Click here to start ANNIS web.__](http://www.ogr-corpus.org:5712)

### 1.1 Access

There are __two__ similar version of the corpus in the portal (see also [Annotation 4: Syllables and Meter](/docs/annotation-sylls)):
+ __ogr100__: standard version with all texts but without extra metrical annotation for verse.
+ __ogrsv100__: syllabic verse texts only with extra metrical annotation.

### 1.2 Tips

A __video tutorial__ for the ANNIS portal is in preparation. In the meantime, here are some __tips__ to get you started with
the corpus:

+ The __query syntax__ is explained in the online help in the portal and in the [ANNIS User Guide](https://korpling.github.io/ANNIS/4/user-guide/).
+ The __corpus annotation__ is documented in the [Annotation pages](/docs/annotation) on this site. 
+ __Sample queries__ are provided in the portal.

Among the __less obvious features__ of ANNIS are:
+ "More>Frequency Analysis". A highly customizable interface for the __quantitative analysis__ of any property of the
results identified by a query.
+ "Document Browser". Click on the document icon next to the corpus to view __normalized and diplomatic versions__ of the
texts.

## 2. TXM

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

If you need to use the corpus offline, you can install ANNIS locally. 
__With the release of ANNIS 4, this is now really easy!__

1. Follow the instructions [here](https://korpling.github.io/ANNIS/4/user-guide/installation/desktop.html)
to download and run the java app. The app should open automatically in
your web browser at `localhost:5712`
1. Unzip the `ogr100-annis.zip` archive to any location on your computer.
1. In the web app, click on `Administration > Import Corpus` and load the folder `ogr100/relANNIS.zip`. Repeat for `ogrsv100/relANNIS.zip`.

## 4. XML-TEI P5

[__Click here to download corpus.__](https://github.com/rainsfordtm/ogr/releases/download/ogr040/ogr040-tei.zip)

The TEI P5 archive encodes each text and all annotation in a single TEI-compliant XML
file. __Lines__, __Words__ and __Segments__ are encoded inline while __Syllables__ are
encoded in standoff.

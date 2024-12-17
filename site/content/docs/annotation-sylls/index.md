---
title: 'Annotation 4: Syllables and Meter'
date: 2024-12-17
weight: 13
summary: Syllable-level and metrical annotation
---

\[[previous](/docs/annotation-word)\] \[[next](/docs/sample-queries)\]

\[[1. Verse and prose](#1-verse-and-prose)\]
\[[2. Annotation available in all texts](#1-annotation-available-in-all-texts)\]
\[[3. Metrical annotation in the OGRSV](#3-metrical-annotation-in-the-ogrsv)\]
\[[4. The TXM version](#4-the-txm-version)\]

_Annotation only available in ANNIS. For the TXM version, see [section 4 below](#4-the-txm-version)._ 

## 1. Verse and prose

The OGR corpus contains both verse and prose texts. While all texts contain syllables (and, to an extent, lines)
__metrical annotation__ is only found in syllabic verse texts.

The OGR corpus is available in two versions:
+ __ogr__: standard version with all texts but without extra metrical annotation for verse.
+ __ogrsv__ (OGR **s**yllabic **v**erse): syllabic verse texts only with extra metrical annotation.

## 2. Annotation available in all texts

### 2.1 Syllables

__Syllables__ (`syll`) are sequences of __Segments__.  They are further subdivided into Onset, Nucleus
and Coda. This subdivision is given by the `onc` annotation, which has the values `O`, `N` or `C`.

+ `syll_lstress`: indicates whether the syllable bears a lexical stress.
The primary stressed syllable in a polysyllable and monosyllabic prosodic words are both tagged
`y` (yes); all other syllables are tagged `n` (no).

### 2.2 Lines

__Lines__ (`line`) are sequences both of __Words__ and __Segments__ and have two primary roles in the OGR:

+ In verse texts, a __Line__ always corresponds to a line of verse.
+ In all texts, the `line_ref` annotation contains a citable reference to the text. In verse texts
it indicates the line of verse; in prose texts the page, column, and manuscript line. __Words__
broken across two lines in the manuscript are fully included within the __Line__ in which they begin.

## 3. Metrical annotation in OGRSV

In the OGRSV corpus, the lines of verse are scanned. __Syllables__ are annotated according to their
metrical position and __Lines__ are annotated according to number of syllables and the nature of the
cesura and the rhyme. Additionally, a tree-based representation of the metrical structure is available.

### 3.1 syll_metpos

A five-character string giving the metrical position of the syllable in the line.
+ characters __1 and 2__: metrical position counting from left to right, e.g. `01`, `02`, ... `10`.
Elided or uncounted syllables are annotated `--`.
+ characters __3 and 4__: metrical position counting from right to left, e.g. `10`, `09`, ... `01`.
Elided or uncounted syllables are annotated `--`.
+ character __5__: indicates if the syllable is at the cæsura (`c`) or the rhyme (`r`), or neither (`-`).
Note that the `c` and `r` annotations are found both on the tonic and on any following uncounted syllables.

With a simple regex, `syll_metpos` can easily be used to find key syllables in the line, e.g.
+ tonic syllable at the rhyme: `syll_metpos=/..01r/`
+ first syllable of an octosyllabic line: `syll_metpos=/0108./`
+ elided/uncounted syllable: `syll_metpos=/----./`
+ elided syllable after the cæsura: `syll_metpos="----c"`

### 3.2 line_met

A five-character string summarizing the key metrical properties of the line.
+ characters __1 and 2__: Number of syllables in the scanned line, e.g. `08`, `10`. If the line is irregular and could not
be scanned, this will give the actual number of syllables in the line rather than the target length.
+ character __3__: nature of the rhyme: __m__asculine, __f__eminine, or `-` for irregular lines.
+ character __4__: nature of the cæsura: __n__ormal (stress, word boundary), __e__pic (stress, uncounted
post-tonic syllables), __l__yric (no stress, word boundary), or `-` for irregular lines.
+ character __5__: cæsura position, e.g. `4`, or `-` for irregular lines. Note that the scanner only checks for cæsura in
standard positions, so for a decasyllable the cæsura will be either `4` or `-`.

`line_met` can be queried with a simple regex, e.g.:
+ decasyllable with epic cæsura: `line_met=/10.e./`
+ octosyllable with feminine rhyme: `line_met=/08f../`

There is also a `line_correct` tag, with values `True` if the line could be scanned and `False` if not.

### 3.3 The metrical tree

The OGRSV corpus contains an alternative tree visualization of the metrical structure which can be queried
like a syntax tree using hierarchical operators (`>`, `>*`, etc.). In addition to the __Line__,
__Syllable__, __ONC__, and __Segment__ layers, the tree also contains a halfline and an extra 
subdivision of the syllable into Onset and Rhyme. The units in the tree can be queried using the
following `cat` properties:
+ `cat="line"`: a line
+ `cat="hl"`: a halfline/hemistich
+ `cat="sy"`: a counted syllable
+ `cat="el"`: an elided syllable
+ `cat="On"`: a syllable onset (Onset--Rhyme layer)
+ `cat="Rhy"`: syllable rhyme
+ `cat="O"`: syllable onset
+ `cat="N"`: syllable nucleus
+ `cat="C"`: syllable coda

## 4. The TXM version

A reduced form of this annotation is given in word-level tags in the TXM version.

### 4.1. ref

`ref` gives a citable reference for each word in the text (cf. `line_ref` above). It appears by default in the left-hand
column of the concordance.

### 4.2 syllabified

A string representing the syllabification of the word. __Segments__ are transcribed using the phonemic
symbol (see [Segment-level annotation](/docs/annotation-segs)). For example, in the string
`ʤ/y\S.'t/i\.z/(ə)\`:
+ the dot `.` separates syllables;
+ the fore- and backslashes `/...\` delimit the nucleus;
+ the straight single quote `'` before a syllable denotes primary stress.

Additional markup, such as the parentheses around the nucleus `(...)`, exist to provide information
to the scansion algorithm: in this case, that the vowel is elidable.

### 4.3 prosody

A three-character string representing the prosody of the word.
+ The first character is the number of syllables.
+ The final two characters give the stress pattern, which is either:
	+ `cl`: a clitic
	+ `ox`: an oxytone, i.e. stressed on the final syllable
	+ `po`: a paroxytone, i.e. stressed on the penultimate syllable
	+ `pp`: a proparoxytone, i.e. stressed on the antepenultimate syllable

For example for _parler_ `prosody="2ox"` (a two-syllable oxytone), for 
_femme_ `prosody="2po"` (a two-syllable paroxytone) and for _le_ `prosody="1cl"`
(a monosyllabic clitic).

### 4.4 line_met

See [section 3.2 above](#32-line_met).

### 4.5 metpos and soptem

A string representing the metrical position of all the syllables in the word. The
principle is similar to [`syll_metpos`](#31-syll_metpos) but applied to the whole word.
+ The metrical position of each syllable is represented by two digits
	+ `metpos` counts forwards from the start of the line, `soptem` backwards from the end of the line. 
+ Different metrical positions are separated by dots
+ The final character of the string is either `r` (rhyme), `c` (caesura) or `-` (neither)

For example, the word _ancienur_ (_Alexis_, l. 1) occupies the last four metrical positions
of a decasyllabic line. It therefore has `metpos="07.08.09.10.r"` and `soptem="04.03.02.01.r`.

__Tip__: `soptem` is `metpos` backwards, to help remember which is which!

\[[previous](/docs/annotation-word)\] \[[next](/docs/sample-queries)\]

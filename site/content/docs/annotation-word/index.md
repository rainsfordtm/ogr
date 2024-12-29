---
title: 'Annotation 3: Words'
date: 2024-12-17
weight: 12
summary: Word-level annotation.
---

\[[previous](/docs/annotation-segs)\] \[[next](/docs/annotation-sylls)\]

\[[1. Tokenization](#1-tokenization)\]
\[[2. Summary of annotation](#2-summary-of-annotation)\]
\[[3. Graphical properties](#3-graphical-properties)\]
\[[4. Morphosyntactic properties](#4-morphosyntactic-properties)\]
\[[5. Lemmatization](#5-lemmatization)\]

## 1. Tokenization

__Words__ in the OGR are defined as minimal syntactically independent units
and tokenization is standardized across the corpus texts. Note in particular
that all clitics, including consonantal enclitics such as _l_ in _del_ or
_al_, are considered separated tokens. The normalized text view shows
all tokens separated by spaces; modernized punctuation (apostrophes, middle points,
etc.) is not used.

## 2. Summary of Annotation

Most annotation in the OGR is attached to the __Word__ and is available in all versions of the corpus.

Four broad categories of annotation can be distinguished:
+ __Graphical properties__: normalized and diplomatic form, manuscript word division.
+ __Morphosyntactic properties__: part-of-speech tag and inflectional morphology.
+ __Lemmatization__: lemma(s) and their source
+ Simplified annotation of other units for the TXM version.

| Type | Tag | Description | Link |
| --- | --- | --- | --- |
| graphical | `word` | normalized form | [below](#3-graphical-properties) |
| graphical | `dipl` | diplomatic transcription | [below](#3-graphical-properties) |
| graphical | `wd_div` | manuscript word division _following_ the token | [below](#3-graphical-properties) |
| language | `lang` | language of the token | below |
| morphosyntactic | `pos` | base part-of-speech tag | [below](#4-morphosyntactic-properties) |
| morphosyntactic | `morph` | inflection | [below](#4-morphosyntactic-properties) |
| lemmatization | `lemma` | lemma from any available source | [below](#5-lemmatization) |
| lemmatization | `lemma_src` | source of lemma | [below](#5-lemmatization) |
| lemmatization | `lemma_dmf` | DMF/ATILF lemma, if available | [below](#5-lemmatization) |
| phonological (TXM) | `phon` | string of `seg_phonemes` in word | [Segment annotation](/docs/annotation-segs) |
| phonological (TXM) | `syllabified` | string of `seg_phonemes` with syllable structure markup | [Metrical annotation](/docs/annotation-sylls#4-the-txm-version) |
| metrical (TXM) | `prosody` | stress pattern | [Metrical annotation](/docs/annotation-sylls#4-the-txm-version) |
| metrical (TXM) | `line_met` | metre of the line (`line_met`) | [Metrical annotation](/docs/annotation-sylls#4-the-txm-version) |
| metrical (TXM) | `metpos` | metrical position of syllables, counting forwards | [Metrical annotation](/docs/annotation-sylls#4-the-txm-version) |
| metrical (TXM) | `soptem` | metrical position of syllables, counting backwards | [Metrical annotation](/docs/annotation-sylls#4-the-txm-version) |
| other (TXM) | `ref` | citable reference (`line_ref`) | [Metrical annotation](/docs/annotation-sylls4-the-txm-version) |

## 3. Graphical properties

### word

A normalized graphical form of the word similar to that found in a print edition,
but without apostrophes or diacritics (except, at present, in _Alexis_).

### dipl and wd_div

`dipl` and `wd_div` provide the diplomatic transcription of the text.
`dipl` indicates the diplomatic form of the token and `wd_div` the type of word
division, including punctuation, which follows it.

Resolved abbreviations are given in `[square brackets]`.
Superfluous letters are given between `(parentheses)`.
Rare cases of editorial correction are given in the following format: `word[=corrected]`.

The following special characters are used to denote manuscript word division:
+ `+` agglutination to following word
+ `_` space
+ `|` line break

## 4. Morphosyntactic properties

### pos

This part-of-speech tag is based on the the CATTEX-09 tagging system used in the by the 
_Base de français médiéval_. 

#### PRO > PRC, PRN

The OGR tagset introduces a distinction between __clitics__, i.e. atonic object pronouns
before the finite verb and all object pronouns after a clause-initial finite verb, and
__strong pronouns__, e.g. nominative (subject) pronouns and disjunctive oblique pronouns.

| Cattex | OGR |
| --- | --- |
| `PROadv` | `PRCadv` _i_ and _en_, always clitic |
| `PROper` | `PRCper` clitic personal pronoun, `PRNper` strong personal pronoun |
| `PROdem` | `PRCdem` southern GR clitic _o_, `PRNdem` other demonstratives |
| others (`PROrel`, `PROind`, `PROint`, ...) | `PRNrel`, `PRNind`, `PRNint` ... |

### morph

This specifies the flexional morphology of a form and is based on the __Cattex-max__
tagset proposed, but not implemented, by the BFM team. The following grammatical categories
are marked:

+ nominals without person: number-gender-case
+ nominals with person (`*pos`, `*per`): person-number-gender-case
+ conjugated verb: mood-tense-person
+ past participles (`VERppe`): number-gender-case

The grammatical categories are annotated in the following way:
+ number (1 character): __s__ (singular) or __p__ (plural)
+ gender (1): __m__ (masculine), __f__ (feminine) or __n__ (neuter)
+ case (1): __n__ (nominative) or __r__ (oblique). For third-person clitic personal pronouns, __a__ (accusative/COD) or __i__ (dative, COI) 
+ person (1): __1-6__ (not __1s__, __1p__, etc.)
+ mood (3): __ind__ (indicative), __sub__ (subjunctive), __imp__ (imperative), __con__ (conditional)
+ tense (3): __pst__ (present), __psp__ (preterite), __pqp__ ( < Latin simple pluperfect), __ipf__ (imperfect), __fut__ (future)

## 5. Lemmatization

`lemma` contains a lemma form from the dictionary listed in `lemma_src`.
Where multiple lemmas are distinguished in the dictionary by a trailing number,
e.g. _ne1_, _ne2_, only numbers greater than 1 are included, i.e. DMF _ne1_ becomes simply
_ne_.

`lemma` is provided for every word, but forms are not always drawn from the same dictionary.
In particular, the base dictionaries for northern and southern Gallo-Romance are different.
`lemma` should therefore be queried in conjunction with `lemma_src`, which has the following
main values:
+ `DMF`: _Dictionnaire de moyen français_ ([http://www.atilf.fr/dmf](http://www.atilf.fr/dmf)). Preferred dictionary for northern Gallo-Romance texts.
+ `DOM`: _Dictionnaire de l'occitan médiéval_ ([http://www.dom-en-ligne.de/](http://www.dom-en-ligne.de/)). Preferred dictionary for southern Gallo-Romance texts.
    + Acute and grave accents are used to distinguish mid-open and mid-close vowels, e.g. _éis_ for DOM _ẹis_; equally capital _N_ replaces DOM _ṉ_.
+ `wikipedia.fr`: Preferred source for French proper nouns.
+ `oc.wikipedia.org`: Preferred source for Occitan proper nouns.
+ `wiktionary`: Preferred source for Latin lemmas.

`TL` denotes a lemma from the Tobler-Lommatzsch dictionary and `AND`
a lemma from the Anglo-Norman Dictionary.

`lemma_dmf` gives DMF lemmas for all texts, including southern Gallo-Romance. 
Where the word or its cognate is not found in the DMF, `lemma_dmf` is left blank.

\[[previous](/docs/annotation-segs)\] \[[next](/docs/annotation-sylls)\]

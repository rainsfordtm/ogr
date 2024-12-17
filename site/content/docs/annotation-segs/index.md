---
title: 'Annotation 2: Segments'
date: 2024-12-17
weight: 11
summary: Segment-level annotation.
---

\[[previous](/docs/annotation)\] \[[next](/docs/annotation-word)\]

\[[1. Basis of the reconstruction](#1-basis-of-the-reconstruction)\]
\[[2. Symbols and features](#2-symbols-and-features)\]

## 1. Basis of the reconstruction 

The smallest unit of tokenization in the OGR is the __Segment__ (`seg`). The __Segments__ are _not_ intended to provide
a phonetic transcription of the text but instead a consistent and phonemically-informed interpretation 
of the spelling, which in these early texts is broadly phonemic. The segmental annotation respects the following
principles:
1. Each __Segment__ is represented by at least one character in the text, i.e. there are no unwritten __Segments__.
2. There are no unpronounced characters, with the exception of those within digraphs and Latin initial _h_.
4. Each __Segment__ is maximally underspecified. In all contexts in which a particular phonological feature is 
non-distinctive (e.g. obstruent voicing in word-final position), it is left underspecified in the annotation.
This also applies where the precise phonetic value of a __Segment__ is 
uncertain (e.g. in Latinate loanwords or proper names).
3. This notwithstanding, where phonological features are distinctive, this is reflected in the
__Segment__ annotation even if it is not shown in the spelling. E.g. the letter _e_ in tonic syllables
may be transcribed /e/, /ɛ/, or /æ/. 
5. Although the phonemic symbols have a standard value (see below) the __Segment__ annotation is not standardized
across the corpus. The same word may be transcribed differently in different texts to reflect graphical and
phonological differences.

More extensive documentation of the segmental annotation will be found in published scientific presentations of the
corpus.

## 2. Symbols and features

__Segment__-level annotation is contained in three core tags:
+ `seg_plus` and `seg_minus`: two comma-separated lists of alphabetically-ordered phonological features, which are specified as
"+" or "-" respectively for the __Segment__. The more features included on these lists, the more specified the segment.
+ `seg_phoneme`: a user-friendly symbol denoting a particular matrix of phonological features. IPA symbols are generally
used with their standard value. Underspecified segments are represented by non-IPA symbols or capitals.

It is recommended to use the `seg_plus` and `seg_minus` tags when searching for classes of sounds rather than
attempting to list possible `seg_phonemes`, e.g.
+ Find all vowels and glides: `seg_minus=/.*cons.*/`
+ Find all coda nasals: `onc="C" _i_ seg_plus=/.*nas.*/`
+ Find all word-final obstruents: `word _r_ seg_minus=/.*son.*/`
+ Find all word-final coronal stops: `seg_plus=/.*CORONAL.*/ _=_ seg_minus=/.*cont,.*son,.*strident.*/ & word _r_ #1`

In the __TXM__ version of the corpus, __Segment__-level annotation is available through the word-level `phon`
tag, which concatenates all the `seg_phonemes` in the word as a single string. The features in `seg_plus` and
`seg_minus` are not available.

### 2.1 Vowels and glides

|Symbol|IPA|cons|son|nas|LABIAL|round|DORSAL|high|low|back|atr|voice|
|---   |---|--- |---|---|---   |---  |---   |--- |---|--- |---|---  |
|V||-|+||||||||||
|U||-|+|-|+|+|+|+|-||+|+|
|O||-|+|-|+|+|+||-|+||+|
|u|u,w|-|+|-|+|+|+|+|-|+|+|+|
|o|o,u|-|+|-|+|+|+||-|+|+|+|
|ɔ|ɔ|-|+|-|+|+|+|-|-|+|-|+|
|y|y|-|+|-|+|+|+|+|-|-|+|+|
|i|i,j|-|+|-|||+|+|-|-|+|+|
|Æ||-|+|-|||+|-||-||+|
|E||-|+|-|||+|-|-|-||+|
|e|e|-|+|-|||+|-|-|-|+|+|
|ɛ|ɛ|-|+|-|||+|-|-|-|-|+|
|ə|ə|-|+|-|||+|||||+|
|A||-|+|-|||+|-|+|-||+|
|a|a|-|+|-|||+|-|+|-|-|+|
|æ|æ|-|+|-|||+|-|+|-|+|+|

### 2.2 Consonants
| Symbol | IPA | cons | son | cont | strident | lat | nas | LABIAL | CORONAL | ant | dist | DORSAL | back | LARYNGEAL | voice |
|---     |---  |---   |---  |---   |---       |---  |---  |---     |---      |---  |---   |---     | ---  | ---       | ---   |
| C | C | + |  |  |  |  |  |  |  |  |  |  |  |  |  |
| h | h | + | - |  |  | - | - |  |  |  |  |  |  | + | - |
| Z |  | + | - |  |  | - | - |  | + |  |  |  |  |  |  |
| D |  | + | - |  | - | - | - |  | + | + |  |  |  |  |  |
| T |  | + | - | - | - | - | - |  | + | + |  |  |  |  |  |
| t | t | + | - | - | - | - | - |  | + | + |  |  |  |  | - |
| d | d | + | - | - | - | - | - |  | + | + |  |  |  |  | + |
| Ç |  | + | - | - | + | - | - |  | + | + | - |  |  |  |  |
| ʦ | ʦ | + | - | - | + | - | - |  | + | + | - |  |  |  | - |
| ʣ | ʣ | + | - | - | + | - | - |  | + | + | - |  |  |  | + |
| Č |  | + | - | - | + | - | - |  | + | - | + |  |  |  |  |
| ʧ | ʧ | + | - | - | + | - | - |  | + | - | + |  |  |  | - |
| ʤ | ʤ | + | - | - | + | - | - |  | + | - | + |  |  |  | + |
| S |  | + | - | + | + | - | - |  | + | + | - |  |  |  |  |
| s | s | + | - | + | + | - | - |  | + | + | - |  |  |  | - |
| z | z | + | - | + | + | - | - |  | + | + | - |  |  |  | + |
| ð | ð,θ | + | - | + | - | - | - |  | + | + | + |  |  |  |  |
| G |  | + | - |  | - | - | - |  |  |  |  | + | + |  |  |
| K |  | + | - | - | - | - | - |  |  |  |  | + | + |  |  |
| k | k | + | - | - | - | - | - |  |  |  |  | + | + |  | - |
| g | g | + | - | - | - | - | - |  |  |  |  | + | + |  | + |
| ɣ | ɣ | + | - | + | - | - | - |  |  |  |  | + | + |  | + |
| Ċ			|		| +		| -		| -		|			| -		| -		|			|			|		|		| +			|		|			|		|
| ċ			|		| +		| -		| -		|			| -		| -		|			|			|		|		| +			|		|			| -		|
| ġ			|		| +		| -		| -		|			| -		| -		|			|			|		|		| +			|		|			| +		|
| B |  | + | - |  |  | - | - | + |  |  |  |  |  |  |  |
| P |  | + | - | - | - | - | - | + |  |  |  |  |  |  |  |
| p | p | + | - | - | - | - | - | + |  |  |  |  |  |  | - |
| b | b | + | - | - | - | - | - | + |  |  |  |  |  |  | + |
| F |  | + | - | + | + | - | - | + |  |  |  |  |  |  |  |
| f | f | + | - | + | + | - | - | + |  |  |  |  |  |  | - |
| v | v | + | - | + | + | - | - | + |  |  |  |  |  |  | + |
| ß | ß | + | - | + | - | - | - | + |  |  |  |  |  |  |  |
| N |  | + | + | - |  | - | + |  |  |  |  |  |  |  | + |
| n | n | + | + | - |  | - | + |  | + | + |  |  |  |  | + |
| ɲ | ɲ | + | + | - |  | - | + |  |  |  |  | + | - |  | + |
| m | m | + | + | - |  | - | + | + |  |  |  |  |  |  | + |
| L |  | + | + | - |  | + | - |  |  |  |  |  |  |  | + |
| l | l | + | + | - |  | + | - |  | + | + |  |  |  |  | + |
| ʎ | ʎ | + | + | - |  | + | - |  |  |  |  | + | - |  | + |
| r | r | + | + | + |  | - | - |  | + |  |  |  |  |  | + |

\[[previous](/docs/annotation)\] \[[next](/docs/annotation-word)\]

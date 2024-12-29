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

__Segment__-level annotation is contained in four core tags:
+ `seg_plus` and `seg_minus`: two comma-separated lists of alphabetically-ordered phonological features, which are specified as
"+" or "-" respectively for the __Segment__. The more features included on these lists, the more specified the segment.
+ `seg_phoneme`: a character denoting a particular matrix of phonological features. IPA characters are generally
used with their standard value. Underspecified segments are represented by non-IPA characters or capitals.
+ `seg_matches`: a string of all the characters that match the matrix of phonological features. For
example, the palatal nasal stop "ɲ" also matches the underspecified characters "N" (nasal consonant) and
"C" (consonant). The `seg_matches` string is therefore `CNɲ`. In practical terms, this means that the
query `seg_matches=/.*N.*/` will match all nasal consonants.

When searching for classes of sounds, use the either `seg_plus` and `seg_minus` or `seg_matches` tags, e.g.:
+ Find all vowels and glides:
	+ `seg_minus=/.*cons.*/` 
	+ OR `seg_matches=/.*V.*/`
+ Find all coda nasals:
	+ `onc="C" _i_ seg_plus=/.*nas.*/`
	+ OR  `onc="C" _i_ seg_matches=/.*N.*/`
+ Find all word-final obstruents:
	+ `word _r_ seg_minus=/.*son.*/`
	+ OR `word _r_ seg_matches=/.*Q.*/`
+ Find all word-final coronal stops:
	+ `seg_plus=/.*CORONAL.*/ _=_ seg_minus=/.*cont,.*son,.*strident.*/ & word _r_ #1`
	+ OR `word _r_ seg_matches=/.*T.*/`

In the __TXM__ version of the corpus, __Segment__-level annotation is available through the word-level `phon`
tag, which concatenates all the `seg_phonemes` in the word as a single string. The `seg_plus`, 
`seg_minus` and `seg_matches` tags are not available.

### 2.1 Vowels and glides

|Symbol|Type|cons|son|nas|LABIAL|round|DORSAL|high|low|back|atr|voice|
|---   |---|--- |---|---|---   |---  |---   |--- |---|--- |---|---  |
|V|vowel|-|+||||||||||
|U|u,y|-|+|-|+|+|+|+|-||+|+|
|O|back|-|+|-|+|+|+||-|+||+|
|u|u,w|-|+|-|+|+|+|+|-|+|+|+|
|o|o,u|-|+|-|+|+|+||-|+|+|+|
|ɔ|ɔ|-|+|-|+|+|+|-|-|+|-|+|
|y|y|-|+|-|+|+|+|+|-|-|+|+|
|i|i,j|-|+|-|||+|+|-|-|+|+|
|Æ|front (not i)|-|+|-|||+|-||-||+|
|E|e,ɛ[^1]|-|+|-|||+|-|-|-||+|
|e|e|-|+|-|||+|-|-|-|+|+|
|ɛ|ɛ|-|+|-|||+|-|-|-|-|+|
|ə|ə|-|+|-|||+|||||+|
|A|a,æ|-|+|-|||+|-|+|-||+|
|a|a|-|+|-|||+|-|+|-|-|+|
|æ|æ|-|+|-|||+|-|+|-|+|+|

### 2.2 Consonants
| Symbol | Type | cons | son | cont | strident | lat | nas | LABIAL | CORONAL | ant | dist | DORSAL | back | LARYNGEAL | voice |
|---     |---   |---   |---  |---   |---       |---  |---  |---     |---      |---  |---   |---     | ---  | ---       | ---   |
| C | consonant | + |  |  |  |  |  |  |  |  |  |  |  |  |  |
| Q[^2] | obstruent | + | - |  |  | - | - |  |  |  |  |  |  |  |  |
| h | h | + | - |  |  | - | - |  |  |  |  |  |  | + | - |
| Z | coronal | + | - |  |  | - | - |  | + |  |  |  |  |  |  |
| D | t,d,ð,θ | + | - |  | - | - | - |  | + | + |  |  |  |  |  |
| T | t,d | + | - | - | - | - | - |  | + | + |  |  |  |  |  |
| t | t | + | - | - | - | - | - |  | + | + |  |  |  |  | - |
| d | d | + | - | - | - | - | - |  | + | + |  |  |  |  | + |
| Ç | ʦ,ʣ | + | - | - | + | - | - |  | + | + | - |  |  |  |  |
| ʦ | ʦ | + | - | - | + | - | - |  | + | + | - |  |  |  | - |
| ʣ | ʣ | + | - | - | + | - | - |  | + | + | - |  |  |  | + |
| Č | ʧ,ʤ | + | - | - | + | - | - |  | + | - | + |  |  |  |  |
| ʧ | ʧ | + | - | - | + | - | - |  | + | - | + |  |  |  | - |
| ʤ | ʤ | + | - | - | + | - | - |  | + | - | + |  |  |  | + |
| S | s,z | + | - | + | + | - | - |  | + | + | - |  |  |  |  |
| s | s | + | - | + | + | - | - |  | + | + | - |  |  |  | - |
| z | z | + | - | + | + | - | - |  | + | + | - |  |  |  | + |
| ð | ð,θ | + | - | + | - | - | - |  | + | + | + |  |  |  |  |
| G | velar obstruent | + | - |  | - | - | - |  |  |  |  | + | + |  |  |
| K | k,g | + | - | - | - | - | - |  |  |  |  | + | + |  |  |
| k | k | + | - | - | - | - | - |  |  |  |  | + | + |  | - |
| g | g | + | - | - | - | - | - |  |  |  |  | + | + |  | + |
| ɣ | ɣ | + | - | + | - | - | - |  |  |  |  | + | + |  | + |
| Ċ			| palatalized velar	| +		| -		| -		|			| -		| -		|			|			|		|		| +			|		|			|		|
| ċ			| k,c,ʨ	| +		| -		| -		|			| -		| -		|			|			|		|		| +			|		|			| -		|
| ġ			| g,ɟ,ʥ	| +		| -		| -		|			| -		| -		|			|			|		|		| +			|		|			| +		|
| B | labial obstruent  | + | - |  |  | - | - | + |  |  |  |  |  |  |  |
| P | p,b | + | - | - | - | - | - | + |  |  |  |  |  |  |  |
| p | p | + | - | - | - | - | - | + |  |  |  |  |  |  | - |
| b | b | + | - | - | - | - | - | + |  |  |  |  |  |  | + |
| F | f,v | + | - | + | + | - | - | + |  |  |  |  |  |  |  |
| f | f | + | - | + | + | - | - | + |  |  |  |  |  |  | - |
| v | v | + | - | + | + | - | - | + |  |  |  |  |  |  | + |
| ß | ß | + | - | + | - | - | - | + |  |  |  |  |  |  |  |
| N | nasal | + | + | - |  | - | + |  |  |  |  |  |  |  | + |
| n | n | + | + | - |  | - | + |  | + | + |  |  |  |  | + |
| ɲ | ɲ | + | + | - |  | - | + |  |  |  |  | + | - |  | + |
| m | m | + | + | - |  | - | + | + |  |  |  |  |  |  | + |
| L | lateral | + | + | - |  | + | - |  |  |  |  |  |  |  | + |
| l | l | + | + | - |  | + | - |  | + | + |  |  |  |  | + |
| ʎ | ʎ | + | + | - |  | + | - |  |  |  |  | + | - |  | + |
| r | r | + | + | + |  | - | - |  | + |  |  |  |  |  | + |

\[[previous](/docs/annotation)\] \[[next](/docs/annotation-word)\]

[^1]: May also denote word-medial schwa.
[^2]: Used only in transcriptions of Latin.

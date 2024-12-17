---
title: 'Annotation 5 - Sample Queries (TXM)'
date: 2024-12-17
weight: 14
summary: Some example queries to try out in TXM.
---

\[[previous](/docs/annotation-sylls)\]

_ANNIS example queries can be found in the ANNIS portal_.

### Manuscript word division

+ Find all cases of token agglutination in the manuscript:
```cqp
[wd_div="\+"]{1,4} []
```

+ Find all tokens split into multiple words in the manuscript (hint: set the concordance to display `word_dipl` rather than `word`):
```cqp
[dipl=".*[_\|].*"]
```

### Morphophonology

+ Find all cases of _et_ 'and' and _ad_ 'to' written with a final dental before a vowel:
```cqp
[lemma_dmf="et|à" & phon=".*[ðd]"] [phon="[aeiouyæɛɔAEIOUÆ].*"]
```
+ Find all cases of _ne_ 'not' before a vowel-initial verb:
```cqp
[lemma_dmf="ne"] [phon="[aeiouyæɛɔAEIOUÆ].*" & pos_syn="VERcjg"]
```
+ Find all prosodically enclitic pronouns:
```cqp
[phon=".*[aeiouyæɛɔəAEIOUÆ]"] [pos="PRCper|PRCadv" & phon="[^aeiouyæɛɔəAEIOUÆ]+"] [phon="[^aeiouyæɛɔAEIOUÆ].*"]
```

+ Find all prosodically enclitic pronouns which are __not__ agglutinated with the host in the manuscript:
```cqp
[phon=".*[aeiouyæɛɔəAEIOUÆ]" & wd_div!="\+"] [pos="PRCper|PRCadv" & phon="[^aeiouyæɛɔəAEIOUÆ]+"] [phon="[^aeiouyæɛɔAEIOUÆ].*"]
```

### Morphology and morphosyntax

+ Find all occurrences of verb forms descended from the Latin pluperfect indicative:
```cqp
[morph="indpqp.*"]
```

+ Find all verbs in the second-person singular:
```cqp
[morph=".*2"]
```

+ Find all nouns in the masculine nominative singular not ending in _-s_:
```cqp
[pos_syn="NOMcom" & morph="smn" & word!=".*[szx]"]
```

+ Find all forms of the verb _raiembre_ 'to redeem' in both languages:
```cqp
[lemma_dmf="raiembre"]
```

+ Find all postverbal object pronouns:
```cqp
[pos="VERcjg"] [pos="PRCper|PRCadv" & morph!=".*n"]{1,3}
```

### Meter and versification

These queries use the word-level metrical annotation for TXM.
See [Annotation 4: Syllables and Meter](/docs/annotation-sylls#4-the-txm-version).

+ Find all lines of verse with \[ɔ\] at the rhyme
```cqp
[phon=".*[^i]ɔi?[^aeiouyæɛɔUÆ]*" & metpos=".*r"] 
```

+ Find cases of line-initial object pronouns, i.e. possible exceptions to the Tobler-Mussafia law:
```cqp
[pos="PRCper|PRCadv" & metpos="01.*"] [pos="PRCper|PRCadv"]{0,3} [pos="VERcjg"]
```

+ Find all paroxytones at the end of the line
```cqp
[prosody=".po" & metpos=".*r"]
```

+ Find all cases of epic caesura in decasyllables
(Due to a bug in version 0.4 of the corpus not all instances are found; this will be corrected
in a future release.)
```cqp
[line_met="10.e." & metpos=".*c"]
```

+ Find all octosyllables stressed on the fourth syllable
```cqp
[line_met="08.*" & ((metpos=".*04.." & prosody=".ox") | (metpos=".*05.." & prosody=".po"))]
```

\[[previous](/docs/annotation-sylls)\]

The Transcription of Latinisms (WIP for version 0.4.0)
======================================================

Cases
-----

Need to model a number of cases in these multilingual texts, both regarding
language and the spelling/phonology correspondance.

* spelling
	* regular letter-to-word correspondance (Latin Latin, Romance)
	* Latin code-switch in Romance text: possible stress shift but otherwise
	phonologically Latin
	* Latin graphy concealing a probable Romance pronunciation (_Jonas_,
	_adducere_ in the _Passion_)
	
* language
	* __default__: word belongs phonologically and morphologically to the
	language of the sentence; Romance words show regular sound change [hard].
	* __semi-borrowing__: some sound change blocked OR root borrowed but
		morphologically/phonologically regular [hard].
	* __borrowing__: no integration (foreign morphology or phonology clearly
		retained)
	* __code-switch__: full-on word in another language [also hard].
	
How could these cases be sensibly modelled in the different levels of annotation?
	* phonological?
	* morphosyntactic and lemmatized?
	* language attribute?
	* extra layer?
	
Possible solutions
------------------

Beginning with the clearest cases:
1. Romance that is Romance with Romance spelling:
	* all layers of annotation, lemmatization using the default dictionary.
	
1. Latin that is Latin with Latin spelling:
	* no morphological annotation or lemmatization ("ETR" tag)
	* basic phonological annotation using the Latin schema only for verse texts,
	in order to be able to count the syllables in the whole poem
	* language attribute (XML): lat
	
1. Single word Latin borrowing (correct cases, non-Romance spelling) in a
	Romance sentence:
	* Morphological annotation and lemmatization as Romance, if a cognate
		of the word is attested in Romance, otherwise lemmatize as Latin word.
	* Basic phonological annotation, respecting the syllable and 
		Romance stress pattern, but not much else.
		* e.g. _adducere_ -> /V\.'/V\./(V)\, ad.duce.re
		* e.g. _anima_ -> /V\./V\.'/V\, a.ni.ma
		* BUT _aneme_ treated as phonologically Romance.
	* Use _lang_ attribute to mark word as foreign
	
1. Code-switch --- multiple words building a syntactic unit within a
	sentence written in the other language.
	* Treat section as Latin--Latin or Romance--Romance text with appropriate
		morphological and phonological annotation.
	* Use "lang" tag to indicate the code-switch. 
###############################################################################
# Old Gallo-Romance Corpus (OGR), version 0.3
# © Thomas M. Rainsford, ILR, Universität Stuttgart, 7th December 2021
# http://www.ogr-corpus.org
###############################################################################

*****************
BRIEF DESCRIPTION
*****************

The TEI P5 archive encodes each text and all annotation in a single TEI-compliant
XML file. Lines, Words and Segments in verse texts are encoded inline using <l>,
<w> and <seg type="segment"> elements respectively. In prose texts, <p> and <s>
elements are used instead of <lg> and <l>. Syllable structure is marked in the
<standOff> element using <seg> elements of different types. Manuscript
pagination and line division is marked using <pb/>, <cb/> and <lb/> elements.


*******
LICENSE
*******

The Old Gallo-Romance corpus is distributed under Creative Commons license
CC BY-NC-SA 4.0:

https://creativecommons.org/licenses/by-nc-sa/4.0/

* You are free to share this .zip file.

* You must give credit to the author by citing the corpus in the following way:
	Rainsford, Thomas M. 2021. Old Gallo-Romance Corpus, TXM edition, 
		version 0.3. Stuttgart: Institut für Linguistik/Romanistik. 
		<http://www.ogr-corpus.org>.
		
* You may not use this material for commercial purposes.

* You may modify the corpus and re-distribute the modified version under the same
	license.

*************************
COPYRIGHT AND ATTRIBUTION
*************************
	
Attribution and copyright status of the material in this corpus:

* The source texts are all in the public domain in the EU.
* The normalized transcriptions, part-of-speech annotation and lemmatization
	(columns pos, lemma, lemma_dmf) in the following texts were adapted from
	the BFM (2019): Serments, Eulalie, Alexis, Passion, SLéger.
* The diplomatic transcriptions of Passion and SLéger are based on the
	transcription by Foerster/Koschwitz (1932), which is in the public domain
	in the EU. All other diplomatic transcriptions are based on photographs
	of the manuscript.
* A previous annotated version of the Boeci text was created in collaboration
	with Olga Scrivner (Rainsford and Scrivner 2014).
* All other transcriptions and annotations are my own original work, created in
	consultation with published material (details to be published in full
	corpus documentation on http://www.ogr-corpus.org).
	
BFM 2019. = Base de Français Médiéval [En ligne]. Lyon: ENS de Lyon, Laboratoire
	IHRIM. <txm.bfm-corpus.org>.
Foerster, Wolfgang, and Eduard Koschwitz. 1932. Altfranzösisches Übungsbuch. 7.
	Aufl. Leipzig: Reisland.
Rainsford, Thomas, and Olga Scrivner. 2014. „Metrical annotation for a verse
	treebank“. In Proceedings of the Thirteenth International Workshop on
	Treebanks and Linguistic Theories (TLT13), edited by Verena Henrich,
	Erhard Hinrichs, Daniël de Kok, Petya Osenova, and Adam Przepiórkowski,
	149–59. Tübingen: University of Tübingen.

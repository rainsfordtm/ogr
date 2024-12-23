#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo "Script directory: $SCRIPT_DIR"
SYLVA_DIR=$HOME/git/syllabic-verse-analysis-code
cwd=$(pwd)

cd $SCRIPT_DIR/../src

# Wipe the paula directory if it exists
rm -r $SCRIPT_DIR/../src/paula

# Verse texts

$SYLVA_DIR/export_text.py -t pos . Eulalie cfg/phonemes-ogr.cfg  cfg/unstressed-ongr.txt -o paula
$SYLVA_DIR/export_text.py -t pos . Alba cfg/phonemes-ogr.cfg cfg/unstressed-osgr.txt -o  paula
$SYLVA_DIR/export_text.py -t pos . PassAugsb cfg/phonemes-ogr.cfg  cfg/unstressed-ongr.txt -o  paula
$SYLVA_DIR/export_text.py -t pos . SLeger cfg/phonemes-ogr.cfg  cfg/unstressed-ongr.txt -o  paula
$SYLVA_DIR/export_text.py -t pos . Passion cfg/phonemes-ogr.cfg  cfg/unstressed-ongr.txt -o  paula
$SYLVA_DIR/export_text.py -t pos . Spons cfg/phonemes-ogr.cfg  cfg/unstressed-osgr.txt -o  paula
$SYLVA_DIR/export_text.py -t pos . PrDieu cfg/phonemes-ogr.cfg  cfg/unstressed-osgr.txt -o  paula
$SYLVA_DIR/export_text.py -t pos . PrVierge2 cfg/phonemes-ogr.cfg  cfg/unstressed-osgr.txt -o  paula
$SYLVA_DIR/export_text.py -t pos . PrVierge3 cfg/phonemes-ogr.cfg  cfg/unstressed-osgr.txt -o  paula
$SYLVA_DIR/export_text.py -t pos . SFoi cfg/phonemes-ogr.cfg  cfg/unstressed-osgr.txt -o  paula
$SYLVA_DIR/export_text.py -t pos . Boeci cfg/phonemes-ogr.cfg  cfg/unstressed-osgr.txt -o  paula
$SYLVA_DIR/export_text.py -t pos . AlexAlb cfg/phonemes-ogr.cfg  cfg/unstressed-ongr.txt -o  paula
$SYLVA_DIR/export_text.py -t pos . Alexis cfg/phonemes-ogr.cfg  cfg/unstressed-ongr.txt -o  paula
$SYLVA_DIR/export_text.py -t pos . EpSEt cfg/phonemes-ogr.cfg  cfg/unstressed-ongr.txt -o  paula
$SYLVA_DIR/export_text.py -t pos . CantQuSol cfg/phonemes-ogr.cfg  cfg/unstressed-ongr.txt -o  paula

# Prose texts

$SYLVA_DIR/export_text.py -t pos . Jonas cfg/phonemes-ogr.cfg cfg/unstressed-ongr.txt -o tei paula
$SYLVA_DIR/export_text.py -t pos . BenClerm cfg/phonemes-ogr.cfg cfg/unstressed-osgr.txt -o tei paula
$SYLVA_DIR/export_text.py -t pos . Serments cfg/phonemes-ogr.cfg cfg/unstressed-ongr.txt -o tei paula
$SYLVA_DIR/export_text.py -t pos . ChansLas cfg/phonemes-ogr.cfg cfg/unstressed-ongr.txt -o tei paula
$SYLVA_DIR/export_text.py -t pos . EpreuveJudic cfg/phonemes-ogr.cfg cfg/unstressed-ongr.txt -o tei paula
$SYLVA_DIR/export_text.py -t pos . AlexisProl cfg/phonemes-ogr.cfg cfg/unstressed-ongr.txt -o tei paula
$SYLVA_DIR/export_text.py -t pos . SGregPaint cfg/phonemes-ogr.cfg cfg/unstressed-ongr.txt -o tei paula

# Reheader the PAULA-XML

echo "Write PAULA-XML header"
python3 $SCRIPT_DIR/ogr-paula-metadata.py $SCRIPT_DIR/../src

echo "Rename grid"
mv $SCRIPT_DIR/../src/paula/grid $SCRIPT_DIR/../src/paula/ogr100

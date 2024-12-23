#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo "Script directory: $SCRIPT_DIR"
SYLVA_DIR=$HOME/git/syllabic-verse-analysis-code
cwd=$(pwd)

echo "Starting with standard corpus"

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

echo "SylVer corpus"

cd $SCRIPT_DIR/../src-sylver

# Wipe the paula-tree directory if it exists
rm -r $SCRIPT_DIR/../src-sylver/paula

# Verse texts

$SYLVA_DIR/scan_text.py -t pos . Eulalie cfg/scan/eulalie_scan.cfg cfg/phonemes-ogr.cfg  cfg/unstressed-ongr.txt -o scaneval paula-tree
$SYLVA_DIR/scan_text.py -t pos . Alba cfg/scan/alba_scan.cfg cfg/phonemes-ogr.cfg cfg/unstressed-osgr.txt -o scaneval paula-tree
$SYLVA_DIR/scan_text.py -t pos . PassAugsb cfg/scan/passaugs_scan.cfg cfg/phonemes-ogr.cfg  cfg/unstressed-ongr.txt -o scaneval paula-tree
$SYLVA_DIR/scan_text.py -t pos . SLeger cfg/scan/sleger_scan.cfg cfg/phonemes-ogr.cfg  cfg/unstressed-ongr.txt -o scaneval paula-tree
$SYLVA_DIR/scan_text.py -t pos . Passion cfg/scan/passion_scan.cfg cfg/phonemes-ogr.cfg  cfg/unstressed-ongr.txt -o scaneval paula-tree
$SYLVA_DIR/scan_text.py -t pos . Spons cfg/scan/sponsus_scan.cfg cfg/phonemes-ogr.cfg  cfg/unstressed-osgr.txt -o scaneval paula-tree
$SYLVA_DIR/scan_text.py -t pos . PrDieu cfg/scan/prdieu_scan.cfg cfg/phonemes-ogr.cfg  cfg/unstressed-osgr.txt -o scaneval paula-tree
$SYLVA_DIR/scan_text.py -t pos . PrVierge2 cfg/scan/prvierge2_scan.cfg cfg/phonemes-ogr.cfg  cfg/unstressed-osgr.txt -o scaneval paula-tree
$SYLVA_DIR/scan_text.py -t pos . PrVierge3 cfg/scan/prvierge3_scan.cfg cfg/phonemes-ogr.cfg  cfg/unstressed-osgr.txt -o scaneval paula-tree
$SYLVA_DIR/scan_text.py -t pos . SFoi cfg/scan/sfoi_scan.cfg cfg/phonemes-ogr.cfg  cfg/unstressed-osgr.txt -o scaneval paula-tree
$SYLVA_DIR/scan_text.py -t pos . Boeci cfg/scan/boeci_scan.cfg cfg/phonemes-ogr.cfg  cfg/unstressed-osgr.txt -o scaneval paula-tree
$SYLVA_DIR/scan_text.py -t pos . AlexAlb cfg/scan/alexalb_scan.cfg cfg/phonemes-ogr.cfg  cfg/unstressed-ongr.txt -o scaneval paula-tree
$SYLVA_DIR/scan_text.py -t pos . Alexis cfg/scan/alexis_scan.cfg cfg/phonemes-ogr.cfg  cfg/unstressed-ongr.txt -o scaneval paula-tree
$SYLVA_DIR/scan_text.py -t pos . EpSEt cfg/scan/epset.cfg cfg/phonemes-ogr.cfg  cfg/unstressed-ongr.txt -o scaneval paula-tree
$SYLVA_DIR/scan_text.py -t pos . CantQuSol cfg/scan/cantqusol_scan.cfg cfg/phonemes-ogr.cfg  cfg/unstressed-ongr.txt -o scaneval paula-tree

# Reheader the paula-tree-XML

echo "Write paula-XML header"
python3 $SCRIPT_DIR/ogr-paula-metadata.py $SCRIPT_DIR/../src-sylver

echo "Rename grid"
mv $SCRIPT_DIR/../src-sylver/paula/tree $SCRIPT_DIR/../src-sylver/paula/ogrsv100

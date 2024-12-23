#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo "Script directory: $SCRIPT_DIR"
PEPPER_DIR=$HOME/Programs/Pepper_2023.05.15
cwd=$(pwd)

echo "Standard corpus"

cd $PEPPER_DIR

# Remove any OGR directory already present
rm -r ogrconvert

# make files in the pepper directory
mkdir ogrconvert
mkdir ogrconvert/relANNIS
ln -s $SCRIPT_DIR/../src/paula/* ogrconvert/.
cp $SCRIPT_DIR/../src/cfg/paula2annis.pepper ogrconvert

# call pepper
./pepperStart.sh ogrconvert/paula2annis.pepper

# copy result to ogr directory
rm -r $SCRIPT_DIR/../src/relANNIS
mv ogrconvert/relANNIS $SCRIPT_DIR/../src/.

# copy resolver_vis_map, example_queries and ExtData
cd $SCRIPT_DIR/../src
cp cfg/resolver_vis_map.annis relANNIS
cp cfg/example_queries.annis relANNIS
cp -r cfg/ExtData relANNIS

# Zip for upload
rm relANNIS.zip
zip -r relANNIS.zip relANNIS

echo "Sylver corpus"

cd $PEPPER_DIR

# Remove any OGR directory already present
rm -r ogrconvert

# make files in the pepper directory
mkdir ogrconvert
mkdir ogrconvert/relANNIS
ln -s $SCRIPT_DIR/../src-sylver/paula/* ogrconvert/.
cp $SCRIPT_DIR/../src-sylver/cfg/paula2annis.pepper ogrconvert

# call pepper
./pepperStart.sh ogrconvert/paula2annis.pepper

# copy result to ogr directory
rm -r $SCRIPT_DIR/../src-sylver/relANNIS
mv ogrconvert/relANNIS $SCRIPT_DIR/../src-sylver/.

# copy resolver_vis_map, example_queries and ExtData
cd $SCRIPT_DIR/../src-sylver
cp cfg/resolver_vis_map.annis relANNIS
cp cfg/example_queries.annis relANNIS
# resolve sym-links
cp -lr cfg/ExtData relANNIS

# Zip for upload
rm relANNIS.zip
zip -r relANNIS.zip relANNIS

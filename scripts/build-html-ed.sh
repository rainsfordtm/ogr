#!/bin/bash

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )"
echo "Script directory: $SCRIPT_DIR"
cwd=$(pwd)

cd $SCRIPT_DIR/../src

for path in xml-tei/*.xml; do
    filename=${path##*/}
    saxonb-xslt -xsl:cfg/online-edition/online-edition.xsl -o:../site/content/docs/${filename%.xml}/index.html $path
done

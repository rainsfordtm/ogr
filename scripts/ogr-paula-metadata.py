#!/usr/bin/python3

import os.path, csv, xml.dom.minidom, argparse

def main(corpdir):
    
    def save_xml(fname):
        nonlocal dom, corpdir
        with open(os.path.join(corpdir, fname), 'w') as f:
            dom.writexml(f, encoding="utf-8")
    
    def load_dom(fname):
        nonlocal dom, corpdir
        with open(os.path.join(corpdir, fname), 'r') as f:
            dom = xml.dom.minidom.parse(f)
    
    # Read the "metadata-paula.csv" file
    with open(os.path.join(corpdir, 'doc', 'metadata-paula.csv'), 'r') as f:
        reader = csv.DictReader(f)
        mds = [x for x in reader]
        
    # Iterate over the files in "file" column
    open_file, dom = '', None
    for md in mds:
        if md['file'] != open_file:
            if open_file: save_xml(open_file)
            load_dom(md['file'])
            open_file = md['file']
        multiFeat = dom.getElementsByTagName('multiFeat')[0]
        feats = multiFeat.getElementsByTagName('feat')
        for feat in feats:
            # Find feat with this name if it already exists (ESSENTIAL FOR
            # UPDATES!)
            if feat.hasAttribute('name') and feat.getAttribute('name') == md['name']:
                break
        else:
            feat = dom.createElement('feat')
            multiFeat.appendChild(feat)
        feat.setAttribute('name', md['name'])
        feat.setAttribute('value', md['value'])
        
    save_xml(open_file)
    
if __name__ == '__main__':
    parser = argparse.ArgumentParser(
        description = \
        'Updates metadata in PAULA export from doc/metadata-paula.csv'
        )
    parser.add_argument('corpdir', help='Corpus directory')
    # Convert Namespace to dict.
    args = vars(parser.parse_args())
    main(args.pop('corpdir'))

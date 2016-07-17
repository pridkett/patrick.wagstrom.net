#!/usr/bin/python3

import os
import yaml
from dateutil import parser
import datetime
import pytz

INPUT_DIR="/Users/pwagstro/Documents/workspace/web/engineer/posts"
OUTPUT_DIR="/Users/pwagstro/Documents/workspace/web/content/post"
TIMEZONE="US/Eastern"
OLD_TAGS=['status', 'timestamp', 'wordpress_id', 'layout', 'oldcategories']

def get_files(indir, filterfunc):
    files = os.listdir(indir)
    if callable(filterfunc):
        files = [x for x in files if filterfunc(x)]
    return files

def markdown_filter(instr):
    if os.path.splitext(instr)[1] == ".markdown":
        return True
    return False

def rewrite_file(fn):
    f = [x.rstrip() for x in open(fn).readlines()]
    if (f[0].strip() != '---'):
        f = ['---'] + f
    yamlString = []
    postString = []
    inYaml = False
    doneYaml = False
    for line in f:
        if doneYaml:
            postString.append(line)
            continue
        if not inYaml and line.strip() == '---':
            inYaml = True
            continue
        if inYaml and line.strip() == '---':
            inYaml = False
            doneYaml = True
            continue
        if inYaml:
            yamlString.append(line)
    fileYaml = yaml.load('\n'.join(yamlString))
    fileYaml['date'] = parser.parse(fileYaml['timestamp']).isoformat()

    for tag in OLD_TAGS:
        if tag in fileYaml:
            if "old" not in fileYaml:
                fileYaml["old"] = {}
            fileYaml["old"][tag] = fileYaml[tag]
            del fileYaml[tag]

    output = "---\n" + yaml.dump(fileYaml, default_flow_style=False) + "---\n" + '\n'.join(postString)
    # print(yaml.dump(fileYaml))
    return output

def get_output_filename(fn):
    basename = os.path.splitext(fn)[0]
    return os.path.join(OUTPUT_DIR, fn + '.md')

def write_file(filename, content):
    f = open(filename, "w")
    f.write(content)
    f.close()

def main():
    files = get_files(INPUT_DIR, markdown_filter)
    for fn in files:
        file_content = rewrite_file(os.path.join(INPUT_DIR, fn))
        output_filename = get_output_filename(fn)
        os.system('git mv ' + os.path.join(INPUT_DIR, fn) + ' ' + output_filename)
        write_file(output_filename, file_content)

if __name__ == "__main__":
    main()

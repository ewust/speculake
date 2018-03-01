#!/usr/bin/env python3

import re


# tag seearch and replace format string for Regex
tag_sub_fre = '\/\*<<<{{{0}[:]*[{1}]*}}>>>\*\/'

# tag seearch and replace format string for Regex
tag_m_sub_fre = '\/\*<<<{{{0}:{1}}}>>>\*\/'

# Tag for rearch Regex
tag_re = '\/\*<<<{\d+[:]*\d*}>>>\*\/'

# Parse integers out of tag
parse_tag_re = '\d+[:]*\d*'



def tagged_sr(infile, r_strs, outfile=None):
    with open(infile, "r") as f_in:
        s = f_in.read() 

    tags = find_tags(s)
        
    for tag in tags:
        s = replace_tag(tag, s, r_strs)

    if outfile == None:
        print(s)

    else:
        with open(outfile, 'w') as f_out:
            f_out.write(s)


def replace_tag(tag, s, r_strs):
    if tag[1] == 1:
        tag_sub_re = tag_sub_fre.format(tag[0], tag[1]) 
    else: 
        tag_sub_re = tag_m_sub_fre.format(tag[0], tag[1]) 
    
    # print(tag_sub_re)

    return re.sub(tag_sub_re, r_strs[tag[0]]*tag[1], s)


def find_tags(s):

    tags = []
    tags_raw = re.findall(tag_re, s)
    
    for tag in tags_raw:
        #print(parse_tag(tag), tag)
        tags.append(parse_tag(tag))

    return tags
             

def parse_tag(tag):

    try: 
        content = re.search(parse_tag_re, tag).group(0).split(":")
        if len(content) == 2:
            return (int(content[0]), int(content[1]))
        else:
            return (int(content[0]), 1)
   
    except AttributeError as e: 
        return []


### Example Usage (as an executable if uncommented)
# 
# def main():
#     # Replacement strings to be inserted into indexes referenced in template files
#     r_strs = ['a\t//(generated)\n', 'bbb\t//(generated)\n', 'cc\t//(generated)\n']
# 
#     tagged_sr("practice.c", r_strs, 'out.c')
# 
# 
# if __name__ == "__main__":
#     main()

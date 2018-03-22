#!/usr/bin/env python3

import sys


def main(fname):

    fname_out = ''.join([fname.split(".")[0], ".sp"])
    out = []

    with open(fname, 'rb') as f:
        byte = f.read(2)
        while byte != b"":
            # Do stuff with byte.
            if byte == b'\n':
                byte = b'0A'
            # print("{}\n".format(chr(int(byte, 16))))
            out.append(chr(int(byte, 16)))
            byte = f.read(2)
        f.close()


    with open(fname_out, 'w') as fout:
        fout.write("".join(out))

if __name__ == "__main__":
    if len(sys.argv) < 2:
        print("No File Specified")
    else:
        main(sys.argv[1])

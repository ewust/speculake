#!/usr/bin/env python3

import sys


def txtToHex(fname):
    """Given a txt file containing the opcodes for our spasm code, creates the
    .hex file of just opcodes"""
    fname_out = ''.join([fname.split(".")[0], ".hex"])
    out = []
    with open(fname, "rb") as f:
        for line in f:
            # remove commented lines and empty lines
            if "//" in line or len(line.strip()) == 0:
                continue

            # this is a line that needs to be parsed, only take the first hex value
            opCode = [s for s in line.split() if "0x" in s.lower()][0]
            out.append(opCode[2:])

    with open(fname_out, "w") as fout:
        fout.write("".join(out))
        fout.write("\n")


def main(fname):
    """will convert a hex file to an sp file"""
    fname_out = ''.join([fname.split(".")[0], ".sp"])
    out = []
    fname_hex = ''.join([fname.split(".")[0], ".hex"])

    with open(fname_hex, 'rb') as f:
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
        txtToHex(sys.argv[1])
        main(sys.argv[1])

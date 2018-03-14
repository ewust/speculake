#!/usr/bin/env python3




def main():

    out = []

    with open("hello.hex", 'rb') as f:
        byte = f.read(2)
        while byte != b"":
            # Do stuff with byte.
            if byte == b'\n':
                byte = b'0A'
            # print("{}\n".format(chr(int(byte, 16))))
            out.append(chr(int(byte, 16)))
            byte = f.read(2)
        f.close()


    with open("hello.sp", 'w') as fout:
        fout.write("".join(out))

if __name__ == "__main__":
    main()

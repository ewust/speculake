from Crypto.Cipher import AES
from Crypto import Random
from Crypto.Util import Counter

import sys

key = "\x00\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f"
# key = "\x09\x0a\x0b\x0c\x0d\x0e\x0f\x00\x01\x02\x03\x04\x05\x06\x07\x08"


def get_msg(filename):
    # Read Message out of File 
    with open(filename, "r") as f_bin:
        msg = f_bin.read()
    if (len(msg) % 128 != 0 ):
        msg = ''.join([msg, '\x00' * (128 - (len(msg)%128)) ])
    return msg


def enc_reorder_format(msg, ctr_mode):
    ctr_ct = ctr_mode.encrypt(msg)
    # print '// ', ctr_ct.encode('hex')
    print 'ctext:'
     
    for i in xrange(0, len(ctr_ct), 16):
        h = ctr_ct[i:i+16][::-1].encode('hex')
        print '    .quad 0x%s, 0x%s' % (h[:16], h[16:])
    

def le_ctr():
    return ctr()[::-1]


def main(argv):

    filename = str(argv[1])
    msg = get_msg(filename)
        
    ctr = Counter.new(128, initial_value=0)
    ctr_mode = AES.new(key, AES.MODE_CTR, counter=ctr)
    enc_reorder_format(msg, ctr_mode)


if __name__=="__main__":
    if len(sys.argv) < 2:
        print("Please specify a file \n\tencrypt.py [filepath]")

    else:
        main(sys.argv)

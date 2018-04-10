from Crypto.Cipher import AES
from Crypto import Random
from Crypto.Util import Counter

key = "\x00\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f"
# key = "\x09\x0a\x0b\x0c\x0d\x0e\x0f\x00\x01\x02\x03\x04\x05\x06\x07\x08"
pt  = "\x8b\xad\xf0\x0d\xde\xad\xbe\xef\x31\x41\x59\x26\x53\x58\x97\x93"
# pt  = "\x31\x41\x59\x26\x53\x58\x97\x93\x8b\xad\xf0\x0d\xde\xad\xbe\xef"




def erics_msg():
    # ERICS VERSION
    msg = ''.join([chr(x&0xff) for x in xrange(1024)])
    return msg


def ians_msg():
    # IANS VERSION
    msg = 'The Magic Words are Squeamish Ossifrage\x00'

    return msg

def jacks_msg():
    # JACKS VERISION
    with open("../spasm/examples/hello.sp", "r") as sp_bin:
        msg = sp_bin.read()
    if (len(msg) % 128 != 0 ):
        msg = ''.join([msg, '\x00' * (128 - (len(msg)%128)) ])
    return msg


def test_enc(cipher):
    msg = cipher.encrypt(pt)
    print("msg = 0x" + str(msg.encode("hex")))


def enc_reorder_format(msg, ctr_mode):
    ctr_ct = ctr_mode.encrypt(msg)
    print '// ', ctr_ct.encode('hex')
    print 'ctext:'
     
    for i in xrange(0, len(ctr_ct), 16):
        h = ctr_ct[i:i+16][::-1].encode('hex')
        print '    .quad 0x%s, 0x%s' % (h[:16], h[16:])
    

def le_ctr():
    return ctr()[::-1]


def main():
    cipher = AES.new(key, AES.MODE_ECB)
        
    test_enc(cipher)

    msg = jacks_msg()

    ctr = Counter.new(128, initial_value=0)
    ctr_mode = AES.new(key, AES.MODE_CTR, counter=ctr)

    enc_reorder_format(msg, ctr_mode)

    ks = int(cipher.encrypt('\x00'*16).encode('hex'), 16)
    ms = int(msg[:16].encode('hex'), 16)

    # print hex(ks ^ ms)

    # print msg.encode('hex')


if __name__=="__main__":
    main()

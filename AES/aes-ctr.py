from Crypto.Cipher import AES
from Crypto import Random
from Crypto.Util import Counter

key = "\x00\x01\x02\x03\x04\x05\x06\x07\x08\x09\x0a\x0b\x0c\x0d\x0e\x0f"
# key = "\x09\x0a\x0b\x0c\x0d\x0e\x0f\x00\x01\x02\x03\x04\x05\x06\x07\x08"
pt  = "\x8b\xad\xf0\x0d\xde\xad\xbe\xef\x31\x41\x59\x26\x53\x58\x97\x93"
# pt  = "\x31\x41\x59\x26\x53\x58\x97\x93\x8b\xad\xf0\x0d\xde\xad\xbe\xef"


cipher = AES.new(key, AES.MODE_ECB)
msg = cipher.encrypt('\x01' + '\x00'*15)
print('key stream(0) = %s' % msg.encode('hex'))
#print("msg = 0x" + str(msg.encode("hex")))


ctr = Counter.new(128, initial_value=1)
def le_ctr():
    return ctr()[::-1]

ctr_mode = AES.new(key, AES.MODE_CTR, counter=le_ctr)

ct = ctr_mode.encrypt(pt*16)

print('ct = %s' % ct.encode('hex'))


print 'ctext:'
for i in xrange(0, len(ct), 16):
    h = ct[i:i+16][::-1].encode('hex')
    print '     .quad 0x%s, 0x%s' % (h[16:], h[:16])



print 'key:'
key_s = ['0x%02x' % ord(c) for c in key]
print '    .byte %s' % (', '.join(key_s[:8]))
print '    .byte %s' % (', '.join(key_s[8:]))




#ctr = Counter.new(128, initial_value=0)
#def le_ctr():
#    return ctr()[::-1]
#
#
#ctr_mode = AES.new(key, AES.MODE_CTR, counter=ctr)
#
#msg = 'The Magic Words are Squeamish Ossifrage\x00'
#
#msg = ''.join([chr(x&0xff) for x in xrange(1024)])
#
#ctr_ct = ctr_mode.encrypt(msg)
#print '// ', ctr_ct.encode('hex')
#print 'ctext:'
#
#for i in xrange(0, len(ctr_ct), 16):
#    h = ctr_ct[i:i+16][::-1].encode('hex')
#    print '    .quad 0x%s, 0x%s' % (h[:16], h[16:])
#
#
#
#ks = int(cipher.encrypt('\x00'*16).encode('hex'), 16)
#ms = int(msg[:16].encode('hex'), 16)
#
#print hex(ks ^ ms)
#
#print msg.encode('hex')

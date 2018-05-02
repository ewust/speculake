# 0x7ffff74d2988 -> 0x7ffff77ee9e8 spans 3260512 bytes
# 0x7ffff74d2988  0 sources, dests: 0x7ffff74d2a50 jb     0x7ffff74d2a50 <__memset_avx2+224>
# 0x7ffff74d2a53  0 sources, dests: 0x7ffff74d2a55 jb     0x7ffff74d2a60 <__memset_avx2+240>
# 0x7ffff74d2a5e  0 sources, dests: 0x7ffff77eb070 retq   
# 0x7ffff778b8f0  1 sources, dests: 0x7ffff74d2970 jmpq   *0x3d382a(%rip)        # 0x7ffff7b5f120
# 0x7ffff77e339c  0 sources, dests: 0x7ffff77e33ac jge    0x7ffff77e33ac <BN_uadd+44>
# 0x7ffff77e33b1  0 sources, dests: 0x7ffff77e33b7 jge    0x7ffff77e3498 <BN_uadd+280>
# 0x7ffff77e33d3  0 sources, dests: 0x7ffff77ee980 callq  0x7ffff77ee980 <bn_add_words>
# 0x7ffff77e33ea  0 sources, dests: 0x7ffff77e3466 je     0x7ffff77e3466 <BN_uadd+230>
# 0x7ffff77e3457  0 sources, dests: 0x7ffff77e37a5 retq   
# 0x7ffff77e3469  0 sources, dests: 0x7ffff77e343d je     0x7ffff77e343d <BN_uadd+189>
# 0x7ffff77e36fb  0 sources, dests: 0x7ffff77e37a0 je     0x7ffff77e37a0 <BN_add+192>
# 0x7ffff77e37a0  1 sources, dests: 0x7ffff77e3380 callq  0x7ffff77e3380 <BN_uadd>
# 0x7ffff77e37b3  0 sources, dests: 0x7ffff77ecc61 retq   
# 0x7ffff77e3916  0 sources, dests: 0x7ffff77e3918 jle    0x7ffff77e3927 <BN_div+71>
# 0x7ffff77e3921  0 sources, dests: 0x7ffff77e3927 je     0x7ffff77e3a00 <BN_div+288>
# 0x7ffff77e392d  0 sources, dests: 0x7ffff77e392f jle    0x7ffff77e3942 <BN_div+98>
# 0x7ffff77e393c  0 sources, dests: 0x7ffff77e3942 je     0x7ffff77e3a00 <BN_div+288>
# 0x7ffff77e3947  0 sources, dests: 0x7ffff77e394d je     0x7ffff77e3a50 <BN_div+368>
# 0x7ffff77e394f  0 sources, dests: 0x7ffff77e3955 je     0x7ffff77e3ab0 <BN_div+464>
# 0x7ffff77e3960  0 sources, dests: 0x7ffff77e7bb0 callq  0x7ffff77e7bb0 <BN_CTX_start>
# 0x7ffff77e3968  0 sources, dests: 0x7ffff77e7d40 callq  0x7ffff77e7d40 <BN_CTX_get>
# 0x7ffff77e3973  0 sources, dests: 0x7ffff77e7d40 callq  0x7ffff77e7d40 <BN_CTX_get>
# 0x7ffff77e3980  0 sources, dests: 0x7ffff77e7d40 callq  0x7ffff77e7d40 <BN_CTX_get>
# 0x7ffff77e39e2  0 sources, dests: 0x7ffff77e3ae0 jne    0x7ffff77e3ae0 <BN_div+512>
# 0x7ffff77e3a35  0 sources, dests: 0x7ffff77e3a3b jne    0x7ffff77e403b <BN_div+1883>
# 0x7ffff77e3a4c  0 sources, dests: 0x7ffff77eccd4 retq   
# 0x7ffff77e3aff  0 sources, dests: 0x7ffff77eafd0 callq  0x7ffff77eafd0 <BN_lshift>
# 0x7ffff77e3b06  0 sources, dests: 0x7ffff77e3b0c je     0x7ffff77e39f0 <BN_div+272>
# 0x7ffff77e3b23  0 sources, dests: 0x7ffff77e3e22 jne    0x7ffff77e3e22 <BN_div+1346>
# 0x7ffff77e3b88  0 sources, dests: 0x7ffff77e3b8a je     0x7ffff77e3b94 <BN_div+692>
# 0x7ffff77e3bb1  0 sources, dests: 0x7ffff77e3bb7 jge    0x7ffff77e3eaf <BN_div+1487>
# 0x7ffff77e3bce  0 sources, dests: 0x7ffff77e3bd4 jge    0x7ffff77e3f00 <BN_div+1568>
# 0x7ffff77e3bdf  0 sources, dests: 0x7ffff77e3be5 je     0x7ffff77e3fcd <BN_div+1773>
# 0x7ffff77e3beb  0 sources, dests: 0x7ffff77e3f50 jne    0x7ffff77e3f50 <BN_div+1648>
# 0x7ffff77e3bfd  0 sources, dests: 0x7ffff77e3c03 jle    0x7ffff77e3d2f <BN_div+1103>
# 0x7ffff77e3c6e  0 sources, dests: 0x7ffff77e3c70,0x7ffff77e3c70 je     0x7ffff77e3cb8 <BN_div+984>
# 0x7ffff77e3c86  0 sources, dests: 0x7ffff77e3c88,0x7ffff77e3c88 jbe    0x7ffff77e3ca8 <BN_div+968>
# 0x7ffff77e3c88  2 sources, dests: 0x7ffff77e3cb8,0x7ffff77e3cb8 jmp    0x7ffff77e3cb8 <BN_div+984>
# 0x7ffff77e3ccb  0 sources, dests: 0x7ffff77ee7c0,0x7ffff77ee7c0 callq  0x7ffff77ee7c0 <bn_mul_words>
# 0x7ffff77e3cf6  0 sources, dests: 0x7ffff77ee9c0,0x7ffff77ee9c0 callq  0x7ffff77ee9c0 <bn_sub_words>
# 0x7ffff77e3cfe  0 sources, dests: 0x7ffff77e3d04,0x7ffff77e3d04 jne    0x7ffff77e3df2 <BN_div+1298>
# 0x7ffff77e3d15  0 sources, dests: 0x7ffff77e3c60,0x7ffff77e3d1b jne    0x7ffff77e3c60 <BN_div+896>
# 0x7ffff77e3d39  0 sources, dests: 0x7ffff77e3d3b jle    0x7ffff77e3d68 <BN_div+1160>
# 0x7ffff77e3d4b  0 sources, dests: 0x7ffff77e3d55 jmp    0x7ffff77e3d55 <BN_div+1141>
# 0x7ffff77e3d53  0 sources, dests: 0x7ffff77e3d55,0x7ffff77e3d55 je     0x7ffff77e3d60 <BN_div+1152>
# 0x7ffff77e3d5e  0 sources, dests: 0x7ffff77e3d50,0x7ffff77e3d50,0x7ffff77e3d60 je     0x7ffff77e3d50 <BN_div+1136>
# 0x7ffff77e3d6b  0 sources, dests: 0x7ffff77e3d6d je     0x7ffff77e3d8d <BN_div+1197>
# 0x7ffff77e3d7d  0 sources, dests: 0x7ffff77eb180 callq  0x7ffff77eb180 <BN_rshift>
# 0x7ffff77e3d87  0 sources, dests: 0x7ffff77e3d89 je     0x7ffff77e3d8d <BN_div+1197>
# 0x7ffff77e3d93  0 sources, dests: 0x7ffff77e3d95 je     0x7ffff77e3dbe <BN_div+1246>
# 0x7ffff77e3d9b  0 sources, dests: 0x7ffff77e3d9d jle    0x7ffff77e3dbe <BN_div+1246>
# 0x7ffff77e3da8  0 sources, dests: 0x7ffff77e3daf jmp    0x7ffff77e3daf <BN_div+1231>
# 0x7ffff77e3dad  0 sources, dests: 0x7ffff77e3daf je     0x7ffff77e3dba <BN_div+1242>
# 0x7ffff77e3db8  0 sources, dests: 0x7ffff77e3daa,0x7ffff77e3dba je     0x7ffff77e3daa <BN_div+1226>
# 0x7ffff77e3dc7  0 sources, dests: 0x7ffff77e7cc0 callq  0x7ffff77e7cc0 <BN_CTX_end>
# 0x7ffff77e3dcc  1 sources, dests: 0x7ffff77e3a24 jmpq   0x7ffff77e3a24 <BN_div+324>
# 0x7ffff77e3e35  0 sources, dests: 0x7ffff77e3e7d jg     0x7ffff77e3e7d <BN_div+1437>
# 0x7ffff77e3e89  0 sources, dests: 0x7ffff77e3e8f jge    0x7ffff77e3f9d <BN_div+1725>
# 0x7ffff77e3eaa  0 sources, dests: 0x7ffff77e3b33 jmpq   0x7ffff77e3b33 <BN_div+595>
# 0x7ffff77e3f54  0 sources, dests: 0x7ffff77e3bf9 jmpq   0x7ffff77e3bf9 <BN_div+793>
# 0x7ffff77e6bbd  0 sources, dests: 0x7ffff77e6bbf je     0x7ffff77e6bf8 <BN_num_bits_word+72>
# 0x7ffff77e6bcc  0 sources, dests: 0x7ffff77e6bce je     0x7ffff77e6c48 <BN_num_bits_word+152>
# 0x7ffff77e6bdb  0 sources, dests: 0x7ffff77e6be1 je     0x7ffff77e6c70 <BN_num_bits_word+192>
# 0x7ffff77e6bf3  0 sources, dests: 0x7ffff77e6d06 retq   
# 0x7ffff77e6ce5  0 sources, dests: 0x7ffff77e6cf0 jne    0x7ffff77e6cf0 <BN_num_bits+16>
# 0x7ffff77e6d01  0 sources, dests: 0x7ffff77e6bb0 callq  0x7ffff77e6bb0 <BN_num_bits_word>
# 0x7ffff77e6d09  0 sources, dests: 0x7ffff77eb1bf retq   
# 0x7ffff77e7141  0 sources, dests: 0x7ffff77e7143,0x7ffff77e7143,0x7ffff77e7143 jle    0x7ffff77e7170 <BN_set_word+64>
# 0x7ffff77e7166  0 sources, dests: 0x7ffff77e7d95,0x7ffff77e7d95,0x7ffff77e7d95 retq   
# 0x7ffff77e7bb5  0 sources, dests: 0x7ffff77e7bb7,0x7ffff77e7bb7 jne    0x7ffff77e7bbe <BN_CTX_start+14>
# 0x7ffff77e7bbc  0 sources, dests: 0x7ffff77e7bc8,0x7ffff77e7bc8 je     0x7ffff77e7bc8 <BN_CTX_start+24>
# 0x7ffff77e7bdf  0 sources, dests: 0x7ffff77e7be1,0x7ffff77e7be1 je     0x7ffff77e7c00 <BN_CTX_start+80>
# 0x7ffff77e7bf9  0 sources, dests: 0x7ffff77e9421,0x7ffff77e3965 retq   
# 0x7ffff77e7cc5  0 sources, dests: 0x7ffff77e7cc7,0x7ffff77e7cc7 jne    0x7ffff77e7d30 <BN_CTX_end+112>
# 0x7ffff77e7cdc  0 sources, dests: 0x7ffff77e7cde,0x7ffff77e7d18 jbe    0x7ffff77e7d18 <BN_CTX_end+88>
# 0x7ffff77e7cf6  0 sources, dests: 0x7ffff77e7cf8,0x7ffff77e7cf8,0x7ffff77e7cf8,0x7ffff77e7d18 je     0x7ffff77e7d18 <BN_CTX_end+88>
# 0x7ffff77e7cfa  0 sources, dests: 0x7ffff77e7d28,0x7ffff77e7d28,0x7ffff77e7d28 jne    0x7ffff77e7d28 <BN_CTX_end+104>
# 0x7ffff77e7d22  0 sources, dests: 0x7ffff77e3dcc,0x7ffff77e9591 retq   
# 0x7ffff77e7d2b  0 sources, dests: 0x7ffff77e7cf0,0x7ffff77e7cf0,0x7ffff77e7cf0 jmp    0x7ffff77e7cf0 <BN_CTX_end+48>
# 0x7ffff77e7d51  0 sources, dests: 0x7ffff77e7d53,0x7ffff77e7d53,0x7ffff77e7d53 jne    0x7ffff77e7d99 <BN_CTX_get+89>
# 0x7ffff77e7d58  0 sources, dests: 0x7ffff77e7d5a,0x7ffff77e7d5a,0x7ffff77e7d5a jne    0x7ffff77e7d99 <BN_CTX_get+89>
# 0x7ffff77e7d63  0 sources, dests: 0x7ffff77e7d65,0x7ffff77e7d65,0x7ffff77e7d65 je     0x7ffff77e7dd0 <BN_CTX_get+144>
# 0x7ffff77e7d67  0 sources, dests: 0x7ffff77e7db0,0x7ffff77e7db0,0x7ffff77e7db0 jne    0x7ffff77e7db0 <BN_CTX_get+112>
# 0x7ffff77e7d85  0 sources, dests: 0x7ffff77e7d8b,0x7ffff77e7d8b,0x7ffff77e7d8b je     0x7ffff77e7e56 <BN_CTX_get+278>
# 0x7ffff77e7d90  0 sources, dests: 0x7ffff77e7130,0x7ffff77e7130,0x7ffff77e7130 callq  0x7ffff77e7130 <BN_set_word>
# 0x7ffff77e7da6  0 sources, dests: 0x7ffff77e396d,0x7ffff77e3978,0x7ffff77e3985 retq   
# 0x7ffff77e7db9  0 sources, dests: 0x7ffff77e7d72,0x7ffff77e7d72,0x7ffff77e7d72 jne    0x7ffff77e7d72 <BN_CTX_get+50>
# 0x7ffff77e8340  0 sources, dests: 0x7ffff77e834d jge    0x7ffff77e834d <bn_mul_normal+45>
# 0x7ffff77e8357  0 sources, dests: 0x7ffff77e835d jle    0x7ffff77e8410 <bn_mul_normal+240>
# 0x7ffff77e836a  0 sources, dests: 0x7ffff77ee7c0 callq  0x7ffff77ee7c0 <bn_mul_words>
# 0x7ffff77e8376  0 sources, dests: 0x7ffff77e8378 jne    0x7ffff77e83e2 <bn_mul_normal+194>
# 0x7ffff77e8378  1 sources, dests: 0x7ffff77e83ff jmpq   0x7ffff77e83ff <bn_mul_normal+223>
# 0x7ffff77e840d  0 sources, dests: 0x7ffff77e9548 retq   
# 0x7ffff77e93f9  0 sources, dests: 0x7ffff77e93ff je     0x7ffff77e95a8 <BN_mul+456>
# 0x7ffff77e9401  0 sources, dests: 0x7ffff77e9407 je     0x7ffff77e95a8 <BN_mul+456>
# 0x7ffff77e941c  0 sources, dests: 0x7ffff77e7bb0 callq  0x7ffff77e7bb0 <BN_CTX_start>
# 0x7ffff77e9429  0 sources, dests: 0x7ffff77e942f je     0x7ffff77e9600 <BN_mul+544>
# 0x7ffff77e9435  0 sources, dests: 0x7ffff77e943b je     0x7ffff77e9600 <BN_mul+544>
# 0x7ffff77e944b  0 sources, dests: 0x7ffff77e944d jne    0x7ffff77e9456 <BN_mul+118>
# 0x7ffff77e9450  0 sources, dests: 0x7ffff77e9456 je     0x7ffff77e95d0 <BN_mul+496>
# 0x7ffff77e9459  0 sources, dests: 0x7ffff77e9520 jle    0x7ffff77e9520 <BN_mul+320>
# 0x7ffff77e9527  0 sources, dests: 0x7ffff77e952d jg     0x7ffff77e9628 <BN_mul+584>
# 0x7ffff77e9543  0 sources, dests: 0x7ffff77e8320 callq  0x7ffff77e8320 <bn_mul_normal>
# 0x7ffff77e954e  0 sources, dests: 0x7ffff77e9550 jle    0x7ffff77e9574 <BN_mul+404>
# 0x7ffff77e9569  0 sources, dests: 0x7ffff77e956b,0x7ffff77e9570 jne    0x7ffff77e9570 <BN_mul+400>
# 0x7ffff77e956e  0 sources, dests: 0x7ffff77e9560 jne    0x7ffff77e9560 <BN_mul+384>
# 0x7ffff77e957c  0 sources, dests: 0x7ffff77e9589 je     0x7ffff77e9589 <BN_mul+425>
# 0x7ffff77e958c  0 sources, dests: 0x7ffff77e7cc0 callq  0x7ffff77e7cc0 <BN_CTX_end>
# 0x7ffff77e95a1  0 sources, dests: 0x7ffff77ecc4b retq   
# 0x7ffff77eafdc  0 sources, dests: 0x7ffff77eafe2 js     0x7ffff77eb138 <BN_lshift+360>
# 0x7ffff77eaffe  0 sources, dests: 0x7ffff77eb004 jge    0x7ffff77eb110 <BN_lshift+320>
# 0x7ffff77eb01a  0 sources, dests: 0x7ffff77eb0b8 jne    0x7ffff77eb0b8 <BN_lshift+232>
# 0x7ffff77eb06b  0 sources, dests: 0x7ffff778b8f0 callq  0x7ffff778b8f0 <memset@plt>
# 0x7ffff77eb07f  0 sources, dests: 0x7ffff77eb081 jle    0x7ffff77eb0a3 <BN_lshift+211>
# 0x7ffff77eb099  0 sources, dests: 0x7ffff77eb0a0 jne    0x7ffff77eb0a0 <BN_lshift+208>
# 0x7ffff77eb0b2  0 sources, dests: 0x7ffff77e39db,0x7ffff77e3b04 retq   
# 0x7ffff77eb0bc  0 sources, dests: 0x7ffff77eb0c2 js     0x7ffff77eb160 <BN_lshift+400>
# 0x7ffff77eb107  0 sources, dests: 0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb109 jne    0x7ffff77eb0e0 <BN_lshift+272>
# 0x7ffff77eb109  1 sources, dests: 0x7ffff77eb061 jmpq   0x7ffff77eb061 <BN_lshift+145>
# 0x7ffff77eb18c  0 sources, dests: 0x7ffff77eb192 js     0x7ffff77eb290 <BN_rshift+272>
# 0x7ffff77eb1a4  0 sources, dests: 0x7ffff77eb1aa je     0x7ffff77eb248 <BN_rshift+200>
# 0x7ffff77eb1ad  0 sources, dests: 0x7ffff77eb1b3 jge    0x7ffff77eb248 <BN_rshift+200>
# 0x7ffff77eb1ba  0 sources, dests: 0x7ffff77e6ce0 callq  0x7ffff77e6ce0 <BN_num_bits>
# 0x7ffff77eb1d7  0 sources, dests: 0x7ffff77eb1dd je     0x7ffff77eb320 <BN_rshift+416>
# 0x7ffff77eb1e7  0 sources, dests: 0x7ffff77eb1e9 jg     0x7ffff77eb268 <BN_rshift+232>
# 0x7ffff77eb204  0 sources, dests: 0x7ffff77eb2b8 jne    0x7ffff77eb2b8 <BN_rshift+312>
# 0x7ffff77eb240  0 sources, dests: 0x7ffff77e3d82 retq   
# 0x7ffff77eb2be  0 sources, dests: 0x7ffff77eb2c0 je     0x7ffff77eb306 <BN_rshift+390>
# 0x7ffff77eb2fc  0 sources, dests: 0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2fe jne    0x7ffff77eb2d8 <BN_rshift+344>
# 0x7ffff77eb30e  0 sources, dests: 0x7ffff77eb314 je     0x7ffff77eb231 <BN_rshift+177>
# 0x7ffff77eb317  0 sources, dests: 0x7ffff77eb231 jmpq   0x7ffff77eb231 <BN_rshift+177>
# 0x7ffff77ecc46  0 sources, dests: 0x7ffff77e93e0 callq  0x7ffff77e93e0 <BN_mul>
# 0x7ffff77ecc4d  0 sources, dests: 0x7ffff77ecc53 je     0x7ffff77eccdc <BN_mod_inverse+556>
# 0x7ffff77ecc5c  0 sources, dests: 0x7ffff77e36e0 callq  0x7ffff77e36e0 <BN_add>
# 0x7ffff77ecc63  0 sources, dests: 0x7ffff77ecc65 je     0x7ffff77eccdc <BN_mod_inverse+556>
# 0x7ffff77ecc74  0 sources, dests: 0x7ffff77ecc7a je     0x7ffff77ed0a0 <BN_mod_inverse+1520>
# 0x7ffff77ecccf  0 sources, dests: 0x7ffff77e38e0 callq  0x7ffff77e38e0 <BN_div>
# 0x7ffff77eccd6  0 sources, dests: 0x7ffff77ecc38 jne    0x7ffff77ecc38 <BN_mod_inverse+392>
# 0x7ffff77ee7c5  0 sources, dests: 0x7ffff77ee7cb,0x7ffff77ee7cb,0x7ffff77ee7cb jle    0x7ffff77ee8a8 <bn_mul_words+232>
# 0x7ffff77ee7d4  0 sources, dests: 0x7ffff77ee7d6,0x7ffff77ee7d6,0x7ffff77ee851 je     0x7ffff77ee851 <bn_mul_words+145>
# 0x7ffff77ee847  0 sources, dests: 0x7ffff77ee7e0,0x7ffff77ee7e0,0x7ffff77ee7e0,0x7ffff77ee7e0,0x7ffff77ee7e0,0x7ffff77ee7e0,0x7ffff77ee7e0,0x7ffff77ee849,0x7ffff77ee7e0,0x7ffff77ee7e0,0x7ffff77ee7e0,0x7ffff77ee7e0,0x7ffff77ee7e0,0x7ffff77ee7e0,0x7ffff77ee7e0,0x7ffff77ee849 jne    0x7ffff77ee7e0 <bn_mul_words+32>
# 0x7ffff77ee84f  0 sources, dests: 0x7ffff77ee89d,0x7ffff77ee89d je     0x7ffff77ee89d <bn_mul_words+221>
# 0x7ffff77ee868  0 sources, dests: 0x7ffff77ee89d je     0x7ffff77ee89d <bn_mul_words+221>
# 0x7ffff77ee8a0  0 sources, dests: 0x7ffff77e3cd0,0x7ffff77e3cd0,0x7ffff77e836f retq   
# 0x7ffff77ee982  0 sources, dests: 0x7ffff77ee984 jle    0x7ffff77ee9b0 <bn_add_words+48>
# 0x7ffff77ee98a  0 sources, dests: 0x7ffff77ee990 jmp    0x7ffff77ee990 <bn_add_words+16>
# 0x7ffff77ee9a8  0 sources, dests: 0x7ffff77e33d8 retq   
# 0x7ffff77ee9c2  0 sources, dests: 0x7ffff77ee9c4,0x7ffff77ee9c4 jle    0x7ffff77ee9f0 <bn_sub_words+48>
# 0x7ffff77ee9ca  0 sources, dests: 0x7ffff77ee9d0,0x7ffff77ee9d0 jmp    0x7ffff77ee9d0 <bn_sub_words+16>
# 0x7ffff77ee9e8  0 sources, dests: 0x7ffff77e3cfb,0x7ffff77e3cfb retq   


.section .text
.global do_pattern
do_pattern:
    sub   $0x120, %rsp
    mov   %rsp,  %rsi
    callq pattern_setup
    add   $0x120, %rsp
    retq
/*
# We're going to assume that pattern_setup gets called with rsi set to
# an array of bitfields for the direct jumps that aren't statically taken
# the same each iteration.
#
# At 4*N(%rsi) will be a 32-bit mask that from LSBit to MSBit specifies
# if the (Nth) branch should be taken (1) or not (0). E.g. 0x07 will be
# taken 3 times, then not taken.
# This logic takes ~11 bytes, plus the 2+ bytes for the direct branch.
# Hope you left room!! With more clever coding, maybe this could be cut down
# or even moved to elsewhere.
#
# Note: We use the test instruction, which messes with ZF,CF,SF but always
# sets OF=0. This means that for our direct unidirectional branches, we can
# use jno for always taken, and jo for always not taken.
*/

pattern_setup:
# Push indirect jumps to the stack
#movabs $0x7ffff77e3985, %rax
#pushq %rax
movabs $0x7ffff77e7d95, %rax
pushq %rax

# Taken care of by jmpq *%rax
#movabs $0x7ffff77e3978, %rax
#pushq %rax

movabs $0x7ffff77e7d95, %rax
pushq %rax

# Taken care of by jmpq *%rax
#movabs $0x7ffff77e396d, %rax
#pushq %rax

movabs $0x7ffff77e7d95, %rax
pushq %rax
movabs $0x7ffff77e3965, %rax
pushq %rax
movabs $0x7ffff77ecc61, %rax
pushq %rax
movabs $0x7ffff77e37a5, %rax
pushq %rax
movabs $0x7ffff77e33d8, %rax
pushq %rax
movabs $0x7ffff77ecc4b, %rax
pushq %rax
movabs $0x7ffff77e9591, %rax
pushq %rax
movabs $0x7ffff77e9548, %rax
pushq %rax
movabs $0x7ffff77e836f, %rax
pushq %rax
movabs $0x7ffff77e9421, %rax
pushq %rax
movabs $0x7ffff77eccd4, %rax
pushq %rax
movabs $0x7ffff77e3dcc, %rax
pushq %rax
movabs $0x7ffff77e3d82, %rax
pushq %rax
movabs $0x7ffff77eb1bf, %rax
pushq %rax
movabs $0x7ffff77e6d06, %rax
pushq %rax
movabs $0x7ffff77e3cfb, %rax
pushq %rax
movabs $0x7ffff77e3cd0, %rax
pushq %rax
movabs $0x7ffff77e3cfb, %rax
pushq %rax
movabs $0x7ffff77e3cd0, %rax
pushq %rax
movabs $0x7ffff77e3b04, %rax
pushq %rax
movabs $0x7ffff77eb070, %rax
pushq %rax

movabs $0x7ffff74d2970, %rax
pushq %rax
movabs $0x7ffff77e39db, %rax
pushq %rax

movl $0x3fffffff,32(%rsi)
movl $0x7fffffff,28(%rsi)
movl $0x00000002,24(%rsi)
movl $0x00007f7f,40(%rsi)
movl $0x00000004,36(%rsi)
movl $0x00000001,4(%rsi)
movl $0x00000008,20(%rsi)
movl $0x00000001,12(%rsi)
movl $0x00000002,16(%rsi)
movl $0x00000003,8(%rsi)
test %eax,%eax

movabs  $0x7ffff77eb0b2, %rax
jmpq *%rax

begin_pattern:  # please link @0x7ffff74d2970


.section .addr_0x7ffff74d2970, "ax"
.global addr_0x7ffff74d2970
.type addr_0x7ffff74d2970, @function
addr_0x7ffff74d2970:
 nop   # 0x7ffff74d2970 
 nop   # 0x7ffff74d2971 
 nop   # 0x7ffff74d2972 
 nop   # 0x7ffff74d2973 
 nop   # 0x7ffff74d2974 
 nop   # 0x7ffff74d2975 
 nop   # 0x7ffff74d2976 
 nop   # 0x7ffff74d2977 
 nop   # 0x7ffff74d2978 
 nop   # 0x7ffff74d2979 
 nop   # 0x7ffff74d297a 
 nop   # 0x7ffff74d297b 
 nop   # 0x7ffff74d297c 
 nop   # 0x7ffff74d297d 
 nop   # 0x7ffff74d297e 
 nop   # 0x7ffff74d297f 
 nop   # 0x7ffff74d2980 
 nop   # 0x7ffff74d2981 
 nop   # 0x7ffff74d2982 
 nop   # 0x7ffff74d2983 
 nop   # 0x7ffff74d2984 
 nop   # 0x7ffff74d2985 
 nop   # 0x7ffff74d2986 
 nop   # 0x7ffff74d2987 
 jno  .+200   # 0x7ffff74d2988 0x7ffff74d2988  0 sources, dests: 0x7ffff74d2a50 jb     0x7ffff74d2a50 <__memset_avx2+224>


.section .addr_0x7ffff74d2a50, "ax"
.global addr_0x7ffff74d2a50
.type addr_0x7ffff74d2a50, @function
addr_0x7ffff74d2a50:
 nop   # 0x7ffff74d2a50 
 nop   # 0x7ffff74d2a51 
 nop   # 0x7ffff74d2a52 
 jo  .+13   # 0x7ffff74d2a53 0x7ffff74d2a53  0 sources, dests: 0x7ffff74d2a55 jb     0x7ffff74d2a60 <__memset_avx2+240>+2 bytes
 nop   # 0x7ffff74d2a55 
 nop   # 0x7ffff74d2a56 
 nop   # 0x7ffff74d2a57 
 nop   # 0x7ffff74d2a58 
 nop   # 0x7ffff74d2a59 
 nop   # 0x7ffff74d2a5a 
 nop   # 0x7ffff74d2a5b 
 nop   # 0x7ffff74d2a5c 
 nop   # 0x7ffff74d2a5d 
 ret   # 0x7ffff74d2a5e 0x7ffff74d2a5e  0 sources, dests: 0x7ffff77eb070 retq   


.section .addr_0x7ffff778b8f0, "ax"
.global addr_0x7ffff778b8f0
.type addr_0x7ffff778b8f0, @function
addr_0x7ffff778b8f0:
 retq
 #jmp  .-2854784   # 0x7ffff778b8f0 


.section .addr_0x7ffff77e3380, "ax"
.global addr_0x7ffff77e3380
.type addr_0x7ffff77e3380, @function
addr_0x7ffff77e3380:
 nop   # 0x7ffff77e3380 
 nop   # 0x7ffff77e3381 
 nop   # 0x7ffff77e3382 
 nop   # 0x7ffff77e3383 
 nop   # 0x7ffff77e3384 
 nop   # 0x7ffff77e3385 
 nop   # 0x7ffff77e3386 
 nop   # 0x7ffff77e3387 
 nop   # 0x7ffff77e3388 
 nop   # 0x7ffff77e3389 
 nop   # 0x7ffff77e338a 
 nop   # 0x7ffff77e338b 
 nop   # 0x7ffff77e338c 
 nop   # 0x7ffff77e338d 
 nop   # 0x7ffff77e338e 
 nop   # 0x7ffff77e338f 
 nop   # 0x7ffff77e3390 
 nop   # 0x7ffff77e3391 
 nop   # 0x7ffff77e3392 
 nop   # 0x7ffff77e3393 
 nop   # 0x7ffff77e3394 
 nop   # 0x7ffff77e3395 
 nop   # 0x7ffff77e3396 
 nop   # 0x7ffff77e3397 
 nop   # 0x7ffff77e3398 
 nop   # 0x7ffff77e3399 
 nop   # 0x7ffff77e339a 
 nop   # 0x7ffff77e339b 
 jno  .+16   # 0x7ffff77e339c 0x7ffff77e339c  0 sources, dests: 0x7ffff77e33ac jge    0x7ffff77e33ac <BN_uadd+44>


.section .addr_0x7ffff77e33ac, "ax"
.global addr_0x7ffff77e33ac
.type addr_0x7ffff77e33ac, @function
addr_0x7ffff77e33ac:
 nop   # 0x7ffff77e33ac 
 nop   # 0x7ffff77e33ad 
 nop   # 0x7ffff77e33ae 
 nop   # 0x7ffff77e33af 
 nop   # 0x7ffff77e33b0 
 jo  .+231   # 0x7ffff77e33b1 0x7ffff77e33b1  0 sources, dests: 0x7ffff77e33b7 jge    0x7ffff77e3498 <BN_uadd+280>+6 bytes
 nop   # 0x7ffff77e33b7 
 nop   # 0x7ffff77e33b8 
 nop   # 0x7ffff77e33b9 
 nop   # 0x7ffff77e33ba 
 nop   # 0x7ffff77e33bb 
 nop   # 0x7ffff77e33bc 
 nop   # 0x7ffff77e33bd 
 nop   # 0x7ffff77e33be 
 nop   # 0x7ffff77e33bf 
 nop   # 0x7ffff77e33c0 
 nop   # 0x7ffff77e33c1 
 nop   # 0x7ffff77e33c2 
 nop   # 0x7ffff77e33c3 
 nop   # 0x7ffff77e33c4 
 nop   # 0x7ffff77e33c5 
 nop   # 0x7ffff77e33c6 
 nop   # 0x7ffff77e33c7 
 nop   # 0x7ffff77e33c8 
 nop   # 0x7ffff77e33c9 
 nop   # 0x7ffff77e33ca 
 nop   # 0x7ffff77e33cb 
 nop   # 0x7ffff77e33cc 
 nop   # 0x7ffff77e33cd 
 nop   # 0x7ffff77e33ce 
 nop   # 0x7ffff77e33cf 
 nop   # 0x7ffff77e33d0 
 nop   # 0x7ffff77e33d1 
 nop   # 0x7ffff77e33d2 
 jmp  .+46509   # 0x7ffff77e33d3 
 nop   # 0x7ffff77e33d8 
 nop   # 0x7ffff77e33d9 
 nop   # 0x7ffff77e33da 
 nop   # 0x7ffff77e33db 
 nop   # 0x7ffff77e33dc 
 nop   # 0x7ffff77e33dd 
 nop   # 0x7ffff77e33de 
 nop   # 0x7ffff77e33df 
 nop   # 0x7ffff77e33e0 
 nop   # 0x7ffff77e33e1 
 nop   # 0x7ffff77e33e2 
 nop   # 0x7ffff77e33e3 
 nop   # 0x7ffff77e33e4 
 nop   # 0x7ffff77e33e5 
 nop   # 0x7ffff77e33e6 
 nop   # 0x7ffff77e33e7 
 nop   # 0x7ffff77e33e8 
 nop   # 0x7ffff77e33e9 
 jno  .+124   # 0x7ffff77e33ea 0x7ffff77e33ea  0 sources, dests: 0x7ffff77e3466 je     0x7ffff77e3466 <BN_uadd+230>


.section .addr_0x7ffff77e343d, "ax"
.global addr_0x7ffff77e343d
.type addr_0x7ffff77e343d, @function
addr_0x7ffff77e343d:
 nop   # 0x7ffff77e343d 
 nop   # 0x7ffff77e343e 
 nop   # 0x7ffff77e343f 
 nop   # 0x7ffff77e3440 
 nop   # 0x7ffff77e3441 
 nop   # 0x7ffff77e3442 
 nop   # 0x7ffff77e3443 
 nop   # 0x7ffff77e3444 
 nop   # 0x7ffff77e3445 
 nop   # 0x7ffff77e3446 
 nop   # 0x7ffff77e3447 
 nop   # 0x7ffff77e3448 
 nop   # 0x7ffff77e3449 
 nop   # 0x7ffff77e344a 
 nop   # 0x7ffff77e344b 
 nop   # 0x7ffff77e344c 
 nop   # 0x7ffff77e344d 
 nop   # 0x7ffff77e344e 
 nop   # 0x7ffff77e344f 
 nop   # 0x7ffff77e3450 
 nop   # 0x7ffff77e3451 
 nop   # 0x7ffff77e3452 
 nop   # 0x7ffff77e3453 
 nop   # 0x7ffff77e3454 
 nop   # 0x7ffff77e3455 
 nop   # 0x7ffff77e3456 
 ret   # 0x7ffff77e3457 0x7ffff77e3457  0 sources, dests: 0x7ffff77e37a5 retq   


.section .addr_0x7ffff77e3466, "ax"
.global addr_0x7ffff77e3466
.type addr_0x7ffff77e3466, @function
addr_0x7ffff77e3466:
 nop   # 0x7ffff77e3466 
 nop   # 0x7ffff77e3467 
 nop   # 0x7ffff77e3468 
 jno  .-44   # 0x7ffff77e3469 0x7ffff77e3469  0 sources, dests: 0x7ffff77e343d je     0x7ffff77e343d <BN_uadd+189>


.section .addr_0x7ffff77e36e0, "ax"
.global addr_0x7ffff77e36e0
.type addr_0x7ffff77e36e0, @function
addr_0x7ffff77e36e0:
 nop   # 0x7ffff77e36e0 
 nop   # 0x7ffff77e36e1 
 nop   # 0x7ffff77e36e2 
 nop   # 0x7ffff77e36e3 
 nop   # 0x7ffff77e36e4 
 nop   # 0x7ffff77e36e5 
 nop   # 0x7ffff77e36e6 
 nop   # 0x7ffff77e36e7 
 nop   # 0x7ffff77e36e8 
 nop   # 0x7ffff77e36e9 
 nop   # 0x7ffff77e36ea 
 nop   # 0x7ffff77e36eb 
 nop   # 0x7ffff77e36ec 
 nop   # 0x7ffff77e36ed 
 nop   # 0x7ffff77e36ee 
 nop   # 0x7ffff77e36ef 
 nop   # 0x7ffff77e36f0 
 nop   # 0x7ffff77e36f1 
 nop   # 0x7ffff77e36f2 
 nop   # 0x7ffff77e36f3 
 nop   # 0x7ffff77e36f4 
 nop   # 0x7ffff77e36f5 
 nop   # 0x7ffff77e36f6 
 nop   # 0x7ffff77e36f7 
 nop   # 0x7ffff77e36f8 
 nop   # 0x7ffff77e36f9 
 nop   # 0x7ffff77e36fa 
 jno  .+165   # 0x7ffff77e36fb 0x7ffff77e36fb  0 sources, dests: 0x7ffff77e37a0 je     0x7ffff77e37a0 <BN_add+192>


.section .addr_0x7ffff77e37a0, "ax"
.global addr_0x7ffff77e37a0
.type addr_0x7ffff77e37a0, @function
addr_0x7ffff77e37a0:
 jmp  .-1056   # 0x7ffff77e37a0 
 nop   # 0x7ffff77e37a5 
 nop   # 0x7ffff77e37a6 
 nop   # 0x7ffff77e37a7 
 nop   # 0x7ffff77e37a8 
 nop   # 0x7ffff77e37a9 
 nop   # 0x7ffff77e37aa 
 nop   # 0x7ffff77e37ab 
 nop   # 0x7ffff77e37ac 
 nop   # 0x7ffff77e37ad 
 nop   # 0x7ffff77e37ae 
 nop   # 0x7ffff77e37af 
 nop   # 0x7ffff77e37b0 
 nop   # 0x7ffff77e37b1 
 nop   # 0x7ffff77e37b2 
 ret   # 0x7ffff77e37b3 0x7ffff77e37b3  0 sources, dests: 0x7ffff77ecc61 retq   


.section .addr_0x7ffff77e38e0, "ax"
.global addr_0x7ffff77e38e0
.type addr_0x7ffff77e38e0, @function
addr_0x7ffff77e38e0:
 nop   # 0x7ffff77e38e0 
 nop   # 0x7ffff77e38e1 
 nop   # 0x7ffff77e38e2 
 nop   # 0x7ffff77e38e3 
 nop   # 0x7ffff77e38e4 
 nop   # 0x7ffff77e38e5 
 nop   # 0x7ffff77e38e6 
 nop   # 0x7ffff77e38e7 
 nop   # 0x7ffff77e38e8 
 nop   # 0x7ffff77e38e9 
 nop   # 0x7ffff77e38ea 
 nop   # 0x7ffff77e38eb 
 nop   # 0x7ffff77e38ec 
 nop   # 0x7ffff77e38ed 
 nop   # 0x7ffff77e38ee 
 nop   # 0x7ffff77e38ef 
 nop   # 0x7ffff77e38f0 
 nop   # 0x7ffff77e38f1 
 nop   # 0x7ffff77e38f2 
 nop   # 0x7ffff77e38f3 
 nop   # 0x7ffff77e38f4 
 nop   # 0x7ffff77e38f5 
 nop   # 0x7ffff77e38f6 
 nop   # 0x7ffff77e38f7 
 nop   # 0x7ffff77e38f8 
 nop   # 0x7ffff77e38f9 
 nop   # 0x7ffff77e38fa 
 nop   # 0x7ffff77e38fb 
 nop   # 0x7ffff77e38fc 
 nop   # 0x7ffff77e38fd 
 nop   # 0x7ffff77e38fe 
 nop   # 0x7ffff77e38ff 
 nop   # 0x7ffff77e3900 
 nop   # 0x7ffff77e3901 
 nop   # 0x7ffff77e3902 
 nop   # 0x7ffff77e3903 
 nop   # 0x7ffff77e3904 
 nop   # 0x7ffff77e3905 
 nop   # 0x7ffff77e3906 
 nop   # 0x7ffff77e3907 
 nop   # 0x7ffff77e3908 
 nop   # 0x7ffff77e3909 
 nop   # 0x7ffff77e390a 
 nop   # 0x7ffff77e390b 
 nop   # 0x7ffff77e390c 
 nop   # 0x7ffff77e390d 
 nop   # 0x7ffff77e390e 
 nop   # 0x7ffff77e390f 
 nop   # 0x7ffff77e3910 
 nop   # 0x7ffff77e3911 
 nop   # 0x7ffff77e3912 
 nop   # 0x7ffff77e3913 
 nop   # 0x7ffff77e3914 
 nop   # 0x7ffff77e3915 
 jo  .+17   # 0x7ffff77e3916 0x7ffff77e3916  0 sources, dests: 0x7ffff77e3918 jle    0x7ffff77e3927 <BN_div+71>+2 bytes
 nop   # 0x7ffff77e3918 
 nop   # 0x7ffff77e3919 
 nop   # 0x7ffff77e391a 
 nop   # 0x7ffff77e391b 
 nop   # 0x7ffff77e391c 
 nop   # 0x7ffff77e391d 
 nop   # 0x7ffff77e391e 
 nop   # 0x7ffff77e391f 
 nop   # 0x7ffff77e3920 
 jo  .+223   # 0x7ffff77e3921 0x7ffff77e3921  0 sources, dests: 0x7ffff77e3927 je     0x7ffff77e3a00 <BN_div+288>+6 bytes
 nop   # 0x7ffff77e3927 
 nop   # 0x7ffff77e3928 
 nop   # 0x7ffff77e3929 
 nop   # 0x7ffff77e392a 
 nop   # 0x7ffff77e392b 
 nop   # 0x7ffff77e392c 
 jo  .+21   # 0x7ffff77e392d 0x7ffff77e392d  0 sources, dests: 0x7ffff77e392f jle    0x7ffff77e3942 <BN_div+98>+2 bytes
 nop   # 0x7ffff77e392f 
 nop   # 0x7ffff77e3930 
 nop   # 0x7ffff77e3931 
 nop   # 0x7ffff77e3932 
 nop   # 0x7ffff77e3933 
 nop   # 0x7ffff77e3934 
 nop   # 0x7ffff77e3935 
 nop   # 0x7ffff77e3936 
 nop   # 0x7ffff77e3937 
 nop   # 0x7ffff77e3938 
 nop   # 0x7ffff77e3939 
 nop   # 0x7ffff77e393a 
 nop   # 0x7ffff77e393b 
 jo  .+196   # 0x7ffff77e393c 0x7ffff77e393c  0 sources, dests: 0x7ffff77e3942 je     0x7ffff77e3a00 <BN_div+288>+6 bytes
 nop   # 0x7ffff77e3942 
 nop   # 0x7ffff77e3943 
 nop   # 0x7ffff77e3944 
 nop   # 0x7ffff77e3945 
 nop   # 0x7ffff77e3946 
 jo  .+265   # 0x7ffff77e3947 0x7ffff77e3947  0 sources, dests: 0x7ffff77e394d je     0x7ffff77e3a50 <BN_div+368>+6 bytes
 nop   # 0x7ffff77e394d 
 nop   # 0x7ffff77e394e 
 jo  .+353   # 0x7ffff77e394f 0x7ffff77e394f  0 sources, dests: 0x7ffff77e3955 je     0x7ffff77e3ab0 <BN_div+464>+6 bytes
 nop   # 0x7ffff77e3955 
 nop   # 0x7ffff77e3956 
 nop   # 0x7ffff77e3957 
 nop   # 0x7ffff77e3958 
 nop   # 0x7ffff77e3959 
 nop   # 0x7ffff77e395a 
 nop   # 0x7ffff77e395b 
 nop   # 0x7ffff77e395c 
 nop   # 0x7ffff77e395d 
 nop   # 0x7ffff77e395e 
 nop   # 0x7ffff77e395f 
 jmp  .+16976   # 0x7ffff77e3960 
 nop   # 0x7ffff77e3965 
 nop   # 0x7ffff77e3966 
 nop   # 0x7ffff77e3967 
 jmp  .+17368   # 0x7ffff77e3968 
 nop   # 0x7ffff77e396d 
 nop   # 0x7ffff77e396e 
 nop   # 0x7ffff77e396f 
 nop   # 0x7ffff77e3970 
 nop   # 0x7ffff77e3971 
 nop   # 0x7ffff77e3972 
 jmp  .+17357   # 0x7ffff77e3973 
 nop   # 0x7ffff77e3978 
 nop   # 0x7ffff77e3979 
 nop   # 0x7ffff77e397a 
 nop   # 0x7ffff77e397b 
 nop   # 0x7ffff77e397c 
 nop   # 0x7ffff77e397d 
 nop   # 0x7ffff77e397e 
 nop   # 0x7ffff77e397f 
 jmp  .+17344   # 0x7ffff77e3980 
.global spec_entry
spec_entry:     # 0x7ffff77e3985
 push %r12
 push %rbx

 mov $0x480000,%eax
 mov (%rax),%r12
 mov $0x480010,%eax
 mov (%rax),%rbx
 mov %rbx,%rax
 add %rax,%rax
 add %rbx,%rax
 shl $0x2,%rax
 add %rbx,%rax
 lea (%r12,%rax,1),%rdx
 mov %rdx,%rcx
 mov (%rcx),%rax
 
 pop %rbx
 pop %r12
 retq



.section .addr_0x7ffff77e39db, "ax"
.global addr_0x7ffff77e39db
.type addr_0x7ffff77e39db, @function
addr_0x7ffff77e39db:
 nop   # 0x7ffff77e39db 
 nop   # 0x7ffff77e39dc 
 nop   # 0x7ffff77e39dd 
 nop   # 0x7ffff77e39de 
 nop   # 0x7ffff77e39df 
 nop   # 0x7ffff77e39e0 
 nop   # 0x7ffff77e39e1 
 jno  .+254   # 0x7ffff77e39e2 0x7ffff77e39e2  0 sources, dests: 0x7ffff77e3ae0 jne    0x7ffff77e3ae0 <BN_div+512>


.section .addr_0x7ffff77e3a24, "ax"
.global addr_0x7ffff77e3a24
.type addr_0x7ffff77e3a24, @function
addr_0x7ffff77e3a24:
 nop   # 0x7ffff77e3a24 
 nop   # 0x7ffff77e3a25 
 nop   # 0x7ffff77e3a26 
 nop   # 0x7ffff77e3a27 
 nop   # 0x7ffff77e3a28 
 nop   # 0x7ffff77e3a29 
 nop   # 0x7ffff77e3a2a 
 nop   # 0x7ffff77e3a2b 
 nop   # 0x7ffff77e3a2c 
 nop   # 0x7ffff77e3a2d 
 nop   # 0x7ffff77e3a2e 
 nop   # 0x7ffff77e3a2f 
 nop   # 0x7ffff77e3a30 
 nop   # 0x7ffff77e3a31 
 nop   # 0x7ffff77e3a32 
 nop   # 0x7ffff77e3a33 
 nop   # 0x7ffff77e3a34 
 jo  .+1542   # 0x7ffff77e3a35 0x7ffff77e3a35  0 sources, dests: 0x7ffff77e3a3b jne    0x7ffff77e403b <BN_div+1883>+6 bytes
 nop   # 0x7ffff77e3a3b 
 nop   # 0x7ffff77e3a3c 
 nop   # 0x7ffff77e3a3d 
 nop   # 0x7ffff77e3a3e 
 nop   # 0x7ffff77e3a3f 
 nop   # 0x7ffff77e3a40 
 nop   # 0x7ffff77e3a41 
 nop   # 0x7ffff77e3a42 
 nop   # 0x7ffff77e3a43 
 nop   # 0x7ffff77e3a44 
 nop   # 0x7ffff77e3a45 
 nop   # 0x7ffff77e3a46 
 nop   # 0x7ffff77e3a47 
 nop   # 0x7ffff77e3a48 
 nop   # 0x7ffff77e3a49 
 nop   # 0x7ffff77e3a4a 
 nop   # 0x7ffff77e3a4b 
 ret   # 0x7ffff77e3a4c 0x7ffff77e3a4c  0 sources, dests: 0x7ffff77eccd4 retq   


.section .addr_0x7ffff77e3ae0, "ax"
.global addr_0x7ffff77e3ae0
.type addr_0x7ffff77e3ae0, @function
addr_0x7ffff77e3ae0:
 nop   # 0x7ffff77e3ae0 
 nop   # 0x7ffff77e3ae1 
 nop   # 0x7ffff77e3ae2 
 nop   # 0x7ffff77e3ae3 
 nop   # 0x7ffff77e3ae4 
 nop   # 0x7ffff77e3ae5 
 nop   # 0x7ffff77e3ae6 
 nop   # 0x7ffff77e3ae7 
 nop   # 0x7ffff77e3ae8 
 nop   # 0x7ffff77e3ae9 
 nop   # 0x7ffff77e3aea 
 nop   # 0x7ffff77e3aeb 
 nop   # 0x7ffff77e3aec 
 nop   # 0x7ffff77e3aed 
 nop   # 0x7ffff77e3aee 
 nop   # 0x7ffff77e3aef 
 nop   # 0x7ffff77e3af0 
 nop   # 0x7ffff77e3af1 
 nop   # 0x7ffff77e3af2 
 nop   # 0x7ffff77e3af3 
 nop   # 0x7ffff77e3af4 
 nop   # 0x7ffff77e3af5 
 nop   # 0x7ffff77e3af6 
 nop   # 0x7ffff77e3af7 
 nop   # 0x7ffff77e3af8 
 nop   # 0x7ffff77e3af9 
 nop   # 0x7ffff77e3afa 
 nop   # 0x7ffff77e3afb 
 nop   # 0x7ffff77e3afc 
 nop   # 0x7ffff77e3afd 
 nop   # 0x7ffff77e3afe 
 jmp  .+29905   # 0x7ffff77e3aff 
 nop   # 0x7ffff77e3b04 
 nop   # 0x7ffff77e3b05 
 jo  .-278   # 0x7ffff77e3b06 0x7ffff77e3b06  0 sources, dests: 0x7ffff77e3b0c je     0x7ffff77e39f0 <BN_div+272>+6 bytes
 nop   # 0x7ffff77e3b0c 
 nop   # 0x7ffff77e3b0d 
 nop   # 0x7ffff77e3b0e 
 nop   # 0x7ffff77e3b0f 
 nop   # 0x7ffff77e3b10 
 nop   # 0x7ffff77e3b11 
 nop   # 0x7ffff77e3b12 
 nop   # 0x7ffff77e3b13 
 nop   # 0x7ffff77e3b14 
 nop   # 0x7ffff77e3b15 
 nop   # 0x7ffff77e3b16 
 nop   # 0x7ffff77e3b17 
 nop   # 0x7ffff77e3b18 
 nop   # 0x7ffff77e3b19 
 nop   # 0x7ffff77e3b1a 
 nop   # 0x7ffff77e3b1b 
 nop   # 0x7ffff77e3b1c 
 nop   # 0x7ffff77e3b1d 
 nop   # 0x7ffff77e3b1e 
 nop   # 0x7ffff77e3b1f 
 nop   # 0x7ffff77e3b20 
 nop   # 0x7ffff77e3b21 
 nop   # 0x7ffff77e3b22 
 jno  .+767   # 0x7ffff77e3b23 0x7ffff77e3b23  0 sources, dests: 0x7ffff77e3e22 jne    0x7ffff77e3e22 <BN_div+1346>


.section .addr_0x7ffff77e3b33, "ax"
.global addr_0x7ffff77e3b33
.type addr_0x7ffff77e3b33, @function
addr_0x7ffff77e3b33:
 nop   # 0x7ffff77e3b33 
 nop   # 0x7ffff77e3b34 
 nop   # 0x7ffff77e3b35 
 nop   # 0x7ffff77e3b36 
 nop   # 0x7ffff77e3b37 
 nop   # 0x7ffff77e3b38 
 nop   # 0x7ffff77e3b39 
 nop   # 0x7ffff77e3b3a 
 nop   # 0x7ffff77e3b3b 
 nop   # 0x7ffff77e3b3c 
 nop   # 0x7ffff77e3b3d 
 nop   # 0x7ffff77e3b3e 
 nop   # 0x7ffff77e3b3f 
 nop   # 0x7ffff77e3b40 
 nop   # 0x7ffff77e3b41 
 nop   # 0x7ffff77e3b42 
 nop   # 0x7ffff77e3b43 
 nop   # 0x7ffff77e3b44 
 nop   # 0x7ffff77e3b45 
 nop   # 0x7ffff77e3b46 
 nop   # 0x7ffff77e3b47 
 nop   # 0x7ffff77e3b48 
 nop   # 0x7ffff77e3b49 
 nop   # 0x7ffff77e3b4a 
 nop   # 0x7ffff77e3b4b 
 nop   # 0x7ffff77e3b4c 
 nop   # 0x7ffff77e3b4d 
 nop   # 0x7ffff77e3b4e 
 nop   # 0x7ffff77e3b4f 
 nop   # 0x7ffff77e3b50 
 nop   # 0x7ffff77e3b51 
 nop   # 0x7ffff77e3b52 
 nop   # 0x7ffff77e3b53 
 nop   # 0x7ffff77e3b54 
 nop   # 0x7ffff77e3b55 
 nop   # 0x7ffff77e3b56 
 nop   # 0x7ffff77e3b57 
 nop   # 0x7ffff77e3b58 
 nop   # 0x7ffff77e3b59 
 nop   # 0x7ffff77e3b5a 
 nop   # 0x7ffff77e3b5b 
 nop   # 0x7ffff77e3b5c 
 nop   # 0x7ffff77e3b5d 
 nop   # 0x7ffff77e3b5e 
 nop   # 0x7ffff77e3b5f 
 nop   # 0x7ffff77e3b60 
 nop   # 0x7ffff77e3b61 
 nop   # 0x7ffff77e3b62 
 nop   # 0x7ffff77e3b63 
 nop   # 0x7ffff77e3b64 
 nop   # 0x7ffff77e3b65 
 nop   # 0x7ffff77e3b66 
 nop   # 0x7ffff77e3b67 
 nop   # 0x7ffff77e3b68 
 nop   # 0x7ffff77e3b69 
 nop   # 0x7ffff77e3b6a 
 nop   # 0x7ffff77e3b6b 
 nop   # 0x7ffff77e3b6c 
 nop   # 0x7ffff77e3b6d 
 nop   # 0x7ffff77e3b6e 
 nop   # 0x7ffff77e3b6f 
 nop   # 0x7ffff77e3b70 
 nop   # 0x7ffff77e3b71 
 nop   # 0x7ffff77e3b72 
 nop   # 0x7ffff77e3b73 
 nop   # 0x7ffff77e3b74 
 nop   # 0x7ffff77e3b75 
 nop   # 0x7ffff77e3b76 
 nop   # 0x7ffff77e3b77 
 nop   # 0x7ffff77e3b78 
 nop   # 0x7ffff77e3b79 
 nop   # 0x7ffff77e3b7a 
 nop   # 0x7ffff77e3b7b 
 nop   # 0x7ffff77e3b7c 
 nop   # 0x7ffff77e3b7d 
 nop   # 0x7ffff77e3b7e 
 nop   # 0x7ffff77e3b7f 
 nop   # 0x7ffff77e3b80 
 nop   # 0x7ffff77e3b81 
 nop   # 0x7ffff77e3b82 
 nop   # 0x7ffff77e3b83 
 nop   # 0x7ffff77e3b84 
 nop   # 0x7ffff77e3b85 
 nop   # 0x7ffff77e3b86 
 nop   # 0x7ffff77e3b87 
 jo  .+12   # 0x7ffff77e3b88 0x7ffff77e3b88  0 sources, dests: 0x7ffff77e3b8a je     0x7ffff77e3b94 <BN_div+692>+2 bytes
 nop   # 0x7ffff77e3b8a 
 nop   # 0x7ffff77e3b8b 
 nop   # 0x7ffff77e3b8c 
 nop   # 0x7ffff77e3b8d 
 nop   # 0x7ffff77e3b8e 
 nop   # 0x7ffff77e3b8f 
 nop   # 0x7ffff77e3b90 
 nop   # 0x7ffff77e3b91 
 nop   # 0x7ffff77e3b92 
 nop   # 0x7ffff77e3b93 
 nop   # 0x7ffff77e3b94 
 nop   # 0x7ffff77e3b95 
 nop   # 0x7ffff77e3b96 
 nop   # 0x7ffff77e3b97 
 nop   # 0x7ffff77e3b98 
 nop   # 0x7ffff77e3b99 
 nop   # 0x7ffff77e3b9a 
 nop   # 0x7ffff77e3b9b 
 nop   # 0x7ffff77e3b9c 
 nop   # 0x7ffff77e3b9d 
 nop   # 0x7ffff77e3b9e 
 nop   # 0x7ffff77e3b9f 
 nop   # 0x7ffff77e3ba0 
 nop   # 0x7ffff77e3ba1 
 nop   # 0x7ffff77e3ba2 
 nop   # 0x7ffff77e3ba3 
 nop   # 0x7ffff77e3ba4 
 nop   # 0x7ffff77e3ba5 
 nop   # 0x7ffff77e3ba6 
 nop   # 0x7ffff77e3ba7 
 nop   # 0x7ffff77e3ba8 
 nop   # 0x7ffff77e3ba9 
 nop   # 0x7ffff77e3baa 
 nop   # 0x7ffff77e3bab 
 nop   # 0x7ffff77e3bac 
 nop   # 0x7ffff77e3bad 
 nop   # 0x7ffff77e3bae 
 nop   # 0x7ffff77e3baf 
 nop   # 0x7ffff77e3bb0 
 jo  .+766   # 0x7ffff77e3bb1 0x7ffff77e3bb1  0 sources, dests: 0x7ffff77e3bb7 jge    0x7ffff77e3eaf <BN_div+1487>+6 bytes
 nop   # 0x7ffff77e3bb7 
 nop   # 0x7ffff77e3bb8 
 nop   # 0x7ffff77e3bb9 
 nop   # 0x7ffff77e3bba 
 nop   # 0x7ffff77e3bbb 
 nop   # 0x7ffff77e3bbc 
 nop   # 0x7ffff77e3bbd 
 nop   # 0x7ffff77e3bbe 
 nop   # 0x7ffff77e3bbf 
 nop   # 0x7ffff77e3bc0 
 nop   # 0x7ffff77e3bc1 
 nop   # 0x7ffff77e3bc2 
 nop   # 0x7ffff77e3bc3 
 nop   # 0x7ffff77e3bc4 
 nop   # 0x7ffff77e3bc5 
 nop   # 0x7ffff77e3bc6 
 nop   # 0x7ffff77e3bc7 
 nop   # 0x7ffff77e3bc8 
 nop   # 0x7ffff77e3bc9 
 nop   # 0x7ffff77e3bca 
 nop   # 0x7ffff77e3bcb 
 nop   # 0x7ffff77e3bcc 
 nop   # 0x7ffff77e3bcd 
 jo  .+818   # 0x7ffff77e3bce 0x7ffff77e3bce  0 sources, dests: 0x7ffff77e3bd4 jge    0x7ffff77e3f00 <BN_div+1568>+6 bytes
 nop   # 0x7ffff77e3bd4 
 nop   # 0x7ffff77e3bd5 
 nop   # 0x7ffff77e3bd6 
 nop   # 0x7ffff77e3bd7 
 nop   # 0x7ffff77e3bd8 
 nop   # 0x7ffff77e3bd9 
 nop   # 0x7ffff77e3bda 
 nop   # 0x7ffff77e3bdb 
 nop   # 0x7ffff77e3bdc 
 nop   # 0x7ffff77e3bdd 
 nop   # 0x7ffff77e3bde 
 jo  .+1006   # 0x7ffff77e3bdf 0x7ffff77e3bdf  0 sources, dests: 0x7ffff77e3be5 je     0x7ffff77e3fcd <BN_div+1773>+6 bytes
 nop   # 0x7ffff77e3be5 
 nop   # 0x7ffff77e3be6 
 nop   # 0x7ffff77e3be7 
 nop   # 0x7ffff77e3be8 
 nop   # 0x7ffff77e3be9 
 nop   # 0x7ffff77e3bea 
 jno  .+869   # 0x7ffff77e3beb 0x7ffff77e3beb  0 sources, dests: 0x7ffff77e3f50 jne    0x7ffff77e3f50 <BN_div+1648>


.section .addr_0x7ffff77e3bf9, "ax"
.global addr_0x7ffff77e3bf9
.type addr_0x7ffff77e3bf9, @function
addr_0x7ffff77e3bf9:
 nop   # 0x7ffff77e3bf9 
 nop   # 0x7ffff77e3bfa 
 nop   # 0x7ffff77e3bfb 
 nop   # 0x7ffff77e3bfc 
 jo  .+306   # 0x7ffff77e3bfd 0x7ffff77e3bfd  0 sources, dests: 0x7ffff77e3c03 jle    0x7ffff77e3d2f <BN_div+1103>+6 bytes
 nop   # 0x7ffff77e3c03 
 nop   # 0x7ffff77e3c04 
 nop   # 0x7ffff77e3c05 
 nop   # 0x7ffff77e3c06 
 nop   # 0x7ffff77e3c07 
 nop   # 0x7ffff77e3c08 
 nop   # 0x7ffff77e3c09 
 nop   # 0x7ffff77e3c0a 
 nop   # 0x7ffff77e3c0b 
 nop   # 0x7ffff77e3c0c 
 nop   # 0x7ffff77e3c0d 
 nop   # 0x7ffff77e3c0e 
 nop   # 0x7ffff77e3c0f 
 nop   # 0x7ffff77e3c10 
 nop   # 0x7ffff77e3c11 
 nop   # 0x7ffff77e3c12 
 nop   # 0x7ffff77e3c13 
 nop   # 0x7ffff77e3c14 
 nop   # 0x7ffff77e3c15 
 nop   # 0x7ffff77e3c16 
 nop   # 0x7ffff77e3c17 
 nop   # 0x7ffff77e3c18 
 nop   # 0x7ffff77e3c19 
 nop   # 0x7ffff77e3c1a 
 nop   # 0x7ffff77e3c1b 
 nop   # 0x7ffff77e3c1c 
 nop   # 0x7ffff77e3c1d 
 nop   # 0x7ffff77e3c1e 
 nop   # 0x7ffff77e3c1f 
 nop   # 0x7ffff77e3c20 
 nop   # 0x7ffff77e3c21 
 nop   # 0x7ffff77e3c22 
 nop   # 0x7ffff77e3c23 
 nop   # 0x7ffff77e3c24 
 nop   # 0x7ffff77e3c25 
 nop   # 0x7ffff77e3c26 
 nop   # 0x7ffff77e3c27 
 nop   # 0x7ffff77e3c28 
 nop   # 0x7ffff77e3c29 
 nop   # 0x7ffff77e3c2a 
 nop   # 0x7ffff77e3c2b 
 nop   # 0x7ffff77e3c2c 
 nop   # 0x7ffff77e3c2d 
 nop   # 0x7ffff77e3c2e 
 nop   # 0x7ffff77e3c2f 
 nop   # 0x7ffff77e3c30 
 nop   # 0x7ffff77e3c31 
 nop   # 0x7ffff77e3c32 
 nop   # 0x7ffff77e3c33 
 nop   # 0x7ffff77e3c34 
 nop   # 0x7ffff77e3c35 
 nop   # 0x7ffff77e3c36 
 nop   # 0x7ffff77e3c37 
 nop   # 0x7ffff77e3c38 
 nop   # 0x7ffff77e3c39 
 nop   # 0x7ffff77e3c3a 
 nop   # 0x7ffff77e3c3b 
 nop   # 0x7ffff77e3c3c 
 nop   # 0x7ffff77e3c3d 
 nop   # 0x7ffff77e3c3e 
 nop   # 0x7ffff77e3c3f 
 nop   # 0x7ffff77e3c40 
 nop   # 0x7ffff77e3c41 
 nop   # 0x7ffff77e3c42 
 nop   # 0x7ffff77e3c43 
 nop   # 0x7ffff77e3c44 
 nop   # 0x7ffff77e3c45 
 nop   # 0x7ffff77e3c46 
 nop   # 0x7ffff77e3c47 
 nop   # 0x7ffff77e3c48 
 nop   # 0x7ffff77e3c49 
 nop   # 0x7ffff77e3c4a 
 nop   # 0x7ffff77e3c4b 
 nop   # 0x7ffff77e3c4c 
 nop   # 0x7ffff77e3c4d 
 nop   # 0x7ffff77e3c4e 
 nop   # 0x7ffff77e3c4f 
 nop   # 0x7ffff77e3c50 
 nop   # 0x7ffff77e3c51 
 nop   # 0x7ffff77e3c52 
 nop   # 0x7ffff77e3c53 
 nop   # 0x7ffff77e3c54 
 nop   # 0x7ffff77e3c55 
 nop   # 0x7ffff77e3c56 
 nop   # 0x7ffff77e3c57 
 nop   # 0x7ffff77e3c58 
 nop   # 0x7ffff77e3c59 
 nop   # 0x7ffff77e3c5a 
 nop   # 0x7ffff77e3c5b 
 nop   # 0x7ffff77e3c5c 
 nop   # 0x7ffff77e3c5d 
 nop   # 0x7ffff77e3c5e 
 nop   # 0x7ffff77e3c5f 
 nop   # 0x7ffff77e3c60 
 nop   # 0x7ffff77e3c61 
 nop   # 0x7ffff77e3c62 
 nop   # 0x7ffff77e3c63 
 nop   # 0x7ffff77e3c64 
 nop   # 0x7ffff77e3c65 
 nop   # 0x7ffff77e3c66 
 nop   # 0x7ffff77e3c67 
 nop   # 0x7ffff77e3c68 
 nop   # 0x7ffff77e3c69 
 nop   # 0x7ffff77e3c6a 
 nop   # 0x7ffff77e3c6b 
 nop   # 0x7ffff77e3c6c 
 nop   # 0x7ffff77e3c6d 
 jo  .+74   # 0x7ffff77e3c6e 0x7ffff77e3c6e  0 sources, dests: 0x7ffff77e3c70,0x7ffff77e3c70 je     0x7ffff77e3cb8 <BN_div+984>+2 bytes
 nop   # 0x7ffff77e3c70 
 nop   # 0x7ffff77e3c71 
 nop   # 0x7ffff77e3c72 
 nop   # 0x7ffff77e3c73 
 nop   # 0x7ffff77e3c74 
 nop   # 0x7ffff77e3c75 
 nop   # 0x7ffff77e3c76 
 nop   # 0x7ffff77e3c77 
 nop   # 0x7ffff77e3c78 
 nop   # 0x7ffff77e3c79 
 nop   # 0x7ffff77e3c7a 
 nop   # 0x7ffff77e3c7b 
 nop   # 0x7ffff77e3c7c 
 nop   # 0x7ffff77e3c7d 
 nop   # 0x7ffff77e3c7e 
 nop   # 0x7ffff77e3c7f 
 nop   # 0x7ffff77e3c80 
 nop   # 0x7ffff77e3c81 
 nop   # 0x7ffff77e3c82 
 nop   # 0x7ffff77e3c83 
 nop   # 0x7ffff77e3c84 
 nop   # 0x7ffff77e3c85 
 jo  .+34   # 0x7ffff77e3c86 0x7ffff77e3c86  0 sources, dests: 0x7ffff77e3c88,0x7ffff77e3c88 jbe    0x7ffff77e3ca8 <BN_div+968>+2 bytes
 jmp  .+48   # 0x7ffff77e3c88 


.section .addr_0x7ffff77e3cb8, "ax"
.global addr_0x7ffff77e3cb8
.type addr_0x7ffff77e3cb8, @function
addr_0x7ffff77e3cb8:
 nop   # 0x7ffff77e3cb8 
 nop   # 0x7ffff77e3cb9 
 nop   # 0x7ffff77e3cba 
 nop   # 0x7ffff77e3cbb 
 nop   # 0x7ffff77e3cbc 
 nop   # 0x7ffff77e3cbd 
 nop   # 0x7ffff77e3cbe 
 nop   # 0x7ffff77e3cbf 
 nop   # 0x7ffff77e3cc0 
 nop   # 0x7ffff77e3cc1 
 nop   # 0x7ffff77e3cc2 
 nop   # 0x7ffff77e3cc3 
 nop   # 0x7ffff77e3cc4 
 nop   # 0x7ffff77e3cc5 
 nop   # 0x7ffff77e3cc6 
 nop   # 0x7ffff77e3cc7 
 nop   # 0x7ffff77e3cc8 
 nop   # 0x7ffff77e3cc9 
 nop   # 0x7ffff77e3cca 
 jmp  .+43765   # 0x7ffff77e3ccb 
 nop   # 0x7ffff77e3cd0 
 nop   # 0x7ffff77e3cd1 
 nop   # 0x7ffff77e3cd2 
 nop   # 0x7ffff77e3cd3 
 nop   # 0x7ffff77e3cd4 
 nop   # 0x7ffff77e3cd5 
 nop   # 0x7ffff77e3cd6 
 nop   # 0x7ffff77e3cd7 
 nop   # 0x7ffff77e3cd8 
 nop   # 0x7ffff77e3cd9 
 nop   # 0x7ffff77e3cda 
 nop   # 0x7ffff77e3cdb 
 nop   # 0x7ffff77e3cdc 
 nop   # 0x7ffff77e3cdd 
 nop   # 0x7ffff77e3cde 
 nop   # 0x7ffff77e3cdf 
 nop   # 0x7ffff77e3ce0 
 nop   # 0x7ffff77e3ce1 
 nop   # 0x7ffff77e3ce2 
 nop   # 0x7ffff77e3ce3 
 nop   # 0x7ffff77e3ce4 
 nop   # 0x7ffff77e3ce5 
 nop   # 0x7ffff77e3ce6 
 nop   # 0x7ffff77e3ce7 
 nop   # 0x7ffff77e3ce8 
 nop   # 0x7ffff77e3ce9 
 nop   # 0x7ffff77e3cea 
 nop   # 0x7ffff77e3ceb 
 nop   # 0x7ffff77e3cec 
 nop   # 0x7ffff77e3ced 
 nop   # 0x7ffff77e3cee 
 nop   # 0x7ffff77e3cef 
 nop   # 0x7ffff77e3cf0 
 nop   # 0x7ffff77e3cf1 
 nop   # 0x7ffff77e3cf2 
 nop   # 0x7ffff77e3cf3 
 nop   # 0x7ffff77e3cf4 
 nop   # 0x7ffff77e3cf5 
 jmp  .+44234   # 0x7ffff77e3cf6 
 nop   # 0x7ffff77e3cfb 
 nop   # 0x7ffff77e3cfc 
 nop   # 0x7ffff77e3cfd 
 jo  .+244   # 0x7ffff77e3cfe 0x7ffff77e3cfe  0 sources, dests: 0x7ffff77e3d04,0x7ffff77e3d04 jne    0x7ffff77e3df2 <BN_div+1298>+6 bytes
 nop   # 0x7ffff77e3d04 
 nop   # 0x7ffff77e3d05 
 nop   # 0x7ffff77e3d06 
 nop   # 0x7ffff77e3d07 
 nop   # 0x7ffff77e3d08 
 nop   # 0x7ffff77e3d09 
 nop   # 0x7ffff77e3d0a 
 nop   # 0x7ffff77e3d0b 
 mov 4(%rsi),%eax   # 0x7ffff77e3d0c Bitmask jump[1]: 0x7ffff77e3d15  0 sources, dests: 0x7ffff77e3c60,0x7ffff77e3d1b jne    0x7ffff77e3c60 <BN_div+896>
 sarl 4(%rsi)   # 0x7ffff77e3d0f 
 and  $0x1,%eax   # 0x7ffff77e3d12 
 jne .-181   # 0x7ffff77e3d15 
 nop   # 0x7ffff77e3d1b 
 nop   # 0x7ffff77e3d1c 
 nop   # 0x7ffff77e3d1d 
 nop   # 0x7ffff77e3d1e 
 nop   # 0x7ffff77e3d1f 
 nop   # 0x7ffff77e3d20 
 nop   # 0x7ffff77e3d21 
 nop   # 0x7ffff77e3d22 
 nop   # 0x7ffff77e3d23 
 nop   # 0x7ffff77e3d24 
 nop   # 0x7ffff77e3d25 
 nop   # 0x7ffff77e3d26 
 nop   # 0x7ffff77e3d27 
 nop   # 0x7ffff77e3d28 
 nop   # 0x7ffff77e3d29 
 nop   # 0x7ffff77e3d2a 
 nop   # 0x7ffff77e3d2b 
 nop   # 0x7ffff77e3d2c 
 nop   # 0x7ffff77e3d2d 
 nop   # 0x7ffff77e3d2e 
 nop   # 0x7ffff77e3d2f 
 nop   # 0x7ffff77e3d30 
 nop   # 0x7ffff77e3d31 
 nop   # 0x7ffff77e3d32 
 nop   # 0x7ffff77e3d33 
 nop   # 0x7ffff77e3d34 
 nop   # 0x7ffff77e3d35 
 nop   # 0x7ffff77e3d36 
 nop   # 0x7ffff77e3d37 
 nop   # 0x7ffff77e3d38 
 jo  .+47   # 0x7ffff77e3d39 0x7ffff77e3d39  0 sources, dests: 0x7ffff77e3d3b jle    0x7ffff77e3d68 <BN_div+1160>+2 bytes
 nop   # 0x7ffff77e3d3b 
 nop   # 0x7ffff77e3d3c 
 nop   # 0x7ffff77e3d3d 
 nop   # 0x7ffff77e3d3e 
 nop   # 0x7ffff77e3d3f 
 nop   # 0x7ffff77e3d40 
 nop   # 0x7ffff77e3d41 
 nop   # 0x7ffff77e3d42 
 nop   # 0x7ffff77e3d43 
 nop   # 0x7ffff77e3d44 
 nop   # 0x7ffff77e3d45 
 nop   # 0x7ffff77e3d46 
 nop   # 0x7ffff77e3d47 
 nop   # 0x7ffff77e3d48 
 nop   # 0x7ffff77e3d49 
 nop   # 0x7ffff77e3d4a 
 jmp  .+10   # 0x7ffff77e3d4b 


.section .addr_0x7ffff77e3d50, "ax"
.global addr_0x7ffff77e3d50
.type addr_0x7ffff77e3d50, @function
addr_0x7ffff77e3d50:
 nop   # 0x7ffff77e3d50 
 nop   # 0x7ffff77e3d51 
 nop   # 0x7ffff77e3d52 
 jo  .+13   # 0x7ffff77e3d53 0x7ffff77e3d53  0 sources, dests: 0x7ffff77e3d55,0x7ffff77e3d55 je     0x7ffff77e3d60 <BN_div+1152>+2 bytes
 mov 8(%rsi),%eax   # 0x7ffff77e3d55 Bitmask jump[2]: 0x7ffff77e3d5e  0 sources, dests: 0x7ffff77e3d50,0x7ffff77e3d50,0x7ffff77e3d60 je     0x7ffff77e3d50 <BN_div+1136>
 sarl 8(%rsi)   # 0x7ffff77e3d58 
 and  $0x1,%eax   # 0x7ffff77e3d5b 
 jne .-14   # 0x7ffff77e3d5e 
 nop   # 0x7ffff77e3d60 
 nop   # 0x7ffff77e3d61 
 nop   # 0x7ffff77e3d62 
 nop   # 0x7ffff77e3d63 
 nop   # 0x7ffff77e3d64 
 nop   # 0x7ffff77e3d65 
 nop   # 0x7ffff77e3d66 
 nop   # 0x7ffff77e3d67 
 nop   # 0x7ffff77e3d68 
 nop   # 0x7ffff77e3d69 
 nop   # 0x7ffff77e3d6a 
 jo  .+34   # 0x7ffff77e3d6b 0x7ffff77e3d6b  0 sources, dests: 0x7ffff77e3d6d je     0x7ffff77e3d8d <BN_div+1197>+2 bytes
 nop   # 0x7ffff77e3d6d 
 nop   # 0x7ffff77e3d6e 
 nop   # 0x7ffff77e3d6f 
 nop   # 0x7ffff77e3d70 
 nop   # 0x7ffff77e3d71 
 nop   # 0x7ffff77e3d72 
 nop   # 0x7ffff77e3d73 
 nop   # 0x7ffff77e3d74 
 nop   # 0x7ffff77e3d75 
 nop   # 0x7ffff77e3d76 
 nop   # 0x7ffff77e3d77 
 nop   # 0x7ffff77e3d78 
 nop   # 0x7ffff77e3d79 
 nop   # 0x7ffff77e3d7a 
 nop   # 0x7ffff77e3d7b 
 nop   # 0x7ffff77e3d7c 
 jmp  .+29699   # 0x7ffff77e3d7d 
 nop   # 0x7ffff77e3d82 
 nop   # 0x7ffff77e3d83 
 nop   # 0x7ffff77e3d84 
 nop   # 0x7ffff77e3d85 
 nop   # 0x7ffff77e3d86 
 jo  .+6   # 0x7ffff77e3d87 0x7ffff77e3d87  0 sources, dests: 0x7ffff77e3d89 je     0x7ffff77e3d8d <BN_div+1197>+2 bytes
 nop   # 0x7ffff77e3d89 
 nop   # 0x7ffff77e3d8a 
 nop   # 0x7ffff77e3d8b 
 nop   # 0x7ffff77e3d8c 
 nop   # 0x7ffff77e3d8d 
 nop   # 0x7ffff77e3d8e 
 nop   # 0x7ffff77e3d8f 
 nop   # 0x7ffff77e3d90 
 nop   # 0x7ffff77e3d91 
 nop   # 0x7ffff77e3d92 
 jo  .+43   # 0x7ffff77e3d93 0x7ffff77e3d93  0 sources, dests: 0x7ffff77e3d95 je     0x7ffff77e3dbe <BN_div+1246>+2 bytes
 nop   # 0x7ffff77e3d95 
 nop   # 0x7ffff77e3d96 
 nop   # 0x7ffff77e3d97 
 nop   # 0x7ffff77e3d98 
 nop   # 0x7ffff77e3d99 
 nop   # 0x7ffff77e3d9a 
 jo  .+35   # 0x7ffff77e3d9b 0x7ffff77e3d9b  0 sources, dests: 0x7ffff77e3d9d jle    0x7ffff77e3dbe <BN_div+1246>+2 bytes
 nop   # 0x7ffff77e3d9d 
 nop   # 0x7ffff77e3d9e 
 nop   # 0x7ffff77e3d9f 
 nop   # 0x7ffff77e3da0 
 nop   # 0x7ffff77e3da1 
 nop   # 0x7ffff77e3da2 
 nop   # 0x7ffff77e3da3 
 nop   # 0x7ffff77e3da4 
 nop   # 0x7ffff77e3da5 
 nop   # 0x7ffff77e3da6 
 nop   # 0x7ffff77e3da7 
 jmp  .+7   # 0x7ffff77e3da8 
 nop   # 0x7ffff77e3daa 
 nop   # 0x7ffff77e3dab 
 nop   # 0x7ffff77e3dac 
 jo  .+13   # 0x7ffff77e3dad 0x7ffff77e3dad  0 sources, dests: 0x7ffff77e3daf je     0x7ffff77e3dba <BN_div+1242>+2 bytes
 mov 12(%rsi),%eax   # 0x7ffff77e3daf Bitmask jump[3]: 0x7ffff77e3db8  0 sources, dests: 0x7ffff77e3daa,0x7ffff77e3dba je     0x7ffff77e3daa <BN_div+1226>
 sarl 12(%rsi)   # 0x7ffff77e3db2 
 and  $0x1,%eax   # 0x7ffff77e3db5 
 jne .-14   # 0x7ffff77e3db8 
 nop   # 0x7ffff77e3dba 
 nop   # 0x7ffff77e3dbb 
 nop   # 0x7ffff77e3dbc 
 nop   # 0x7ffff77e3dbd 
 nop   # 0x7ffff77e3dbe 
 nop   # 0x7ffff77e3dbf 
 nop   # 0x7ffff77e3dc0 
 nop   # 0x7ffff77e3dc1 
 nop   # 0x7ffff77e3dc2 
 nop   # 0x7ffff77e3dc3 
 nop   # 0x7ffff77e3dc4 
 nop   # 0x7ffff77e3dc5 
 nop   # 0x7ffff77e3dc6 
 jmp  .+16121   # 0x7ffff77e3dc7 
 jmp  .-936   # 0x7ffff77e3dcc 


.section .addr_0x7ffff77e3e22, "ax"
.global addr_0x7ffff77e3e22
.type addr_0x7ffff77e3e22, @function
addr_0x7ffff77e3e22:
 nop   # 0x7ffff77e3e22 
 nop   # 0x7ffff77e3e23 
 nop   # 0x7ffff77e3e24 
 nop   # 0x7ffff77e3e25 
 nop   # 0x7ffff77e3e26 
 nop   # 0x7ffff77e3e27 
 nop   # 0x7ffff77e3e28 
 nop   # 0x7ffff77e3e29 
 nop   # 0x7ffff77e3e2a 
 nop   # 0x7ffff77e3e2b 
 nop   # 0x7ffff77e3e2c 
 nop   # 0x7ffff77e3e2d 
 nop   # 0x7ffff77e3e2e 
 nop   # 0x7ffff77e3e2f 
 nop   # 0x7ffff77e3e30 
 nop   # 0x7ffff77e3e31 
 nop   # 0x7ffff77e3e32 
 nop   # 0x7ffff77e3e33 
 nop   # 0x7ffff77e3e34 
 jno  .+72   # 0x7ffff77e3e35 0x7ffff77e3e35  0 sources, dests: 0x7ffff77e3e7d jg     0x7ffff77e3e7d <BN_div+1437>


.section .addr_0x7ffff77e3e7d, "ax"
.global addr_0x7ffff77e3e7d
.type addr_0x7ffff77e3e7d, @function
addr_0x7ffff77e3e7d:
 nop   # 0x7ffff77e3e7d 
 nop   # 0x7ffff77e3e7e 
 nop   # 0x7ffff77e3e7f 
 nop   # 0x7ffff77e3e80 
 nop   # 0x7ffff77e3e81 
 nop   # 0x7ffff77e3e82 
 nop   # 0x7ffff77e3e83 
 nop   # 0x7ffff77e3e84 
 nop   # 0x7ffff77e3e85 
 nop   # 0x7ffff77e3e86 
 nop   # 0x7ffff77e3e87 
 nop   # 0x7ffff77e3e88 
 jo  .+276   # 0x7ffff77e3e89 0x7ffff77e3e89  0 sources, dests: 0x7ffff77e3e8f jge    0x7ffff77e3f9d <BN_div+1725>+6 bytes
 nop   # 0x7ffff77e3e8f 
 nop   # 0x7ffff77e3e90 
 nop   # 0x7ffff77e3e91 
 nop   # 0x7ffff77e3e92 
 nop   # 0x7ffff77e3e93 
 nop   # 0x7ffff77e3e94 
 nop   # 0x7ffff77e3e95 
 nop   # 0x7ffff77e3e96 
 nop   # 0x7ffff77e3e97 
 nop   # 0x7ffff77e3e98 
 nop   # 0x7ffff77e3e99 
 nop   # 0x7ffff77e3e9a 
 nop   # 0x7ffff77e3e9b 
 nop   # 0x7ffff77e3e9c 
 nop   # 0x7ffff77e3e9d 
 nop   # 0x7ffff77e3e9e 
 nop   # 0x7ffff77e3e9f 
 nop   # 0x7ffff77e3ea0 
 nop   # 0x7ffff77e3ea1 
 nop   # 0x7ffff77e3ea2 
 nop   # 0x7ffff77e3ea3 
 nop   # 0x7ffff77e3ea4 
 nop   # 0x7ffff77e3ea5 
 nop   # 0x7ffff77e3ea6 
 nop   # 0x7ffff77e3ea7 
 nop   # 0x7ffff77e3ea8 
 nop   # 0x7ffff77e3ea9 
 jmp  .-887   # 0x7ffff77e3eaa 


.section .addr_0x7ffff77e3f50, "ax"
.global addr_0x7ffff77e3f50
.type addr_0x7ffff77e3f50, @function
addr_0x7ffff77e3f50:
 nop   # 0x7ffff77e3f50 
 nop   # 0x7ffff77e3f51 
 nop   # 0x7ffff77e3f52 
 nop   # 0x7ffff77e3f53 
 jmp  .-859   # 0x7ffff77e3f54 


.section .addr_0x7ffff77e6bb0, "ax"
.global addr_0x7ffff77e6bb0
.type addr_0x7ffff77e6bb0, @function
addr_0x7ffff77e6bb0:
 nop   # 0x7ffff77e6bb0 
 nop   # 0x7ffff77e6bb1 
 nop   # 0x7ffff77e6bb2 
 nop   # 0x7ffff77e6bb3 
 nop   # 0x7ffff77e6bb4 
 nop   # 0x7ffff77e6bb5 
 nop   # 0x7ffff77e6bb6 
 nop   # 0x7ffff77e6bb7 
 nop   # 0x7ffff77e6bb8 
 nop   # 0x7ffff77e6bb9 
 nop   # 0x7ffff77e6bba 
 nop   # 0x7ffff77e6bbb 
 nop   # 0x7ffff77e6bbc 
 jo  .+59   # 0x7ffff77e6bbd 0x7ffff77e6bbd  0 sources, dests: 0x7ffff77e6bbf je     0x7ffff77e6bf8 <BN_num_bits_word+72>+2 bytes
 nop   # 0x7ffff77e6bbf 
 nop   # 0x7ffff77e6bc0 
 nop   # 0x7ffff77e6bc1 
 nop   # 0x7ffff77e6bc2 
 nop   # 0x7ffff77e6bc3 
 nop   # 0x7ffff77e6bc4 
 nop   # 0x7ffff77e6bc5 
 nop   # 0x7ffff77e6bc6 
 nop   # 0x7ffff77e6bc7 
 nop   # 0x7ffff77e6bc8 
 nop   # 0x7ffff77e6bc9 
 nop   # 0x7ffff77e6bca 
 nop   # 0x7ffff77e6bcb 
 jo  .+124   # 0x7ffff77e6bcc 0x7ffff77e6bcc  0 sources, dests: 0x7ffff77e6bce je     0x7ffff77e6c48 <BN_num_bits_word+152>+2 bytes
 nop   # 0x7ffff77e6bce 
 nop   # 0x7ffff77e6bcf 
 nop   # 0x7ffff77e6bd0 
 nop   # 0x7ffff77e6bd1 
 nop   # 0x7ffff77e6bd2 
 nop   # 0x7ffff77e6bd3 
 nop   # 0x7ffff77e6bd4 
 nop   # 0x7ffff77e6bd5 
 nop   # 0x7ffff77e6bd6 
 nop   # 0x7ffff77e6bd7 
 nop   # 0x7ffff77e6bd8 
 nop   # 0x7ffff77e6bd9 
 nop   # 0x7ffff77e6bda 
 jo  .+149   # 0x7ffff77e6bdb 0x7ffff77e6bdb  0 sources, dests: 0x7ffff77e6be1 je     0x7ffff77e6c70 <BN_num_bits_word+192>+6 bytes
 nop   # 0x7ffff77e6be1 
 nop   # 0x7ffff77e6be2 
 nop   # 0x7ffff77e6be3 
 nop   # 0x7ffff77e6be4 
 nop   # 0x7ffff77e6be5 
 nop   # 0x7ffff77e6be6 
 nop   # 0x7ffff77e6be7 
 nop   # 0x7ffff77e6be8 
 nop   # 0x7ffff77e6be9 
 nop   # 0x7ffff77e6bea 
 nop   # 0x7ffff77e6beb 
 nop   # 0x7ffff77e6bec 
 nop   # 0x7ffff77e6bed 
 nop   # 0x7ffff77e6bee 
 nop   # 0x7ffff77e6bef 
 nop   # 0x7ffff77e6bf0 
 nop   # 0x7ffff77e6bf1 
 nop   # 0x7ffff77e6bf2 
 ret   # 0x7ffff77e6bf3 0x7ffff77e6bf3  0 sources, dests: 0x7ffff77e6d06 retq   


.section .addr_0x7ffff77e6ce0, "ax"
.global addr_0x7ffff77e6ce0
.type addr_0x7ffff77e6ce0, @function
addr_0x7ffff77e6ce0:
 nop   # 0x7ffff77e6ce0 
 nop   # 0x7ffff77e6ce1 
 nop   # 0x7ffff77e6ce2 
 nop   # 0x7ffff77e6ce3 
 nop   # 0x7ffff77e6ce4 
 jno  .+11   # 0x7ffff77e6ce5 0x7ffff77e6ce5  0 sources, dests: 0x7ffff77e6cf0 jne    0x7ffff77e6cf0 <BN_num_bits+16>


.section .addr_0x7ffff77e6cf0, "ax"
.global addr_0x7ffff77e6cf0
.type addr_0x7ffff77e6cf0, @function
addr_0x7ffff77e6cf0:
 nop   # 0x7ffff77e6cf0 
 nop   # 0x7ffff77e6cf1 
 nop   # 0x7ffff77e6cf2 
 nop   # 0x7ffff77e6cf3 
 nop   # 0x7ffff77e6cf4 
 nop   # 0x7ffff77e6cf5 
 nop   # 0x7ffff77e6cf6 
 nop   # 0x7ffff77e6cf7 
 nop   # 0x7ffff77e6cf8 
 nop   # 0x7ffff77e6cf9 
 nop   # 0x7ffff77e6cfa 
 nop   # 0x7ffff77e6cfb 
 nop   # 0x7ffff77e6cfc 
 nop   # 0x7ffff77e6cfd 
 nop   # 0x7ffff77e6cfe 
 nop   # 0x7ffff77e6cff 
 nop   # 0x7ffff77e6d00 
 jmp  .-337   # 0x7ffff77e6d01 
 nop   # 0x7ffff77e6d06 
 nop   # 0x7ffff77e6d07 
 nop   # 0x7ffff77e6d08 
 ret   # 0x7ffff77e6d09 0x7ffff77e6d09  0 sources, dests: 0x7ffff77eb1bf retq   


.section .addr_0x7ffff77e7130, "ax"
.global addr_0x7ffff77e7130
.type addr_0x7ffff77e7130, @function
addr_0x7ffff77e7130:
 nop   # 0x7ffff77e7130 
 nop   # 0x7ffff77e7131 
 nop   # 0x7ffff77e7132 
 nop   # 0x7ffff77e7133 
 nop   # 0x7ffff77e7134 
 nop   # 0x7ffff77e7135 
 nop   # 0x7ffff77e7136 
 nop   # 0x7ffff77e7137 
 nop   # 0x7ffff77e7138 
 nop   # 0x7ffff77e7139 
 nop   # 0x7ffff77e713a 
 nop   # 0x7ffff77e713b 
 nop   # 0x7ffff77e713c 
 nop   # 0x7ffff77e713d 
 nop   # 0x7ffff77e713e 
 nop   # 0x7ffff77e713f 
 nop   # 0x7ffff77e7140 
 jo  .+47   # 0x7ffff77e7141 0x7ffff77e7141  0 sources, dests: 0x7ffff77e7143,0x7ffff77e7143,0x7ffff77e7143 jle    0x7ffff77e7170 <BN_set_word+64>+2 bytes
 nop   # 0x7ffff77e7143 
 nop   # 0x7ffff77e7144 
 nop   # 0x7ffff77e7145 
 nop   # 0x7ffff77e7146 
 nop   # 0x7ffff77e7147 
 nop   # 0x7ffff77e7148 
 nop   # 0x7ffff77e7149 
 nop   # 0x7ffff77e714a 
 nop   # 0x7ffff77e714b 
 nop   # 0x7ffff77e714c 
 nop   # 0x7ffff77e714d 
 nop   # 0x7ffff77e714e 
 nop   # 0x7ffff77e714f 
 nop   # 0x7ffff77e7150 
 nop   # 0x7ffff77e7151 
 nop   # 0x7ffff77e7152 
 nop   # 0x7ffff77e7153 
 nop   # 0x7ffff77e7154 
 nop   # 0x7ffff77e7155 
 nop   # 0x7ffff77e7156 
 nop   # 0x7ffff77e7157 
 nop   # 0x7ffff77e7158 
 nop   # 0x7ffff77e7159 
 nop   # 0x7ffff77e715a 
 nop   # 0x7ffff77e715b 
 nop   # 0x7ffff77e715c 
 nop   # 0x7ffff77e715d 
 nop   # 0x7ffff77e715e 
 nop   # 0x7ffff77e715f 
 nop   # 0x7ffff77e7160 
 nop   # 0x7ffff77e7161 
 nop   # 0x7ffff77e7162 
 nop   # 0x7ffff77e7163 
 nop   # 0x7ffff77e7164 
 nop   # 0x7ffff77e7165 
 ret   # 0x7ffff77e7166 0x7ffff77e7166  0 sources, dests: 0x7ffff77e7d95,0x7ffff77e7d95,0x7ffff77e7d95 retq   


.section .addr_0x7ffff77e7bb0, "ax"
.global addr_0x7ffff77e7bb0
.type addr_0x7ffff77e7bb0, @function
addr_0x7ffff77e7bb0:
 nop   # 0x7ffff77e7bb0 
 nop   # 0x7ffff77e7bb1 
 nop   # 0x7ffff77e7bb2 
 nop   # 0x7ffff77e7bb3 
 nop   # 0x7ffff77e7bb4 
 jo  .+9   # 0x7ffff77e7bb5 0x7ffff77e7bb5  0 sources, dests: 0x7ffff77e7bb7,0x7ffff77e7bb7 jne    0x7ffff77e7bbe <BN_CTX_start+14>+2 bytes
 nop   # 0x7ffff77e7bb7 
 nop   # 0x7ffff77e7bb8 
 nop   # 0x7ffff77e7bb9 
 nop   # 0x7ffff77e7bba 
 nop   # 0x7ffff77e7bbb 
 jno  .+12   # 0x7ffff77e7bbc 0x7ffff77e7bbc  0 sources, dests: 0x7ffff77e7bc8,0x7ffff77e7bc8 je     0x7ffff77e7bc8 <BN_CTX_start+24>


.section .addr_0x7ffff77e7bc8, "ax"
.global addr_0x7ffff77e7bc8
.type addr_0x7ffff77e7bc8, @function
addr_0x7ffff77e7bc8:
 nop   # 0x7ffff77e7bc8 
 nop   # 0x7ffff77e7bc9 
 nop   # 0x7ffff77e7bca 
 nop   # 0x7ffff77e7bcb 
 nop   # 0x7ffff77e7bcc 
 nop   # 0x7ffff77e7bcd 
 nop   # 0x7ffff77e7bce 
 nop   # 0x7ffff77e7bcf 
 nop   # 0x7ffff77e7bd0 
 nop   # 0x7ffff77e7bd1 
 nop   # 0x7ffff77e7bd2 
 nop   # 0x7ffff77e7bd3 
 nop   # 0x7ffff77e7bd4 
 nop   # 0x7ffff77e7bd5 
 nop   # 0x7ffff77e7bd6 
 nop   # 0x7ffff77e7bd7 
 nop   # 0x7ffff77e7bd8 
 nop   # 0x7ffff77e7bd9 
 nop   # 0x7ffff77e7bda 
 nop   # 0x7ffff77e7bdb 
 nop   # 0x7ffff77e7bdc 
 nop   # 0x7ffff77e7bdd 
 nop   # 0x7ffff77e7bde 
 jo  .+33   # 0x7ffff77e7bdf 0x7ffff77e7bdf  0 sources, dests: 0x7ffff77e7be1,0x7ffff77e7be1 je     0x7ffff77e7c00 <BN_CTX_start+80>+2 bytes
 nop   # 0x7ffff77e7be1 
 nop   # 0x7ffff77e7be2 
 nop   # 0x7ffff77e7be3 
 nop   # 0x7ffff77e7be4 
 nop   # 0x7ffff77e7be5 
 nop   # 0x7ffff77e7be6 
 nop   # 0x7ffff77e7be7 
 nop   # 0x7ffff77e7be8 
 nop   # 0x7ffff77e7be9 
 nop   # 0x7ffff77e7bea 
 nop   # 0x7ffff77e7beb 
 nop   # 0x7ffff77e7bec 
 nop   # 0x7ffff77e7bed 
 nop   # 0x7ffff77e7bee 
 nop   # 0x7ffff77e7bef 
 nop   # 0x7ffff77e7bf0 
 nop   # 0x7ffff77e7bf1 
 nop   # 0x7ffff77e7bf2 
 nop   # 0x7ffff77e7bf3 
 nop   # 0x7ffff77e7bf4 
 nop   # 0x7ffff77e7bf5 
 nop   # 0x7ffff77e7bf6 
 nop   # 0x7ffff77e7bf7 
 nop   # 0x7ffff77e7bf8 
 ret   # 0x7ffff77e7bf9 0x7ffff77e7bf9  0 sources, dests: 0x7ffff77e9421,0x7ffff77e3965 retq   


.section .addr_0x7ffff77e7cc0, "ax"
.global addr_0x7ffff77e7cc0
.type addr_0x7ffff77e7cc0, @function
addr_0x7ffff77e7cc0:
 nop   # 0x7ffff77e7cc0 
 nop   # 0x7ffff77e7cc1 
 nop   # 0x7ffff77e7cc2 
 nop   # 0x7ffff77e7cc3 
 nop   # 0x7ffff77e7cc4 
 jo  .+107   # 0x7ffff77e7cc5 0x7ffff77e7cc5  0 sources, dests: 0x7ffff77e7cc7,0x7ffff77e7cc7 jne    0x7ffff77e7d30 <BN_CTX_end+112>+2 bytes
 nop   # 0x7ffff77e7cc7 
 nop   # 0x7ffff77e7cc8 
 nop   # 0x7ffff77e7cc9 
 nop   # 0x7ffff77e7cca 
 nop   # 0x7ffff77e7ccb 
 nop   # 0x7ffff77e7ccc 
 nop   # 0x7ffff77e7ccd 
 nop   # 0x7ffff77e7cce 
 nop   # 0x7ffff77e7ccf 
 nop   # 0x7ffff77e7cd0 
 nop   # 0x7ffff77e7cd1 
 nop   # 0x7ffff77e7cd2 
 mov 16(%rsi),%eax   # 0x7ffff77e7cd3 Bitmask jump[4]: 0x7ffff77e7cdc  0 sources, dests: 0x7ffff77e7cde,0x7ffff77e7d18 jbe    0x7ffff77e7d18 <BN_CTX_end+88>
 sarl 16(%rsi)   # 0x7ffff77e7cd6 
 and  $0x1,%eax   # 0x7ffff77e7cd9 
 jne .+60   # 0x7ffff77e7cdc 
 nop   # 0x7ffff77e7cde 
 nop   # 0x7ffff77e7cdf 
 nop   # 0x7ffff77e7ce0 
 nop   # 0x7ffff77e7ce1 
 nop   # 0x7ffff77e7ce2 
 nop   # 0x7ffff77e7ce3 
 nop   # 0x7ffff77e7ce4 
 nop   # 0x7ffff77e7ce5 
 nop   # 0x7ffff77e7ce6 
 nop   # 0x7ffff77e7ce7 
 nop   # 0x7ffff77e7ce8 
 nop   # 0x7ffff77e7ce9 
 nop   # 0x7ffff77e7cea 
 nop   # 0x7ffff77e7ceb 
 nop   # 0x7ffff77e7cec 
 nop   # ed
 nop   # ee
 nop   # ef

 sarl 20(%rsi)   # 0x7ffff77e7cf0 
 and  $0x1,%eax   # 0x7ffff77e7cf3 
 jne .+34   # 0x7ffff77e7cf6 
 nop   # 0x7ffff77e7cf8 
 nop   # 0x7ffff77e7cf9 
 jno  .+46   # 0x7ffff77e7cfa 0x7ffff77e7cfa  0 sources, dests: 0x7ffff77e7d28,0x7ffff77e7d28,0x7ffff77e7d28 jne    0x7ffff77e7d28 <BN_CTX_end+104>


.section .addr_0x7ffff77e7d18, "ax"
.global addr_0x7ffff77e7d18
.type addr_0x7ffff77e7d18, @function
addr_0x7ffff77e7d18:
 nop   # 0x7ffff77e7d18 
 nop   # 0x7ffff77e7d19 
 nop   # 0x7ffff77e7d1a 
 nop   # 0x7ffff77e7d1b 
 nop   # 0x7ffff77e7d1c 
 nop   # 0x7ffff77e7d1d 
 nop   # 0x7ffff77e7d1e 
 nop   # 0x7ffff77e7d1f 
 nop   # 0x7ffff77e7d20 
 nop   # 0x7ffff77e7d21 
 ret   # 0x7ffff77e7d22 0x7ffff77e7d22  0 sources, dests: 0x7ffff77e3dcc,0x7ffff77e9591 retq   


.section .addr_0x7ffff77e7d28, "ax"
.global addr_0x7ffff77e7d28
.type addr_0x7ffff77e7d28, @function
addr_0x7ffff77e7d28:
/*
 #nop   # 0x7ffff77e7d28 
 #nop   # 0x7ffff77e7d29 
 #nop   # 0x7ffff77e7d2a 
*/
 mov 20(%rsi),%eax   # 0x7ffff77e7ced Bitmask jump[5]: 0x7ffff77e7cf6  0 sources, dests: 0x7ffff77e7cf8,0x7ffff77e7cf8,0x7ffff77e7cf8,0x7ffff77e7d18 je     0x7ffff77e7d18 <BN_CTX_end+88>
 jmp  .-59   # 0x7ffff77e7d2b 


.section .addr_0x7ffff77e7d40, "ax"
.global addr_0x7ffff77e7d40
.type addr_0x7ffff77e7d40, @function
addr_0x7ffff77e7d40:
 nop   # 0x7ffff77e7d40 
 nop   # 0x7ffff77e7d41 
 nop   # 0x7ffff77e7d42 
 nop   # 0x7ffff77e7d43 
 nop   # 0x7ffff77e7d44 
 nop   # 0x7ffff77e7d45 
 nop   # 0x7ffff77e7d46 
 nop   # 0x7ffff77e7d47 
 nop   # 0x7ffff77e7d48 
 nop   # 0x7ffff77e7d49 
 nop   # 0x7ffff77e7d4a 
 nop   # 0x7ffff77e7d4b 
 nop   # 0x7ffff77e7d4c 
 nop   # 0x7ffff77e7d4d 
 nop   # 0x7ffff77e7d4e 
 nop   # 0x7ffff77e7d4f 
 nop   # 0x7ffff77e7d50 
 jo  .+72   # 0x7ffff77e7d51 0x7ffff77e7d51  0 sources, dests: 0x7ffff77e7d53,0x7ffff77e7d53,0x7ffff77e7d53 jne    0x7ffff77e7d99 <BN_CTX_get+89>+2 bytes
 nop   # 0x7ffff77e7d53 
 nop   # 0x7ffff77e7d54 
 nop   # 0x7ffff77e7d55 
 nop   # 0x7ffff77e7d56 
 nop   # 0x7ffff77e7d57 
 jo  .+65   # 0x7ffff77e7d58 0x7ffff77e7d58  0 sources, dests: 0x7ffff77e7d5a,0x7ffff77e7d5a,0x7ffff77e7d5a jne    0x7ffff77e7d99 <BN_CTX_get+89>+2 bytes
 nop   # 0x7ffff77e7d5a 
 nop   # 0x7ffff77e7d5b 
 nop   # 0x7ffff77e7d5c 
 nop   # 0x7ffff77e7d5d 
 nop   # 0x7ffff77e7d5e 
 nop   # 0x7ffff77e7d5f 
 nop   # 0x7ffff77e7d60 
 nop   # 0x7ffff77e7d61 
 nop   # 0x7ffff77e7d62 
 jo  .+109   # 0x7ffff77e7d63 0x7ffff77e7d63  0 sources, dests: 0x7ffff77e7d65,0x7ffff77e7d65,0x7ffff77e7d65 je     0x7ffff77e7dd0 <BN_CTX_get+144>+2 bytes
 nop   # 0x7ffff77e7d65 
 nop   # 0x7ffff77e7d66 
 jno  .+73   # 0x7ffff77e7d67 0x7ffff77e7d67  0 sources, dests: 0x7ffff77e7db0,0x7ffff77e7db0,0x7ffff77e7db0 jne    0x7ffff77e7db0 <BN_CTX_get+112>


.section .addr_0x7ffff77e7d72, "ax"
.global addr_0x7ffff77e7d72
.type addr_0x7ffff77e7d72, @function
addr_0x7ffff77e7d72:
 nop   # 0x7ffff77e7d72 
 nop   # 0x7ffff77e7d73 
 nop   # 0x7ffff77e7d74 
 nop   # 0x7ffff77e7d75 
 nop   # 0x7ffff77e7d76 
 nop   # 0x7ffff77e7d77 
 nop   # 0x7ffff77e7d78 
 nop   # 0x7ffff77e7d79 
 nop   # 0x7ffff77e7d7a 
 nop   # 0x7ffff77e7d7b 
 nop   # 0x7ffff77e7d7c 
 nop   # 0x7ffff77e7d7d 
 nop   # 0x7ffff77e7d7e 
 nop   # 0x7ffff77e7d7f 
 nop   # 0x7ffff77e7d80 
 nop   # 0x7ffff77e7d81 
 nop   # 0x7ffff77e7d82 
 nop   # 0x7ffff77e7d83 
 nop   # 0x7ffff77e7d84 
 jo  .+209   # 0x7ffff77e7d85 0x7ffff77e7d85  0 sources, dests: 0x7ffff77e7d8b,0x7ffff77e7d8b,0x7ffff77e7d8b je     0x7ffff77e7e56 <BN_CTX_get+278>+6 bytes
 nop   # 0x7ffff77e7d8b 
 nop   # 0x7ffff77e7d8c 
 nop   # 0x7ffff77e7d8d 
 nop   # 0x7ffff77e7d8e 
 nop   # 0x7ffff77e7d8f 
 jmp  .-3168   # 0x7ffff77e7d90 
 nop   # 0x7ffff77e7d95 
 nop   # 0x7ffff77e7d96 
 nop   # 0x7ffff77e7d97 
 nop   # 0x7ffff77e7d98 
 nop   # 0x7ffff77e7d99 
 nop   # 0x7ffff77e7d9a 
 nop   # 0x7ffff77e7d9b 
/*
 #nop   # 0x7ffff77e7d9c 
 #nop   # 0x7ffff77e7d9d 
 #nop   # 0x7ffff77e7d9e 
 #nop   # 0x7ffff77e7d9f 
 #nop   # 0x7ffff77e7da0 
 #nop   # 0x7ffff77e7da1 
 #nop   # 0x7ffff77e7da2 
 #nop   # 0x7ffff77e7da3 
 #nop   # 0x7ffff77e7da4 
 #nop   # 0x7ffff77e7da5 
*/

 mov 8(%rdi), %rax
 mov (%rdi), %rdi
 mov (%rax), %rax
 jmpq *%rax

 ret   # 0x7ffff77e7da6 0x7ffff77e7da6  0 sources, dests: 0x7ffff77e396d,0x7ffff77e3978,0x7ffff77e3985 retq   


.section .addr_0x7ffff77e7db0, "ax"
.global addr_0x7ffff77e7db0
.type addr_0x7ffff77e7db0, @function
addr_0x7ffff77e7db0:
 nop   # 0x7ffff77e7db0 
 nop   # 0x7ffff77e7db1 
 nop   # 0x7ffff77e7db2 
 nop   # 0x7ffff77e7db3 
 nop   # 0x7ffff77e7db4 
 nop   # 0x7ffff77e7db5 
 nop   # 0x7ffff77e7db6 
 nop   # 0x7ffff77e7db7 
 nop   # 0x7ffff77e7db8 
 jno  .-71   # 0x7ffff77e7db9 0x7ffff77e7db9  0 sources, dests: 0x7ffff77e7d72,0x7ffff77e7d72,0x7ffff77e7d72 jne    0x7ffff77e7d72 <BN_CTX_get+50>


.section .addr_0x7ffff77e8320, "ax"
.global addr_0x7ffff77e8320
.type addr_0x7ffff77e8320, @function
addr_0x7ffff77e8320:
 nop   # 0x7ffff77e8320 
 nop   # 0x7ffff77e8321 
 nop   # 0x7ffff77e8322 
 nop   # 0x7ffff77e8323 
 nop   # 0x7ffff77e8324 
 nop   # 0x7ffff77e8325 
 nop   # 0x7ffff77e8326 
 nop   # 0x7ffff77e8327 
 nop   # 0x7ffff77e8328 
 nop   # 0x7ffff77e8329 
 nop   # 0x7ffff77e832a 
 nop   # 0x7ffff77e832b 
 nop   # 0x7ffff77e832c 
 nop   # 0x7ffff77e832d 
 nop   # 0x7ffff77e832e 
 nop   # 0x7ffff77e832f 
 nop   # 0x7ffff77e8330 
 nop   # 0x7ffff77e8331 
 nop   # 0x7ffff77e8332 
 nop   # 0x7ffff77e8333 
 nop   # 0x7ffff77e8334 
 nop   # 0x7ffff77e8335 
 nop   # 0x7ffff77e8336 
 nop   # 0x7ffff77e8337 
 nop   # 0x7ffff77e8338 
 nop   # 0x7ffff77e8339 
 nop   # 0x7ffff77e833a 
 nop   # 0x7ffff77e833b 
 nop   # 0x7ffff77e833c 
 nop   # 0x7ffff77e833d 
 nop   # 0x7ffff77e833e 
 nop   # 0x7ffff77e833f 
 jno  .+13   # 0x7ffff77e8340 0x7ffff77e8340  0 sources, dests: 0x7ffff77e834d jge    0x7ffff77e834d <bn_mul_normal+45>


.section .addr_0x7ffff77e834d, "ax"
.global addr_0x7ffff77e834d
.type addr_0x7ffff77e834d, @function
addr_0x7ffff77e834d:
 nop   # 0x7ffff77e834d 
 nop   # 0x7ffff77e834e 
 nop   # 0x7ffff77e834f 
 nop   # 0x7ffff77e8350 
 nop   # 0x7ffff77e8351 
 nop   # 0x7ffff77e8352 
 nop   # 0x7ffff77e8353 
 nop   # 0x7ffff77e8354 
 nop   # 0x7ffff77e8355 
 nop   # 0x7ffff77e8356 
 jo  .+185   # 0x7ffff77e8357 0x7ffff77e8357  0 sources, dests: 0x7ffff77e835d jle    0x7ffff77e8410 <bn_mul_normal+240>+6 bytes
 nop   # 0x7ffff77e835d 
 nop   # 0x7ffff77e835e 
 nop   # 0x7ffff77e835f 
 nop   # 0x7ffff77e8360 
 nop   # 0x7ffff77e8361 
 nop   # 0x7ffff77e8362 
 nop   # 0x7ffff77e8363 
 nop   # 0x7ffff77e8364 
 nop   # 0x7ffff77e8365 
 nop   # 0x7ffff77e8366 
 nop   # 0x7ffff77e8367 
 nop   # 0x7ffff77e8368 
 nop   # 0x7ffff77e8369 
 jmp  .+25686   # 0x7ffff77e836a 
 nop   # 0x7ffff77e836f 
 nop   # 0x7ffff77e8370 
 nop   # 0x7ffff77e8371 
 nop   # 0x7ffff77e8372 
 nop   # 0x7ffff77e8373 
 nop   # 0x7ffff77e8374 
 nop   # 0x7ffff77e8375 
 jo  .+108   # 0x7ffff77e8376 0x7ffff77e8376  0 sources, dests: 0x7ffff77e8378 jne    0x7ffff77e83e2 <bn_mul_normal+194>+2 bytes
 jmp  .+135   # 0x7ffff77e8378 


.section .addr_0x7ffff77e83ff, "ax"
.global addr_0x7ffff77e83ff
.type addr_0x7ffff77e83ff, @function
addr_0x7ffff77e83ff:
 nop   # 0x7ffff77e83ff 
 nop   # 0x7ffff77e8400 
 nop   # 0x7ffff77e8401 
 nop   # 0x7ffff77e8402 
 nop   # 0x7ffff77e8403 
 nop   # 0x7ffff77e8404 
 nop   # 0x7ffff77e8405 
 nop   # 0x7ffff77e8406 
 nop   # 0x7ffff77e8407 
 nop   # 0x7ffff77e8408 
 nop   # 0x7ffff77e8409 
 nop   # 0x7ffff77e840a 
 nop   # 0x7ffff77e840b 
 nop   # 0x7ffff77e840c 
 ret   # 0x7ffff77e840d 0x7ffff77e840d  0 sources, dests: 0x7ffff77e9548 retq   


.section .addr_0x7ffff77e93e0, "ax"
.global addr_0x7ffff77e93e0
.type addr_0x7ffff77e93e0, @function
addr_0x7ffff77e93e0:
 nop   # 0x7ffff77e93e0 
 nop   # 0x7ffff77e93e1 
 nop   # 0x7ffff77e93e2 
 nop   # 0x7ffff77e93e3 
 nop   # 0x7ffff77e93e4 
 nop   # 0x7ffff77e93e5 
 nop   # 0x7ffff77e93e6 
 nop   # 0x7ffff77e93e7 
 nop   # 0x7ffff77e93e8 
 nop   # 0x7ffff77e93e9 
 nop   # 0x7ffff77e93ea 
 nop   # 0x7ffff77e93eb 
 nop   # 0x7ffff77e93ec 
 nop   # 0x7ffff77e93ed 
 nop   # 0x7ffff77e93ee 
 nop   # 0x7ffff77e93ef 
 nop   # 0x7ffff77e93f0 
 nop   # 0x7ffff77e93f1 
 nop   # 0x7ffff77e93f2 
 nop   # 0x7ffff77e93f3 
 nop   # 0x7ffff77e93f4 
 nop   # 0x7ffff77e93f5 
 nop   # 0x7ffff77e93f6 
 nop   # 0x7ffff77e93f7 
 nop   # 0x7ffff77e93f8 
 jo  .+431   # 0x7ffff77e93f9 0x7ffff77e93f9  0 sources, dests: 0x7ffff77e93ff je     0x7ffff77e95a8 <BN_mul+456>+6 bytes
 nop   # 0x7ffff77e93ff 
 nop   # 0x7ffff77e9400 
 jo  .+423   # 0x7ffff77e9401 0x7ffff77e9401  0 sources, dests: 0x7ffff77e9407 je     0x7ffff77e95a8 <BN_mul+456>+6 bytes
 nop   # 0x7ffff77e9407 
 nop   # 0x7ffff77e9408 
 nop   # 0x7ffff77e9409 
 nop   # 0x7ffff77e940a 
 nop   # 0x7ffff77e940b 
 nop   # 0x7ffff77e940c 
 nop   # 0x7ffff77e940d 
 nop   # 0x7ffff77e940e 
 nop   # 0x7ffff77e940f 
 nop   # 0x7ffff77e9410 
 nop   # 0x7ffff77e9411 
 nop   # 0x7ffff77e9412 
 nop   # 0x7ffff77e9413 
 nop   # 0x7ffff77e9414 
 nop   # 0x7ffff77e9415 
 nop   # 0x7ffff77e9416 
 nop   # 0x7ffff77e9417 
 nop   # 0x7ffff77e9418 
 nop   # 0x7ffff77e9419 
 nop   # 0x7ffff77e941a 
 nop   # 0x7ffff77e941b 
 jmp  .-6252   # 0x7ffff77e941c 
 nop   # 0x7ffff77e9421 
 nop   # 0x7ffff77e9422 
 nop   # 0x7ffff77e9423 
 nop   # 0x7ffff77e9424 
 nop   # 0x7ffff77e9425 
 nop   # 0x7ffff77e9426 
 nop   # 0x7ffff77e9427 
 nop   # 0x7ffff77e9428 
 jo  .+471   # 0x7ffff77e9429 0x7ffff77e9429  0 sources, dests: 0x7ffff77e942f je     0x7ffff77e9600 <BN_mul+544>+6 bytes
 nop   # 0x7ffff77e942f 
 nop   # 0x7ffff77e9430 
 nop   # 0x7ffff77e9431 
 nop   # 0x7ffff77e9432 
 nop   # 0x7ffff77e9433 
 nop   # 0x7ffff77e9434 
 jo  .+459   # 0x7ffff77e9435 0x7ffff77e9435  0 sources, dests: 0x7ffff77e943b je     0x7ffff77e9600 <BN_mul+544>+6 bytes
 nop   # 0x7ffff77e943b 
 nop   # 0x7ffff77e943c 
 nop   # 0x7ffff77e943d 
 nop   # 0x7ffff77e943e 
 nop   # 0x7ffff77e943f 
 nop   # 0x7ffff77e9440 
 nop   # 0x7ffff77e9441 
 nop   # 0x7ffff77e9442 
 nop   # 0x7ffff77e9443 
 nop   # 0x7ffff77e9444 
 nop   # 0x7ffff77e9445 
 nop   # 0x7ffff77e9446 
 nop   # 0x7ffff77e9447 
 nop   # 0x7ffff77e9448 
 nop   # 0x7ffff77e9449 
 nop   # 0x7ffff77e944a 
 jo  .+11   # 0x7ffff77e944b 0x7ffff77e944b  0 sources, dests: 0x7ffff77e944d jne    0x7ffff77e9456 <BN_mul+118>+2 bytes
 nop   # 0x7ffff77e944d 
 nop   # 0x7ffff77e944e 
 nop   # 0x7ffff77e944f 
 jo  .+384   # 0x7ffff77e9450 0x7ffff77e9450  0 sources, dests: 0x7ffff77e9456 je     0x7ffff77e95d0 <BN_mul+496>+6 bytes
 nop   # 0x7ffff77e9456 
 nop   # 0x7ffff77e9457 
 nop   # 0x7ffff77e9458 
 jno  .+199   # 0x7ffff77e9459 0x7ffff77e9459  0 sources, dests: 0x7ffff77e9520 jle    0x7ffff77e9520 <BN_mul+320>


.section .addr_0x7ffff77e9520, "ax"
.global addr_0x7ffff77e9520
.type addr_0x7ffff77e9520, @function
addr_0x7ffff77e9520:
 nop   # 0x7ffff77e9520 
 nop   # 0x7ffff77e9521 
 nop   # 0x7ffff77e9522 
 nop   # 0x7ffff77e9523 
 nop   # 0x7ffff77e9524 
 nop   # 0x7ffff77e9525 
 nop   # 0x7ffff77e9526 
 jo  .+257   # 0x7ffff77e9527 0x7ffff77e9527  0 sources, dests: 0x7ffff77e952d jg     0x7ffff77e9628 <BN_mul+584>+6 bytes
 nop   # 0x7ffff77e952d 
 nop   # 0x7ffff77e952e 
 nop   # 0x7ffff77e952f 
 nop   # 0x7ffff77e9530 
 nop   # 0x7ffff77e9531 
 nop   # 0x7ffff77e9532 
 nop   # 0x7ffff77e9533 
 nop   # 0x7ffff77e9534 
 nop   # 0x7ffff77e9535 
 nop   # 0x7ffff77e9536 
 nop   # 0x7ffff77e9537 
 nop   # 0x7ffff77e9538 
 nop   # 0x7ffff77e9539 
 nop   # 0x7ffff77e953a 
 nop   # 0x7ffff77e953b 
 nop   # 0x7ffff77e953c 
 nop   # 0x7ffff77e953d 
 nop   # 0x7ffff77e953e 
 nop   # 0x7ffff77e953f 
 nop   # 0x7ffff77e9540 
 nop   # 0x7ffff77e9541 
 nop   # 0x7ffff77e9542 
 jmp  .-4643   # 0x7ffff77e9543 
 nop   # 0x7ffff77e9548 
 nop   # 0x7ffff77e9549 
 nop   # 0x7ffff77e954a 
 nop   # 0x7ffff77e954b 
 nop   # 0x7ffff77e954c 
 nop   # 0x7ffff77e954d 
 jo  .+38   # 0x7ffff77e954e 0x7ffff77e954e  0 sources, dests: 0x7ffff77e9550 jle    0x7ffff77e9574 <BN_mul+404>+2 bytes
 nop   # 0x7ffff77e9550 
 nop   # 0x7ffff77e9551 
 nop   # 0x7ffff77e9552 
 nop   # 0x7ffff77e9553 
 nop   # 0x7ffff77e9554 
 nop   # 0x7ffff77e9555 
 nop   # 0x7ffff77e9556 
 nop   # 0x7ffff77e9557 
 nop   # 0x7ffff77e9558 
 nop   # 0x7ffff77e9559 
 nop   # 0x7ffff77e955a 
 nop   # 0x7ffff77e955b 
 nop   # 0x7ffff77e955c 
 nop   # 0x7ffff77e955d 
 nop   # 0x7ffff77e955e 
 nop   # 0x7ffff77e955f 
 mov 24(%rsi),%eax   # 0x7ffff77e9560 Bitmask jump[6]: 0x7ffff77e9569  0 sources, dests: 0x7ffff77e956b,0x7ffff77e9570 jne    0x7ffff77e9570 <BN_mul+400>
 sarl 24(%rsi)   # 0x7ffff77e9563 
 and  $0x1,%eax   # 0x7ffff77e9566 
 jne .+7   # 0x7ffff77e9569 
 nop   # 0x7ffff77e956b 
 nop   # 0x7ffff77e956c 
 nop   # 0x7ffff77e956d 
 jno  .-14   # 0x7ffff77e956e 0x7ffff77e956e  0 sources, dests: 0x7ffff77e9560 jne    0x7ffff77e9560 <BN_mul+384>
 nop   # 0x7ffff77e9570 
 nop   # 0x7ffff77e9571 
 nop   # 0x7ffff77e9572 
 nop   # 0x7ffff77e9573 
 nop   # 0x7ffff77e9574 
 nop   # 0x7ffff77e9575 
 nop   # 0x7ffff77e9576 
 nop   # 0x7ffff77e9577 
 nop   # 0x7ffff77e9578 
 nop   # 0x7ffff77e9579 
 nop   # 0x7ffff77e957a 
 nop   # 0x7ffff77e957b 
 jno  .+13   # 0x7ffff77e957c 0x7ffff77e957c  0 sources, dests: 0x7ffff77e9589 je     0x7ffff77e9589 <BN_mul+425>


.section .addr_0x7ffff77e9589, "ax"
.global addr_0x7ffff77e9589
.type addr_0x7ffff77e9589, @function
addr_0x7ffff77e9589:
 nop   # 0x7ffff77e9589 
 nop   # 0x7ffff77e958a 
 nop   # 0x7ffff77e958b 
 jmp  .-6348   # 0x7ffff77e958c 
 nop   # 0x7ffff77e9591 
 nop   # 0x7ffff77e9592 
 nop   # 0x7ffff77e9593 
 nop   # 0x7ffff77e9594 
 nop   # 0x7ffff77e9595 
 nop   # 0x7ffff77e9596 
 nop   # 0x7ffff77e9597 
 nop   # 0x7ffff77e9598 
 nop   # 0x7ffff77e9599 
 nop   # 0x7ffff77e959a 
 nop   # 0x7ffff77e959b 
 nop   # 0x7ffff77e959c 
 nop   # 0x7ffff77e959d 
 nop   # 0x7ffff77e959e 
 nop   # 0x7ffff77e959f 
 nop   # 0x7ffff77e95a0 
 ret   # 0x7ffff77e95a1 0x7ffff77e95a1  0 sources, dests: 0x7ffff77ecc4b retq   


.section .addr_0x7ffff77eafd0, "ax"
.global addr_0x7ffff77eafd0
.type addr_0x7ffff77eafd0, @function
addr_0x7ffff77eafd0:
 nop   # 0x7ffff77eafd0 
 nop   # 0x7ffff77eafd1 
 nop   # 0x7ffff77eafd2 
 nop   # 0x7ffff77eafd3 
 nop   # 0x7ffff77eafd4 
 nop   # 0x7ffff77eafd5 
 nop   # 0x7ffff77eafd6 
 nop   # 0x7ffff77eafd7 
 nop   # 0x7ffff77eafd8 
 nop   # 0x7ffff77eafd9 
 nop   # 0x7ffff77eafda 
 nop   # 0x7ffff77eafdb 
 jo  .+348   # 0x7ffff77eafdc 0x7ffff77eafdc  0 sources, dests: 0x7ffff77eafe2 js     0x7ffff77eb138 <BN_lshift+360>+6 bytes
 nop   # 0x7ffff77eafe2 
 nop   # 0x7ffff77eafe3 
 nop   # 0x7ffff77eafe4 
 nop   # 0x7ffff77eafe5 
 nop   # 0x7ffff77eafe6 
 nop   # 0x7ffff77eafe7 
 nop   # 0x7ffff77eafe8 
 nop   # 0x7ffff77eafe9 
 nop   # 0x7ffff77eafea 
 nop   # 0x7ffff77eafeb 
 nop   # 0x7ffff77eafec 
 nop   # 0x7ffff77eafed 
 nop   # 0x7ffff77eafee 
 nop   # 0x7ffff77eafef 
 nop   # 0x7ffff77eaff0 
 nop   # 0x7ffff77eaff1 
 nop   # 0x7ffff77eaff2 
 nop   # 0x7ffff77eaff3 
 nop   # 0x7ffff77eaff4 
 nop   # 0x7ffff77eaff5 
 nop   # 0x7ffff77eaff6 
 nop   # 0x7ffff77eaff7 
 nop   # 0x7ffff77eaff8 
 nop   # 0x7ffff77eaff9 
 nop   # 0x7ffff77eaffa 
 nop   # 0x7ffff77eaffb 
 nop   # 0x7ffff77eaffc 
 nop   # 0x7ffff77eaffd 
 jo  .+274   # 0x7ffff77eaffe 0x7ffff77eaffe  0 sources, dests: 0x7ffff77eb004 jge    0x7ffff77eb110 <BN_lshift+320>+6 bytes
 nop   # 0x7ffff77eb004 
 nop   # 0x7ffff77eb005 
 nop   # 0x7ffff77eb006 
 nop   # 0x7ffff77eb007 
 nop   # 0x7ffff77eb008 
 nop   # 0x7ffff77eb009 
 nop   # 0x7ffff77eb00a 
 nop   # 0x7ffff77eb00b 
 nop   # 0x7ffff77eb00c 
 nop   # 0x7ffff77eb00d 
 nop   # 0x7ffff77eb00e 
 nop   # 0x7ffff77eb00f 
 nop   # 0x7ffff77eb010 
 nop   # 0x7ffff77eb011 
 nop   # 0x7ffff77eb012 
 nop   # 0x7ffff77eb013 
 nop   # 0x7ffff77eb014 
 nop   # 0x7ffff77eb015 
 nop   # 0x7ffff77eb016 
 nop   # 0x7ffff77eb017 
 nop   # 0x7ffff77eb018 
 nop   # 0x7ffff77eb019 
 jno  .+158   # 0x7ffff77eb01a 0x7ffff77eb01a  0 sources, dests: 0x7ffff77eb0b8 jne    0x7ffff77eb0b8 <BN_lshift+232>


.section .addr_0x7ffff77eb061, "ax"
.global addr_0x7ffff77eb061
.type addr_0x7ffff77eb061, @function
addr_0x7ffff77eb061:
 nop   # 0x7ffff77eb061 
 nop   # 0x7ffff77eb062 
 nop   # 0x7ffff77eb063 
 nop   # 0x7ffff77eb064 
 nop   # 0x7ffff77eb065 
 nop   # 0x7ffff77eb066 
 nop   # 0x7ffff77eb067 
 nop   # 0x7ffff77eb068 
 nop   # 0x7ffff77eb069 
 nop   # 0x7ffff77eb06a 
 jmp  .-391035   # 0x7ffff77eb06b 
 nop   # 0x7ffff77eb070 
 nop   # 0x7ffff77eb071 
 nop   # 0x7ffff77eb072 
 nop   # 0x7ffff77eb073 
 nop   # 0x7ffff77eb074 
 nop   # 0x7ffff77eb075 
 nop   # 0x7ffff77eb076 
 nop   # 0x7ffff77eb077 
 nop   # 0x7ffff77eb078 
 nop   # 0x7ffff77eb079 
 nop   # 0x7ffff77eb07a 
 nop   # 0x7ffff77eb07b 
 nop   # 0x7ffff77eb07c 
 nop   # 0x7ffff77eb07d 
 nop   # 0x7ffff77eb07e 
 jo  .+36   # 0x7ffff77eb07f 0x7ffff77eb07f  0 sources, dests: 0x7ffff77eb081 jle    0x7ffff77eb0a3 <BN_lshift+211>+2 bytes
 nop   # 0x7ffff77eb081 
 nop   # 0x7ffff77eb082 
 nop   # 0x7ffff77eb083 
 nop   # 0x7ffff77eb084 
 nop   # 0x7ffff77eb085 
 nop   # 0x7ffff77eb086 
 nop   # 0x7ffff77eb087 
 nop   # 0x7ffff77eb088 
 nop   # 0x7ffff77eb089 
 nop   # 0x7ffff77eb08a 
 nop   # 0x7ffff77eb08b 
 nop   # 0x7ffff77eb08c 
 nop   # 0x7ffff77eb08d 
 nop   # 0x7ffff77eb08e 
 nop   # 0x7ffff77eb08f 
 nop   # 0x7ffff77eb090 
 nop   # 0x7ffff77eb091 
 nop   # 0x7ffff77eb092 
 nop   # 0x7ffff77eb093 
 nop   # 0x7ffff77eb094 
 nop   # 0x7ffff77eb095 
 nop   # 0x7ffff77eb096 
 nop   # 0x7ffff77eb097 
 nop   # 0x7ffff77eb098 
 jno  .+7   # 0x7ffff77eb099 0x7ffff77eb099  0 sources, dests: 0x7ffff77eb0a0 jne    0x7ffff77eb0a0 <BN_lshift+208>


.section .addr_0x7ffff77eb0a0, "ax"
.global addr_0x7ffff77eb0a0
.type addr_0x7ffff77eb0a0, @function
addr_0x7ffff77eb0a0:
 nop   # 0x7ffff77eb0a0 
 nop   # 0x7ffff77eb0a1 
 nop   # 0x7ffff77eb0a2 
 nop   # 0x7ffff77eb0a3 
 nop   # 0x7ffff77eb0a4 
 nop   # 0x7ffff77eb0a5 
 nop   # 0x7ffff77eb0a6 
 nop   # 0x7ffff77eb0a7 
 nop   # 0x7ffff77eb0a8 
 nop   # 0x7ffff77eb0a9 
 nop   # 0x7ffff77eb0aa 
 nop   # 0x7ffff77eb0ab 
 nop   # 0x7ffff77eb0ac 
 nop   # 0x7ffff77eb0ad 
 nop   # 0x7ffff77eb0ae 
 nop   # 0x7ffff77eb0af 
 nop   # 0x7ffff77eb0b0 
 nop   # 0x7ffff77eb0b1 
 ret   # 0x7ffff77eb0b2 0x7ffff77eb0b2  0 sources, dests: 0x7ffff77e39db,0x7ffff77e3b04 retq   


.section .addr_0x7ffff77eb0b8, "ax"
.global addr_0x7ffff77eb0b8
.type addr_0x7ffff77eb0b8, @function
addr_0x7ffff77eb0b8:
 nop   # 0x7ffff77eb0b8 
 nop   # 0x7ffff77eb0b9 
 nop   # 0x7ffff77eb0ba 
 nop   # 0x7ffff77eb0bb 
 jo  .+164   # 0x7ffff77eb0bc 0x7ffff77eb0bc  0 sources, dests: 0x7ffff77eb0c2 js     0x7ffff77eb160 <BN_lshift+400>+6 bytes
 nop   # 0x7ffff77eb0c2 
 nop   # 0x7ffff77eb0c3 
 nop   # 0x7ffff77eb0c4 
 nop   # 0x7ffff77eb0c5 
 nop   # 0x7ffff77eb0c6 
 nop   # 0x7ffff77eb0c7 
 nop   # 0x7ffff77eb0c8 
 nop   # 0x7ffff77eb0c9 
 nop   # 0x7ffff77eb0ca 
 nop   # 0x7ffff77eb0cb 
 nop   # 0x7ffff77eb0cc 
 nop   # 0x7ffff77eb0cd 
 nop   # 0x7ffff77eb0ce 
 nop   # 0x7ffff77eb0cf 
 nop   # 0x7ffff77eb0d0 
 nop   # 0x7ffff77eb0d1 
 nop   # 0x7ffff77eb0d2 
 nop   # 0x7ffff77eb0d3 
 nop   # 0x7ffff77eb0d4 
 nop   # 0x7ffff77eb0d5 
 nop   # 0x7ffff77eb0d6 
 nop   # 0x7ffff77eb0d7 
 nop   # 0x7ffff77eb0d8 
 nop   # 0x7ffff77eb0d9 
 nop   # 0x7ffff77eb0da 
 nop   # 0x7ffff77eb0db 
 nop   # 0x7ffff77eb0dc 
 nop   # 0x7ffff77eb0dd 
 nop   # 0x7ffff77eb0de 
 nop   # 0x7ffff77eb0df 
 nop   # 0x7ffff77eb0e0 
 nop   # 0x7ffff77eb0e1 
 nop   # 0x7ffff77eb0e2 
 nop   # 0x7ffff77eb0e3 
 nop   # 0x7ffff77eb0e4 
 nop   # 0x7ffff77eb0e5 
 nop   # 0x7ffff77eb0e6 
 nop   # 0x7ffff77eb0e7 
 nop   # 0x7ffff77eb0e8 
 nop   # 0x7ffff77eb0e9 
 nop   # 0x7ffff77eb0ea 
 nop   # 0x7ffff77eb0eb 
 nop   # 0x7ffff77eb0ec 
 nop   # 0x7ffff77eb0ed 
 nop   # 0x7ffff77eb0ee 
 nop   # 0x7ffff77eb0ef 
 nop   # 0x7ffff77eb0f0 
 nop   # 0x7ffff77eb0f1 
 nop   # 0x7ffff77eb0f2 
 nop   # 0x7ffff77eb0f3 
 nop   # 0x7ffff77eb0f4 
 nop   # 0x7ffff77eb0f5 
 nop   # 0x7ffff77eb0f6 
 nop   # 0x7ffff77eb0f7 
 nop   # 0x7ffff77eb0f8 
 nop   # 0x7ffff77eb0f9 
 nop   # 0x7ffff77eb0fa 
 nop   # 0x7ffff77eb0fb 
 nop   # 0x7ffff77eb0fc 
 nop   # 0x7ffff77eb0fd 
 mov 28(%rsi),%eax   # 0x7ffff77eb0fe Bitmask jump[7]: 0x7ffff77eb107  0 sources, dests: 0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb0e0,0x7ffff77eb109 jne    0x7ffff77eb0e0 <BN_lshift+272>
 sarl 28(%rsi)   # 0x7ffff77eb101 
 and  $0x1,%eax   # 0x7ffff77eb104 
 jne .-39   # 0x7ffff77eb107 
 jmp  .-168   # 0x7ffff77eb109 


.section .addr_0x7ffff77eb180, "ax"
.global addr_0x7ffff77eb180
.type addr_0x7ffff77eb180, @function
addr_0x7ffff77eb180:
 nop   # 0x7ffff77eb180 
 nop   # 0x7ffff77eb181 
 nop   # 0x7ffff77eb182 
 nop   # 0x7ffff77eb183 
 nop   # 0x7ffff77eb184 
 nop   # 0x7ffff77eb185 
 nop   # 0x7ffff77eb186 
 nop   # 0x7ffff77eb187 
 nop   # 0x7ffff77eb188 
 nop   # 0x7ffff77eb189 
 nop   # 0x7ffff77eb18a 
 nop   # 0x7ffff77eb18b 
 jo  .+260   # 0x7ffff77eb18c 0x7ffff77eb18c  0 sources, dests: 0x7ffff77eb192 js     0x7ffff77eb290 <BN_rshift+272>+6 bytes
 nop   # 0x7ffff77eb192 
 nop   # 0x7ffff77eb193 
 nop   # 0x7ffff77eb194 
 nop   # 0x7ffff77eb195 
 nop   # 0x7ffff77eb196 
 nop   # 0x7ffff77eb197 
 nop   # 0x7ffff77eb198 
 nop   # 0x7ffff77eb199 
 nop   # 0x7ffff77eb19a 
 nop   # 0x7ffff77eb19b 
 nop   # 0x7ffff77eb19c 
 nop   # 0x7ffff77eb19d 
 nop   # 0x7ffff77eb19e 
 nop   # 0x7ffff77eb19f 
 nop   # 0x7ffff77eb1a0 
 nop   # 0x7ffff77eb1a1 
 nop   # 0x7ffff77eb1a2 
 nop   # 0x7ffff77eb1a3 
 jo  .+164   # 0x7ffff77eb1a4 0x7ffff77eb1a4  0 sources, dests: 0x7ffff77eb1aa je     0x7ffff77eb248 <BN_rshift+200>+6 bytes
 nop   # 0x7ffff77eb1aa 
 nop   # 0x7ffff77eb1ab 
 nop   # 0x7ffff77eb1ac 
 jo  .+155   # 0x7ffff77eb1ad 0x7ffff77eb1ad  0 sources, dests: 0x7ffff77eb1b3 jge    0x7ffff77eb248 <BN_rshift+200>+6 bytes
 nop   # 0x7ffff77eb1b3 
 nop   # 0x7ffff77eb1b4 
 nop   # 0x7ffff77eb1b5 
 nop   # 0x7ffff77eb1b6 
 nop   # 0x7ffff77eb1b7 
 nop   # 0x7ffff77eb1b8 
 nop   # 0x7ffff77eb1b9 
 jmp  .-17626   # 0x7ffff77eb1ba 
 nop   # 0x7ffff77eb1bf 
 nop   # 0x7ffff77eb1c0 
 nop   # 0x7ffff77eb1c1 
 nop   # 0x7ffff77eb1c2 
 nop   # 0x7ffff77eb1c3 
 nop   # 0x7ffff77eb1c4 
 nop   # 0x7ffff77eb1c5 
 nop   # 0x7ffff77eb1c6 
 nop   # 0x7ffff77eb1c7 
 nop   # 0x7ffff77eb1c8 
 nop   # 0x7ffff77eb1c9 
 nop   # 0x7ffff77eb1ca 
 nop   # 0x7ffff77eb1cb 
 nop   # 0x7ffff77eb1cc 
 nop   # 0x7ffff77eb1cd 
 nop   # 0x7ffff77eb1ce 
 nop   # 0x7ffff77eb1cf 
 nop   # 0x7ffff77eb1d0 
 nop   # 0x7ffff77eb1d1 
 nop   # 0x7ffff77eb1d2 
 nop   # 0x7ffff77eb1d3 
 nop   # 0x7ffff77eb1d4 
 nop   # 0x7ffff77eb1d5 
 nop   # 0x7ffff77eb1d6 
 jo  .+329   # 0x7ffff77eb1d7 0x7ffff77eb1d7  0 sources, dests: 0x7ffff77eb1dd je     0x7ffff77eb320 <BN_rshift+416>+6 bytes
 nop   # 0x7ffff77eb1dd 
 nop   # 0x7ffff77eb1de 
 nop   # 0x7ffff77eb1df 
 nop   # 0x7ffff77eb1e0 
 nop   # 0x7ffff77eb1e1 
 nop   # 0x7ffff77eb1e2 
 nop   # 0x7ffff77eb1e3 
 nop   # 0x7ffff77eb1e4 
 nop   # 0x7ffff77eb1e5 
 nop   # 0x7ffff77eb1e6 
 jo  .+129   # 0x7ffff77eb1e7 0x7ffff77eb1e7  0 sources, dests: 0x7ffff77eb1e9 jg     0x7ffff77eb268 <BN_rshift+232>+6 bytes
 nop   # 0x7ffff77eb1e9
 nop   # 0x7ffff77eb1ea
 nop   # 0x7ffff77eb1eb
 nop   # 0x7ffff77eb1ec
 nop   # 0x7ffff77eb1ed 
 nop   # 0x7ffff77eb1ee 
 nop   # 0x7ffff77eb1ef 
 nop   # 0x7ffff77eb1f0 
 nop   # 0x7ffff77eb1f1 
 nop   # 0x7ffff77eb1f2 
 nop   # 0x7ffff77eb1f3 
 nop   # 0x7ffff77eb1f4 
 nop   # 0x7ffff77eb1f5 
 nop   # 0x7ffff77eb1f6 
 nop   # 0x7ffff77eb1f7 
 nop   # 0x7ffff77eb1f8 
 nop   # 0x7ffff77eb1f9 
 nop   # 0x7ffff77eb1fa 
 nop   # 0x7ffff77eb1fb 
 nop   # 0x7ffff77eb1fc 
 nop   # 0x7ffff77eb1fd 
 nop   # 0x7ffff77eb1fe 
 nop   # 0x7ffff77eb1ff 
 nop   # 0x7ffff77eb200 
 nop   # 0x7ffff77eb201 
 nop   # 0x7ffff77eb202 
 nop   # 0x7ffff77eb203 
 jno  .+180   # 0x7ffff77eb204 0x7ffff77eb204  0 sources, dests: 0x7ffff77eb2b8 jne    0x7ffff77eb2b8 <BN_rshift+312>


.section .addr_0x7ffff77eb231, "ax"
.global addr_0x7ffff77eb231
.type addr_0x7ffff77eb231, @function
addr_0x7ffff77eb231:
 nop   # 0x7ffff77eb231 
 nop   # 0x7ffff77eb232 
 nop   # 0x7ffff77eb233 
 nop   # 0x7ffff77eb234 
 nop   # 0x7ffff77eb235 
 nop   # 0x7ffff77eb236 
 nop   # 0x7ffff77eb237 
 nop   # 0x7ffff77eb238 
 nop   # 0x7ffff77eb239 
 nop   # 0x7ffff77eb23a 
 nop   # 0x7ffff77eb23b 
 nop   # 0x7ffff77eb23c 
 nop   # 0x7ffff77eb23d 
 nop   # 0x7ffff77eb23e 
 nop   # 0x7ffff77eb23f 
 ret   # 0x7ffff77eb240 0x7ffff77eb240  0 sources, dests: 0x7ffff77e3d82 retq   


.section .addr_0x7ffff77eb2b8, "ax"
.global addr_0x7ffff77eb2b8
.type addr_0x7ffff77eb2b8, @function
addr_0x7ffff77eb2b8:
 nop   # 0x7ffff77eb2b8 
 nop   # 0x7ffff77eb2b9 
 nop   # 0x7ffff77eb2ba 
 nop   # 0x7ffff77eb2bb 
 nop   # 0x7ffff77eb2bc 
 nop   # 0x7ffff77eb2bd 
 jo  .+72   # 0x7ffff77eb2be 0x7ffff77eb2be  0 sources, dests: 0x7ffff77eb2c0 je     0x7ffff77eb306 <BN_rshift+390>+2 bytes
 nop   # 0x7ffff77eb2c0 
 nop   # 0x7ffff77eb2c1 
 nop   # 0x7ffff77eb2c2 
 nop   # 0x7ffff77eb2c3 
 nop   # 0x7ffff77eb2c4 
 nop   # 0x7ffff77eb2c5 
 nop   # 0x7ffff77eb2c6 
 nop   # 0x7ffff77eb2c7 
 nop   # 0x7ffff77eb2c8 
 nop   # 0x7ffff77eb2c9 
 nop   # 0x7ffff77eb2ca 
 nop   # 0x7ffff77eb2cb 
 nop   # 0x7ffff77eb2cc 
 nop   # 0x7ffff77eb2cd 
 nop   # 0x7ffff77eb2ce 
 nop   # 0x7ffff77eb2cf 
 nop   # 0x7ffff77eb2d0 
 nop   # 0x7ffff77eb2d1 
 nop   # 0x7ffff77eb2d2 
 nop   # 0x7ffff77eb2d3 
 nop   # 0x7ffff77eb2d4 
 nop   # 0x7ffff77eb2d5 
 nop   # 0x7ffff77eb2d6 
 nop   # 0x7ffff77eb2d7 
 nop   # 0x7ffff77eb2d8 
 nop   # 0x7ffff77eb2d9 
 nop   # 0x7ffff77eb2da 
 nop   # 0x7ffff77eb2db 
 nop   # 0x7ffff77eb2dc 
 nop   # 0x7ffff77eb2dd 
 nop   # 0x7ffff77eb2de 
 nop   # 0x7ffff77eb2df 
 nop   # 0x7ffff77eb2e0 
 nop   # 0x7ffff77eb2e1 
 nop   # 0x7ffff77eb2e2 
 nop   # 0x7ffff77eb2e3 
 nop   # 0x7ffff77eb2e4 
 nop   # 0x7ffff77eb2e5 
 nop   # 0x7ffff77eb2e6 
 nop   # 0x7ffff77eb2e7 
 nop   # 0x7ffff77eb2e8 
 nop   # 0x7ffff77eb2e9 
 nop   # 0x7ffff77eb2ea 
 nop   # 0x7ffff77eb2eb 
 nop   # 0x7ffff77eb2ec 
 nop   # 0x7ffff77eb2ed 
 nop   # 0x7ffff77eb2ee 
 nop   # 0x7ffff77eb2ef 
 nop   # 0x7ffff77eb2f0 
 nop   # 0x7ffff77eb2f1 
 nop   # 0x7ffff77eb2f2 
 mov 32(%rsi),%eax   # 0x7ffff77eb2f3 Bitmask jump[8]: 0x7ffff77eb2fc  0 sources, dests: 0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2d8,0x7ffff77eb2fe jne    0x7ffff77eb2d8 <BN_rshift+344>
 sarl 32(%rsi)   # 0x7ffff77eb2f6 
 and  $0x1,%eax   # 0x7ffff77eb2f9 
 jne .-36   # 0x7ffff77eb2fc 
 nop   # 0x7ffff77eb2fe 
 nop   # 0x7ffff77eb2ff 
 nop   # 0x7ffff77eb300 
 nop   # 0x7ffff77eb301 
 nop   # 0x7ffff77eb302 
 nop   # 0x7ffff77eb303 
 nop   # 0x7ffff77eb304 
 nop   # 0x7ffff77eb305 
 nop   # 0x7ffff77eb306 
 nop   # 0x7ffff77eb307 
 nop   # 0x7ffff77eb308 
 nop   # 0x7ffff77eb309 
 nop   # 0x7ffff77eb30a 
 nop   # 0x7ffff77eb30b 
 nop   # 0x7ffff77eb30c 
 nop   # 0x7ffff77eb30d 
 jo  .-221   # 0x7ffff77eb30e 0x7ffff77eb30e  0 sources, dests: 0x7ffff77eb314 je     0x7ffff77eb231 <BN_rshift+177>+6 bytes
 nop   # 0x7ffff77eb314 
 nop   # 0x7ffff77eb315 
 nop   # 0x7ffff77eb316 
 jmp  .-230   # 0x7ffff77eb317 


.section .addr_0x7ffff77ecc38, "ax"
.global addr_0x7ffff77ecc38
.type addr_0x7ffff77ecc38, @function
addr_0x7ffff77ecc38:
 nop   # 0x7ffff77ecc38 
 nop   # 0x7ffff77ecc39 
 nop   # 0x7ffff77ecc3a 
 nop   # 0x7ffff77ecc3b 
 nop   # 0x7ffff77ecc3c 
 nop   # 0x7ffff77ecc3d 
 nop   # 0x7ffff77ecc3e 
 nop   # 0x7ffff77ecc3f 
 nop   # 0x7ffff77ecc40 
 nop   # 0x7ffff77ecc41 
 nop   # 0x7ffff77ecc42 
 nop   # 0x7ffff77ecc43 
 nop   # 0x7ffff77ecc44 
 nop   # 0x7ffff77ecc45 
 jmp  .-14438   # 0x7ffff77ecc46 
 nop   # 0x7ffff77ecc4b 
 nop   # 0x7ffff77ecc4c 
 jo  .+143   # 0x7ffff77ecc4d 0x7ffff77ecc4d  0 sources, dests: 0x7ffff77ecc53 je     0x7ffff77eccdc <BN_mod_inverse+556>+6 bytes
 nop   # 0x7ffff77ecc53 
 nop   # 0x7ffff77ecc54 
 nop   # 0x7ffff77ecc55 
 nop   # 0x7ffff77ecc56 
 nop   # 0x7ffff77ecc57 
 nop   # 0x7ffff77ecc58 
 nop   # 0x7ffff77ecc59 
 nop   # 0x7ffff77ecc5a 
 nop   # 0x7ffff77ecc5b 
 jmp  .-38268   # 0x7ffff77ecc5c 
 nop   # 0x7ffff77ecc61 
 nop   # 0x7ffff77ecc62 
 jo  .+121   # 0x7ffff77ecc63 0x7ffff77ecc63  0 sources, dests: 0x7ffff77ecc65 je     0x7ffff77eccdc <BN_mod_inverse+556>+2 bytes
 nop   # 0x7ffff77ecc65 
 nop   # 0x7ffff77ecc66 
 nop   # 0x7ffff77ecc67 
 nop   # 0x7ffff77ecc68 
 nop   # 0x7ffff77ecc69 
 nop   # 0x7ffff77ecc6a 
 nop   # 0x7ffff77ecc6b 
 nop   # 0x7ffff77ecc6c 
 nop   # 0x7ffff77ecc6d 
 nop   # 0x7ffff77ecc6e 
 nop   # 0x7ffff77ecc6f 
 nop   # 0x7ffff77ecc70 
 nop   # 0x7ffff77ecc71 
 nop   # 0x7ffff77ecc72 
 nop   # 0x7ffff77ecc73 
 jo  .+1068   # 0x7ffff77ecc74 0x7ffff77ecc74  0 sources, dests: 0x7ffff77ecc7a je     0x7ffff77ed0a0 <BN_mod_inverse+1520>+6 bytes
 nop   # 0x7ffff77ecc7a 
 nop   # 0x7ffff77ecc7b 
 nop   # 0x7ffff77ecc7c 
 nop   # 0x7ffff77ecc7d 
 nop   # 0x7ffff77ecc7e 
 nop   # 0x7ffff77ecc7f 
 nop   # 0x7ffff77ecc80 
 nop   # 0x7ffff77ecc81 
 nop   # 0x7ffff77ecc82 
 nop   # 0x7ffff77ecc83 
 nop   # 0x7ffff77ecc84 
 nop   # 0x7ffff77ecc85 
 nop   # 0x7ffff77ecc86 
 nop   # 0x7ffff77ecc87 
 nop   # 0x7ffff77ecc88 
 nop   # 0x7ffff77ecc89 
 nop   # 0x7ffff77ecc8a 
 nop   # 0x7ffff77ecc8b 
 nop   # 0x7ffff77ecc8c 
 nop   # 0x7ffff77ecc8d 
 nop   # 0x7ffff77ecc8e 
 nop   # 0x7ffff77ecc8f 
 nop   # 0x7ffff77ecc90 
 nop   # 0x7ffff77ecc91 
 nop   # 0x7ffff77ecc92 
 nop   # 0x7ffff77ecc93 
 nop   # 0x7ffff77ecc94 
 nop   # 0x7ffff77ecc95 
 nop   # 0x7ffff77ecc96 
 nop   # 0x7ffff77ecc97 
 nop   # 0x7ffff77ecc98 
 nop   # 0x7ffff77ecc99 
 nop   # 0x7ffff77ecc9a 
 nop   # 0x7ffff77ecc9b 
 nop   # 0x7ffff77ecc9c 
 nop   # 0x7ffff77ecc9d 
 nop   # 0x7ffff77ecc9e 
 nop   # 0x7ffff77ecc9f 
 nop   # 0x7ffff77ecca0 
 nop   # 0x7ffff77ecca1 
 nop   # 0x7ffff77ecca2 
 nop   # 0x7ffff77ecca3 
 nop   # 0x7ffff77ecca4 
 nop   # 0x7ffff77ecca5 
 nop   # 0x7ffff77ecca6 
 nop   # 0x7ffff77ecca7 
 nop   # 0x7ffff77ecca8 
 nop   # 0x7ffff77ecca9 
 nop   # 0x7ffff77eccaa 
 nop   # 0x7ffff77eccab 
 nop   # 0x7ffff77eccac 
 nop   # 0x7ffff77eccad 
 nop   # 0x7ffff77eccae 
 nop   # 0x7ffff77eccaf 
 nop   # 0x7ffff77eccb0 
 nop   # 0x7ffff77eccb1 
 nop   # 0x7ffff77eccb2 
 nop   # 0x7ffff77eccb3 
 nop   # 0x7ffff77eccb4 
 nop   # 0x7ffff77eccb5 
 nop   # 0x7ffff77eccb6 
 nop   # 0x7ffff77eccb7 
 nop   # 0x7ffff77eccb8 
 nop   # 0x7ffff77eccb9 
 nop   # 0x7ffff77eccba 
 nop   # 0x7ffff77eccbb 
 nop   # 0x7ffff77eccbc 
 nop   # 0x7ffff77eccbd 
 nop   # 0x7ffff77eccbe 
 nop   # 0x7ffff77eccbf 
 nop   # 0x7ffff77eccc0 
 nop   # 0x7ffff77eccc1 
 nop   # 0x7ffff77eccc2 
 nop   # 0x7ffff77eccc3 
 nop   # 0x7ffff77eccc4 
 nop   # 0x7ffff77eccc5 
 nop   # 0x7ffff77eccc6 
 nop   # 0x7ffff77eccc7 
 nop   # 0x7ffff77eccc8 
 nop   # 0x7ffff77eccc9 
 nop   # 0x7ffff77eccca 
 nop   # 0x7ffff77ecccb 
 nop   # 0x7ffff77ecccc 
 nop   # 0x7ffff77ecccd 
 nop   # 0x7ffff77eccce 
 jmp  .-37871   # 0x7ffff77ecccf 
 nop   # 0x7ffff77eccd4 
 nop   # 0x7ffff77eccd5 
 jno  .-158   # 0x7ffff77eccd6 0x7ffff77eccd6  0 sources, dests: 0x7ffff77ecc38 jne    0x7ffff77ecc38 <BN_mod_inverse+392>


.section .addr_0x7ffff77ee7c0, "ax"
.global addr_0x7ffff77ee7c0
.type addr_0x7ffff77ee7c0, @function
addr_0x7ffff77ee7c0:
 nop   # 0x7ffff77ee7c0 
 nop   # 0x7ffff77ee7c1 
 nop   # 0x7ffff77ee7c2 
 nop   # 0x7ffff77ee7c3 
 nop   # 0x7ffff77ee7c4 
 jo  .+227   # 0x7ffff77ee7c5 0x7ffff77ee7c5  0 sources, dests: 0x7ffff77ee7cb,0x7ffff77ee7cb,0x7ffff77ee7cb jle    0x7ffff77ee8a8 <bn_mul_words+232>+6 bytes
 mov 36(%rsi),%eax   # 0x7ffff77ee7cb Bitmask jump[9]: 0x7ffff77ee7d4  0 sources, dests: 0x7ffff77ee7d6,0x7ffff77ee7d6,0x7ffff77ee851 je     0x7ffff77ee851 <bn_mul_words+145>
 sarl 36(%rsi)   # 0x7ffff77ee7ce 
 and  $0x1,%eax   # 0x7ffff77ee7d1 
 jne .+125   # 0x7ffff77ee7d4 
 nop   # 0x7ffff77ee7d6 
 nop   # 0x7ffff77ee7d7 
 nop   # 0x7ffff77ee7d8 
 nop   # 0x7ffff77ee7d9 
 nop   # 0x7ffff77ee7da 
 nop   # 0x7ffff77ee7db 
 nop   # 0x7ffff77ee7dc 
 nop   # 0x7ffff77ee7dd 
 nop   # 0x7ffff77ee7de 
 nop   # 0x7ffff77ee7df 
 nop   # 0x7ffff77ee7e0 
 nop   # 0x7ffff77ee7e1 
 nop   # 0x7ffff77ee7e2 
 nop   # 0x7ffff77ee7e3 
 nop   # 0x7ffff77ee7e4 
 nop   # 0x7ffff77ee7e5 
 nop   # 0x7ffff77ee7e6 
 nop   # 0x7ffff77ee7e7 
 nop   # 0x7ffff77ee7e8 
 nop   # 0x7ffff77ee7e9 
 nop   # 0x7ffff77ee7ea 
 nop   # 0x7ffff77ee7eb 
 nop   # 0x7ffff77ee7ec 
 nop   # 0x7ffff77ee7ed 
 nop   # 0x7ffff77ee7ee 
 nop   # 0x7ffff77ee7ef 
 nop   # 0x7ffff77ee7f0 
 nop   # 0x7ffff77ee7f1 
 nop   # 0x7ffff77ee7f2 
 nop   # 0x7ffff77ee7f3 
 nop   # 0x7ffff77ee7f4 
 nop   # 0x7ffff77ee7f5 
 nop   # 0x7ffff77ee7f6 
 nop   # 0x7ffff77ee7f7 
 nop   # 0x7ffff77ee7f8 
 nop   # 0x7ffff77ee7f9 
 nop   # 0x7ffff77ee7fa 
 nop   # 0x7ffff77ee7fb 
 nop   # 0x7ffff77ee7fc 
 nop   # 0x7ffff77ee7fd 
 nop   # 0x7ffff77ee7fe 
 nop   # 0x7ffff77ee7ff 
 nop   # 0x7ffff77ee800 
 nop   # 0x7ffff77ee801 
 nop   # 0x7ffff77ee802 
 nop   # 0x7ffff77ee803 
 nop   # 0x7ffff77ee804 
 nop   # 0x7ffff77ee805 
 nop   # 0x7ffff77ee806 
 nop   # 0x7ffff77ee807 
 nop   # 0x7ffff77ee808 
 nop   # 0x7ffff77ee809 
 nop   # 0x7ffff77ee80a 
 nop   # 0x7ffff77ee80b 
 nop   # 0x7ffff77ee80c 
 nop   # 0x7ffff77ee80d 
 nop   # 0x7ffff77ee80e 
 nop   # 0x7ffff77ee80f 
 nop   # 0x7ffff77ee810 
 nop   # 0x7ffff77ee811 
 nop   # 0x7ffff77ee812 
 nop   # 0x7ffff77ee813 
 nop   # 0x7ffff77ee814 
 nop   # 0x7ffff77ee815 
 nop   # 0x7ffff77ee816 
 nop   # 0x7ffff77ee817 
 nop   # 0x7ffff77ee818 
 nop   # 0x7ffff77ee819 
 nop   # 0x7ffff77ee81a 
 nop   # 0x7ffff77ee81b 
 nop   # 0x7ffff77ee81c 
 nop   # 0x7ffff77ee81d 
 nop   # 0x7ffff77ee81e 
 nop   # 0x7ffff77ee81f 
 nop   # 0x7ffff77ee820 
 nop   # 0x7ffff77ee821 
 nop   # 0x7ffff77ee822 
 nop   # 0x7ffff77ee823 
 nop   # 0x7ffff77ee824 
 nop   # 0x7ffff77ee825 
 nop   # 0x7ffff77ee826 
 nop   # 0x7ffff77ee827 
 nop   # 0x7ffff77ee828 
 nop   # 0x7ffff77ee829 
 nop   # 0x7ffff77ee82a 
 nop   # 0x7ffff77ee82b 
 nop   # 0x7ffff77ee82c 
 nop   # 0x7ffff77ee82d 
 nop   # 0x7ffff77ee82e 
 nop   # 0x7ffff77ee82f 
 nop   # 0x7ffff77ee830 
 nop   # 0x7ffff77ee831 
 nop   # 0x7ffff77ee832 
 nop   # 0x7ffff77ee833 
 nop   # 0x7ffff77ee834 
 nop   # 0x7ffff77ee835 
 nop   # 0x7ffff77ee836 
 nop   # 0x7ffff77ee837 
 nop   # 0x7ffff77ee838 
 nop   # 0x7ffff77ee839 
 nop   # 0x7ffff77ee83a 
 nop   # 0x7ffff77ee83b 
 nop   # 0x7ffff77ee83c 
 nop   # 0x7ffff77ee83d 
 mov 40(%rsi),%eax   # 0x7ffff77ee83e Bitmask jump[10]: 0x7ffff77ee847  0 sources, dests: 0x7ffff77ee7e0,0x7ffff77ee7e0,0x7ffff77ee7e0,0x7ffff77ee7e0,0x7ffff77ee7e0,0x7ffff77ee7e0,0x7ffff77ee7e0,0x7ffff77ee849,0x7ffff77ee7e0,0x7ffff77ee7e0,0x7ffff77ee7e0,0x7ffff77ee7e0,0x7ffff77ee7e0,0x7ffff77ee7e0,0x7ffff77ee7e0,0x7ffff77ee849 jne    0x7ffff77ee7e0 <bn_mul_words+32>
 sarl 40(%rsi)   # 0x7ffff77ee841 
 and  $0x1,%eax   # 0x7ffff77ee844 
 jne .-103   # 0x7ffff77ee847 
 nop   # 0x7ffff77ee849 
 nop   # 0x7ffff77ee84a 
 nop   # 0x7ffff77ee84b 
 nop   # 0x7ffff77ee84c 
 nop   # 0x7ffff77ee84d 
 nop   # 0x7ffff77ee84e 
 jno  .+78   # 0x7ffff77ee84f 0x7ffff77ee84f  0 sources, dests: 0x7ffff77ee89d,0x7ffff77ee89d je     0x7ffff77ee89d <bn_mul_words+221>
 nop   # 0x7ffff77ee851 
 nop   # 0x7ffff77ee852 
 nop   # 0x7ffff77ee853 
 nop   # 0x7ffff77ee854 
 nop   # 0x7ffff77ee855 
 nop   # 0x7ffff77ee856 
 nop   # 0x7ffff77ee857 
 nop   # 0x7ffff77ee858 
 nop   # 0x7ffff77ee859 
 nop   # 0x7ffff77ee85a 
 nop   # 0x7ffff77ee85b 
 nop   # 0x7ffff77ee85c 
 nop   # 0x7ffff77ee85d 
 nop   # 0x7ffff77ee85e 
 nop   # 0x7ffff77ee85f 
 nop   # 0x7ffff77ee860 
 nop   # 0x7ffff77ee861 
 nop   # 0x7ffff77ee862 
 nop   # 0x7ffff77ee863 
 nop   # 0x7ffff77ee864 
 nop   # 0x7ffff77ee865 
 nop   # 0x7ffff77ee866 
 nop   # 0x7ffff77ee867 
 jno  .+53   # 0x7ffff77ee868 0x7ffff77ee868  0 sources, dests: 0x7ffff77ee89d je     0x7ffff77ee89d <bn_mul_words+221>


.section .addr_0x7ffff77ee89d, "ax"
.global addr_0x7ffff77ee89d
.type addr_0x7ffff77ee89d, @function
addr_0x7ffff77ee89d:
 nop   # 0x7ffff77ee89d 
 nop   # 0x7ffff77ee89e 
 nop   # 0x7ffff77ee89f 
 ret   # 0x7ffff77ee8a0 0x7ffff77ee8a0  0 sources, dests: 0x7ffff77e3cd0,0x7ffff77e3cd0,0x7ffff77e836f retq   


.section .addr_0x7ffff77ee980, "ax"
.global addr_0x7ffff77ee980
.type addr_0x7ffff77ee980, @function
addr_0x7ffff77ee980:
 nop   # 0x7ffff77ee980 
 nop   # 0x7ffff77ee981 
 jo  .+46   # 0x7ffff77ee982 0x7ffff77ee982  0 sources, dests: 0x7ffff77ee984 jle    0x7ffff77ee9b0 <bn_add_words+48>+2 bytes
 nop   # 0x7ffff77ee984 
 nop   # 0x7ffff77ee985 
 nop   # 0x7ffff77ee986 
 nop   # 0x7ffff77ee987 
 nop   # 0x7ffff77ee988 
 nop   # 0x7ffff77ee989 
 jmp  .+6   # 0x7ffff77ee98a 


.section .addr_0x7ffff77ee990, "ax"
.global addr_0x7ffff77ee990
.type addr_0x7ffff77ee990, @function
addr_0x7ffff77ee990:
 nop   # 0x7ffff77ee990 
 nop   # 0x7ffff77ee991 
 nop   # 0x7ffff77ee992 
 nop   # 0x7ffff77ee993 
 nop   # 0x7ffff77ee994 
 nop   # 0x7ffff77ee995 
 nop   # 0x7ffff77ee996 
 nop   # 0x7ffff77ee997 
 nop   # 0x7ffff77ee998 
 nop   # 0x7ffff77ee999 
 nop   # 0x7ffff77ee99a 
 nop   # 0x7ffff77ee99b 
 nop   # 0x7ffff77ee99c 
 nop   # 0x7ffff77ee99d 
 nop   # 0x7ffff77ee99e 
 nop   # 0x7ffff77ee99f 
 nop   # 0x7ffff77ee9a0 
 nop   # 0x7ffff77ee9a1 
 nop   # 0x7ffff77ee9a2 
 nop   # 0x7ffff77ee9a3 
 nop   # 0x7ffff77ee9a4 
 nop   # 0x7ffff77ee9a5 
 nop   # 0x7ffff77ee9a6 
 nop   # 0x7ffff77ee9a7 
 ret   # 0x7ffff77ee9a8 0x7ffff77ee9a8  0 sources, dests: 0x7ffff77e33d8 retq   


.section .addr_0x7ffff77ee9c0, "ax"
.global addr_0x7ffff77ee9c0
.type addr_0x7ffff77ee9c0, @function
addr_0x7ffff77ee9c0:
 nop   # 0x7ffff77ee9c0 
 nop   # 0x7ffff77ee9c1 
 jo  .+46   # 0x7ffff77ee9c2 0x7ffff77ee9c2  0 sources, dests: 0x7ffff77ee9c4,0x7ffff77ee9c4 jle    0x7ffff77ee9f0 <bn_sub_words+48>+2 bytes
 nop   # 0x7ffff77ee9c4 
 nop   # 0x7ffff77ee9c5 
 nop   # 0x7ffff77ee9c6 
 nop   # 0x7ffff77ee9c7 
 nop   # 0x7ffff77ee9c8 
 nop   # 0x7ffff77ee9c9 
 jmp  .+6   # 0x7ffff77ee9ca 


.section .addr_0x7ffff77ee9d0, "ax"
.global addr_0x7ffff77ee9d0
.type addr_0x7ffff77ee9d0, @function
addr_0x7ffff77ee9d0:
 nop   # 0x7ffff77ee9d0 
 nop   # 0x7ffff77ee9d1 
 nop   # 0x7ffff77ee9d2 
 nop   # 0x7ffff77ee9d3 
 nop   # 0x7ffff77ee9d4 
 nop   # 0x7ffff77ee9d5 
 nop   # 0x7ffff77ee9d6 
 nop   # 0x7ffff77ee9d7 
 nop   # 0x7ffff77ee9d8 
 nop   # 0x7ffff77ee9d9 
 nop   # 0x7ffff77ee9da 
 nop   # 0x7ffff77ee9db 
 nop   # 0x7ffff77ee9dc 
 nop   # 0x7ffff77ee9dd 
 nop   # 0x7ffff77ee9de 
 nop   # 0x7ffff77ee9df 
 nop   # 0x7ffff77ee9e0 
 nop   # 0x7ffff77ee9e1 
 nop   # 0x7ffff77ee9e2 
 nop   # 0x7ffff77ee9e3 
 nop   # 0x7ffff77ee9e4 
 nop   # 0x7ffff77ee9e5 
 nop   # 0x7ffff77ee9e6 
 nop   # 0x7ffff77ee9e7 
 ret   # 0x7ffff77ee9e8 0x7ffff77ee9e8  0 sources, dests: 0x7ffff77e3cfb,0x7ffff77e3cfb retq   


/*
void addr_0x7ffff74d2970();
void addr_0x7ffff74d2a50();
void addr_0x7ffff778b8f0();
void addr_0x7ffff77e3380();
void addr_0x7ffff77e33ac();
void addr_0x7ffff77e343d();
void addr_0x7ffff77e3466();
void addr_0x7ffff77e36e0();
void addr_0x7ffff77e37a0();
void addr_0x7ffff77e38e0();
void addr_0x7ffff77e39db();
void addr_0x7ffff77e3a24();
void addr_0x7ffff77e3ae0();
void addr_0x7ffff77e3b33();
void addr_0x7ffff77e3bf9();
void addr_0x7ffff77e3cb8();
void addr_0x7ffff77e3d50();
void addr_0x7ffff77e3e22();
void addr_0x7ffff77e3e7d();
void addr_0x7ffff77e3f50();
void addr_0x7ffff77e6bb0();
void addr_0x7ffff77e6ce0();
void addr_0x7ffff77e6cf0();
void addr_0x7ffff77e7130();
void addr_0x7ffff77e7bb0();
void addr_0x7ffff77e7bc8();
void addr_0x7ffff77e7cc0();
void addr_0x7ffff77e7d18();
void addr_0x7ffff77e7d28();
void addr_0x7ffff77e7d40();
void addr_0x7ffff77e7d72();
void addr_0x7ffff77e7db0();
void addr_0x7ffff77e8320();
void addr_0x7ffff77e834d();
void addr_0x7ffff77e83ff();
void addr_0x7ffff77e93e0();
void addr_0x7ffff77e9520();
void addr_0x7ffff77e9589();
void addr_0x7ffff77eafd0();
void addr_0x7ffff77eb061();
void addr_0x7ffff77eb0a0();
void addr_0x7ffff77eb0b8();
void addr_0x7ffff77eb180();
void addr_0x7ffff77eb231();
void addr_0x7ffff77eb2b8();
void addr_0x7ffff77ecc38();
void addr_0x7ffff77ee7c0();
void addr_0x7ffff77ee89d();
void addr_0x7ffff77ee980();
void addr_0x7ffff77ee990();
void addr_0x7ffff77ee9c0();
void addr_0x7ffff77ee9d0();


load_page(0x7ffff74d2000);
memcpy((void*)0x7ffff74d2970, addr_0x7ffff74d2970, 30);
memcpy((void*)0x7ffff74d2a50, addr_0x7ffff74d2a50, 15);
load_page(0x7ffff778b000);
memcpy((void*)0x7ffff778b8f0, addr_0x7ffff778b8f0, 5);
load_page(0x7ffff77e3000);
memcpy((void*)0x7ffff77e3380, addr_0x7ffff77e3380, 30);
memcpy((void*)0x7ffff77e33ac, addr_0x7ffff77e33ac, 64);
memcpy((void*)0x7ffff77e343d, addr_0x7ffff77e343d, 27);
memcpy((void*)0x7ffff77e3466, addr_0x7ffff77e3466, 5);
memcpy((void*)0x7ffff77e36e0, addr_0x7ffff77e36e0, 33);
memcpy((void*)0x7ffff77e37a0, addr_0x7ffff77e37a0, 20);
memcpy((void*)0x7ffff77e38e0, addr_0x7ffff77e38e0, 165);
memcpy((void*)0x7ffff77e39db, addr_0x7ffff77e39db, 13);
memcpy((void*)0x7ffff77e3a24, addr_0x7ffff77e3a24, 41);
memcpy((void*)0x7ffff77e3ae0, addr_0x7ffff77e3ae0, 73);
memcpy((void*)0x7ffff77e3b33, addr_0x7ffff77e3b33, 190);
memcpy((void*)0x7ffff77e3bf9, addr_0x7ffff77e3bf9, 145);
memcpy((void*)0x7ffff77e3cb8, addr_0x7ffff77e3cb8, 149);
memcpy((void*)0x7ffff77e3d50, addr_0x7ffff77e3d50, 129);
memcpy((void*)0x7ffff77e3e22, addr_0x7ffff77e3e22, 21);
memcpy((void*)0x7ffff77e3e7d, addr_0x7ffff77e3e7d, 50);
memcpy((void*)0x7ffff77e3f50, addr_0x7ffff77e3f50, 9);
load_page(0x7ffff77e6000);
memcpy((void*)0x7ffff77e6bb0, addr_0x7ffff77e6bb0, 68);
memcpy((void*)0x7ffff77e6ce0, addr_0x7ffff77e6ce0, 7);
memcpy((void*)0x7ffff77e6cf0, addr_0x7ffff77e6cf0, 26);
load_page(0x7ffff77e7000);
memcpy((void*)0x7ffff77e7130, addr_0x7ffff77e7130, 55);
memcpy((void*)0x7ffff77e7bb0, addr_0x7ffff77e7bb0, 14);
memcpy((void*)0x7ffff77e7bc8, addr_0x7ffff77e7bc8, 50);
memcpy((void*)0x7ffff77e7cc0, addr_0x7ffff77e7cc0, 60);
memcpy((void*)0x7ffff77e7d18, addr_0x7ffff77e7d18, 11);
memcpy((void*)0x7ffff77e7d28, addr_0x7ffff77e7d28, 5);
memcpy((void*)0x7ffff77e7d40, addr_0x7ffff77e7d40, 41);
memcpy((void*)0x7ffff77e7d72, addr_0x7ffff77e7d72, 53);
memcpy((void*)0x7ffff77e7db0, addr_0x7ffff77e7db0, 11);
load_page(0x7ffff77e8000);
memcpy((void*)0x7ffff77e8320, addr_0x7ffff77e8320, 34);
memcpy((void*)0x7ffff77e834d, addr_0x7ffff77e834d, 48);
memcpy((void*)0x7ffff77e83ff, addr_0x7ffff77e83ff, 15);
load_page(0x7ffff77e9000);
memcpy((void*)0x7ffff77e93e0, addr_0x7ffff77e93e0, 127);
memcpy((void*)0x7ffff77e9520, addr_0x7ffff77e9520, 94);
memcpy((void*)0x7ffff77e9589, addr_0x7ffff77e9589, 25);
load_page(0x7ffff77ea000);
memcpy((void*)0x7ffff77eafd0, addr_0x7ffff77eafd0, 80);
load_page(0x7ffff77eb000);
memcpy((void*)0x7ffff77eb061, addr_0x7ffff77eb061, 58);
memcpy((void*)0x7ffff77eb0a0, addr_0x7ffff77eb0a0, 19);
memcpy((void*)0x7ffff77eb0b8, addr_0x7ffff77eb0b8, 86);
memcpy((void*)0x7ffff77eb180, addr_0x7ffff77eb180, 138);
memcpy((void*)0x7ffff77eb231, addr_0x7ffff77eb231, 16);
memcpy((void*)0x7ffff77eb2b8, addr_0x7ffff77eb2b8, 100);
load_page(0x7ffff77ec000);
memcpy((void*)0x7ffff77ecc38, addr_0x7ffff77ecc38, 164);
load_page(0x7ffff77ee000);
memcpy((void*)0x7ffff77ee7c0, addr_0x7ffff77ee7c0, 170);
memcpy((void*)0x7ffff77ee89d, addr_0x7ffff77ee89d, 4);
memcpy((void*)0x7ffff77ee980, addr_0x7ffff77ee980, 12);
memcpy((void*)0x7ffff77ee990, addr_0x7ffff77ee990, 25);
memcpy((void*)0x7ffff77ee9c0, addr_0x7ffff77ee9c0, 12);
memcpy((void*)0x7ffff77ee9d0, addr_0x7ffff77ee9d0, 25);

*/

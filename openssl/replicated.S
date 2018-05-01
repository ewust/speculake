# 0x7ffff77e339c -> 0x7ffff77ee9a8 spans 46604 bytes
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
# 0x7ffff77e3a35  0 sources, dests: 0x7ffff77e3a3b jne    0x7ffff77e403b <BN_div+1883>
# 0x7ffff77e3a4c  0 sources, dests: 0x7ffff77eccd4 retq   
# 0x7ffff77e3d87  0 sources, dests: 0x7ffff77e3d89 je     0x7ffff77e3d8d <BN_div+1197>
# 0x7ffff77e3d93  0 sources, dests: 0x7ffff77e3d95 je     0x7ffff77e3dbe <BN_div+1246>
# 0x7ffff77e3d9b  0 sources, dests: 0x7ffff77e3d9d jle    0x7ffff77e3dbe <BN_div+1246>
# 0x7ffff77e3da8  0 sources, dests: 0x7ffff77e3daf jmp    0x7ffff77e3daf <BN_div+1231>
# 0x7ffff77e3db8  0 sources, dests: 0x7ffff77e3dba je     0x7ffff77e3daa <BN_div+1226>
# 0x7ffff77e3dc7  0 sources, dests: 0x7ffff77e7cc0 callq  0x7ffff77e7cc0 <BN_CTX_end>
# 0x7ffff77e3dcc  1 sources, dests: 0x7ffff77e3a24 jmpq   0x7ffff77e3a24 <BN_div+324>
# 0x7ffff77e7141  0 sources, dests: 0x7ffff77e7143,0x7ffff77e7143 jle    0x7ffff77e7170 <BN_set_word+64>
# 0x7ffff77e7166  0 sources, dests: 0x7ffff77e7d95,0x7ffff77e7d95 retq   
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
# 0x7ffff77e7d51  0 sources, dests: 0x7ffff77e7d53,0x7ffff77e7d53 jne    0x7ffff77e7d99 <BN_CTX_get+89>
# 0x7ffff77e7d58  0 sources, dests: 0x7ffff77e7d5a,0x7ffff77e7d5a jne    0x7ffff77e7d99 <BN_CTX_get+89>
# 0x7ffff77e7d63  0 sources, dests: 0x7ffff77e7d65,0x7ffff77e7d65 je     0x7ffff77e7dd0 <BN_CTX_get+144>
# 0x7ffff77e7d67  0 sources, dests: 0x7ffff77e7db0,0x7ffff77e7db0 jne    0x7ffff77e7db0 <BN_CTX_get+112>
# 0x7ffff77e7d85  0 sources, dests: 0x7ffff77e7d8b,0x7ffff77e7d8b je     0x7ffff77e7e56 <BN_CTX_get+278>
# 0x7ffff77e7d90  0 sources, dests: 0x7ffff77e7130,0x7ffff77e7130 callq  0x7ffff77e7130 <BN_set_word>
# 0x7ffff77e7da6  0 sources, dests: 0x7ffff77e396d,0x7ffff77e3978 retq   
# 0x7ffff77e7db9  0 sources, dests: 0x7ffff77e7d72,0x7ffff77e7d72 jne    0x7ffff77e7d72 <BN_CTX_get+50>
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
# 0x7ffff77eb240  0 sources, dests: 0x7ffff77e3d82 retq   
# 0x7ffff77ecc46  0 sources, dests: 0x7ffff77e93e0 callq  0x7ffff77e93e0 <BN_mul>
# 0x7ffff77ecc4d  0 sources, dests: 0x7ffff77ecc53 je     0x7ffff77eccdc <BN_mod_inverse+556>
# 0x7ffff77ecc5c  0 sources, dests: 0x7ffff77e36e0 callq  0x7ffff77e36e0 <BN_add>
# 0x7ffff77ecc63  0 sources, dests: 0x7ffff77ecc65 je     0x7ffff77eccdc <BN_mod_inverse+556>
# 0x7ffff77ecc74  0 sources, dests: 0x7ffff77ecc7a je     0x7ffff77ed0a0 <BN_mod_inverse+1520>
# 0x7ffff77ecccf  0 sources, dests: 0x7ffff77e38e0 callq  0x7ffff77e38e0 <BN_div>
# 0x7ffff77eccd6  0 sources, dests: 0x7ffff77ecc38 jne    0x7ffff77ecc38 <BN_mod_inverse+392>
# 0x7ffff77ee7c5  0 sources, dests: 0x7ffff77ee7cb jle    0x7ffff77ee8a8 <bn_mul_words+232>
# 0x7ffff77ee7d4  0 sources, dests: 0x7ffff77ee851 je     0x7ffff77ee851 <bn_mul_words+145>
# 0x7ffff77ee868  0 sources, dests: 0x7ffff77ee89d je     0x7ffff77ee89d <bn_mul_words+221>
# 0x7ffff77ee8a0  0 sources, dests: 0x7ffff77e836f retq   
# 0x7ffff77ee982  0 sources, dests: 0x7ffff77ee984 jle    0x7ffff77ee9b0 <bn_add_words+48>
# 0x7ffff77ee98a  0 sources, dests: 0x7ffff77ee990 jmp    0x7ffff77ee990 <bn_add_words+16>
# 0x7ffff77ee9a8  0 sources, dests: 0x7ffff77e33d8 retq   


.section .text
.global do_pattern
do_pattern:
    add   $0x50, %rsp
    mov   %rsp,  %rsi
    callq pattern_setup
    sub   $0x50, %rsp
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
movabs $0x7ffff77e3978, %rax
pushq %rax
movabs $0x7ffff77e7d95, %rax
pushq %rax
movabs $0x7ffff77e396d, %rax
pushq %rax
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

movl $0x00000002,12(%rsi)
movl $0x00000002,4(%rsi)
movl $0x00000008,8(%rsi)
test %eax,%eax
jmp begin_pattern

begin_pattern:  # please link @0x7ffff77e3380


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


.section .addr_0x7ffff77e3d82, "ax"
.global addr_0x7ffff77e3d82
.type addr_0x7ffff77e3d82, @function
addr_0x7ffff77e3d82:
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


.section .addr_0x7ffff77e3daf, "ax"
.global addr_0x7ffff77e3daf
.type addr_0x7ffff77e3daf, @function
addr_0x7ffff77e3daf:
 nop   # 0x7ffff77e3daf 
 nop   # 0x7ffff77e3db0 
 nop   # 0x7ffff77e3db1 
 nop   # 0x7ffff77e3db2 
 nop   # 0x7ffff77e3db3 
 nop   # 0x7ffff77e3db4 
 nop   # 0x7ffff77e3db5 
 nop   # 0x7ffff77e3db6 
 nop   # 0x7ffff77e3db7 
 jo  .-14   # 0x7ffff77e3db8 0x7ffff77e3db8  0 sources, dests: 0x7ffff77e3dba je     0x7ffff77e3daa <BN_div+1226>+2 bytes
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
 jo  .+47   # 0x7ffff77e7141 0x7ffff77e7141  0 sources, dests: 0x7ffff77e7143,0x7ffff77e7143 jle    0x7ffff77e7170 <BN_set_word+64>+2 bytes
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
 ret   # 0x7ffff77e7166 0x7ffff77e7166  0 sources, dests: 0x7ffff77e7d95,0x7ffff77e7d95 retq   


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
 mov 4(%rsi),%eax   # 0x7ffff77e7cd3 Bitmask jump[1]: 0x7ffff77e7cdc  0 sources, dests: 0x7ffff77e7cde,0x7ffff77e7d18 jbe    0x7ffff77e7d18 <BN_CTX_end+88>
 sarl 4(%rsi)   # 0x7ffff77e7cd6 
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
 sarl 8(%rsi)   # 0x7ffff77e7cf0 
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
 mov 8(%rsi),%eax   # 0x7ffff77e7ced Bitmask jump[2]: 0x7ffff77e7cf6  0 sources, dests: 0x7ffff77e7cf8,0x7ffff77e7cf8,0x7ffff77e7cf8,0x7ffff77e7d18 je     0x7ffff77e7d18 <BN_CTX_end+88>
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
 jo  .+72   # 0x7ffff77e7d51 0x7ffff77e7d51  0 sources, dests: 0x7ffff77e7d53,0x7ffff77e7d53 jne    0x7ffff77e7d99 <BN_CTX_get+89>+2 bytes
 nop   # 0x7ffff77e7d53 
 nop   # 0x7ffff77e7d54 
 nop   # 0x7ffff77e7d55 
 nop   # 0x7ffff77e7d56 
 nop   # 0x7ffff77e7d57 
 jo  .+65   # 0x7ffff77e7d58 0x7ffff77e7d58  0 sources, dests: 0x7ffff77e7d5a,0x7ffff77e7d5a jne    0x7ffff77e7d99 <BN_CTX_get+89>+2 bytes
 nop   # 0x7ffff77e7d5a 
 nop   # 0x7ffff77e7d5b 
 nop   # 0x7ffff77e7d5c 
 nop   # 0x7ffff77e7d5d 
 nop   # 0x7ffff77e7d5e 
 nop   # 0x7ffff77e7d5f 
 nop   # 0x7ffff77e7d60 
 nop   # 0x7ffff77e7d61 
 nop   # 0x7ffff77e7d62 
 jo  .+109   # 0x7ffff77e7d63 0x7ffff77e7d63  0 sources, dests: 0x7ffff77e7d65,0x7ffff77e7d65 je     0x7ffff77e7dd0 <BN_CTX_get+144>+2 bytes
 nop   # 0x7ffff77e7d65 
 nop   # 0x7ffff77e7d66 
 jno  .+73   # 0x7ffff77e7d67 0x7ffff77e7d67  0 sources, dests: 0x7ffff77e7db0,0x7ffff77e7db0 jne    0x7ffff77e7db0 <BN_CTX_get+112>


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
 jo  .+209   # 0x7ffff77e7d85 0x7ffff77e7d85  0 sources, dests: 0x7ffff77e7d8b,0x7ffff77e7d8b je     0x7ffff77e7e56 <BN_CTX_get+278>+6 bytes
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
 nop   # 0x7ffff77e7d9c 
 nop   # 0x7ffff77e7d9d 
 nop   # 0x7ffff77e7d9e 
 nop   # 0x7ffff77e7d9f 
 nop   # 0x7ffff77e7da0 
 nop   # 0x7ffff77e7da1 
 nop   # 0x7ffff77e7da2 
 nop   # 0x7ffff77e7da3 
 nop   # 0x7ffff77e7da4 
 nop   # 0x7ffff77e7da5 
 ret   # 0x7ffff77e7da6 0x7ffff77e7da6  0 sources, dests: 0x7ffff77e396d,0x7ffff77e3978 retq   


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
 jno  .-71   # 0x7ffff77e7db9 0x7ffff77e7db9  0 sources, dests: 0x7ffff77e7d72,0x7ffff77e7d72 jne    0x7ffff77e7d72 <BN_CTX_get+50>


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
 mov 12(%rsi),%eax   # 0x7ffff77e9560 Bitmask jump[3]: 0x7ffff77e9569  0 sources, dests: 0x7ffff77e956b,0x7ffff77e9570 jne    0x7ffff77e9570 <BN_mul+400>
 sarl 12(%rsi)   # 0x7ffff77e9563 
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


.section .addr_0x7ffff77eb240, "ax"
.global addr_0x7ffff77eb240
.type addr_0x7ffff77eb240, @function
addr_0x7ffff77eb240:
 ret   # 0x7ffff77eb240 0x7ffff77eb240  0 sources, dests: 0x7ffff77e3d82 retq   


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
 jo  .+227   # 0x7ffff77ee7c5 0x7ffff77ee7c5  0 sources, dests: 0x7ffff77ee7cb jle    0x7ffff77ee8a8 <bn_mul_words+232>+6 bytes
 nop   # 0x7ffff77ee7cb 
 nop   # 0x7ffff77ee7cc 
 nop   # 0x7ffff77ee7cd 
 nop   # 0x7ffff77ee7ce 
 nop   # 0x7ffff77ee7cf 
 nop   # 0x7ffff77ee7d0 
 nop   # 0x7ffff77ee7d1 
 nop   # 0x7ffff77ee7d2 
 nop   # 0x7ffff77ee7d3 
 jno  .+125   # 0x7ffff77ee7d4 0x7ffff77ee7d4  0 sources, dests: 0x7ffff77ee851 je     0x7ffff77ee851 <bn_mul_words+145>


.section .addr_0x7ffff77ee851, "ax"
.global addr_0x7ffff77ee851
.type addr_0x7ffff77ee851, @function
addr_0x7ffff77ee851:
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
 ret   # 0x7ffff77ee8a0 0x7ffff77ee8a0  0 sources, dests: 0x7ffff77e836f retq   


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


/*
void addr_0x7ffff77e3380();
void addr_0x7ffff77e33ac();
void addr_0x7ffff77e343d();
void addr_0x7ffff77e3466();
void addr_0x7ffff77e36e0();
void addr_0x7ffff77e37a0();
void addr_0x7ffff77e38e0();
void addr_0x7ffff77e3a24();
void addr_0x7ffff77e3d82();
void addr_0x7ffff77e3daf();
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
void addr_0x7ffff77eb240();
void addr_0x7ffff77ecc38();
void addr_0x7ffff77ee7c0();
void addr_0x7ffff77ee851();
void addr_0x7ffff77ee89d();
void addr_0x7ffff77ee980();
void addr_0x7ffff77ee990();


load_page(0x7ffff77e3000);
memcpy((void*)0x7ffff77e3380, addr_0x7ffff77e3380, 30);
memcpy((void*)0x7ffff77e33ac, addr_0x7ffff77e33ac, 64);
memcpy((void*)0x7ffff77e343d, addr_0x7ffff77e343d, 27);
memcpy((void*)0x7ffff77e3466, addr_0x7ffff77e3466, 5);
memcpy((void*)0x7ffff77e36e0, addr_0x7ffff77e36e0, 33);
memcpy((void*)0x7ffff77e37a0, addr_0x7ffff77e37a0, 20);
memcpy((void*)0x7ffff77e38e0, addr_0x7ffff77e38e0, 165);
memcpy((void*)0x7ffff77e3a24, addr_0x7ffff77e3a24, 41);
memcpy((void*)0x7ffff77e3d82, addr_0x7ffff77e3d82, 40);
memcpy((void*)0x7ffff77e3daf, addr_0x7ffff77e3daf, 34);
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
load_page(0x7ffff77eb000);
memcpy((void*)0x7ffff77eb240, addr_0x7ffff77eb240, 1);
load_page(0x7ffff77ec000);
memcpy((void*)0x7ffff77ecc38, addr_0x7ffff77ecc38, 164);
load_page(0x7ffff77ee000);
memcpy((void*)0x7ffff77ee7c0, addr_0x7ffff77ee7c0, 22);
memcpy((void*)0x7ffff77ee851, addr_0x7ffff77ee851, 25);
memcpy((void*)0x7ffff77ee89d, addr_0x7ffff77ee89d, 4);
memcpy((void*)0x7ffff77ee980, addr_0x7ffff77ee980, 12);
memcpy((void*)0x7ffff77ee990, addr_0x7ffff77ee990, 25);

*/

.section .targets, "ax"
  .global targets
targets:
  movl $0x0000, %ebx    # 0x00990000
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0001, %ebx    # 0x00990016
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0002, %ebx    # 0x0099002c
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0003, %ebx    # 0x00990042
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0004, %ebx    # 0x00990058
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0005, %ebx    # 0x0099006e
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0006, %ebx    # 0x00990084
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0007, %ebx    # 0x0099009a
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0008, %ebx    # 0x009900b0
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0009, %ebx    # 0x009900c6
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x000a, %ebx    # 0x009900dc
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x000b, %ebx    # 0x009900f2
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x000c, %ebx    # 0x00990108
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x000d, %ebx    # 0x0099011e
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x000e, %ebx    # 0x00990134
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x000f, %ebx    # 0x0099014a
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0010, %ebx    # 0x00990160
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0011, %ebx    # 0x00990176
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0012, %ebx    # 0x0099018c
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0013, %ebx    # 0x009901a2
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0014, %ebx    # 0x009901b8
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0015, %ebx    # 0x009901ce
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0016, %ebx    # 0x009901e4
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0017, %ebx    # 0x009901fa
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0018, %ebx    # 0x00990210
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0019, %ebx    # 0x00990226
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x001a, %ebx    # 0x0099023c
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x001b, %ebx    # 0x00990252
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x001c, %ebx    # 0x00990268
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x001d, %ebx    # 0x0099027e
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x001e, %ebx    # 0x00990294
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x001f, %ebx    # 0x009902aa
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0020, %ebx    # 0x009902c0
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0021, %ebx    # 0x009902d6
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0022, %ebx    # 0x009902ec
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0023, %ebx    # 0x00990302
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0024, %ebx    # 0x00990318
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0025, %ebx    # 0x0099032e
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0026, %ebx    # 0x00990344
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0027, %ebx    # 0x0099035a
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0028, %ebx    # 0x00990370
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0029, %ebx    # 0x00990386
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x002a, %ebx    # 0x0099039c
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x002b, %ebx    # 0x009903b2
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x002c, %ebx    # 0x009903c8
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x002d, %ebx    # 0x009903de
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x002e, %ebx    # 0x009903f4
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x002f, %ebx    # 0x0099040a
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0030, %ebx    # 0x00990420
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0031, %ebx    # 0x00990436
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0032, %ebx    # 0x0099044c
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0033, %ebx    # 0x00990462
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0034, %ebx    # 0x00990478
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0035, %ebx    # 0x0099048e
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0036, %ebx    # 0x009904a4
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0037, %ebx    # 0x009904ba
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0038, %ebx    # 0x009904d0
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0039, %ebx    # 0x009904e6
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x003a, %ebx    # 0x009904fc
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x003b, %ebx    # 0x00990512
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x003c, %ebx    # 0x00990528
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x003d, %ebx    # 0x0099053e
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x003e, %ebx    # 0x00990554
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x003f, %ebx    # 0x0099056a
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0040, %ebx    # 0x00990580
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0041, %ebx    # 0x00990596
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0042, %ebx    # 0x009905ac
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0043, %ebx    # 0x009905c2
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0044, %ebx    # 0x009905d8
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0045, %ebx    # 0x009905ee
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0046, %ebx    # 0x00990604
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0047, %ebx    # 0x0099061a
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0048, %ebx    # 0x00990630
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0049, %ebx    # 0x00990646
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x004a, %ebx    # 0x0099065c
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x004b, %ebx    # 0x00990672
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x004c, %ebx    # 0x00990688
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x004d, %ebx    # 0x0099069e
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x004e, %ebx    # 0x009906b4
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x004f, %ebx    # 0x009906ca
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0050, %ebx    # 0x009906e0
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0051, %ebx    # 0x009906f6
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0052, %ebx    # 0x0099070c
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0053, %ebx    # 0x00990722
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0054, %ebx    # 0x00990738
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0055, %ebx    # 0x0099074e
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0056, %ebx    # 0x00990764
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0057, %ebx    # 0x0099077a
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0058, %ebx    # 0x00990790
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0059, %ebx    # 0x009907a6
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x005a, %ebx    # 0x009907bc
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x005b, %ebx    # 0x009907d2
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x005c, %ebx    # 0x009907e8
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x005d, %ebx    # 0x009907fe
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x005e, %ebx    # 0x00990814
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x005f, %ebx    # 0x0099082a
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0060, %ebx    # 0x00990840
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0061, %ebx    # 0x00990856
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0062, %ebx    # 0x0099086c
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0063, %ebx    # 0x00990882
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0064, %ebx    # 0x00990898
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0065, %ebx    # 0x009908ae
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0066, %ebx    # 0x009908c4
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0067, %ebx    # 0x009908da
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0068, %ebx    # 0x009908f0
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0069, %ebx    # 0x00990906
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x006a, %ebx    # 0x0099091c
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x006b, %ebx    # 0x00990932
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x006c, %ebx    # 0x00990948
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x006d, %ebx    # 0x0099095e
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x006e, %ebx    # 0x00990974
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x006f, %ebx    # 0x0099098a
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0070, %ebx    # 0x009909a0
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0071, %ebx    # 0x009909b6
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0072, %ebx    # 0x009909cc
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0073, %ebx    # 0x009909e2
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0074, %ebx    # 0x009909f8
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0075, %ebx    # 0x00990a0e
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0076, %ebx    # 0x00990a24
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0077, %ebx    # 0x00990a3a
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0078, %ebx    # 0x00990a50
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0079, %ebx    # 0x00990a66
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x007a, %ebx    # 0x00990a7c
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x007b, %ebx    # 0x00990a92
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x007c, %ebx    # 0x00990aa8
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x007d, %ebx    # 0x00990abe
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x007e, %ebx    # 0x00990ad4
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x007f, %ebx    # 0x00990aea
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0080, %ebx    # 0x00990b00
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0081, %ebx    # 0x00990b16
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0082, %ebx    # 0x00990b2c
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0083, %ebx    # 0x00990b42
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0084, %ebx    # 0x00990b58
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0085, %ebx    # 0x00990b6e
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0086, %ebx    # 0x00990b84
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0087, %ebx    # 0x00990b9a
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0088, %ebx    # 0x00990bb0
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0089, %ebx    # 0x00990bc6
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x008a, %ebx    # 0x00990bdc
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x008b, %ebx    # 0x00990bf2
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x008c, %ebx    # 0x00990c08
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x008d, %ebx    # 0x00990c1e
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x008e, %ebx    # 0x00990c34
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x008f, %ebx    # 0x00990c4a
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0090, %ebx    # 0x00990c60
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0091, %ebx    # 0x00990c76
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0092, %ebx    # 0x00990c8c
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0093, %ebx    # 0x00990ca2
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0094, %ebx    # 0x00990cb8
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0095, %ebx    # 0x00990cce
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0096, %ebx    # 0x00990ce4
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0097, %ebx    # 0x00990cfa
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0098, %ebx    # 0x00990d10
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x0099, %ebx    # 0x00990d26
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x009a, %ebx    # 0x00990d3c
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x009b, %ebx    # 0x00990d52
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x009c, %ebx    # 0x00990d68
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x009d, %ebx    # 0x00990d7e
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x009e, %ebx    # 0x00990d94
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x009f, %ebx    # 0x00990daa
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00a0, %ebx    # 0x00990dc0
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00a1, %ebx    # 0x00990dd6
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00a2, %ebx    # 0x00990dec
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00a3, %ebx    # 0x00990e02
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00a4, %ebx    # 0x00990e18
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00a5, %ebx    # 0x00990e2e
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00a6, %ebx    # 0x00990e44
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00a7, %ebx    # 0x00990e5a
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00a8, %ebx    # 0x00990e70
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00a9, %ebx    # 0x00990e86
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00aa, %ebx    # 0x00990e9c
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00ab, %ebx    # 0x00990eb2
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00ac, %ebx    # 0x00990ec8
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00ad, %ebx    # 0x00990ede
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00ae, %ebx    # 0x00990ef4
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00af, %ebx    # 0x00990f0a
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00b0, %ebx    # 0x00990f20
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00b1, %ebx    # 0x00990f36
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00b2, %ebx    # 0x00990f4c
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00b3, %ebx    # 0x00990f62
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00b4, %ebx    # 0x00990f78
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00b5, %ebx    # 0x00990f8e
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00b6, %ebx    # 0x00990fa4
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00b7, %ebx    # 0x00990fba
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00b8, %ebx    # 0x00990fd0
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00b9, %ebx    # 0x00990fe6
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00ba, %ebx    # 0x00990ffc
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00bb, %ebx    # 0x00991012
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00bc, %ebx    # 0x00991028
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00bd, %ebx    # 0x0099103e
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00be, %ebx    # 0x00991054
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00bf, %ebx    # 0x0099106a
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00c0, %ebx    # 0x00991080
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00c1, %ebx    # 0x00991096
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00c2, %ebx    # 0x009910ac
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00c3, %ebx    # 0x009910c2
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00c4, %ebx    # 0x009910d8
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00c5, %ebx    # 0x009910ee
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00c6, %ebx    # 0x00991104
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00c7, %ebx    # 0x0099111a
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00c8, %ebx    # 0x00991130
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00c9, %ebx    # 0x00991146
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00ca, %ebx    # 0x0099115c
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00cb, %ebx    # 0x00991172
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00cc, %ebx    # 0x00991188
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00cd, %ebx    # 0x0099119e
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00ce, %ebx    # 0x009911b4
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00cf, %ebx    # 0x009911ca
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00d0, %ebx    # 0x009911e0
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00d1, %ebx    # 0x009911f6
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00d2, %ebx    # 0x0099120c
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00d3, %ebx    # 0x00991222
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00d4, %ebx    # 0x00991238
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00d5, %ebx    # 0x0099124e
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00d6, %ebx    # 0x00991264
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00d7, %ebx    # 0x0099127a
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00d8, %ebx    # 0x00991290
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00d9, %ebx    # 0x009912a6
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00da, %ebx    # 0x009912bc
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00db, %ebx    # 0x009912d2
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00dc, %ebx    # 0x009912e8
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00dd, %ebx    # 0x009912fe
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00de, %ebx    # 0x00991314
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00df, %ebx    # 0x0099132a
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00e0, %ebx    # 0x00991340
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00e1, %ebx    # 0x00991356
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00e2, %ebx    # 0x0099136c
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00e3, %ebx    # 0x00991382
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00e4, %ebx    # 0x00991398
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00e5, %ebx    # 0x009913ae
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00e6, %ebx    # 0x009913c4
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00e7, %ebx    # 0x009913da
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00e8, %ebx    # 0x009913f0
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00e9, %ebx    # 0x00991406
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00ea, %ebx    # 0x0099141c
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00eb, %ebx    # 0x00991432
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00ec, %ebx    # 0x00991448
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00ed, %ebx    # 0x0099145e
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00ee, %ebx    # 0x00991474
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00ef, %ebx    # 0x0099148a
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00f0, %ebx    # 0x009914a0
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00f1, %ebx    # 0x009914b6
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00f2, %ebx    # 0x009914cc
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00f3, %ebx    # 0x009914e2
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00f4, %ebx    # 0x009914f8
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00f5, %ebx    # 0x0099150e
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00f6, %ebx    # 0x00991524
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00f7, %ebx    # 0x0099153a
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00f8, %ebx    # 0x00991550
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00f9, %ebx    # 0x00991566
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00fa, %ebx    # 0x0099157c
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00fb, %ebx    # 0x00991592
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00fc, %ebx    # 0x009915a8
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00fd, %ebx    # 0x009915be
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00fe, %ebx    # 0x009915d4
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax
  movl $0x00ff, %ebx    # 0x009915ea
  movq %rbx, %xmm11
  pslldq $1, %xmm0
  pxor %xmm11, %xmm0
  jmpq *%rax


# This function encrypts a counter (provided in %rdi)
# Using a pseudo-key derived from the value in %xmm0
# Returns a __uint128_t in %rax:%rdx
#
# This function assumes that you've jumped through some number
# of targets, and %rcx is set accordingly.
# We'll then derive %xmm0..10 round keys from %rcx (now in %rdi).
# Ideally, we could use some kind of hash function.
# But the speculative world doens't live that long,
# So we'll just use aesenc.

  .global encrypt
encrypt:
    # Derive %xmm0...10 from %xmm0
    # Ideally, we'd treat xmm0 as an AES key
    # and do the normal AES key schedule.
    # Unfortunately, we don't have enough
    # speculative time to do full AES key schedule,
    # so we do this hack instead.
    # This is almost surely broken as crypto...
    # We might want to use aesimc here?
    movdqa %xmm0, %xmm15
    aesenc %xmm0, %xmm0
    movdqa %xmm0, %xmm1
    aesenc %xmm0, %xmm0
    movdqa %xmm0, %xmm2
    aesenc %xmm0, %xmm0
    movdqa %xmm0, %xmm3
    aesenc %xmm0, %xmm0
    movdqa %xmm0, %xmm4
    aesenc %xmm0, %xmm0
    movdqa %xmm0, %xmm5
    aesenc %xmm0, %xmm0
    movdqa %xmm0, %xmm6
    aesenc %xmm0, %xmm0
    movdqa %xmm0, %xmm7
    aesenc %xmm0, %xmm0
    movdqa %xmm0, %xmm8
    aesenc %xmm0, %xmm0
    movdqa %xmm0, %xmm9
    aesenc %xmm0, %xmm0
    movdqa %xmm0, %xmm10
    aesenc %xmm0, %xmm0

    # Load counter into xmm15
    movq %rdi, %rax
    bswap %rax
    movq %rax, %xmm15

    # encrypt counter
    pxor %xmm0, %xmm15
    aesenc %xmm1, %xmm15
    aesenc %xmm2, %xmm15
    aesenc %xmm3, %xmm15
    aesenc %xmm4, %xmm15
    aesenc %xmm5, %xmm15
    aesenc %xmm6, %xmm15
    aesenc %xmm7, %xmm15
    aesenc %xmm8, %xmm15
    aesenc %xmm9, %xmm15
    aesenclast %xmm10, %xmm15

    # Xor keystream with ciphertext
    mov $ctext, %rcx
    imul $0x10, %rdi
    addq %rcx, %rdi
    movaps 0x00(%rdi), %xmm14
    pxor %xmm14, %xmm15

    # return __uint128_t in rax:rdx
    movq %xmm15, %rdx
    psrldq $0x8, %xmm15
    movq %xmm15, %rax
    ret


# We need a wrapper to encrypt() that in
# payload takes the output and sends the result of the byte
# all of the functions on the way here have kept a uint64_t ctr
# argument in %rdi.
.global encrypt_wrap
encrypt_wrap:

    mov %rdi, %rbx
    shr $0x4,%rdi   # divide ctr by 16
    callq encrypt


    and $0xf,%ebx       # ctr % 16
    shl $3, %ebx        # *8

    mov %ebx,%ecx       # put into %cl
    shrd %cl,%rax,%rdx
    shr  %cl,%rax
    test $0x40,%cl
    je lower_bits
    mov %rax, %rdx
lower_bits:
    mov %rdx, %rax
    and $0xff, %eax     # just one byte, plz

    # for trigger, we'll return this byte.

    # for payload, we'll signal it via our cache side channel
    # ...

  # This is payload:
  mov 0x480000, %rdx    # probe_buf
  mov 0x480010, %rbx    # cur_probe_space
  imul %rax, %rbx        # cur_probe_space*pt_byte
  add %rbx, %rdx         # +probe_buf
  mov (%rdx),%rax        # load something in cache
  nop                    # celebratory nop
  retq                   # in case you actually called this



.global end_targets
end_targets:
    nop


  .global setup_indirect
setup_indirect:
  push   %rbp
  mov	%rsp,%rbp
  push	%rbx
  sub	$0x18,%rsp
  pxor %xmm0, %xmm0
  pxor %xmm1, %xmm1
  pxor %xmm2, %xmm2
  pxor %xmm3, %xmm3
  pxor %xmm4, %xmm4
  pxor %xmm5, %xmm5
  pxor %xmm6, %xmm6
  pxor %xmm7, %xmm7
  pxor %xmm8, %xmm8
  pxor %xmm9, %xmm9
  pxor %xmm10, %xmm10
  callq indirect
  add $0x18, %rsp
  pop %rbx
  pop %rbp
  retq

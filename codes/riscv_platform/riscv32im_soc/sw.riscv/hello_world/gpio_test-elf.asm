
gpio_test.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00012197          	auipc	gp,0x12
       4:	7d018193          	addi	gp,gp,2000 # 127d0 <__global_pointer$>
       8:	00020117          	auipc	sp,0x20
       c:	ff810113          	addi	sp,sp,-8 # 20000 <_memory_end>
      10:	00014e17          	auipc	t3,0x14
      14:	bc8e0e13          	addi	t3,t3,-1080 # 13bd8 <__sf>
      18:	00014e97          	auipc	t4,0x14
      1c:	d38e8e93          	addi	t4,t4,-712 # 13d50 <_bss_end>
      20:	00c0006f          	j	2c <clear_bss_end>

00000024 <clear_bss32>:
      24:	000e2023          	sw	zero,0(t3)
      28:	004e0e13          	addi	t3,t3,4

0000002c <clear_bss_end>:
      2c:	ffde6ce3          	bltu	t3,t4,24 <clear_bss32>

00000030 <main_entry>:
      30:	00000513          	li	a0,0
      34:	00000593          	li	a1,0
      38:	2b4000ef          	jal	2ec <main>
      3c:	00040513          	mv	a0,s0

00000040 <terminate>:
      40:	00100293          	li	t0,1
      44:	00013317          	auipc	t1,0x13
      48:	46c30313          	addi	t1,t1,1132 # 134b0 <tohost>
      4c:	00532023          	sw	t0,0(t1)
      50:	0000006f          	j	50 <terminate+0x10>

00000054 <delay_ms>:
      54:	fd010113          	addi	sp,sp,-48
      58:	02812623          	sw	s0,44(sp)
      5c:	03010413          	addi	s0,sp,48
      60:	fca42e23          	sw	a0,-36(s0)
      64:	fdc42703          	lw	a4,-36(s0)
      68:	000027b7          	lui	a5,0x2
      6c:	71078793          	addi	a5,a5,1808 # 2710 <_vfprintf_r+0x304>
      70:	02f707b3          	mul	a5,a4,a5
      74:	fef42623          	sw	a5,-20(s0)
      78:	00000013          	nop
      7c:	fec42783          	lw	a5,-20(s0)
      80:	fff78713          	addi	a4,a5,-1
      84:	fee42623          	sw	a4,-20(s0)
      88:	fe079ae3          	bnez	a5,7c <delay_ms+0x28>
      8c:	00000013          	nop
      90:	00000013          	nop
      94:	02c12403          	lw	s0,44(sp)
      98:	03010113          	addi	sp,sp,48
      9c:	00008067          	ret

000000a0 <led_set>:
      a0:	fe010113          	addi	sp,sp,-32
      a4:	00112e23          	sw	ra,28(sp)
      a8:	00812c23          	sw	s0,24(sp)
      ac:	02010413          	addi	s0,sp,32
      b0:	fea42623          	sw	a0,-20(s0)
      b4:	000147b7          	lui	a5,0x14
      b8:	b607a783          	lw	a5,-1184(a5) # 13b60 <gpio_output_value>
      bc:	0ff7f713          	zext.b	a4,a5
      c0:	fec42783          	lw	a5,-20(s0)
      c4:	00879793          	slli	a5,a5,0x8
      c8:	00f76733          	or	a4,a4,a5
      cc:	000147b7          	lui	a5,0x14
      d0:	b6e7a023          	sw	a4,-1184(a5) # 13b60 <gpio_output_value>
      d4:	000147b7          	lui	a5,0x14
      d8:	b607a783          	lw	a5,-1184(a5) # 13b60 <gpio_output_value>
      dc:	00078513          	mv	a0,a5
      e0:	658010ef          	jal	1738 <gpio_write>
      e4:	00000013          	nop
      e8:	01c12083          	lw	ra,28(sp)
      ec:	01812403          	lw	s0,24(sp)
      f0:	02010113          	addi	sp,sp,32
      f4:	00008067          	ret

000000f8 <led_clear>:
      f8:	ff010113          	addi	sp,sp,-16
      fc:	00112623          	sw	ra,12(sp)
     100:	00812423          	sw	s0,8(sp)
     104:	01010413          	addi	s0,sp,16
     108:	000147b7          	lui	a5,0x14
     10c:	b607a783          	lw	a5,-1184(a5) # 13b60 <gpio_output_value>
     110:	0ff7f713          	zext.b	a4,a5
     114:	000147b7          	lui	a5,0x14
     118:	b6e7a023          	sw	a4,-1184(a5) # 13b60 <gpio_output_value>
     11c:	000147b7          	lui	a5,0x14
     120:	b607a783          	lw	a5,-1184(a5) # 13b60 <gpio_output_value>
     124:	00078513          	mv	a0,a5
     128:	610010ef          	jal	1738 <gpio_write>
     12c:	00000013          	nop
     130:	00c12083          	lw	ra,12(sp)
     134:	00812403          	lw	s0,8(sp)
     138:	01010113          	addi	sp,sp,16
     13c:	00008067          	ret

00000140 <read_password_from_eeprom>:
     140:	fd010113          	addi	sp,sp,-48
     144:	02112623          	sw	ra,44(sp)
     148:	02812423          	sw	s0,40(sp)
     14c:	03010413          	addi	s0,sp,48
     150:	fca42e23          	sw	a0,-36(s0)
     154:	fe840793          	addi	a5,s0,-24
     158:	00400613          	li	a2,4
     15c:	00078593          	mv	a1,a5
     160:	00000513          	li	a0,0
     164:	004020ef          	jal	2168 <i2c_eeprom_read_bytes>
     168:	00050793          	mv	a5,a0
     16c:	00078663          	beqz	a5,178 <read_password_from_eeprom+0x38>
     170:	fff00793          	li	a5,-1
     174:	0480006f          	j	1bc <read_password_from_eeprom+0x7c>
     178:	fe042623          	sw	zero,-20(s0)
     17c:	0300006f          	j	1ac <read_password_from_eeprom+0x6c>
     180:	fec42783          	lw	a5,-20(s0)
     184:	fdc42703          	lw	a4,-36(s0)
     188:	00f707b3          	add	a5,a4,a5
     18c:	fec42703          	lw	a4,-20(s0)
     190:	ff070713          	addi	a4,a4,-16
     194:	00870733          	add	a4,a4,s0
     198:	ff874703          	lbu	a4,-8(a4)
     19c:	00e78023          	sb	a4,0(a5)
     1a0:	fec42783          	lw	a5,-20(s0)
     1a4:	00178793          	addi	a5,a5,1
     1a8:	fef42623          	sw	a5,-20(s0)
     1ac:	fec42703          	lw	a4,-20(s0)
     1b0:	00300793          	li	a5,3
     1b4:	fce7d6e3          	bge	a5,a4,180 <read_password_from_eeprom+0x40>
     1b8:	00000793          	li	a5,0
     1bc:	00078513          	mv	a0,a5
     1c0:	02c12083          	lw	ra,44(sp)
     1c4:	02812403          	lw	s0,40(sp)
     1c8:	03010113          	addi	sp,sp,48
     1cc:	00008067          	ret

000001d0 <save_password_to_eeprom>:
     1d0:	fd010113          	addi	sp,sp,-48
     1d4:	02112623          	sw	ra,44(sp)
     1d8:	02812423          	sw	s0,40(sp)
     1dc:	03010413          	addi	s0,sp,48
     1e0:	fca42e23          	sw	a0,-36(s0)
     1e4:	fe042623          	sw	zero,-20(s0)
     1e8:	0300006f          	j	218 <save_password_to_eeprom+0x48>
     1ec:	fec42783          	lw	a5,-20(s0)
     1f0:	fdc42703          	lw	a4,-36(s0)
     1f4:	00f707b3          	add	a5,a4,a5
     1f8:	0007c703          	lbu	a4,0(a5)
     1fc:	fec42783          	lw	a5,-20(s0)
     200:	ff078793          	addi	a5,a5,-16
     204:	008787b3          	add	a5,a5,s0
     208:	fee78c23          	sb	a4,-8(a5)
     20c:	fec42783          	lw	a5,-20(s0)
     210:	00178793          	addi	a5,a5,1
     214:	fef42623          	sw	a5,-20(s0)
     218:	fec42703          	lw	a4,-20(s0)
     21c:	00300793          	li	a5,3
     220:	fce7d6e3          	bge	a5,a4,1ec <save_password_to_eeprom+0x1c>
     224:	fe840793          	addi	a5,s0,-24
     228:	00400613          	li	a2,4
     22c:	00078593          	mv	a1,a5
     230:	00000513          	li	a0,0
     234:	681010ef          	jal	20b4 <i2c_eeprom_write_bytes>
     238:	00050793          	mv	a5,a0
     23c:	00078663          	beqz	a5,248 <save_password_to_eeprom+0x78>
     240:	fff00793          	li	a5,-1
     244:	0080006f          	j	24c <save_password_to_eeprom+0x7c>
     248:	00000793          	li	a5,0
     24c:	00078513          	mv	a0,a5
     250:	02c12083          	lw	ra,44(sp)
     254:	02812403          	lw	s0,40(sp)
     258:	03010113          	addi	sp,sp,48
     25c:	00008067          	ret

00000260 <is_password_set>:
     260:	fe010113          	addi	sp,sp,-32
     264:	00112e23          	sw	ra,28(sp)
     268:	00812c23          	sw	s0,24(sp)
     26c:	02010413          	addi	s0,sp,32
     270:	fe840793          	addi	a5,s0,-24
     274:	00400613          	li	a2,4
     278:	00078593          	mv	a1,a5
     27c:	00000513          	li	a0,0
     280:	6e9010ef          	jal	2168 <i2c_eeprom_read_bytes>
     284:	00050793          	mv	a5,a0
     288:	00078663          	beqz	a5,294 <is_password_set+0x34>
     28c:	00000793          	li	a5,0
     290:	0480006f          	j	2d8 <is_password_set+0x78>
     294:	fe042623          	sw	zero,-20(s0)
     298:	0300006f          	j	2c8 <is_password_set+0x68>
     29c:	fec42783          	lw	a5,-20(s0)
     2a0:	ff078793          	addi	a5,a5,-16
     2a4:	008787b3          	add	a5,a5,s0
     2a8:	ff87c703          	lbu	a4,-8(a5)
     2ac:	0ff00793          	li	a5,255
     2b0:	00f70663          	beq	a4,a5,2bc <is_password_set+0x5c>
     2b4:	00100793          	li	a5,1
     2b8:	0200006f          	j	2d8 <is_password_set+0x78>
     2bc:	fec42783          	lw	a5,-20(s0)
     2c0:	00178793          	addi	a5,a5,1
     2c4:	fef42623          	sw	a5,-20(s0)
     2c8:	fec42703          	lw	a4,-20(s0)
     2cc:	00300793          	li	a5,3
     2d0:	fce7d6e3          	bge	a5,a4,29c <is_password_set+0x3c>
     2d4:	00000793          	li	a5,0
     2d8:	00078513          	mv	a0,a5
     2dc:	01c12083          	lw	ra,28(sp)
     2e0:	01812403          	lw	s0,24(sp)
     2e4:	02010113          	addi	sp,sp,32
     2e8:	00008067          	ret

000002ec <main>:
     2ec:	fb010113          	addi	sp,sp,-80
     2f0:	04112623          	sw	ra,76(sp)
     2f4:	04812423          	sw	s0,72(sp)
     2f8:	05010413          	addi	s0,sp,80
     2fc:	90020537          	lui	a0,0x90020
     300:	34c010ef          	jal	164c <uart_set_addr>
     304:	00100713          	li	a4,1
     308:	00000693          	li	a3,0
     30c:	00800613          	li	a2,8
     310:	0001c7b7          	lui	a5,0x1c
     314:	20078593          	addi	a1,a5,512 # 1c200 <_bss_end+0x84b0>
     318:	05f5e7b7          	lui	a5,0x5f5e
     31c:	10078513          	addi	a0,a5,256 # 5f5e100 <_memory_end+0x5f3e100>
     320:	4dd000ef          	jal	ffc <uart_init>
     324:	05300513          	li	a0,83
     328:	7f1000ef          	jal	1318 <uart_put_char>
     32c:	05400513          	li	a0,84
     330:	7e9000ef          	jal	1318 <uart_put_char>
     334:	04100513          	li	a0,65
     338:	7e1000ef          	jal	1318 <uart_put_char>
     33c:	05200513          	li	a0,82
     340:	7d9000ef          	jal	1318 <uart_put_char>
     344:	05400513          	li	a0,84
     348:	7d1000ef          	jal	1318 <uart_put_char>
     34c:	00d00513          	li	a0,13
     350:	7c9000ef          	jal	1318 <uart_put_char>
     354:	00a00513          	li	a0,10
     358:	7c1000ef          	jal	1318 <uart_put_char>
     35c:	00018513          	mv	a0,gp
     360:	670000ef          	jal	9d0 <my_printf>
     364:	fe042623          	sw	zero,-20(s0)
     368:	0680006f          	j	3d0 <main+0xe4>
     36c:	05400513          	li	a0,84
     370:	7a9000ef          	jal	1318 <uart_put_char>
     374:	04500513          	li	a0,69
     378:	7a1000ef          	jal	1318 <uart_put_char>
     37c:	05300513          	li	a0,83
     380:	799000ef          	jal	1318 <uart_put_char>
     384:	05400513          	li	a0,84
     388:	791000ef          	jal	1318 <uart_put_char>
     38c:	02000513          	li	a0,32
     390:	789000ef          	jal	1318 <uart_put_char>
     394:	fec42783          	lw	a5,-20(s0)
     398:	0ff7f793          	zext.b	a5,a5
     39c:	03078793          	addi	a5,a5,48
     3a0:	0ff7f793          	zext.b	a5,a5
     3a4:	00078513          	mv	a0,a5
     3a8:	771000ef          	jal	1318 <uart_put_char>
     3ac:	00d00513          	li	a0,13
     3b0:	769000ef          	jal	1318 <uart_put_char>
     3b4:	00a00513          	li	a0,10
     3b8:	761000ef          	jal	1318 <uart_put_char>
     3bc:	06400513          	li	a0,100
     3c0:	c95ff0ef          	jal	54 <delay_ms>
     3c4:	fec42783          	lw	a5,-20(s0)
     3c8:	00178793          	addi	a5,a5,1
     3cc:	fef42623          	sw	a5,-20(s0)
     3d0:	fec42703          	lw	a4,-20(s0)
     3d4:	00400793          	li	a5,4
     3d8:	f8e7dae3          	bge	a5,a4,36c <main+0x80>
     3dc:	90030537          	lui	a0,0x90030
     3e0:	6c8010ef          	jal	1aa8 <gpio_set_addr>
     3e4:	90030537          	lui	a0,0x90030
     3e8:	7a0010ef          	jal	1b88 <keypad_init>
     3ec:	00000693          	li	a3,0
     3f0:	00000613          	li	a2,0
     3f4:	00000593          	li	a1,0
     3f8:	000107b7          	lui	a5,0x10
     3fc:	fff78513          	addi	a0,a5,-1 # ffff <__multf3+0xd47>
     400:	36c010ef          	jal	176c <gpio_init>
     404:	00f00513          	li	a0,15
     408:	330010ef          	jal	1738 <gpio_write>
     40c:	cedff0ef          	jal	f8 <led_clear>
     410:	01c18513          	addi	a0,gp,28 # 127ec <__global_pointer$+0x1c>
     414:	5bc000ef          	jal	9d0 <my_printf>
     418:	06400513          	li	a0,100
     41c:	c39ff0ef          	jal	54 <delay_ms>
     420:	90040537          	lui	a0,0x90040
     424:	1bd010ef          	jal	1de0 <i2c_set_addr>
     428:	03018513          	addi	a0,gp,48 # 12800 <__global_pointer$+0x30>
     42c:	5a4000ef          	jal	9d0 <my_printf>
     430:	06400513          	li	a0,100
     434:	c21ff0ef          	jal	54 <delay_ms>
     438:	fc042423          	sw	zero,-56(s0)
     43c:	e25ff0ef          	jal	260 <is_password_set>
     440:	00050793          	mv	a5,a0
     444:	06078463          	beqz	a5,4ac <main+0x1c0>
     448:	fb840793          	addi	a5,s0,-72
     44c:	00078513          	mv	a0,a5
     450:	cf1ff0ef          	jal	140 <read_password_from_eeprom>
     454:	00050793          	mv	a5,a0
     458:	02079863          	bnez	a5,488 <main+0x19c>
     45c:	00100793          	li	a5,1
     460:	fcf42423          	sw	a5,-56(s0)
     464:	00200793          	li	a5,2
     468:	fef42423          	sw	a5,-24(s0)
     46c:	04418513          	addi	a0,gp,68 # 12814 <__global_pointer$+0x44>
     470:	560000ef          	jal	9d0 <my_printf>
     474:	05c18513          	addi	a0,gp,92 # 1282c <__global_pointer$+0x5c>
     478:	558000ef          	jal	9d0 <my_printf>
     47c:	08018513          	addi	a0,gp,128 # 12850 <__global_pointer$+0x80>
     480:	550000ef          	jal	9d0 <my_printf>
     484:	0480006f          	j	4cc <main+0x1e0>
     488:	fc042423          	sw	zero,-56(s0)
     48c:	fe042423          	sw	zero,-24(s0)
     490:	0a018513          	addi	a0,gp,160 # 12870 <__global_pointer$+0xa0>
     494:	53c000ef          	jal	9d0 <my_printf>
     498:	0b818513          	addi	a0,gp,184 # 12888 <__global_pointer$+0xb8>
     49c:	534000ef          	jal	9d0 <my_printf>
     4a0:	0e418513          	addi	a0,gp,228 # 128b4 <__global_pointer$+0xe4>
     4a4:	52c000ef          	jal	9d0 <my_printf>
     4a8:	0240006f          	j	4cc <main+0x1e0>
     4ac:	fc042423          	sw	zero,-56(s0)
     4b0:	fe042423          	sw	zero,-24(s0)
     4b4:	0a018513          	addi	a0,gp,160 # 12870 <__global_pointer$+0xa0>
     4b8:	518000ef          	jal	9d0 <my_printf>
     4bc:	0b818513          	addi	a0,gp,184 # 12888 <__global_pointer$+0xb8>
     4c0:	510000ef          	jal	9d0 <my_printf>
     4c4:	0e418513          	addi	a0,gp,228 # 128b4 <__global_pointer$+0xe4>
     4c8:	508000ef          	jal	9d0 <my_printf>
     4cc:	fe0403a3          	sb	zero,-25(s0)
     4d0:	fe040323          	sb	zero,-26(s0)
     4d4:	fe042023          	sw	zero,-32(s0)
     4d8:	fc042e23          	sw	zero,-36(s0)
     4dc:	fc040da3          	sb	zero,-37(s0)
     4e0:	00500793          	li	a5,5
     4e4:	fcf42223          	sw	a5,-60(s0)
     4e8:	00a00793          	li	a5,10
     4ec:	fcf42023          	sw	a5,-64(s0)
     4f0:	011010ef          	jal	1d00 <keypad_get_char>
     4f4:	00050793          	mv	a5,a0
     4f8:	faf40fa3          	sb	a5,-65(s0)
     4fc:	fbf44783          	lbu	a5,-65(s0)
     500:	38078263          	beqz	a5,884 <main+0x598>
     504:	fbf44703          	lbu	a4,-65(s0)
     508:	fe644783          	lbu	a5,-26(s0)
     50c:	34f71e63          	bne	a4,a5,868 <main+0x57c>
     510:	fe042783          	lw	a5,-32(s0)
     514:	00178793          	addi	a5,a5,1
     518:	fef42023          	sw	a5,-32(s0)
     51c:	fc042e23          	sw	zero,-36(s0)
     520:	fe042703          	lw	a4,-32(s0)
     524:	fc442783          	lw	a5,-60(s0)
     528:	38f76663          	bltu	a4,a5,8b4 <main+0x5c8>
     52c:	fdb44783          	lbu	a5,-37(s0)
     530:	38079263          	bnez	a5,8b4 <main+0x5c8>
     534:	00100793          	li	a5,1
     538:	fcf40da3          	sb	a5,-37(s0)
     53c:	fbf44703          	lbu	a4,-65(s0)
     540:	04100793          	li	a5,65
     544:	04f71063          	bne	a4,a5,584 <main+0x298>
     548:	fe842783          	lw	a5,-24(s0)
     54c:	00078863          	beqz	a5,55c <main+0x270>
     550:	fe842703          	lw	a4,-24(s0)
     554:	00200793          	li	a5,2
     558:	34f71e63          	bne	a4,a5,8b4 <main+0x5c8>
     55c:	00100793          	li	a5,1
     560:	fef42423          	sw	a5,-24(s0)
     564:	fe0403a3          	sb	zero,-25(s0)
     568:	12018513          	addi	a0,gp,288 # 128f0 <__global_pointer$+0x120>
     56c:	464000ef          	jal	9d0 <my_printf>
     570:	14018513          	addi	a0,gp,320 # 12910 <__global_pointer$+0x140>
     574:	45c000ef          	jal	9d0 <my_printf>
     578:	16818513          	addi	a0,gp,360 # 12938 <__global_pointer$+0x168>
     57c:	454000ef          	jal	9d0 <my_printf>
     580:	3340006f          	j	8b4 <main+0x5c8>
     584:	fbf44703          	lbu	a4,-65(s0)
     588:	04200793          	li	a5,66
     58c:	02f71c63          	bne	a4,a5,5c4 <main+0x2d8>
     590:	fe842703          	lw	a4,-24(s0)
     594:	00100793          	li	a5,1
     598:	30f71e63          	bne	a4,a5,8b4 <main+0x5c8>
     59c:	00200793          	li	a5,2
     5a0:	fef42423          	sw	a5,-24(s0)
     5a4:	fe0403a3          	sb	zero,-25(s0)
     5a8:	04418513          	addi	a0,gp,68 # 12814 <__global_pointer$+0x44>
     5ac:	424000ef          	jal	9d0 <my_printf>
     5b0:	05c18513          	addi	a0,gp,92 # 1282c <__global_pointer$+0x5c>
     5b4:	41c000ef          	jal	9d0 <my_printf>
     5b8:	08018513          	addi	a0,gp,128 # 12850 <__global_pointer$+0x80>
     5bc:	414000ef          	jal	9d0 <my_printf>
     5c0:	2f40006f          	j	8b4 <main+0x5c8>
     5c4:	fbf44703          	lbu	a4,-65(s0)
     5c8:	04400793          	li	a5,68
     5cc:	22f71a63          	bne	a4,a5,800 <main+0x514>
     5d0:	fe842703          	lw	a4,-24(s0)
     5d4:	00100793          	li	a5,1
     5d8:	0ef71663          	bne	a4,a5,6c4 <main+0x3d8>
     5dc:	fe744703          	lbu	a4,-25(s0)
     5e0:	00400793          	li	a5,4
     5e4:	0af71a63          	bne	a4,a5,698 <main+0x3ac>
     5e8:	fb440793          	addi	a5,s0,-76
     5ec:	00078513          	mv	a0,a5
     5f0:	be1ff0ef          	jal	1d0 <save_password_to_eeprom>
     5f4:	00050793          	mv	a5,a0
     5f8:	06079a63          	bnez	a5,66c <main+0x380>
     5fc:	fc042a23          	sw	zero,-44(s0)
     600:	0300006f          	j	630 <main+0x344>
     604:	fd442783          	lw	a5,-44(s0)
     608:	ff078793          	addi	a5,a5,-16
     60c:	008787b3          	add	a5,a5,s0
     610:	fc47c703          	lbu	a4,-60(a5)
     614:	fd442783          	lw	a5,-44(s0)
     618:	ff078793          	addi	a5,a5,-16
     61c:	008787b3          	add	a5,a5,s0
     620:	fce78423          	sb	a4,-56(a5)
     624:	fd442783          	lw	a5,-44(s0)
     628:	00178793          	addi	a5,a5,1
     62c:	fcf42a23          	sw	a5,-44(s0)
     630:	fd442703          	lw	a4,-44(s0)
     634:	00300793          	li	a5,3
     638:	fce7d6e3          	bge	a5,a4,604 <main+0x318>
     63c:	17c18513          	addi	a0,gp,380 # 1294c <__global_pointer$+0x17c>
     640:	390000ef          	jal	9d0 <my_printf>
     644:	00200793          	li	a5,2
     648:	fef42423          	sw	a5,-24(s0)
     64c:	fe0403a3          	sb	zero,-25(s0)
     650:	1a018513          	addi	a0,gp,416 # 12970 <__global_pointer$+0x1a0>
     654:	37c000ef          	jal	9d0 <my_printf>
     658:	05c18513          	addi	a0,gp,92 # 1282c <__global_pointer$+0x5c>
     65c:	374000ef          	jal	9d0 <my_printf>
     660:	08018513          	addi	a0,gp,128 # 12850 <__global_pointer$+0x80>
     664:	36c000ef          	jal	9d0 <my_printf>
     668:	24c0006f          	j	8b4 <main+0x5c8>
     66c:	1b418513          	addi	a0,gp,436 # 12984 <__global_pointer$+0x1b4>
     670:	360000ef          	jal	9d0 <my_printf>
     674:	fe042423          	sw	zero,-24(s0)
     678:	fe0403a3          	sb	zero,-25(s0)
     67c:	1d818513          	addi	a0,gp,472 # 129a8 <__global_pointer$+0x1d8>
     680:	350000ef          	jal	9d0 <my_printf>
     684:	0b818513          	addi	a0,gp,184 # 12888 <__global_pointer$+0xb8>
     688:	348000ef          	jal	9d0 <my_printf>
     68c:	0e418513          	addi	a0,gp,228 # 128b4 <__global_pointer$+0xe4>
     690:	340000ef          	jal	9d0 <my_printf>
     694:	2200006f          	j	8b4 <main+0x5c8>
     698:	1ec18513          	addi	a0,gp,492 # 129bc <__global_pointer$+0x1ec>
     69c:	334000ef          	jal	9d0 <my_printf>
     6a0:	fe0403a3          	sb	zero,-25(s0)
     6a4:	fe042423          	sw	zero,-24(s0)
     6a8:	1d818513          	addi	a0,gp,472 # 129a8 <__global_pointer$+0x1d8>
     6ac:	324000ef          	jal	9d0 <my_printf>
     6b0:	0b818513          	addi	a0,gp,184 # 12888 <__global_pointer$+0xb8>
     6b4:	31c000ef          	jal	9d0 <my_printf>
     6b8:	0e418513          	addi	a0,gp,228 # 128b4 <__global_pointer$+0xe4>
     6bc:	314000ef          	jal	9d0 <my_printf>
     6c0:	1f40006f          	j	8b4 <main+0x5c8>
     6c4:	fe842703          	lw	a4,-24(s0)
     6c8:	00200793          	li	a5,2
     6cc:	1ef71463          	bne	a4,a5,8b4 <main+0x5c8>
     6d0:	fe744703          	lbu	a4,-25(s0)
     6d4:	00400793          	li	a5,4
     6d8:	0ef71663          	bne	a4,a5,7c4 <main+0x4d8>
     6dc:	00100793          	li	a5,1
     6e0:	fcf42823          	sw	a5,-48(s0)
     6e4:	fc042623          	sw	zero,-52(s0)
     6e8:	03c0006f          	j	724 <main+0x438>
     6ec:	fcc42783          	lw	a5,-52(s0)
     6f0:	ff078793          	addi	a5,a5,-16
     6f4:	008787b3          	add	a5,a5,s0
     6f8:	fc47c703          	lbu	a4,-60(a5)
     6fc:	fcc42783          	lw	a5,-52(s0)
     700:	ff078793          	addi	a5,a5,-16
     704:	008787b3          	add	a5,a5,s0
     708:	fc87c783          	lbu	a5,-56(a5)
     70c:	00f70663          	beq	a4,a5,718 <main+0x42c>
     710:	fc042823          	sw	zero,-48(s0)
     714:	01c0006f          	j	730 <main+0x444>
     718:	fcc42783          	lw	a5,-52(s0)
     71c:	00178793          	addi	a5,a5,1
     720:	fcf42623          	sw	a5,-52(s0)
     724:	fcc42703          	lw	a4,-52(s0)
     728:	00300793          	li	a5,3
     72c:	fce7d0e3          	bge	a5,a4,6ec <main+0x400>
     730:	fd042783          	lw	a5,-48(s0)
     734:	04078a63          	beqz	a5,788 <main+0x49c>
     738:	00300793          	li	a5,3
     73c:	fef42423          	sw	a5,-24(s0)
     740:	00100513          	li	a0,1
     744:	95dff0ef          	jal	a0 <led_set>
     748:	20c18513          	addi	a0,gp,524 # 129dc <__global_pointer$+0x20c>
     74c:	284000ef          	jal	9d0 <my_printf>
     750:	000017b7          	lui	a5,0x1
     754:	bb878513          	addi	a0,a5,-1096 # bb8 <my_printflt+0x84>
     758:	8fdff0ef          	jal	54 <delay_ms>
     75c:	99dff0ef          	jal	f8 <led_clear>
     760:	00200793          	li	a5,2
     764:	fef42423          	sw	a5,-24(s0)
     768:	fe0403a3          	sb	zero,-25(s0)
     76c:	1a018513          	addi	a0,gp,416 # 12970 <__global_pointer$+0x1a0>
     770:	260000ef          	jal	9d0 <my_printf>
     774:	05c18513          	addi	a0,gp,92 # 1282c <__global_pointer$+0x5c>
     778:	258000ef          	jal	9d0 <my_printf>
     77c:	08018513          	addi	a0,gp,128 # 12850 <__global_pointer$+0x80>
     780:	250000ef          	jal	9d0 <my_printf>
     784:	1300006f          	j	8b4 <main+0x5c8>
     788:	00200513          	li	a0,2
     78c:	915ff0ef          	jal	a0 <led_set>
     790:	22418513          	addi	a0,gp,548 # 129f4 <__global_pointer$+0x224>
     794:	23c000ef          	jal	9d0 <my_printf>
     798:	3e800513          	li	a0,1000
     79c:	8b9ff0ef          	jal	54 <delay_ms>
     7a0:	959ff0ef          	jal	f8 <led_clear>
     7a4:	fe0403a3          	sb	zero,-25(s0)
     7a8:	1a018513          	addi	a0,gp,416 # 12970 <__global_pointer$+0x1a0>
     7ac:	224000ef          	jal	9d0 <my_printf>
     7b0:	05c18513          	addi	a0,gp,92 # 1282c <__global_pointer$+0x5c>
     7b4:	21c000ef          	jal	9d0 <my_printf>
     7b8:	08018513          	addi	a0,gp,128 # 12850 <__global_pointer$+0x80>
     7bc:	214000ef          	jal	9d0 <my_printf>
     7c0:	0f40006f          	j	8b4 <main+0x5c8>
     7c4:	00200513          	li	a0,2
     7c8:	8d9ff0ef          	jal	a0 <led_set>
     7cc:	22418513          	addi	a0,gp,548 # 129f4 <__global_pointer$+0x224>
     7d0:	200000ef          	jal	9d0 <my_printf>
     7d4:	3e800513          	li	a0,1000
     7d8:	87dff0ef          	jal	54 <delay_ms>
     7dc:	91dff0ef          	jal	f8 <led_clear>
     7e0:	fe0403a3          	sb	zero,-25(s0)
     7e4:	1a018513          	addi	a0,gp,416 # 12970 <__global_pointer$+0x1a0>
     7e8:	1e8000ef          	jal	9d0 <my_printf>
     7ec:	05c18513          	addi	a0,gp,92 # 1282c <__global_pointer$+0x5c>
     7f0:	1e0000ef          	jal	9d0 <my_printf>
     7f4:	08018513          	addi	a0,gp,128 # 12850 <__global_pointer$+0x80>
     7f8:	1d8000ef          	jal	9d0 <my_printf>
     7fc:	0b80006f          	j	8b4 <main+0x5c8>
     800:	fbf44703          	lbu	a4,-65(s0)
     804:	02f00793          	li	a5,47
     808:	0ae7f663          	bgeu	a5,a4,8b4 <main+0x5c8>
     80c:	fbf44703          	lbu	a4,-65(s0)
     810:	03900793          	li	a5,57
     814:	0ae7e063          	bltu	a5,a4,8b4 <main+0x5c8>
     818:	fe842703          	lw	a4,-24(s0)
     81c:	00100793          	li	a5,1
     820:	00f70863          	beq	a4,a5,830 <main+0x544>
     824:	fe842703          	lw	a4,-24(s0)
     828:	00200793          	li	a5,2
     82c:	08f71463          	bne	a4,a5,8b4 <main+0x5c8>
     830:	fe744703          	lbu	a4,-25(s0)
     834:	00300793          	li	a5,3
     838:	06e7ee63          	bltu	a5,a4,8b4 <main+0x5c8>
     83c:	fe744783          	lbu	a5,-25(s0)
     840:	ff078793          	addi	a5,a5,-16
     844:	008787b3          	add	a5,a5,s0
     848:	fbf44703          	lbu	a4,-65(s0)
     84c:	fce78223          	sb	a4,-60(a5)
     850:	fe744783          	lbu	a5,-25(s0)
     854:	00178793          	addi	a5,a5,1
     858:	fef403a3          	sb	a5,-25(s0)
     85c:	02a00513          	li	a0,42
     860:	2b9000ef          	jal	1318 <uart_put_char>
     864:	0500006f          	j	8b4 <main+0x5c8>
     868:	fbf44783          	lbu	a5,-65(s0)
     86c:	fef40323          	sb	a5,-26(s0)
     870:	00100793          	li	a5,1
     874:	fef42023          	sw	a5,-32(s0)
     878:	fc042e23          	sw	zero,-36(s0)
     87c:	fc040da3          	sb	zero,-37(s0)
     880:	0340006f          	j	8b4 <main+0x5c8>
     884:	fe644783          	lbu	a5,-26(s0)
     888:	02078663          	beqz	a5,8b4 <main+0x5c8>
     88c:	fdc42783          	lw	a5,-36(s0)
     890:	00178793          	addi	a5,a5,1
     894:	fcf42e23          	sw	a5,-36(s0)
     898:	fdc42703          	lw	a4,-36(s0)
     89c:	fc042783          	lw	a5,-64(s0)
     8a0:	00f76a63          	bltu	a4,a5,8b4 <main+0x5c8>
     8a4:	fe040323          	sb	zero,-26(s0)
     8a8:	fe042023          	sw	zero,-32(s0)
     8ac:	fc042e23          	sw	zero,-36(s0)
     8b0:	fc040da3          	sb	zero,-37(s0)
     8b4:	00100513          	li	a0,1
     8b8:	f9cff0ef          	jal	54 <delay_ms>
     8bc:	c35ff06f          	j	4f0 <main+0x204>

000008c0 <my_putc>:
     8c0:	fe010113          	addi	sp,sp,-32
     8c4:	00112e23          	sw	ra,28(sp)
     8c8:	00812c23          	sw	s0,24(sp)
     8cc:	02010413          	addi	s0,sp,32
     8d0:	fea42623          	sw	a0,-20(s0)
     8d4:	feb42423          	sw	a1,-24(s0)
     8d8:	fec42783          	lw	a5,-20(s0)
     8dc:	0ff7f793          	zext.b	a5,a5
     8e0:	00078513          	mv	a0,a5
     8e4:	235000ef          	jal	1318 <uart_put_char>
     8e8:	00050793          	mv	a5,a0
     8ec:	00078513          	mv	a0,a5
     8f0:	01c12083          	lw	ra,28(sp)
     8f4:	01812403          	lw	s0,24(sp)
     8f8:	02010113          	addi	sp,sp,32
     8fc:	00008067          	ret

00000900 <my_putchar>:
     900:	fe010113          	addi	sp,sp,-32
     904:	00112e23          	sw	ra,28(sp)
     908:	00812c23          	sw	s0,24(sp)
     90c:	02010413          	addi	s0,sp,32
     910:	fea42623          	sw	a0,-20(s0)
     914:	fec42783          	lw	a5,-20(s0)
     918:	0ff7f793          	zext.b	a5,a5
     91c:	00078513          	mv	a0,a5
     920:	1f9000ef          	jal	1318 <uart_put_char>
     924:	00050793          	mv	a5,a0
     928:	00078513          	mv	a0,a5
     92c:	01c12083          	lw	ra,28(sp)
     930:	01812403          	lw	s0,24(sp)
     934:	02010113          	addi	sp,sp,32
     938:	00008067          	ret

0000093c <my_getc>:
     93c:	fe010113          	addi	sp,sp,-32
     940:	00112e23          	sw	ra,28(sp)
     944:	00812c23          	sw	s0,24(sp)
     948:	02010413          	addi	s0,sp,32
     94c:	fea42623          	sw	a0,-20(s0)
     950:	185000ef          	jal	12d4 <uart_get_char>
     954:	00050793          	mv	a5,a0
     958:	00078513          	mv	a0,a5
     95c:	01c12083          	lw	ra,28(sp)
     960:	01812403          	lw	s0,24(sp)
     964:	02010113          	addi	sp,sp,32
     968:	00008067          	ret

0000096c <my_getchar>:
     96c:	ff010113          	addi	sp,sp,-16
     970:	00112623          	sw	ra,12(sp)
     974:	00812423          	sw	s0,8(sp)
     978:	01010413          	addi	s0,sp,16
     97c:	159000ef          	jal	12d4 <uart_get_char>
     980:	00050793          	mv	a5,a0
     984:	00078513          	mv	a0,a5
     988:	00c12083          	lw	ra,12(sp)
     98c:	00812403          	lw	s0,8(sp)
     990:	01010113          	addi	sp,sp,16
     994:	00008067          	ret

00000998 <my_puts>:
     998:	fd010113          	addi	sp,sp,-48
     99c:	02112623          	sw	ra,44(sp)
     9a0:	02812423          	sw	s0,40(sp)
     9a4:	03010413          	addi	s0,sp,48
     9a8:	fca42e23          	sw	a0,-36(s0)
     9ac:	fdc42503          	lw	a0,-36(s0)
     9b0:	1d1000ef          	jal	1380 <uart_put_string>
     9b4:	fea42623          	sw	a0,-20(s0)
     9b8:	fec42783          	lw	a5,-20(s0)
     9bc:	00078513          	mv	a0,a5
     9c0:	02c12083          	lw	ra,44(sp)
     9c4:	02812403          	lw	s0,40(sp)
     9c8:	03010113          	addi	sp,sp,48
     9cc:	00008067          	ret

000009d0 <my_printf>:
     9d0:	fb010113          	addi	sp,sp,-80
     9d4:	02112623          	sw	ra,44(sp)
     9d8:	02812423          	sw	s0,40(sp)
     9dc:	03010413          	addi	s0,sp,48
     9e0:	fca42e23          	sw	a0,-36(s0)
     9e4:	00b42223          	sw	a1,4(s0)
     9e8:	00c42423          	sw	a2,8(s0)
     9ec:	00d42623          	sw	a3,12(s0)
     9f0:	00e42823          	sw	a4,16(s0)
     9f4:	00f42a23          	sw	a5,20(s0)
     9f8:	01042c23          	sw	a6,24(s0)
     9fc:	01142e23          	sw	a7,28(s0)
     a00:	02040793          	addi	a5,s0,32
     a04:	fcf42c23          	sw	a5,-40(s0)
     a08:	fd842783          	lw	a5,-40(s0)
     a0c:	fe478793          	addi	a5,a5,-28
     a10:	fef42423          	sw	a5,-24(s0)
     a14:	fe842783          	lw	a5,-24(s0)
     a18:	00078593          	mv	a1,a5
     a1c:	fdc42503          	lw	a0,-36(s0)
     a20:	28c000ef          	jal	cac <my_vprintf>
     a24:	fea42623          	sw	a0,-20(s0)
     a28:	fec42783          	lw	a5,-20(s0)
     a2c:	00078513          	mv	a0,a5
     a30:	02c12083          	lw	ra,44(sp)
     a34:	02812403          	lw	s0,40(sp)
     a38:	05010113          	addi	sp,sp,80
     a3c:	00008067          	ret

00000a40 <my_printn>:
     a40:	fd010113          	addi	sp,sp,-48
     a44:	02112623          	sw	ra,44(sp)
     a48:	02812423          	sw	s0,40(sp)
     a4c:	03010413          	addi	s0,sp,48
     a50:	fca42e23          	sw	a0,-36(s0)
     a54:	fcb42c23          	sw	a1,-40(s0)
     a58:	fcc42a23          	sw	a2,-44(s0)
     a5c:	fe042623          	sw	zero,-20(s0)
     a60:	fd842703          	lw	a4,-40(s0)
     a64:	00a00793          	li	a5,10
     a68:	02f71863          	bne	a4,a5,a98 <my_printn+0x58>
     a6c:	fdc42783          	lw	a5,-36(s0)
     a70:	0207d463          	bgez	a5,a98 <my_printn+0x58>
     a74:	02d00513          	li	a0,45
     a78:	0a1000ef          	jal	1318 <uart_put_char>
     a7c:	00050713          	mv	a4,a0
     a80:	fec42783          	lw	a5,-20(s0)
     a84:	00f707b3          	add	a5,a4,a5
     a88:	fef42623          	sw	a5,-20(s0)
     a8c:	fdc42783          	lw	a5,-36(s0)
     a90:	40f007b3          	neg	a5,a5
     a94:	fcf42e23          	sw	a5,-36(s0)
     a98:	fd842783          	lw	a5,-40(s0)
     a9c:	fdc42703          	lw	a4,-36(s0)
     aa0:	02f757b3          	divu	a5,a4,a5
     aa4:	fef42423          	sw	a5,-24(s0)
     aa8:	fe842783          	lw	a5,-24(s0)
     aac:	00079863          	bnez	a5,abc <my_printn+0x7c>
     ab0:	fd442703          	lw	a4,-44(s0)
     ab4:	00100793          	li	a5,1
     ab8:	02e7d863          	bge	a5,a4,ae8 <my_printn+0xa8>
     abc:	fd442783          	lw	a5,-44(s0)
     ac0:	fff78793          	addi	a5,a5,-1
     ac4:	fcf42a23          	sw	a5,-44(s0)
     ac8:	fd442603          	lw	a2,-44(s0)
     acc:	fd842583          	lw	a1,-40(s0)
     ad0:	fe842503          	lw	a0,-24(s0)
     ad4:	f6dff0ef          	jal	a40 <my_printn>
     ad8:	00050713          	mv	a4,a0
     adc:	fec42783          	lw	a5,-20(s0)
     ae0:	00e787b3          	add	a5,a5,a4
     ae4:	fef42623          	sw	a5,-20(s0)
     ae8:	fd842783          	lw	a5,-40(s0)
     aec:	fdc42703          	lw	a4,-36(s0)
     af0:	02f777b3          	remu	a5,a4,a5
     af4:	00078713          	mv	a4,a5
     af8:	23c18793          	addi	a5,gp,572 # 12a0c <__global_pointer$+0x23c>
     afc:	00e787b3          	add	a5,a5,a4
     b00:	0007c783          	lbu	a5,0(a5)
     b04:	00078513          	mv	a0,a5
     b08:	011000ef          	jal	1318 <uart_put_char>
     b0c:	00050713          	mv	a4,a0
     b10:	fec42783          	lw	a5,-20(s0)
     b14:	00f707b3          	add	a5,a4,a5
     b18:	fef42623          	sw	a5,-20(s0)
     b1c:	fec42783          	lw	a5,-20(s0)
     b20:	00078513          	mv	a0,a5
     b24:	02c12083          	lw	ra,44(sp)
     b28:	02812403          	lw	s0,40(sp)
     b2c:	03010113          	addi	sp,sp,48
     b30:	00008067          	ret

00000b34 <my_printflt>:
     b34:	fd010113          	addi	sp,sp,-48
     b38:	02112623          	sw	ra,44(sp)
     b3c:	02812423          	sw	s0,40(sp)
     b40:	03010413          	addi	s0,sp,48
     b44:	fca42e23          	sw	a0,-36(s0)
     b48:	fcb42c23          	sw	a1,-40(s0)
     b4c:	fe042423          	sw	zero,-24(s0)
     b50:	00000593          	li	a1,0
     b54:	fdc42503          	lw	a0,-36(s0)
     b58:	735100ef          	jal	11a8c <__lesf2>
     b5c:	00050793          	mv	a5,a0
     b60:	0207d663          	bgez	a5,b8c <my_printflt+0x58>
     b64:	02d00513          	li	a0,45
     b68:	7b0000ef          	jal	1318 <uart_put_char>
     b6c:	00050713          	mv	a4,a0
     b70:	fe842783          	lw	a5,-24(s0)
     b74:	00f707b3          	add	a5,a4,a5
     b78:	fef42423          	sw	a5,-24(s0)
     b7c:	fdc42703          	lw	a4,-36(s0)
     b80:	800007b7          	lui	a5,0x80000
     b84:	00f747b3          	xor	a5,a4,a5
     b88:	fcf42e23          	sw	a5,-36(s0)
     b8c:	fdc42503          	lw	a0,-36(s0)
     b90:	6f4110ef          	jal	12284 <__fixsfsi>
     b94:	00050793          	mv	a5,a0
     b98:	fef42223          	sw	a5,-28(s0)
     b9c:	fe442783          	lw	a5,-28(s0)
     ba0:	fd842603          	lw	a2,-40(s0)
     ba4:	00a00593          	li	a1,10
     ba8:	00078513          	mv	a0,a5
     bac:	e95ff0ef          	jal	a40 <my_printn>
     bb0:	00050713          	mv	a4,a0
     bb4:	fe842783          	lw	a5,-24(s0)
     bb8:	00e787b3          	add	a5,a5,a4
     bbc:	fef42423          	sw	a5,-24(s0)
     bc0:	02e00513          	li	a0,46
     bc4:	754000ef          	jal	1318 <uart_put_char>
     bc8:	00050713          	mv	a4,a0
     bcc:	fe842783          	lw	a5,-24(s0)
     bd0:	00f707b3          	add	a5,a4,a5
     bd4:	fef42423          	sw	a5,-24(s0)
     bd8:	fe442503          	lw	a0,-28(s0)
     bdc:	718110ef          	jal	122f4 <__floatsisf>
     be0:	00050793          	mv	a5,a0
     be4:	00078593          	mv	a1,a5
     be8:	fdc42503          	lw	a0,-36(s0)
     bec:	268110ef          	jal	11e54 <__subsf3>
     bf0:	00050793          	mv	a5,a0
     bf4:	fcf42e23          	sw	a5,-36(s0)
     bf8:	fe042623          	sw	zero,-20(s0)
     bfc:	2a81a583          	lw	a1,680(gp) # 12a78 <__global_pointer$+0x2a8>
     c00:	fdc42503          	lw	a0,-36(s0)
     c04:	735100ef          	jal	11b38 <__mulsf3>
     c08:	00050793          	mv	a5,a0
     c0c:	fcf42e23          	sw	a5,-36(s0)
     c10:	fdc42503          	lw	a0,-36(s0)
     c14:	670110ef          	jal	12284 <__fixsfsi>
     c18:	00050793          	mv	a5,a0
     c1c:	fef42223          	sw	a5,-28(s0)
     c20:	fe442783          	lw	a5,-28(s0)
     c24:	0ff7f793          	zext.b	a5,a5
     c28:	03078793          	addi	a5,a5,48 # 80000030 <_memory_end+0x7ffe0030>
     c2c:	0ff7f793          	zext.b	a5,a5
     c30:	00078513          	mv	a0,a5
     c34:	6e4000ef          	jal	1318 <uart_put_char>
     c38:	00050713          	mv	a4,a0
     c3c:	fe842783          	lw	a5,-24(s0)
     c40:	00f707b3          	add	a5,a4,a5
     c44:	fef42423          	sw	a5,-24(s0)
     c48:	fe442503          	lw	a0,-28(s0)
     c4c:	6a8110ef          	jal	122f4 <__floatsisf>
     c50:	00050793          	mv	a5,a0
     c54:	00078593          	mv	a1,a5
     c58:	fdc42503          	lw	a0,-36(s0)
     c5c:	1f8110ef          	jal	11e54 <__subsf3>
     c60:	00050793          	mv	a5,a0
     c64:	fcf42e23          	sw	a5,-36(s0)
     c68:	fec42783          	lw	a5,-20(s0)
     c6c:	00178793          	addi	a5,a5,1
     c70:	fef42623          	sw	a5,-20(s0)
     c74:	00000593          	li	a1,0
     c78:	fdc42503          	lw	a0,-36(s0)
     c7c:	5a9100ef          	jal	11a24 <__eqsf2>
     c80:	00050793          	mv	a5,a0
     c84:	00078863          	beqz	a5,c94 <my_printflt+0x160>
     c88:	fec42703          	lw	a4,-20(s0)
     c8c:	00500793          	li	a5,5
     c90:	f6e7d6e3          	bge	a5,a4,bfc <my_printflt+0xc8>
     c94:	fe842783          	lw	a5,-24(s0)
     c98:	00078513          	mv	a0,a5
     c9c:	02c12083          	lw	ra,44(sp)
     ca0:	02812403          	lw	s0,40(sp)
     ca4:	03010113          	addi	sp,sp,48
     ca8:	00008067          	ret

00000cac <my_vprintf>:
     cac:	fc010113          	addi	sp,sp,-64
     cb0:	02112e23          	sw	ra,60(sp)
     cb4:	02812c23          	sw	s0,56(sp)
     cb8:	04010413          	addi	s0,sp,64
     cbc:	fca42623          	sw	a0,-52(s0)
     cc0:	fcb42423          	sw	a1,-56(s0)
     cc4:	fe042023          	sw	zero,-32(s0)
     cc8:	3000006f          	j	fc8 <my_vprintf+0x31c>
     ccc:	fe842703          	lw	a4,-24(s0)
     cd0:	02500793          	li	a5,37
     cd4:	2cf71063          	bne	a4,a5,f94 <my_vprintf+0x2e8>
     cd8:	fcc42783          	lw	a5,-52(s0)
     cdc:	0007c783          	lbu	a5,0(a5)
     ce0:	fef42423          	sw	a5,-24(s0)
     ce4:	fe042623          	sw	zero,-20(s0)
     ce8:	0440006f          	j	d2c <my_vprintf+0x80>
     cec:	fec42703          	lw	a4,-20(s0)
     cf0:	00070793          	mv	a5,a4
     cf4:	00279793          	slli	a5,a5,0x2
     cf8:	00e787b3          	add	a5,a5,a4
     cfc:	00179793          	slli	a5,a5,0x1
     d00:	00078713          	mv	a4,a5
     d04:	fe842783          	lw	a5,-24(s0)
     d08:	00f707b3          	add	a5,a4,a5
     d0c:	fd078793          	addi	a5,a5,-48
     d10:	fef42623          	sw	a5,-20(s0)
     d14:	fcc42783          	lw	a5,-52(s0)
     d18:	00178793          	addi	a5,a5,1
     d1c:	fcf42623          	sw	a5,-52(s0)
     d20:	fcc42783          	lw	a5,-52(s0)
     d24:	0007c783          	lbu	a5,0(a5)
     d28:	fef42423          	sw	a5,-24(s0)
     d2c:	fe842703          	lw	a4,-24(s0)
     d30:	02f00793          	li	a5,47
     d34:	00e7d863          	bge	a5,a4,d44 <my_vprintf+0x98>
     d38:	fe842703          	lw	a4,-24(s0)
     d3c:	03900793          	li	a5,57
     d40:	fae7d6e3          	bge	a5,a4,cec <my_vprintf+0x40>
     d44:	fcc42783          	lw	a5,-52(s0)
     d48:	00178713          	addi	a4,a5,1
     d4c:	fce42623          	sw	a4,-52(s0)
     d50:	0007c783          	lbu	a5,0(a5)
     d54:	fef42423          	sw	a5,-24(s0)
     d58:	fe842703          	lw	a4,-24(s0)
     d5c:	02500793          	li	a5,37
     d60:	1ef70863          	beq	a4,a5,f50 <my_vprintf+0x2a4>
     d64:	fe842703          	lw	a4,-24(s0)
     d68:	02500793          	li	a5,37
     d6c:	20f74063          	blt	a4,a5,f6c <my_vprintf+0x2c0>
     d70:	fe842703          	lw	a4,-24(s0)
     d74:	07800793          	li	a5,120
     d78:	1ee7ca63          	blt	a5,a4,f6c <my_vprintf+0x2c0>
     d7c:	fe842703          	lw	a4,-24(s0)
     d80:	06300793          	li	a5,99
     d84:	1ef74463          	blt	a4,a5,f6c <my_vprintf+0x2c0>
     d88:	fe842783          	lw	a5,-24(s0)
     d8c:	f9d78793          	addi	a5,a5,-99
     d90:	01500713          	li	a4,21
     d94:	1cf76c63          	bltu	a4,a5,f6c <my_vprintf+0x2c0>
     d98:	00279713          	slli	a4,a5,0x2
     d9c:	25018793          	addi	a5,gp,592 # 12a20 <__global_pointer$+0x250>
     da0:	00f707b3          	add	a5,a4,a5
     da4:	0007a783          	lw	a5,0(a5)
     da8:	00078067          	jr	a5
     dac:	fc842783          	lw	a5,-56(s0)
     db0:	00478713          	addi	a4,a5,4
     db4:	fce42423          	sw	a4,-56(s0)
     db8:	0007a783          	lw	a5,0(a5)
     dbc:	fcf40ba3          	sb	a5,-41(s0)
     dc0:	fd744783          	lbu	a5,-41(s0)
     dc4:	00078513          	mv	a0,a5
     dc8:	550000ef          	jal	1318 <uart_put_char>
     dcc:	00050713          	mv	a4,a0
     dd0:	fe042783          	lw	a5,-32(s0)
     dd4:	00f707b3          	add	a5,a4,a5
     dd8:	fef42023          	sw	a5,-32(s0)
     ddc:	1ec0006f          	j	fc8 <my_vprintf+0x31c>
     de0:	fc842783          	lw	a5,-56(s0)
     de4:	00478713          	addi	a4,a5,4
     de8:	fce42423          	sw	a4,-56(s0)
     dec:	0007a783          	lw	a5,0(a5)
     df0:	fcf42e23          	sw	a5,-36(s0)
     df4:	fdc42783          	lw	a5,-36(s0)
     df8:	fec42603          	lw	a2,-20(s0)
     dfc:	00800593          	li	a1,8
     e00:	00078513          	mv	a0,a5
     e04:	c3dff0ef          	jal	a40 <my_printn>
     e08:	00050713          	mv	a4,a0
     e0c:	fe042783          	lw	a5,-32(s0)
     e10:	00e787b3          	add	a5,a5,a4
     e14:	fef42023          	sw	a5,-32(s0)
     e18:	1b00006f          	j	fc8 <my_vprintf+0x31c>
     e1c:	fc842783          	lw	a5,-56(s0)
     e20:	00478713          	addi	a4,a5,4
     e24:	fce42423          	sw	a4,-56(s0)
     e28:	0007a783          	lw	a5,0(a5)
     e2c:	fcf42e23          	sw	a5,-36(s0)
     e30:	fdc42783          	lw	a5,-36(s0)
     e34:	fec42603          	lw	a2,-20(s0)
     e38:	00a00593          	li	a1,10
     e3c:	00078513          	mv	a0,a5
     e40:	c01ff0ef          	jal	a40 <my_printn>
     e44:	00050713          	mv	a4,a0
     e48:	fe042783          	lw	a5,-32(s0)
     e4c:	00e787b3          	add	a5,a5,a4
     e50:	fef42023          	sw	a5,-32(s0)
     e54:	1740006f          	j	fc8 <my_vprintf+0x31c>
     e58:	fc842783          	lw	a5,-56(s0)
     e5c:	00478713          	addi	a4,a5,4
     e60:	fce42423          	sw	a4,-56(s0)
     e64:	0007a783          	lw	a5,0(a5)
     e68:	fcf42e23          	sw	a5,-36(s0)
     e6c:	fdc42783          	lw	a5,-36(s0)
     e70:	fec42603          	lw	a2,-20(s0)
     e74:	01000593          	li	a1,16
     e78:	00078513          	mv	a0,a5
     e7c:	bc5ff0ef          	jal	a40 <my_printn>
     e80:	00050713          	mv	a4,a0
     e84:	fe042783          	lw	a5,-32(s0)
     e88:	00e787b3          	add	a5,a5,a4
     e8c:	fef42023          	sw	a5,-32(s0)
     e90:	1380006f          	j	fc8 <my_vprintf+0x31c>
     e94:	fc842783          	lw	a5,-56(s0)
     e98:	00478713          	addi	a4,a5,4
     e9c:	fce42423          	sw	a4,-56(s0)
     ea0:	0007a783          	lw	a5,0(a5)
     ea4:	fef42223          	sw	a5,-28(s0)
     ea8:	0480006f          	j	ef0 <my_vprintf+0x244>
     eac:	fe442783          	lw	a5,-28(s0)
     eb0:	0007c783          	lbu	a5,0(a5)
     eb4:	00078513          	mv	a0,a5
     eb8:	460000ef          	jal	1318 <uart_put_char>
     ebc:	00050713          	mv	a4,a0
     ec0:	fe042783          	lw	a5,-32(s0)
     ec4:	00f707b3          	add	a5,a4,a5
     ec8:	fef42023          	sw	a5,-32(s0)
     ecc:	fe442783          	lw	a5,-28(s0)
     ed0:	0007c703          	lbu	a4,0(a5)
     ed4:	00a00793          	li	a5,10
     ed8:	00f71663          	bne	a4,a5,ee4 <my_vprintf+0x238>
     edc:	00d00513          	li	a0,13
     ee0:	438000ef          	jal	1318 <uart_put_char>
     ee4:	fe442783          	lw	a5,-28(s0)
     ee8:	00178793          	addi	a5,a5,1
     eec:	fef42223          	sw	a5,-28(s0)
     ef0:	fe442783          	lw	a5,-28(s0)
     ef4:	0007c783          	lbu	a5,0(a5)
     ef8:	fa079ae3          	bnez	a5,eac <my_vprintf+0x200>
     efc:	0cc0006f          	j	fc8 <my_vprintf+0x31c>
     f00:	fc842783          	lw	a5,-56(s0)
     f04:	00778793          	addi	a5,a5,7
     f08:	ff87f793          	andi	a5,a5,-8
     f0c:	00878713          	addi	a4,a5,8
     f10:	fce42423          	sw	a4,-56(s0)
     f14:	0007a703          	lw	a4,0(a5)
     f18:	0047a783          	lw	a5,4(a5)
     f1c:	00070513          	mv	a0,a4
     f20:	00078593          	mv	a1,a5
     f24:	6e4110ef          	jal	12608 <__truncdfsf2>
     f28:	00050793          	mv	a5,a0
     f2c:	fcf42c23          	sw	a5,-40(s0)
     f30:	fec42583          	lw	a1,-20(s0)
     f34:	fd842503          	lw	a0,-40(s0)
     f38:	bfdff0ef          	jal	b34 <my_printflt>
     f3c:	00050713          	mv	a4,a0
     f40:	fe042783          	lw	a5,-32(s0)
     f44:	00e787b3          	add	a5,a5,a4
     f48:	fef42023          	sw	a5,-32(s0)
     f4c:	07c0006f          	j	fc8 <my_vprintf+0x31c>
     f50:	02500513          	li	a0,37
     f54:	3c4000ef          	jal	1318 <uart_put_char>
     f58:	00050713          	mv	a4,a0
     f5c:	fe042783          	lw	a5,-32(s0)
     f60:	00f707b3          	add	a5,a4,a5
     f64:	fef42023          	sw	a5,-32(s0)
     f68:	0600006f          	j	fc8 <my_vprintf+0x31c>
     f6c:	02500513          	li	a0,37
     f70:	3a8000ef          	jal	1318 <uart_put_char>
     f74:	00050713          	mv	a4,a0
     f78:	fe042783          	lw	a5,-32(s0)
     f7c:	00f707b3          	add	a5,a4,a5
     f80:	fef42023          	sw	a5,-32(s0)
     f84:	fcc42783          	lw	a5,-52(s0)
     f88:	fff78793          	addi	a5,a5,-1
     f8c:	fcf42623          	sw	a5,-52(s0)
     f90:	0380006f          	j	fc8 <my_vprintf+0x31c>
     f94:	fe842783          	lw	a5,-24(s0)
     f98:	0ff7f793          	zext.b	a5,a5
     f9c:	00078513          	mv	a0,a5
     fa0:	378000ef          	jal	1318 <uart_put_char>
     fa4:	00050713          	mv	a4,a0
     fa8:	fe042783          	lw	a5,-32(s0)
     fac:	00f707b3          	add	a5,a4,a5
     fb0:	fef42023          	sw	a5,-32(s0)
     fb4:	fe842703          	lw	a4,-24(s0)
     fb8:	00a00793          	li	a5,10
     fbc:	00f71663          	bne	a4,a5,fc8 <my_vprintf+0x31c>
     fc0:	00d00513          	li	a0,13
     fc4:	354000ef          	jal	1318 <uart_put_char>
     fc8:	fcc42783          	lw	a5,-52(s0)
     fcc:	00178713          	addi	a4,a5,1
     fd0:	fce42623          	sw	a4,-52(s0)
     fd4:	0007c783          	lbu	a5,0(a5)
     fd8:	fef42423          	sw	a5,-24(s0)
     fdc:	fe842783          	lw	a5,-24(s0)
     fe0:	ce0796e3          	bnez	a5,ccc <my_vprintf+0x20>
     fe4:	fe042783          	lw	a5,-32(s0)
     fe8:	00078513          	mv	a0,a5
     fec:	03c12083          	lw	ra,60(sp)
     ff0:	03812403          	lw	s0,56(sp)
     ff4:	04010113          	addi	sp,sp,64
     ff8:	00008067          	ret

00000ffc <uart_init>:
     ffc:	fc010113          	addi	sp,sp,-64
    1000:	02112e23          	sw	ra,60(sp)
    1004:	02812c23          	sw	s0,56(sp)
    1008:	04010413          	addi	s0,sp,64
    100c:	fca42e23          	sw	a0,-36(s0)
    1010:	fcb42c23          	sw	a1,-40(s0)
    1014:	fcc42a23          	sw	a2,-44(s0)
    1018:	fcd42823          	sw	a3,-48(s0)
    101c:	fce42623          	sw	a4,-52(s0)
    1020:	fdc42783          	lw	a5,-36(s0)
    1024:	00079663          	bnez	a5,1030 <uart_init+0x34>
    1028:	5ec000ef          	jal	1614 <uart_get_clk_freq>
    102c:	fca42e23          	sw	a0,-36(s0)
    1030:	fdc42703          	lw	a4,-36(s0)
    1034:	fd842783          	lw	a5,-40(s0)
    1038:	02f757b3          	divu	a5,a4,a5
    103c:	00078513          	mv	a0,a5
    1040:	6cd0d0ef          	jal	ef0c <__floatunsidf>
    1044:	00050713          	mv	a4,a0
    1048:	00058793          	mv	a5,a1
    104c:	2b01a603          	lw	a2,688(gp) # 12a80 <__global_pointer$+0x2b0>
    1050:	2b41a683          	lw	a3,692(gp) # 12a84 <__global_pointer$+0x2b4>
    1054:	00070513          	mv	a0,a4
    1058:	00078593          	mv	a1,a5
    105c:	73d0b0ef          	jal	cf98 <__adddf3>
    1060:	00050713          	mv	a4,a0
    1064:	00058793          	mv	a5,a1
    1068:	00070513          	mv	a0,a4
    106c:	00078593          	mv	a1,a5
    1070:	5750d0ef          	jal	ede4 <__fixdfsi>
    1074:	00050793          	mv	a5,a0
    1078:	00078713          	mv	a4,a5
    107c:	000107b7          	lui	a5,0x10
    1080:	fff78793          	addi	a5,a5,-1 # ffff <__multf3+0xd47>
    1084:	00f777b3          	and	a5,a4,a5
    1088:	fef42623          	sw	a5,-20(s0)
    108c:	fd442703          	lw	a4,-44(s0)
    1090:	00800793          	li	a5,8
    1094:	00f71663          	bne	a4,a5,10a0 <uart_init+0xa4>
    1098:	00000793          	li	a5,0
    109c:	0080006f          	j	10a4 <uart_init+0xa8>
    10a0:	000107b7          	lui	a5,0x10
    10a4:	fec42703          	lw	a4,-20(s0)
    10a8:	00e7e7b3          	or	a5,a5,a4
    10ac:	fef42623          	sw	a5,-20(s0)
    10b0:	fd042783          	lw	a5,-48(s0)
    10b4:	00079663          	bnez	a5,10c0 <uart_init+0xc4>
    10b8:	00000793          	li	a5,0
    10bc:	0080006f          	j	10c4 <uart_init+0xc8>
    10c0:	000207b7          	lui	a5,0x20
    10c4:	fec42703          	lw	a4,-20(s0)
    10c8:	00e7e7b3          	or	a5,a5,a4
    10cc:	fef42623          	sw	a5,-20(s0)
    10d0:	fd042703          	lw	a4,-48(s0)
    10d4:	00100793          	li	a5,1
    10d8:	00f71663          	bne	a4,a5,10e4 <uart_init+0xe8>
    10dc:	00000793          	li	a5,0
    10e0:	0080006f          	j	10e8 <uart_init+0xec>
    10e4:	000407b7          	lui	a5,0x40
    10e8:	fec42703          	lw	a4,-20(s0)
    10ec:	00e7e7b3          	or	a5,a5,a4
    10f0:	fef42623          	sw	a5,-20(s0)
    10f4:	fcc42703          	lw	a4,-52(s0)
    10f8:	00100793          	li	a5,1
    10fc:	00f71663          	bne	a4,a5,1108 <uart_init+0x10c>
    1100:	00000793          	li	a5,0
    1104:	0080006f          	j	110c <uart_init+0x110>
    1108:	000807b7          	lui	a5,0x80
    110c:	fec42703          	lw	a4,-20(s0)
    1110:	00e7e7b3          	or	a5,a5,a4
    1114:	fef42623          	sw	a5,-20(s0)
    1118:	000147b7          	lui	a5,0x14
    111c:	b707a783          	lw	a5,-1168(a5) # 13b70 <UART_CONTROL>
    1120:	fef42423          	sw	a5,-24(s0)
    1124:	fe842783          	lw	a5,-24(s0)
    1128:	fec42703          	lw	a4,-20(s0)
    112c:	00e7a023          	sw	a4,0(a5)
    1130:	00000013          	nop
    1134:	03c12083          	lw	ra,60(sp)
    1138:	03812403          	lw	s0,56(sp)
    113c:	04010113          	addi	sp,sp,64
    1140:	00008067          	ret

00001144 <uart_init_ext>:
    1144:	fc010113          	addi	sp,sp,-64
    1148:	02112e23          	sw	ra,60(sp)
    114c:	02812c23          	sw	s0,56(sp)
    1150:	04010413          	addi	s0,sp,64
    1154:	fca42e23          	sw	a0,-36(s0)
    1158:	fcb42c23          	sw	a1,-40(s0)
    115c:	fcc42a23          	sw	a2,-44(s0)
    1160:	fcd42823          	sw	a3,-48(s0)
    1164:	fce42623          	sw	a4,-52(s0)
    1168:	fcf42423          	sw	a5,-56(s0)
    116c:	fd042223          	sw	a6,-60(s0)
    1170:	fdc42783          	lw	a5,-36(s0)
    1174:	00079663          	bnez	a5,1180 <uart_init_ext+0x3c>
    1178:	49c000ef          	jal	1614 <uart_get_clk_freq>
    117c:	fca42e23          	sw	a0,-36(s0)
    1180:	fdc42703          	lw	a4,-36(s0)
    1184:	fd842783          	lw	a5,-40(s0)
    1188:	02f757b3          	divu	a5,a4,a5
    118c:	00078513          	mv	a0,a5
    1190:	57d0d0ef          	jal	ef0c <__floatunsidf>
    1194:	00050713          	mv	a4,a0
    1198:	00058793          	mv	a5,a1
    119c:	2b01a603          	lw	a2,688(gp) # 12a80 <__global_pointer$+0x2b0>
    11a0:	2b41a683          	lw	a3,692(gp) # 12a84 <__global_pointer$+0x2b4>
    11a4:	00070513          	mv	a0,a4
    11a8:	00078593          	mv	a1,a5
    11ac:	5ed0b0ef          	jal	cf98 <__adddf3>
    11b0:	00050713          	mv	a4,a0
    11b4:	00058793          	mv	a5,a1
    11b8:	00070513          	mv	a0,a4
    11bc:	00078593          	mv	a1,a5
    11c0:	4250d0ef          	jal	ede4 <__fixdfsi>
    11c4:	00050793          	mv	a5,a0
    11c8:	00078713          	mv	a4,a5
    11cc:	000107b7          	lui	a5,0x10
    11d0:	fff78793          	addi	a5,a5,-1 # ffff <__multf3+0xd47>
    11d4:	00f777b3          	and	a5,a4,a5
    11d8:	fef42623          	sw	a5,-20(s0)
    11dc:	fd442703          	lw	a4,-44(s0)
    11e0:	00800793          	li	a5,8
    11e4:	00f71663          	bne	a4,a5,11f0 <uart_init_ext+0xac>
    11e8:	00000793          	li	a5,0
    11ec:	0080006f          	j	11f4 <uart_init_ext+0xb0>
    11f0:	000107b7          	lui	a5,0x10
    11f4:	fec42703          	lw	a4,-20(s0)
    11f8:	00e7e7b3          	or	a5,a5,a4
    11fc:	fef42623          	sw	a5,-20(s0)
    1200:	fd042783          	lw	a5,-48(s0)
    1204:	00079663          	bnez	a5,1210 <uart_init_ext+0xcc>
    1208:	00000793          	li	a5,0
    120c:	0080006f          	j	1214 <uart_init_ext+0xd0>
    1210:	000207b7          	lui	a5,0x20
    1214:	fec42703          	lw	a4,-20(s0)
    1218:	00e7e7b3          	or	a5,a5,a4
    121c:	fef42623          	sw	a5,-20(s0)
    1220:	fd042703          	lw	a4,-48(s0)
    1224:	00100793          	li	a5,1
    1228:	00f71663          	bne	a4,a5,1234 <uart_init_ext+0xf0>
    122c:	00000793          	li	a5,0
    1230:	0080006f          	j	1238 <uart_init_ext+0xf4>
    1234:	000407b7          	lui	a5,0x40
    1238:	fec42703          	lw	a4,-20(s0)
    123c:	00e7e7b3          	or	a5,a5,a4
    1240:	fef42623          	sw	a5,-20(s0)
    1244:	fcc42703          	lw	a4,-52(s0)
    1248:	00100793          	li	a5,1
    124c:	00f71663          	bne	a4,a5,1258 <uart_init_ext+0x114>
    1250:	00000793          	li	a5,0
    1254:	0080006f          	j	125c <uart_init_ext+0x118>
    1258:	000807b7          	lui	a5,0x80
    125c:	fec42703          	lw	a4,-20(s0)
    1260:	00e7e7b3          	or	a5,a5,a4
    1264:	fef42623          	sw	a5,-20(s0)
    1268:	fc842783          	lw	a5,-56(s0)
    126c:	00079663          	bnez	a5,1278 <uart_init_ext+0x134>
    1270:	00000793          	li	a5,0
    1274:	0080006f          	j	127c <uart_init_ext+0x138>
    1278:	002007b7          	lui	a5,0x200
    127c:	fec42703          	lw	a4,-20(s0)
    1280:	00e7e7b3          	or	a5,a5,a4
    1284:	fef42623          	sw	a5,-20(s0)
    1288:	fc442783          	lw	a5,-60(s0)
    128c:	00079663          	bnez	a5,1298 <uart_init_ext+0x154>
    1290:	00000793          	li	a5,0
    1294:	0080006f          	j	129c <uart_init_ext+0x158>
    1298:	001007b7          	lui	a5,0x100
    129c:	fec42703          	lw	a4,-20(s0)
    12a0:	00e7e7b3          	or	a5,a5,a4
    12a4:	fef42623          	sw	a5,-20(s0)
    12a8:	000147b7          	lui	a5,0x14
    12ac:	b707a783          	lw	a5,-1168(a5) # 13b70 <UART_CONTROL>
    12b0:	fef42423          	sw	a5,-24(s0)
    12b4:	fe842783          	lw	a5,-24(s0)
    12b8:	fec42703          	lw	a4,-20(s0)
    12bc:	00e7a023          	sw	a4,0(a5)
    12c0:	00000013          	nop
    12c4:	03c12083          	lw	ra,60(sp)
    12c8:	03812403          	lw	s0,56(sp)
    12cc:	04010113          	addi	sp,sp,64
    12d0:	00008067          	ret

000012d4 <uart_get_char>:
    12d4:	fe010113          	addi	sp,sp,-32
    12d8:	00812e23          	sw	s0,28(sp)
    12dc:	02010413          	addi	s0,sp,32
    12e0:	000147b7          	lui	a5,0x14
    12e4:	b7c7a783          	lw	a5,-1156(a5) # 13b7c <UART_RX>
    12e8:	fef42423          	sw	a5,-24(s0)
    12ec:	fe842783          	lw	a5,-24(s0)
    12f0:	0007a783          	lw	a5,0(a5)
    12f4:	fef42623          	sw	a5,-20(s0)
    12f8:	fec42783          	lw	a5,-20(s0)
    12fc:	fe07d2e3          	bgez	a5,12e0 <uart_get_char+0xc>
    1300:	fec42783          	lw	a5,-20(s0)
    1304:	0ff7f793          	zext.b	a5,a5
    1308:	00078513          	mv	a0,a5
    130c:	01c12403          	lw	s0,28(sp)
    1310:	02010113          	addi	sp,sp,32
    1314:	00008067          	ret

00001318 <uart_put_char>:
    1318:	fd010113          	addi	sp,sp,-48
    131c:	02812623          	sw	s0,44(sp)
    1320:	03010413          	addi	s0,sp,48
    1324:	00050793          	mv	a5,a0
    1328:	fcf40fa3          	sb	a5,-33(s0)
    132c:	000147b7          	lui	a5,0x14
    1330:	b787a783          	lw	a5,-1160(a5) # 13b78 <UART_TX>
    1334:	fef42423          	sw	a5,-24(s0)
    1338:	fe842783          	lw	a5,-24(s0)
    133c:	0007a783          	lw	a5,0(a5)
    1340:	fef42623          	sw	a5,-20(s0)
    1344:	fec42783          	lw	a5,-20(s0)
    1348:	fe07c2e3          	bltz	a5,132c <uart_put_char+0x14>
    134c:	fdf44783          	lbu	a5,-33(s0)
    1350:	fef42623          	sw	a5,-20(s0)
    1354:	000147b7          	lui	a5,0x14
    1358:	b787a783          	lw	a5,-1160(a5) # 13b78 <UART_TX>
    135c:	fef42223          	sw	a5,-28(s0)
    1360:	fe442783          	lw	a5,-28(s0)
    1364:	fec42703          	lw	a4,-20(s0)
    1368:	00e7a023          	sw	a4,0(a5)
    136c:	fdf44783          	lbu	a5,-33(s0)
    1370:	00078513          	mv	a0,a5
    1374:	02c12403          	lw	s0,44(sp)
    1378:	03010113          	addi	sp,sp,48
    137c:	00008067          	ret

00001380 <uart_put_string>:
    1380:	fc010113          	addi	sp,sp,-64
    1384:	02812e23          	sw	s0,60(sp)
    1388:	04010413          	addi	s0,sp,64
    138c:	fca42623          	sw	a0,-52(s0)
    1390:	fe042623          	sw	zero,-20(s0)
    1394:	0480006f          	j	13dc <uart_put_string+0x5c>
    1398:	000147b7          	lui	a5,0x14
    139c:	b787a783          	lw	a5,-1160(a5) # 13b78 <UART_TX>
    13a0:	fef42023          	sw	a5,-32(s0)
    13a4:	fe042783          	lw	a5,-32(s0)
    13a8:	0007a783          	lw	a5,0(a5)
    13ac:	fef42223          	sw	a5,-28(s0)
    13b0:	fe442783          	lw	a5,-28(s0)
    13b4:	fe07c2e3          	bltz	a5,1398 <uart_put_string+0x18>
    13b8:	000147b7          	lui	a5,0x14
    13bc:	b787a783          	lw	a5,-1160(a5) # 13b78 <UART_TX>
    13c0:	fcf42e23          	sw	a5,-36(s0)
    13c4:	fdc42783          	lw	a5,-36(s0)
    13c8:	feb44703          	lbu	a4,-21(s0)
    13cc:	00e7a023          	sw	a4,0(a5)
    13d0:	fec42783          	lw	a5,-20(s0)
    13d4:	00178793          	addi	a5,a5,1
    13d8:	fef42623          	sw	a5,-20(s0)
    13dc:	fcc42783          	lw	a5,-52(s0)
    13e0:	00178713          	addi	a4,a5,1
    13e4:	fce42623          	sw	a4,-52(s0)
    13e8:	0007c783          	lbu	a5,0(a5)
    13ec:	fef405a3          	sb	a5,-21(s0)
    13f0:	feb44783          	lbu	a5,-21(s0)
    13f4:	fa0792e3          	bnez	a5,1398 <uart_put_string+0x18>
    13f8:	fec42783          	lw	a5,-20(s0)
    13fc:	00078513          	mv	a0,a5
    1400:	03c12403          	lw	s0,60(sp)
    1404:	04010113          	addi	sp,sp,64
    1408:	00008067          	ret

0000140c <uart_put_int>:
    140c:	fc010113          	addi	sp,sp,-64
    1410:	02112e23          	sw	ra,60(sp)
    1414:	02812c23          	sw	s0,56(sp)
    1418:	04010413          	addi	s0,sp,64
    141c:	fca42623          	sw	a0,-52(s0)
    1420:	fcc42703          	lw	a4,-52(s0)
    1424:	00a00793          	li	a5,10
    1428:	02f757b3          	divu	a5,a4,a5
    142c:	fef42623          	sw	a5,-20(s0)
    1430:	fec42783          	lw	a5,-20(s0)
    1434:	00078863          	beqz	a5,1444 <uart_put_int+0x38>
    1438:	fec42783          	lw	a5,-20(s0)
    143c:	00078513          	mv	a0,a5
    1440:	fcdff0ef          	jal	140c <uart_put_int>
    1444:	fcc42703          	lw	a4,-52(s0)
    1448:	00a00793          	li	a5,10
    144c:	02f777b3          	remu	a5,a4,a5
    1450:	0ff7f793          	zext.b	a5,a5
    1454:	03078793          	addi	a5,a5,48
    1458:	fef405a3          	sb	a5,-21(s0)
    145c:	000147b7          	lui	a5,0x14
    1460:	b787a783          	lw	a5,-1160(a5) # 13b78 <UART_TX>
    1464:	fcf42a23          	sw	a5,-44(s0)
    1468:	fd442783          	lw	a5,-44(s0)
    146c:	0007a783          	lw	a5,0(a5)
    1470:	fcf42c23          	sw	a5,-40(s0)
    1474:	fd842783          	lw	a5,-40(s0)
    1478:	fe07c2e3          	bltz	a5,145c <uart_put_int+0x50>
    147c:	000147b7          	lui	a5,0x14
    1480:	b787a783          	lw	a5,-1160(a5) # 13b78 <UART_TX>
    1484:	fcf42823          	sw	a5,-48(s0)
    1488:	fd042783          	lw	a5,-48(s0)
    148c:	feb44703          	lbu	a4,-21(s0)
    1490:	00e7a023          	sw	a4,0(a5)
    1494:	00000013          	nop
    1498:	03c12083          	lw	ra,60(sp)
    149c:	03812403          	lw	s0,56(sp)
    14a0:	04010113          	addi	sp,sp,64
    14a4:	00008067          	ret

000014a8 <uart_put_hex>:
    14a8:	fc010113          	addi	sp,sp,-64
    14ac:	02112e23          	sw	ra,60(sp)
    14b0:	02812c23          	sw	s0,56(sp)
    14b4:	04010413          	addi	s0,sp,64
    14b8:	fca42623          	sw	a0,-52(s0)
    14bc:	fcc42783          	lw	a5,-52(s0)
    14c0:	0047d793          	srli	a5,a5,0x4
    14c4:	fef42423          	sw	a5,-24(s0)
    14c8:	fe842783          	lw	a5,-24(s0)
    14cc:	00078863          	beqz	a5,14dc <uart_put_hex+0x34>
    14d0:	fe842783          	lw	a5,-24(s0)
    14d4:	00078513          	mv	a0,a5
    14d8:	fd1ff0ef          	jal	14a8 <uart_put_hex>
    14dc:	fcc42783          	lw	a5,-52(s0)
    14e0:	00f7f793          	andi	a5,a5,15
    14e4:	fef42423          	sw	a5,-24(s0)
    14e8:	fe842703          	lw	a4,-24(s0)
    14ec:	00900793          	li	a5,9
    14f0:	00e7cc63          	blt	a5,a4,1508 <uart_put_hex+0x60>
    14f4:	fe842783          	lw	a5,-24(s0)
    14f8:	0ff7f793          	zext.b	a5,a5
    14fc:	03078793          	addi	a5,a5,48
    1500:	fef407a3          	sb	a5,-17(s0)
    1504:	0140006f          	j	1518 <uart_put_hex+0x70>
    1508:	fe842783          	lw	a5,-24(s0)
    150c:	0ff7f793          	zext.b	a5,a5
    1510:	03778793          	addi	a5,a5,55
    1514:	fef407a3          	sb	a5,-17(s0)
    1518:	000147b7          	lui	a5,0x14
    151c:	b787a783          	lw	a5,-1160(a5) # 13b78 <UART_TX>
    1520:	fef42023          	sw	a5,-32(s0)
    1524:	fe042783          	lw	a5,-32(s0)
    1528:	0007a783          	lw	a5,0(a5)
    152c:	fef42223          	sw	a5,-28(s0)
    1530:	fe442783          	lw	a5,-28(s0)
    1534:	fe07c2e3          	bltz	a5,1518 <uart_put_hex+0x70>
    1538:	000147b7          	lui	a5,0x14
    153c:	b787a783          	lw	a5,-1160(a5) # 13b78 <UART_TX>
    1540:	fcf42e23          	sw	a5,-36(s0)
    1544:	fdc42783          	lw	a5,-36(s0)
    1548:	fef44703          	lbu	a4,-17(s0)
    154c:	00e7a023          	sw	a4,0(a5)
    1550:	00000013          	nop
    1554:	03c12083          	lw	ra,60(sp)
    1558:	03812403          	lw	s0,56(sp)
    155c:	04010113          	addi	sp,sp,64
    1560:	00008067          	ret

00001564 <uart_cler_tx_irq>:
    1564:	fe010113          	addi	sp,sp,-32
    1568:	00812e23          	sw	s0,28(sp)
    156c:	02010413          	addi	s0,sp,32
    1570:	000147b7          	lui	a5,0x14
    1574:	b747a783          	lw	a5,-1164(a5) # 13b74 <UART_STATUS>
    1578:	fef42423          	sw	a5,-24(s0)
    157c:	fe842783          	lw	a5,-24(s0)
    1580:	0007a783          	lw	a5,0(a5)
    1584:	fef42623          	sw	a5,-20(s0)
    1588:	fec42783          	lw	a5,-20(s0)
    158c:	ffe7f793          	andi	a5,a5,-2
    1590:	fef42623          	sw	a5,-20(s0)
    1594:	000147b7          	lui	a5,0x14
    1598:	b747a783          	lw	a5,-1164(a5) # 13b74 <UART_STATUS>
    159c:	fef42223          	sw	a5,-28(s0)
    15a0:	fe442783          	lw	a5,-28(s0)
    15a4:	fec42703          	lw	a4,-20(s0)
    15a8:	00e7a023          	sw	a4,0(a5)
    15ac:	00000013          	nop
    15b0:	01c12403          	lw	s0,28(sp)
    15b4:	02010113          	addi	sp,sp,32
    15b8:	00008067          	ret

000015bc <uart_cler_rx_irq>:
    15bc:	fe010113          	addi	sp,sp,-32
    15c0:	00812e23          	sw	s0,28(sp)
    15c4:	02010413          	addi	s0,sp,32
    15c8:	000147b7          	lui	a5,0x14
    15cc:	b747a783          	lw	a5,-1164(a5) # 13b74 <UART_STATUS>
    15d0:	fef42423          	sw	a5,-24(s0)
    15d4:	fe842783          	lw	a5,-24(s0)
    15d8:	0007a783          	lw	a5,0(a5)
    15dc:	fef42623          	sw	a5,-20(s0)
    15e0:	fec42783          	lw	a5,-20(s0)
    15e4:	ffd7f793          	andi	a5,a5,-3
    15e8:	fef42623          	sw	a5,-20(s0)
    15ec:	000147b7          	lui	a5,0x14
    15f0:	b747a783          	lw	a5,-1164(a5) # 13b74 <UART_STATUS>
    15f4:	fef42223          	sw	a5,-28(s0)
    15f8:	fe442783          	lw	a5,-28(s0)
    15fc:	fec42703          	lw	a4,-20(s0)
    1600:	00e7a023          	sw	a4,0(a5)
    1604:	00000013          	nop
    1608:	01c12403          	lw	s0,28(sp)
    160c:	02010113          	addi	sp,sp,32
    1610:	00008067          	ret

00001614 <uart_get_clk_freq>:
    1614:	fe010113          	addi	sp,sp,-32
    1618:	00812e23          	sw	s0,28(sp)
    161c:	02010413          	addi	s0,sp,32
    1620:	000147b7          	lui	a5,0x14
    1624:	b807a783          	lw	a5,-1152(a5) # 13b80 <UART_CLK_FREQ>
    1628:	fef42423          	sw	a5,-24(s0)
    162c:	fe842783          	lw	a5,-24(s0)
    1630:	0007a783          	lw	a5,0(a5)
    1634:	fef42623          	sw	a5,-20(s0)
    1638:	fec42783          	lw	a5,-20(s0)
    163c:	00078513          	mv	a0,a5
    1640:	01c12403          	lw	s0,28(sp)
    1644:	02010113          	addi	sp,sp,32
    1648:	00008067          	ret

0000164c <uart_set_addr>:
    164c:	fe010113          	addi	sp,sp,-32
    1650:	00812e23          	sw	s0,28(sp)
    1654:	02010413          	addi	s0,sp,32
    1658:	fea42623          	sw	a0,-20(s0)
    165c:	000147b7          	lui	a5,0x14
    1660:	fec42703          	lw	a4,-20(s0)
    1664:	b6e7a223          	sw	a4,-1180(a5) # 13b64 <UART_ADDR_BASE>
    1668:	000147b7          	lui	a5,0x14
    166c:	fec42703          	lw	a4,-20(s0)
    1670:	b6e7a423          	sw	a4,-1176(a5) # 13b68 <UART_VERSION>
    1674:	fec42783          	lw	a5,-20(s0)
    1678:	00478713          	addi	a4,a5,4
    167c:	000147b7          	lui	a5,0x14
    1680:	b6e7a623          	sw	a4,-1172(a5) # 13b6c <UART_NAME>
    1684:	fec42783          	lw	a5,-20(s0)
    1688:	01078713          	addi	a4,a5,16
    168c:	000147b7          	lui	a5,0x14
    1690:	b6e7a823          	sw	a4,-1168(a5) # 13b70 <UART_CONTROL>
    1694:	fec42783          	lw	a5,-20(s0)
    1698:	01478713          	addi	a4,a5,20
    169c:	000147b7          	lui	a5,0x14
    16a0:	b6e7aa23          	sw	a4,-1164(a5) # 13b74 <UART_STATUS>
    16a4:	fec42783          	lw	a5,-20(s0)
    16a8:	01878713          	addi	a4,a5,24
    16ac:	000147b7          	lui	a5,0x14
    16b0:	b6e7ac23          	sw	a4,-1160(a5) # 13b78 <UART_TX>
    16b4:	fec42783          	lw	a5,-20(s0)
    16b8:	01c78713          	addi	a4,a5,28
    16bc:	000147b7          	lui	a5,0x14
    16c0:	b6e7ae23          	sw	a4,-1156(a5) # 13b7c <UART_RX>
    16c4:	fec42783          	lw	a5,-20(s0)
    16c8:	02078713          	addi	a4,a5,32
    16cc:	000147b7          	lui	a5,0x14
    16d0:	b8e7a023          	sw	a4,-1152(a5) # 13b80 <UART_CLK_FREQ>
    16d4:	00000013          	nop
    16d8:	01c12403          	lw	s0,28(sp)
    16dc:	02010113          	addi	sp,sp,32
    16e0:	00008067          	ret

000016e4 <uart_get_addr>:
    16e4:	ff010113          	addi	sp,sp,-16
    16e8:	00812623          	sw	s0,12(sp)
    16ec:	01010413          	addi	s0,sp,16
    16f0:	000147b7          	lui	a5,0x14
    16f4:	b647a783          	lw	a5,-1180(a5) # 13b64 <UART_ADDR_BASE>
    16f8:	00078513          	mv	a0,a5
    16fc:	00c12403          	lw	s0,12(sp)
    1700:	01010113          	addi	sp,sp,16
    1704:	00008067          	ret

00001708 <gpio_read>:
    1708:	fe010113          	addi	sp,sp,-32
    170c:	00812e23          	sw	s0,28(sp)
    1710:	02010413          	addi	s0,sp,32
    1714:	000147b7          	lui	a5,0x14
    1718:	b947a783          	lw	a5,-1132(a5) # 13b94 <CSRA_INPUT>
    171c:	0007a783          	lw	a5,0(a5)
    1720:	fef42623          	sw	a5,-20(s0)
    1724:	fec42783          	lw	a5,-20(s0)
    1728:	00078513          	mv	a0,a5
    172c:	01c12403          	lw	s0,28(sp)
    1730:	02010113          	addi	sp,sp,32
    1734:	00008067          	ret

00001738 <gpio_write>:
    1738:	fe010113          	addi	sp,sp,-32
    173c:	00812e23          	sw	s0,28(sp)
    1740:	02010413          	addi	s0,sp,32
    1744:	fea42623          	sw	a0,-20(s0)
    1748:	000147b7          	lui	a5,0x14
    174c:	b987a783          	lw	a5,-1128(a5) # 13b98 <CSRA_OUTPUT>
    1750:	00078713          	mv	a4,a5
    1754:	fec42783          	lw	a5,-20(s0)
    1758:	00f72023          	sw	a5,0(a4)
    175c:	00000013          	nop
    1760:	01c12403          	lw	s0,28(sp)
    1764:	02010113          	addi	sp,sp,32
    1768:	00008067          	ret

0000176c <gpio_init>:
    176c:	fd010113          	addi	sp,sp,-48
    1770:	02812623          	sw	s0,44(sp)
    1774:	03010413          	addi	s0,sp,48
    1778:	fca42e23          	sw	a0,-36(s0)
    177c:	fcb42c23          	sw	a1,-40(s0)
    1780:	fcc42a23          	sw	a2,-44(s0)
    1784:	fcd42823          	sw	a3,-48(s0)
    1788:	fe042623          	sw	zero,-20(s0)
    178c:	000147b7          	lui	a5,0x14
    1790:	b907a783          	lw	a5,-1136(a5) # 13b90 <CSRA_DIR>
    1794:	00078713          	mv	a4,a5
    1798:	fdc42783          	lw	a5,-36(s0)
    179c:	00f72023          	sw	a5,0(a4)
    17a0:	000147b7          	lui	a5,0x14
    17a4:	b987a783          	lw	a5,-1128(a5) # 13b98 <CSRA_OUTPUT>
    17a8:	00078713          	mv	a4,a5
    17ac:	fec42783          	lw	a5,-20(s0)
    17b0:	00f72023          	sw	a5,0(a4)
    17b4:	000147b7          	lui	a5,0x14
    17b8:	ba47a783          	lw	a5,-1116(a5) # 13ba4 <CSRA_EDGE>
    17bc:	00078713          	mv	a4,a5
    17c0:	fd842783          	lw	a5,-40(s0)
    17c4:	00f72023          	sw	a5,0(a4)
    17c8:	000147b7          	lui	a5,0x14
    17cc:	ba87a783          	lw	a5,-1112(a5) # 13ba8 <CSRA_POL>
    17d0:	00078713          	mv	a4,a5
    17d4:	fd442783          	lw	a5,-44(s0)
    17d8:	00f72023          	sw	a5,0(a4)
    17dc:	fd042783          	lw	a5,-48(s0)
    17e0:	fff7c793          	not	a5,a5
    17e4:	fef42623          	sw	a5,-20(s0)
    17e8:	000147b7          	lui	a5,0x14
    17ec:	b9c7a783          	lw	a5,-1124(a5) # 13b9c <CSRA_MASK>
    17f0:	00078713          	mv	a4,a5
    17f4:	fec42783          	lw	a5,-20(s0)
    17f8:	00f72023          	sw	a5,0(a4)
    17fc:	00000013          	nop
    1800:	02c12403          	lw	s0,44(sp)
    1804:	03010113          	addi	sp,sp,48
    1808:	00008067          	ret

0000180c <gpio_irq_enable>:
    180c:	fd010113          	addi	sp,sp,-48
    1810:	02812623          	sw	s0,44(sp)
    1814:	03010413          	addi	s0,sp,48
    1818:	fca42e23          	sw	a0,-36(s0)
    181c:	fdc42783          	lw	a5,-36(s0)
    1820:	fff7c793          	not	a5,a5
    1824:	fef42623          	sw	a5,-20(s0)
    1828:	000147b7          	lui	a5,0x14
    182c:	b9c7a783          	lw	a5,-1124(a5) # 13b9c <CSRA_MASK>
    1830:	00078713          	mv	a4,a5
    1834:	fec42783          	lw	a5,-20(s0)
    1838:	00f72023          	sw	a5,0(a4)
    183c:	000147b7          	lui	a5,0x14
    1840:	b9c7a783          	lw	a5,-1124(a5) # 13b9c <CSRA_MASK>
    1844:	0007a783          	lw	a5,0(a5)
    1848:	fef42623          	sw	a5,-20(s0)
    184c:	fec42783          	lw	a5,-20(s0)
    1850:	00078513          	mv	a0,a5
    1854:	02c12403          	lw	s0,44(sp)
    1858:	03010113          	addi	sp,sp,48
    185c:	00008067          	ret

00001860 <gpio_irq_edge>:
    1860:	fe010113          	addi	sp,sp,-32
    1864:	00812e23          	sw	s0,28(sp)
    1868:	02010413          	addi	s0,sp,32
    186c:	fea42623          	sw	a0,-20(s0)
    1870:	000147b7          	lui	a5,0x14
    1874:	ba47a783          	lw	a5,-1116(a5) # 13ba4 <CSRA_EDGE>
    1878:	00078713          	mv	a4,a5
    187c:	fec42783          	lw	a5,-20(s0)
    1880:	00f72023          	sw	a5,0(a4)
    1884:	000147b7          	lui	a5,0x14
    1888:	ba47a783          	lw	a5,-1116(a5) # 13ba4 <CSRA_EDGE>
    188c:	0007a783          	lw	a5,0(a5)
    1890:	fef42623          	sw	a5,-20(s0)
    1894:	fec42783          	lw	a5,-20(s0)
    1898:	00078513          	mv	a0,a5
    189c:	01c12403          	lw	s0,28(sp)
    18a0:	02010113          	addi	sp,sp,32
    18a4:	00008067          	ret

000018a8 <gpio_irq_pol>:
    18a8:	fe010113          	addi	sp,sp,-32
    18ac:	00812e23          	sw	s0,28(sp)
    18b0:	02010413          	addi	s0,sp,32
    18b4:	fea42623          	sw	a0,-20(s0)
    18b8:	000147b7          	lui	a5,0x14
    18bc:	ba87a783          	lw	a5,-1112(a5) # 13ba8 <CSRA_POL>
    18c0:	00078713          	mv	a4,a5
    18c4:	fec42783          	lw	a5,-20(s0)
    18c8:	00f72023          	sw	a5,0(a4)
    18cc:	000147b7          	lui	a5,0x14
    18d0:	ba87a783          	lw	a5,-1112(a5) # 13ba8 <CSRA_POL>
    18d4:	0007a783          	lw	a5,0(a5)
    18d8:	fef42623          	sw	a5,-20(s0)
    18dc:	fec42783          	lw	a5,-20(s0)
    18e0:	00078513          	mv	a0,a5
    18e4:	01c12403          	lw	s0,28(sp)
    18e8:	02010113          	addi	sp,sp,32
    18ec:	00008067          	ret

000018f0 <gpio_irq_read>:
    18f0:	fe010113          	addi	sp,sp,-32
    18f4:	00812e23          	sw	s0,28(sp)
    18f8:	02010413          	addi	s0,sp,32
    18fc:	000147b7          	lui	a5,0x14
    1900:	ba07a783          	lw	a5,-1120(a5) # 13ba0 <CSRA_IRQ>
    1904:	0007a783          	lw	a5,0(a5)
    1908:	fef42623          	sw	a5,-20(s0)
    190c:	fec42783          	lw	a5,-20(s0)
    1910:	00078513          	mv	a0,a5
    1914:	01c12403          	lw	s0,28(sp)
    1918:	02010113          	addi	sp,sp,32
    191c:	00008067          	ret

00001920 <gpio_irq_clear>:
    1920:	fd010113          	addi	sp,sp,-48
    1924:	02812623          	sw	s0,44(sp)
    1928:	03010413          	addi	s0,sp,48
    192c:	fca42e23          	sw	a0,-36(s0)
    1930:	000147b7          	lui	a5,0x14
    1934:	ba07a783          	lw	a5,-1120(a5) # 13ba0 <CSRA_IRQ>
    1938:	0007a783          	lw	a5,0(a5)
    193c:	fef42623          	sw	a5,-20(s0)
    1940:	fec42703          	lw	a4,-20(s0)
    1944:	fdc42783          	lw	a5,-36(s0)
    1948:	00f777b3          	and	a5,a4,a5
    194c:	fef42623          	sw	a5,-20(s0)
    1950:	000147b7          	lui	a5,0x14
    1954:	ba07a783          	lw	a5,-1120(a5) # 13ba0 <CSRA_IRQ>
    1958:	00078713          	mv	a4,a5
    195c:	fec42783          	lw	a5,-20(s0)
    1960:	00f72023          	sw	a5,0(a4)
    1964:	000147b7          	lui	a5,0x14
    1968:	ba07a783          	lw	a5,-1120(a5) # 13ba0 <CSRA_IRQ>
    196c:	0007a783          	lw	a5,0(a5)
    1970:	fcf42e23          	sw	a5,-36(s0)
    1974:	fdc42783          	lw	a5,-36(s0)
    1978:	00078513          	mv	a0,a5
    197c:	02c12403          	lw	s0,44(sp)
    1980:	03010113          	addi	sp,sp,48
    1984:	00008067          	ret

00001988 <gpio_csr>:
    1988:	fe010113          	addi	sp,sp,-32
    198c:	00112e23          	sw	ra,28(sp)
    1990:	00812c23          	sw	s0,24(sp)
    1994:	02010413          	addi	s0,sp,32
    1998:	000147b7          	lui	a5,0x14
    199c:	b887a783          	lw	a5,-1144(a5) # 13b88 <CSRA_VERSION>
    19a0:	0007a783          	lw	a5,0(a5)
    19a4:	fef42623          	sw	a5,-20(s0)
    19a8:	fec42583          	lw	a1,-20(s0)
    19ac:	2b818513          	addi	a0,gp,696 # 12a88 <__global_pointer$+0x2b8>
    19b0:	20d000ef          	jal	23bc <printf>
    19b4:	000147b7          	lui	a5,0x14
    19b8:	b8c7a783          	lw	a5,-1140(a5) # 13b8c <CSRA_NAME>
    19bc:	0007a783          	lw	a5,0(a5)
    19c0:	fef42623          	sw	a5,-20(s0)
    19c4:	fec42583          	lw	a1,-20(s0)
    19c8:	2d018513          	addi	a0,gp,720 # 12aa0 <__global_pointer$+0x2d0>
    19cc:	1f1000ef          	jal	23bc <printf>
    19d0:	000147b7          	lui	a5,0x14
    19d4:	b907a783          	lw	a5,-1136(a5) # 13b90 <CSRA_DIR>
    19d8:	0007a783          	lw	a5,0(a5)
    19dc:	fef42623          	sw	a5,-20(s0)
    19e0:	fec42583          	lw	a1,-20(s0)
    19e4:	2e818513          	addi	a0,gp,744 # 12ab8 <__global_pointer$+0x2e8>
    19e8:	1d5000ef          	jal	23bc <printf>
    19ec:	000147b7          	lui	a5,0x14
    19f0:	b947a783          	lw	a5,-1132(a5) # 13b94 <CSRA_INPUT>
    19f4:	0007a783          	lw	a5,0(a5)
    19f8:	fef42623          	sw	a5,-20(s0)
    19fc:	fec42583          	lw	a1,-20(s0)
    1a00:	30018513          	addi	a0,gp,768 # 12ad0 <__global_pointer$+0x300>
    1a04:	1b9000ef          	jal	23bc <printf>
    1a08:	000147b7          	lui	a5,0x14
    1a0c:	b987a783          	lw	a5,-1128(a5) # 13b98 <CSRA_OUTPUT>
    1a10:	0007a783          	lw	a5,0(a5)
    1a14:	fef42623          	sw	a5,-20(s0)
    1a18:	fec42583          	lw	a1,-20(s0)
    1a1c:	31818513          	addi	a0,gp,792 # 12ae8 <__global_pointer$+0x318>
    1a20:	19d000ef          	jal	23bc <printf>
    1a24:	000147b7          	lui	a5,0x14
    1a28:	b9c7a783          	lw	a5,-1124(a5) # 13b9c <CSRA_MASK>
    1a2c:	0007a783          	lw	a5,0(a5)
    1a30:	fef42623          	sw	a5,-20(s0)
    1a34:	fec42583          	lw	a1,-20(s0)
    1a38:	33018513          	addi	a0,gp,816 # 12b00 <__global_pointer$+0x330>
    1a3c:	181000ef          	jal	23bc <printf>
    1a40:	000147b7          	lui	a5,0x14
    1a44:	ba07a783          	lw	a5,-1120(a5) # 13ba0 <CSRA_IRQ>
    1a48:	0007a783          	lw	a5,0(a5)
    1a4c:	fef42623          	sw	a5,-20(s0)
    1a50:	fec42583          	lw	a1,-20(s0)
    1a54:	34818513          	addi	a0,gp,840 # 12b18 <__global_pointer$+0x348>
    1a58:	165000ef          	jal	23bc <printf>
    1a5c:	000147b7          	lui	a5,0x14
    1a60:	ba47a783          	lw	a5,-1116(a5) # 13ba4 <CSRA_EDGE>
    1a64:	0007a783          	lw	a5,0(a5)
    1a68:	fef42623          	sw	a5,-20(s0)
    1a6c:	fec42583          	lw	a1,-20(s0)
    1a70:	36018513          	addi	a0,gp,864 # 12b30 <__global_pointer$+0x360>
    1a74:	149000ef          	jal	23bc <printf>
    1a78:	000147b7          	lui	a5,0x14
    1a7c:	ba87a783          	lw	a5,-1112(a5) # 13ba8 <CSRA_POL>
    1a80:	0007a783          	lw	a5,0(a5)
    1a84:	fef42623          	sw	a5,-20(s0)
    1a88:	fec42583          	lw	a1,-20(s0)
    1a8c:	37818513          	addi	a0,gp,888 # 12b48 <__global_pointer$+0x378>
    1a90:	12d000ef          	jal	23bc <printf>
    1a94:	00000013          	nop
    1a98:	01c12083          	lw	ra,28(sp)
    1a9c:	01812403          	lw	s0,24(sp)
    1aa0:	02010113          	addi	sp,sp,32
    1aa4:	00008067          	ret

00001aa8 <gpio_set_addr>:
    1aa8:	fe010113          	addi	sp,sp,-32
    1aac:	00812e23          	sw	s0,28(sp)
    1ab0:	02010413          	addi	s0,sp,32
    1ab4:	fea42623          	sw	a0,-20(s0)
    1ab8:	000147b7          	lui	a5,0x14
    1abc:	fec42703          	lw	a4,-20(s0)
    1ac0:	b8e7a223          	sw	a4,-1148(a5) # 13b84 <ADDR_GPIO>
    1ac4:	000147b7          	lui	a5,0x14
    1ac8:	fec42703          	lw	a4,-20(s0)
    1acc:	b8e7a423          	sw	a4,-1144(a5) # 13b88 <CSRA_VERSION>
    1ad0:	fec42783          	lw	a5,-20(s0)
    1ad4:	00478713          	addi	a4,a5,4
    1ad8:	000147b7          	lui	a5,0x14
    1adc:	b8e7a623          	sw	a4,-1140(a5) # 13b8c <CSRA_NAME>
    1ae0:	fec42783          	lw	a5,-20(s0)
    1ae4:	01078713          	addi	a4,a5,16
    1ae8:	000147b7          	lui	a5,0x14
    1aec:	b8e7a823          	sw	a4,-1136(a5) # 13b90 <CSRA_DIR>
    1af0:	fec42783          	lw	a5,-20(s0)
    1af4:	01478713          	addi	a4,a5,20
    1af8:	000147b7          	lui	a5,0x14
    1afc:	b8e7aa23          	sw	a4,-1132(a5) # 13b94 <CSRA_INPUT>
    1b00:	fec42783          	lw	a5,-20(s0)
    1b04:	01878713          	addi	a4,a5,24
    1b08:	000147b7          	lui	a5,0x14
    1b0c:	b8e7ac23          	sw	a4,-1128(a5) # 13b98 <CSRA_OUTPUT>
    1b10:	fec42783          	lw	a5,-20(s0)
    1b14:	01c78713          	addi	a4,a5,28
    1b18:	000147b7          	lui	a5,0x14
    1b1c:	b8e7ae23          	sw	a4,-1124(a5) # 13b9c <CSRA_MASK>
    1b20:	fec42783          	lw	a5,-20(s0)
    1b24:	02078713          	addi	a4,a5,32
    1b28:	000147b7          	lui	a5,0x14
    1b2c:	bae7a023          	sw	a4,-1120(a5) # 13ba0 <CSRA_IRQ>
    1b30:	fec42783          	lw	a5,-20(s0)
    1b34:	02478713          	addi	a4,a5,36
    1b38:	000147b7          	lui	a5,0x14
    1b3c:	bae7a223          	sw	a4,-1116(a5) # 13ba4 <CSRA_EDGE>
    1b40:	fec42783          	lw	a5,-20(s0)
    1b44:	02878713          	addi	a4,a5,40
    1b48:	000147b7          	lui	a5,0x14
    1b4c:	bae7a423          	sw	a4,-1112(a5) # 13ba8 <CSRA_POL>
    1b50:	00000793          	li	a5,0
    1b54:	00078513          	mv	a0,a5
    1b58:	01c12403          	lw	s0,28(sp)
    1b5c:	02010113          	addi	sp,sp,32
    1b60:	00008067          	ret

00001b64 <gpio_get_addr>:
    1b64:	ff010113          	addi	sp,sp,-16
    1b68:	00812623          	sw	s0,12(sp)
    1b6c:	01010413          	addi	s0,sp,16
    1b70:	000147b7          	lui	a5,0x14
    1b74:	b847a783          	lw	a5,-1148(a5) # 13b84 <ADDR_GPIO>
    1b78:	00078513          	mv	a0,a5
    1b7c:	00c12403          	lw	s0,12(sp)
    1b80:	01010113          	addi	sp,sp,16
    1b84:	00008067          	ret

00001b88 <keypad_init>:
    1b88:	fd010113          	addi	sp,sp,-48
    1b8c:	02112623          	sw	ra,44(sp)
    1b90:	02812423          	sw	s0,40(sp)
    1b94:	03010413          	addi	s0,sp,48
    1b98:	fca42e23          	sw	a0,-36(s0)
    1b9c:	000147b7          	lui	a5,0x14
    1ba0:	fdc42703          	lw	a4,-36(s0)
    1ba4:	bae7a623          	sw	a4,-1108(a5) # 13bac <keypad_gpio_addr>
    1ba8:	fdc42503          	lw	a0,-36(s0)
    1bac:	efdff0ef          	jal	1aa8 <gpio_set_addr>
    1bb0:	00f00793          	li	a5,15
    1bb4:	fef42623          	sw	a5,-20(s0)
    1bb8:	00f00513          	li	a0,15
    1bbc:	b7dff0ef          	jal	1738 <gpio_write>
    1bc0:	00000693          	li	a3,0
    1bc4:	00000613          	li	a2,0
    1bc8:	00000593          	li	a1,0
    1bcc:	fec42503          	lw	a0,-20(s0)
    1bd0:	b9dff0ef          	jal	176c <gpio_init>
    1bd4:	00000013          	nop
    1bd8:	02c12083          	lw	ra,44(sp)
    1bdc:	02812403          	lw	s0,40(sp)
    1be0:	03010113          	addi	sp,sp,48
    1be4:	00008067          	ret

00001be8 <keypad_scan>:
    1be8:	fd010113          	addi	sp,sp,-48
    1bec:	02112623          	sw	ra,44(sp)
    1bf0:	02812423          	sw	s0,40(sp)
    1bf4:	03010413          	addi	s0,sp,48
    1bf8:	000147b7          	lui	a5,0x14
    1bfc:	bac7a783          	lw	a5,-1108(a5) # 13bac <keypad_gpio_addr>
    1c00:	00078513          	mv	a0,a5
    1c04:	ea5ff0ef          	jal	1aa8 <gpio_set_addr>
    1c08:	fe042623          	sw	zero,-20(s0)
    1c0c:	0c80006f          	j	1cd4 <keypad_scan+0xec>
    1c10:	fec42783          	lw	a5,-20(s0)
    1c14:	00100713          	li	a4,1
    1c18:	00f717b3          	sll	a5,a4,a5
    1c1c:	fff7c793          	not	a5,a5
    1c20:	00f7f793          	andi	a5,a5,15
    1c24:	fef42223          	sw	a5,-28(s0)
    1c28:	fe442503          	lw	a0,-28(s0)
    1c2c:	b0dff0ef          	jal	1738 <gpio_write>
    1c30:	06400793          	li	a5,100
    1c34:	fcf42c23          	sw	a5,-40(s0)
    1c38:	00000013          	nop
    1c3c:	fd842783          	lw	a5,-40(s0)
    1c40:	fff78713          	addi	a4,a5,-1
    1c44:	fce42c23          	sw	a4,-40(s0)
    1c48:	fe079ae3          	bnez	a5,1c3c <keypad_scan+0x54>
    1c4c:	abdff0ef          	jal	1708 <gpio_read>
    1c50:	fea42023          	sw	a0,-32(s0)
    1c54:	fe042783          	lw	a5,-32(s0)
    1c58:	0047d793          	srli	a5,a5,0x4
    1c5c:	00f7f793          	andi	a5,a5,15
    1c60:	fcf42e23          	sw	a5,-36(s0)
    1c64:	fdc42703          	lw	a4,-36(s0)
    1c68:	00f00793          	li	a5,15
    1c6c:	04f70e63          	beq	a4,a5,1cc8 <keypad_scan+0xe0>
    1c70:	fe042423          	sw	zero,-24(s0)
    1c74:	0480006f          	j	1cbc <keypad_scan+0xd4>
    1c78:	fe842783          	lw	a5,-24(s0)
    1c7c:	00100713          	li	a4,1
    1c80:	00f717b3          	sll	a5,a4,a5
    1c84:	00078713          	mv	a4,a5
    1c88:	fdc42783          	lw	a5,-36(s0)
    1c8c:	00f777b3          	and	a5,a4,a5
    1c90:	02079063          	bnez	a5,1cb0 <keypad_scan+0xc8>
    1c94:	00f00513          	li	a0,15
    1c98:	aa1ff0ef          	jal	1738 <gpio_write>
    1c9c:	fe842783          	lw	a5,-24(s0)
    1ca0:	00279713          	slli	a4,a5,0x2
    1ca4:	fec42783          	lw	a5,-20(s0)
    1ca8:	00f707b3          	add	a5,a4,a5
    1cac:	0400006f          	j	1cec <keypad_scan+0x104>
    1cb0:	fe842783          	lw	a5,-24(s0)
    1cb4:	00178793          	addi	a5,a5,1
    1cb8:	fef42423          	sw	a5,-24(s0)
    1cbc:	fe842703          	lw	a4,-24(s0)
    1cc0:	00300793          	li	a5,3
    1cc4:	fae7dae3          	bge	a5,a4,1c78 <keypad_scan+0x90>
    1cc8:	fec42783          	lw	a5,-20(s0)
    1ccc:	00178793          	addi	a5,a5,1
    1cd0:	fef42623          	sw	a5,-20(s0)
    1cd4:	fec42703          	lw	a4,-20(s0)
    1cd8:	00300793          	li	a5,3
    1cdc:	f2e7dae3          	bge	a5,a4,1c10 <keypad_scan+0x28>
    1ce0:	00f00513          	li	a0,15
    1ce4:	a55ff0ef          	jal	1738 <gpio_write>
    1ce8:	fff00793          	li	a5,-1
    1cec:	00078513          	mv	a0,a5
    1cf0:	02c12083          	lw	ra,44(sp)
    1cf4:	02812403          	lw	s0,40(sp)
    1cf8:	03010113          	addi	sp,sp,48
    1cfc:	00008067          	ret

00001d00 <keypad_get_char>:
    1d00:	fe010113          	addi	sp,sp,-32
    1d04:	00112e23          	sw	ra,28(sp)
    1d08:	00812c23          	sw	s0,24(sp)
    1d0c:	02010413          	addi	s0,sp,32
    1d10:	ed9ff0ef          	jal	1be8 <keypad_scan>
    1d14:	fea42623          	sw	a0,-20(s0)
    1d18:	fec42783          	lw	a5,-20(s0)
    1d1c:	0607c263          	bltz	a5,1d80 <keypad_get_char+0x80>
    1d20:	fec42703          	lw	a4,-20(s0)
    1d24:	00f00793          	li	a5,15
    1d28:	04e7cc63          	blt	a5,a4,1d80 <keypad_get_char+0x80>
    1d2c:	fec42783          	lw	a5,-20(s0)
    1d30:	41f7d713          	srai	a4,a5,0x1f
    1d34:	00377713          	andi	a4,a4,3
    1d38:	00f707b3          	add	a5,a4,a5
    1d3c:	4027d793          	srai	a5,a5,0x2
    1d40:	fef42423          	sw	a5,-24(s0)
    1d44:	fec42703          	lw	a4,-20(s0)
    1d48:	41f75793          	srai	a5,a4,0x1f
    1d4c:	01e7d793          	srli	a5,a5,0x1e
    1d50:	00f70733          	add	a4,a4,a5
    1d54:	00377713          	andi	a4,a4,3
    1d58:	40f707b3          	sub	a5,a4,a5
    1d5c:	fef42223          	sw	a5,-28(s0)
    1d60:	39018713          	addi	a4,gp,912 # 12b60 <keypad_map>
    1d64:	fe442783          	lw	a5,-28(s0)
    1d68:	00279793          	slli	a5,a5,0x2
    1d6c:	00f70733          	add	a4,a4,a5
    1d70:	fe842783          	lw	a5,-24(s0)
    1d74:	00f707b3          	add	a5,a4,a5
    1d78:	0007c783          	lbu	a5,0(a5)
    1d7c:	0080006f          	j	1d84 <keypad_get_char+0x84>
    1d80:	00000793          	li	a5,0
    1d84:	00078513          	mv	a0,a5
    1d88:	01c12083          	lw	ra,28(sp)
    1d8c:	01812403          	lw	s0,24(sp)
    1d90:	02010113          	addi	sp,sp,32
    1d94:	00008067          	ret

00001d98 <delay_us>:
    1d98:	fd010113          	addi	sp,sp,-48
    1d9c:	02812623          	sw	s0,44(sp)
    1da0:	03010413          	addi	s0,sp,48
    1da4:	fca42e23          	sw	a0,-36(s0)
    1da8:	fdc42703          	lw	a4,-36(s0)
    1dac:	06400793          	li	a5,100
    1db0:	02f707b3          	mul	a5,a4,a5
    1db4:	fef42623          	sw	a5,-20(s0)
    1db8:	00000013          	nop
    1dbc:	fec42783          	lw	a5,-20(s0)
    1dc0:	fff78713          	addi	a4,a5,-1
    1dc4:	fee42623          	sw	a4,-20(s0)
    1dc8:	fe079ae3          	bnez	a5,1dbc <delay_us+0x24>
    1dcc:	00000013          	nop
    1dd0:	00000013          	nop
    1dd4:	02c12403          	lw	s0,44(sp)
    1dd8:	03010113          	addi	sp,sp,48
    1ddc:	00008067          	ret

00001de0 <i2c_set_addr>:
    1de0:	fe010113          	addi	sp,sp,-32
    1de4:	00812e23          	sw	s0,28(sp)
    1de8:	02010413          	addi	s0,sp,32
    1dec:	fea42623          	sw	a0,-20(s0)
    1df0:	000147b7          	lui	a5,0x14
    1df4:	fec42703          	lw	a4,-20(s0)
    1df8:	bae7a823          	sw	a4,-1104(a5) # 13bb0 <I2C_BASE_ADDR>
    1dfc:	000147b7          	lui	a5,0x14
    1e00:	fec42703          	lw	a4,-20(s0)
    1e04:	bae7aa23          	sw	a4,-1100(a5) # 13bb4 <I2C_CONTROL>
    1e08:	fec42783          	lw	a5,-20(s0)
    1e0c:	00478713          	addi	a4,a5,4
    1e10:	000147b7          	lui	a5,0x14
    1e14:	bae7ac23          	sw	a4,-1096(a5) # 13bb8 <I2C_DEV_ADDR>
    1e18:	fec42783          	lw	a5,-20(s0)
    1e1c:	00878713          	addi	a4,a5,8
    1e20:	000147b7          	lui	a5,0x14
    1e24:	bae7ae23          	sw	a4,-1092(a5) # 13bbc <I2C_MEM_ADDR>
    1e28:	fec42783          	lw	a5,-20(s0)
    1e2c:	00c78713          	addi	a4,a5,12
    1e30:	000147b7          	lui	a5,0x14
    1e34:	bce7a023          	sw	a4,-1088(a5) # 13bc0 <I2C_WR_DATA>
    1e38:	fec42783          	lw	a5,-20(s0)
    1e3c:	01078713          	addi	a4,a5,16
    1e40:	000147b7          	lui	a5,0x14
    1e44:	bce7a223          	sw	a4,-1084(a5) # 13bc4 <I2C_RD_DATA>
    1e48:	fec42783          	lw	a5,-20(s0)
    1e4c:	01478713          	addi	a4,a5,20
    1e50:	000147b7          	lui	a5,0x14
    1e54:	bce7a423          	sw	a4,-1080(a5) # 13bc8 <I2C_STATUS>
    1e58:	00000013          	nop
    1e5c:	01c12403          	lw	s0,28(sp)
    1e60:	02010113          	addi	sp,sp,32
    1e64:	00008067          	ret

00001e68 <i2c_get_addr>:
    1e68:	ff010113          	addi	sp,sp,-16
    1e6c:	00812623          	sw	s0,12(sp)
    1e70:	01010413          	addi	s0,sp,16
    1e74:	000147b7          	lui	a5,0x14
    1e78:	bb07a783          	lw	a5,-1104(a5) # 13bb0 <I2C_BASE_ADDR>
    1e7c:	00078513          	mv	a0,a5
    1e80:	00c12403          	lw	s0,12(sp)
    1e84:	01010113          	addi	sp,sp,16
    1e88:	00008067          	ret

00001e8c <i2c_wait_ready>:
    1e8c:	fe010113          	addi	sp,sp,-32
    1e90:	00112e23          	sw	ra,28(sp)
    1e94:	00812c23          	sw	s0,24(sp)
    1e98:	02010413          	addi	s0,sp,32
    1e9c:	000027b7          	lui	a5,0x2
    1ea0:	71078793          	addi	a5,a5,1808 # 2710 <_vfprintf_r+0x304>
    1ea4:	fef42423          	sw	a5,-24(s0)
    1ea8:	000147b7          	lui	a5,0x14
    1eac:	bc87a783          	lw	a5,-1080(a5) # 13bc8 <I2C_STATUS>
    1eb0:	0007a783          	lw	a5,0(a5)
    1eb4:	fef42623          	sw	a5,-20(s0)
    1eb8:	fec42783          	lw	a5,-20(s0)
    1ebc:	0017f793          	andi	a5,a5,1
    1ec0:	02079063          	bnez	a5,1ee0 <i2c_wait_ready+0x54>
    1ec4:	fec42783          	lw	a5,-20(s0)
    1ec8:	0027f793          	andi	a5,a5,2
    1ecc:	00078663          	beqz	a5,1ed8 <i2c_wait_ready+0x4c>
    1ed0:	fff00793          	li	a5,-1
    1ed4:	02c0006f          	j	1f00 <i2c_wait_ready+0x74>
    1ed8:	00000793          	li	a5,0
    1edc:	0240006f          	j	1f00 <i2c_wait_ready+0x74>
    1ee0:	00a00513          	li	a0,10
    1ee4:	eb5ff0ef          	jal	1d98 <delay_us>
    1ee8:	fe842783          	lw	a5,-24(s0)
    1eec:	fff78793          	addi	a5,a5,-1
    1ef0:	fef42423          	sw	a5,-24(s0)
    1ef4:	fe842783          	lw	a5,-24(s0)
    1ef8:	fa0798e3          	bnez	a5,1ea8 <i2c_wait_ready+0x1c>
    1efc:	fff00793          	li	a5,-1
    1f00:	00078513          	mv	a0,a5
    1f04:	01c12083          	lw	ra,28(sp)
    1f08:	01812403          	lw	s0,24(sp)
    1f0c:	02010113          	addi	sp,sp,32
    1f10:	00008067          	ret

00001f14 <i2c_eeprom_write_byte>:
    1f14:	fd010113          	addi	sp,sp,-48
    1f18:	02112623          	sw	ra,44(sp)
    1f1c:	02812423          	sw	s0,40(sp)
    1f20:	03010413          	addi	s0,sp,48
    1f24:	00050793          	mv	a5,a0
    1f28:	00058713          	mv	a4,a1
    1f2c:	fcf40fa3          	sb	a5,-33(s0)
    1f30:	00070793          	mv	a5,a4
    1f34:	fcf40f23          	sb	a5,-34(s0)
    1f38:	000147b7          	lui	a5,0x14
    1f3c:	bb87a783          	lw	a5,-1096(a5) # 13bb8 <I2C_DEV_ADDR>
    1f40:	00078713          	mv	a4,a5
    1f44:	05000793          	li	a5,80
    1f48:	00f72023          	sw	a5,0(a4)
    1f4c:	000147b7          	lui	a5,0x14
    1f50:	bbc7a783          	lw	a5,-1092(a5) # 13bbc <I2C_MEM_ADDR>
    1f54:	00078713          	mv	a4,a5
    1f58:	fdf44783          	lbu	a5,-33(s0)
    1f5c:	00f72023          	sw	a5,0(a4)
    1f60:	000147b7          	lui	a5,0x14
    1f64:	bc07a783          	lw	a5,-1088(a5) # 13bc0 <I2C_WR_DATA>
    1f68:	00078713          	mv	a4,a5
    1f6c:	fde44783          	lbu	a5,-34(s0)
    1f70:	00f72023          	sw	a5,0(a4)
    1f74:	000147b7          	lui	a5,0x14
    1f78:	bb47a783          	lw	a5,-1100(a5) # 13bb4 <I2C_CONTROL>
    1f7c:	00078713          	mv	a4,a5
    1f80:	00100793          	li	a5,1
    1f84:	00f72023          	sw	a5,0(a4)
    1f88:	f05ff0ef          	jal	1e8c <i2c_wait_ready>
    1f8c:	00050793          	mv	a5,a0
    1f90:	00078663          	beqz	a5,1f9c <i2c_eeprom_write_byte+0x88>
    1f94:	fff00793          	li	a5,-1
    1f98:	0140006f          	j	1fac <i2c_eeprom_write_byte+0x98>
    1f9c:	000017b7          	lui	a5,0x1
    1fa0:	38878513          	addi	a0,a5,904 # 1388 <uart_put_string+0x8>
    1fa4:	df5ff0ef          	jal	1d98 <delay_us>
    1fa8:	00000793          	li	a5,0
    1fac:	00078513          	mv	a0,a5
    1fb0:	02c12083          	lw	ra,44(sp)
    1fb4:	02812403          	lw	s0,40(sp)
    1fb8:	03010113          	addi	sp,sp,48
    1fbc:	00008067          	ret

00001fc0 <i2c_eeprom_read_byte>:
    1fc0:	fd010113          	addi	sp,sp,-48
    1fc4:	02112623          	sw	ra,44(sp)
    1fc8:	02812423          	sw	s0,40(sp)
    1fcc:	03010413          	addi	s0,sp,48
    1fd0:	00050793          	mv	a5,a0
    1fd4:	fcb42c23          	sw	a1,-40(s0)
    1fd8:	fcf40fa3          	sb	a5,-33(s0)
    1fdc:	000147b7          	lui	a5,0x14
    1fe0:	bb87a783          	lw	a5,-1096(a5) # 13bb8 <I2C_DEV_ADDR>
    1fe4:	00078713          	mv	a4,a5
    1fe8:	05000793          	li	a5,80
    1fec:	00f72023          	sw	a5,0(a4)
    1ff0:	000147b7          	lui	a5,0x14
    1ff4:	bbc7a783          	lw	a5,-1092(a5) # 13bbc <I2C_MEM_ADDR>
    1ff8:	00078713          	mv	a4,a5
    1ffc:	fdf44783          	lbu	a5,-33(s0)
    2000:	00f72023          	sw	a5,0(a4)
    2004:	000147b7          	lui	a5,0x14
    2008:	bc07a783          	lw	a5,-1088(a5) # 13bc0 <I2C_WR_DATA>
    200c:	0007a023          	sw	zero,0(a5)
    2010:	000147b7          	lui	a5,0x14
    2014:	bb47a783          	lw	a5,-1100(a5) # 13bb4 <I2C_CONTROL>
    2018:	00078713          	mv	a4,a5
    201c:	00100793          	li	a5,1
    2020:	00f72023          	sw	a5,0(a4)
    2024:	e69ff0ef          	jal	1e8c <i2c_wait_ready>
    2028:	00050793          	mv	a5,a0
    202c:	00078663          	beqz	a5,2038 <i2c_eeprom_read_byte+0x78>
    2030:	fff00793          	li	a5,-1
    2034:	06c0006f          	j	20a0 <i2c_eeprom_read_byte+0xe0>
    2038:	3e800513          	li	a0,1000
    203c:	d5dff0ef          	jal	1d98 <delay_us>
    2040:	000147b7          	lui	a5,0x14
    2044:	bb87a783          	lw	a5,-1096(a5) # 13bb8 <I2C_DEV_ADDR>
    2048:	00078713          	mv	a4,a5
    204c:	05000793          	li	a5,80
    2050:	00f72023          	sw	a5,0(a4)
    2054:	000147b7          	lui	a5,0x14
    2058:	bb47a783          	lw	a5,-1100(a5) # 13bb4 <I2C_CONTROL>
    205c:	00078713          	mv	a4,a5
    2060:	00300793          	li	a5,3
    2064:	00f72023          	sw	a5,0(a4)
    2068:	e25ff0ef          	jal	1e8c <i2c_wait_ready>
    206c:	00050793          	mv	a5,a0
    2070:	00078663          	beqz	a5,207c <i2c_eeprom_read_byte+0xbc>
    2074:	fff00793          	li	a5,-1
    2078:	0280006f          	j	20a0 <i2c_eeprom_read_byte+0xe0>
    207c:	000147b7          	lui	a5,0x14
    2080:	bc47a783          	lw	a5,-1084(a5) # 13bc4 <I2C_RD_DATA>
    2084:	0007a783          	lw	a5,0(a5)
    2088:	fef42623          	sw	a5,-20(s0)
    208c:	fec42783          	lw	a5,-20(s0)
    2090:	0ff7f713          	zext.b	a4,a5
    2094:	fd842783          	lw	a5,-40(s0)
    2098:	00e78023          	sb	a4,0(a5)
    209c:	00000793          	li	a5,0
    20a0:	00078513          	mv	a0,a5
    20a4:	02c12083          	lw	ra,44(sp)
    20a8:	02812403          	lw	s0,40(sp)
    20ac:	03010113          	addi	sp,sp,48
    20b0:	00008067          	ret

000020b4 <i2c_eeprom_write_bytes>:
    20b4:	fd010113          	addi	sp,sp,-48
    20b8:	02112623          	sw	ra,44(sp)
    20bc:	02812423          	sw	s0,40(sp)
    20c0:	03010413          	addi	s0,sp,48
    20c4:	00050793          	mv	a5,a0
    20c8:	fcb42c23          	sw	a1,-40(s0)
    20cc:	00060713          	mv	a4,a2
    20d0:	fcf40fa3          	sb	a5,-33(s0)
    20d4:	00070793          	mv	a5,a4
    20d8:	fcf40f23          	sb	a5,-34(s0)
    20dc:	fde44703          	lbu	a4,-34(s0)
    20e0:	00400793          	li	a5,4
    20e4:	00e7f663          	bgeu	a5,a4,20f0 <i2c_eeprom_write_bytes+0x3c>
    20e8:	fff00793          	li	a5,-1
    20ec:	0680006f          	j	2154 <i2c_eeprom_write_bytes+0xa0>
    20f0:	fe0407a3          	sb	zero,-17(s0)
    20f4:	0500006f          	j	2144 <i2c_eeprom_write_bytes+0x90>
    20f8:	fdf44783          	lbu	a5,-33(s0)
    20fc:	00078713          	mv	a4,a5
    2100:	fef44783          	lbu	a5,-17(s0)
    2104:	00f707b3          	add	a5,a4,a5
    2108:	0ff7f693          	zext.b	a3,a5
    210c:	fef44783          	lbu	a5,-17(s0)
    2110:	fd842703          	lw	a4,-40(s0)
    2114:	00f707b3          	add	a5,a4,a5
    2118:	0007c783          	lbu	a5,0(a5)
    211c:	00078593          	mv	a1,a5
    2120:	00068513          	mv	a0,a3
    2124:	df1ff0ef          	jal	1f14 <i2c_eeprom_write_byte>
    2128:	00050793          	mv	a5,a0
    212c:	00078663          	beqz	a5,2138 <i2c_eeprom_write_bytes+0x84>
    2130:	fff00793          	li	a5,-1
    2134:	0200006f          	j	2154 <i2c_eeprom_write_bytes+0xa0>
    2138:	fef44783          	lbu	a5,-17(s0)
    213c:	00178793          	addi	a5,a5,1
    2140:	fef407a3          	sb	a5,-17(s0)
    2144:	fef44703          	lbu	a4,-17(s0)
    2148:	fde44783          	lbu	a5,-34(s0)
    214c:	faf766e3          	bltu	a4,a5,20f8 <i2c_eeprom_write_bytes+0x44>
    2150:	00000793          	li	a5,0
    2154:	00078513          	mv	a0,a5
    2158:	02c12083          	lw	ra,44(sp)
    215c:	02812403          	lw	s0,40(sp)
    2160:	03010113          	addi	sp,sp,48
    2164:	00008067          	ret

00002168 <i2c_eeprom_read_bytes>:
    2168:	fd010113          	addi	sp,sp,-48
    216c:	02112623          	sw	ra,44(sp)
    2170:	02812423          	sw	s0,40(sp)
    2174:	03010413          	addi	s0,sp,48
    2178:	00050793          	mv	a5,a0
    217c:	fcb42c23          	sw	a1,-40(s0)
    2180:	00060713          	mv	a4,a2
    2184:	fcf40fa3          	sb	a5,-33(s0)
    2188:	00070793          	mv	a5,a4
    218c:	fcf40f23          	sb	a5,-34(s0)
    2190:	fe0407a3          	sb	zero,-17(s0)
    2194:	04c0006f          	j	21e0 <i2c_eeprom_read_bytes+0x78>
    2198:	fdf44783          	lbu	a5,-33(s0)
    219c:	00078713          	mv	a4,a5
    21a0:	fef44783          	lbu	a5,-17(s0)
    21a4:	00f707b3          	add	a5,a4,a5
    21a8:	0ff7f693          	zext.b	a3,a5
    21ac:	fef44783          	lbu	a5,-17(s0)
    21b0:	fd842703          	lw	a4,-40(s0)
    21b4:	00f707b3          	add	a5,a4,a5
    21b8:	00078593          	mv	a1,a5
    21bc:	00068513          	mv	a0,a3
    21c0:	e01ff0ef          	jal	1fc0 <i2c_eeprom_read_byte>
    21c4:	00050793          	mv	a5,a0
    21c8:	00078663          	beqz	a5,21d4 <i2c_eeprom_read_bytes+0x6c>
    21cc:	fff00793          	li	a5,-1
    21d0:	0200006f          	j	21f0 <i2c_eeprom_read_bytes+0x88>
    21d4:	fef44783          	lbu	a5,-17(s0)
    21d8:	00178793          	addi	a5,a5,1
    21dc:	fef407a3          	sb	a5,-17(s0)
    21e0:	fef44703          	lbu	a4,-17(s0)
    21e4:	fde44783          	lbu	a5,-34(s0)
    21e8:	faf768e3          	bltu	a4,a5,2198 <i2c_eeprom_read_bytes+0x30>
    21ec:	00000793          	li	a5,0
    21f0:	00078513          	mv	a0,a5
    21f4:	02c12083          	lw	ra,44(sp)
    21f8:	02812403          	lw	s0,40(sp)
    21fc:	03010113          	addi	sp,sp,48
    2200:	00008067          	ret

00002204 <_close>:
    2204:	fe010113          	addi	sp,sp,-32
    2208:	00812e23          	sw	s0,28(sp)
    220c:	02010413          	addi	s0,sp,32
    2210:	fea42623          	sw	a0,-20(s0)
    2214:	fff00793          	li	a5,-1
    2218:	00078513          	mv	a0,a5
    221c:	01c12403          	lw	s0,28(sp)
    2220:	02010113          	addi	sp,sp,32
    2224:	00008067          	ret

00002228 <_lseek>:
    2228:	fe010113          	addi	sp,sp,-32
    222c:	00812e23          	sw	s0,28(sp)
    2230:	02010413          	addi	s0,sp,32
    2234:	fea42623          	sw	a0,-20(s0)
    2238:	feb42423          	sw	a1,-24(s0)
    223c:	fec42223          	sw	a2,-28(s0)
    2240:	00000793          	li	a5,0
    2244:	00078513          	mv	a0,a5
    2248:	01c12403          	lw	s0,28(sp)
    224c:	02010113          	addi	sp,sp,32
    2250:	00008067          	ret

00002254 <_read>:
    2254:	fe010113          	addi	sp,sp,-32
    2258:	00812e23          	sw	s0,28(sp)
    225c:	02010413          	addi	s0,sp,32
    2260:	fea42623          	sw	a0,-20(s0)
    2264:	feb42423          	sw	a1,-24(s0)
    2268:	fec42223          	sw	a2,-28(s0)
    226c:	00000793          	li	a5,0
    2270:	00078513          	mv	a0,a5
    2274:	01c12403          	lw	s0,28(sp)
    2278:	02010113          	addi	sp,sp,32
    227c:	00008067          	ret

00002280 <_write>:
    2280:	fe010113          	addi	sp,sp,-32
    2284:	00812e23          	sw	s0,28(sp)
    2288:	02010413          	addi	s0,sp,32
    228c:	fea42623          	sw	a0,-20(s0)
    2290:	feb42423          	sw	a1,-24(s0)
    2294:	fec42223          	sw	a2,-28(s0)
    2298:	fe442783          	lw	a5,-28(s0)
    229c:	00078513          	mv	a0,a5
    22a0:	01c12403          	lw	s0,28(sp)
    22a4:	02010113          	addi	sp,sp,32
    22a8:	00008067          	ret

000022ac <_fstat>:
    22ac:	fe010113          	addi	sp,sp,-32
    22b0:	00812e23          	sw	s0,28(sp)
    22b4:	02010413          	addi	s0,sp,32
    22b8:	fea42623          	sw	a0,-20(s0)
    22bc:	feb42423          	sw	a1,-24(s0)
    22c0:	fff00793          	li	a5,-1
    22c4:	00078513          	mv	a0,a5
    22c8:	01c12403          	lw	s0,28(sp)
    22cc:	02010113          	addi	sp,sp,32
    22d0:	00008067          	ret

000022d4 <_isatty>:
    22d4:	fe010113          	addi	sp,sp,-32
    22d8:	00812e23          	sw	s0,28(sp)
    22dc:	02010413          	addi	s0,sp,32
    22e0:	fea42623          	sw	a0,-20(s0)
    22e4:	00000793          	li	a5,0
    22e8:	00078513          	mv	a0,a5
    22ec:	01c12403          	lw	s0,28(sp)
    22f0:	02010113          	addi	sp,sp,32
    22f4:	00008067          	ret

000022f8 <_sbrk>:
    22f8:	fe010113          	addi	sp,sp,-32
    22fc:	00812e23          	sw	s0,28(sp)
    2300:	02010413          	addi	s0,sp,32
    2304:	fea42623          	sw	a0,-20(s0)
    2308:	fff00793          	li	a5,-1
    230c:	00078513          	mv	a0,a5
    2310:	01c12403          	lw	s0,28(sp)
    2314:	02010113          	addi	sp,sp,32
    2318:	00008067          	ret

0000231c <_exit>:
    231c:	fe010113          	addi	sp,sp,-32
    2320:	00812e23          	sw	s0,28(sp)
    2324:	02010413          	addi	s0,sp,32
    2328:	fea42623          	sw	a0,-20(s0)
    232c:	00000013          	nop
    2330:	ffdff06f          	j	232c <_exit+0x10>

00002334 <_kill>:
    2334:	fe010113          	addi	sp,sp,-32
    2338:	00812e23          	sw	s0,28(sp)
    233c:	02010413          	addi	s0,sp,32
    2340:	fea42623          	sw	a0,-20(s0)
    2344:	feb42423          	sw	a1,-24(s0)
    2348:	fff00793          	li	a5,-1
    234c:	00078513          	mv	a0,a5
    2350:	01c12403          	lw	s0,28(sp)
    2354:	02010113          	addi	sp,sp,32
    2358:	00008067          	ret

0000235c <_getpid>:
    235c:	ff010113          	addi	sp,sp,-16
    2360:	00812623          	sw	s0,12(sp)
    2364:	01010413          	addi	s0,sp,16
    2368:	00100793          	li	a5,1
    236c:	00078513          	mv	a0,a5
    2370:	00c12403          	lw	s0,12(sp)
    2374:	01010113          	addi	sp,sp,16
    2378:	00008067          	ret

0000237c <_printf_r>:
    237c:	fc010113          	addi	sp,sp,-64
    2380:	02c12423          	sw	a2,40(sp)
    2384:	02d12623          	sw	a3,44(sp)
    2388:	02e12823          	sw	a4,48(sp)
    238c:	02f12a23          	sw	a5,52(sp)
    2390:	03012c23          	sw	a6,56(sp)
    2394:	03112e23          	sw	a7,60(sp)
    2398:	00058613          	mv	a2,a1
    239c:	00852583          	lw	a1,8(a0) # 90040008 <_memory_end+0x90020008>
    23a0:	02810693          	addi	a3,sp,40
    23a4:	00112e23          	sw	ra,28(sp)
    23a8:	00d12623          	sw	a3,12(sp)
    23ac:	060000ef          	jal	240c <_vfprintf_r>
    23b0:	01c12083          	lw	ra,28(sp)
    23b4:	04010113          	addi	sp,sp,64
    23b8:	00008067          	ret

000023bc <printf>:
    23bc:	00014337          	lui	t1,0x14
    23c0:	bcc32303          	lw	t1,-1076(t1) # 13bcc <_impure_ptr>
    23c4:	fc010113          	addi	sp,sp,-64
    23c8:	02c12423          	sw	a2,40(sp)
    23cc:	02d12623          	sw	a3,44(sp)
    23d0:	02b12223          	sw	a1,36(sp)
    23d4:	02e12823          	sw	a4,48(sp)
    23d8:	02f12a23          	sw	a5,52(sp)
    23dc:	03012c23          	sw	a6,56(sp)
    23e0:	03112e23          	sw	a7,60(sp)
    23e4:	00832583          	lw	a1,8(t1)
    23e8:	02410693          	addi	a3,sp,36
    23ec:	00050613          	mv	a2,a0
    23f0:	00030513          	mv	a0,t1
    23f4:	00112e23          	sw	ra,28(sp)
    23f8:	00d12623          	sw	a3,12(sp)
    23fc:	010000ef          	jal	240c <_vfprintf_r>
    2400:	01c12083          	lw	ra,28(sp)
    2404:	04010113          	addi	sp,sp,64
    2408:	00008067          	ret

0000240c <_vfprintf_r>:
    240c:	e3010113          	addi	sp,sp,-464
    2410:	1c112623          	sw	ra,460(sp)
    2414:	1c812423          	sw	s0,456(sp)
    2418:	1c912223          	sw	s1,452(sp)
    241c:	1b612823          	sw	s6,432(sp)
    2420:	00058493          	mv	s1,a1
    2424:	00060b13          	mv	s6,a2
    2428:	00d12a23          	sw	a3,20(sp)
    242c:	00050413          	mv	s0,a0
    2430:	00a12423          	sw	a0,8(sp)
    2434:	1f5030ef          	jal	5e28 <_localeconv_r>
    2438:	00052703          	lw	a4,0(a0)
    243c:	00070513          	mv	a0,a4
    2440:	02e12823          	sw	a4,48(sp)
    2444:	014040ef          	jal	6458 <strlen>
    2448:	02a12623          	sw	a0,44(sp)
    244c:	0c012823          	sw	zero,208(sp)
    2450:	0c012a23          	sw	zero,212(sp)
    2454:	0c012c23          	sw	zero,216(sp)
    2458:	0c012e23          	sw	zero,220(sp)
    245c:	00040863          	beqz	s0,246c <_vfprintf_r+0x60>
    2460:	03442703          	lw	a4,52(s0)
    2464:	00071463          	bnez	a4,246c <_vfprintf_r+0x60>
    2468:	0d50106f          	j	3d3c <_vfprintf_r+0x1930>
    246c:	00c49683          	lh	a3,12(s1)
    2470:	0644a703          	lw	a4,100(s1)
    2474:	01269613          	slli	a2,a3,0x12
    2478:	02064063          	bltz	a2,2498 <_vfprintf_r+0x8c>
    247c:	ffffe637          	lui	a2,0xffffe
    2480:	fff60613          	addi	a2,a2,-1 # ffffdfff <_memory_end+0xfffddfff>
    2484:	000025b7          	lui	a1,0x2
    2488:	00b6e6b3          	or	a3,a3,a1
    248c:	00c77733          	and	a4,a4,a2
    2490:	00d49623          	sh	a3,12(s1)
    2494:	06e4a223          	sw	a4,100(s1)
    2498:	01271693          	slli	a3,a4,0x12
    249c:	0006d463          	bgez	a3,24a4 <_vfprintf_r+0x98>
    24a0:	38c0206f          	j	482c <_vfprintf_r+0x2420>
    24a4:	00c49703          	lh	a4,12(s1)
    24a8:	00877693          	andi	a3,a4,8
    24ac:	2e068e63          	beqz	a3,27a8 <_vfprintf_r+0x39c>
    24b0:	0104a683          	lw	a3,16(s1)
    24b4:	2e068a63          	beqz	a3,27a8 <_vfprintf_r+0x39c>
    24b8:	01a77713          	andi	a4,a4,26
    24bc:	00a00693          	li	a3,10
    24c0:	30d70663          	beq	a4,a3,27cc <_vfprintf_r+0x3c0>
    24c4:	1b312e23          	sw	s3,444(sp)
    24c8:	1b412c23          	sw	s4,440(sp)
    24cc:	1ba12023          	sw	s10,416(sp)
    24d0:	1d212023          	sw	s2,448(sp)
    24d4:	1b512a23          	sw	s5,436(sp)
    24d8:	1b712623          	sw	s7,428(sp)
    24dc:	1b812423          	sw	s8,424(sp)
    24e0:	1b912223          	sw	s9,420(sp)
    24e4:	19b12e23          	sw	s11,412(sp)
    24e8:	000b0d13          	mv	s10,s6
    24ec:	55418793          	addi	a5,gp,1364 # 12d24 <keypad_map+0x1c4>
    24f0:	000d4703          	lbu	a4,0(s10)
    24f4:	0ec10993          	addi	s3,sp,236
    24f8:	0d312223          	sw	s3,196(sp)
    24fc:	0c012623          	sw	zero,204(sp)
    2500:	0c012423          	sw	zero,200(sp)
    2504:	02012023          	sw	zero,32(sp)
    2508:	02012a23          	sw	zero,52(sp)
    250c:	04012023          	sw	zero,64(sp)
    2510:	02012e23          	sw	zero,60(sp)
    2514:	04012423          	sw	zero,72(sp)
    2518:	04012223          	sw	zero,68(sp)
    251c:	00012623          	sw	zero,12(sp)
    2520:	00f12c23          	sw	a5,24(sp)
    2524:	00098413          	mv	s0,s3
    2528:	75818a13          	addi	s4,gp,1880 # 12f28 <zeroes.0>
    252c:	22070063          	beqz	a4,274c <_vfprintf_r+0x340>
    2530:	000d0913          	mv	s2,s10
    2534:	02500693          	li	a3,37
    2538:	3ed70a63          	beq	a4,a3,292c <_vfprintf_r+0x520>
    253c:	00194703          	lbu	a4,1(s2)
    2540:	00190913          	addi	s2,s2,1
    2544:	fe071ae3          	bnez	a4,2538 <_vfprintf_r+0x12c>
    2548:	41a90ab3          	sub	s5,s2,s10
    254c:	21a90063          	beq	s2,s10,274c <_vfprintf_r+0x340>
    2550:	0cc12683          	lw	a3,204(sp)
    2554:	0c812703          	lw	a4,200(sp)
    2558:	01a42023          	sw	s10,0(s0)
    255c:	015686b3          	add	a3,a3,s5
    2560:	00170713          	addi	a4,a4,1
    2564:	01542223          	sw	s5,4(s0)
    2568:	0cd12623          	sw	a3,204(sp)
    256c:	0ce12423          	sw	a4,200(sp)
    2570:	00700693          	li	a3,7
    2574:	00840413          	addi	s0,s0,8
    2578:	3ce6c263          	blt	a3,a4,293c <_vfprintf_r+0x530>
    257c:	00c12783          	lw	a5,12(sp)
    2580:	00094703          	lbu	a4,0(s2)
    2584:	015787b3          	add	a5,a5,s5
    2588:	00f12623          	sw	a5,12(sp)
    258c:	1c070063          	beqz	a4,274c <_vfprintf_r+0x340>
    2590:	00194883          	lbu	a7,1(s2)
    2594:	0a0103a3          	sb	zero,167(sp)
    2598:	00190913          	addi	s2,s2,1
    259c:	fff00a93          	li	s5,-1
    25a0:	00000b93          	li	s7,0
    25a4:	00000c93          	li	s9,0
    25a8:	05a00b13          	li	s6,90
    25ac:	00190913          	addi	s2,s2,1
    25b0:	fe088793          	addi	a5,a7,-32
    25b4:	04fb6663          	bltu	s6,a5,2600 <_vfprintf_r+0x1f4>
    25b8:	01812703          	lw	a4,24(sp)
    25bc:	00279793          	slli	a5,a5,0x2
    25c0:	00e787b3          	add	a5,a5,a4
    25c4:	0007a783          	lw	a5,0(a5)
    25c8:	00078067          	jr	a5
    25cc:	00000b93          	li	s7,0
    25d0:	fd088793          	addi	a5,a7,-48
    25d4:	00900693          	li	a3,9
    25d8:	00094883          	lbu	a7,0(s2)
    25dc:	002b9713          	slli	a4,s7,0x2
    25e0:	01770bb3          	add	s7,a4,s7
    25e4:	001b9b93          	slli	s7,s7,0x1
    25e8:	01778bb3          	add	s7,a5,s7
    25ec:	fd088793          	addi	a5,a7,-48
    25f0:	00190913          	addi	s2,s2,1
    25f4:	fef6f2e3          	bgeu	a3,a5,25d8 <_vfprintf_r+0x1cc>
    25f8:	fe088793          	addi	a5,a7,-32
    25fc:	fafb7ee3          	bgeu	s6,a5,25b8 <_vfprintf_r+0x1ac>
    2600:	14088663          	beqz	a7,274c <_vfprintf_r+0x340>
    2604:	13110623          	sb	a7,300(sp)
    2608:	0a0103a3          	sb	zero,167(sp)
    260c:	00100d93          	li	s11,1
    2610:	00100b13          	li	s6,1
    2614:	12c10d13          	addi	s10,sp,300
    2618:	00012823          	sw	zero,16(sp)
    261c:	00000a93          	li	s5,0
    2620:	02012423          	sw	zero,40(sp)
    2624:	02012223          	sw	zero,36(sp)
    2628:	00012e23          	sw	zero,28(sp)
    262c:	002cf293          	andi	t0,s9,2
    2630:	00028463          	beqz	t0,2638 <_vfprintf_r+0x22c>
    2634:	002d8d93          	addi	s11,s11,2
    2638:	084cff93          	andi	t6,s9,132
    263c:	0cc12603          	lw	a2,204(sp)
    2640:	000f9663          	bnez	t6,264c <_vfprintf_r+0x240>
    2644:	41bb8733          	sub	a4,s7,s11
    2648:	44e04ce3          	bgtz	a4,32a0 <_vfprintf_r+0xe94>
    264c:	0a714703          	lbu	a4,167(sp)
    2650:	02070a63          	beqz	a4,2684 <_vfprintf_r+0x278>
    2654:	0c812703          	lw	a4,200(sp)
    2658:	0a710593          	addi	a1,sp,167
    265c:	00b42023          	sw	a1,0(s0)
    2660:	00160613          	addi	a2,a2,1
    2664:	00100593          	li	a1,1
    2668:	00170713          	addi	a4,a4,1
    266c:	00b42223          	sw	a1,4(s0)
    2670:	0cc12623          	sw	a2,204(sp)
    2674:	0ce12423          	sw	a4,200(sp)
    2678:	00700593          	li	a1,7
    267c:	00840413          	addi	s0,s0,8
    2680:	3ee5c263          	blt	a1,a4,2a64 <_vfprintf_r+0x658>
    2684:	02028a63          	beqz	t0,26b8 <_vfprintf_r+0x2ac>
    2688:	0c812703          	lw	a4,200(sp)
    268c:	00200593          	li	a1,2
    2690:	00260613          	addi	a2,a2,2
    2694:	00170713          	addi	a4,a4,1
    2698:	0a810793          	addi	a5,sp,168
    269c:	00b42223          	sw	a1,4(s0)
    26a0:	00f42023          	sw	a5,0(s0)
    26a4:	0cc12623          	sw	a2,204(sp)
    26a8:	0ce12423          	sw	a4,200(sp)
    26ac:	00700593          	li	a1,7
    26b0:	00840413          	addi	s0,s0,8
    26b4:	50e5c2e3          	blt	a1,a4,33b8 <_vfprintf_r+0xfac>
    26b8:	08000713          	li	a4,128
    26bc:	1cef8ce3          	beq	t6,a4,3094 <_vfprintf_r+0xc88>
    26c0:	416a8ab3          	sub	s5,s5,s6
    26c4:	2d5048e3          	bgtz	s5,3194 <_vfprintf_r+0xd88>
    26c8:	100cf713          	andi	a4,s9,256
    26cc:	02071ce3          	bnez	a4,2f04 <_vfprintf_r+0xaf8>
    26d0:	0c812783          	lw	a5,200(sp)
    26d4:	01660633          	add	a2,a2,s6
    26d8:	01a42023          	sw	s10,0(s0)
    26dc:	00178793          	addi	a5,a5,1
    26e0:	01642223          	sw	s6,4(s0)
    26e4:	0cc12623          	sw	a2,204(sp)
    26e8:	0cf12423          	sw	a5,200(sp)
    26ec:	00700713          	li	a4,7
    26f0:	4af74a63          	blt	a4,a5,2ba4 <_vfprintf_r+0x798>
    26f4:	00840413          	addi	s0,s0,8
    26f8:	004cfe13          	andi	t3,s9,4
    26fc:	000e0663          	beqz	t3,2708 <_vfprintf_r+0x2fc>
    2700:	41bb8ab3          	sub	s5,s7,s11
    2704:	4f5042e3          	bgtz	s5,33e8 <_vfprintf_r+0xfdc>
    2708:	000b8313          	mv	t1,s7
    270c:	01bbd463          	bge	s7,s11,2714 <_vfprintf_r+0x308>
    2710:	000d8313          	mv	t1,s11
    2714:	00c12783          	lw	a5,12(sp)
    2718:	006787b3          	add	a5,a5,t1
    271c:	00f12623          	sw	a5,12(sp)
    2720:	340618e3          	bnez	a2,3270 <_vfprintf_r+0xe64>
    2724:	01012783          	lw	a5,16(sp)
    2728:	0c012423          	sw	zero,200(sp)
    272c:	00078863          	beqz	a5,273c <_vfprintf_r+0x330>
    2730:	01012583          	lw	a1,16(sp)
    2734:	00812503          	lw	a0,8(sp)
    2738:	074040ef          	jal	67ac <_free_r>
    273c:	00098413          	mv	s0,s3
    2740:	00090d13          	mv	s10,s2
    2744:	000d4703          	lbu	a4,0(s10)
    2748:	de0714e3          	bnez	a4,2530 <_vfprintf_r+0x124>
    274c:	0cc12783          	lw	a5,204(sp)
    2750:	00078463          	beqz	a5,2758 <_vfprintf_r+0x34c>
    2754:	3690106f          	j	42bc <_vfprintf_r+0x1eb0>
    2758:	00c4d783          	lhu	a5,12(s1)
    275c:	1c012903          	lw	s2,448(sp)
    2760:	1bc12983          	lw	s3,444(sp)
    2764:	0407f793          	andi	a5,a5,64
    2768:	1b812a03          	lw	s4,440(sp)
    276c:	1b412a83          	lw	s5,436(sp)
    2770:	1ac12b83          	lw	s7,428(sp)
    2774:	1a812c03          	lw	s8,424(sp)
    2778:	1a412c83          	lw	s9,420(sp)
    277c:	1a012d03          	lw	s10,416(sp)
    2780:	19c12d83          	lw	s11,412(sp)
    2784:	00078463          	beqz	a5,278c <_vfprintf_r+0x380>
    2788:	0a40206f          	j	482c <_vfprintf_r+0x2420>
    278c:	1cc12083          	lw	ra,460(sp)
    2790:	1c812403          	lw	s0,456(sp)
    2794:	00c12503          	lw	a0,12(sp)
    2798:	1c412483          	lw	s1,452(sp)
    279c:	1b012b03          	lw	s6,432(sp)
    27a0:	1d010113          	addi	sp,sp,464
    27a4:	00008067          	ret
    27a8:	00812503          	lw	a0,8(sp)
    27ac:	00048593          	mv	a1,s1
    27b0:	3bc030ef          	jal	5b6c <__swsetup_r>
    27b4:	00050463          	beqz	a0,27bc <_vfprintf_r+0x3b0>
    27b8:	0740206f          	j	482c <_vfprintf_r+0x2420>
    27bc:	00c49703          	lh	a4,12(s1)
    27c0:	00a00693          	li	a3,10
    27c4:	01a77713          	andi	a4,a4,26
    27c8:	ced71ee3          	bne	a4,a3,24c4 <_vfprintf_r+0xb8>
    27cc:	00e49703          	lh	a4,14(s1)
    27d0:	ce074ae3          	bltz	a4,24c4 <_vfprintf_r+0xb8>
    27d4:	01412683          	lw	a3,20(sp)
    27d8:	00812503          	lw	a0,8(sp)
    27dc:	000b0613          	mv	a2,s6
    27e0:	00048593          	mv	a1,s1
    27e4:	474020ef          	jal	4c58 <__sbprintf>
    27e8:	00a12623          	sw	a0,12(sp)
    27ec:	fa1ff06f          	j	278c <_vfprintf_r+0x380>
    27f0:	00812c03          	lw	s8,8(sp)
    27f4:	000c0513          	mv	a0,s8
    27f8:	630030ef          	jal	5e28 <_localeconv_r>
    27fc:	00452783          	lw	a5,4(a0)
    2800:	00078513          	mv	a0,a5
    2804:	04f12223          	sw	a5,68(sp)
    2808:	451030ef          	jal	6458 <strlen>
    280c:	00050793          	mv	a5,a0
    2810:	000c0513          	mv	a0,s8
    2814:	04f12423          	sw	a5,72(sp)
    2818:	00078c13          	mv	s8,a5
    281c:	60c030ef          	jal	5e28 <_localeconv_r>
    2820:	00852703          	lw	a4,8(a0)
    2824:	02e12e23          	sw	a4,60(sp)
    2828:	700c14e3          	bnez	s8,3730 <_vfprintf_r+0x1324>
    282c:	00094883          	lbu	a7,0(s2)
    2830:	d7dff06f          	j	25ac <_vfprintf_r+0x1a0>
    2834:	00094883          	lbu	a7,0(s2)
    2838:	020cec93          	ori	s9,s9,32
    283c:	d71ff06f          	j	25ac <_vfprintf_r+0x1a0>
    2840:	010cec93          	ori	s9,s9,16
    2844:	020cf793          	andi	a5,s9,32
    2848:	36078e63          	beqz	a5,2bc4 <_vfprintf_r+0x7b8>
    284c:	01412783          	lw	a5,20(sp)
    2850:	00778c13          	addi	s8,a5,7
    2854:	ff8c7c13          	andi	s8,s8,-8
    2858:	004c2783          	lw	a5,4(s8)
    285c:	000c2b03          	lw	s6,0(s8)
    2860:	008c0713          	addi	a4,s8,8
    2864:	00e12a23          	sw	a4,20(sp)
    2868:	00078d93          	mv	s11,a5
    286c:	3807c663          	bltz	a5,2bf8 <_vfprintf_r+0x7ec>
    2870:	000c8e93          	mv	t4,s9
    2874:	4e0ac263          	bltz	s5,2d58 <_vfprintf_r+0x94c>
    2878:	01bb67b3          	or	a5,s6,s11
    287c:	f7fcfe93          	andi	t4,s9,-129
    2880:	4c079c63          	bnez	a5,2d58 <_vfprintf_r+0x94c>
    2884:	4e0a9063          	bnez	s5,2d64 <_vfprintf_r+0x958>
    2888:	00000b13          	li	s6,0
    288c:	000e8c93          	mv	s9,t4
    2890:	19010d13          	addi	s10,sp,400
    2894:	0a714703          	lbu	a4,167(sp)
    2898:	000a8d93          	mv	s11,s5
    289c:	016ad463          	bge	s5,s6,28a4 <_vfprintf_r+0x498>
    28a0:	000b0d93          	mv	s11,s6
    28a4:	00012823          	sw	zero,16(sp)
    28a8:	02012423          	sw	zero,40(sp)
    28ac:	02012223          	sw	zero,36(sp)
    28b0:	00012e23          	sw	zero,28(sp)
    28b4:	d6070ce3          	beqz	a4,262c <_vfprintf_r+0x220>
    28b8:	001d8d93          	addi	s11,s11,1
    28bc:	d71ff06f          	j	262c <_vfprintf_r+0x220>
    28c0:	010cec93          	ori	s9,s9,16
    28c4:	020cf793          	andi	a5,s9,32
    28c8:	3c078063          	beqz	a5,2c88 <_vfprintf_r+0x87c>
    28cc:	01412783          	lw	a5,20(sp)
    28d0:	00778c13          	addi	s8,a5,7
    28d4:	ff8c7c13          	andi	s8,s8,-8
    28d8:	000c2b03          	lw	s6,0(s8)
    28dc:	004c2d83          	lw	s11,4(s8)
    28e0:	008c0793          	addi	a5,s8,8
    28e4:	00f12a23          	sw	a5,20(sp)
    28e8:	bffcfe93          	andi	t4,s9,-1025
    28ec:	00000793          	li	a5,0
    28f0:	00000713          	li	a4,0
    28f4:	0ae103a3          	sb	a4,167(sp)
    28f8:	320ac263          	bltz	s5,2c1c <_vfprintf_r+0x810>
    28fc:	01bb6733          	or	a4,s6,s11
    2900:	f7fefc93          	andi	s9,t4,-129
    2904:	18071ae3          	bnez	a4,3298 <_vfprintf_r+0xe8c>
    2908:	720a9863          	bnez	s5,3038 <_vfprintf_r+0xc2c>
    290c:	5c0790e3          	bnez	a5,36cc <_vfprintf_r+0x12c0>
    2910:	001efb13          	andi	s6,t4,1
    2914:	19010d13          	addi	s10,sp,400
    2918:	f60b0ee3          	beqz	s6,2894 <_vfprintf_r+0x488>
    291c:	03000793          	li	a5,48
    2920:	18f107a3          	sb	a5,399(sp)
    2924:	18f10d13          	addi	s10,sp,399
    2928:	f6dff06f          	j	2894 <_vfprintf_r+0x488>
    292c:	41a90ab3          	sub	s5,s2,s10
    2930:	c3a910e3          	bne	s2,s10,2550 <_vfprintf_r+0x144>
    2934:	00094703          	lbu	a4,0(s2)
    2938:	c55ff06f          	j	258c <_vfprintf_r+0x180>
    293c:	00812503          	lw	a0,8(sp)
    2940:	0c410613          	addi	a2,sp,196
    2944:	00048593          	mv	a1,s1
    2948:	3dc020ef          	jal	4d24 <__sprint_r>
    294c:	e00516e3          	bnez	a0,2758 <_vfprintf_r+0x34c>
    2950:	00098413          	mv	s0,s3
    2954:	c29ff06f          	j	257c <_vfprintf_r+0x170>
    2958:	008cf713          	andi	a4,s9,8
    295c:	620712e3          	bnez	a4,3780 <_vfprintf_r+0x1374>
    2960:	01412783          	lw	a5,20(sp)
    2964:	09010513          	addi	a0,sp,144
    2968:	01112823          	sw	a7,16(sp)
    296c:	00778c13          	addi	s8,a5,7
    2970:	ff8c7c13          	andi	s8,s8,-8
    2974:	000c2583          	lw	a1,0(s8)
    2978:	004c2603          	lw	a2,4(s8)
    297c:	008c0793          	addi	a5,s8,8
    2980:	00f12a23          	sw	a5,20(sp)
    2984:	2790f0ef          	jal	123fc <__extenddftf2>
    2988:	09012583          	lw	a1,144(sp)
    298c:	09412603          	lw	a2,148(sp)
    2990:	09812683          	lw	a3,152(sp)
    2994:	09c12703          	lw	a4,156(sp)
    2998:	01012883          	lw	a7,16(sp)
    299c:	0d010513          	addi	a0,sp,208
    29a0:	01112823          	sw	a7,16(sp)
    29a4:	0ce12e23          	sw	a4,220(sp)
    29a8:	0cb12823          	sw	a1,208(sp)
    29ac:	0cc12a23          	sw	a2,212(sp)
    29b0:	0cd12c23          	sw	a3,216(sp)
    29b4:	3a4040ef          	jal	6d58 <_ldcheck>
    29b8:	0aa12623          	sw	a0,172(sp)
    29bc:	00200713          	li	a4,2
    29c0:	01012883          	lw	a7,16(sp)
    29c4:	00e51463          	bne	a0,a4,29cc <_vfprintf_r+0x5c0>
    29c8:	3cc0106f          	j	3d94 <_vfprintf_r+0x1988>
    29cc:	00100713          	li	a4,1
    29d0:	00e51463          	bne	a0,a4,29d8 <_vfprintf_r+0x5cc>
    29d4:	5140106f          	j	3ee8 <_vfprintf_r+0x1adc>
    29d8:	06100713          	li	a4,97
    29dc:	00e89463          	bne	a7,a4,29e4 <_vfprintf_r+0x5d8>
    29e0:	7690006f          	j	3948 <_vfprintf_r+0x153c>
    29e4:	04100713          	li	a4,65
    29e8:	05800793          	li	a5,88
    29ec:	76e880e3          	beq	a7,a4,394c <_vfprintf_r+0x1540>
    29f0:	fff00713          	li	a4,-1
    29f4:	00ea9463          	bne	s5,a4,29fc <_vfprintf_r+0x5f0>
    29f8:	0a80206f          	j	4aa0 <_vfprintf_r+0x2694>
    29fc:	fdf8f713          	andi	a4,a7,-33
    2a00:	04700693          	li	a3,71
    2a04:	00012823          	sw	zero,16(sp)
    2a08:	00d71663          	bne	a4,a3,2a14 <_vfprintf_r+0x608>
    2a0c:	000a9463          	bnez	s5,2a14 <_vfprintf_r+0x608>
    2a10:	00100a93          	li	s5,1
    2a14:	0dc12c03          	lw	s8,220(sp)
    2a18:	100ce793          	ori	a5,s9,256
    2a1c:	04f12623          	sw	a5,76(sp)
    2a20:	02012c23          	sw	zero,56(sp)
    2a24:	0d012f83          	lw	t6,208(sp)
    2a28:	0d412f03          	lw	t5,212(sp)
    2a2c:	0d812e83          	lw	t4,216(sp)
    2a30:	000c5a63          	bgez	s8,2a44 <_vfprintf_r+0x638>
    2a34:	80000737          	lui	a4,0x80000
    2a38:	02d00793          	li	a5,45
    2a3c:	01874c33          	xor	s8,a4,s8
    2a40:	02f12c23          	sw	a5,56(sp)
    2a44:	fbf88713          	addi	a4,a7,-65
    2a48:	02500693          	li	a3,37
    2a4c:	74e6e4e3          	bltu	a3,a4,3994 <_vfprintf_r+0x1588>
    2a50:	00271713          	slli	a4,a4,0x2
    2a54:	6c018693          	addi	a3,gp,1728 # 12e90 <keypad_map+0x330>
    2a58:	00d70733          	add	a4,a4,a3
    2a5c:	00072703          	lw	a4,0(a4) # 80000000 <_memory_end+0x7ffe0000>
    2a60:	00070067          	jr	a4
    2a64:	00812503          	lw	a0,8(sp)
    2a68:	0c410613          	addi	a2,sp,196
    2a6c:	00048593          	mv	a1,s1
    2a70:	05112823          	sw	a7,80(sp)
    2a74:	05f12623          	sw	t6,76(sp)
    2a78:	02512c23          	sw	t0,56(sp)
    2a7c:	2a8020ef          	jal	4d24 <__sprint_r>
    2a80:	000512e3          	bnez	a0,3284 <_vfprintf_r+0xe78>
    2a84:	0cc12603          	lw	a2,204(sp)
    2a88:	05012883          	lw	a7,80(sp)
    2a8c:	04c12f83          	lw	t6,76(sp)
    2a90:	03812283          	lw	t0,56(sp)
    2a94:	00098413          	mv	s0,s3
    2a98:	bedff06f          	j	2684 <_vfprintf_r+0x278>
    2a9c:	0c812a83          	lw	s5,200(sp)
    2aa0:	02012783          	lw	a5,32(sp)
    2aa4:	00100713          	li	a4,1
    2aa8:	01a42023          	sw	s10,0(s0)
    2aac:	00160c13          	addi	s8,a2,1
    2ab0:	001a8a93          	addi	s5,s5,1
    2ab4:	00840b13          	addi	s6,s0,8
    2ab8:	32f752e3          	bge	a4,a5,35dc <_vfprintf_r+0x11d0>
    2abc:	00100713          	li	a4,1
    2ac0:	00e42223          	sw	a4,4(s0)
    2ac4:	0d812623          	sw	s8,204(sp)
    2ac8:	0d512423          	sw	s5,200(sp)
    2acc:	00700713          	li	a4,7
    2ad0:	01575463          	bge	a4,s5,2ad8 <_vfprintf_r+0x6cc>
    2ad4:	0880106f          	j	3b5c <_vfprintf_r+0x1750>
    2ad8:	02c12783          	lw	a5,44(sp)
    2adc:	03012703          	lw	a4,48(sp)
    2ae0:	001a8a93          	addi	s5,s5,1
    2ae4:	00fc0c33          	add	s8,s8,a5
    2ae8:	00eb2023          	sw	a4,0(s6)
    2aec:	00fb2223          	sw	a5,4(s6)
    2af0:	0d812623          	sw	s8,204(sp)
    2af4:	0d512423          	sw	s5,200(sp)
    2af8:	00700713          	li	a4,7
    2afc:	008b0b13          	addi	s6,s6,8
    2b00:	01575463          	bge	a4,s5,2b08 <_vfprintf_r+0x6fc>
    2b04:	07c0106f          	j	3b80 <_vfprintf_r+0x1774>
    2b08:	0d012703          	lw	a4,208(sp)
    2b0c:	02012783          	lw	a5,32(sp)
    2b10:	08010593          	addi	a1,sp,128
    2b14:	08e12823          	sw	a4,144(sp)
    2b18:	0d412703          	lw	a4,212(sp)
    2b1c:	09010513          	addi	a0,sp,144
    2b20:	08012023          	sw	zero,128(sp)
    2b24:	08e12a23          	sw	a4,148(sp)
    2b28:	0d812703          	lw	a4,216(sp)
    2b2c:	08012223          	sw	zero,132(sp)
    2b30:	08012423          	sw	zero,136(sp)
    2b34:	08e12c23          	sw	a4,152(sp)
    2b38:	0dc12703          	lw	a4,220(sp)
    2b3c:	08012623          	sw	zero,140(sp)
    2b40:	fff78413          	addi	s0,a5,-1
    2b44:	08e12e23          	sw	a4,156(sp)
    2b48:	4440c0ef          	jal	ef8c <__eqtf2>
    2b4c:	2c0508e3          	beqz	a0,361c <_vfprintf_r+0x1210>
    2b50:	001d0793          	addi	a5,s10,1
    2b54:	001a8a93          	addi	s5,s5,1
    2b58:	008c0c33          	add	s8,s8,s0
    2b5c:	00fb2023          	sw	a5,0(s6)
    2b60:	008b2223          	sw	s0,4(s6)
    2b64:	0d812623          	sw	s8,204(sp)
    2b68:	0d512423          	sw	s5,200(sp)
    2b6c:	00700793          	li	a5,7
    2b70:	008b0b13          	addi	s6,s6,8
    2b74:	2957c2e3          	blt	a5,s5,35f8 <_vfprintf_r+0x11ec>
    2b78:	04012683          	lw	a3,64(sp)
    2b7c:	0b410713          	addi	a4,sp,180
    2b80:	001a8793          	addi	a5,s5,1
    2b84:	01868633          	add	a2,a3,s8
    2b88:	00eb2023          	sw	a4,0(s6)
    2b8c:	00db2223          	sw	a3,4(s6)
    2b90:	0cc12623          	sw	a2,204(sp)
    2b94:	0cf12423          	sw	a5,200(sp)
    2b98:	00700713          	li	a4,7
    2b9c:	008b0413          	addi	s0,s6,8
    2ba0:	b4f75ce3          	bge	a4,a5,26f8 <_vfprintf_r+0x2ec>
    2ba4:	00812503          	lw	a0,8(sp)
    2ba8:	0c410613          	addi	a2,sp,196
    2bac:	00048593          	mv	a1,s1
    2bb0:	174020ef          	jal	4d24 <__sprint_r>
    2bb4:	6c051863          	bnez	a0,3284 <_vfprintf_r+0xe78>
    2bb8:	0cc12603          	lw	a2,204(sp)
    2bbc:	00098413          	mv	s0,s3
    2bc0:	b39ff06f          	j	26f8 <_vfprintf_r+0x2ec>
    2bc4:	01412703          	lw	a4,20(sp)
    2bc8:	010cf793          	andi	a5,s9,16
    2bcc:	00072b03          	lw	s6,0(a4)
    2bd0:	00470713          	addi	a4,a4,4
    2bd4:	00e12a23          	sw	a4,20(sp)
    2bd8:	340796e3          	bnez	a5,3724 <_vfprintf_r+0x1318>
    2bdc:	040cf793          	andi	a5,s9,64
    2be0:	32078ee3          	beqz	a5,371c <_vfprintf_r+0x1310>
    2be4:	010b1b13          	slli	s6,s6,0x10
    2be8:	410b5b13          	srai	s6,s6,0x10
    2bec:	41fb5d93          	srai	s11,s6,0x1f
    2bf0:	000d8793          	mv	a5,s11
    2bf4:	c607dee3          	bgez	a5,2870 <_vfprintf_r+0x464>
    2bf8:	02d00713          	li	a4,45
    2bfc:	016037b3          	snez	a5,s6
    2c00:	41b00db3          	neg	s11,s11
    2c04:	0ae103a3          	sb	a4,167(sp)
    2c08:	40fd8db3          	sub	s11,s11,a5
    2c0c:	41600b33          	neg	s6,s6
    2c10:	000c8e93          	mv	t4,s9
    2c14:	00100793          	li	a5,1
    2c18:	ce0ad2e3          	bgez	s5,28fc <_vfprintf_r+0x4f0>
    2c1c:	00100713          	li	a4,1
    2c20:	12e78c63          	beq	a5,a4,2d58 <_vfprintf_r+0x94c>
    2c24:	00200713          	li	a4,2
    2c28:	42e78463          	beq	a5,a4,3050 <_vfprintf_r+0xc44>
    2c2c:	19010d13          	addi	s10,sp,400
    2c30:	01dd9793          	slli	a5,s11,0x1d
    2c34:	007b7713          	andi	a4,s6,7
    2c38:	003b5b13          	srli	s6,s6,0x3
    2c3c:	03070713          	addi	a4,a4,48
    2c40:	0167eb33          	or	s6,a5,s6
    2c44:	003ddd93          	srli	s11,s11,0x3
    2c48:	feed0fa3          	sb	a4,-1(s10)
    2c4c:	01bb67b3          	or	a5,s6,s11
    2c50:	000d0613          	mv	a2,s10
    2c54:	fffd0d13          	addi	s10,s10,-1
    2c58:	fc079ce3          	bnez	a5,2c30 <_vfprintf_r+0x824>
    2c5c:	001ef693          	andi	a3,t4,1
    2c60:	42068263          	beqz	a3,3084 <_vfprintf_r+0xc78>
    2c64:	03000693          	li	a3,48
    2c68:	40d70e63          	beq	a4,a3,3084 <_vfprintf_r+0xc78>
    2c6c:	ffe60613          	addi	a2,a2,-2
    2c70:	19010793          	addi	a5,sp,400
    2c74:	fedd0fa3          	sb	a3,-1(s10)
    2c78:	40c78b33          	sub	s6,a5,a2
    2c7c:	000e8c93          	mv	s9,t4
    2c80:	00060d13          	mv	s10,a2
    2c84:	c11ff06f          	j	2894 <_vfprintf_r+0x488>
    2c88:	01412703          	lw	a4,20(sp)
    2c8c:	010cf793          	andi	a5,s9,16
    2c90:	00072b03          	lw	s6,0(a4)
    2c94:	00470713          	addi	a4,a4,4
    2c98:	00e12a23          	sw	a4,20(sp)
    2c9c:	26079ce3          	bnez	a5,3714 <_vfprintf_r+0x1308>
    2ca0:	040cf793          	andi	a5,s9,64
    2ca4:	260784e3          	beqz	a5,370c <_vfprintf_r+0x1300>
    2ca8:	010b1b13          	slli	s6,s6,0x10
    2cac:	010b5b13          	srli	s6,s6,0x10
    2cb0:	00000d93          	li	s11,0
    2cb4:	c35ff06f          	j	28e8 <_vfprintf_r+0x4dc>
    2cb8:	01412703          	lw	a4,20(sp)
    2cbc:	0a0103a3          	sb	zero,167(sp)
    2cc0:	00100d93          	li	s11,1
    2cc4:	00072783          	lw	a5,0(a4)
    2cc8:	00470713          	addi	a4,a4,4
    2ccc:	00e12a23          	sw	a4,20(sp)
    2cd0:	12f10623          	sb	a5,300(sp)
    2cd4:	00100b13          	li	s6,1
    2cd8:	12c10d13          	addi	s10,sp,300
    2cdc:	93dff06f          	j	2618 <_vfprintf_r+0x20c>
    2ce0:	01412783          	lw	a5,20(sp)
    2ce4:	0a0103a3          	sb	zero,167(sp)
    2ce8:	0007ad03          	lw	s10,0(a5)
    2cec:	00478c13          	addi	s8,a5,4
    2cf0:	360d0ce3          	beqz	s10,3868 <_vfprintf_r+0x145c>
    2cf4:	000ad463          	bgez	s5,2cfc <_vfprintf_r+0x8f0>
    2cf8:	1900106f          	j	3e88 <_vfprintf_r+0x1a7c>
    2cfc:	000a8613          	mv	a2,s5
    2d00:	00000593          	li	a1,0
    2d04:	000d0513          	mv	a0,s10
    2d08:	01112a23          	sw	a7,20(sp)
    2d0c:	7a5020ef          	jal	5cb0 <memchr>
    2d10:	00a12823          	sw	a0,16(sp)
    2d14:	01412883          	lw	a7,20(sp)
    2d18:	00051463          	bnez	a0,2d20 <_vfprintf_r+0x914>
    2d1c:	32d0106f          	j	4848 <_vfprintf_r+0x243c>
    2d20:	01012783          	lw	a5,16(sp)
    2d24:	0a714703          	lbu	a4,167(sp)
    2d28:	01812a23          	sw	s8,20(sp)
    2d2c:	41a78b33          	sub	s6,a5,s10
    2d30:	fffb4693          	not	a3,s6
    2d34:	41f6d693          	srai	a3,a3,0x1f
    2d38:	00012823          	sw	zero,16(sp)
    2d3c:	02012423          	sw	zero,40(sp)
    2d40:	02012223          	sw	zero,36(sp)
    2d44:	00012e23          	sw	zero,28(sp)
    2d48:	00db7db3          	and	s11,s6,a3
    2d4c:	00000a93          	li	s5,0
    2d50:	b60714e3          	bnez	a4,28b8 <_vfprintf_r+0x4ac>
    2d54:	8d9ff06f          	j	262c <_vfprintf_r+0x220>
    2d58:	640d9ee3          	bnez	s11,3bb4 <_vfprintf_r+0x17a8>
    2d5c:	00900793          	li	a5,9
    2d60:	6567eae3          	bltu	a5,s6,3bb4 <_vfprintf_r+0x17a8>
    2d64:	030b0b13          	addi	s6,s6,48
    2d68:	196107a3          	sb	s6,399(sp)
    2d6c:	000e8c93          	mv	s9,t4
    2d70:	00100b13          	li	s6,1
    2d74:	18f10d13          	addi	s10,sp,399
    2d78:	b1dff06f          	j	2894 <_vfprintf_r+0x488>
    2d7c:	01412783          	lw	a5,20(sp)
    2d80:	0007ab83          	lw	s7,0(a5)
    2d84:	00478793          	addi	a5,a5,4
    2d88:	160bd0e3          	bgez	s7,36e8 <_vfprintf_r+0x12dc>
    2d8c:	41700bb3          	neg	s7,s7
    2d90:	00f12a23          	sw	a5,20(sp)
    2d94:	00094883          	lbu	a7,0(s2)
    2d98:	004cec93          	ori	s9,s9,4
    2d9c:	811ff06f          	j	25ac <_vfprintf_r+0x1a0>
    2da0:	02b00793          	li	a5,43
    2da4:	00094883          	lbu	a7,0(s2)
    2da8:	0af103a3          	sb	a5,167(sp)
    2dac:	801ff06f          	j	25ac <_vfprintf_r+0x1a0>
    2db0:	00094883          	lbu	a7,0(s2)
    2db4:	080cec93          	ori	s9,s9,128
    2db8:	ff4ff06f          	j	25ac <_vfprintf_r+0x1a0>
    2dbc:	00094883          	lbu	a7,0(s2)
    2dc0:	02a00793          	li	a5,42
    2dc4:	00190693          	addi	a3,s2,1
    2dc8:	00f89463          	bne	a7,a5,2dd0 <_vfprintf_r+0x9c4>
    2dcc:	6250106f          	j	4bf0 <_vfprintf_r+0x27e4>
    2dd0:	fd088793          	addi	a5,a7,-48
    2dd4:	00900713          	li	a4,9
    2dd8:	00000a93          	li	s5,0
    2ddc:	00900613          	li	a2,9
    2de0:	02f76463          	bltu	a4,a5,2e08 <_vfprintf_r+0x9fc>
    2de4:	0006c883          	lbu	a7,0(a3)
    2de8:	002a9713          	slli	a4,s5,0x2
    2dec:	01570ab3          	add	s5,a4,s5
    2df0:	001a9a93          	slli	s5,s5,0x1
    2df4:	00fa8ab3          	add	s5,s5,a5
    2df8:	fd088793          	addi	a5,a7,-48
    2dfc:	00168693          	addi	a3,a3,1
    2e00:	fef672e3          	bgeu	a2,a5,2de4 <_vfprintf_r+0x9d8>
    2e04:	1a0ac6e3          	bltz	s5,37b0 <_vfprintf_r+0x13a4>
    2e08:	00068913          	mv	s2,a3
    2e0c:	fa4ff06f          	j	25b0 <_vfprintf_r+0x1a4>
    2e10:	00094883          	lbu	a7,0(s2)
    2e14:	001cec93          	ori	s9,s9,1
    2e18:	f94ff06f          	j	25ac <_vfprintf_r+0x1a0>
    2e1c:	0a714783          	lbu	a5,167(sp)
    2e20:	00094883          	lbu	a7,0(s2)
    2e24:	f8079463          	bnez	a5,25ac <_vfprintf_r+0x1a0>
    2e28:	02000793          	li	a5,32
    2e2c:	0af103a3          	sb	a5,167(sp)
    2e30:	f7cff06f          	j	25ac <_vfprintf_r+0x1a0>
    2e34:	010cee93          	ori	t4,s9,16
    2e38:	020ef793          	andi	a5,t4,32
    2e3c:	04078ee3          	beqz	a5,3698 <_vfprintf_r+0x128c>
    2e40:	01412783          	lw	a5,20(sp)
    2e44:	00778c13          	addi	s8,a5,7
    2e48:	ff8c7c13          	andi	s8,s8,-8
    2e4c:	008c0793          	addi	a5,s8,8
    2e50:	00f12a23          	sw	a5,20(sp)
    2e54:	000c2b03          	lw	s6,0(s8)
    2e58:	004c2d83          	lw	s11,4(s8)
    2e5c:	00100793          	li	a5,1
    2e60:	a91ff06f          	j	28f0 <_vfprintf_r+0x4e4>
    2e64:	00094883          	lbu	a7,0(s2)
    2e68:	008cec93          	ori	s9,s9,8
    2e6c:	f40ff06f          	j	25ac <_vfprintf_r+0x1a0>
    2e70:	01412703          	lw	a4,20(sp)
    2e74:	000087b7          	lui	a5,0x8
    2e78:	83078793          	addi	a5,a5,-2000 # 7830 <__gdtoa+0x9d4>
    2e7c:	0af11423          	sh	a5,168(sp)
    2e80:	00470793          	addi	a5,a4,4
    2e84:	00f12a23          	sw	a5,20(sp)
    2e88:	3b018793          	addi	a5,gp,944 # 12b80 <keypad_map+0x20>
    2e8c:	02f12a23          	sw	a5,52(sp)
    2e90:	00072b03          	lw	s6,0(a4)
    2e94:	00000d93          	li	s11,0
    2e98:	002cee93          	ori	t4,s9,2
    2e9c:	00200793          	li	a5,2
    2ea0:	07800893          	li	a7,120
    2ea4:	a4dff06f          	j	28f0 <_vfprintf_r+0x4e4>
    2ea8:	020cf793          	andi	a5,s9,32
    2eac:	0a0784e3          	beqz	a5,3754 <_vfprintf_r+0x1348>
    2eb0:	01412783          	lw	a5,20(sp)
    2eb4:	00c12683          	lw	a3,12(sp)
    2eb8:	0007a783          	lw	a5,0(a5)
    2ebc:	41f6d713          	srai	a4,a3,0x1f
    2ec0:	00d7a023          	sw	a3,0(a5)
    2ec4:	00e7a223          	sw	a4,4(a5)
    2ec8:	01412783          	lw	a5,20(sp)
    2ecc:	00090d13          	mv	s10,s2
    2ed0:	00478793          	addi	a5,a5,4
    2ed4:	00f12a23          	sw	a5,20(sp)
    2ed8:	86dff06f          	j	2744 <_vfprintf_r+0x338>
    2edc:	00094883          	lbu	a7,0(s2)
    2ee0:	06c00793          	li	a5,108
    2ee4:	14f88ae3          	beq	a7,a5,3838 <_vfprintf_r+0x142c>
    2ee8:	010cec93          	ori	s9,s9,16
    2eec:	ec0ff06f          	j	25ac <_vfprintf_r+0x1a0>
    2ef0:	00094883          	lbu	a7,0(s2)
    2ef4:	06800793          	li	a5,104
    2ef8:	12f888e3          	beq	a7,a5,3828 <_vfprintf_r+0x141c>
    2efc:	040cec93          	ori	s9,s9,64
    2f00:	eacff06f          	j	25ac <_vfprintf_r+0x1a0>
    2f04:	06500713          	li	a4,101
    2f08:	b9175ae3          	bge	a4,a7,2a9c <_vfprintf_r+0x690>
    2f0c:	0d012703          	lw	a4,208(sp)
    2f10:	08010593          	addi	a1,sp,128
    2f14:	09010513          	addi	a0,sp,144
    2f18:	08e12823          	sw	a4,144(sp)
    2f1c:	0d412703          	lw	a4,212(sp)
    2f20:	02c12c23          	sw	a2,56(sp)
    2f24:	08012023          	sw	zero,128(sp)
    2f28:	08e12a23          	sw	a4,148(sp)
    2f2c:	0d812703          	lw	a4,216(sp)
    2f30:	08012223          	sw	zero,132(sp)
    2f34:	08012423          	sw	zero,136(sp)
    2f38:	08e12c23          	sw	a4,152(sp)
    2f3c:	0dc12703          	lw	a4,220(sp)
    2f40:	08012623          	sw	zero,140(sp)
    2f44:	08e12e23          	sw	a4,156(sp)
    2f48:	0440c0ef          	jal	ef8c <__eqtf2>
    2f4c:	03812603          	lw	a2,56(sp)
    2f50:	54051263          	bnez	a0,3494 <_vfprintf_r+0x1088>
    2f54:	0c812783          	lw	a5,200(sp)
    2f58:	3e018713          	addi	a4,gp,992 # 12bb0 <keypad_map+0x50>
    2f5c:	00e42023          	sw	a4,0(s0)
    2f60:	00160613          	addi	a2,a2,1
    2f64:	00100713          	li	a4,1
    2f68:	00178793          	addi	a5,a5,1
    2f6c:	00e42223          	sw	a4,4(s0)
    2f70:	0cc12623          	sw	a2,204(sp)
    2f74:	0cf12423          	sw	a5,200(sp)
    2f78:	00700713          	li	a4,7
    2f7c:	00840413          	addi	s0,s0,8
    2f80:	5cf744e3          	blt	a4,a5,3d48 <_vfprintf_r+0x193c>
    2f84:	0ac12783          	lw	a5,172(sp)
    2f88:	02012703          	lw	a4,32(sp)
    2f8c:	74e7d663          	bge	a5,a4,36d8 <_vfprintf_r+0x12cc>
    2f90:	03012783          	lw	a5,48(sp)
    2f94:	02c12703          	lw	a4,44(sp)
    2f98:	00840413          	addi	s0,s0,8
    2f9c:	fef42c23          	sw	a5,-8(s0)
    2fa0:	0c812783          	lw	a5,200(sp)
    2fa4:	00e60633          	add	a2,a2,a4
    2fa8:	fee42e23          	sw	a4,-4(s0)
    2fac:	00178793          	addi	a5,a5,1
    2fb0:	0cc12623          	sw	a2,204(sp)
    2fb4:	0cf12423          	sw	a5,200(sp)
    2fb8:	00700713          	li	a4,7
    2fbc:	08f746e3          	blt	a4,a5,3848 <_vfprintf_r+0x143c>
    2fc0:	02012783          	lw	a5,32(sp)
    2fc4:	fff78a93          	addi	s5,a5,-1
    2fc8:	f3505863          	blez	s5,26f8 <_vfprintf_r+0x2ec>
    2fcc:	75818813          	addi	a6,gp,1880 # 12f28 <zeroes.0>
    2fd0:	01000713          	li	a4,16
    2fd4:	0c812783          	lw	a5,200(sp)
    2fd8:	01000b13          	li	s6,16
    2fdc:	00700c13          	li	s8,7
    2fe0:	00080d13          	mv	s10,a6
    2fe4:	01574863          	blt	a4,s5,2ff4 <_vfprintf_r+0xbe8>
    2fe8:	5850006f          	j	3d6c <_vfprintf_r+0x1960>
    2fec:	ff0a8a93          	addi	s5,s5,-16
    2ff0:	575b5ce3          	bge	s6,s5,3d68 <_vfprintf_r+0x195c>
    2ff4:	01060613          	addi	a2,a2,16
    2ff8:	00178793          	addi	a5,a5,1
    2ffc:	01a42023          	sw	s10,0(s0)
    3000:	01642223          	sw	s6,4(s0)
    3004:	0cc12623          	sw	a2,204(sp)
    3008:	0cf12423          	sw	a5,200(sp)
    300c:	00840413          	addi	s0,s0,8
    3010:	fcfc5ee3          	bge	s8,a5,2fec <_vfprintf_r+0xbe0>
    3014:	00812503          	lw	a0,8(sp)
    3018:	0c410613          	addi	a2,sp,196
    301c:	00048593          	mv	a1,s1
    3020:	505010ef          	jal	4d24 <__sprint_r>
    3024:	26051063          	bnez	a0,3284 <_vfprintf_r+0xe78>
    3028:	0cc12603          	lw	a2,204(sp)
    302c:	0c812783          	lw	a5,200(sp)
    3030:	00098413          	mv	s0,s3
    3034:	fb9ff06f          	j	2fec <_vfprintf_r+0xbe0>
    3038:	00100713          	li	a4,1
    303c:	00e79463          	bne	a5,a4,3044 <_vfprintf_r+0xc38>
    3040:	1650106f          	j	49a4 <_vfprintf_r+0x2598>
    3044:	00200713          	li	a4,2
    3048:	000c8e93          	mv	t4,s9
    304c:	bee790e3          	bne	a5,a4,2c2c <_vfprintf_r+0x820>
    3050:	03412683          	lw	a3,52(sp)
    3054:	19010d13          	addi	s10,sp,400
    3058:	00fb7793          	andi	a5,s6,15
    305c:	00f687b3          	add	a5,a3,a5
    3060:	0007c703          	lbu	a4,0(a5)
    3064:	004b5b13          	srli	s6,s6,0x4
    3068:	01cd9793          	slli	a5,s11,0x1c
    306c:	0167eb33          	or	s6,a5,s6
    3070:	004ddd93          	srli	s11,s11,0x4
    3074:	feed0fa3          	sb	a4,-1(s10)
    3078:	01bb67b3          	or	a5,s6,s11
    307c:	fffd0d13          	addi	s10,s10,-1
    3080:	fc079ce3          	bnez	a5,3058 <_vfprintf_r+0xc4c>
    3084:	19010793          	addi	a5,sp,400
    3088:	41a78b33          	sub	s6,a5,s10
    308c:	000e8c93          	mv	s9,t4
    3090:	805ff06f          	j	2894 <_vfprintf_r+0x488>
    3094:	41bb8c33          	sub	s8,s7,s11
    3098:	e3805463          	blez	s8,26c0 <_vfprintf_r+0x2b4>
    309c:	01000513          	li	a0,16
    30a0:	0c812583          	lw	a1,200(sp)
    30a4:	75818813          	addi	a6,gp,1880 # 12f28 <zeroes.0>
    30a8:	0b855063          	bge	a0,s8,3148 <_vfprintf_r+0xd3c>
    30ac:	03212c23          	sw	s2,56(sp)
    30b0:	00040793          	mv	a5,s0
    30b4:	01000e93          	li	t4,16
    30b8:	000c0413          	mv	s0,s8
    30bc:	00700f93          	li	t6,7
    30c0:	000b0c13          	mv	s8,s6
    30c4:	00080913          	mv	s2,a6
    30c8:	000a8b13          	mv	s6,s5
    30cc:	00088a93          	mv	s5,a7
    30d0:	00c0006f          	j	30dc <_vfprintf_r+0xcd0>
    30d4:	ff040413          	addi	s0,s0,-16
    30d8:	048eda63          	bge	t4,s0,312c <_vfprintf_r+0xd20>
    30dc:	01060613          	addi	a2,a2,16
    30e0:	00158593          	addi	a1,a1,1 # 2001 <i2c_eeprom_read_byte+0x41>
    30e4:	0127a023          	sw	s2,0(a5)
    30e8:	01d7a223          	sw	t4,4(a5)
    30ec:	0cc12623          	sw	a2,204(sp)
    30f0:	0cb12423          	sw	a1,200(sp)
    30f4:	00878793          	addi	a5,a5,8
    30f8:	fcbfdee3          	bge	t6,a1,30d4 <_vfprintf_r+0xcc8>
    30fc:	00812503          	lw	a0,8(sp)
    3100:	0c410613          	addi	a2,sp,196
    3104:	00048593          	mv	a1,s1
    3108:	41d010ef          	jal	4d24 <__sprint_r>
    310c:	16051c63          	bnez	a0,3284 <_vfprintf_r+0xe78>
    3110:	01000e93          	li	t4,16
    3114:	ff040413          	addi	s0,s0,-16
    3118:	0cc12603          	lw	a2,204(sp)
    311c:	0c812583          	lw	a1,200(sp)
    3120:	00098793          	mv	a5,s3
    3124:	00700f93          	li	t6,7
    3128:	fa8ecae3          	blt	t4,s0,30dc <_vfprintf_r+0xcd0>
    312c:	00090813          	mv	a6,s2
    3130:	03812903          	lw	s2,56(sp)
    3134:	000a8893          	mv	a7,s5
    3138:	000b0a93          	mv	s5,s6
    313c:	000c0b13          	mv	s6,s8
    3140:	00040c13          	mv	s8,s0
    3144:	00078413          	mv	s0,a5
    3148:	01860633          	add	a2,a2,s8
    314c:	00158593          	addi	a1,a1,1
    3150:	01042023          	sw	a6,0(s0)
    3154:	01842223          	sw	s8,4(s0)
    3158:	0cc12623          	sw	a2,204(sp)
    315c:	0cb12423          	sw	a1,200(sp)
    3160:	00700713          	li	a4,7
    3164:	00840413          	addi	s0,s0,8
    3168:	d4b75c63          	bge	a4,a1,26c0 <_vfprintf_r+0x2b4>
    316c:	00812503          	lw	a0,8(sp)
    3170:	0c410613          	addi	a2,sp,196
    3174:	00048593          	mv	a1,s1
    3178:	03112c23          	sw	a7,56(sp)
    317c:	3a9010ef          	jal	4d24 <__sprint_r>
    3180:	10051263          	bnez	a0,3284 <_vfprintf_r+0xe78>
    3184:	0cc12603          	lw	a2,204(sp)
    3188:	03812883          	lw	a7,56(sp)
    318c:	00098413          	mv	s0,s3
    3190:	d30ff06f          	j	26c0 <_vfprintf_r+0x2b4>
    3194:	01000713          	li	a4,16
    3198:	0c812583          	lw	a1,200(sp)
    319c:	75818813          	addi	a6,gp,1880 # 12f28 <zeroes.0>
    31a0:	09575263          	bge	a4,s5,3224 <_vfprintf_r+0xe18>
    31a4:	00040793          	mv	a5,s0
    31a8:	01000713          	li	a4,16
    31ac:	000a8413          	mv	s0,s5
    31b0:	00700c13          	li	s8,7
    31b4:	03112c23          	sw	a7,56(sp)
    31b8:	000a0a93          	mv	s5,s4
    31bc:	00c0006f          	j	31c8 <_vfprintf_r+0xdbc>
    31c0:	ff040413          	addi	s0,s0,-16
    31c4:	04875863          	bge	a4,s0,3214 <_vfprintf_r+0xe08>
    31c8:	01060613          	addi	a2,a2,16
    31cc:	00158593          	addi	a1,a1,1
    31d0:	0147a023          	sw	s4,0(a5)
    31d4:	00e7a223          	sw	a4,4(a5)
    31d8:	0cc12623          	sw	a2,204(sp)
    31dc:	0cb12423          	sw	a1,200(sp)
    31e0:	00878793          	addi	a5,a5,8
    31e4:	fcbc5ee3          	bge	s8,a1,31c0 <_vfprintf_r+0xdb4>
    31e8:	00812503          	lw	a0,8(sp)
    31ec:	0c410613          	addi	a2,sp,196
    31f0:	00048593          	mv	a1,s1
    31f4:	331010ef          	jal	4d24 <__sprint_r>
    31f8:	08051663          	bnez	a0,3284 <_vfprintf_r+0xe78>
    31fc:	01000713          	li	a4,16
    3200:	ff040413          	addi	s0,s0,-16
    3204:	0cc12603          	lw	a2,204(sp)
    3208:	0c812583          	lw	a1,200(sp)
    320c:	00098793          	mv	a5,s3
    3210:	fa874ce3          	blt	a4,s0,31c8 <_vfprintf_r+0xdbc>
    3214:	03812883          	lw	a7,56(sp)
    3218:	000a8813          	mv	a6,s5
    321c:	00040a93          	mv	s5,s0
    3220:	00078413          	mv	s0,a5
    3224:	01560633          	add	a2,a2,s5
    3228:	00158593          	addi	a1,a1,1
    322c:	01042023          	sw	a6,0(s0)
    3230:	01542223          	sw	s5,4(s0)
    3234:	0cc12623          	sw	a2,204(sp)
    3238:	0cb12423          	sw	a1,200(sp)
    323c:	00700713          	li	a4,7
    3240:	00840413          	addi	s0,s0,8
    3244:	c8b75263          	bge	a4,a1,26c8 <_vfprintf_r+0x2bc>
    3248:	00812503          	lw	a0,8(sp)
    324c:	0c410613          	addi	a2,sp,196
    3250:	00048593          	mv	a1,s1
    3254:	03112c23          	sw	a7,56(sp)
    3258:	2cd010ef          	jal	4d24 <__sprint_r>
    325c:	02051463          	bnez	a0,3284 <_vfprintf_r+0xe78>
    3260:	0cc12603          	lw	a2,204(sp)
    3264:	03812883          	lw	a7,56(sp)
    3268:	00098413          	mv	s0,s3
    326c:	c5cff06f          	j	26c8 <_vfprintf_r+0x2bc>
    3270:	00812503          	lw	a0,8(sp)
    3274:	0c410613          	addi	a2,sp,196
    3278:	00048593          	mv	a1,s1
    327c:	2a9010ef          	jal	4d24 <__sprint_r>
    3280:	ca050263          	beqz	a0,2724 <_vfprintf_r+0x318>
    3284:	01012583          	lw	a1,16(sp)
    3288:	cc058863          	beqz	a1,2758 <_vfprintf_r+0x34c>
    328c:	00812503          	lw	a0,8(sp)
    3290:	51c030ef          	jal	67ac <_free_r>
    3294:	cc4ff06f          	j	2758 <_vfprintf_r+0x34c>
    3298:	000c8e93          	mv	t4,s9
    329c:	981ff06f          	j	2c1c <_vfprintf_r+0x810>
    32a0:	01000513          	li	a0,16
    32a4:	0c812583          	lw	a1,200(sp)
    32a8:	76818c13          	addi	s8,gp,1896 # 12f38 <blanks.1>
    32ac:	0ae55863          	bge	a0,a4,335c <_vfprintf_r+0xf50>
    32b0:	05212823          	sw	s2,80(sp)
    32b4:	00040793          	mv	a5,s0
    32b8:	000c0913          	mv	s2,s8
    32bc:	01000e93          	li	t4,16
    32c0:	000b0c13          	mv	s8,s6
    32c4:	00700393          	li	t2,7
    32c8:	000a8b13          	mv	s6,s5
    32cc:	02512c23          	sw	t0,56(sp)
    32d0:	05f12623          	sw	t6,76(sp)
    32d4:	00070413          	mv	s0,a4
    32d8:	00088a93          	mv	s5,a7
    32dc:	00c0006f          	j	32e8 <_vfprintf_r+0xedc>
    32e0:	ff040413          	addi	s0,s0,-16
    32e4:	048eda63          	bge	t4,s0,3338 <_vfprintf_r+0xf2c>
    32e8:	01060613          	addi	a2,a2,16
    32ec:	00158593          	addi	a1,a1,1
    32f0:	0127a023          	sw	s2,0(a5)
    32f4:	01d7a223          	sw	t4,4(a5)
    32f8:	0cc12623          	sw	a2,204(sp)
    32fc:	0cb12423          	sw	a1,200(sp)
    3300:	00878793          	addi	a5,a5,8
    3304:	fcb3dee3          	bge	t2,a1,32e0 <_vfprintf_r+0xed4>
    3308:	00812503          	lw	a0,8(sp)
    330c:	0c410613          	addi	a2,sp,196
    3310:	00048593          	mv	a1,s1
    3314:	211010ef          	jal	4d24 <__sprint_r>
    3318:	f60516e3          	bnez	a0,3284 <_vfprintf_r+0xe78>
    331c:	01000e93          	li	t4,16
    3320:	ff040413          	addi	s0,s0,-16
    3324:	0cc12603          	lw	a2,204(sp)
    3328:	0c812583          	lw	a1,200(sp)
    332c:	00098793          	mv	a5,s3
    3330:	00700393          	li	t2,7
    3334:	fa8ecae3          	blt	t4,s0,32e8 <_vfprintf_r+0xedc>
    3338:	000a8893          	mv	a7,s5
    333c:	03812283          	lw	t0,56(sp)
    3340:	000b0a93          	mv	s5,s6
    3344:	04c12f83          	lw	t6,76(sp)
    3348:	000c0b13          	mv	s6,s8
    334c:	00090c13          	mv	s8,s2
    3350:	05012903          	lw	s2,80(sp)
    3354:	00040713          	mv	a4,s0
    3358:	00078413          	mv	s0,a5
    335c:	00e60633          	add	a2,a2,a4
    3360:	00158593          	addi	a1,a1,1
    3364:	00e42223          	sw	a4,4(s0)
    3368:	01842023          	sw	s8,0(s0)
    336c:	0cc12623          	sw	a2,204(sp)
    3370:	0cb12423          	sw	a1,200(sp)
    3374:	00700713          	li	a4,7
    3378:	00840413          	addi	s0,s0,8
    337c:	acb75863          	bge	a4,a1,264c <_vfprintf_r+0x240>
    3380:	00812503          	lw	a0,8(sp)
    3384:	0c410613          	addi	a2,sp,196
    3388:	00048593          	mv	a1,s1
    338c:	05112823          	sw	a7,80(sp)
    3390:	05f12623          	sw	t6,76(sp)
    3394:	02512c23          	sw	t0,56(sp)
    3398:	18d010ef          	jal	4d24 <__sprint_r>
    339c:	ee0514e3          	bnez	a0,3284 <_vfprintf_r+0xe78>
    33a0:	0cc12603          	lw	a2,204(sp)
    33a4:	05012883          	lw	a7,80(sp)
    33a8:	04c12f83          	lw	t6,76(sp)
    33ac:	03812283          	lw	t0,56(sp)
    33b0:	00098413          	mv	s0,s3
    33b4:	a98ff06f          	j	264c <_vfprintf_r+0x240>
    33b8:	00812503          	lw	a0,8(sp)
    33bc:	0c410613          	addi	a2,sp,196
    33c0:	00048593          	mv	a1,s1
    33c4:	05112623          	sw	a7,76(sp)
    33c8:	03f12c23          	sw	t6,56(sp)
    33cc:	159010ef          	jal	4d24 <__sprint_r>
    33d0:	ea051ae3          	bnez	a0,3284 <_vfprintf_r+0xe78>
    33d4:	0cc12603          	lw	a2,204(sp)
    33d8:	04c12883          	lw	a7,76(sp)
    33dc:	03812f83          	lw	t6,56(sp)
    33e0:	00098413          	mv	s0,s3
    33e4:	ad4ff06f          	j	26b8 <_vfprintf_r+0x2ac>
    33e8:	01000713          	li	a4,16
    33ec:	0c812783          	lw	a5,200(sp)
    33f0:	76818c13          	addi	s8,gp,1896 # 12f38 <blanks.1>
    33f4:	07575263          	bge	a4,s5,3458 <_vfprintf_r+0x104c>
    33f8:	00812d03          	lw	s10,8(sp)
    33fc:	01000b13          	li	s6,16
    3400:	00700c93          	li	s9,7
    3404:	00c0006f          	j	3410 <_vfprintf_r+0x1004>
    3408:	ff0a8a93          	addi	s5,s5,-16
    340c:	055b5663          	bge	s6,s5,3458 <_vfprintf_r+0x104c>
    3410:	01060613          	addi	a2,a2,16
    3414:	00178793          	addi	a5,a5,1
    3418:	01842023          	sw	s8,0(s0)
    341c:	01642223          	sw	s6,4(s0)
    3420:	0cc12623          	sw	a2,204(sp)
    3424:	0cf12423          	sw	a5,200(sp)
    3428:	00840413          	addi	s0,s0,8
    342c:	fcfcdee3          	bge	s9,a5,3408 <_vfprintf_r+0xffc>
    3430:	0c410613          	addi	a2,sp,196
    3434:	00048593          	mv	a1,s1
    3438:	000d0513          	mv	a0,s10
    343c:	0e9010ef          	jal	4d24 <__sprint_r>
    3440:	e40512e3          	bnez	a0,3284 <_vfprintf_r+0xe78>
    3444:	ff0a8a93          	addi	s5,s5,-16
    3448:	0cc12603          	lw	a2,204(sp)
    344c:	0c812783          	lw	a5,200(sp)
    3450:	00098413          	mv	s0,s3
    3454:	fb5b4ee3          	blt	s6,s5,3410 <_vfprintf_r+0x1004>
    3458:	01560633          	add	a2,a2,s5
    345c:	00178793          	addi	a5,a5,1
    3460:	01842023          	sw	s8,0(s0)
    3464:	01542223          	sw	s5,4(s0)
    3468:	0cc12623          	sw	a2,204(sp)
    346c:	0cf12423          	sw	a5,200(sp)
    3470:	00700713          	li	a4,7
    3474:	a8f75a63          	bge	a4,a5,2708 <_vfprintf_r+0x2fc>
    3478:	00812503          	lw	a0,8(sp)
    347c:	0c410613          	addi	a2,sp,196
    3480:	00048593          	mv	a1,s1
    3484:	0a1010ef          	jal	4d24 <__sprint_r>
    3488:	de051ee3          	bnez	a0,3284 <_vfprintf_r+0xe78>
    348c:	0cc12603          	lw	a2,204(sp)
    3490:	a78ff06f          	j	2708 <_vfprintf_r+0x2fc>
    3494:	0ac12503          	lw	a0,172(sp)
    3498:	02a054e3          	blez	a0,3cc0 <_vfprintf_r+0x18b4>
    349c:	01c12783          	lw	a5,28(sp)
    34a0:	02012703          	lw	a4,32(sp)
    34a4:	00078a93          	mv	s5,a5
    34a8:	2ef74e63          	blt	a4,a5,37a4 <_vfprintf_r+0x1398>
    34ac:	03505663          	blez	s5,34d8 <_vfprintf_r+0x10cc>
    34b0:	0c812703          	lw	a4,200(sp)
    34b4:	01560633          	add	a2,a2,s5
    34b8:	01a42023          	sw	s10,0(s0)
    34bc:	00170713          	addi	a4,a4,1
    34c0:	01542223          	sw	s5,4(s0)
    34c4:	0cc12623          	sw	a2,204(sp)
    34c8:	0ce12423          	sw	a4,200(sp)
    34cc:	00700593          	li	a1,7
    34d0:	00840413          	addi	s0,s0,8
    34d4:	56e5c6e3          	blt	a1,a4,4240 <_vfprintf_r+0x1e34>
    34d8:	fffac713          	not	a4,s5
    34dc:	01c12783          	lw	a5,28(sp)
    34e0:	41f75713          	srai	a4,a4,0x1f
    34e4:	00eafab3          	and	s5,s5,a4
    34e8:	41578ab3          	sub	s5,a5,s5
    34ec:	39504c63          	bgtz	s5,3884 <_vfprintf_r+0x1478>
    34f0:	01c12783          	lw	a5,28(sp)
    34f4:	400cf713          	andi	a4,s9,1024
    34f8:	00fd0c33          	add	s8,s10,a5
    34fc:	300714e3          	bnez	a4,4004 <_vfprintf_r+0x1bf8>
    3500:	0ac12a83          	lw	s5,172(sp)
    3504:	02012783          	lw	a5,32(sp)
    3508:	3efac663          	blt	s5,a5,38f4 <_vfprintf_r+0x14e8>
    350c:	001cf713          	andi	a4,s9,1
    3510:	3e071263          	bnez	a4,38f4 <_vfprintf_r+0x14e8>
    3514:	02012703          	lw	a4,32(sp)
    3518:	00ed07b3          	add	a5,s10,a4
    351c:	41570ab3          	sub	s5,a4,s5
    3520:	41878b33          	sub	s6,a5,s8
    3524:	016ad463          	bge	s5,s6,352c <_vfprintf_r+0x1120>
    3528:	000a8b13          	mv	s6,s5
    352c:	03605863          	blez	s6,355c <_vfprintf_r+0x1150>
    3530:	0c812783          	lw	a5,200(sp)
    3534:	01660633          	add	a2,a2,s6
    3538:	01842023          	sw	s8,0(s0)
    353c:	00178793          	addi	a5,a5,1
    3540:	01642223          	sw	s6,4(s0)
    3544:	0cc12623          	sw	a2,204(sp)
    3548:	0cf12423          	sw	a5,200(sp)
    354c:	00700713          	li	a4,7
    3550:	00840413          	addi	s0,s0,8
    3554:	00f75463          	bge	a4,a5,355c <_vfprintf_r+0x1150>
    3558:	31c0106f          	j	4874 <_vfprintf_r+0x2468>
    355c:	fffb4793          	not	a5,s6
    3560:	41f7d793          	srai	a5,a5,0x1f
    3564:	00fb7b33          	and	s6,s6,a5
    3568:	416a8ab3          	sub	s5,s5,s6
    356c:	99505663          	blez	s5,26f8 <_vfprintf_r+0x2ec>
    3570:	75818813          	addi	a6,gp,1880 # 12f28 <zeroes.0>
    3574:	01000713          	li	a4,16
    3578:	0c812783          	lw	a5,200(sp)
    357c:	01000b13          	li	s6,16
    3580:	00700c13          	li	s8,7
    3584:	00080d13          	mv	s10,a6
    3588:	01574863          	blt	a4,s5,3598 <_vfprintf_r+0x118c>
    358c:	7e00006f          	j	3d6c <_vfprintf_r+0x1960>
    3590:	ff0a8a93          	addi	s5,s5,-16
    3594:	7d5b5a63          	bge	s6,s5,3d68 <_vfprintf_r+0x195c>
    3598:	01060613          	addi	a2,a2,16
    359c:	00178793          	addi	a5,a5,1
    35a0:	01a42023          	sw	s10,0(s0)
    35a4:	01642223          	sw	s6,4(s0)
    35a8:	0cc12623          	sw	a2,204(sp)
    35ac:	0cf12423          	sw	a5,200(sp)
    35b0:	00840413          	addi	s0,s0,8
    35b4:	fcfc5ee3          	bge	s8,a5,3590 <_vfprintf_r+0x1184>
    35b8:	00812503          	lw	a0,8(sp)
    35bc:	0c410613          	addi	a2,sp,196
    35c0:	00048593          	mv	a1,s1
    35c4:	760010ef          	jal	4d24 <__sprint_r>
    35c8:	ca051ee3          	bnez	a0,3284 <_vfprintf_r+0xe78>
    35cc:	0cc12603          	lw	a2,204(sp)
    35d0:	0c812783          	lw	a5,200(sp)
    35d4:	00098413          	mv	s0,s3
    35d8:	fb9ff06f          	j	3590 <_vfprintf_r+0x1184>
    35dc:	001cf593          	andi	a1,s9,1
    35e0:	cc059e63          	bnez	a1,2abc <_vfprintf_r+0x6b0>
    35e4:	00e42223          	sw	a4,4(s0)
    35e8:	0d812623          	sw	s8,204(sp)
    35ec:	0d512423          	sw	s5,200(sp)
    35f0:	00700793          	li	a5,7
    35f4:	d957d263          	bge	a5,s5,2b78 <_vfprintf_r+0x76c>
    35f8:	00812503          	lw	a0,8(sp)
    35fc:	0c410613          	addi	a2,sp,196
    3600:	00048593          	mv	a1,s1
    3604:	720010ef          	jal	4d24 <__sprint_r>
    3608:	c6051ee3          	bnez	a0,3284 <_vfprintf_r+0xe78>
    360c:	0cc12c03          	lw	s8,204(sp)
    3610:	0c812a83          	lw	s5,200(sp)
    3614:	00098b13          	mv	s6,s3
    3618:	d60ff06f          	j	2b78 <_vfprintf_r+0x76c>
    361c:	02012703          	lw	a4,32(sp)
    3620:	00100793          	li	a5,1
    3624:	d4e7da63          	bge	a5,a4,2b78 <_vfprintf_r+0x76c>
    3628:	01100793          	li	a5,17
    362c:	75818813          	addi	a6,gp,1880 # 12f28 <zeroes.0>
    3630:	0ae7d4e3          	bge	a5,a4,3ed8 <_vfprintf_r+0x1acc>
    3634:	01212e23          	sw	s2,28(sp)
    3638:	01000793          	li	a5,16
    363c:	00700d13          	li	s10,7
    3640:	00080913          	mv	s2,a6
    3644:	00c0006f          	j	3650 <_vfprintf_r+0x1244>
    3648:	ff040413          	addi	s0,s0,-16
    364c:	0887d2e3          	bge	a5,s0,3ed0 <_vfprintf_r+0x1ac4>
    3650:	010c0c13          	addi	s8,s8,16
    3654:	001a8a93          	addi	s5,s5,1
    3658:	012b2023          	sw	s2,0(s6)
    365c:	00fb2223          	sw	a5,4(s6)
    3660:	0d812623          	sw	s8,204(sp)
    3664:	0d512423          	sw	s5,200(sp)
    3668:	008b0b13          	addi	s6,s6,8
    366c:	fd5d5ee3          	bge	s10,s5,3648 <_vfprintf_r+0x123c>
    3670:	00812503          	lw	a0,8(sp)
    3674:	0c410613          	addi	a2,sp,196
    3678:	00048593          	mv	a1,s1
    367c:	6a8010ef          	jal	4d24 <__sprint_r>
    3680:	c00512e3          	bnez	a0,3284 <_vfprintf_r+0xe78>
    3684:	0cc12c03          	lw	s8,204(sp)
    3688:	0c812a83          	lw	s5,200(sp)
    368c:	00098b13          	mv	s6,s3
    3690:	01000793          	li	a5,16
    3694:	fb5ff06f          	j	3648 <_vfprintf_r+0x123c>
    3698:	01412703          	lw	a4,20(sp)
    369c:	010ef793          	andi	a5,t4,16
    36a0:	00072b03          	lw	s6,0(a4)
    36a4:	00470713          	addi	a4,a4,4
    36a8:	00e12a23          	sw	a4,20(sp)
    36ac:	04079a63          	bnez	a5,3700 <_vfprintf_r+0x12f4>
    36b0:	040ef793          	andi	a5,t4,64
    36b4:	04078063          	beqz	a5,36f4 <_vfprintf_r+0x12e8>
    36b8:	010b1b13          	slli	s6,s6,0x10
    36bc:	010b5b13          	srli	s6,s6,0x10
    36c0:	00000d93          	li	s11,0
    36c4:	00100793          	li	a5,1
    36c8:	a28ff06f          	j	28f0 <_vfprintf_r+0x4e4>
    36cc:	00000b13          	li	s6,0
    36d0:	19010d13          	addi	s10,sp,400
    36d4:	9c0ff06f          	j	2894 <_vfprintf_r+0x488>
    36d8:	001cf793          	andi	a5,s9,1
    36dc:	00079463          	bnez	a5,36e4 <_vfprintf_r+0x12d8>
    36e0:	818ff06f          	j	26f8 <_vfprintf_r+0x2ec>
    36e4:	8adff06f          	j	2f90 <_vfprintf_r+0xb84>
    36e8:	00094883          	lbu	a7,0(s2)
    36ec:	00f12a23          	sw	a5,20(sp)
    36f0:	ebdfe06f          	j	25ac <_vfprintf_r+0x1a0>
    36f4:	200ef793          	andi	a5,t4,512
    36f8:	00078463          	beqz	a5,3700 <_vfprintf_r+0x12f4>
    36fc:	0ffb7b13          	zext.b	s6,s6
    3700:	00000d93          	li	s11,0
    3704:	00100793          	li	a5,1
    3708:	9e8ff06f          	j	28f0 <_vfprintf_r+0x4e4>
    370c:	200cf793          	andi	a5,s9,512
    3710:	380792e3          	bnez	a5,4294 <_vfprintf_r+0x1e88>
    3714:	00000d93          	li	s11,0
    3718:	9d0ff06f          	j	28e8 <_vfprintf_r+0x4dc>
    371c:	200cf793          	andi	a5,s9,512
    3720:	360790e3          	bnez	a5,4280 <_vfprintf_r+0x1e74>
    3724:	41fb5d93          	srai	s11,s6,0x1f
    3728:	000d8793          	mv	a5,s11
    372c:	940ff06f          	j	286c <_vfprintf_r+0x460>
    3730:	03c12783          	lw	a5,60(sp)
    3734:	00094883          	lbu	a7,0(s2)
    3738:	00079463          	bnez	a5,3740 <_vfprintf_r+0x1334>
    373c:	e71fe06f          	j	25ac <_vfprintf_r+0x1a0>
    3740:	0007c783          	lbu	a5,0(a5)
    3744:	00079463          	bnez	a5,374c <_vfprintf_r+0x1340>
    3748:	e65fe06f          	j	25ac <_vfprintf_r+0x1a0>
    374c:	400cec93          	ori	s9,s9,1024
    3750:	e5dfe06f          	j	25ac <_vfprintf_r+0x1a0>
    3754:	010cf793          	andi	a5,s9,16
    3758:	6a079e63          	bnez	a5,3e14 <_vfprintf_r+0x1a08>
    375c:	040cf793          	andi	a5,s9,64
    3760:	300796e3          	bnez	a5,426c <_vfprintf_r+0x1e60>
    3764:	200cfe13          	andi	t3,s9,512
    3768:	6a0e0663          	beqz	t3,3e14 <_vfprintf_r+0x1a08>
    376c:	01412783          	lw	a5,20(sp)
    3770:	00c12703          	lw	a4,12(sp)
    3774:	0007a783          	lw	a5,0(a5)
    3778:	00e78023          	sb	a4,0(a5)
    377c:	f4cff06f          	j	2ec8 <_vfprintf_r+0xabc>
    3780:	01412783          	lw	a5,20(sp)
    3784:	0007a703          	lw	a4,0(a5)
    3788:	00478793          	addi	a5,a5,4
    378c:	00f12a23          	sw	a5,20(sp)
    3790:	00072583          	lw	a1,0(a4)
    3794:	00472603          	lw	a2,4(a4)
    3798:	00872683          	lw	a3,8(a4)
    379c:	00c72703          	lw	a4,12(a4)
    37a0:	9fcff06f          	j	299c <_vfprintf_r+0x590>
    37a4:	00070a93          	mv	s5,a4
    37a8:	d15044e3          	bgtz	s5,34b0 <_vfprintf_r+0x10a4>
    37ac:	d2dff06f          	j	34d8 <_vfprintf_r+0x10cc>
    37b0:	fff00a93          	li	s5,-1
    37b4:	00068913          	mv	s2,a3
    37b8:	df9fe06f          	j	25b0 <_vfprintf_r+0x1a4>
    37bc:	3c418793          	addi	a5,gp,964 # 12b94 <keypad_map+0x34>
    37c0:	02f12a23          	sw	a5,52(sp)
    37c4:	020cf793          	andi	a5,s9,32
    37c8:	36078263          	beqz	a5,3b2c <_vfprintf_r+0x1720>
    37cc:	01412783          	lw	a5,20(sp)
    37d0:	00778c13          	addi	s8,a5,7
    37d4:	ff8c7c13          	andi	s8,s8,-8
    37d8:	000c2b03          	lw	s6,0(s8)
    37dc:	004c2d83          	lw	s11,4(s8)
    37e0:	008c0793          	addi	a5,s8,8
    37e4:	00f12a23          	sw	a5,20(sp)
    37e8:	001cf793          	andi	a5,s9,1
    37ec:	00078e63          	beqz	a5,3808 <_vfprintf_r+0x13fc>
    37f0:	01bb67b3          	or	a5,s6,s11
    37f4:	00078a63          	beqz	a5,3808 <_vfprintf_r+0x13fc>
    37f8:	03000793          	li	a5,48
    37fc:	0af10423          	sb	a5,168(sp)
    3800:	0b1104a3          	sb	a7,169(sp)
    3804:	002cec93          	ori	s9,s9,2
    3808:	bffcfe93          	andi	t4,s9,-1025
    380c:	00200793          	li	a5,2
    3810:	8e0ff06f          	j	28f0 <_vfprintf_r+0x4e4>
    3814:	000c8e93          	mv	t4,s9
    3818:	e20ff06f          	j	2e38 <_vfprintf_r+0xa2c>
    381c:	3b018793          	addi	a5,gp,944 # 12b80 <keypad_map+0x20>
    3820:	02f12a23          	sw	a5,52(sp)
    3824:	fa1ff06f          	j	37c4 <_vfprintf_r+0x13b8>
    3828:	00194883          	lbu	a7,1(s2)
    382c:	200cec93          	ori	s9,s9,512
    3830:	00190913          	addi	s2,s2,1
    3834:	d79fe06f          	j	25ac <_vfprintf_r+0x1a0>
    3838:	00194883          	lbu	a7,1(s2)
    383c:	020cec93          	ori	s9,s9,32
    3840:	00190913          	addi	s2,s2,1
    3844:	d69fe06f          	j	25ac <_vfprintf_r+0x1a0>
    3848:	00812503          	lw	a0,8(sp)
    384c:	0c410613          	addi	a2,sp,196
    3850:	00048593          	mv	a1,s1
    3854:	4d0010ef          	jal	4d24 <__sprint_r>
    3858:	a20516e3          	bnez	a0,3284 <_vfprintf_r+0xe78>
    385c:	0cc12603          	lw	a2,204(sp)
    3860:	00098413          	mv	s0,s3
    3864:	f5cff06f          	j	2fc0 <_vfprintf_r+0xbb4>
    3868:	00600793          	li	a5,6
    386c:	000a8b13          	mv	s6,s5
    3870:	1f57eae3          	bltu	a5,s5,4264 <_vfprintf_r+0x1e58>
    3874:	000b0d93          	mv	s11,s6
    3878:	01812a23          	sw	s8,20(sp)
    387c:	3d818d13          	addi	s10,gp,984 # 12ba8 <keypad_map+0x48>
    3880:	d99fe06f          	j	2618 <_vfprintf_r+0x20c>
    3884:	01000593          	li	a1,16
    3888:	0c812703          	lw	a4,200(sp)
    388c:	75818813          	addi	a6,gp,1880 # 12f28 <zeroes.0>
    3890:	6755de63          	bge	a1,s5,3f0c <_vfprintf_r+0x1b00>
    3894:	00040793          	mv	a5,s0
    3898:	01000c13          	li	s8,16
    389c:	00700b13          	li	s6,7
    38a0:	00080413          	mv	s0,a6
    38a4:	00c0006f          	j	38b0 <_vfprintf_r+0x14a4>
    38a8:	ff0a8a93          	addi	s5,s5,-16
    38ac:	655c5c63          	bge	s8,s5,3f04 <_vfprintf_r+0x1af8>
    38b0:	01060613          	addi	a2,a2,16
    38b4:	00170713          	addi	a4,a4,1
    38b8:	0087a023          	sw	s0,0(a5)
    38bc:	0187a223          	sw	s8,4(a5)
    38c0:	0cc12623          	sw	a2,204(sp)
    38c4:	0ce12423          	sw	a4,200(sp)
    38c8:	00878793          	addi	a5,a5,8
    38cc:	fceb5ee3          	bge	s6,a4,38a8 <_vfprintf_r+0x149c>
    38d0:	00812503          	lw	a0,8(sp)
    38d4:	0c410613          	addi	a2,sp,196
    38d8:	00048593          	mv	a1,s1
    38dc:	448010ef          	jal	4d24 <__sprint_r>
    38e0:	9a0512e3          	bnez	a0,3284 <_vfprintf_r+0xe78>
    38e4:	0cc12603          	lw	a2,204(sp)
    38e8:	0c812703          	lw	a4,200(sp)
    38ec:	00098793          	mv	a5,s3
    38f0:	fb9ff06f          	j	38a8 <_vfprintf_r+0x149c>
    38f4:	03012703          	lw	a4,48(sp)
    38f8:	02c12783          	lw	a5,44(sp)
    38fc:	00700593          	li	a1,7
    3900:	00e42023          	sw	a4,0(s0)
    3904:	0c812703          	lw	a4,200(sp)
    3908:	00f60633          	add	a2,a2,a5
    390c:	00f42223          	sw	a5,4(s0)
    3910:	00170713          	addi	a4,a4,1
    3914:	0cc12623          	sw	a2,204(sp)
    3918:	0ce12423          	sw	a4,200(sp)
    391c:	00840413          	addi	s0,s0,8
    3920:	bee5dae3          	bge	a1,a4,3514 <_vfprintf_r+0x1108>
    3924:	00812503          	lw	a0,8(sp)
    3928:	0c410613          	addi	a2,sp,196
    392c:	00048593          	mv	a1,s1
    3930:	3f4010ef          	jal	4d24 <__sprint_r>
    3934:	940518e3          	bnez	a0,3284 <_vfprintf_r+0xe78>
    3938:	0ac12a83          	lw	s5,172(sp)
    393c:	0cc12603          	lw	a2,204(sp)
    3940:	00098413          	mv	s0,s3
    3944:	bd1ff06f          	j	3514 <_vfprintf_r+0x1108>
    3948:	07800793          	li	a5,120
    394c:	03000713          	li	a4,48
    3950:	0ae10423          	sb	a4,168(sp)
    3954:	0af104a3          	sb	a5,169(sp)
    3958:	06300713          	li	a4,99
    395c:	00012823          	sw	zero,16(sp)
    3960:	002cec93          	ori	s9,s9,2
    3964:	12c10d13          	addi	s10,sp,300
    3968:	8b575663          	bge	a4,s5,2a14 <_vfprintf_r+0x608>
    396c:	00812503          	lw	a0,8(sp)
    3970:	001a8593          	addi	a1,s5,1
    3974:	01112823          	sw	a7,16(sp)
    3978:	548050ef          	jal	8ec0 <_malloc_r>
    397c:	01012883          	lw	a7,16(sp)
    3980:	00050d13          	mv	s10,a0
    3984:	00051463          	bnez	a0,398c <_vfprintf_r+0x1580>
    3988:	2a40106f          	j	4c2c <_vfprintf_r+0x2820>
    398c:	00a12823          	sw	a0,16(sp)
    3990:	884ff06f          	j	2a14 <_vfprintf_r+0x608>
    3994:	00812503          	lw	a0,8(sp)
    3998:	09010b13          	addi	s6,sp,144
    399c:	0ac10713          	addi	a4,sp,172
    39a0:	0bc10813          	addi	a6,sp,188
    39a4:	0b010793          	addi	a5,sp,176
    39a8:	000a8693          	mv	a3,s5
    39ac:	00200613          	li	a2,2
    39b0:	000b0593          	mv	a1,s6
    39b4:	03112423          	sw	a7,40(sp)
    39b8:	09f12823          	sw	t6,144(sp)
    39bc:	03f12223          	sw	t6,36(sp)
    39c0:	09e12a23          	sw	t5,148(sp)
    39c4:	03e12023          	sw	t5,32(sp)
    39c8:	09d12c23          	sw	t4,152(sp)
    39cc:	01d12e23          	sw	t4,28(sp)
    39d0:	09812e23          	sw	s8,156(sp)
    39d4:	0e4030ef          	jal	6ab8 <_ldtoa_r>
    39d8:	001cf713          	andi	a4,s9,1
    39dc:	01c12e83          	lw	t4,28(sp)
    39e0:	02012f03          	lw	t5,32(sp)
    39e4:	02412f83          	lw	t6,36(sp)
    39e8:	02812883          	lw	a7,40(sp)
    39ec:	00050d13          	mv	s10,a0
    39f0:	100716e3          	bnez	a4,42fc <_vfprintf_r+0x1ef0>
    39f4:	0ac12783          	lw	a5,172(sp)
    39f8:	00f12e23          	sw	a5,28(sp)
    39fc:	0bc12783          	lw	a5,188(sp)
    3a00:	40a787b3          	sub	a5,a5,a0
    3a04:	02f12023          	sw	a5,32(sp)
    3a08:	01c12783          	lw	a5,28(sp)
    3a0c:	ffd00713          	li	a4,-3
    3a10:	00e7c463          	blt	a5,a4,3a18 <_vfprintf_r+0x160c>
    3a14:	58fad4e3          	bge	s5,a5,479c <_vfprintf_r+0x2390>
    3a18:	01c12783          	lw	a5,28(sp)
    3a1c:	ffe88893          	addi	a7,a7,-2
    3a20:	fff78713          	addi	a4,a5,-1
    3a24:	0ae12623          	sw	a4,172(sp)
    3a28:	0ff8f693          	zext.b	a3,a7
    3a2c:	00000613          	li	a2,0
    3a30:	0ad10a23          	sb	a3,180(sp)
    3a34:	02b00693          	li	a3,43
    3a38:	00075a63          	bgez	a4,3a4c <_vfprintf_r+0x1640>
    3a3c:	01c12783          	lw	a5,28(sp)
    3a40:	00100713          	li	a4,1
    3a44:	02d00693          	li	a3,45
    3a48:	40f70733          	sub	a4,a4,a5
    3a4c:	0ad10aa3          	sb	a3,181(sp)
    3a50:	00900693          	li	a3,9
    3a54:	00e6c463          	blt	a3,a4,3a5c <_vfprintf_r+0x1650>
    3a58:	0180106f          	j	4a70 <_vfprintf_r+0x2664>
    3a5c:	0c310813          	addi	a6,sp,195
    3a60:	00080593          	mv	a1,a6
    3a64:	00a00513          	li	a0,10
    3a68:	06300f13          	li	t5,99
    3a6c:	02a767b3          	rem	a5,a4,a0
    3a70:	00058613          	mv	a2,a1
    3a74:	00070693          	mv	a3,a4
    3a78:	fff58593          	addi	a1,a1,-1
    3a7c:	03078793          	addi	a5,a5,48
    3a80:	fef60fa3          	sb	a5,-1(a2)
    3a84:	02a74733          	div	a4,a4,a0
    3a88:	fedf42e3          	blt	t5,a3,3a6c <_vfprintf_r+0x1660>
    3a8c:	03070713          	addi	a4,a4,48
    3a90:	ffe60693          	addi	a3,a2,-2
    3a94:	fee58fa3          	sb	a4,-1(a1)
    3a98:	0106e463          	bltu	a3,a6,3aa0 <_vfprintf_r+0x1694>
    3a9c:	1480106f          	j	4be4 <_vfprintf_r+0x27d8>
    3aa0:	0b610713          	addi	a4,sp,182
    3aa4:	0006c783          	lbu	a5,0(a3)
    3aa8:	00168693          	addi	a3,a3,1
    3aac:	00170713          	addi	a4,a4,1
    3ab0:	fef70fa3          	sb	a5,-1(a4)
    3ab4:	ff0698e3          	bne	a3,a6,3aa4 <_vfprintf_r+0x1698>
    3ab8:	19010793          	addi	a5,sp,400
    3abc:	40c78733          	sub	a4,a5,a2
    3ac0:	f3770793          	addi	a5,a4,-201
    3ac4:	04f12023          	sw	a5,64(sp)
    3ac8:	02012783          	lw	a5,32(sp)
    3acc:	04012683          	lw	a3,64(sp)
    3ad0:	00100713          	li	a4,1
    3ad4:	00d78b33          	add	s6,a5,a3
    3ad8:	00f74463          	blt	a4,a5,3ae0 <_vfprintf_r+0x16d4>
    3adc:	7d10006f          	j	4aac <_vfprintf_r+0x26a0>
    3ae0:	02c12783          	lw	a5,44(sp)
    3ae4:	00fb0b33          	add	s6,s6,a5
    3ae8:	fffb4693          	not	a3,s6
    3aec:	bffcfe13          	andi	t3,s9,-1025
    3af0:	41f6d693          	srai	a3,a3,0x1f
    3af4:	100e6793          	ori	a5,t3,256
    3af8:	04f12623          	sw	a5,76(sp)
    3afc:	00db7db3          	and	s11,s6,a3
    3b00:	02012423          	sw	zero,40(sp)
    3b04:	02012223          	sw	zero,36(sp)
    3b08:	00012e23          	sw	zero,28(sp)
    3b0c:	03812783          	lw	a5,56(sp)
    3b10:	46078ae3          	beqz	a5,4784 <_vfprintf_r+0x2378>
    3b14:	02d00713          	li	a4,45
    3b18:	04c12c83          	lw	s9,76(sp)
    3b1c:	0ae103a3          	sb	a4,167(sp)
    3b20:	00000a93          	li	s5,0
    3b24:	001d8d93          	addi	s11,s11,1
    3b28:	b05fe06f          	j	262c <_vfprintf_r+0x220>
    3b2c:	01412703          	lw	a4,20(sp)
    3b30:	010cf793          	andi	a5,s9,16
    3b34:	00072b03          	lw	s6,0(a4)
    3b38:	00470713          	addi	a4,a4,4
    3b3c:	00e12a23          	sw	a4,20(sp)
    3b40:	06079663          	bnez	a5,3bac <_vfprintf_r+0x17a0>
    3b44:	040cf793          	andi	a5,s9,64
    3b48:	04078e63          	beqz	a5,3ba4 <_vfprintf_r+0x1798>
    3b4c:	010b1b13          	slli	s6,s6,0x10
    3b50:	010b5b13          	srli	s6,s6,0x10
    3b54:	00000d93          	li	s11,0
    3b58:	c91ff06f          	j	37e8 <_vfprintf_r+0x13dc>
    3b5c:	00812503          	lw	a0,8(sp)
    3b60:	0c410613          	addi	a2,sp,196
    3b64:	00048593          	mv	a1,s1
    3b68:	1bc010ef          	jal	4d24 <__sprint_r>
    3b6c:	f0051c63          	bnez	a0,3284 <_vfprintf_r+0xe78>
    3b70:	0cc12c03          	lw	s8,204(sp)
    3b74:	0c812a83          	lw	s5,200(sp)
    3b78:	00098b13          	mv	s6,s3
    3b7c:	f5dfe06f          	j	2ad8 <_vfprintf_r+0x6cc>
    3b80:	00812503          	lw	a0,8(sp)
    3b84:	0c410613          	addi	a2,sp,196
    3b88:	00048593          	mv	a1,s1
    3b8c:	198010ef          	jal	4d24 <__sprint_r>
    3b90:	ee051a63          	bnez	a0,3284 <_vfprintf_r+0xe78>
    3b94:	0cc12c03          	lw	s8,204(sp)
    3b98:	0c812a83          	lw	s5,200(sp)
    3b9c:	00098b13          	mv	s6,s3
    3ba0:	f69fe06f          	j	2b08 <_vfprintf_r+0x6fc>
    3ba4:	200cf793          	andi	a5,s9,512
    3ba8:	6e079c63          	bnez	a5,42a0 <_vfprintf_r+0x1e94>
    3bac:	00000d93          	li	s11,0
    3bb0:	c39ff06f          	j	37e8 <_vfprintf_r+0x13dc>
    3bb4:	ccccd837          	lui	a6,0xccccd
    3bb8:	ccccdcb7          	lui	s9,0xccccd
    3bbc:	03c12703          	lw	a4,60(sp)
    3bc0:	400eff13          	andi	t5,t4,1024
    3bc4:	00000613          	li	a2,0
    3bc8:	19010593          	addi	a1,sp,400
    3bcc:	00500e13          	li	t3,5
    3bd0:	ccd80813          	addi	a6,a6,-819 # cccccccd <_memory_end+0xcccacccd>
    3bd4:	cccc8c93          	addi	s9,s9,-820 # cccccccc <_memory_end+0xcccacccc>
    3bd8:	0ff00c13          	li	s8,255
    3bdc:	0540006f          	j	3c30 <_vfprintf_r+0x1824>
    3be0:	016d37b3          	sltu	a5,s10,s6
    3be4:	00fd07b3          	add	a5,s10,a5
    3be8:	03c7f7b3          	remu	a5,a5,t3
    3bec:	40fb07b3          	sub	a5,s6,a5
    3bf0:	00fb35b3          	sltu	a1,s6,a5
    3bf4:	40bd85b3          	sub	a1,s11,a1
    3bf8:	03978333          	mul	t1,a5,s9
    3bfc:	030585b3          	mul	a1,a1,a6
    3c00:	0307b533          	mulhu	a0,a5,a6
    3c04:	006585b3          	add	a1,a1,t1
    3c08:	030787b3          	mul	a5,a5,a6
    3c0c:	00a585b3          	add	a1,a1,a0
    3c10:	01f59513          	slli	a0,a1,0x1f
    3c14:	0015d593          	srli	a1,a1,0x1
    3c18:	0017d793          	srli	a5,a5,0x1
    3c1c:	00f567b3          	or	a5,a0,a5
    3c20:	400d80e3          	beqz	s11,4820 <_vfprintf_r+0x2414>
    3c24:	00058d93          	mv	s11,a1
    3c28:	00078b13          	mv	s6,a5
    3c2c:	00068593          	mv	a1,a3
    3c30:	01bb0d33          	add	s10,s6,s11
    3c34:	016d37b3          	sltu	a5,s10,s6
    3c38:	00fd07b3          	add	a5,s10,a5
    3c3c:	03c7f7b3          	remu	a5,a5,t3
    3c40:	fff58693          	addi	a3,a1,-1
    3c44:	00160613          	addi	a2,a2,1
    3c48:	40fb07b3          	sub	a5,s6,a5
    3c4c:	00fb3533          	sltu	a0,s6,a5
    3c50:	40ad8533          	sub	a0,s11,a0
    3c54:	0307b333          	mulhu	t1,a5,a6
    3c58:	03050533          	mul	a0,a0,a6
    3c5c:	030787b3          	mul	a5,a5,a6
    3c60:	00650533          	add	a0,a0,t1
    3c64:	01f51513          	slli	a0,a0,0x1f
    3c68:	0017d793          	srli	a5,a5,0x1
    3c6c:	00f567b3          	or	a5,a0,a5
    3c70:	00279513          	slli	a0,a5,0x2
    3c74:	00f507b3          	add	a5,a0,a5
    3c78:	00179793          	slli	a5,a5,0x1
    3c7c:	40fb07b3          	sub	a5,s6,a5
    3c80:	03078793          	addi	a5,a5,48
    3c84:	fef58fa3          	sb	a5,-1(a1)
    3c88:	f40f0ce3          	beqz	t5,3be0 <_vfprintf_r+0x17d4>
    3c8c:	00074783          	lbu	a5,0(a4)
    3c90:	f4f618e3          	bne	a2,a5,3be0 <_vfprintf_r+0x17d4>
    3c94:	f58606e3          	beq	a2,s8,3be0 <_vfprintf_r+0x17d4>
    3c98:	2a0d9c63          	bnez	s11,3f50 <_vfprintf_r+0x1b44>
    3c9c:	00900793          	li	a5,9
    3ca0:	2b67e863          	bltu	a5,s6,3f50 <_vfprintf_r+0x1b44>
    3ca4:	00068d13          	mv	s10,a3
    3ca8:	19010793          	addi	a5,sp,400
    3cac:	02c12023          	sw	a2,32(sp)
    3cb0:	02e12e23          	sw	a4,60(sp)
    3cb4:	41a78b33          	sub	s6,a5,s10
    3cb8:	000e8c93          	mv	s9,t4
    3cbc:	bd9fe06f          	j	2894 <_vfprintf_r+0x488>
    3cc0:	0c812703          	lw	a4,200(sp)
    3cc4:	3e018593          	addi	a1,gp,992 # 12bb0 <keypad_map+0x50>
    3cc8:	00b42023          	sw	a1,0(s0)
    3ccc:	00160613          	addi	a2,a2,1
    3cd0:	00100593          	li	a1,1
    3cd4:	00170713          	addi	a4,a4,1
    3cd8:	00b42223          	sw	a1,4(s0)
    3cdc:	0cc12623          	sw	a2,204(sp)
    3ce0:	0ce12423          	sw	a4,200(sp)
    3ce4:	00700593          	li	a1,7
    3ce8:	00840413          	addi	s0,s0,8
    3cec:	52e5c263          	blt	a1,a4,4210 <_vfprintf_r+0x1e04>
    3cf0:	12051c63          	bnez	a0,3e28 <_vfprintf_r+0x1a1c>
    3cf4:	02012783          	lw	a5,32(sp)
    3cf8:	001cf713          	andi	a4,s9,1
    3cfc:	00f76733          	or	a4,a4,a5
    3d00:	00071463          	bnez	a4,3d08 <_vfprintf_r+0x18fc>
    3d04:	9f5fe06f          	j	26f8 <_vfprintf_r+0x2ec>
    3d08:	03012703          	lw	a4,48(sp)
    3d0c:	02c12783          	lw	a5,44(sp)
    3d10:	00700593          	li	a1,7
    3d14:	00e42023          	sw	a4,0(s0)
    3d18:	0c812703          	lw	a4,200(sp)
    3d1c:	00c78633          	add	a2,a5,a2
    3d20:	00f42223          	sw	a5,4(s0)
    3d24:	00170713          	addi	a4,a4,1
    3d28:	0cc12623          	sw	a2,204(sp)
    3d2c:	0ce12423          	sw	a4,200(sp)
    3d30:	5ae5c063          	blt	a1,a4,42d0 <_vfprintf_r+0x1ec4>
    3d34:	00840413          	addi	s0,s0,8
    3d38:	1240006f          	j	3e5c <_vfprintf_r+0x1a50>
    3d3c:	00812503          	lw	a0,8(sp)
    3d40:	69c010ef          	jal	53dc <__sinit>
    3d44:	f28fe06f          	j	246c <_vfprintf_r+0x60>
    3d48:	00812503          	lw	a0,8(sp)
    3d4c:	0c410613          	addi	a2,sp,196
    3d50:	00048593          	mv	a1,s1
    3d54:	7d1000ef          	jal	4d24 <__sprint_r>
    3d58:	d2051663          	bnez	a0,3284 <_vfprintf_r+0xe78>
    3d5c:	0cc12603          	lw	a2,204(sp)
    3d60:	00098413          	mv	s0,s3
    3d64:	a20ff06f          	j	2f84 <_vfprintf_r+0xb78>
    3d68:	000d0813          	mv	a6,s10
    3d6c:	01042023          	sw	a6,0(s0)
    3d70:	01542223          	sw	s5,4(s0)
    3d74:	01560633          	add	a2,a2,s5
    3d78:	00178793          	addi	a5,a5,1
    3d7c:	0cc12623          	sw	a2,204(sp)
    3d80:	0cf12423          	sw	a5,200(sp)
    3d84:	00700713          	li	a4,7
    3d88:	00f74463          	blt	a4,a5,3d90 <_vfprintf_r+0x1984>
    3d8c:	969fe06f          	j	26f4 <_vfprintf_r+0x2e8>
    3d90:	e15fe06f          	j	2ba4 <_vfprintf_r+0x798>
    3d94:	0d012783          	lw	a5,208(sp)
    3d98:	08010593          	addi	a1,sp,128
    3d9c:	09010513          	addi	a0,sp,144
    3da0:	08f12823          	sw	a5,144(sp)
    3da4:	0d412783          	lw	a5,212(sp)
    3da8:	08012023          	sw	zero,128(sp)
    3dac:	08012223          	sw	zero,132(sp)
    3db0:	08f12a23          	sw	a5,148(sp)
    3db4:	0d812783          	lw	a5,216(sp)
    3db8:	08012423          	sw	zero,136(sp)
    3dbc:	08012623          	sw	zero,140(sp)
    3dc0:	08f12c23          	sw	a5,152(sp)
    3dc4:	0dc12783          	lw	a5,220(sp)
    3dc8:	08f12e23          	sw	a5,156(sp)
    3dcc:	3bc0b0ef          	jal	f188 <__letf2>
    3dd0:	01012883          	lw	a7,16(sp)
    3dd4:	260542e3          	bltz	a0,4838 <_vfprintf_r+0x242c>
    3dd8:	0a714703          	lbu	a4,167(sp)
    3ddc:	04700793          	li	a5,71
    3de0:	4517dc63          	bge	a5,a7,4238 <_vfprintf_r+0x1e2c>
    3de4:	3a418d13          	addi	s10,gp,932 # 12b74 <keypad_map+0x14>
    3de8:	00012823          	sw	zero,16(sp)
    3dec:	02012423          	sw	zero,40(sp)
    3df0:	02012223          	sw	zero,36(sp)
    3df4:	00012e23          	sw	zero,28(sp)
    3df8:	f7fcfc93          	andi	s9,s9,-129
    3dfc:	00300d93          	li	s11,3
    3e00:	00300b13          	li	s6,3
    3e04:	00000a93          	li	s5,0
    3e08:	00070463          	beqz	a4,3e10 <_vfprintf_r+0x1a04>
    3e0c:	aadfe06f          	j	28b8 <_vfprintf_r+0x4ac>
    3e10:	81dfe06f          	j	262c <_vfprintf_r+0x220>
    3e14:	01412783          	lw	a5,20(sp)
    3e18:	00c12703          	lw	a4,12(sp)
    3e1c:	0007a783          	lw	a5,0(a5)
    3e20:	00e7a023          	sw	a4,0(a5)
    3e24:	8a4ff06f          	j	2ec8 <_vfprintf_r+0xabc>
    3e28:	03012703          	lw	a4,48(sp)
    3e2c:	02c12783          	lw	a5,44(sp)
    3e30:	00700593          	li	a1,7
    3e34:	00e42023          	sw	a4,0(s0)
    3e38:	0c812703          	lw	a4,200(sp)
    3e3c:	00c78633          	add	a2,a5,a2
    3e40:	00f42223          	sw	a5,4(s0)
    3e44:	00170713          	addi	a4,a4,1
    3e48:	0cc12623          	sw	a2,204(sp)
    3e4c:	0ce12423          	sw	a4,200(sp)
    3e50:	00840413          	addi	s0,s0,8
    3e54:	46e5ce63          	blt	a1,a4,42d0 <_vfprintf_r+0x1ec4>
    3e58:	34054ae3          	bltz	a0,49ac <_vfprintf_r+0x25a0>
    3e5c:	02012783          	lw	a5,32(sp)
    3e60:	00170713          	addi	a4,a4,1
    3e64:	01a42023          	sw	s10,0(s0)
    3e68:	00c78633          	add	a2,a5,a2
    3e6c:	00f42223          	sw	a5,4(s0)
    3e70:	0cc12623          	sw	a2,204(sp)
    3e74:	0ce12423          	sw	a4,200(sp)
    3e78:	00700793          	li	a5,7
    3e7c:	00e7c463          	blt	a5,a4,3e84 <_vfprintf_r+0x1a78>
    3e80:	875fe06f          	j	26f4 <_vfprintf_r+0x2e8>
    3e84:	d21fe06f          	j	2ba4 <_vfprintf_r+0x798>
    3e88:	000d0513          	mv	a0,s10
    3e8c:	03112c23          	sw	a7,56(sp)
    3e90:	5c8020ef          	jal	6458 <strlen>
    3e94:	0a714703          	lbu	a4,167(sp)
    3e98:	fff54693          	not	a3,a0
    3e9c:	41f6d693          	srai	a3,a3,0x1f
    3ea0:	01812a23          	sw	s8,20(sp)
    3ea4:	00012823          	sw	zero,16(sp)
    3ea8:	02012423          	sw	zero,40(sp)
    3eac:	02012223          	sw	zero,36(sp)
    3eb0:	00012e23          	sw	zero,28(sp)
    3eb4:	03812883          	lw	a7,56(sp)
    3eb8:	00050b13          	mv	s6,a0
    3ebc:	00d57db3          	and	s11,a0,a3
    3ec0:	00000a93          	li	s5,0
    3ec4:	00070463          	beqz	a4,3ecc <_vfprintf_r+0x1ac0>
    3ec8:	9f1fe06f          	j	28b8 <_vfprintf_r+0x4ac>
    3ecc:	f60fe06f          	j	262c <_vfprintf_r+0x220>
    3ed0:	00090813          	mv	a6,s2
    3ed4:	01c12903          	lw	s2,28(sp)
    3ed8:	008c0c33          	add	s8,s8,s0
    3edc:	001a8a93          	addi	s5,s5,1
    3ee0:	010b2023          	sw	a6,0(s6)
    3ee4:	c7dfe06f          	j	2b60 <_vfprintf_r+0x754>
    3ee8:	0dc12783          	lw	a5,220(sp)
    3eec:	3c07c063          	bltz	a5,42ac <_vfprintf_r+0x1ea0>
    3ef0:	0a714703          	lbu	a4,167(sp)
    3ef4:	04700793          	li	a5,71
    3ef8:	1b17c6e3          	blt	a5,a7,48a4 <_vfprintf_r+0x2498>
    3efc:	3a818d13          	addi	s10,gp,936 # 12b78 <keypad_map+0x18>
    3f00:	ee9ff06f          	j	3de8 <_vfprintf_r+0x19dc>
    3f04:	00040813          	mv	a6,s0
    3f08:	00078413          	mv	s0,a5
    3f0c:	01560633          	add	a2,a2,s5
    3f10:	00170713          	addi	a4,a4,1
    3f14:	01042023          	sw	a6,0(s0)
    3f18:	01542223          	sw	s5,4(s0)
    3f1c:	0cc12623          	sw	a2,204(sp)
    3f20:	0ce12423          	sw	a4,200(sp)
    3f24:	00700593          	li	a1,7
    3f28:	00840413          	addi	s0,s0,8
    3f2c:	dce5d263          	bge	a1,a4,34f0 <_vfprintf_r+0x10e4>
    3f30:	00812503          	lw	a0,8(sp)
    3f34:	0c410613          	addi	a2,sp,196
    3f38:	00048593          	mv	a1,s1
    3f3c:	5e9000ef          	jal	4d24 <__sprint_r>
    3f40:	b4051263          	bnez	a0,3284 <_vfprintf_r+0xe78>
    3f44:	0cc12603          	lw	a2,204(sp)
    3f48:	00098413          	mv	s0,s3
    3f4c:	da4ff06f          	j	34f0 <_vfprintf_r+0x10e4>
    3f50:	04812783          	lw	a5,72(sp)
    3f54:	04412583          	lw	a1,68(sp)
    3f58:	03012c23          	sw	a6,56(sp)
    3f5c:	40f686b3          	sub	a3,a3,a5
    3f60:	00078613          	mv	a2,a5
    3f64:	00068513          	mv	a0,a3
    3f68:	03e12423          	sw	t5,40(sp)
    3f6c:	03d12223          	sw	t4,36(sp)
    3f70:	03112023          	sw	a7,32(sp)
    3f74:	00e12e23          	sw	a4,28(sp)
    3f78:	00d12823          	sw	a3,16(sp)
    3f7c:	5f9010ef          	jal	5d74 <strncpy>
    3f80:	016d37b3          	sltu	a5,s10,s6
    3f84:	00500613          	li	a2,5
    3f88:	00fd07b3          	add	a5,s10,a5
    3f8c:	02c7f7b3          	remu	a5,a5,a2
    3f90:	01c12703          	lw	a4,28(sp)
    3f94:	ccccd337          	lui	t1,0xccccd
    3f98:	ccccd537          	lui	a0,0xccccd
    3f9c:	00174583          	lbu	a1,1(a4)
    3fa0:	ccd30313          	addi	t1,t1,-819 # cccccccd <_memory_end+0xcccacccd>
    3fa4:	ccc50513          	addi	a0,a0,-820 # cccccccc <_memory_end+0xcccacccc>
    3fa8:	00b035b3          	snez	a1,a1
    3fac:	00b70733          	add	a4,a4,a1
    3fb0:	01012683          	lw	a3,16(sp)
    3fb4:	02012883          	lw	a7,32(sp)
    3fb8:	02412e83          	lw	t4,36(sp)
    3fbc:	02812f03          	lw	t5,40(sp)
    3fc0:	03812803          	lw	a6,56(sp)
    3fc4:	00000613          	li	a2,0
    3fc8:	00500e13          	li	t3,5
    3fcc:	40fb07b3          	sub	a5,s6,a5
    3fd0:	00fb35b3          	sltu	a1,s6,a5
    3fd4:	40bd85b3          	sub	a1,s11,a1
    3fd8:	02a78533          	mul	a0,a5,a0
    3fdc:	026585b3          	mul	a1,a1,t1
    3fe0:	0267bfb3          	mulhu	t6,a5,t1
    3fe4:	00a585b3          	add	a1,a1,a0
    3fe8:	02678533          	mul	a0,a5,t1
    3fec:	01f585b3          	add	a1,a1,t6
    3ff0:	01f59793          	slli	a5,a1,0x1f
    3ff4:	0015d593          	srli	a1,a1,0x1
    3ff8:	00155513          	srli	a0,a0,0x1
    3ffc:	00a7e7b3          	or	a5,a5,a0
    4000:	c25ff06f          	j	3c24 <_vfprintf_r+0x1818>
    4004:	02012783          	lw	a5,32(sp)
    4008:	02412b03          	lw	s6,36(sp)
    400c:	00fd07b3          	add	a5,s10,a5
    4010:	03212c23          	sw	s2,56(sp)
    4014:	05912623          	sw	s9,76(sp)
    4018:	05712823          	sw	s7,80(sp)
    401c:	03b12223          	sw	s11,36(sp)
    4020:	02812d83          	lw	s11,40(sp)
    4024:	03a12423          	sw	s10,40(sp)
    4028:	03c12c83          	lw	s9,60(sp)
    402c:	000c0d13          	mv	s10,s8
    4030:	00812903          	lw	s2,8(sp)
    4034:	04812c03          	lw	s8,72(sp)
    4038:	00700813          	li	a6,7
    403c:	01000713          	li	a4,16
    4040:	75818a93          	addi	s5,gp,1880 # 12f28 <zeroes.0>
    4044:	00040593          	mv	a1,s0
    4048:	00078b93          	mv	s7,a5
    404c:	09605663          	blez	s6,40d8 <_vfprintf_r+0x1ccc>
    4050:	15b05e63          	blez	s11,41ac <_vfprintf_r+0x1da0>
    4054:	fffd8d93          	addi	s11,s11,-1
    4058:	04412783          	lw	a5,68(sp)
    405c:	01860633          	add	a2,a2,s8
    4060:	0185a223          	sw	s8,4(a1)
    4064:	00f5a023          	sw	a5,0(a1)
    4068:	0c812783          	lw	a5,200(sp)
    406c:	0cc12623          	sw	a2,204(sp)
    4070:	00858593          	addi	a1,a1,8
    4074:	00178793          	addi	a5,a5,1
    4078:	0cf12423          	sw	a5,200(sp)
    407c:	12f84e63          	blt	a6,a5,41b8 <_vfprintf_r+0x1dac>
    4080:	000cc683          	lbu	a3,0(s9)
    4084:	41ab8433          	sub	s0,s7,s10
    4088:	0086d463          	bge	a3,s0,4090 <_vfprintf_r+0x1c84>
    408c:	00068413          	mv	s0,a3
    4090:	02805663          	blez	s0,40bc <_vfprintf_r+0x1cb0>
    4094:	0c812683          	lw	a3,200(sp)
    4098:	00860633          	add	a2,a2,s0
    409c:	01a5a023          	sw	s10,0(a1)
    40a0:	00168693          	addi	a3,a3,1
    40a4:	0085a223          	sw	s0,4(a1)
    40a8:	0cc12623          	sw	a2,204(sp)
    40ac:	0cd12423          	sw	a3,200(sp)
    40b0:	12d84863          	blt	a6,a3,41e0 <_vfprintf_r+0x1dd4>
    40b4:	000cc683          	lbu	a3,0(s9)
    40b8:	00858593          	addi	a1,a1,8
    40bc:	fff44513          	not	a0,s0
    40c0:	41f55513          	srai	a0,a0,0x1f
    40c4:	00a477b3          	and	a5,s0,a0
    40c8:	40f68433          	sub	s0,a3,a5
    40cc:	04804263          	bgtz	s0,4110 <_vfprintf_r+0x1d04>
    40d0:	00dd0d33          	add	s10,s10,a3
    40d4:	f7604ee3          	bgtz	s6,4050 <_vfprintf_r+0x1c44>
    40d8:	f7b04ee3          	bgtz	s11,4054 <_vfprintf_r+0x1c48>
    40dc:	02012783          	lw	a5,32(sp)
    40e0:	000d0c13          	mv	s8,s10
    40e4:	02812d03          	lw	s10,40(sp)
    40e8:	03912e23          	sw	s9,60(sp)
    40ec:	03812903          	lw	s2,56(sp)
    40f0:	00fd0733          	add	a4,s10,a5
    40f4:	04c12c83          	lw	s9,76(sp)
    40f8:	05012b83          	lw	s7,80(sp)
    40fc:	02412d83          	lw	s11,36(sp)
    4100:	00058413          	mv	s0,a1
    4104:	bf877e63          	bgeu	a4,s8,3500 <_vfprintf_r+0x10f4>
    4108:	00070c13          	mv	s8,a4
    410c:	bf4ff06f          	j	3500 <_vfprintf_r+0x10f4>
    4110:	0c812683          	lw	a3,200(sp)
    4114:	75818f13          	addi	t5,gp,1880 # 12f28 <zeroes.0>
    4118:	06875463          	bge	a4,s0,4180 <_vfprintf_r+0x1d74>
    411c:	01512e23          	sw	s5,28(sp)
    4120:	00c0006f          	j	412c <_vfprintf_r+0x1d20>
    4124:	ff040413          	addi	s0,s0,-16
    4128:	04875a63          	bge	a4,s0,417c <_vfprintf_r+0x1d70>
    412c:	01060613          	addi	a2,a2,16
    4130:	00168693          	addi	a3,a3,1
    4134:	0155a023          	sw	s5,0(a1)
    4138:	00e5a223          	sw	a4,4(a1)
    413c:	0cc12623          	sw	a2,204(sp)
    4140:	0cd12423          	sw	a3,200(sp)
    4144:	00858593          	addi	a1,a1,8
    4148:	fcd85ee3          	bge	a6,a3,4124 <_vfprintf_r+0x1d18>
    414c:	0c410613          	addi	a2,sp,196
    4150:	00048593          	mv	a1,s1
    4154:	00090513          	mv	a0,s2
    4158:	3cd000ef          	jal	4d24 <__sprint_r>
    415c:	92051463          	bnez	a0,3284 <_vfprintf_r+0xe78>
    4160:	01000713          	li	a4,16
    4164:	ff040413          	addi	s0,s0,-16
    4168:	0cc12603          	lw	a2,204(sp)
    416c:	0c812683          	lw	a3,200(sp)
    4170:	00098593          	mv	a1,s3
    4174:	00700813          	li	a6,7
    4178:	fa874ae3          	blt	a4,s0,412c <_vfprintf_r+0x1d20>
    417c:	01c12f03          	lw	t5,28(sp)
    4180:	00860633          	add	a2,a2,s0
    4184:	00168693          	addi	a3,a3,1
    4188:	01e5a023          	sw	t5,0(a1)
    418c:	0085a223          	sw	s0,4(a1)
    4190:	0cc12623          	sw	a2,204(sp)
    4194:	0cd12423          	sw	a3,200(sp)
    4198:	64d84a63          	blt	a6,a3,47ec <_vfprintf_r+0x23e0>
    419c:	000cc683          	lbu	a3,0(s9)
    41a0:	00858593          	addi	a1,a1,8
    41a4:	00dd0d33          	add	s10,s10,a3
    41a8:	f2dff06f          	j	40d4 <_vfprintf_r+0x1cc8>
    41ac:	fffc8c93          	addi	s9,s9,-1
    41b0:	fffb0b13          	addi	s6,s6,-1
    41b4:	ea5ff06f          	j	4058 <_vfprintf_r+0x1c4c>
    41b8:	0c410613          	addi	a2,sp,196
    41bc:	00048593          	mv	a1,s1
    41c0:	00090513          	mv	a0,s2
    41c4:	361000ef          	jal	4d24 <__sprint_r>
    41c8:	8a051e63          	bnez	a0,3284 <_vfprintf_r+0xe78>
    41cc:	0cc12603          	lw	a2,204(sp)
    41d0:	00098593          	mv	a1,s3
    41d4:	01000713          	li	a4,16
    41d8:	00700813          	li	a6,7
    41dc:	ea5ff06f          	j	4080 <_vfprintf_r+0x1c74>
    41e0:	0c410613          	addi	a2,sp,196
    41e4:	00048593          	mv	a1,s1
    41e8:	00090513          	mv	a0,s2
    41ec:	339000ef          	jal	4d24 <__sprint_r>
    41f0:	00050463          	beqz	a0,41f8 <_vfprintf_r+0x1dec>
    41f4:	890ff06f          	j	3284 <_vfprintf_r+0xe78>
    41f8:	000cc683          	lbu	a3,0(s9)
    41fc:	0cc12603          	lw	a2,204(sp)
    4200:	00098593          	mv	a1,s3
    4204:	01000713          	li	a4,16
    4208:	00700813          	li	a6,7
    420c:	eb1ff06f          	j	40bc <_vfprintf_r+0x1cb0>
    4210:	00812503          	lw	a0,8(sp)
    4214:	0c410613          	addi	a2,sp,196
    4218:	00048593          	mv	a1,s1
    421c:	309000ef          	jal	4d24 <__sprint_r>
    4220:	00050463          	beqz	a0,4228 <_vfprintf_r+0x1e1c>
    4224:	860ff06f          	j	3284 <_vfprintf_r+0xe78>
    4228:	0ac12503          	lw	a0,172(sp)
    422c:	0cc12603          	lw	a2,204(sp)
    4230:	00098413          	mv	s0,s3
    4234:	abdff06f          	j	3cf0 <_vfprintf_r+0x18e4>
    4238:	3a018d13          	addi	s10,gp,928 # 12b70 <keypad_map+0x10>
    423c:	badff06f          	j	3de8 <_vfprintf_r+0x19dc>
    4240:	00812503          	lw	a0,8(sp)
    4244:	0c410613          	addi	a2,sp,196
    4248:	00048593          	mv	a1,s1
    424c:	2d9000ef          	jal	4d24 <__sprint_r>
    4250:	00050463          	beqz	a0,4258 <_vfprintf_r+0x1e4c>
    4254:	830ff06f          	j	3284 <_vfprintf_r+0xe78>
    4258:	0cc12603          	lw	a2,204(sp)
    425c:	00098413          	mv	s0,s3
    4260:	a78ff06f          	j	34d8 <_vfprintf_r+0x10cc>
    4264:	00600b13          	li	s6,6
    4268:	e0cff06f          	j	3874 <_vfprintf_r+0x1468>
    426c:	01412783          	lw	a5,20(sp)
    4270:	00c12703          	lw	a4,12(sp)
    4274:	0007a783          	lw	a5,0(a5)
    4278:	00e79023          	sh	a4,0(a5)
    427c:	c4dfe06f          	j	2ec8 <_vfprintf_r+0xabc>
    4280:	018b1b13          	slli	s6,s6,0x18
    4284:	418b5b13          	srai	s6,s6,0x18
    4288:	41fb5d93          	srai	s11,s6,0x1f
    428c:	000d8793          	mv	a5,s11
    4290:	ddcfe06f          	j	286c <_vfprintf_r+0x460>
    4294:	0ffb7b13          	zext.b	s6,s6
    4298:	00000d93          	li	s11,0
    429c:	e4cfe06f          	j	28e8 <_vfprintf_r+0x4dc>
    42a0:	0ffb7b13          	zext.b	s6,s6
    42a4:	00000d93          	li	s11,0
    42a8:	d40ff06f          	j	37e8 <_vfprintf_r+0x13dc>
    42ac:	02d00793          	li	a5,45
    42b0:	0af103a3          	sb	a5,167(sp)
    42b4:	02d00713          	li	a4,45
    42b8:	c3dff06f          	j	3ef4 <_vfprintf_r+0x1ae8>
    42bc:	00812503          	lw	a0,8(sp)
    42c0:	0c410613          	addi	a2,sp,196
    42c4:	00048593          	mv	a1,s1
    42c8:	25d000ef          	jal	4d24 <__sprint_r>
    42cc:	c8cfe06f          	j	2758 <_vfprintf_r+0x34c>
    42d0:	00812503          	lw	a0,8(sp)
    42d4:	0c410613          	addi	a2,sp,196
    42d8:	00048593          	mv	a1,s1
    42dc:	249000ef          	jal	4d24 <__sprint_r>
    42e0:	00050463          	beqz	a0,42e8 <_vfprintf_r+0x1edc>
    42e4:	fa1fe06f          	j	3284 <_vfprintf_r+0xe78>
    42e8:	0ac12503          	lw	a0,172(sp)
    42ec:	0cc12603          	lw	a2,204(sp)
    42f0:	0c812703          	lw	a4,200(sp)
    42f4:	00098413          	mv	s0,s3
    42f8:	b61ff06f          	j	3e58 <_vfprintf_r+0x1a4c>
    42fc:	01550733          	add	a4,a0,s5
    4300:	04700613          	li	a2,71
    4304:	08010593          	addi	a1,sp,128
    4308:	000b0513          	mv	a0,s6
    430c:	02e12223          	sw	a4,36(sp)
    4310:	02c12023          	sw	a2,32(sp)
    4314:	01112e23          	sw	a7,28(sp)
    4318:	09f12823          	sw	t6,144(sp)
    431c:	09e12a23          	sw	t5,148(sp)
    4320:	09d12c23          	sw	t4,152(sp)
    4324:	09812e23          	sw	s8,156(sp)
    4328:	08012023          	sw	zero,128(sp)
    432c:	08012223          	sw	zero,132(sp)
    4330:	08012423          	sw	zero,136(sp)
    4334:	08012623          	sw	zero,140(sp)
    4338:	4550a0ef          	jal	ef8c <__eqtf2>
    433c:	01c12883          	lw	a7,28(sp)
    4340:	02012603          	lw	a2,32(sp)
    4344:	02412703          	lw	a4,36(sp)
    4348:	56050263          	beqz	a0,48ac <_vfprintf_r+0x24a0>
    434c:	0bc12783          	lw	a5,188(sp)
    4350:	00e7fe63          	bgeu	a5,a4,436c <_vfprintf_r+0x1f60>
    4354:	03000593          	li	a1,48
    4358:	00178693          	addi	a3,a5,1
    435c:	0ad12e23          	sw	a3,188(sp)
    4360:	00b78023          	sb	a1,0(a5)
    4364:	0bc12783          	lw	a5,188(sp)
    4368:	fee7e8e3          	bltu	a5,a4,4358 <_vfprintf_r+0x1f4c>
    436c:	0ac12703          	lw	a4,172(sp)
    4370:	00e12e23          	sw	a4,28(sp)
    4374:	41a787b3          	sub	a5,a5,s10
    4378:	04700713          	li	a4,71
    437c:	02f12023          	sw	a5,32(sp)
    4380:	e8e60463          	beq	a2,a4,3a08 <_vfprintf_r+0x15fc>
    4384:	04600713          	li	a4,70
    4388:	5ae60c63          	beq	a2,a4,4940 <_vfprintf_r+0x2534>
    438c:	01c12783          	lw	a5,28(sp)
    4390:	fff78713          	addi	a4,a5,-1
    4394:	e90ff06f          	j	3a24 <_vfprintf_r+0x1618>
    4398:	001a8693          	addi	a3,s5,1
    439c:	00200613          	li	a2,2
    43a0:	00812503          	lw	a0,8(sp)
    43a4:	09010b13          	addi	s6,sp,144
    43a8:	0ac10713          	addi	a4,sp,172
    43ac:	000b0593          	mv	a1,s6
    43b0:	0bc10813          	addi	a6,sp,188
    43b4:	0b010793          	addi	a5,sp,176
    43b8:	05112823          	sw	a7,80(sp)
    43bc:	02d12423          	sw	a3,40(sp)
    43c0:	09f12823          	sw	t6,144(sp)
    43c4:	03f12223          	sw	t6,36(sp)
    43c8:	09e12a23          	sw	t5,148(sp)
    43cc:	03e12023          	sw	t5,32(sp)
    43d0:	09d12c23          	sw	t4,152(sp)
    43d4:	01d12e23          	sw	t4,28(sp)
    43d8:	09812e23          	sw	s8,156(sp)
    43dc:	6dc020ef          	jal	6ab8 <_ldtoa_r>
    43e0:	05012883          	lw	a7,80(sp)
    43e4:	02812683          	lw	a3,40(sp)
    43e8:	04600593          	li	a1,70
    43ec:	fdf8f613          	andi	a2,a7,-33
    43f0:	01c12e83          	lw	t4,28(sp)
    43f4:	02012f03          	lw	t5,32(sp)
    43f8:	02412f83          	lw	t6,36(sp)
    43fc:	00050d13          	mv	s10,a0
    4400:	00d50733          	add	a4,a0,a3
    4404:	00b61ee3          	bne	a2,a1,4c20 <_vfprintf_r+0x2814>
    4408:	000d4503          	lbu	a0,0(s10)
    440c:	03000593          	li	a1,48
    4410:	4ab50663          	beq	a0,a1,48bc <_vfprintf_r+0x24b0>
    4414:	0ac12683          	lw	a3,172(sp)
    4418:	08010593          	addi	a1,sp,128
    441c:	00d70733          	add	a4,a4,a3
    4420:	ee9ff06f          	j	4308 <_vfprintf_r+0x1efc>
    4424:	09010b13          	addi	s6,sp,144
    4428:	08010593          	addi	a1,sp,128
    442c:	0ac10613          	addi	a2,sp,172
    4430:	000b0513          	mv	a0,s6
    4434:	05112023          	sw	a7,64(sp)
    4438:	09f12023          	sw	t6,128(sp)
    443c:	09e12223          	sw	t5,132(sp)
    4440:	09d12423          	sw	t4,136(sp)
    4444:	00b12e23          	sw	a1,28(sp)
    4448:	09812623          	sw	s8,140(sp)
    444c:	098020ef          	jal	64e4 <frexpl>
    4450:	09012703          	lw	a4,144(sp)
    4454:	01c12583          	lw	a1,28(sp)
    4458:	07010613          	addi	a2,sp,112
    445c:	08e12023          	sw	a4,128(sp)
    4460:	09412703          	lw	a4,148(sp)
    4464:	000b0513          	mv	a0,s6
    4468:	06012823          	sw	zero,112(sp)
    446c:	08e12223          	sw	a4,132(sp)
    4470:	09812703          	lw	a4,152(sp)
    4474:	06012a23          	sw	zero,116(sp)
    4478:	06012c23          	sw	zero,120(sp)
    447c:	08e12423          	sw	a4,136(sp)
    4480:	09c12703          	lw	a4,156(sp)
    4484:	08e12623          	sw	a4,140(sp)
    4488:	3ffc0737          	lui	a4,0x3ffc0
    448c:	06e12e23          	sw	a4,124(sp)
    4490:	6290a0ef          	jal	f2b8 <__multf3>
    4494:	01c12583          	lw	a1,28(sp)
    4498:	09012f03          	lw	t5,144(sp)
    449c:	09412e83          	lw	t4,148(sp)
    44a0:	09812803          	lw	a6,152(sp)
    44a4:	000b0513          	mv	a0,s6
    44a8:	02b12423          	sw	a1,40(sp)
    44ac:	03e12223          	sw	t5,36(sp)
    44b0:	03d12023          	sw	t4,32(sp)
    44b4:	01012e23          	sw	a6,28(sp)
    44b8:	08012023          	sw	zero,128(sp)
    44bc:	08012223          	sw	zero,132(sp)
    44c0:	08012423          	sw	zero,136(sp)
    44c4:	08012623          	sw	zero,140(sp)
    44c8:	2c50a0ef          	jal	ef8c <__eqtf2>
    44cc:	09c12d83          	lw	s11,156(sp)
    44d0:	01c12803          	lw	a6,28(sp)
    44d4:	02012e83          	lw	t4,32(sp)
    44d8:	02412f03          	lw	t5,36(sp)
    44dc:	02812583          	lw	a1,40(sp)
    44e0:	04012883          	lw	a7,64(sp)
    44e4:	00051663          	bnez	a0,44f0 <_vfprintf_r+0x20e4>
    44e8:	00100713          	li	a4,1
    44ec:	0ae12623          	sw	a4,172(sp)
    44f0:	06100713          	li	a4,97
    44f4:	68e88e63          	beq	a7,a4,4b90 <_vfprintf_r+0x2784>
    44f8:	3c418793          	addi	a5,gp,964 # 12b94 <keypad_map+0x34>
    44fc:	00f12e23          	sw	a5,28(sp)
    4500:	03212023          	sw	s2,32(sp)
    4504:	03912423          	sw	s9,40(sp)
    4508:	05712023          	sw	s7,64(sp)
    450c:	04812623          	sw	s0,76(sp)
    4510:	000d0913          	mv	s2,s10
    4514:	04912823          	sw	s1,80(sp)
    4518:	05a12a23          	sw	s10,84(sp)
    451c:	01c12483          	lw	s1,28(sp)
    4520:	fffa8a93          	addi	s5,s5,-1
    4524:	03112223          	sw	a7,36(sp)
    4528:	000f0b93          	mv	s7,t5
    452c:	000e8c13          	mv	s8,t4
    4530:	00080c93          	mv	s9,a6
    4534:	000d8d13          	mv	s10,s11
    4538:	00058413          	mv	s0,a1
    453c:	03c0006f          	j	4578 <_vfprintf_r+0x216c>
    4540:	00040593          	mv	a1,s0
    4544:	000b0513          	mv	a0,s6
    4548:	09712823          	sw	s7,144(sp)
    454c:	09812a23          	sw	s8,148(sp)
    4550:	09912c23          	sw	s9,152(sp)
    4554:	09a12e23          	sw	s10,156(sp)
    4558:	08012023          	sw	zero,128(sp)
    455c:	08012223          	sw	zero,132(sp)
    4560:	08012423          	sw	zero,136(sp)
    4564:	08012623          	sw	zero,140(sp)
    4568:	fffa8d93          	addi	s11,s5,-1
    456c:	2210a0ef          	jal	ef8c <__eqtf2>
    4570:	5c050663          	beqz	a0,4b3c <_vfprintf_r+0x2730>
    4574:	000d8a93          	mv	s5,s11
    4578:	400307b7          	lui	a5,0x40030
    457c:	07010613          	addi	a2,sp,112
    4580:	00040593          	mv	a1,s0
    4584:	000b0513          	mv	a0,s6
    4588:	06f12e23          	sw	a5,124(sp)
    458c:	09712023          	sw	s7,128(sp)
    4590:	09812223          	sw	s8,132(sp)
    4594:	09912423          	sw	s9,136(sp)
    4598:	09a12623          	sw	s10,140(sp)
    459c:	06012823          	sw	zero,112(sp)
    45a0:	06012a23          	sw	zero,116(sp)
    45a4:	06012c23          	sw	zero,120(sp)
    45a8:	5110a0ef          	jal	f2b8 <__multf3>
    45ac:	000b0513          	mv	a0,s6
    45b0:	2280d0ef          	jal	117d8 <__fixtfsi>
    45b4:	00050593          	mv	a1,a0
    45b8:	00050d93          	mv	s11,a0
    45bc:	000b0513          	mv	a0,s6
    45c0:	09012d03          	lw	s10,144(sp)
    45c4:	09412c83          	lw	s9,148(sp)
    45c8:	09812c03          	lw	s8,152(sp)
    45cc:	09c12b83          	lw	s7,156(sp)
    45d0:	3000d0ef          	jal	118d0 <__floatsitf>
    45d4:	09012683          	lw	a3,144(sp)
    45d8:	06010613          	addi	a2,sp,96
    45dc:	07010593          	addi	a1,sp,112
    45e0:	06d12023          	sw	a3,96(sp)
    45e4:	09412683          	lw	a3,148(sp)
    45e8:	00040513          	mv	a0,s0
    45ec:	07a12823          	sw	s10,112(sp)
    45f0:	06d12223          	sw	a3,100(sp)
    45f4:	09812683          	lw	a3,152(sp)
    45f8:	07912a23          	sw	s9,116(sp)
    45fc:	07812c23          	sw	s8,120(sp)
    4600:	06d12423          	sw	a3,104(sp)
    4604:	09c12683          	lw	a3,156(sp)
    4608:	07712e23          	sw	s7,124(sp)
    460c:	06d12623          	sw	a3,108(sp)
    4610:	4ad0b0ef          	jal	102bc <__subtf3>
    4614:	01b486b3          	add	a3,s1,s11
    4618:	0006c603          	lbu	a2,0(a3)
    461c:	00090f93          	mv	t6,s2
    4620:	00190913          	addi	s2,s2,1
    4624:	08012b83          	lw	s7,128(sp)
    4628:	08412c03          	lw	s8,132(sp)
    462c:	08812c83          	lw	s9,136(sp)
    4630:	08c12d03          	lw	s10,140(sp)
    4634:	fff00793          	li	a5,-1
    4638:	fec90fa3          	sb	a2,-1(s2)
    463c:	f0fa92e3          	bne	s5,a5,4540 <_vfprintf_r+0x2134>
    4640:	02412883          	lw	a7,36(sp)
    4644:	000b8f13          	mv	t5,s7
    4648:	000c0e93          	mv	t4,s8
    464c:	000c8813          	mv	a6,s9
    4650:	00040593          	mv	a1,s0
    4654:	05b12c23          	sw	s11,88(sp)
    4658:	3ffe0ab7          	lui	s5,0x3ffe0
    465c:	000d0d93          	mv	s11,s10
    4660:	000b0513          	mv	a0,s6
    4664:	05112e23          	sw	a7,92(sp)
    4668:	03f12223          	sw	t6,36(sp)
    466c:	05012483          	lw	s1,80(sp)
    4670:	04012b83          	lw	s7,64(sp)
    4674:	02812c83          	lw	s9,40(sp)
    4678:	04c12403          	lw	s0,76(sp)
    467c:	09e12823          	sw	t5,144(sp)
    4680:	05e12823          	sw	t5,80(sp)
    4684:	09d12a23          	sw	t4,148(sp)
    4688:	05d12623          	sw	t4,76(sp)
    468c:	09012c23          	sw	a6,152(sp)
    4690:	05012023          	sw	a6,64(sp)
    4694:	09b12e23          	sw	s11,156(sp)
    4698:	08012023          	sw	zero,128(sp)
    469c:	08012223          	sw	zero,132(sp)
    46a0:	08012423          	sw	zero,136(sp)
    46a4:	09512623          	sw	s5,140(sp)
    46a8:	02b12423          	sw	a1,40(sp)
    46ac:	1ad0a0ef          	jal	f058 <__getf2>
    46b0:	00090c13          	mv	s8,s2
    46b4:	05412d03          	lw	s10,84(sp)
    46b8:	02012903          	lw	s2,32(sp)
    46bc:	02412f83          	lw	t6,36(sp)
    46c0:	05c12883          	lw	a7,92(sp)
    46c4:	02a04663          	bgtz	a0,46f0 <_vfprintf_r+0x22e4>
    46c8:	02812583          	lw	a1,40(sp)
    46cc:	000b0513          	mv	a0,s6
    46d0:	03112023          	sw	a7,32(sp)
    46d4:	0b90a0ef          	jal	ef8c <__eqtf2>
    46d8:	02012883          	lw	a7,32(sp)
    46dc:	04051e63          	bnez	a0,4738 <_vfprintf_r+0x232c>
    46e0:	05812783          	lw	a5,88(sp)
    46e4:	02412f83          	lw	t6,36(sp)
    46e8:	0017f693          	andi	a3,a5,1
    46ec:	04068663          	beqz	a3,4738 <_vfprintf_r+0x232c>
    46f0:	01c12783          	lw	a5,28(sp)
    46f4:	0bf12e23          	sw	t6,188(sp)
    46f8:	fffc4603          	lbu	a2,-1(s8)
    46fc:	00f7c583          	lbu	a1,15(a5) # 4003000f <_memory_end+0x4001000f>
    4700:	000c0693          	mv	a3,s8
    4704:	02b61063          	bne	a2,a1,4724 <_vfprintf_r+0x2318>
    4708:	03000513          	li	a0,48
    470c:	fea68fa3          	sb	a0,-1(a3)
    4710:	0bc12683          	lw	a3,188(sp)
    4714:	fff68793          	addi	a5,a3,-1
    4718:	0af12e23          	sw	a5,188(sp)
    471c:	fff6c603          	lbu	a2,-1(a3)
    4720:	fec586e3          	beq	a1,a2,470c <_vfprintf_r+0x2300>
    4724:	00160593          	addi	a1,a2,1
    4728:	03900513          	li	a0,57
    472c:	0ff5f593          	zext.b	a1,a1
    4730:	04a60463          	beq	a2,a0,4778 <_vfprintf_r+0x236c>
    4734:	feb68fa3          	sb	a1,-1(a3)
    4738:	0ac12783          	lw	a5,172(sp)
    473c:	41ac0733          	sub	a4,s8,s10
    4740:	02e12023          	sw	a4,32(sp)
    4744:	fff78713          	addi	a4,a5,-1
    4748:	00f12e23          	sw	a5,28(sp)
    474c:	06100613          	li	a2,97
    4750:	0ae12623          	sw	a4,172(sp)
    4754:	07000693          	li	a3,112
    4758:	00c88663          	beq	a7,a2,4764 <_vfprintf_r+0x2358>
    475c:	05000693          	li	a3,80
    4760:	04100893          	li	a7,65
    4764:	00100613          	li	a2,1
    4768:	ac8ff06f          	j	3a30 <_vfprintf_r+0x1624>
    476c:	000a8693          	mv	a3,s5
    4770:	00300613          	li	a2,3
    4774:	c2dff06f          	j	43a0 <_vfprintf_r+0x1f94>
    4778:	01c12783          	lw	a5,28(sp)
    477c:	00a7c583          	lbu	a1,10(a5)
    4780:	fb5ff06f          	j	4734 <_vfprintf_r+0x2328>
    4784:	0a714703          	lbu	a4,167(sp)
    4788:	04c12c83          	lw	s9,76(sp)
    478c:	00000a93          	li	s5,0
    4790:	00070463          	beqz	a4,4798 <_vfprintf_r+0x238c>
    4794:	924fe06f          	j	28b8 <_vfprintf_r+0x4ac>
    4798:	e95fd06f          	j	262c <_vfprintf_r+0x220>
    479c:	02012783          	lw	a5,32(sp)
    47a0:	01c12703          	lw	a4,28(sp)
    47a4:	1cf74863          	blt	a4,a5,4974 <_vfprintf_r+0x2568>
    47a8:	01c12783          	lw	a5,28(sp)
    47ac:	001cf713          	andi	a4,s9,1
    47b0:	00078b13          	mv	s6,a5
    47b4:	00070663          	beqz	a4,47c0 <_vfprintf_r+0x23b4>
    47b8:	02c12703          	lw	a4,44(sp)
    47bc:	00e78b33          	add	s6,a5,a4
    47c0:	400cfe13          	andi	t3,s9,1024
    47c4:	000e0663          	beqz	t3,47d0 <_vfprintf_r+0x23c4>
    47c8:	01c12783          	lw	a5,28(sp)
    47cc:	2ef04863          	bgtz	a5,4abc <_vfprintf_r+0x26b0>
    47d0:	fffb4693          	not	a3,s6
    47d4:	41f6d693          	srai	a3,a3,0x1f
    47d8:	00db7db3          	and	s11,s6,a3
    47dc:	06700893          	li	a7,103
    47e0:	02012423          	sw	zero,40(sp)
    47e4:	02012223          	sw	zero,36(sp)
    47e8:	b24ff06f          	j	3b0c <_vfprintf_r+0x1700>
    47ec:	0c410613          	addi	a2,sp,196
    47f0:	00048593          	mv	a1,s1
    47f4:	00090513          	mv	a0,s2
    47f8:	52c000ef          	jal	4d24 <__sprint_r>
    47fc:	00050463          	beqz	a0,4804 <_vfprintf_r+0x23f8>
    4800:	a85fe06f          	j	3284 <_vfprintf_r+0xe78>
    4804:	000cc683          	lbu	a3,0(s9)
    4808:	0cc12603          	lw	a2,204(sp)
    480c:	00098593          	mv	a1,s3
    4810:	01000713          	li	a4,16
    4814:	00700813          	li	a6,7
    4818:	00dd0d33          	add	s10,s10,a3
    481c:	8b9ff06f          	j	40d4 <_vfprintf_r+0x1cc8>
    4820:	00900513          	li	a0,9
    4824:	c1656063          	bltu	a0,s6,3c24 <_vfprintf_r+0x1818>
    4828:	c7cff06f          	j	3ca4 <_vfprintf_r+0x1898>
    482c:	fff00793          	li	a5,-1
    4830:	00f12623          	sw	a5,12(sp)
    4834:	f59fd06f          	j	278c <_vfprintf_r+0x380>
    4838:	02d00793          	li	a5,45
    483c:	0af103a3          	sb	a5,167(sp)
    4840:	02d00713          	li	a4,45
    4844:	d98ff06f          	j	3ddc <_vfprintf_r+0x19d0>
    4848:	0a714703          	lbu	a4,167(sp)
    484c:	01812a23          	sw	s8,20(sp)
    4850:	02012423          	sw	zero,40(sp)
    4854:	02012223          	sw	zero,36(sp)
    4858:	00012e23          	sw	zero,28(sp)
    485c:	000a8d93          	mv	s11,s5
    4860:	000a8b13          	mv	s6,s5
    4864:	00000a93          	li	s5,0
    4868:	00070463          	beqz	a4,4870 <_vfprintf_r+0x2464>
    486c:	84cfe06f          	j	28b8 <_vfprintf_r+0x4ac>
    4870:	dbdfd06f          	j	262c <_vfprintf_r+0x220>
    4874:	00812503          	lw	a0,8(sp)
    4878:	0c410613          	addi	a2,sp,196
    487c:	00048593          	mv	a1,s1
    4880:	4a4000ef          	jal	4d24 <__sprint_r>
    4884:	00050463          	beqz	a0,488c <_vfprintf_r+0x2480>
    4888:	9fdfe06f          	j	3284 <_vfprintf_r+0xe78>
    488c:	0ac12a83          	lw	s5,172(sp)
    4890:	02012783          	lw	a5,32(sp)
    4894:	0cc12603          	lw	a2,204(sp)
    4898:	00098413          	mv	s0,s3
    489c:	41578ab3          	sub	s5,a5,s5
    48a0:	cbdfe06f          	j	355c <_vfprintf_r+0x1150>
    48a4:	3ac18d13          	addi	s10,gp,940 # 12b7c <keypad_map+0x1c>
    48a8:	d40ff06f          	j	3de8 <_vfprintf_r+0x19dc>
    48ac:	0ac12783          	lw	a5,172(sp)
    48b0:	00f12e23          	sw	a5,28(sp)
    48b4:	00070793          	mv	a5,a4
    48b8:	abdff06f          	j	4374 <_vfprintf_r+0x1f68>
    48bc:	08010593          	addi	a1,sp,128
    48c0:	000b0513          	mv	a0,s6
    48c4:	04e12e23          	sw	a4,92(sp)
    48c8:	04c12c23          	sw	a2,88(sp)
    48cc:	05112a23          	sw	a7,84(sp)
    48d0:	04d12823          	sw	a3,80(sp)
    48d4:	09f12823          	sw	t6,144(sp)
    48d8:	03f12423          	sw	t6,40(sp)
    48dc:	09e12a23          	sw	t5,148(sp)
    48e0:	03e12223          	sw	t5,36(sp)
    48e4:	09d12c23          	sw	t4,152(sp)
    48e8:	03d12023          	sw	t4,32(sp)
    48ec:	00b12e23          	sw	a1,28(sp)
    48f0:	09812e23          	sw	s8,156(sp)
    48f4:	08012023          	sw	zero,128(sp)
    48f8:	08012223          	sw	zero,132(sp)
    48fc:	08012423          	sw	zero,136(sp)
    4900:	08012623          	sw	zero,140(sp)
    4904:	6880a0ef          	jal	ef8c <__eqtf2>
    4908:	01c12583          	lw	a1,28(sp)
    490c:	02012e83          	lw	t4,32(sp)
    4910:	02412f03          	lw	t5,36(sp)
    4914:	02812f83          	lw	t6,40(sp)
    4918:	05012683          	lw	a3,80(sp)
    491c:	05412883          	lw	a7,84(sp)
    4920:	05812603          	lw	a2,88(sp)
    4924:	05c12703          	lw	a4,92(sp)
    4928:	26051a63          	bnez	a0,4b9c <_vfprintf_r+0x2790>
    492c:	0ac12783          	lw	a5,172(sp)
    4930:	00f70733          	add	a4,a4,a5
    4934:	00f12e23          	sw	a5,28(sp)
    4938:	41a707b3          	sub	a5,a4,s10
    493c:	02f12023          	sw	a5,32(sp)
    4940:	01c12783          	lw	a5,28(sp)
    4944:	001cf713          	andi	a4,s9,1
    4948:	01576733          	or	a4,a4,s5
    494c:	26f05263          	blez	a5,4bb0 <_vfprintf_r+0x27a4>
    4950:	22071663          	bnez	a4,4b7c <_vfprintf_r+0x2770>
    4954:	01c12b03          	lw	s6,28(sp)
    4958:	06600893          	li	a7,102
    495c:	400cfe13          	andi	t3,s9,1024
    4960:	160e1063          	bnez	t3,4ac0 <_vfprintf_r+0x26b4>
    4964:	fffb4693          	not	a3,s6
    4968:	41f6d693          	srai	a3,a3,0x1f
    496c:	00db7db3          	and	s11,s6,a3
    4970:	e71ff06f          	j	47e0 <_vfprintf_r+0x23d4>
    4974:	02012783          	lw	a5,32(sp)
    4978:	02c12703          	lw	a4,44(sp)
    497c:	06700893          	li	a7,103
    4980:	00e78b33          	add	s6,a5,a4
    4984:	01c12783          	lw	a5,28(sp)
    4988:	fcf04ae3          	bgtz	a5,495c <_vfprintf_r+0x2550>
    498c:	40fb0f33          	sub	t5,s6,a5
    4990:	001f0b13          	addi	s6,t5,1
    4994:	fffb4693          	not	a3,s6
    4998:	41f6d693          	srai	a3,a3,0x1f
    499c:	00db7db3          	and	s11,s6,a3
    49a0:	e41ff06f          	j	47e0 <_vfprintf_r+0x23d4>
    49a4:	000c8e93          	mv	t4,s9
    49a8:	bbcfe06f          	j	2d64 <_vfprintf_r+0x958>
    49ac:	ff000593          	li	a1,-16
    49b0:	40a00ab3          	neg	s5,a0
    49b4:	75818813          	addi	a6,gp,1880 # 12f28 <zeroes.0>
    49b8:	06b55863          	bge	a0,a1,4a28 <_vfprintf_r+0x261c>
    49bc:	01212e23          	sw	s2,28(sp)
    49c0:	01000b13          	li	s6,16
    49c4:	00700c13          	li	s8,7
    49c8:	00080913          	mv	s2,a6
    49cc:	00c0006f          	j	49d8 <_vfprintf_r+0x25cc>
    49d0:	ff0a8a93          	addi	s5,s5,-16 # 3ffdfff0 <_memory_end+0x3ffbfff0>
    49d4:	055b5663          	bge	s6,s5,4a20 <_vfprintf_r+0x2614>
    49d8:	01060613          	addi	a2,a2,16
    49dc:	00170713          	addi	a4,a4,1 # 3ffc0001 <_memory_end+0x3ffa0001>
    49e0:	01242023          	sw	s2,0(s0)
    49e4:	01642223          	sw	s6,4(s0)
    49e8:	0cc12623          	sw	a2,204(sp)
    49ec:	0ce12423          	sw	a4,200(sp)
    49f0:	00840413          	addi	s0,s0,8
    49f4:	fcec5ee3          	bge	s8,a4,49d0 <_vfprintf_r+0x25c4>
    49f8:	00812503          	lw	a0,8(sp)
    49fc:	0c410613          	addi	a2,sp,196
    4a00:	00048593          	mv	a1,s1
    4a04:	320000ef          	jal	4d24 <__sprint_r>
    4a08:	00050463          	beqz	a0,4a10 <_vfprintf_r+0x2604>
    4a0c:	879fe06f          	j	3284 <_vfprintf_r+0xe78>
    4a10:	0cc12603          	lw	a2,204(sp)
    4a14:	0c812703          	lw	a4,200(sp)
    4a18:	00098413          	mv	s0,s3
    4a1c:	fb5ff06f          	j	49d0 <_vfprintf_r+0x25c4>
    4a20:	00090813          	mv	a6,s2
    4a24:	01c12903          	lw	s2,28(sp)
    4a28:	01560633          	add	a2,a2,s5
    4a2c:	00170713          	addi	a4,a4,1
    4a30:	01042023          	sw	a6,0(s0)
    4a34:	01542223          	sw	s5,4(s0)
    4a38:	0cc12623          	sw	a2,204(sp)
    4a3c:	0ce12423          	sw	a4,200(sp)
    4a40:	00700593          	li	a1,7
    4a44:	aee5d863          	bge	a1,a4,3d34 <_vfprintf_r+0x1928>
    4a48:	00812503          	lw	a0,8(sp)
    4a4c:	0c410613          	addi	a2,sp,196
    4a50:	00048593          	mv	a1,s1
    4a54:	2d0000ef          	jal	4d24 <__sprint_r>
    4a58:	00050463          	beqz	a0,4a60 <_vfprintf_r+0x2654>
    4a5c:	829fe06f          	j	3284 <_vfprintf_r+0xe78>
    4a60:	0cc12603          	lw	a2,204(sp)
    4a64:	0c812703          	lw	a4,200(sp)
    4a68:	00098413          	mv	s0,s3
    4a6c:	bf0ff06f          	j	3e5c <_vfprintf_r+0x1a50>
    4a70:	0b610693          	addi	a3,sp,182
    4a74:	00061863          	bnez	a2,4a84 <_vfprintf_r+0x2678>
    4a78:	03000693          	li	a3,48
    4a7c:	0ad10b23          	sb	a3,182(sp)
    4a80:	0b710693          	addi	a3,sp,183
    4a84:	19010793          	addi	a5,sp,400
    4a88:	40f68633          	sub	a2,a3,a5
    4a8c:	03070713          	addi	a4,a4,48
    4a90:	0dd60793          	addi	a5,a2,221
    4a94:	00e68023          	sb	a4,0(a3)
    4a98:	04f12023          	sw	a5,64(sp)
    4a9c:	82cff06f          	j	3ac8 <_vfprintf_r+0x16bc>
    4aa0:	00012823          	sw	zero,16(sp)
    4aa4:	00600a93          	li	s5,6
    4aa8:	f6dfd06f          	j	2a14 <_vfprintf_r+0x608>
    4aac:	001cf713          	andi	a4,s9,1
    4ab0:	00071463          	bnez	a4,4ab8 <_vfprintf_r+0x26ac>
    4ab4:	834ff06f          	j	3ae8 <_vfprintf_r+0x16dc>
    4ab8:	828ff06f          	j	3ae0 <_vfprintf_r+0x16d4>
    4abc:	06700893          	li	a7,103
    4ac0:	03c12603          	lw	a2,60(sp)
    4ac4:	0ff00693          	li	a3,255
    4ac8:	00064703          	lbu	a4,0(a2)
    4acc:	14d70463          	beq	a4,a3,4c14 <_vfprintf_r+0x2808>
    4ad0:	01c12783          	lw	a5,28(sp)
    4ad4:	00000513          	li	a0,0
    4ad8:	00000593          	li	a1,0
    4adc:	00f75e63          	bge	a4,a5,4af8 <_vfprintf_r+0x26ec>
    4ae0:	40e787b3          	sub	a5,a5,a4
    4ae4:	00164703          	lbu	a4,1(a2)
    4ae8:	04070463          	beqz	a4,4b30 <_vfprintf_r+0x2724>
    4aec:	00158593          	addi	a1,a1,1
    4af0:	00160613          	addi	a2,a2,1
    4af4:	fed714e3          	bne	a4,a3,4adc <_vfprintf_r+0x26d0>
    4af8:	02c12e23          	sw	a2,60(sp)
    4afc:	02b12223          	sw	a1,36(sp)
    4b00:	02a12423          	sw	a0,40(sp)
    4b04:	00f12e23          	sw	a5,28(sp)
    4b08:	02812783          	lw	a5,40(sp)
    4b0c:	02412703          	lw	a4,36(sp)
    4b10:	00e78733          	add	a4,a5,a4
    4b14:	04812783          	lw	a5,72(sp)
    4b18:	02f70733          	mul	a4,a4,a5
    4b1c:	01670b33          	add	s6,a4,s6
    4b20:	fffb4693          	not	a3,s6
    4b24:	41f6d693          	srai	a3,a3,0x1f
    4b28:	00db7db3          	and	s11,s6,a3
    4b2c:	fe1fe06f          	j	3b0c <_vfprintf_r+0x1700>
    4b30:	00064703          	lbu	a4,0(a2)
    4b34:	00150513          	addi	a0,a0,1
    4b38:	fbdff06f          	j	4af4 <_vfprintf_r+0x26e8>
    4b3c:	00090c13          	mv	s8,s2
    4b40:	001a8693          	addi	a3,s5,1
    4b44:	02412883          	lw	a7,36(sp)
    4b48:	02812c83          	lw	s9,40(sp)
    4b4c:	04012b83          	lw	s7,64(sp)
    4b50:	04c12403          	lw	s0,76(sp)
    4b54:	02012903          	lw	s2,32(sp)
    4b58:	05012483          	lw	s1,80(sp)
    4b5c:	05412d03          	lw	s10,84(sp)
    4b60:	00dc06b3          	add	a3,s8,a3
    4b64:	03000613          	li	a2,48
    4b68:	bc0ac8e3          	bltz	s5,4738 <_vfprintf_r+0x232c>
    4b6c:	001c0c13          	addi	s8,s8,1
    4b70:	fecc0fa3          	sb	a2,-1(s8)
    4b74:	fedc1ce3          	bne	s8,a3,4b6c <_vfprintf_r+0x2760>
    4b78:	bc1ff06f          	j	4738 <_vfprintf_r+0x232c>
    4b7c:	02c12703          	lw	a4,44(sp)
    4b80:	06600893          	li	a7,102
    4b84:	00ea8f33          	add	t5,s5,a4
    4b88:	00ff0b33          	add	s6,t5,a5
    4b8c:	dd1ff06f          	j	495c <_vfprintf_r+0x2550>
    4b90:	3b018793          	addi	a5,gp,944 # 12b80 <keypad_map+0x20>
    4b94:	00f12e23          	sw	a5,28(sp)
    4b98:	969ff06f          	j	4500 <_vfprintf_r+0x20f4>
    4b9c:	00100513          	li	a0,1
    4ba0:	40d506b3          	sub	a3,a0,a3
    4ba4:	0ad12623          	sw	a3,172(sp)
    4ba8:	00d70733          	add	a4,a4,a3
    4bac:	f5cff06f          	j	4308 <_vfprintf_r+0x1efc>
    4bb0:	00071a63          	bnez	a4,4bc4 <_vfprintf_r+0x27b8>
    4bb4:	00100d93          	li	s11,1
    4bb8:	06600893          	li	a7,102
    4bbc:	00100b13          	li	s6,1
    4bc0:	c21ff06f          	j	47e0 <_vfprintf_r+0x23d4>
    4bc4:	02c12783          	lw	a5,44(sp)
    4bc8:	06600893          	li	a7,102
    4bcc:	00178f13          	addi	t5,a5,1
    4bd0:	015f0b33          	add	s6,t5,s5
    4bd4:	fffb4693          	not	a3,s6
    4bd8:	41f6d693          	srai	a3,a3,0x1f
    4bdc:	00db7db3          	and	s11,s6,a3
    4be0:	c01ff06f          	j	47e0 <_vfprintf_r+0x23d4>
    4be4:	00200793          	li	a5,2
    4be8:	04f12023          	sw	a5,64(sp)
    4bec:	eddfe06f          	j	3ac8 <_vfprintf_r+0x16bc>
    4bf0:	01412783          	lw	a5,20(sp)
    4bf4:	0007aa83          	lw	s5,0(a5)
    4bf8:	00478793          	addi	a5,a5,4
    4bfc:	000ad463          	bgez	s5,4c04 <_vfprintf_r+0x27f8>
    4c00:	fff00a93          	li	s5,-1
    4c04:	00194883          	lbu	a7,1(s2)
    4c08:	00f12a23          	sw	a5,20(sp)
    4c0c:	00068913          	mv	s2,a3
    4c10:	99dfd06f          	j	25ac <_vfprintf_r+0x1a0>
    4c14:	02012423          	sw	zero,40(sp)
    4c18:	02012223          	sw	zero,36(sp)
    4c1c:	eedff06f          	j	4b08 <_vfprintf_r+0x26fc>
    4c20:	04500613          	li	a2,69
    4c24:	08010593          	addi	a1,sp,128
    4c28:	ee0ff06f          	j	4308 <_vfprintf_r+0x1efc>
    4c2c:	00c4d783          	lhu	a5,12(s1)
    4c30:	0407e793          	ori	a5,a5,64
    4c34:	00f49623          	sh	a5,12(s1)
    4c38:	b21fd06f          	j	2758 <_vfprintf_r+0x34c>

00004c3c <vfprintf>:
    4c3c:	00014737          	lui	a4,0x14
    4c40:	00050793          	mv	a5,a0
    4c44:	bcc72503          	lw	a0,-1076(a4) # 13bcc <_impure_ptr>
    4c48:	00060693          	mv	a3,a2
    4c4c:	00058613          	mv	a2,a1
    4c50:	00078593          	mv	a1,a5
    4c54:	fb8fd06f          	j	240c <_vfprintf_r>

00004c58 <__sbprintf>:
    4c58:	b8010113          	addi	sp,sp,-1152
    4c5c:	00c59783          	lh	a5,12(a1)
    4c60:	00e5d703          	lhu	a4,14(a1)
    4c64:	46812c23          	sw	s0,1144(sp)
    4c68:	00058413          	mv	s0,a1
    4c6c:	000105b7          	lui	a1,0x10
    4c70:	ffd58593          	addi	a1,a1,-3 # fffd <__multf3+0xd45>
    4c74:	06442e03          	lw	t3,100(s0)
    4c78:	01c42303          	lw	t1,28(s0)
    4c7c:	02442883          	lw	a7,36(s0)
    4c80:	01071713          	slli	a4,a4,0x10
    4c84:	00b7f7b3          	and	a5,a5,a1
    4c88:	00e7e7b3          	or	a5,a5,a4
    4c8c:	40000813          	li	a6,1024
    4c90:	00f12a23          	sw	a5,20(sp)
    4c94:	00810593          	addi	a1,sp,8
    4c98:	07010793          	addi	a5,sp,112
    4c9c:	46912a23          	sw	s1,1140(sp)
    4ca0:	47212823          	sw	s2,1136(sp)
    4ca4:	46112e23          	sw	ra,1148(sp)
    4ca8:	00050913          	mv	s2,a0
    4cac:	07c12623          	sw	t3,108(sp)
    4cb0:	02612223          	sw	t1,36(sp)
    4cb4:	03112623          	sw	a7,44(sp)
    4cb8:	00f12423          	sw	a5,8(sp)
    4cbc:	00f12c23          	sw	a5,24(sp)
    4cc0:	01012823          	sw	a6,16(sp)
    4cc4:	01012e23          	sw	a6,28(sp)
    4cc8:	02012023          	sw	zero,32(sp)
    4ccc:	f40fd0ef          	jal	240c <_vfprintf_r>
    4cd0:	00050493          	mv	s1,a0
    4cd4:	02055c63          	bgez	a0,4d0c <__sbprintf+0xb4>
    4cd8:	01415783          	lhu	a5,20(sp)
    4cdc:	0407f793          	andi	a5,a5,64
    4ce0:	00078863          	beqz	a5,4cf0 <__sbprintf+0x98>
    4ce4:	00c45783          	lhu	a5,12(s0)
    4ce8:	0407e793          	ori	a5,a5,64
    4cec:	00f41623          	sh	a5,12(s0)
    4cf0:	47c12083          	lw	ra,1148(sp)
    4cf4:	47812403          	lw	s0,1144(sp)
    4cf8:	47012903          	lw	s2,1136(sp)
    4cfc:	00048513          	mv	a0,s1
    4d00:	47412483          	lw	s1,1140(sp)
    4d04:	48010113          	addi	sp,sp,1152
    4d08:	00008067          	ret
    4d0c:	00810593          	addi	a1,sp,8
    4d10:	00090513          	mv	a0,s2
    4d14:	2a8000ef          	jal	4fbc <_fflush_r>
    4d18:	fc0500e3          	beqz	a0,4cd8 <__sbprintf+0x80>
    4d1c:	fff00493          	li	s1,-1
    4d20:	fb9ff06f          	j	4cd8 <__sbprintf+0x80>

00004d24 <__sprint_r>:
    4d24:	00862783          	lw	a5,8(a2)
    4d28:	ff010113          	addi	sp,sp,-16
    4d2c:	00812423          	sw	s0,8(sp)
    4d30:	00112623          	sw	ra,12(sp)
    4d34:	00060413          	mv	s0,a2
    4d38:	00079e63          	bnez	a5,4d54 <__sprint_r+0x30>
    4d3c:	00c12083          	lw	ra,12(sp)
    4d40:	00042223          	sw	zero,4(s0)
    4d44:	00812403          	lw	s0,8(sp)
    4d48:	00000513          	li	a0,0
    4d4c:	01010113          	addi	sp,sp,16
    4d50:	00008067          	ret
    4d54:	6e8000ef          	jal	543c <__sfvwrite_r>
    4d58:	00c12083          	lw	ra,12(sp)
    4d5c:	00042423          	sw	zero,8(s0)
    4d60:	00042223          	sw	zero,4(s0)
    4d64:	00812403          	lw	s0,8(sp)
    4d68:	01010113          	addi	sp,sp,16
    4d6c:	00008067          	ret

00004d70 <__sflush_r>:
    4d70:	00c59703          	lh	a4,12(a1)
    4d74:	fe010113          	addi	sp,sp,-32
    4d78:	00812c23          	sw	s0,24(sp)
    4d7c:	01312623          	sw	s3,12(sp)
    4d80:	00112e23          	sw	ra,28(sp)
    4d84:	00877793          	andi	a5,a4,8
    4d88:	00058413          	mv	s0,a1
    4d8c:	00050993          	mv	s3,a0
    4d90:	12079063          	bnez	a5,4eb0 <__sflush_r+0x140>
    4d94:	000017b7          	lui	a5,0x1
    4d98:	80078793          	addi	a5,a5,-2048 # 800 <main+0x514>
    4d9c:	0045a683          	lw	a3,4(a1)
    4da0:	00f767b3          	or	a5,a4,a5
    4da4:	00f59623          	sh	a5,12(a1)
    4da8:	18d05263          	blez	a3,4f2c <__sflush_r+0x1bc>
    4dac:	02842803          	lw	a6,40(s0)
    4db0:	0e080463          	beqz	a6,4e98 <__sflush_r+0x128>
    4db4:	00912a23          	sw	s1,20(sp)
    4db8:	01371693          	slli	a3,a4,0x13
    4dbc:	0009a483          	lw	s1,0(s3)
    4dc0:	0009a023          	sw	zero,0(s3)
    4dc4:	01c42583          	lw	a1,28(s0)
    4dc8:	1606ce63          	bltz	a3,4f44 <__sflush_r+0x1d4>
    4dcc:	00000613          	li	a2,0
    4dd0:	00100693          	li	a3,1
    4dd4:	00098513          	mv	a0,s3
    4dd8:	000800e7          	jalr	a6
    4ddc:	fff00793          	li	a5,-1
    4de0:	00050613          	mv	a2,a0
    4de4:	1af50463          	beq	a0,a5,4f8c <__sflush_r+0x21c>
    4de8:	00c41783          	lh	a5,12(s0)
    4dec:	02842803          	lw	a6,40(s0)
    4df0:	01c42583          	lw	a1,28(s0)
    4df4:	0047f793          	andi	a5,a5,4
    4df8:	00078e63          	beqz	a5,4e14 <__sflush_r+0xa4>
    4dfc:	00442703          	lw	a4,4(s0)
    4e00:	03042783          	lw	a5,48(s0)
    4e04:	40e60633          	sub	a2,a2,a4
    4e08:	00078663          	beqz	a5,4e14 <__sflush_r+0xa4>
    4e0c:	03c42783          	lw	a5,60(s0)
    4e10:	40f60633          	sub	a2,a2,a5
    4e14:	00000693          	li	a3,0
    4e18:	00098513          	mv	a0,s3
    4e1c:	000800e7          	jalr	a6
    4e20:	fff00793          	li	a5,-1
    4e24:	12f51463          	bne	a0,a5,4f4c <__sflush_r+0x1dc>
    4e28:	0009a683          	lw	a3,0(s3)
    4e2c:	01d00793          	li	a5,29
    4e30:	00c41703          	lh	a4,12(s0)
    4e34:	16d7ea63          	bltu	a5,a3,4fa8 <__sflush_r+0x238>
    4e38:	204007b7          	lui	a5,0x20400
    4e3c:	00178793          	addi	a5,a5,1 # 20400001 <_memory_end+0x203e0001>
    4e40:	00d7d7b3          	srl	a5,a5,a3
    4e44:	0017f793          	andi	a5,a5,1
    4e48:	16078063          	beqz	a5,4fa8 <__sflush_r+0x238>
    4e4c:	01042603          	lw	a2,16(s0)
    4e50:	fffff7b7          	lui	a5,0xfffff
    4e54:	7ff78793          	addi	a5,a5,2047 # fffff7ff <_memory_end+0xfffdf7ff>
    4e58:	00f777b3          	and	a5,a4,a5
    4e5c:	00f41623          	sh	a5,12(s0)
    4e60:	00042223          	sw	zero,4(s0)
    4e64:	00c42023          	sw	a2,0(s0)
    4e68:	01371793          	slli	a5,a4,0x13
    4e6c:	0007d463          	bgez	a5,4e74 <__sflush_r+0x104>
    4e70:	10068263          	beqz	a3,4f74 <__sflush_r+0x204>
    4e74:	03042583          	lw	a1,48(s0)
    4e78:	0099a023          	sw	s1,0(s3)
    4e7c:	10058463          	beqz	a1,4f84 <__sflush_r+0x214>
    4e80:	04040793          	addi	a5,s0,64
    4e84:	00f58663          	beq	a1,a5,4e90 <__sflush_r+0x120>
    4e88:	00098513          	mv	a0,s3
    4e8c:	121010ef          	jal	67ac <_free_r>
    4e90:	01412483          	lw	s1,20(sp)
    4e94:	02042823          	sw	zero,48(s0)
    4e98:	00000513          	li	a0,0
    4e9c:	01c12083          	lw	ra,28(sp)
    4ea0:	01812403          	lw	s0,24(sp)
    4ea4:	00c12983          	lw	s3,12(sp)
    4ea8:	02010113          	addi	sp,sp,32
    4eac:	00008067          	ret
    4eb0:	01212823          	sw	s2,16(sp)
    4eb4:	0105a903          	lw	s2,16(a1)
    4eb8:	08090263          	beqz	s2,4f3c <__sflush_r+0x1cc>
    4ebc:	00912a23          	sw	s1,20(sp)
    4ec0:	0005a483          	lw	s1,0(a1)
    4ec4:	00377713          	andi	a4,a4,3
    4ec8:	0125a023          	sw	s2,0(a1)
    4ecc:	412484b3          	sub	s1,s1,s2
    4ed0:	00000793          	li	a5,0
    4ed4:	00071463          	bnez	a4,4edc <__sflush_r+0x16c>
    4ed8:	0145a783          	lw	a5,20(a1)
    4edc:	00f42423          	sw	a5,8(s0)
    4ee0:	00904863          	bgtz	s1,4ef0 <__sflush_r+0x180>
    4ee4:	0540006f          	j	4f38 <__sflush_r+0x1c8>
    4ee8:	00a90933          	add	s2,s2,a0
    4eec:	04905663          	blez	s1,4f38 <__sflush_r+0x1c8>
    4ef0:	02442783          	lw	a5,36(s0)
    4ef4:	01c42583          	lw	a1,28(s0)
    4ef8:	00048693          	mv	a3,s1
    4efc:	00090613          	mv	a2,s2
    4f00:	00098513          	mv	a0,s3
    4f04:	000780e7          	jalr	a5
    4f08:	40a484b3          	sub	s1,s1,a0
    4f0c:	fca04ee3          	bgtz	a0,4ee8 <__sflush_r+0x178>
    4f10:	00c41703          	lh	a4,12(s0)
    4f14:	01012903          	lw	s2,16(sp)
    4f18:	04076713          	ori	a4,a4,64
    4f1c:	01412483          	lw	s1,20(sp)
    4f20:	00e41623          	sh	a4,12(s0)
    4f24:	fff00513          	li	a0,-1
    4f28:	f75ff06f          	j	4e9c <__sflush_r+0x12c>
    4f2c:	03c5a683          	lw	a3,60(a1)
    4f30:	e6d04ee3          	bgtz	a3,4dac <__sflush_r+0x3c>
    4f34:	f65ff06f          	j	4e98 <__sflush_r+0x128>
    4f38:	01412483          	lw	s1,20(sp)
    4f3c:	01012903          	lw	s2,16(sp)
    4f40:	f59ff06f          	j	4e98 <__sflush_r+0x128>
    4f44:	05042603          	lw	a2,80(s0)
    4f48:	eadff06f          	j	4df4 <__sflush_r+0x84>
    4f4c:	00c41703          	lh	a4,12(s0)
    4f50:	01042683          	lw	a3,16(s0)
    4f54:	fffff7b7          	lui	a5,0xfffff
    4f58:	7ff78793          	addi	a5,a5,2047 # fffff7ff <_memory_end+0xfffdf7ff>
    4f5c:	00f777b3          	and	a5,a4,a5
    4f60:	00f41623          	sh	a5,12(s0)
    4f64:	00042223          	sw	zero,4(s0)
    4f68:	00d42023          	sw	a3,0(s0)
    4f6c:	01371793          	slli	a5,a4,0x13
    4f70:	f007d2e3          	bgez	a5,4e74 <__sflush_r+0x104>
    4f74:	03042583          	lw	a1,48(s0)
    4f78:	04a42823          	sw	a0,80(s0)
    4f7c:	0099a023          	sw	s1,0(s3)
    4f80:	f00590e3          	bnez	a1,4e80 <__sflush_r+0x110>
    4f84:	01412483          	lw	s1,20(sp)
    4f88:	f11ff06f          	j	4e98 <__sflush_r+0x128>
    4f8c:	0009a783          	lw	a5,0(s3)
    4f90:	e4078ce3          	beqz	a5,4de8 <__sflush_r+0x78>
    4f94:	01d00713          	li	a4,29
    4f98:	00e78c63          	beq	a5,a4,4fb0 <__sflush_r+0x240>
    4f9c:	01600713          	li	a4,22
    4fa0:	00e78863          	beq	a5,a4,4fb0 <__sflush_r+0x240>
    4fa4:	00c41703          	lh	a4,12(s0)
    4fa8:	04076713          	ori	a4,a4,64
    4fac:	f71ff06f          	j	4f1c <__sflush_r+0x1ac>
    4fb0:	0099a023          	sw	s1,0(s3)
    4fb4:	01412483          	lw	s1,20(sp)
    4fb8:	ee1ff06f          	j	4e98 <__sflush_r+0x128>

00004fbc <_fflush_r>:
    4fbc:	fe010113          	addi	sp,sp,-32
    4fc0:	00812c23          	sw	s0,24(sp)
    4fc4:	00112e23          	sw	ra,28(sp)
    4fc8:	00050413          	mv	s0,a0
    4fcc:	00050663          	beqz	a0,4fd8 <_fflush_r+0x1c>
    4fd0:	03452783          	lw	a5,52(a0)
    4fd4:	02078a63          	beqz	a5,5008 <_fflush_r+0x4c>
    4fd8:	00c59783          	lh	a5,12(a1)
    4fdc:	00079c63          	bnez	a5,4ff4 <_fflush_r+0x38>
    4fe0:	01c12083          	lw	ra,28(sp)
    4fe4:	01812403          	lw	s0,24(sp)
    4fe8:	00000513          	li	a0,0
    4fec:	02010113          	addi	sp,sp,32
    4ff0:	00008067          	ret
    4ff4:	00040513          	mv	a0,s0
    4ff8:	01812403          	lw	s0,24(sp)
    4ffc:	01c12083          	lw	ra,28(sp)
    5000:	02010113          	addi	sp,sp,32
    5004:	d6dff06f          	j	4d70 <__sflush_r>
    5008:	00b12623          	sw	a1,12(sp)
    500c:	3d0000ef          	jal	53dc <__sinit>
    5010:	00c12583          	lw	a1,12(sp)
    5014:	fc5ff06f          	j	4fd8 <_fflush_r+0x1c>

00005018 <fflush>:
    5018:	06050263          	beqz	a0,507c <fflush+0x64>
    501c:	000147b7          	lui	a5,0x14
    5020:	00050593          	mv	a1,a0
    5024:	bcc7a503          	lw	a0,-1076(a5) # 13bcc <_impure_ptr>
    5028:	00050663          	beqz	a0,5034 <fflush+0x1c>
    502c:	03452783          	lw	a5,52(a0)
    5030:	00078c63          	beqz	a5,5048 <fflush+0x30>
    5034:	00c59783          	lh	a5,12(a1)
    5038:	00079663          	bnez	a5,5044 <fflush+0x2c>
    503c:	00000513          	li	a0,0
    5040:	00008067          	ret
    5044:	d2dff06f          	j	4d70 <__sflush_r>
    5048:	fe010113          	addi	sp,sp,-32
    504c:	00b12623          	sw	a1,12(sp)
    5050:	00a12423          	sw	a0,8(sp)
    5054:	00112e23          	sw	ra,28(sp)
    5058:	384000ef          	jal	53dc <__sinit>
    505c:	00c12583          	lw	a1,12(sp)
    5060:	00812503          	lw	a0,8(sp)
    5064:	00c59783          	lh	a5,12(a1)
    5068:	02079863          	bnez	a5,5098 <fflush+0x80>
    506c:	01c12083          	lw	ra,28(sp)
    5070:	00000513          	li	a0,0
    5074:	02010113          	addi	sp,sp,32
    5078:	00008067          	ret
    507c:	00013637          	lui	a2,0x13
    5080:	000055b7          	lui	a1,0x5
    5084:	00013537          	lui	a0,0x13
    5088:	5e060613          	addi	a2,a2,1504 # 135e0 <__sglue>
    508c:	fbc58593          	addi	a1,a1,-68 # 4fbc <_fflush_r>
    5090:	4c050513          	addi	a0,a0,1216 # 134c0 <_impure_data>
    5094:	0b90006f          	j	594c <_fwalk_sglue>
    5098:	01c12083          	lw	ra,28(sp)
    509c:	02010113          	addi	sp,sp,32
    50a0:	cd1ff06f          	j	4d70 <__sflush_r>

000050a4 <__fp_lock>:
    50a4:	00000513          	li	a0,0
    50a8:	00008067          	ret

000050ac <stdio_exit_handler>:
    50ac:	00013637          	lui	a2,0x13
    50b0:	0000b5b7          	lui	a1,0xb
    50b4:	00013537          	lui	a0,0x13
    50b8:	5e060613          	addi	a2,a2,1504 # 135e0 <__sglue>
    50bc:	ddc58593          	addi	a1,a1,-548 # addc <_fclose_r>
    50c0:	4c050513          	addi	a0,a0,1216 # 134c0 <_impure_data>
    50c4:	0890006f          	j	594c <_fwalk_sglue>

000050c8 <cleanup_stdio>:
    50c8:	00452583          	lw	a1,4(a0)
    50cc:	ff010113          	addi	sp,sp,-16
    50d0:	000147b7          	lui	a5,0x14
    50d4:	00812423          	sw	s0,8(sp)
    50d8:	00112623          	sw	ra,12(sp)
    50dc:	bd878793          	addi	a5,a5,-1064 # 13bd8 <__sf>
    50e0:	00050413          	mv	s0,a0
    50e4:	00f58463          	beq	a1,a5,50ec <cleanup_stdio+0x24>
    50e8:	4f5050ef          	jal	addc <_fclose_r>
    50ec:	00842583          	lw	a1,8(s0)
    50f0:	000147b7          	lui	a5,0x14
    50f4:	c4078793          	addi	a5,a5,-960 # 13c40 <__sf+0x68>
    50f8:	00f58663          	beq	a1,a5,5104 <cleanup_stdio+0x3c>
    50fc:	00040513          	mv	a0,s0
    5100:	4dd050ef          	jal	addc <_fclose_r>
    5104:	00c42583          	lw	a1,12(s0)
    5108:	000147b7          	lui	a5,0x14
    510c:	ca878793          	addi	a5,a5,-856 # 13ca8 <__sf+0xd0>
    5110:	00f58c63          	beq	a1,a5,5128 <cleanup_stdio+0x60>
    5114:	00040513          	mv	a0,s0
    5118:	00812403          	lw	s0,8(sp)
    511c:	00c12083          	lw	ra,12(sp)
    5120:	01010113          	addi	sp,sp,16
    5124:	4b90506f          	j	addc <_fclose_r>
    5128:	00c12083          	lw	ra,12(sp)
    512c:	00812403          	lw	s0,8(sp)
    5130:	01010113          	addi	sp,sp,16
    5134:	00008067          	ret

00005138 <__fp_unlock>:
    5138:	00000513          	li	a0,0
    513c:	00008067          	ret

00005140 <global_stdio_init.part.0>:
    5140:	fe010113          	addi	sp,sp,-32
    5144:	000057b7          	lui	a5,0x5
    5148:	00812c23          	sw	s0,24(sp)
    514c:	00014737          	lui	a4,0x14
    5150:	0ac78793          	addi	a5,a5,172 # 50ac <stdio_exit_handler>
    5154:	00014437          	lui	s0,0x14
    5158:	00014537          	lui	a0,0x14
    515c:	bd840413          	addi	s0,s0,-1064 # 13bd8 <__sf>
    5160:	00112e23          	sw	ra,28(sp)
    5164:	00912a23          	sw	s1,20(sp)
    5168:	01212823          	sw	s2,16(sp)
    516c:	01312623          	sw	s3,12(sp)
    5170:	01412423          	sw	s4,8(sp)
    5174:	d2f72c23          	sw	a5,-712(a4) # 13d38 <__stdio_exit_handler>
    5178:	00800613          	li	a2,8
    517c:	00400793          	li	a5,4
    5180:	00000593          	li	a1,0
    5184:	c3450513          	addi	a0,a0,-972 # 13c34 <__sf+0x5c>
    5188:	00f42623          	sw	a5,12(s0)
    518c:	00042023          	sw	zero,0(s0)
    5190:	00042223          	sw	zero,4(s0)
    5194:	00042423          	sw	zero,8(s0)
    5198:	06042223          	sw	zero,100(s0)
    519c:	00042823          	sw	zero,16(s0)
    51a0:	00042a23          	sw	zero,20(s0)
    51a4:	00042c23          	sw	zero,24(s0)
    51a8:	030010ef          	jal	61d8 <memset>
    51ac:	000107b7          	lui	a5,0x10
    51b0:	00006a37          	lui	s4,0x6
    51b4:	000069b7          	lui	s3,0x6
    51b8:	00006937          	lui	s2,0x6
    51bc:	000064b7          	lui	s1,0x6
    51c0:	00014537          	lui	a0,0x14
    51c4:	a00a0a13          	addi	s4,s4,-1536 # 5a00 <__sread>
    51c8:	a6498993          	addi	s3,s3,-1436 # 5a64 <__swrite>
    51cc:	aec90913          	addi	s2,s2,-1300 # 5aec <__sseek>
    51d0:	b6448493          	addi	s1,s1,-1180 # 5b64 <__sclose>
    51d4:	00978793          	addi	a5,a5,9 # 10009 <__multf3+0xd51>
    51d8:	00800613          	li	a2,8
    51dc:	00000593          	li	a1,0
    51e0:	c9c50513          	addi	a0,a0,-868 # 13c9c <__sf+0xc4>
    51e4:	03442023          	sw	s4,32(s0)
    51e8:	03342223          	sw	s3,36(s0)
    51ec:	03242423          	sw	s2,40(s0)
    51f0:	02942623          	sw	s1,44(s0)
    51f4:	06f42a23          	sw	a5,116(s0)
    51f8:	00842e23          	sw	s0,28(s0)
    51fc:	06042423          	sw	zero,104(s0)
    5200:	06042623          	sw	zero,108(s0)
    5204:	06042823          	sw	zero,112(s0)
    5208:	0c042623          	sw	zero,204(s0)
    520c:	06042c23          	sw	zero,120(s0)
    5210:	06042e23          	sw	zero,124(s0)
    5214:	08042023          	sw	zero,128(s0)
    5218:	7c1000ef          	jal	61d8 <memset>
    521c:	000207b7          	lui	a5,0x20
    5220:	00014537          	lui	a0,0x14
    5224:	00014737          	lui	a4,0x14
    5228:	01278793          	addi	a5,a5,18 # 20012 <_memory_end+0x12>
    522c:	c4070713          	addi	a4,a4,-960 # 13c40 <__sf+0x68>
    5230:	00800613          	li	a2,8
    5234:	00000593          	li	a1,0
    5238:	d0450513          	addi	a0,a0,-764 # 13d04 <__sf+0x12c>
    523c:	09442423          	sw	s4,136(s0)
    5240:	09342623          	sw	s3,140(s0)
    5244:	09242823          	sw	s2,144(s0)
    5248:	08942a23          	sw	s1,148(s0)
    524c:	0cf42e23          	sw	a5,220(s0)
    5250:	08e42223          	sw	a4,132(s0)
    5254:	0c042823          	sw	zero,208(s0)
    5258:	0c042a23          	sw	zero,212(s0)
    525c:	0c042c23          	sw	zero,216(s0)
    5260:	12042a23          	sw	zero,308(s0)
    5264:	0e042023          	sw	zero,224(s0)
    5268:	0e042223          	sw	zero,228(s0)
    526c:	0e042423          	sw	zero,232(s0)
    5270:	769000ef          	jal	61d8 <memset>
    5274:	000147b7          	lui	a5,0x14
    5278:	ca878793          	addi	a5,a5,-856 # 13ca8 <__sf+0xd0>
    527c:	0f442823          	sw	s4,240(s0)
    5280:	0f342a23          	sw	s3,244(s0)
    5284:	0f242c23          	sw	s2,248(s0)
    5288:	0e942e23          	sw	s1,252(s0)
    528c:	01c12083          	lw	ra,28(sp)
    5290:	0ef42623          	sw	a5,236(s0)
    5294:	01812403          	lw	s0,24(sp)
    5298:	01412483          	lw	s1,20(sp)
    529c:	01012903          	lw	s2,16(sp)
    52a0:	00c12983          	lw	s3,12(sp)
    52a4:	00812a03          	lw	s4,8(sp)
    52a8:	02010113          	addi	sp,sp,32
    52ac:	00008067          	ret

000052b0 <__sfp>:
    52b0:	000147b7          	lui	a5,0x14
    52b4:	d387a783          	lw	a5,-712(a5) # 13d38 <__stdio_exit_handler>
    52b8:	fe010113          	addi	sp,sp,-32
    52bc:	01312623          	sw	s3,12(sp)
    52c0:	00112e23          	sw	ra,28(sp)
    52c4:	00812c23          	sw	s0,24(sp)
    52c8:	00912a23          	sw	s1,20(sp)
    52cc:	01212823          	sw	s2,16(sp)
    52d0:	00050993          	mv	s3,a0
    52d4:	0e078863          	beqz	a5,53c4 <__sfp+0x114>
    52d8:	00013937          	lui	s2,0x13
    52dc:	5e090913          	addi	s2,s2,1504 # 135e0 <__sglue>
    52e0:	fff00493          	li	s1,-1
    52e4:	00492783          	lw	a5,4(s2)
    52e8:	00892403          	lw	s0,8(s2)
    52ec:	fff78793          	addi	a5,a5,-1
    52f0:	0007d863          	bgez	a5,5300 <__sfp+0x50>
    52f4:	0800006f          	j	5374 <__sfp+0xc4>
    52f8:	06840413          	addi	s0,s0,104
    52fc:	06978c63          	beq	a5,s1,5374 <__sfp+0xc4>
    5300:	00c41703          	lh	a4,12(s0)
    5304:	fff78793          	addi	a5,a5,-1
    5308:	fe0718e3          	bnez	a4,52f8 <__sfp+0x48>
    530c:	ffff07b7          	lui	a5,0xffff0
    5310:	00178793          	addi	a5,a5,1 # ffff0001 <_memory_end+0xfffd0001>
    5314:	00f42623          	sw	a5,12(s0)
    5318:	06042223          	sw	zero,100(s0)
    531c:	00042023          	sw	zero,0(s0)
    5320:	00042423          	sw	zero,8(s0)
    5324:	00042223          	sw	zero,4(s0)
    5328:	00042823          	sw	zero,16(s0)
    532c:	00042a23          	sw	zero,20(s0)
    5330:	00042c23          	sw	zero,24(s0)
    5334:	00800613          	li	a2,8
    5338:	00000593          	li	a1,0
    533c:	05c40513          	addi	a0,s0,92
    5340:	699000ef          	jal	61d8 <memset>
    5344:	02042823          	sw	zero,48(s0)
    5348:	02042a23          	sw	zero,52(s0)
    534c:	04042223          	sw	zero,68(s0)
    5350:	04042423          	sw	zero,72(s0)
    5354:	01c12083          	lw	ra,28(sp)
    5358:	00040513          	mv	a0,s0
    535c:	01812403          	lw	s0,24(sp)
    5360:	01412483          	lw	s1,20(sp)
    5364:	01012903          	lw	s2,16(sp)
    5368:	00c12983          	lw	s3,12(sp)
    536c:	02010113          	addi	sp,sp,32
    5370:	00008067          	ret
    5374:	00092403          	lw	s0,0(s2)
    5378:	00040663          	beqz	s0,5384 <__sfp+0xd4>
    537c:	00040913          	mv	s2,s0
    5380:	f65ff06f          	j	52e4 <__sfp+0x34>
    5384:	1ac00593          	li	a1,428
    5388:	00098513          	mv	a0,s3
    538c:	335030ef          	jal	8ec0 <_malloc_r>
    5390:	00050413          	mv	s0,a0
    5394:	02050c63          	beqz	a0,53cc <__sfp+0x11c>
    5398:	00c50513          	addi	a0,a0,12
    539c:	00400793          	li	a5,4
    53a0:	00042023          	sw	zero,0(s0)
    53a4:	00f42223          	sw	a5,4(s0)
    53a8:	00a42423          	sw	a0,8(s0)
    53ac:	1a000613          	li	a2,416
    53b0:	00000593          	li	a1,0
    53b4:	625000ef          	jal	61d8 <memset>
    53b8:	00892023          	sw	s0,0(s2)
    53bc:	00040913          	mv	s2,s0
    53c0:	f25ff06f          	j	52e4 <__sfp+0x34>
    53c4:	d7dff0ef          	jal	5140 <global_stdio_init.part.0>
    53c8:	f11ff06f          	j	52d8 <__sfp+0x28>
    53cc:	00092023          	sw	zero,0(s2)
    53d0:	00c00793          	li	a5,12
    53d4:	00f9a023          	sw	a5,0(s3)
    53d8:	f7dff06f          	j	5354 <__sfp+0xa4>

000053dc <__sinit>:
    53dc:	03452783          	lw	a5,52(a0)
    53e0:	00078463          	beqz	a5,53e8 <__sinit+0xc>
    53e4:	00008067          	ret
    53e8:	000147b7          	lui	a5,0x14
    53ec:	d387a703          	lw	a4,-712(a5) # 13d38 <__stdio_exit_handler>
    53f0:	000057b7          	lui	a5,0x5
    53f4:	0c878793          	addi	a5,a5,200 # 50c8 <cleanup_stdio>
    53f8:	02f52a23          	sw	a5,52(a0)
    53fc:	fe0714e3          	bnez	a4,53e4 <__sinit+0x8>
    5400:	d41ff06f          	j	5140 <global_stdio_init.part.0>

00005404 <__sfp_lock_acquire>:
    5404:	00008067          	ret

00005408 <__sfp_lock_release>:
    5408:	00008067          	ret

0000540c <__fp_lock_all>:
    540c:	00013637          	lui	a2,0x13
    5410:	000055b7          	lui	a1,0x5
    5414:	5e060613          	addi	a2,a2,1504 # 135e0 <__sglue>
    5418:	0a458593          	addi	a1,a1,164 # 50a4 <__fp_lock>
    541c:	00000513          	li	a0,0
    5420:	52c0006f          	j	594c <_fwalk_sglue>

00005424 <__fp_unlock_all>:
    5424:	00013637          	lui	a2,0x13
    5428:	000055b7          	lui	a1,0x5
    542c:	5e060613          	addi	a2,a2,1504 # 135e0 <__sglue>
    5430:	13858593          	addi	a1,a1,312 # 5138 <__fp_unlock>
    5434:	00000513          	li	a0,0
    5438:	5140006f          	j	594c <_fwalk_sglue>

0000543c <__sfvwrite_r>:
    543c:	00862783          	lw	a5,8(a2)
    5440:	2c078463          	beqz	a5,5708 <__sfvwrite_r+0x2cc>
    5444:	00c59683          	lh	a3,12(a1)
    5448:	fd010113          	addi	sp,sp,-48
    544c:	02812423          	sw	s0,40(sp)
    5450:	01412c23          	sw	s4,24(sp)
    5454:	01612823          	sw	s6,16(sp)
    5458:	02112623          	sw	ra,44(sp)
    545c:	0086f793          	andi	a5,a3,8
    5460:	00060b13          	mv	s6,a2
    5464:	00050a13          	mv	s4,a0
    5468:	00058413          	mv	s0,a1
    546c:	08078e63          	beqz	a5,5508 <__sfvwrite_r+0xcc>
    5470:	0105a783          	lw	a5,16(a1)
    5474:	08078a63          	beqz	a5,5508 <__sfvwrite_r+0xcc>
    5478:	02912223          	sw	s1,36(sp)
    547c:	03212023          	sw	s2,32(sp)
    5480:	01312e23          	sw	s3,28(sp)
    5484:	01512a23          	sw	s5,20(sp)
    5488:	0026f793          	andi	a5,a3,2
    548c:	000b2483          	lw	s1,0(s6)
    5490:	0a078463          	beqz	a5,5538 <__sfvwrite_r+0xfc>
    5494:	02442783          	lw	a5,36(s0)
    5498:	01c42583          	lw	a1,28(s0)
    549c:	80000ab7          	lui	s5,0x80000
    54a0:	00000993          	li	s3,0
    54a4:	00000913          	li	s2,0
    54a8:	c00a8a93          	addi	s5,s5,-1024 # 7ffffc00 <_memory_end+0x7ffdfc00>
    54ac:	00098613          	mv	a2,s3
    54b0:	000a0513          	mv	a0,s4
    54b4:	04090263          	beqz	s2,54f8 <__sfvwrite_r+0xbc>
    54b8:	00090693          	mv	a3,s2
    54bc:	012af463          	bgeu	s5,s2,54c4 <__sfvwrite_r+0x88>
    54c0:	000a8693          	mv	a3,s5
    54c4:	000780e7          	jalr	a5
    54c8:	46a05063          	blez	a0,5928 <__sfvwrite_r+0x4ec>
    54cc:	008b2783          	lw	a5,8(s6)
    54d0:	00a989b3          	add	s3,s3,a0
    54d4:	40a90933          	sub	s2,s2,a0
    54d8:	40a787b3          	sub	a5,a5,a0
    54dc:	00fb2423          	sw	a5,8(s6)
    54e0:	1a078663          	beqz	a5,568c <__sfvwrite_r+0x250>
    54e4:	02442783          	lw	a5,36(s0)
    54e8:	01c42583          	lw	a1,28(s0)
    54ec:	00098613          	mv	a2,s3
    54f0:	000a0513          	mv	a0,s4
    54f4:	fc0912e3          	bnez	s2,54b8 <__sfvwrite_r+0x7c>
    54f8:	0004a983          	lw	s3,0(s1)
    54fc:	0044a903          	lw	s2,4(s1)
    5500:	00848493          	addi	s1,s1,8
    5504:	fa9ff06f          	j	54ac <__sfvwrite_r+0x70>
    5508:	00040593          	mv	a1,s0
    550c:	000a0513          	mv	a0,s4
    5510:	65c000ef          	jal	5b6c <__swsetup_r>
    5514:	1c051c63          	bnez	a0,56ec <__sfvwrite_r+0x2b0>
    5518:	00c41683          	lh	a3,12(s0)
    551c:	02912223          	sw	s1,36(sp)
    5520:	03212023          	sw	s2,32(sp)
    5524:	01312e23          	sw	s3,28(sp)
    5528:	01512a23          	sw	s5,20(sp)
    552c:	0026f793          	andi	a5,a3,2
    5530:	000b2483          	lw	s1,0(s6)
    5534:	f60790e3          	bnez	a5,5494 <__sfvwrite_r+0x58>
    5538:	01712623          	sw	s7,12(sp)
    553c:	01812423          	sw	s8,8(sp)
    5540:	0016f793          	andi	a5,a3,1
    5544:	1c079663          	bnez	a5,5710 <__sfvwrite_r+0x2d4>
    5548:	00042783          	lw	a5,0(s0)
    554c:	00842703          	lw	a4,8(s0)
    5550:	80000ab7          	lui	s5,0x80000
    5554:	01912223          	sw	s9,4(sp)
    5558:	00000b93          	li	s7,0
    555c:	00000993          	li	s3,0
    5560:	fffa8a93          	addi	s5,s5,-1 # 7fffffff <_memory_end+0x7ffdffff>
    5564:	00078513          	mv	a0,a5
    5568:	00070c13          	mv	s8,a4
    556c:	10098263          	beqz	s3,5670 <__sfvwrite_r+0x234>
    5570:	2006f613          	andi	a2,a3,512
    5574:	28060863          	beqz	a2,5804 <__sfvwrite_r+0x3c8>
    5578:	00070c93          	mv	s9,a4
    557c:	32e9e663          	bltu	s3,a4,58a8 <__sfvwrite_r+0x46c>
    5580:	4806f713          	andi	a4,a3,1152
    5584:	08070a63          	beqz	a4,5618 <__sfvwrite_r+0x1dc>
    5588:	01442603          	lw	a2,20(s0)
    558c:	01042583          	lw	a1,16(s0)
    5590:	00161713          	slli	a4,a2,0x1
    5594:	00c70733          	add	a4,a4,a2
    5598:	40b78933          	sub	s2,a5,a1
    559c:	01f75c13          	srli	s8,a4,0x1f
    55a0:	00ec0c33          	add	s8,s8,a4
    55a4:	00190793          	addi	a5,s2,1
    55a8:	401c5c13          	srai	s8,s8,0x1
    55ac:	013787b3          	add	a5,a5,s3
    55b0:	000c0613          	mv	a2,s8
    55b4:	00fc7663          	bgeu	s8,a5,55c0 <__sfvwrite_r+0x184>
    55b8:	00078c13          	mv	s8,a5
    55bc:	00078613          	mv	a2,a5
    55c0:	4006f693          	andi	a3,a3,1024
    55c4:	30068e63          	beqz	a3,58e0 <__sfvwrite_r+0x4a4>
    55c8:	00060593          	mv	a1,a2
    55cc:	000a0513          	mv	a0,s4
    55d0:	0f1030ef          	jal	8ec0 <_malloc_r>
    55d4:	00050c93          	mv	s9,a0
    55d8:	34050c63          	beqz	a0,5930 <__sfvwrite_r+0x4f4>
    55dc:	01042583          	lw	a1,16(s0)
    55e0:	00090613          	mv	a2,s2
    55e4:	4d1000ef          	jal	62b4 <memcpy>
    55e8:	00c45783          	lhu	a5,12(s0)
    55ec:	b7f7f793          	andi	a5,a5,-1153
    55f0:	0807e793          	ori	a5,a5,128
    55f4:	00f41623          	sh	a5,12(s0)
    55f8:	012c8533          	add	a0,s9,s2
    55fc:	412c07b3          	sub	a5,s8,s2
    5600:	01942823          	sw	s9,16(s0)
    5604:	01842a23          	sw	s8,20(s0)
    5608:	00a42023          	sw	a0,0(s0)
    560c:	00098c13          	mv	s8,s3
    5610:	00f42423          	sw	a5,8(s0)
    5614:	00098c93          	mv	s9,s3
    5618:	000c8613          	mv	a2,s9
    561c:	000b8593          	mv	a1,s7
    5620:	2ad000ef          	jal	60cc <memmove>
    5624:	00842703          	lw	a4,8(s0)
    5628:	00042783          	lw	a5,0(s0)
    562c:	00098913          	mv	s2,s3
    5630:	41870733          	sub	a4,a4,s8
    5634:	019787b3          	add	a5,a5,s9
    5638:	00e42423          	sw	a4,8(s0)
    563c:	00f42023          	sw	a5,0(s0)
    5640:	00000993          	li	s3,0
    5644:	008b2783          	lw	a5,8(s6)
    5648:	012b8bb3          	add	s7,s7,s2
    564c:	412787b3          	sub	a5,a5,s2
    5650:	00fb2423          	sw	a5,8(s6)
    5654:	02078663          	beqz	a5,5680 <__sfvwrite_r+0x244>
    5658:	00042783          	lw	a5,0(s0)
    565c:	00842703          	lw	a4,8(s0)
    5660:	00c41683          	lh	a3,12(s0)
    5664:	00078513          	mv	a0,a5
    5668:	00070c13          	mv	s8,a4
    566c:	f00992e3          	bnez	s3,5570 <__sfvwrite_r+0x134>
    5670:	0004ab83          	lw	s7,0(s1)
    5674:	0044a983          	lw	s3,4(s1)
    5678:	00848493          	addi	s1,s1,8
    567c:	ee9ff06f          	j	5564 <__sfvwrite_r+0x128>
    5680:	00c12b83          	lw	s7,12(sp)
    5684:	00812c03          	lw	s8,8(sp)
    5688:	00412c83          	lw	s9,4(sp)
    568c:	02c12083          	lw	ra,44(sp)
    5690:	02812403          	lw	s0,40(sp)
    5694:	02412483          	lw	s1,36(sp)
    5698:	02012903          	lw	s2,32(sp)
    569c:	01c12983          	lw	s3,28(sp)
    56a0:	01412a83          	lw	s5,20(sp)
    56a4:	01812a03          	lw	s4,24(sp)
    56a8:	01012b03          	lw	s6,16(sp)
    56ac:	00000513          	li	a0,0
    56b0:	03010113          	addi	sp,sp,48
    56b4:	00008067          	ret
    56b8:	00040593          	mv	a1,s0
    56bc:	000a0513          	mv	a0,s4
    56c0:	8fdff0ef          	jal	4fbc <_fflush_r>
    56c4:	0a050e63          	beqz	a0,5780 <__sfvwrite_r+0x344>
    56c8:	00c41783          	lh	a5,12(s0)
    56cc:	00c12b83          	lw	s7,12(sp)
    56d0:	00812c03          	lw	s8,8(sp)
    56d4:	02412483          	lw	s1,36(sp)
    56d8:	02012903          	lw	s2,32(sp)
    56dc:	01c12983          	lw	s3,28(sp)
    56e0:	01412a83          	lw	s5,20(sp)
    56e4:	0407e793          	ori	a5,a5,64
    56e8:	00f41623          	sh	a5,12(s0)
    56ec:	02c12083          	lw	ra,44(sp)
    56f0:	02812403          	lw	s0,40(sp)
    56f4:	01812a03          	lw	s4,24(sp)
    56f8:	01012b03          	lw	s6,16(sp)
    56fc:	fff00513          	li	a0,-1
    5700:	03010113          	addi	sp,sp,48
    5704:	00008067          	ret
    5708:	00000513          	li	a0,0
    570c:	00008067          	ret
    5710:	00000a93          	li	s5,0
    5714:	00000513          	li	a0,0
    5718:	00000c13          	li	s8,0
    571c:	00000993          	li	s3,0
    5720:	08098263          	beqz	s3,57a4 <__sfvwrite_r+0x368>
    5724:	08050a63          	beqz	a0,57b8 <__sfvwrite_r+0x37c>
    5728:	000a8793          	mv	a5,s5
    572c:	00098b93          	mv	s7,s3
    5730:	0137f463          	bgeu	a5,s3,5738 <__sfvwrite_r+0x2fc>
    5734:	00078b93          	mv	s7,a5
    5738:	00042503          	lw	a0,0(s0)
    573c:	01042783          	lw	a5,16(s0)
    5740:	00842903          	lw	s2,8(s0)
    5744:	01442683          	lw	a3,20(s0)
    5748:	00a7f663          	bgeu	a5,a0,5754 <__sfvwrite_r+0x318>
    574c:	00d90933          	add	s2,s2,a3
    5750:	09794463          	blt	s2,s7,57d8 <__sfvwrite_r+0x39c>
    5754:	16dbc063          	blt	s7,a3,58b4 <__sfvwrite_r+0x478>
    5758:	02442783          	lw	a5,36(s0)
    575c:	01c42583          	lw	a1,28(s0)
    5760:	000c0613          	mv	a2,s8
    5764:	000a0513          	mv	a0,s4
    5768:	000780e7          	jalr	a5
    576c:	00050913          	mv	s2,a0
    5770:	f4a05ce3          	blez	a0,56c8 <__sfvwrite_r+0x28c>
    5774:	412a8ab3          	sub	s5,s5,s2
    5778:	00100513          	li	a0,1
    577c:	f20a8ee3          	beqz	s5,56b8 <__sfvwrite_r+0x27c>
    5780:	008b2783          	lw	a5,8(s6)
    5784:	012c0c33          	add	s8,s8,s2
    5788:	412989b3          	sub	s3,s3,s2
    578c:	412787b3          	sub	a5,a5,s2
    5790:	00fb2423          	sw	a5,8(s6)
    5794:	f80796e3          	bnez	a5,5720 <__sfvwrite_r+0x2e4>
    5798:	00c12b83          	lw	s7,12(sp)
    579c:	00812c03          	lw	s8,8(sp)
    57a0:	eedff06f          	j	568c <__sfvwrite_r+0x250>
    57a4:	0044a983          	lw	s3,4(s1)
    57a8:	00048793          	mv	a5,s1
    57ac:	00848493          	addi	s1,s1,8
    57b0:	fe098ae3          	beqz	s3,57a4 <__sfvwrite_r+0x368>
    57b4:	0007ac03          	lw	s8,0(a5)
    57b8:	00098613          	mv	a2,s3
    57bc:	00a00593          	li	a1,10
    57c0:	000c0513          	mv	a0,s8
    57c4:	4ec000ef          	jal	5cb0 <memchr>
    57c8:	14050a63          	beqz	a0,591c <__sfvwrite_r+0x4e0>
    57cc:	00150513          	addi	a0,a0,1
    57d0:	41850ab3          	sub	s5,a0,s8
    57d4:	f55ff06f          	j	5728 <__sfvwrite_r+0x2ec>
    57d8:	000c0593          	mv	a1,s8
    57dc:	00090613          	mv	a2,s2
    57e0:	0ed000ef          	jal	60cc <memmove>
    57e4:	00042783          	lw	a5,0(s0)
    57e8:	00040593          	mv	a1,s0
    57ec:	000a0513          	mv	a0,s4
    57f0:	012787b3          	add	a5,a5,s2
    57f4:	00f42023          	sw	a5,0(s0)
    57f8:	fc4ff0ef          	jal	4fbc <_fflush_r>
    57fc:	f6050ce3          	beqz	a0,5774 <__sfvwrite_r+0x338>
    5800:	ec9ff06f          	j	56c8 <__sfvwrite_r+0x28c>
    5804:	01042683          	lw	a3,16(s0)
    5808:	04f6e263          	bltu	a3,a5,584c <__sfvwrite_r+0x410>
    580c:	01442603          	lw	a2,20(s0)
    5810:	02c9ee63          	bltu	s3,a2,584c <__sfvwrite_r+0x410>
    5814:	00098793          	mv	a5,s3
    5818:	013af463          	bgeu	s5,s3,5820 <__sfvwrite_r+0x3e4>
    581c:	000a8793          	mv	a5,s5
    5820:	02c7e6b3          	rem	a3,a5,a2
    5824:	02442703          	lw	a4,36(s0)
    5828:	01c42583          	lw	a1,28(s0)
    582c:	000b8613          	mv	a2,s7
    5830:	000a0513          	mv	a0,s4
    5834:	40d786b3          	sub	a3,a5,a3
    5838:	000700e7          	jalr	a4
    583c:	00050913          	mv	s2,a0
    5840:	04a05a63          	blez	a0,5894 <__sfvwrite_r+0x458>
    5844:	412989b3          	sub	s3,s3,s2
    5848:	dfdff06f          	j	5644 <__sfvwrite_r+0x208>
    584c:	00070913          	mv	s2,a4
    5850:	00e9f463          	bgeu	s3,a4,5858 <__sfvwrite_r+0x41c>
    5854:	00098913          	mv	s2,s3
    5858:	00078513          	mv	a0,a5
    585c:	00090613          	mv	a2,s2
    5860:	000b8593          	mv	a1,s7
    5864:	069000ef          	jal	60cc <memmove>
    5868:	00842703          	lw	a4,8(s0)
    586c:	00042783          	lw	a5,0(s0)
    5870:	41270733          	sub	a4,a4,s2
    5874:	012787b3          	add	a5,a5,s2
    5878:	00e42423          	sw	a4,8(s0)
    587c:	00f42023          	sw	a5,0(s0)
    5880:	fc0712e3          	bnez	a4,5844 <__sfvwrite_r+0x408>
    5884:	00040593          	mv	a1,s0
    5888:	000a0513          	mv	a0,s4
    588c:	f30ff0ef          	jal	4fbc <_fflush_r>
    5890:	fa050ae3          	beqz	a0,5844 <__sfvwrite_r+0x408>
    5894:	00c41783          	lh	a5,12(s0)
    5898:	00c12b83          	lw	s7,12(sp)
    589c:	00812c03          	lw	s8,8(sp)
    58a0:	00412c83          	lw	s9,4(sp)
    58a4:	e31ff06f          	j	56d4 <__sfvwrite_r+0x298>
    58a8:	00098c13          	mv	s8,s3
    58ac:	00098c93          	mv	s9,s3
    58b0:	d69ff06f          	j	5618 <__sfvwrite_r+0x1dc>
    58b4:	000b8613          	mv	a2,s7
    58b8:	000c0593          	mv	a1,s8
    58bc:	011000ef          	jal	60cc <memmove>
    58c0:	00842703          	lw	a4,8(s0)
    58c4:	00042783          	lw	a5,0(s0)
    58c8:	000b8913          	mv	s2,s7
    58cc:	41770733          	sub	a4,a4,s7
    58d0:	017787b3          	add	a5,a5,s7
    58d4:	00e42423          	sw	a4,8(s0)
    58d8:	00f42023          	sw	a5,0(s0)
    58dc:	e99ff06f          	j	5774 <__sfvwrite_r+0x338>
    58e0:	000a0513          	mv	a0,s4
    58e4:	789040ef          	jal	a86c <_realloc_r>
    58e8:	00050c93          	mv	s9,a0
    58ec:	d00516e3          	bnez	a0,55f8 <__sfvwrite_r+0x1bc>
    58f0:	01042583          	lw	a1,16(s0)
    58f4:	000a0513          	mv	a0,s4
    58f8:	6b5000ef          	jal	67ac <_free_r>
    58fc:	00c41783          	lh	a5,12(s0)
    5900:	00c00713          	li	a4,12
    5904:	00c12b83          	lw	s7,12(sp)
    5908:	00812c03          	lw	s8,8(sp)
    590c:	00412c83          	lw	s9,4(sp)
    5910:	00ea2023          	sw	a4,0(s4)
    5914:	f7f7f793          	andi	a5,a5,-129
    5918:	dbdff06f          	j	56d4 <__sfvwrite_r+0x298>
    591c:	00198793          	addi	a5,s3,1
    5920:	00078a93          	mv	s5,a5
    5924:	e09ff06f          	j	572c <__sfvwrite_r+0x2f0>
    5928:	00c41783          	lh	a5,12(s0)
    592c:	da9ff06f          	j	56d4 <__sfvwrite_r+0x298>
    5930:	00c00713          	li	a4,12
    5934:	00c41783          	lh	a5,12(s0)
    5938:	00c12b83          	lw	s7,12(sp)
    593c:	00812c03          	lw	s8,8(sp)
    5940:	00412c83          	lw	s9,4(sp)
    5944:	00ea2023          	sw	a4,0(s4)
    5948:	d8dff06f          	j	56d4 <__sfvwrite_r+0x298>

0000594c <_fwalk_sglue>:
    594c:	fd010113          	addi	sp,sp,-48
    5950:	03212023          	sw	s2,32(sp)
    5954:	01312e23          	sw	s3,28(sp)
    5958:	01412c23          	sw	s4,24(sp)
    595c:	01512a23          	sw	s5,20(sp)
    5960:	01612823          	sw	s6,16(sp)
    5964:	01712623          	sw	s7,12(sp)
    5968:	02112623          	sw	ra,44(sp)
    596c:	02812423          	sw	s0,40(sp)
    5970:	02912223          	sw	s1,36(sp)
    5974:	00050b13          	mv	s6,a0
    5978:	00058b93          	mv	s7,a1
    597c:	00060a93          	mv	s5,a2
    5980:	00000a13          	li	s4,0
    5984:	00100993          	li	s3,1
    5988:	fff00913          	li	s2,-1
    598c:	004aa483          	lw	s1,4(s5)
    5990:	008aa403          	lw	s0,8(s5)
    5994:	fff48493          	addi	s1,s1,-1
    5998:	0204c863          	bltz	s1,59c8 <_fwalk_sglue+0x7c>
    599c:	00c45783          	lhu	a5,12(s0)
    59a0:	00f9fe63          	bgeu	s3,a5,59bc <_fwalk_sglue+0x70>
    59a4:	00e41783          	lh	a5,14(s0)
    59a8:	00040593          	mv	a1,s0
    59ac:	000b0513          	mv	a0,s6
    59b0:	01278663          	beq	a5,s2,59bc <_fwalk_sglue+0x70>
    59b4:	000b80e7          	jalr	s7
    59b8:	00aa6a33          	or	s4,s4,a0
    59bc:	fff48493          	addi	s1,s1,-1
    59c0:	06840413          	addi	s0,s0,104
    59c4:	fd249ce3          	bne	s1,s2,599c <_fwalk_sglue+0x50>
    59c8:	000aaa83          	lw	s5,0(s5)
    59cc:	fc0a90e3          	bnez	s5,598c <_fwalk_sglue+0x40>
    59d0:	02c12083          	lw	ra,44(sp)
    59d4:	02812403          	lw	s0,40(sp)
    59d8:	02412483          	lw	s1,36(sp)
    59dc:	02012903          	lw	s2,32(sp)
    59e0:	01c12983          	lw	s3,28(sp)
    59e4:	01412a83          	lw	s5,20(sp)
    59e8:	01012b03          	lw	s6,16(sp)
    59ec:	00c12b83          	lw	s7,12(sp)
    59f0:	000a0513          	mv	a0,s4
    59f4:	01812a03          	lw	s4,24(sp)
    59f8:	03010113          	addi	sp,sp,48
    59fc:	00008067          	ret

00005a00 <__sread>:
    5a00:	ff010113          	addi	sp,sp,-16
    5a04:	00812423          	sw	s0,8(sp)
    5a08:	00058413          	mv	s0,a1
    5a0c:	00e59583          	lh	a1,14(a1)
    5a10:	00112623          	sw	ra,12(sp)
    5a14:	5e0000ef          	jal	5ff4 <_read_r>
    5a18:	02054063          	bltz	a0,5a38 <__sread+0x38>
    5a1c:	05042783          	lw	a5,80(s0)
    5a20:	00c12083          	lw	ra,12(sp)
    5a24:	00a787b3          	add	a5,a5,a0
    5a28:	04f42823          	sw	a5,80(s0)
    5a2c:	00812403          	lw	s0,8(sp)
    5a30:	01010113          	addi	sp,sp,16
    5a34:	00008067          	ret
    5a38:	00c45783          	lhu	a5,12(s0)
    5a3c:	fffff737          	lui	a4,0xfffff
    5a40:	fff70713          	addi	a4,a4,-1 # ffffefff <_memory_end+0xfffdefff>
    5a44:	00e7f7b3          	and	a5,a5,a4
    5a48:	00c12083          	lw	ra,12(sp)
    5a4c:	00f41623          	sh	a5,12(s0)
    5a50:	00812403          	lw	s0,8(sp)
    5a54:	01010113          	addi	sp,sp,16
    5a58:	00008067          	ret

00005a5c <__seofread>:
    5a5c:	00000513          	li	a0,0
    5a60:	00008067          	ret

00005a64 <__swrite>:
    5a64:	00c59783          	lh	a5,12(a1)
    5a68:	fe010113          	addi	sp,sp,-32
    5a6c:	00812c23          	sw	s0,24(sp)
    5a70:	00912a23          	sw	s1,20(sp)
    5a74:	01212823          	sw	s2,16(sp)
    5a78:	01312623          	sw	s3,12(sp)
    5a7c:	00112e23          	sw	ra,28(sp)
    5a80:	1007f713          	andi	a4,a5,256
    5a84:	00058413          	mv	s0,a1
    5a88:	00050493          	mv	s1,a0
    5a8c:	00060913          	mv	s2,a2
    5a90:	00068993          	mv	s3,a3
    5a94:	04071063          	bnez	a4,5ad4 <__swrite+0x70>
    5a98:	fffff737          	lui	a4,0xfffff
    5a9c:	fff70713          	addi	a4,a4,-1 # ffffefff <_memory_end+0xfffdefff>
    5aa0:	00e7f7b3          	and	a5,a5,a4
    5aa4:	00e41583          	lh	a1,14(s0)
    5aa8:	00f41623          	sh	a5,12(s0)
    5aac:	01812403          	lw	s0,24(sp)
    5ab0:	01c12083          	lw	ra,28(sp)
    5ab4:	00098693          	mv	a3,s3
    5ab8:	00090613          	mv	a2,s2
    5abc:	00c12983          	lw	s3,12(sp)
    5ac0:	01012903          	lw	s2,16(sp)
    5ac4:	00048513          	mv	a0,s1
    5ac8:	01412483          	lw	s1,20(sp)
    5acc:	02010113          	addi	sp,sp,32
    5ad0:	5900006f          	j	6060 <_write_r>
    5ad4:	00e59583          	lh	a1,14(a1)
    5ad8:	00200693          	li	a3,2
    5adc:	00000613          	li	a2,0
    5ae0:	4a8000ef          	jal	5f88 <_lseek_r>
    5ae4:	00c41783          	lh	a5,12(s0)
    5ae8:	fb1ff06f          	j	5a98 <__swrite+0x34>

00005aec <__sseek>:
    5aec:	ff010113          	addi	sp,sp,-16
    5af0:	00812423          	sw	s0,8(sp)
    5af4:	00058413          	mv	s0,a1
    5af8:	00e59583          	lh	a1,14(a1)
    5afc:	00112623          	sw	ra,12(sp)
    5b00:	488000ef          	jal	5f88 <_lseek_r>
    5b04:	fff00793          	li	a5,-1
    5b08:	02f50863          	beq	a0,a5,5b38 <__sseek+0x4c>
    5b0c:	00c45783          	lhu	a5,12(s0)
    5b10:	00001737          	lui	a4,0x1
    5b14:	00c12083          	lw	ra,12(sp)
    5b18:	00e7e7b3          	or	a5,a5,a4
    5b1c:	01079793          	slli	a5,a5,0x10
    5b20:	4107d793          	srai	a5,a5,0x10
    5b24:	04a42823          	sw	a0,80(s0)
    5b28:	00f41623          	sh	a5,12(s0)
    5b2c:	00812403          	lw	s0,8(sp)
    5b30:	01010113          	addi	sp,sp,16
    5b34:	00008067          	ret
    5b38:	00c45783          	lhu	a5,12(s0)
    5b3c:	fffff737          	lui	a4,0xfffff
    5b40:	fff70713          	addi	a4,a4,-1 # ffffefff <_memory_end+0xfffdefff>
    5b44:	00e7f7b3          	and	a5,a5,a4
    5b48:	01079793          	slli	a5,a5,0x10
    5b4c:	4107d793          	srai	a5,a5,0x10
    5b50:	00c12083          	lw	ra,12(sp)
    5b54:	00f41623          	sh	a5,12(s0)
    5b58:	00812403          	lw	s0,8(sp)
    5b5c:	01010113          	addi	sp,sp,16
    5b60:	00008067          	ret

00005b64 <__sclose>:
    5b64:	00e59583          	lh	a1,14(a1)
    5b68:	2d80006f          	j	5e40 <_close_r>

00005b6c <__swsetup_r>:
    5b6c:	000147b7          	lui	a5,0x14
    5b70:	bcc7a783          	lw	a5,-1076(a5) # 13bcc <_impure_ptr>
    5b74:	ff010113          	addi	sp,sp,-16
    5b78:	00812423          	sw	s0,8(sp)
    5b7c:	00912223          	sw	s1,4(sp)
    5b80:	00112623          	sw	ra,12(sp)
    5b84:	00050493          	mv	s1,a0
    5b88:	00058413          	mv	s0,a1
    5b8c:	00078663          	beqz	a5,5b98 <__swsetup_r+0x2c>
    5b90:	0347a703          	lw	a4,52(a5)
    5b94:	0e070c63          	beqz	a4,5c8c <__swsetup_r+0x120>
    5b98:	00c41783          	lh	a5,12(s0)
    5b9c:	0087f713          	andi	a4,a5,8
    5ba0:	06070a63          	beqz	a4,5c14 <__swsetup_r+0xa8>
    5ba4:	01042703          	lw	a4,16(s0)
    5ba8:	08070663          	beqz	a4,5c34 <__swsetup_r+0xc8>
    5bac:	0017f693          	andi	a3,a5,1
    5bb0:	02068863          	beqz	a3,5be0 <__swsetup_r+0x74>
    5bb4:	01442683          	lw	a3,20(s0)
    5bb8:	00042423          	sw	zero,8(s0)
    5bbc:	00000513          	li	a0,0
    5bc0:	40d006b3          	neg	a3,a3
    5bc4:	00d42c23          	sw	a3,24(s0)
    5bc8:	02070a63          	beqz	a4,5bfc <__swsetup_r+0x90>
    5bcc:	00c12083          	lw	ra,12(sp)
    5bd0:	00812403          	lw	s0,8(sp)
    5bd4:	00412483          	lw	s1,4(sp)
    5bd8:	01010113          	addi	sp,sp,16
    5bdc:	00008067          	ret
    5be0:	0027f693          	andi	a3,a5,2
    5be4:	00000613          	li	a2,0
    5be8:	00069463          	bnez	a3,5bf0 <__swsetup_r+0x84>
    5bec:	01442603          	lw	a2,20(s0)
    5bf0:	00c42423          	sw	a2,8(s0)
    5bf4:	00000513          	li	a0,0
    5bf8:	fc071ae3          	bnez	a4,5bcc <__swsetup_r+0x60>
    5bfc:	0807f713          	andi	a4,a5,128
    5c00:	fc0706e3          	beqz	a4,5bcc <__swsetup_r+0x60>
    5c04:	0407e793          	ori	a5,a5,64
    5c08:	00f41623          	sh	a5,12(s0)
    5c0c:	fff00513          	li	a0,-1
    5c10:	fbdff06f          	j	5bcc <__swsetup_r+0x60>
    5c14:	0107f713          	andi	a4,a5,16
    5c18:	08070063          	beqz	a4,5c98 <__swsetup_r+0x12c>
    5c1c:	0047f713          	andi	a4,a5,4
    5c20:	02071c63          	bnez	a4,5c58 <__swsetup_r+0xec>
    5c24:	01042703          	lw	a4,16(s0)
    5c28:	0087e793          	ori	a5,a5,8
    5c2c:	00f41623          	sh	a5,12(s0)
    5c30:	f6071ee3          	bnez	a4,5bac <__swsetup_r+0x40>
    5c34:	2807f693          	andi	a3,a5,640
    5c38:	20000613          	li	a2,512
    5c3c:	f6c688e3          	beq	a3,a2,5bac <__swsetup_r+0x40>
    5c40:	00040593          	mv	a1,s0
    5c44:	00048513          	mv	a0,s1
    5c48:	2ac050ef          	jal	aef4 <__smakebuf_r>
    5c4c:	00c41783          	lh	a5,12(s0)
    5c50:	01042703          	lw	a4,16(s0)
    5c54:	f59ff06f          	j	5bac <__swsetup_r+0x40>
    5c58:	03042583          	lw	a1,48(s0)
    5c5c:	00058e63          	beqz	a1,5c78 <__swsetup_r+0x10c>
    5c60:	04040713          	addi	a4,s0,64
    5c64:	00e58863          	beq	a1,a4,5c74 <__swsetup_r+0x108>
    5c68:	00048513          	mv	a0,s1
    5c6c:	341000ef          	jal	67ac <_free_r>
    5c70:	00c41783          	lh	a5,12(s0)
    5c74:	02042823          	sw	zero,48(s0)
    5c78:	01042703          	lw	a4,16(s0)
    5c7c:	fdb7f793          	andi	a5,a5,-37
    5c80:	00042223          	sw	zero,4(s0)
    5c84:	00e42023          	sw	a4,0(s0)
    5c88:	fa1ff06f          	j	5c28 <__swsetup_r+0xbc>
    5c8c:	00078513          	mv	a0,a5
    5c90:	f4cff0ef          	jal	53dc <__sinit>
    5c94:	f05ff06f          	j	5b98 <__swsetup_r+0x2c>
    5c98:	00900713          	li	a4,9
    5c9c:	00e4a023          	sw	a4,0(s1)
    5ca0:	0407e793          	ori	a5,a5,64
    5ca4:	00f41623          	sh	a5,12(s0)
    5ca8:	fff00513          	li	a0,-1
    5cac:	f21ff06f          	j	5bcc <__swsetup_r+0x60>

00005cb0 <memchr>:
    5cb0:	00357793          	andi	a5,a0,3
    5cb4:	0ff5f693          	zext.b	a3,a1
    5cb8:	02078a63          	beqz	a5,5cec <memchr+0x3c>
    5cbc:	fff60793          	addi	a5,a2,-1
    5cc0:	02060e63          	beqz	a2,5cfc <memchr+0x4c>
    5cc4:	fff00613          	li	a2,-1
    5cc8:	0180006f          	j	5ce0 <memchr+0x30>
    5ccc:	00150513          	addi	a0,a0,1
    5cd0:	00357713          	andi	a4,a0,3
    5cd4:	00070e63          	beqz	a4,5cf0 <memchr+0x40>
    5cd8:	fff78793          	addi	a5,a5,-1
    5cdc:	02c78063          	beq	a5,a2,5cfc <memchr+0x4c>
    5ce0:	00054703          	lbu	a4,0(a0)
    5ce4:	fed714e3          	bne	a4,a3,5ccc <memchr+0x1c>
    5ce8:	00008067          	ret
    5cec:	00060793          	mv	a5,a2
    5cf0:	00300713          	li	a4,3
    5cf4:	00f76863          	bltu	a4,a5,5d04 <memchr+0x54>
    5cf8:	06079063          	bnez	a5,5d58 <memchr+0xa8>
    5cfc:	00000513          	li	a0,0
    5d00:	00008067          	ret
    5d04:	0ff5f593          	zext.b	a1,a1
    5d08:	00859713          	slli	a4,a1,0x8
    5d0c:	00b705b3          	add	a1,a4,a1
    5d10:	01059713          	slli	a4,a1,0x10
    5d14:	feff08b7          	lui	a7,0xfeff0
    5d18:	80808837          	lui	a6,0x80808
    5d1c:	00e585b3          	add	a1,a1,a4
    5d20:	eff88893          	addi	a7,a7,-257 # fefefeff <_memory_end+0xfefcfeff>
    5d24:	08080813          	addi	a6,a6,128 # 80808080 <_memory_end+0x807e8080>
    5d28:	00300313          	li	t1,3
    5d2c:	0100006f          	j	5d3c <memchr+0x8c>
    5d30:	ffc78793          	addi	a5,a5,-4
    5d34:	00450513          	addi	a0,a0,4
    5d38:	fcf370e3          	bgeu	t1,a5,5cf8 <memchr+0x48>
    5d3c:	00052703          	lw	a4,0(a0)
    5d40:	00e5c733          	xor	a4,a1,a4
    5d44:	01170633          	add	a2,a4,a7
    5d48:	fff74713          	not	a4,a4
    5d4c:	00e67733          	and	a4,a2,a4
    5d50:	01077733          	and	a4,a4,a6
    5d54:	fc070ee3          	beqz	a4,5d30 <memchr+0x80>
    5d58:	00f507b3          	add	a5,a0,a5
    5d5c:	00c0006f          	j	5d68 <memchr+0xb8>
    5d60:	00150513          	addi	a0,a0,1
    5d64:	f8a78ce3          	beq	a5,a0,5cfc <memchr+0x4c>
    5d68:	00054703          	lbu	a4,0(a0)
    5d6c:	fed71ae3          	bne	a4,a3,5d60 <memchr+0xb0>
    5d70:	00008067          	ret

00005d74 <strncpy>:
    5d74:	00a5e7b3          	or	a5,a1,a0
    5d78:	0037f793          	andi	a5,a5,3
    5d7c:	00079663          	bnez	a5,5d88 <strncpy+0x14>
    5d80:	00300793          	li	a5,3
    5d84:	04c7e663          	bltu	a5,a2,5dd0 <strncpy+0x5c>
    5d88:	00050713          	mv	a4,a0
    5d8c:	01c0006f          	j	5da8 <strncpy+0x34>
    5d90:	fff5c683          	lbu	a3,-1(a1)
    5d94:	fff60813          	addi	a6,a2,-1
    5d98:	fed78fa3          	sb	a3,-1(a5)
    5d9c:	00068e63          	beqz	a3,5db8 <strncpy+0x44>
    5da0:	00078713          	mv	a4,a5
    5da4:	00080613          	mv	a2,a6
    5da8:	00158593          	addi	a1,a1,1
    5dac:	00170793          	addi	a5,a4,1
    5db0:	fe0610e3          	bnez	a2,5d90 <strncpy+0x1c>
    5db4:	00008067          	ret
    5db8:	00c70733          	add	a4,a4,a2
    5dbc:	06080063          	beqz	a6,5e1c <strncpy+0xa8>
    5dc0:	00178793          	addi	a5,a5,1
    5dc4:	fe078fa3          	sb	zero,-1(a5)
    5dc8:	fee79ce3          	bne	a5,a4,5dc0 <strncpy+0x4c>
    5dcc:	00008067          	ret
    5dd0:	feff0337          	lui	t1,0xfeff0
    5dd4:	808088b7          	lui	a7,0x80808
    5dd8:	00050713          	mv	a4,a0
    5ddc:	eff30313          	addi	t1,t1,-257 # fefefeff <_memory_end+0xfefcfeff>
    5de0:	08088893          	addi	a7,a7,128 # 80808080 <_memory_end+0x807e8080>
    5de4:	00300e13          	li	t3,3
    5de8:	0180006f          	j	5e00 <strncpy+0x8c>
    5dec:	00d72023          	sw	a3,0(a4)
    5df0:	ffc60613          	addi	a2,a2,-4
    5df4:	00470713          	addi	a4,a4,4
    5df8:	00458593          	addi	a1,a1,4
    5dfc:	face76e3          	bgeu	t3,a2,5da8 <strncpy+0x34>
    5e00:	0005a683          	lw	a3,0(a1)
    5e04:	006687b3          	add	a5,a3,t1
    5e08:	fff6c813          	not	a6,a3
    5e0c:	0107f7b3          	and	a5,a5,a6
    5e10:	0117f7b3          	and	a5,a5,a7
    5e14:	fc078ce3          	beqz	a5,5dec <strncpy+0x78>
    5e18:	f91ff06f          	j	5da8 <strncpy+0x34>
    5e1c:	00008067          	ret

00005e20 <__localeconv_l>:
    5e20:	0f050513          	addi	a0,a0,240
    5e24:	00008067          	ret

00005e28 <_localeconv_r>:
    5e28:	00014537          	lui	a0,0x14
    5e2c:	ae450513          	addi	a0,a0,-1308 # 13ae4 <__global_locale+0xf0>
    5e30:	00008067          	ret

00005e34 <localeconv>:
    5e34:	00014537          	lui	a0,0x14
    5e38:	ae450513          	addi	a0,a0,-1308 # 13ae4 <__global_locale+0xf0>
    5e3c:	00008067          	ret

00005e40 <_close_r>:
    5e40:	ff010113          	addi	sp,sp,-16
    5e44:	00812423          	sw	s0,8(sp)
    5e48:	00912223          	sw	s1,4(sp)
    5e4c:	00050413          	mv	s0,a0
    5e50:	000144b7          	lui	s1,0x14
    5e54:	00058513          	mv	a0,a1
    5e58:	00112623          	sw	ra,12(sp)
    5e5c:	d204ae23          	sw	zero,-708(s1) # 13d3c <errno>
    5e60:	ba4fc0ef          	jal	2204 <_close>
    5e64:	fff00793          	li	a5,-1
    5e68:	00f50c63          	beq	a0,a5,5e80 <_close_r+0x40>
    5e6c:	00c12083          	lw	ra,12(sp)
    5e70:	00812403          	lw	s0,8(sp)
    5e74:	00412483          	lw	s1,4(sp)
    5e78:	01010113          	addi	sp,sp,16
    5e7c:	00008067          	ret
    5e80:	d3c4a783          	lw	a5,-708(s1)
    5e84:	fe0784e3          	beqz	a5,5e6c <_close_r+0x2c>
    5e88:	00c12083          	lw	ra,12(sp)
    5e8c:	00f42023          	sw	a5,0(s0)
    5e90:	00812403          	lw	s0,8(sp)
    5e94:	00412483          	lw	s1,4(sp)
    5e98:	01010113          	addi	sp,sp,16
    5e9c:	00008067          	ret

00005ea0 <_reclaim_reent>:
    5ea0:	000147b7          	lui	a5,0x14
    5ea4:	bcc7a783          	lw	a5,-1076(a5) # 13bcc <_impure_ptr>
    5ea8:	0ca78e63          	beq	a5,a0,5f84 <_reclaim_reent+0xe4>
    5eac:	04452583          	lw	a1,68(a0)
    5eb0:	fe010113          	addi	sp,sp,-32
    5eb4:	00912a23          	sw	s1,20(sp)
    5eb8:	00112e23          	sw	ra,28(sp)
    5ebc:	00812c23          	sw	s0,24(sp)
    5ec0:	00050493          	mv	s1,a0
    5ec4:	04058863          	beqz	a1,5f14 <_reclaim_reent+0x74>
    5ec8:	01212823          	sw	s2,16(sp)
    5ecc:	01312623          	sw	s3,12(sp)
    5ed0:	00000913          	li	s2,0
    5ed4:	08000993          	li	s3,128
    5ed8:	012587b3          	add	a5,a1,s2
    5edc:	0007a403          	lw	s0,0(a5)
    5ee0:	00040e63          	beqz	s0,5efc <_reclaim_reent+0x5c>
    5ee4:	00040593          	mv	a1,s0
    5ee8:	00042403          	lw	s0,0(s0)
    5eec:	00048513          	mv	a0,s1
    5ef0:	0bd000ef          	jal	67ac <_free_r>
    5ef4:	fe0418e3          	bnez	s0,5ee4 <_reclaim_reent+0x44>
    5ef8:	0444a583          	lw	a1,68(s1)
    5efc:	00490913          	addi	s2,s2,4
    5f00:	fd391ce3          	bne	s2,s3,5ed8 <_reclaim_reent+0x38>
    5f04:	00048513          	mv	a0,s1
    5f08:	0a5000ef          	jal	67ac <_free_r>
    5f0c:	01012903          	lw	s2,16(sp)
    5f10:	00c12983          	lw	s3,12(sp)
    5f14:	0384a583          	lw	a1,56(s1)
    5f18:	00058663          	beqz	a1,5f24 <_reclaim_reent+0x84>
    5f1c:	00048513          	mv	a0,s1
    5f20:	08d000ef          	jal	67ac <_free_r>
    5f24:	0404a403          	lw	s0,64(s1)
    5f28:	00040c63          	beqz	s0,5f40 <_reclaim_reent+0xa0>
    5f2c:	00040593          	mv	a1,s0
    5f30:	00042403          	lw	s0,0(s0)
    5f34:	00048513          	mv	a0,s1
    5f38:	075000ef          	jal	67ac <_free_r>
    5f3c:	fe0418e3          	bnez	s0,5f2c <_reclaim_reent+0x8c>
    5f40:	04c4a583          	lw	a1,76(s1)
    5f44:	00058663          	beqz	a1,5f50 <_reclaim_reent+0xb0>
    5f48:	00048513          	mv	a0,s1
    5f4c:	061000ef          	jal	67ac <_free_r>
    5f50:	0344a783          	lw	a5,52(s1)
    5f54:	00078e63          	beqz	a5,5f70 <_reclaim_reent+0xd0>
    5f58:	01812403          	lw	s0,24(sp)
    5f5c:	01c12083          	lw	ra,28(sp)
    5f60:	00048513          	mv	a0,s1
    5f64:	01412483          	lw	s1,20(sp)
    5f68:	02010113          	addi	sp,sp,32
    5f6c:	00078067          	jr	a5
    5f70:	01c12083          	lw	ra,28(sp)
    5f74:	01812403          	lw	s0,24(sp)
    5f78:	01412483          	lw	s1,20(sp)
    5f7c:	02010113          	addi	sp,sp,32
    5f80:	00008067          	ret
    5f84:	00008067          	ret

00005f88 <_lseek_r>:
    5f88:	ff010113          	addi	sp,sp,-16
    5f8c:	00058713          	mv	a4,a1
    5f90:	00812423          	sw	s0,8(sp)
    5f94:	00912223          	sw	s1,4(sp)
    5f98:	00060593          	mv	a1,a2
    5f9c:	00050413          	mv	s0,a0
    5fa0:	000144b7          	lui	s1,0x14
    5fa4:	00068613          	mv	a2,a3
    5fa8:	00070513          	mv	a0,a4
    5fac:	00112623          	sw	ra,12(sp)
    5fb0:	d204ae23          	sw	zero,-708(s1) # 13d3c <errno>
    5fb4:	a74fc0ef          	jal	2228 <_lseek>
    5fb8:	fff00793          	li	a5,-1
    5fbc:	00f50c63          	beq	a0,a5,5fd4 <_lseek_r+0x4c>
    5fc0:	00c12083          	lw	ra,12(sp)
    5fc4:	00812403          	lw	s0,8(sp)
    5fc8:	00412483          	lw	s1,4(sp)
    5fcc:	01010113          	addi	sp,sp,16
    5fd0:	00008067          	ret
    5fd4:	d3c4a783          	lw	a5,-708(s1)
    5fd8:	fe0784e3          	beqz	a5,5fc0 <_lseek_r+0x38>
    5fdc:	00c12083          	lw	ra,12(sp)
    5fe0:	00f42023          	sw	a5,0(s0)
    5fe4:	00812403          	lw	s0,8(sp)
    5fe8:	00412483          	lw	s1,4(sp)
    5fec:	01010113          	addi	sp,sp,16
    5ff0:	00008067          	ret

00005ff4 <_read_r>:
    5ff4:	ff010113          	addi	sp,sp,-16
    5ff8:	00058713          	mv	a4,a1
    5ffc:	00812423          	sw	s0,8(sp)
    6000:	00912223          	sw	s1,4(sp)
    6004:	00060593          	mv	a1,a2
    6008:	00050413          	mv	s0,a0
    600c:	000144b7          	lui	s1,0x14
    6010:	00068613          	mv	a2,a3
    6014:	00070513          	mv	a0,a4
    6018:	00112623          	sw	ra,12(sp)
    601c:	d204ae23          	sw	zero,-708(s1) # 13d3c <errno>
    6020:	a34fc0ef          	jal	2254 <_read>
    6024:	fff00793          	li	a5,-1
    6028:	00f50c63          	beq	a0,a5,6040 <_read_r+0x4c>
    602c:	00c12083          	lw	ra,12(sp)
    6030:	00812403          	lw	s0,8(sp)
    6034:	00412483          	lw	s1,4(sp)
    6038:	01010113          	addi	sp,sp,16
    603c:	00008067          	ret
    6040:	d3c4a783          	lw	a5,-708(s1)
    6044:	fe0784e3          	beqz	a5,602c <_read_r+0x38>
    6048:	00c12083          	lw	ra,12(sp)
    604c:	00f42023          	sw	a5,0(s0)
    6050:	00812403          	lw	s0,8(sp)
    6054:	00412483          	lw	s1,4(sp)
    6058:	01010113          	addi	sp,sp,16
    605c:	00008067          	ret

00006060 <_write_r>:
    6060:	ff010113          	addi	sp,sp,-16
    6064:	00058713          	mv	a4,a1
    6068:	00812423          	sw	s0,8(sp)
    606c:	00912223          	sw	s1,4(sp)
    6070:	00060593          	mv	a1,a2
    6074:	00050413          	mv	s0,a0
    6078:	000144b7          	lui	s1,0x14
    607c:	00068613          	mv	a2,a3
    6080:	00070513          	mv	a0,a4
    6084:	00112623          	sw	ra,12(sp)
    6088:	d204ae23          	sw	zero,-708(s1) # 13d3c <errno>
    608c:	9f4fc0ef          	jal	2280 <_write>
    6090:	fff00793          	li	a5,-1
    6094:	00f50c63          	beq	a0,a5,60ac <_write_r+0x4c>
    6098:	00c12083          	lw	ra,12(sp)
    609c:	00812403          	lw	s0,8(sp)
    60a0:	00412483          	lw	s1,4(sp)
    60a4:	01010113          	addi	sp,sp,16
    60a8:	00008067          	ret
    60ac:	d3c4a783          	lw	a5,-708(s1)
    60b0:	fe0784e3          	beqz	a5,6098 <_write_r+0x38>
    60b4:	00c12083          	lw	ra,12(sp)
    60b8:	00f42023          	sw	a5,0(s0)
    60bc:	00812403          	lw	s0,8(sp)
    60c0:	00412483          	lw	s1,4(sp)
    60c4:	01010113          	addi	sp,sp,16
    60c8:	00008067          	ret

000060cc <memmove>:
    60cc:	02a5f663          	bgeu	a1,a0,60f8 <memmove+0x2c>
    60d0:	00c58733          	add	a4,a1,a2
    60d4:	02e57263          	bgeu	a0,a4,60f8 <memmove+0x2c>
    60d8:	00c507b3          	add	a5,a0,a2
    60dc:	04060663          	beqz	a2,6128 <memmove+0x5c>
    60e0:	fff74683          	lbu	a3,-1(a4)
    60e4:	fff78793          	addi	a5,a5,-1
    60e8:	fff70713          	addi	a4,a4,-1
    60ec:	00d78023          	sb	a3,0(a5)
    60f0:	fef518e3          	bne	a0,a5,60e0 <memmove+0x14>
    60f4:	00008067          	ret
    60f8:	00f00793          	li	a5,15
    60fc:	02c7e863          	bltu	a5,a2,612c <memmove+0x60>
    6100:	00050793          	mv	a5,a0
    6104:	fff60693          	addi	a3,a2,-1
    6108:	0c060263          	beqz	a2,61cc <memmove+0x100>
    610c:	00168693          	addi	a3,a3,1
    6110:	00d786b3          	add	a3,a5,a3
    6114:	0005c703          	lbu	a4,0(a1)
    6118:	00178793          	addi	a5,a5,1
    611c:	00158593          	addi	a1,a1,1
    6120:	fee78fa3          	sb	a4,-1(a5)
    6124:	fed798e3          	bne	a5,a3,6114 <memmove+0x48>
    6128:	00008067          	ret
    612c:	00b567b3          	or	a5,a0,a1
    6130:	0037f793          	andi	a5,a5,3
    6134:	08079663          	bnez	a5,61c0 <memmove+0xf4>
    6138:	ff060893          	addi	a7,a2,-16
    613c:	ff08f893          	andi	a7,a7,-16
    6140:	01088893          	addi	a7,a7,16
    6144:	011506b3          	add	a3,a0,a7
    6148:	00058713          	mv	a4,a1
    614c:	00050793          	mv	a5,a0
    6150:	00072803          	lw	a6,0(a4)
    6154:	01070713          	addi	a4,a4,16
    6158:	01078793          	addi	a5,a5,16
    615c:	ff07a823          	sw	a6,-16(a5)
    6160:	ff472803          	lw	a6,-12(a4)
    6164:	ff07aa23          	sw	a6,-12(a5)
    6168:	ff872803          	lw	a6,-8(a4)
    616c:	ff07ac23          	sw	a6,-8(a5)
    6170:	ffc72803          	lw	a6,-4(a4)
    6174:	ff07ae23          	sw	a6,-4(a5)
    6178:	fcd79ce3          	bne	a5,a3,6150 <memmove+0x84>
    617c:	00c67813          	andi	a6,a2,12
    6180:	011585b3          	add	a1,a1,a7
    6184:	00f67713          	andi	a4,a2,15
    6188:	04080463          	beqz	a6,61d0 <memmove+0x104>
    618c:	ffc70813          	addi	a6,a4,-4
    6190:	ffc87813          	andi	a6,a6,-4
    6194:	00480813          	addi	a6,a6,4
    6198:	010687b3          	add	a5,a3,a6
    619c:	00058713          	mv	a4,a1
    61a0:	00072883          	lw	a7,0(a4)
    61a4:	00468693          	addi	a3,a3,4
    61a8:	00470713          	addi	a4,a4,4
    61ac:	ff16ae23          	sw	a7,-4(a3)
    61b0:	fef698e3          	bne	a3,a5,61a0 <memmove+0xd4>
    61b4:	00367613          	andi	a2,a2,3
    61b8:	010585b3          	add	a1,a1,a6
    61bc:	f49ff06f          	j	6104 <memmove+0x38>
    61c0:	fff60693          	addi	a3,a2,-1
    61c4:	00050793          	mv	a5,a0
    61c8:	f45ff06f          	j	610c <memmove+0x40>
    61cc:	00008067          	ret
    61d0:	00070613          	mv	a2,a4
    61d4:	f31ff06f          	j	6104 <memmove+0x38>

000061d8 <memset>:
    61d8:	00f00313          	li	t1,15
    61dc:	00050713          	mv	a4,a0
    61e0:	02c37e63          	bgeu	t1,a2,621c <memset+0x44>
    61e4:	00f77793          	andi	a5,a4,15
    61e8:	0a079063          	bnez	a5,6288 <memset+0xb0>
    61ec:	08059263          	bnez	a1,6270 <memset+0x98>
    61f0:	ff067693          	andi	a3,a2,-16
    61f4:	00f67613          	andi	a2,a2,15
    61f8:	00e686b3          	add	a3,a3,a4
    61fc:	00b72023          	sw	a1,0(a4)
    6200:	00b72223          	sw	a1,4(a4)
    6204:	00b72423          	sw	a1,8(a4)
    6208:	00b72623          	sw	a1,12(a4)
    620c:	01070713          	addi	a4,a4,16
    6210:	fed766e3          	bltu	a4,a3,61fc <memset+0x24>
    6214:	00061463          	bnez	a2,621c <memset+0x44>
    6218:	00008067          	ret
    621c:	40c306b3          	sub	a3,t1,a2
    6220:	00269693          	slli	a3,a3,0x2
    6224:	00000297          	auipc	t0,0x0
    6228:	005686b3          	add	a3,a3,t0
    622c:	00c68067          	jr	12(a3)
    6230:	00b70723          	sb	a1,14(a4)
    6234:	00b706a3          	sb	a1,13(a4)
    6238:	00b70623          	sb	a1,12(a4)
    623c:	00b705a3          	sb	a1,11(a4)
    6240:	00b70523          	sb	a1,10(a4)
    6244:	00b704a3          	sb	a1,9(a4)
    6248:	00b70423          	sb	a1,8(a4)
    624c:	00b703a3          	sb	a1,7(a4)
    6250:	00b70323          	sb	a1,6(a4)
    6254:	00b702a3          	sb	a1,5(a4)
    6258:	00b70223          	sb	a1,4(a4)
    625c:	00b701a3          	sb	a1,3(a4)
    6260:	00b70123          	sb	a1,2(a4)
    6264:	00b700a3          	sb	a1,1(a4)
    6268:	00b70023          	sb	a1,0(a4)
    626c:	00008067          	ret
    6270:	0ff5f593          	zext.b	a1,a1
    6274:	00859693          	slli	a3,a1,0x8
    6278:	00d5e5b3          	or	a1,a1,a3
    627c:	01059693          	slli	a3,a1,0x10
    6280:	00d5e5b3          	or	a1,a1,a3
    6284:	f6dff06f          	j	61f0 <memset+0x18>
    6288:	00279693          	slli	a3,a5,0x2
    628c:	00000297          	auipc	t0,0x0
    6290:	005686b3          	add	a3,a3,t0
    6294:	00008293          	mv	t0,ra
    6298:	fa0680e7          	jalr	-96(a3)
    629c:	00028093          	mv	ra,t0
    62a0:	ff078793          	addi	a5,a5,-16
    62a4:	40f70733          	sub	a4,a4,a5
    62a8:	00f60633          	add	a2,a2,a5
    62ac:	f6c378e3          	bgeu	t1,a2,621c <memset+0x44>
    62b0:	f3dff06f          	j	61ec <memset+0x14>

000062b4 <memcpy>:
    62b4:	00a5c7b3          	xor	a5,a1,a0
    62b8:	0037f793          	andi	a5,a5,3
    62bc:	00c508b3          	add	a7,a0,a2
    62c0:	06079463          	bnez	a5,6328 <memcpy+0x74>
    62c4:	00300793          	li	a5,3
    62c8:	06c7f063          	bgeu	a5,a2,6328 <memcpy+0x74>
    62cc:	00357793          	andi	a5,a0,3
    62d0:	00050713          	mv	a4,a0
    62d4:	06079a63          	bnez	a5,6348 <memcpy+0x94>
    62d8:	ffc8f613          	andi	a2,a7,-4
    62dc:	40e606b3          	sub	a3,a2,a4
    62e0:	02000793          	li	a5,32
    62e4:	08d7ce63          	blt	a5,a3,6380 <memcpy+0xcc>
    62e8:	00058693          	mv	a3,a1
    62ec:	00070793          	mv	a5,a4
    62f0:	02c77863          	bgeu	a4,a2,6320 <memcpy+0x6c>
    62f4:	0006a803          	lw	a6,0(a3)
    62f8:	00478793          	addi	a5,a5,4
    62fc:	00468693          	addi	a3,a3,4
    6300:	ff07ae23          	sw	a6,-4(a5)
    6304:	fec7e8e3          	bltu	a5,a2,62f4 <memcpy+0x40>
    6308:	fff60793          	addi	a5,a2,-1
    630c:	40e787b3          	sub	a5,a5,a4
    6310:	ffc7f793          	andi	a5,a5,-4
    6314:	00478793          	addi	a5,a5,4
    6318:	00f70733          	add	a4,a4,a5
    631c:	00f585b3          	add	a1,a1,a5
    6320:	01176863          	bltu	a4,a7,6330 <memcpy+0x7c>
    6324:	00008067          	ret
    6328:	00050713          	mv	a4,a0
    632c:	05157863          	bgeu	a0,a7,637c <memcpy+0xc8>
    6330:	0005c783          	lbu	a5,0(a1)
    6334:	00170713          	addi	a4,a4,1
    6338:	00158593          	addi	a1,a1,1
    633c:	fef70fa3          	sb	a5,-1(a4)
    6340:	fee898e3          	bne	a7,a4,6330 <memcpy+0x7c>
    6344:	00008067          	ret
    6348:	0005c683          	lbu	a3,0(a1)
    634c:	00170713          	addi	a4,a4,1
    6350:	00377793          	andi	a5,a4,3
    6354:	fed70fa3          	sb	a3,-1(a4)
    6358:	00158593          	addi	a1,a1,1
    635c:	f6078ee3          	beqz	a5,62d8 <memcpy+0x24>
    6360:	0005c683          	lbu	a3,0(a1)
    6364:	00170713          	addi	a4,a4,1
    6368:	00377793          	andi	a5,a4,3
    636c:	fed70fa3          	sb	a3,-1(a4)
    6370:	00158593          	addi	a1,a1,1
    6374:	fc079ae3          	bnez	a5,6348 <memcpy+0x94>
    6378:	f61ff06f          	j	62d8 <memcpy+0x24>
    637c:	00008067          	ret
    6380:	ff010113          	addi	sp,sp,-16
    6384:	00812623          	sw	s0,12(sp)
    6388:	02000413          	li	s0,32
    638c:	0005a383          	lw	t2,0(a1)
    6390:	0045a283          	lw	t0,4(a1)
    6394:	0085af83          	lw	t6,8(a1)
    6398:	00c5af03          	lw	t5,12(a1)
    639c:	0105ae83          	lw	t4,16(a1)
    63a0:	0145ae03          	lw	t3,20(a1)
    63a4:	0185a303          	lw	t1,24(a1)
    63a8:	01c5a803          	lw	a6,28(a1)
    63ac:	0205a683          	lw	a3,32(a1)
    63b0:	02470713          	addi	a4,a4,36
    63b4:	40e607b3          	sub	a5,a2,a4
    63b8:	fc772e23          	sw	t2,-36(a4)
    63bc:	fe572023          	sw	t0,-32(a4)
    63c0:	fff72223          	sw	t6,-28(a4)
    63c4:	ffe72423          	sw	t5,-24(a4)
    63c8:	ffd72623          	sw	t4,-20(a4)
    63cc:	ffc72823          	sw	t3,-16(a4)
    63d0:	fe672a23          	sw	t1,-12(a4)
    63d4:	ff072c23          	sw	a6,-8(a4)
    63d8:	fed72e23          	sw	a3,-4(a4)
    63dc:	02458593          	addi	a1,a1,36
    63e0:	faf446e3          	blt	s0,a5,638c <memcpy+0xd8>
    63e4:	00058693          	mv	a3,a1
    63e8:	00070793          	mv	a5,a4
    63ec:	02c77863          	bgeu	a4,a2,641c <memcpy+0x168>
    63f0:	0006a803          	lw	a6,0(a3)
    63f4:	00478793          	addi	a5,a5,4
    63f8:	00468693          	addi	a3,a3,4
    63fc:	ff07ae23          	sw	a6,-4(a5)
    6400:	fec7e8e3          	bltu	a5,a2,63f0 <memcpy+0x13c>
    6404:	fff60793          	addi	a5,a2,-1
    6408:	40e787b3          	sub	a5,a5,a4
    640c:	ffc7f793          	andi	a5,a5,-4
    6410:	00478793          	addi	a5,a5,4
    6414:	00f70733          	add	a4,a4,a5
    6418:	00f585b3          	add	a1,a1,a5
    641c:	01176863          	bltu	a4,a7,642c <memcpy+0x178>
    6420:	00c12403          	lw	s0,12(sp)
    6424:	01010113          	addi	sp,sp,16
    6428:	00008067          	ret
    642c:	0005c783          	lbu	a5,0(a1)
    6430:	00170713          	addi	a4,a4,1
    6434:	00158593          	addi	a1,a1,1
    6438:	fef70fa3          	sb	a5,-1(a4)
    643c:	fee882e3          	beq	a7,a4,6420 <memcpy+0x16c>
    6440:	0005c783          	lbu	a5,0(a1)
    6444:	00170713          	addi	a4,a4,1
    6448:	00158593          	addi	a1,a1,1
    644c:	fef70fa3          	sb	a5,-1(a4)
    6450:	fce89ee3          	bne	a7,a4,642c <memcpy+0x178>
    6454:	fcdff06f          	j	6420 <memcpy+0x16c>

00006458 <strlen>:
    6458:	00357793          	andi	a5,a0,3
    645c:	00050713          	mv	a4,a0
    6460:	04079c63          	bnez	a5,64b8 <strlen+0x60>
    6464:	7f7f86b7          	lui	a3,0x7f7f8
    6468:	f7f68693          	addi	a3,a3,-129 # 7f7f7f7f <_memory_end+0x7f7d7f7f>
    646c:	fff00593          	li	a1,-1
    6470:	00072603          	lw	a2,0(a4)
    6474:	00470713          	addi	a4,a4,4
    6478:	00d677b3          	and	a5,a2,a3
    647c:	00d787b3          	add	a5,a5,a3
    6480:	00c7e7b3          	or	a5,a5,a2
    6484:	00d7e7b3          	or	a5,a5,a3
    6488:	feb784e3          	beq	a5,a1,6470 <strlen+0x18>
    648c:	ffc74683          	lbu	a3,-4(a4)
    6490:	40a707b3          	sub	a5,a4,a0
    6494:	04068463          	beqz	a3,64dc <strlen+0x84>
    6498:	ffd74683          	lbu	a3,-3(a4)
    649c:	02068c63          	beqz	a3,64d4 <strlen+0x7c>
    64a0:	ffe74503          	lbu	a0,-2(a4)
    64a4:	00a03533          	snez	a0,a0
    64a8:	00f50533          	add	a0,a0,a5
    64ac:	ffe50513          	addi	a0,a0,-2
    64b0:	00008067          	ret
    64b4:	fa0688e3          	beqz	a3,6464 <strlen+0xc>
    64b8:	00074783          	lbu	a5,0(a4)
    64bc:	00170713          	addi	a4,a4,1
    64c0:	00377693          	andi	a3,a4,3
    64c4:	fe0798e3          	bnez	a5,64b4 <strlen+0x5c>
    64c8:	40a70733          	sub	a4,a4,a0
    64cc:	fff70513          	addi	a0,a4,-1
    64d0:	00008067          	ret
    64d4:	ffd78513          	addi	a0,a5,-3
    64d8:	00008067          	ret
    64dc:	ffc78513          	addi	a0,a5,-4
    64e0:	00008067          	ret

000064e4 <frexpl>:
    64e4:	f9010113          	addi	sp,sp,-112
    64e8:	07212023          	sw	s2,96(sp)
    64ec:	00c5a903          	lw	s2,12(a1)
    64f0:	05412c23          	sw	s4,88(sp)
    64f4:	05512a23          	sw	s5,84(sp)
    64f8:	05612823          	sw	s6,80(sp)
    64fc:	0045aa83          	lw	s5,4(a1)
    6500:	0005ab03          	lw	s6,0(a1)
    6504:	0085aa03          	lw	s4,8(a1)
    6508:	05312e23          	sw	s3,92(sp)
    650c:	000089b7          	lui	s3,0x8
    6510:	06812423          	sw	s0,104(sp)
    6514:	06912223          	sw	s1,100(sp)
    6518:	06112623          	sw	ra,108(sp)
    651c:	01095493          	srli	s1,s2,0x10
    6520:	fff98993          	addi	s3,s3,-1 # 7fff <__gdtoa+0x11a3>
    6524:	03612823          	sw	s6,48(sp)
    6528:	03512a23          	sw	s5,52(sp)
    652c:	03412c23          	sw	s4,56(sp)
    6530:	03212e23          	sw	s2,60(sp)
    6534:	0134f4b3          	and	s1,s1,s3
    6538:	00062023          	sw	zero,0(a2)
    653c:	00050413          	mv	s0,a0
    6540:	09348063          	beq	s1,s3,65c0 <frexpl+0xdc>
    6544:	01010593          	addi	a1,sp,16
    6548:	02010513          	addi	a0,sp,32
    654c:	05712623          	sw	s7,76(sp)
    6550:	03612023          	sw	s6,32(sp)
    6554:	00060b93          	mv	s7,a2
    6558:	03512223          	sw	s5,36(sp)
    655c:	03412423          	sw	s4,40(sp)
    6560:	03212623          	sw	s2,44(sp)
    6564:	00012823          	sw	zero,16(sp)
    6568:	00012a23          	sw	zero,20(sp)
    656c:	00012c23          	sw	zero,24(sp)
    6570:	00012e23          	sw	zero,28(sp)
    6574:	219080ef          	jal	ef8c <__eqtf2>
    6578:	0e050463          	beqz	a0,6660 <frexpl+0x17c>
    657c:	00000693          	li	a3,0
    6580:	06048e63          	beqz	s1,65fc <frexpl+0x118>
    6584:	ffffc737          	lui	a4,0xffffc
    6588:	00270713          	addi	a4,a4,2 # ffffc002 <_memory_end+0xfffdc002>
    658c:	03c12903          	lw	s2,60(sp)
    6590:	00e484b3          	add	s1,s1,a4
    6594:	800107b7          	lui	a5,0x80010
    6598:	00d484b3          	add	s1,s1,a3
    659c:	fff78793          	addi	a5,a5,-1 # 8000ffff <_memory_end+0x7ffeffff>
    65a0:	009ba023          	sw	s1,0(s7)
    65a4:	03012b03          	lw	s6,48(sp)
    65a8:	03412a83          	lw	s5,52(sp)
    65ac:	03812a03          	lw	s4,56(sp)
    65b0:	04c12b83          	lw	s7,76(sp)
    65b4:	00f97933          	and	s2,s2,a5
    65b8:	3ffe07b7          	lui	a5,0x3ffe0
    65bc:	00f96933          	or	s2,s2,a5
    65c0:	01642023          	sw	s6,0(s0)
    65c4:	01542223          	sw	s5,4(s0)
    65c8:	01442423          	sw	s4,8(s0)
    65cc:	01242623          	sw	s2,12(s0)
    65d0:	06c12083          	lw	ra,108(sp)
    65d4:	00040513          	mv	a0,s0
    65d8:	06812403          	lw	s0,104(sp)
    65dc:	06412483          	lw	s1,100(sp)
    65e0:	06012903          	lw	s2,96(sp)
    65e4:	05c12983          	lw	s3,92(sp)
    65e8:	05812a03          	lw	s4,88(sp)
    65ec:	05412a83          	lw	s5,84(sp)
    65f0:	05012b03          	lw	s6,80(sp)
    65f4:	07010113          	addi	sp,sp,112
    65f8:	00008067          	ret
    65fc:	407107b7          	lui	a5,0x40710
    6600:	00010613          	mv	a2,sp
    6604:	01010593          	addi	a1,sp,16
    6608:	02010513          	addi	a0,sp,32
    660c:	00f12623          	sw	a5,12(sp)
    6610:	01612823          	sw	s6,16(sp)
    6614:	01512a23          	sw	s5,20(sp)
    6618:	01412c23          	sw	s4,24(sp)
    661c:	01212e23          	sw	s2,28(sp)
    6620:	00012023          	sw	zero,0(sp)
    6624:	00012223          	sw	zero,4(sp)
    6628:	00012423          	sw	zero,8(sp)
    662c:	48d080ef          	jal	f2b8 <__multf3>
    6630:	02012703          	lw	a4,32(sp)
    6634:	02c12783          	lw	a5,44(sp)
    6638:	f8e00693          	li	a3,-114
    663c:	02e12823          	sw	a4,48(sp)
    6640:	02412703          	lw	a4,36(sp)
    6644:	0107d493          	srli	s1,a5,0x10
    6648:	02f12e23          	sw	a5,60(sp)
    664c:	02e12a23          	sw	a4,52(sp)
    6650:	02812703          	lw	a4,40(sp)
    6654:	0134f4b3          	and	s1,s1,s3
    6658:	02e12c23          	sw	a4,56(sp)
    665c:	f29ff06f          	j	6584 <frexpl+0xa0>
    6660:	04c12b83          	lw	s7,76(sp)
    6664:	f5dff06f          	j	65c0 <frexpl+0xdc>

00006668 <_malloc_trim_r>:
    6668:	fe010113          	addi	sp,sp,-32
    666c:	01312623          	sw	s3,12(sp)
    6670:	000139b7          	lui	s3,0x13
    6674:	00812c23          	sw	s0,24(sp)
    6678:	00912a23          	sw	s1,20(sp)
    667c:	01212823          	sw	s2,16(sp)
    6680:	01412423          	sw	s4,8(sp)
    6684:	00112e23          	sw	ra,28(sp)
    6688:	00058a13          	mv	s4,a1
    668c:	00050913          	mv	s2,a0
    6690:	5ec98993          	addi	s3,s3,1516 # 135ec <__malloc_av_>
    6694:	000030ef          	jal	9694 <__malloc_lock>
    6698:	0089a703          	lw	a4,8(s3)
    669c:	000017b7          	lui	a5,0x1
    66a0:	fef78793          	addi	a5,a5,-17 # fef <my_vprintf+0x343>
    66a4:	00472483          	lw	s1,4(a4)
    66a8:	00001737          	lui	a4,0x1
    66ac:	ffc4f493          	andi	s1,s1,-4
    66b0:	00f48433          	add	s0,s1,a5
    66b4:	41440433          	sub	s0,s0,s4
    66b8:	00c45413          	srli	s0,s0,0xc
    66bc:	fff40413          	addi	s0,s0,-1
    66c0:	00c41413          	slli	s0,s0,0xc
    66c4:	00e44e63          	blt	s0,a4,66e0 <_malloc_trim_r+0x78>
    66c8:	00000593          	li	a1,0
    66cc:	00090513          	mv	a0,s2
    66d0:	449040ef          	jal	b318 <_sbrk_r>
    66d4:	0089a783          	lw	a5,8(s3)
    66d8:	009787b3          	add	a5,a5,s1
    66dc:	02f50863          	beq	a0,a5,670c <_malloc_trim_r+0xa4>
    66e0:	00090513          	mv	a0,s2
    66e4:	7b5020ef          	jal	9698 <__malloc_unlock>
    66e8:	01c12083          	lw	ra,28(sp)
    66ec:	01812403          	lw	s0,24(sp)
    66f0:	01412483          	lw	s1,20(sp)
    66f4:	01012903          	lw	s2,16(sp)
    66f8:	00c12983          	lw	s3,12(sp)
    66fc:	00812a03          	lw	s4,8(sp)
    6700:	00000513          	li	a0,0
    6704:	02010113          	addi	sp,sp,32
    6708:	00008067          	ret
    670c:	408005b3          	neg	a1,s0
    6710:	00090513          	mv	a0,s2
    6714:	405040ef          	jal	b318 <_sbrk_r>
    6718:	fff00793          	li	a5,-1
    671c:	04f50a63          	beq	a0,a5,6770 <_malloc_trim_r+0x108>
    6720:	000147b7          	lui	a5,0x14
    6724:	d1078793          	addi	a5,a5,-752 # 13d10 <__malloc_current_mallinfo>
    6728:	0007a703          	lw	a4,0(a5)
    672c:	0089a683          	lw	a3,8(s3)
    6730:	408484b3          	sub	s1,s1,s0
    6734:	0014e493          	ori	s1,s1,1
    6738:	40870733          	sub	a4,a4,s0
    673c:	00090513          	mv	a0,s2
    6740:	0096a223          	sw	s1,4(a3)
    6744:	00e7a023          	sw	a4,0(a5)
    6748:	751020ef          	jal	9698 <__malloc_unlock>
    674c:	01c12083          	lw	ra,28(sp)
    6750:	01812403          	lw	s0,24(sp)
    6754:	01412483          	lw	s1,20(sp)
    6758:	01012903          	lw	s2,16(sp)
    675c:	00c12983          	lw	s3,12(sp)
    6760:	00812a03          	lw	s4,8(sp)
    6764:	00100513          	li	a0,1
    6768:	02010113          	addi	sp,sp,32
    676c:	00008067          	ret
    6770:	00000593          	li	a1,0
    6774:	00090513          	mv	a0,s2
    6778:	3a1040ef          	jal	b318 <_sbrk_r>
    677c:	0089a703          	lw	a4,8(s3)
    6780:	00f00693          	li	a3,15
    6784:	40e507b3          	sub	a5,a0,a4
    6788:	f4f6dce3          	bge	a3,a5,66e0 <_malloc_trim_r+0x78>
    678c:	000146b7          	lui	a3,0x14
    6790:	bd06a683          	lw	a3,-1072(a3) # 13bd0 <__malloc_sbrk_base>
    6794:	0017e793          	ori	a5,a5,1
    6798:	00f72223          	sw	a5,4(a4) # 1004 <uart_init+0x8>
    679c:	40d50533          	sub	a0,a0,a3
    67a0:	000146b7          	lui	a3,0x14
    67a4:	d0a6a823          	sw	a0,-752(a3) # 13d10 <__malloc_current_mallinfo>
    67a8:	f39ff06f          	j	66e0 <_malloc_trim_r+0x78>

000067ac <_free_r>:
    67ac:	18058263          	beqz	a1,6930 <_free_r+0x184>
    67b0:	ff010113          	addi	sp,sp,-16
    67b4:	00812423          	sw	s0,8(sp)
    67b8:	00912223          	sw	s1,4(sp)
    67bc:	00058413          	mv	s0,a1
    67c0:	00050493          	mv	s1,a0
    67c4:	00112623          	sw	ra,12(sp)
    67c8:	6cd020ef          	jal	9694 <__malloc_lock>
    67cc:	ffc42503          	lw	a0,-4(s0)
    67d0:	ff840713          	addi	a4,s0,-8
    67d4:	000135b7          	lui	a1,0x13
    67d8:	ffe57793          	andi	a5,a0,-2
    67dc:	00f70633          	add	a2,a4,a5
    67e0:	5ec58593          	addi	a1,a1,1516 # 135ec <__malloc_av_>
    67e4:	00462683          	lw	a3,4(a2)
    67e8:	0085a803          	lw	a6,8(a1)
    67ec:	ffc6f693          	andi	a3,a3,-4
    67f0:	1ac80263          	beq	a6,a2,6994 <_free_r+0x1e8>
    67f4:	00d62223          	sw	a3,4(a2)
    67f8:	00157513          	andi	a0,a0,1
    67fc:	00d60833          	add	a6,a2,a3
    6800:	0a051063          	bnez	a0,68a0 <_free_r+0xf4>
    6804:	ff842303          	lw	t1,-8(s0)
    6808:	00482803          	lw	a6,4(a6)
    680c:	00013537          	lui	a0,0x13
    6810:	40670733          	sub	a4,a4,t1
    6814:	00872883          	lw	a7,8(a4)
    6818:	5f450513          	addi	a0,a0,1524 # 135f4 <__malloc_av_+0x8>
    681c:	006787b3          	add	a5,a5,t1
    6820:	00187813          	andi	a6,a6,1
    6824:	14a88263          	beq	a7,a0,6968 <_free_r+0x1bc>
    6828:	00c72303          	lw	t1,12(a4)
    682c:	0068a623          	sw	t1,12(a7)
    6830:	01132423          	sw	a7,8(t1)
    6834:	1a080a63          	beqz	a6,69e8 <_free_r+0x23c>
    6838:	0017e693          	ori	a3,a5,1
    683c:	00d72223          	sw	a3,4(a4)
    6840:	00f62023          	sw	a5,0(a2)
    6844:	1ff00693          	li	a3,511
    6848:	06f6ec63          	bltu	a3,a5,68c0 <_free_r+0x114>
    684c:	ff87f693          	andi	a3,a5,-8
    6850:	00868693          	addi	a3,a3,8
    6854:	0045a503          	lw	a0,4(a1)
    6858:	00d586b3          	add	a3,a1,a3
    685c:	0006a603          	lw	a2,0(a3)
    6860:	0057d813          	srli	a6,a5,0x5
    6864:	00100793          	li	a5,1
    6868:	010797b3          	sll	a5,a5,a6
    686c:	00a7e7b3          	or	a5,a5,a0
    6870:	ff868513          	addi	a0,a3,-8
    6874:	00a72623          	sw	a0,12(a4)
    6878:	00c72423          	sw	a2,8(a4)
    687c:	00f5a223          	sw	a5,4(a1)
    6880:	00e6a023          	sw	a4,0(a3)
    6884:	00e62623          	sw	a4,12(a2)
    6888:	00812403          	lw	s0,8(sp)
    688c:	00c12083          	lw	ra,12(sp)
    6890:	00048513          	mv	a0,s1
    6894:	00412483          	lw	s1,4(sp)
    6898:	01010113          	addi	sp,sp,16
    689c:	5fd0206f          	j	9698 <__malloc_unlock>
    68a0:	00482503          	lw	a0,4(a6)
    68a4:	00157513          	andi	a0,a0,1
    68a8:	08050663          	beqz	a0,6934 <_free_r+0x188>
    68ac:	0017e693          	ori	a3,a5,1
    68b0:	fed42e23          	sw	a3,-4(s0)
    68b4:	00f62023          	sw	a5,0(a2)
    68b8:	1ff00693          	li	a3,511
    68bc:	f8f6f8e3          	bgeu	a3,a5,684c <_free_r+0xa0>
    68c0:	0097d693          	srli	a3,a5,0x9
    68c4:	00400613          	li	a2,4
    68c8:	12d66463          	bltu	a2,a3,69f0 <_free_r+0x244>
    68cc:	0067d693          	srli	a3,a5,0x6
    68d0:	03968513          	addi	a0,a3,57
    68d4:	03868613          	addi	a2,a3,56
    68d8:	00351513          	slli	a0,a0,0x3
    68dc:	00a58533          	add	a0,a1,a0
    68e0:	00052683          	lw	a3,0(a0)
    68e4:	ff850513          	addi	a0,a0,-8
    68e8:	00d51863          	bne	a0,a3,68f8 <_free_r+0x14c>
    68ec:	15c0006f          	j	6a48 <_free_r+0x29c>
    68f0:	0086a683          	lw	a3,8(a3)
    68f4:	00d50863          	beq	a0,a3,6904 <_free_r+0x158>
    68f8:	0046a603          	lw	a2,4(a3)
    68fc:	ffc67613          	andi	a2,a2,-4
    6900:	fec7e8e3          	bltu	a5,a2,68f0 <_free_r+0x144>
    6904:	00c6a503          	lw	a0,12(a3)
    6908:	00a72623          	sw	a0,12(a4)
    690c:	00d72423          	sw	a3,8(a4)
    6910:	00812403          	lw	s0,8(sp)
    6914:	00e52423          	sw	a4,8(a0)
    6918:	00c12083          	lw	ra,12(sp)
    691c:	00048513          	mv	a0,s1
    6920:	00412483          	lw	s1,4(sp)
    6924:	00e6a623          	sw	a4,12(a3)
    6928:	01010113          	addi	sp,sp,16
    692c:	56d0206f          	j	9698 <__malloc_unlock>
    6930:	00008067          	ret
    6934:	00013537          	lui	a0,0x13
    6938:	00d787b3          	add	a5,a5,a3
    693c:	5f450513          	addi	a0,a0,1524 # 135f4 <__malloc_av_+0x8>
    6940:	00862683          	lw	a3,8(a2)
    6944:	0ea68063          	beq	a3,a0,6a24 <_free_r+0x278>
    6948:	00c62803          	lw	a6,12(a2)
    694c:	0017e513          	ori	a0,a5,1
    6950:	00f70633          	add	a2,a4,a5
    6954:	0106a623          	sw	a6,12(a3)
    6958:	00d82423          	sw	a3,8(a6)
    695c:	00a72223          	sw	a0,4(a4)
    6960:	00f62023          	sw	a5,0(a2)
    6964:	ee1ff06f          	j	6844 <_free_r+0x98>
    6968:	14081063          	bnez	a6,6aa8 <_free_r+0x2fc>
    696c:	00862583          	lw	a1,8(a2)
    6970:	00c62603          	lw	a2,12(a2)
    6974:	00f686b3          	add	a3,a3,a5
    6978:	0016e793          	ori	a5,a3,1
    697c:	00c5a623          	sw	a2,12(a1)
    6980:	00b62423          	sw	a1,8(a2)
    6984:	00f72223          	sw	a5,4(a4)
    6988:	00d70733          	add	a4,a4,a3
    698c:	00d72023          	sw	a3,0(a4)
    6990:	ef9ff06f          	j	6888 <_free_r+0xdc>
    6994:	00157513          	andi	a0,a0,1
    6998:	00d786b3          	add	a3,a5,a3
    699c:	02051063          	bnez	a0,69bc <_free_r+0x210>
    69a0:	ff842503          	lw	a0,-8(s0)
    69a4:	40a70733          	sub	a4,a4,a0
    69a8:	00c72783          	lw	a5,12(a4)
    69ac:	00872603          	lw	a2,8(a4)
    69b0:	00a686b3          	add	a3,a3,a0
    69b4:	00f62623          	sw	a5,12(a2)
    69b8:	00c7a423          	sw	a2,8(a5)
    69bc:	000147b7          	lui	a5,0x14
    69c0:	0016e613          	ori	a2,a3,1
    69c4:	bd47a783          	lw	a5,-1068(a5) # 13bd4 <__malloc_trim_threshold>
    69c8:	00c72223          	sw	a2,4(a4)
    69cc:	00e5a423          	sw	a4,8(a1)
    69d0:	eaf6ece3          	bltu	a3,a5,6888 <_free_r+0xdc>
    69d4:	000147b7          	lui	a5,0x14
    69d8:	d487a583          	lw	a1,-696(a5) # 13d48 <__malloc_top_pad>
    69dc:	00048513          	mv	a0,s1
    69e0:	c89ff0ef          	jal	6668 <_malloc_trim_r>
    69e4:	ea5ff06f          	j	6888 <_free_r+0xdc>
    69e8:	00d787b3          	add	a5,a5,a3
    69ec:	f55ff06f          	j	6940 <_free_r+0x194>
    69f0:	01400613          	li	a2,20
    69f4:	02d67063          	bgeu	a2,a3,6a14 <_free_r+0x268>
    69f8:	05400613          	li	a2,84
    69fc:	06d66463          	bltu	a2,a3,6a64 <_free_r+0x2b8>
    6a00:	00c7d693          	srli	a3,a5,0xc
    6a04:	06f68513          	addi	a0,a3,111
    6a08:	06e68613          	addi	a2,a3,110
    6a0c:	00351513          	slli	a0,a0,0x3
    6a10:	ecdff06f          	j	68dc <_free_r+0x130>
    6a14:	05c68513          	addi	a0,a3,92
    6a18:	05b68613          	addi	a2,a3,91
    6a1c:	00351513          	slli	a0,a0,0x3
    6a20:	ebdff06f          	j	68dc <_free_r+0x130>
    6a24:	00e5aa23          	sw	a4,20(a1)
    6a28:	00e5a823          	sw	a4,16(a1)
    6a2c:	0017e693          	ori	a3,a5,1
    6a30:	00a72623          	sw	a0,12(a4)
    6a34:	00a72423          	sw	a0,8(a4)
    6a38:	00d72223          	sw	a3,4(a4)
    6a3c:	00f70733          	add	a4,a4,a5
    6a40:	00f72023          	sw	a5,0(a4)
    6a44:	e45ff06f          	j	6888 <_free_r+0xdc>
    6a48:	0045a803          	lw	a6,4(a1)
    6a4c:	40265613          	srai	a2,a2,0x2
    6a50:	00100793          	li	a5,1
    6a54:	00c797b3          	sll	a5,a5,a2
    6a58:	0107e7b3          	or	a5,a5,a6
    6a5c:	00f5a223          	sw	a5,4(a1)
    6a60:	ea9ff06f          	j	6908 <_free_r+0x15c>
    6a64:	15400613          	li	a2,340
    6a68:	00d66c63          	bltu	a2,a3,6a80 <_free_r+0x2d4>
    6a6c:	00f7d693          	srli	a3,a5,0xf
    6a70:	07868513          	addi	a0,a3,120
    6a74:	07768613          	addi	a2,a3,119
    6a78:	00351513          	slli	a0,a0,0x3
    6a7c:	e61ff06f          	j	68dc <_free_r+0x130>
    6a80:	55400613          	li	a2,1364
    6a84:	00d66c63          	bltu	a2,a3,6a9c <_free_r+0x2f0>
    6a88:	0127d693          	srli	a3,a5,0x12
    6a8c:	07d68513          	addi	a0,a3,125
    6a90:	07c68613          	addi	a2,a3,124
    6a94:	00351513          	slli	a0,a0,0x3
    6a98:	e45ff06f          	j	68dc <_free_r+0x130>
    6a9c:	3f800513          	li	a0,1016
    6aa0:	07e00613          	li	a2,126
    6aa4:	e39ff06f          	j	68dc <_free_r+0x130>
    6aa8:	0017e693          	ori	a3,a5,1
    6aac:	00d72223          	sw	a3,4(a4)
    6ab0:	00f62023          	sw	a5,0(a2)
    6ab4:	dd5ff06f          	j	6888 <_free_r+0xdc>

00006ab8 <_ldtoa_r>:
    6ab8:	77818893          	addi	a7,gp,1912 # 12f48 <blanks.1+0x10>
    6abc:	0008af83          	lw	t6,0(a7)
    6ac0:	0048af03          	lw	t5,4(a7)
    6ac4:	0088ae83          	lw	t4,8(a7)
    6ac8:	00c8ae03          	lw	t3,12(a7)
    6acc:	0108a303          	lw	t1,16(a7)
    6ad0:	03852883          	lw	a7,56(a0)
    6ad4:	f5010113          	addi	sp,sp,-176
    6ad8:	0b212023          	sw	s2,160(sp)
    6adc:	09312e23          	sw	s3,156(sp)
    6ae0:	09412c23          	sw	s4,152(sp)
    6ae4:	09612823          	sw	s6,144(sp)
    6ae8:	09712623          	sw	s7,140(sp)
    6aec:	09812423          	sw	s8,136(sp)
    6af0:	09912223          	sw	s9,132(sp)
    6af4:	09a12023          	sw	s10,128(sp)
    6af8:	0a112623          	sw	ra,172(sp)
    6afc:	0a812423          	sw	s0,168(sp)
    6b00:	0a912223          	sw	s1,164(sp)
    6b04:	09512a23          	sw	s5,148(sp)
    6b08:	07b12e23          	sw	s11,124(sp)
    6b0c:	05f12e23          	sw	t6,92(sp)
    6b10:	07e12023          	sw	t5,96(sp)
    6b14:	07d12223          	sw	t4,100(sp)
    6b18:	07c12423          	sw	t3,104(sp)
    6b1c:	06612623          	sw	t1,108(sp)
    6b20:	00c12c23          	sw	a2,24(sp)
    6b24:	00d12e23          	sw	a3,28(sp)
    6b28:	0005aa03          	lw	s4,0(a1)
    6b2c:	0045a983          	lw	s3,4(a1)
    6b30:	0085a903          	lw	s2,8(a1)
    6b34:	00c5ac03          	lw	s8,12(a1)
    6b38:	00050b13          	mv	s6,a0
    6b3c:	00070b93          	mv	s7,a4
    6b40:	00078c93          	mv	s9,a5
    6b44:	00080d13          	mv	s10,a6
    6b48:	00088863          	beqz	a7,6b58 <_ldtoa_r+0xa0>
    6b4c:	00088593          	mv	a1,a7
    6b50:	018020ef          	jal	8b68 <__freedtoa>
    6b54:	020b2c23          	sw	zero,56(s6)
    6b58:	06812603          	lw	a2,104(sp)
    6b5c:	01fc5693          	srli	a3,s8,0x1f
    6b60:	001c1a93          	slli	s5,s8,0x1
    6b64:	40165713          	srai	a4,a2,0x1
    6b68:	ffffc4b7          	lui	s1,0xffffc
    6b6c:	001c1413          	slli	s0,s8,0x1
    6b70:	00d77733          	and	a4,a4,a3
    6b74:	011ada93          	srli	s5,s5,0x11
    6b78:	f9148493          	addi	s1,s1,-111 # ffffbf91 <_memory_end+0xfffdbf91>
    6b7c:	010c1d93          	slli	s11,s8,0x10
    6b80:	00dca023          	sw	a3,0(s9)
    6b84:	00145413          	srli	s0,s0,0x1
    6b88:	00c74733          	xor	a4,a4,a2
    6b8c:	010ddd93          	srli	s11,s11,0x10
    6b90:	009a87b3          	add	a5,s5,s1
    6b94:	02010593          	addi	a1,sp,32
    6b98:	03010513          	addi	a0,sp,48
    6b9c:	03412823          	sw	s4,48(sp)
    6ba0:	03312a23          	sw	s3,52(sp)
    6ba4:	03212c23          	sw	s2,56(sp)
    6ba8:	02812e23          	sw	s0,60(sp)
    6bac:	03412023          	sw	s4,32(sp)
    6bb0:	03312223          	sw	s3,36(sp)
    6bb4:	03212423          	sw	s2,40(sp)
    6bb8:	02812623          	sw	s0,44(sp)
    6bbc:	06e12423          	sw	a4,104(sp)
    6bc0:	00f12a23          	sw	a5,20(sp)
    6bc4:	05412623          	sw	s4,76(sp)
    6bc8:	05312823          	sw	s3,80(sp)
    6bcc:	05212a23          	sw	s2,84(sp)
    6bd0:	05b12c23          	sw	s11,88(sp)
    6bd4:	3790a0ef          	jal	1174c <__unordtf2>
    6bd8:	16051a63          	bnez	a0,6d4c <_ldtoa_r+0x294>
    6bdc:	7fff0cb7          	lui	s9,0x7fff0
    6be0:	fff00493          	li	s1,-1
    6be4:	fffc8c93          	addi	s9,s9,-1 # 7ffeffff <_memory_end+0x7ffcffff>
    6be8:	02010593          	addi	a1,sp,32
    6bec:	03010513          	addi	a0,sp,48
    6bf0:	03412823          	sw	s4,48(sp)
    6bf4:	03312a23          	sw	s3,52(sp)
    6bf8:	03212c23          	sw	s2,56(sp)
    6bfc:	02812e23          	sw	s0,60(sp)
    6c00:	02912023          	sw	s1,32(sp)
    6c04:	02912223          	sw	s1,36(sp)
    6c08:	02912423          	sw	s1,40(sp)
    6c0c:	03912623          	sw	s9,44(sp)
    6c10:	33d0a0ef          	jal	1174c <__unordtf2>
    6c14:	08051c63          	bnez	a0,6cac <_ldtoa_r+0x1f4>
    6c18:	02010593          	addi	a1,sp,32
    6c1c:	03010513          	addi	a0,sp,48
    6c20:	568080ef          	jal	f188 <__letf2>
    6c24:	08a05463          	blez	a0,6cac <_ldtoa_r+0x1f4>
    6c28:	00300793          	li	a5,3
    6c2c:	04f12423          	sw	a5,72(sp)
    6c30:	01812783          	lw	a5,24(sp)
    6c34:	01c12803          	lw	a6,28(sp)
    6c38:	01412603          	lw	a2,20(sp)
    6c3c:	04810713          	addi	a4,sp,72
    6c40:	01a12023          	sw	s10,0(sp)
    6c44:	000b8893          	mv	a7,s7
    6c48:	04c10693          	addi	a3,sp,76
    6c4c:	05c10593          	addi	a1,sp,92
    6c50:	000b0513          	mv	a0,s6
    6c54:	208000ef          	jal	6e5c <__gdtoa>
    6c58:	000ba703          	lw	a4,0(s7)
    6c5c:	ffff87b7          	lui	a5,0xffff8
    6c60:	00f71863          	bne	a4,a5,6c70 <_ldtoa_r+0x1b8>
    6c64:	800007b7          	lui	a5,0x80000
    6c68:	fff78793          	addi	a5,a5,-1 # 7fffffff <_memory_end+0x7ffdffff>
    6c6c:	00fba023          	sw	a5,0(s7)
    6c70:	0ac12083          	lw	ra,172(sp)
    6c74:	0a812403          	lw	s0,168(sp)
    6c78:	0a412483          	lw	s1,164(sp)
    6c7c:	0a012903          	lw	s2,160(sp)
    6c80:	09c12983          	lw	s3,156(sp)
    6c84:	09812a03          	lw	s4,152(sp)
    6c88:	09412a83          	lw	s5,148(sp)
    6c8c:	09012b03          	lw	s6,144(sp)
    6c90:	08c12b83          	lw	s7,140(sp)
    6c94:	08812c03          	lw	s8,136(sp)
    6c98:	08412c83          	lw	s9,132(sp)
    6c9c:	08012d03          	lw	s10,128(sp)
    6ca0:	07c12d83          	lw	s11,124(sp)
    6ca4:	0b010113          	addi	sp,sp,176
    6ca8:	00008067          	ret
    6cac:	000107b7          	lui	a5,0x10
    6cb0:	02010593          	addi	a1,sp,32
    6cb4:	03010513          	addi	a0,sp,48
    6cb8:	03412823          	sw	s4,48(sp)
    6cbc:	03312a23          	sw	s3,52(sp)
    6cc0:	03212c23          	sw	s2,56(sp)
    6cc4:	02812e23          	sw	s0,60(sp)
    6cc8:	02012023          	sw	zero,32(sp)
    6ccc:	02012223          	sw	zero,36(sp)
    6cd0:	02012423          	sw	zero,40(sp)
    6cd4:	02f12623          	sw	a5,44(sp)
    6cd8:	380080ef          	jal	f058 <__getf2>
    6cdc:	00054e63          	bltz	a0,6cf8 <_ldtoa_r+0x240>
    6ce0:	000107b7          	lui	a5,0x10
    6ce4:	00fdedb3          	or	s11,s11,a5
    6ce8:	00100793          	li	a5,1
    6cec:	04f12423          	sw	a5,72(sp)
    6cf0:	05b12c23          	sw	s11,88(sp)
    6cf4:	f3dff06f          	j	6c30 <_ldtoa_r+0x178>
    6cf8:	02010593          	addi	a1,sp,32
    6cfc:	03010513          	addi	a0,sp,48
    6d00:	03412823          	sw	s4,48(sp)
    6d04:	03312a23          	sw	s3,52(sp)
    6d08:	03212c23          	sw	s2,56(sp)
    6d0c:	03812e23          	sw	s8,60(sp)
    6d10:	02012023          	sw	zero,32(sp)
    6d14:	02012223          	sw	zero,36(sp)
    6d18:	02012423          	sw	zero,40(sp)
    6d1c:	02012623          	sw	zero,44(sp)
    6d20:	26c080ef          	jal	ef8c <__eqtf2>
    6d24:	00051663          	bnez	a0,6d30 <_ldtoa_r+0x278>
    6d28:	04012423          	sw	zero,72(sp)
    6d2c:	f05ff06f          	j	6c30 <_ldtoa_r+0x178>
    6d30:	ffffc4b7          	lui	s1,0xffffc
    6d34:	00200793          	li	a5,2
    6d38:	f9248493          	addi	s1,s1,-110 # ffffbf92 <_memory_end+0xfffdbf92>
    6d3c:	04f12423          	sw	a5,72(sp)
    6d40:	009a87b3          	add	a5,s5,s1
    6d44:	00f12a23          	sw	a5,20(sp)
    6d48:	ee9ff06f          	j	6c30 <_ldtoa_r+0x178>
    6d4c:	00400793          	li	a5,4
    6d50:	04f12423          	sw	a5,72(sp)
    6d54:	eddff06f          	j	6c30 <_ldtoa_r+0x178>

00006d58 <_ldcheck>:
    6d58:	fc010113          	addi	sp,sp,-64
    6d5c:	02912a23          	sw	s1,52(sp)
    6d60:	00c52483          	lw	s1,12(a0)
    6d64:	03312623          	sw	s3,44(sp)
    6d68:	03412423          	sw	s4,40(sp)
    6d6c:	00852983          	lw	s3,8(a0)
    6d70:	00452a03          	lw	s4,4(a0)
    6d74:	03512223          	sw	s5,36(sp)
    6d78:	00052a83          	lw	s5,0(a0)
    6d7c:	00149493          	slli	s1,s1,0x1
    6d80:	0014d493          	srli	s1,s1,0x1
    6d84:	00010593          	mv	a1,sp
    6d88:	01010513          	addi	a0,sp,16
    6d8c:	02112e23          	sw	ra,60(sp)
    6d90:	01512823          	sw	s5,16(sp)
    6d94:	01412a23          	sw	s4,20(sp)
    6d98:	01312c23          	sw	s3,24(sp)
    6d9c:	00912e23          	sw	s1,28(sp)
    6da0:	01512023          	sw	s5,0(sp)
    6da4:	01412223          	sw	s4,4(sp)
    6da8:	01312423          	sw	s3,8(sp)
    6dac:	00912623          	sw	s1,12(sp)
    6db0:	19d0a0ef          	jal	1174c <__unordtf2>
    6db4:	08051463          	bnez	a0,6e3c <_ldcheck+0xe4>
    6db8:	03612023          	sw	s6,32(sp)
    6dbc:	7fff0b37          	lui	s6,0x7fff0
    6dc0:	03212823          	sw	s2,48(sp)
    6dc4:	fffb0b13          	addi	s6,s6,-1 # 7ffeffff <_memory_end+0x7ffcffff>
    6dc8:	fff00913          	li	s2,-1
    6dcc:	00010593          	mv	a1,sp
    6dd0:	01010513          	addi	a0,sp,16
    6dd4:	02812c23          	sw	s0,56(sp)
    6dd8:	01212023          	sw	s2,0(sp)
    6ddc:	01212223          	sw	s2,4(sp)
    6de0:	01212423          	sw	s2,8(sp)
    6de4:	01612623          	sw	s6,12(sp)
    6de8:	00100413          	li	s0,1
    6dec:	1610a0ef          	jal	1174c <__unordtf2>
    6df0:	02050c63          	beqz	a0,6e28 <_ldcheck+0xd0>
    6df4:	03c12083          	lw	ra,60(sp)
    6df8:	00144513          	xori	a0,s0,1
    6dfc:	03812403          	lw	s0,56(sp)
    6e00:	0ff57513          	zext.b	a0,a0
    6e04:	03012903          	lw	s2,48(sp)
    6e08:	02012b03          	lw	s6,32(sp)
    6e0c:	03412483          	lw	s1,52(sp)
    6e10:	02c12983          	lw	s3,44(sp)
    6e14:	02812a03          	lw	s4,40(sp)
    6e18:	02412a83          	lw	s5,36(sp)
    6e1c:	00151513          	slli	a0,a0,0x1
    6e20:	04010113          	addi	sp,sp,64
    6e24:	00008067          	ret
    6e28:	00010593          	mv	a1,sp
    6e2c:	01010513          	addi	a0,sp,16
    6e30:	358080ef          	jal	f188 <__letf2>
    6e34:	00152413          	slti	s0,a0,1
    6e38:	fbdff06f          	j	6df4 <_ldcheck+0x9c>
    6e3c:	03c12083          	lw	ra,60(sp)
    6e40:	03412483          	lw	s1,52(sp)
    6e44:	02c12983          	lw	s3,44(sp)
    6e48:	02812a03          	lw	s4,40(sp)
    6e4c:	02412a83          	lw	s5,36(sp)
    6e50:	00100513          	li	a0,1
    6e54:	04010113          	addi	sp,sp,64
    6e58:	00008067          	ret

00006e5c <__gdtoa>:
    6e5c:	f3010113          	addi	sp,sp,-208
    6e60:	0b612823          	sw	s6,176(sp)
    6e64:	00072b03          	lw	s6,0(a4)
    6e68:	0ba12023          	sw	s10,160(sp)
    6e6c:	0c112623          	sw	ra,204(sp)
    6e70:	fcfb7313          	andi	t1,s6,-49
    6e74:	00672023          	sw	t1,0(a4)
    6e78:	00070d13          	mv	s10,a4
    6e7c:	0d012703          	lw	a4,208(sp)
    6e80:	00fb7313          	andi	t1,s6,15
    6e84:	00300e93          	li	t4,3
    6e88:	00e12623          	sw	a4,12(sp)
    6e8c:	00f12823          	sw	a5,16(sp)
    6e90:	01012c23          	sw	a6,24(sp)
    6e94:	01112423          	sw	a7,8(sp)
    6e98:	7fd30263          	beq	t1,t4,767c <__gdtoa+0x820>
    6e9c:	0b912223          	sw	s9,164(sp)
    6ea0:	00cb7c93          	andi	s9,s6,12
    6ea4:	720c9a63          	bnez	s9,75d8 <__gdtoa+0x77c>
    6ea8:	0c812423          	sw	s0,200(sp)
    6eac:	00050413          	mv	s0,a0
    6eb0:	78030463          	beqz	t1,7638 <__gdtoa+0x7dc>
    6eb4:	0b712623          	sw	s7,172(sp)
    6eb8:	0005ab83          	lw	s7,0(a1)
    6ebc:	0d212023          	sw	s2,192(sp)
    6ec0:	0b512a23          	sw	s5,180(sp)
    6ec4:	09b12e23          	sw	s11,156(sp)
    6ec8:	00068913          	mv	s2,a3
    6ecc:	0c912223          	sw	s1,196(sp)
    6ed0:	02000693          	li	a3,32
    6ed4:	00058d93          	mv	s11,a1
    6ed8:	00060a93          	mv	s5,a2
    6edc:	00000593          	li	a1,0
    6ee0:	02000793          	li	a5,32
    6ee4:	0176d863          	bge	a3,s7,6ef4 <__gdtoa+0x98>
    6ee8:	00179793          	slli	a5,a5,0x1
    6eec:	00158593          	addi	a1,a1,1
    6ef0:	ff77cce3          	blt	a5,s7,6ee8 <__gdtoa+0x8c>
    6ef4:	00040513          	mv	a0,s0
    6ef8:	7a4020ef          	jal	969c <_Balloc>
    6efc:	00050493          	mv	s1,a0
    6f00:	3a0504e3          	beqz	a0,7aa8 <__gdtoa+0xc4c>
    6f04:	fffb8513          	addi	a0,s7,-1
    6f08:	40555513          	srai	a0,a0,0x5
    6f0c:	00251593          	slli	a1,a0,0x2
    6f10:	0b312e23          	sw	s3,188(sp)
    6f14:	0b812423          	sw	s8,168(sp)
    6f18:	00b905b3          	add	a1,s2,a1
    6f1c:	01448693          	addi	a3,s1,20
    6f20:	00090793          	mv	a5,s2
    6f24:	0007a703          	lw	a4,0(a5) # 10000 <__multf3+0xd48>
    6f28:	00478793          	addi	a5,a5,4
    6f2c:	00468693          	addi	a3,a3,4
    6f30:	fee6ae23          	sw	a4,-4(a3)
    6f34:	fef5f8e3          	bgeu	a1,a5,6f24 <__gdtoa+0xc8>
    6f38:	00158593          	addi	a1,a1,1
    6f3c:	00190793          	addi	a5,s2,1
    6f40:	00400693          	li	a3,4
    6f44:	00f5e663          	bltu	a1,a5,6f50 <__gdtoa+0xf4>
    6f48:	00251513          	slli	a0,a0,0x2
    6f4c:	00450693          	addi	a3,a0,4
    6f50:	4026dc13          	srai	s8,a3,0x2
    6f54:	00d486b3          	add	a3,s1,a3
    6f58:	00c0006f          	j	6f64 <__gdtoa+0x108>
    6f5c:	ffc68693          	addi	a3,a3,-4
    6f60:	780c0863          	beqz	s8,76f0 <__gdtoa+0x894>
    6f64:	0106a783          	lw	a5,16(a3)
    6f68:	000c0993          	mv	s3,s8
    6f6c:	fffc0c13          	addi	s8,s8,-1
    6f70:	fe0786e3          	beqz	a5,6f5c <__gdtoa+0x100>
    6f74:	004c0793          	addi	a5,s8,4
    6f78:	00279793          	slli	a5,a5,0x2
    6f7c:	00f487b3          	add	a5,s1,a5
    6f80:	0047a503          	lw	a0,4(a5)
    6f84:	0134a823          	sw	s3,16(s1)
    6f88:	00599993          	slli	s3,s3,0x5
    6f8c:	25d020ef          	jal	99e8 <__hi0bits>
    6f90:	40a98c33          	sub	s8,s3,a0
    6f94:	00048513          	mv	a0,s1
    6f98:	6c5010ef          	jal	8e5c <__trailz_D2A>
    6f9c:	08a12623          	sw	a0,140(sp)
    6fa0:	03512223          	sw	s5,36(sp)
    6fa4:	78051a63          	bnez	a0,7738 <__gdtoa+0x8dc>
    6fa8:	0104a683          	lw	a3,16(s1)
    6fac:	66068263          	beqz	a3,7610 <__gdtoa+0x7b4>
    6fb0:	08c10593          	addi	a1,sp,140
    6fb4:	00048513          	mv	a0,s1
    6fb8:	0b412c23          	sw	s4,184(sp)
    6fbc:	434030ef          	jal	a3f0 <__b2d>
    6fc0:	00c59993          	slli	s3,a1,0xc
    6fc4:	00c9d993          	srli	s3,s3,0xc
    6fc8:	3ff006b7          	lui	a3,0x3ff00
    6fcc:	00d9e833          	or	a6,s3,a3
    6fd0:	02412703          	lw	a4,36(sp)
    6fd4:	000136b7          	lui	a3,0x13
    6fd8:	4506a603          	lw	a2,1104(a3) # 13450 <__clz_tab+0x104>
    6fdc:	4546a683          	lw	a3,1108(a3)
    6fe0:	01870733          	add	a4,a4,s8
    6fe4:	00080593          	mv	a1,a6
    6fe8:	00050793          	mv	a5,a0
    6fec:	fff70a13          	addi	s4,a4,-1
    6ff0:	03012823          	sw	a6,48(sp)
    6ff4:	02e12423          	sw	a4,40(sp)
    6ff8:	04f12423          	sw	a5,72(sp)
    6ffc:	04a12223          	sw	a0,68(sp)
    7000:	63c070ef          	jal	e63c <__subdf3>
    7004:	000136b7          	lui	a3,0x13
    7008:	4586a603          	lw	a2,1112(a3) # 13458 <__clz_tab+0x10c>
    700c:	45c6a683          	lw	a3,1116(a3)
    7010:	03c070ef          	jal	e04c <__muldf3>
    7014:	000136b7          	lui	a3,0x13
    7018:	4606a603          	lw	a2,1120(a3) # 13460 <__clz_tab+0x114>
    701c:	4646a683          	lw	a3,1124(a3)
    7020:	779050ef          	jal	cf98 <__adddf3>
    7024:	00050793          	mv	a5,a0
    7028:	000a0513          	mv	a0,s4
    702c:	00f12e23          	sw	a5,28(sp)
    7030:	00058993          	mv	s3,a1
    7034:	631070ef          	jal	ee64 <__floatsidf>
    7038:	000136b7          	lui	a3,0x13
    703c:	4686a603          	lw	a2,1128(a3) # 13468 <__clz_tab+0x11c>
    7040:	46c6a683          	lw	a3,1132(a3)
    7044:	008070ef          	jal	e04c <__muldf3>
    7048:	01c12783          	lw	a5,28(sp)
    704c:	00050613          	mv	a2,a0
    7050:	00058693          	mv	a3,a1
    7054:	00078513          	mv	a0,a5
    7058:	00098593          	mv	a1,s3
    705c:	73d050ef          	jal	cf98 <__adddf3>
    7060:	02a12023          	sw	a0,32(sp)
    7064:	00058993          	mv	s3,a1
    7068:	000a0513          	mv	a0,s4
    706c:	000a5863          	bgez	s4,707c <__gdtoa+0x220>
    7070:	02812703          	lw	a4,40(sp)
    7074:	00100513          	li	a0,1
    7078:	40e50533          	sub	a0,a0,a4
    707c:	bcb50513          	addi	a0,a0,-1077
    7080:	02a05a63          	blez	a0,70b4 <__gdtoa+0x258>
    7084:	5e1070ef          	jal	ee64 <__floatsidf>
    7088:	000136b7          	lui	a3,0x13
    708c:	4706a603          	lw	a2,1136(a3) # 13470 <__clz_tab+0x124>
    7090:	4746a683          	lw	a3,1140(a3)
    7094:	7b9060ef          	jal	e04c <__muldf3>
    7098:	00050613          	mv	a2,a0
    709c:	02012503          	lw	a0,32(sp)
    70a0:	00058693          	mv	a3,a1
    70a4:	00098593          	mv	a1,s3
    70a8:	6f1050ef          	jal	cf98 <__adddf3>
    70ac:	02a12023          	sw	a0,32(sp)
    70b0:	00058993          	mv	s3,a1
    70b4:	02012503          	lw	a0,32(sp)
    70b8:	00098593          	mv	a1,s3
    70bc:	529070ef          	jal	ede4 <__fixdfsi>
    70c0:	00050813          	mv	a6,a0
    70c4:	02012503          	lw	a0,32(sp)
    70c8:	00098593          	mv	a1,s3
    70cc:	00000613          	li	a2,0
    70d0:	00000693          	li	a3,0
    70d4:	01012e23          	sw	a6,28(sp)
    70d8:	699060ef          	jal	df70 <__ledf2>
    70dc:	02055463          	bgez	a0,7104 <__gdtoa+0x2a8>
    70e0:	01c12503          	lw	a0,28(sp)
    70e4:	581070ef          	jal	ee64 <__floatsidf>
    70e8:	02012603          	lw	a2,32(sp)
    70ec:	00098693          	mv	a3,s3
    70f0:	519060ef          	jal	de08 <__eqdf2>
    70f4:	01c12783          	lw	a5,28(sp)
    70f8:	00a03533          	snez	a0,a0
    70fc:	40a787b3          	sub	a5,a5,a0
    7100:	00f12e23          	sw	a5,28(sp)
    7104:	03012783          	lw	a5,48(sp)
    7108:	014a1613          	slli	a2,s4,0x14
    710c:	01c12703          	lw	a4,28(sp)
    7110:	414c0a33          	sub	s4,s8,s4
    7114:	00f609b3          	add	s3,a2,a5
    7118:	fffa0793          	addi	a5,s4,-1
    711c:	01600693          	li	a3,22
    7120:	02f12023          	sw	a5,32(sp)
    7124:	5ce6ea63          	bltu	a3,a4,76f8 <__gdtoa+0x89c>
    7128:	000137b7          	lui	a5,0x13
    712c:	fb878613          	addi	a2,a5,-72 # 12fb8 <__mprec_tens>
    7130:	00371693          	slli	a3,a4,0x3
    7134:	00c686b3          	add	a3,a3,a2
    7138:	04412883          	lw	a7,68(sp)
    713c:	0006a503          	lw	a0,0(a3)
    7140:	0046a583          	lw	a1,4(a3)
    7144:	00088613          	mv	a2,a7
    7148:	00098693          	mv	a3,s3
    714c:	549060ef          	jal	de94 <__gedf2>
    7150:	1aa044e3          	bgtz	a0,7af8 <__gdtoa+0xc9c>
    7154:	04012823          	sw	zero,80(sp)
    7158:	02012823          	sw	zero,48(sp)
    715c:	01404a63          	bgtz	s4,7170 <__gdtoa+0x314>
    7160:	00100693          	li	a3,1
    7164:	414687b3          	sub	a5,a3,s4
    7168:	02f12823          	sw	a5,48(sp)
    716c:	02012023          	sw	zero,32(sp)
    7170:	02012703          	lw	a4,32(sp)
    7174:	01c12783          	lw	a5,28(sp)
    7178:	02012c23          	sw	zero,56(sp)
    717c:	00f70733          	add	a4,a4,a5
    7180:	02e12023          	sw	a4,32(sp)
    7184:	02f12e23          	sw	a5,60(sp)
    7188:	01012783          	lw	a5,16(sp)
    718c:	00900693          	li	a3,9
    7190:	5cf6e463          	bltu	a3,a5,7758 <__gdtoa+0x8fc>
    7194:	00500693          	li	a3,5
    7198:	16f6cae3          	blt	a3,a5,7b0c <__gdtoa+0xcb0>
    719c:	02812783          	lw	a5,40(sp)
    71a0:	00400613          	li	a2,4
    71a4:	3fd78793          	addi	a5,a5,1021
    71a8:	7f87ba13          	sltiu	s4,a5,2040
    71ac:	01012783          	lw	a5,16(sp)
    71b0:	00c79463          	bne	a5,a2,71b8 <__gdtoa+0x35c>
    71b4:	06c0106f          	j	8220 <__gdtoa+0x13c4>
    71b8:	00d79463          	bne	a5,a3,71c0 <__gdtoa+0x364>
    71bc:	0580106f          	j	8214 <__gdtoa+0x13b8>
    71c0:	00200693          	li	a3,2
    71c4:	00d79463          	bne	a5,a3,71cc <__gdtoa+0x370>
    71c8:	0640106f          	j	822c <__gdtoa+0x13d0>
    71cc:	00300693          	li	a3,3
    71d0:	04012023          	sw	zero,64(sp)
    71d4:	58d79a63          	bne	a5,a3,7768 <__gdtoa+0x90c>
    71d8:	03c12783          	lw	a5,60(sp)
    71dc:	01812703          	lw	a4,24(sp)
    71e0:	00e787b3          	add	a5,a5,a4
    71e4:	04f12a23          	sw	a5,84(sp)
    71e8:	00178793          	addi	a5,a5,1
    71ec:	02f12a23          	sw	a5,52(sp)
    71f0:	5ef05ee3          	blez	a5,7fec <__gdtoa+0x1190>
    71f4:	00078693          	mv	a3,a5
    71f8:	00078593          	mv	a1,a5
    71fc:	00040513          	mv	a0,s0
    7200:	08d12623          	sw	a3,140(sp)
    7204:	041010ef          	jal	8a44 <__rv_alloc_D2A>
    7208:	00050f13          	mv	t5,a0
    720c:	4a050c63          	beqz	a0,76c4 <__gdtoa+0x868>
    7210:	00cda783          	lw	a5,12(s11)
    7214:	fff78793          	addi	a5,a5,-1
    7218:	02f12423          	sw	a5,40(sp)
    721c:	58078e63          	beqz	a5,77b8 <__gdtoa+0x95c>
    7220:	0c07c6e3          	bltz	a5,7aec <__gdtoa+0xc90>
    7224:	100b7e13          	andi	t3,s6,256
    7228:	580e1063          	bnez	t3,77a8 <__gdtoa+0x94c>
    722c:	02412783          	lw	a5,36(sp)
    7230:	0007c863          	bltz	a5,7240 <__gdtoa+0x3e4>
    7234:	03c12783          	lw	a5,60(sp)
    7238:	00e00693          	li	a3,14
    723c:	10f6d0e3          	bge	a3,a5,7b3c <__gdtoa+0xce0>
    7240:	04012783          	lw	a5,64(sp)
    7244:	08078ce3          	beqz	a5,7adc <__gdtoa+0xc80>
    7248:	02412783          	lw	a5,36(sp)
    724c:	418b8333          	sub	t1,s7,s8
    7250:	004da683          	lw	a3,4(s11)
    7254:	00130613          	addi	a2,t1,1
    7258:	08c12623          	sw	a2,140(sp)
    725c:	40678333          	sub	t1,a5,t1
    7260:	5ed356e3          	bge	t1,a3,804c <__gdtoa+0x11f0>
    7264:	01012703          	lw	a4,16(sp)
    7268:	ffd70613          	addi	a2,a4,-3
    726c:	ffd67613          	andi	a2,a2,-3
    7270:	4c0606e3          	beqz	a2,7f3c <__gdtoa+0x10e0>
    7274:	40d786b3          	sub	a3,a5,a3
    7278:	00168693          	addi	a3,a3,1
    727c:	08d12623          	sw	a3,140(sp)
    7280:	00100613          	li	a2,1
    7284:	00e65c63          	bge	a2,a4,729c <__gdtoa+0x440>
    7288:	03412783          	lw	a5,52(sp)
    728c:	00f05863          	blez	a5,729c <__gdtoa+0x440>
    7290:	03412783          	lw	a5,52(sp)
    7294:	00d7d463          	bge	a5,a3,729c <__gdtoa+0x440>
    7298:	5a40106f          	j	883c <__gdtoa+0x19e0>
    729c:	03012783          	lw	a5,48(sp)
    72a0:	02012703          	lw	a4,32(sp)
    72a4:	03812b03          	lw	s6,56(sp)
    72a8:	00078a13          	mv	s4,a5
    72ac:	00d70733          	add	a4,a4,a3
    72b0:	00f687b3          	add	a5,a3,a5
    72b4:	02e12023          	sw	a4,32(sp)
    72b8:	02f12823          	sw	a5,48(sp)
    72bc:	00100593          	li	a1,1
    72c0:	00040513          	mv	a0,s0
    72c4:	03e12223          	sw	t5,36(sp)
    72c8:	079020ef          	jal	9b40 <__i2b>
    72cc:	02412f03          	lw	t5,36(sp)
    72d0:	00050993          	mv	s3,a0
    72d4:	3e050863          	beqz	a0,76c4 <__gdtoa+0x868>
    72d8:	020a0c63          	beqz	s4,7310 <__gdtoa+0x4b4>
    72dc:	02012783          	lw	a5,32(sp)
    72e0:	02f05863          	blez	a5,7310 <__gdtoa+0x4b4>
    72e4:	000a0693          	mv	a3,s4
    72e8:	0147d463          	bge	a5,s4,72f0 <__gdtoa+0x494>
    72ec:	00078693          	mv	a3,a5
    72f0:	03012783          	lw	a5,48(sp)
    72f4:	08d12623          	sw	a3,140(sp)
    72f8:	40da0a33          	sub	s4,s4,a3
    72fc:	40d787b3          	sub	a5,a5,a3
    7300:	02f12823          	sw	a5,48(sp)
    7304:	02012783          	lw	a5,32(sp)
    7308:	40d787b3          	sub	a5,a5,a3
    730c:	02f12023          	sw	a5,32(sp)
    7310:	03812783          	lw	a5,56(sp)
    7314:	02078863          	beqz	a5,7344 <__gdtoa+0x4e8>
    7318:	04012783          	lw	a5,64(sp)
    731c:	00078463          	beqz	a5,7324 <__gdtoa+0x4c8>
    7320:	620b10e3          	bnez	s6,8140 <__gdtoa+0x12e4>
    7324:	03812603          	lw	a2,56(sp)
    7328:	00048593          	mv	a1,s1
    732c:	00040513          	mv	a0,s0
    7330:	03e12223          	sw	t5,36(sp)
    7334:	2e1020ef          	jal	9e14 <__pow5mult>
    7338:	02412f03          	lw	t5,36(sp)
    733c:	00050493          	mv	s1,a0
    7340:	38050263          	beqz	a0,76c4 <__gdtoa+0x868>
    7344:	00100593          	li	a1,1
    7348:	00040513          	mv	a0,s0
    734c:	03e12223          	sw	t5,36(sp)
    7350:	7f0020ef          	jal	9b40 <__i2b>
    7354:	00050b93          	mv	s7,a0
    7358:	36050663          	beqz	a0,76c4 <__gdtoa+0x868>
    735c:	01c12783          	lw	a5,28(sp)
    7360:	02412f03          	lw	t5,36(sp)
    7364:	48079ae3          	bnez	a5,7ff8 <__gdtoa+0x119c>
    7368:	01012783          	lw	a5,16(sp)
    736c:	00100693          	li	a3,1
    7370:	1af6d4e3          	bge	a3,a5,7d18 <__gdtoa+0xebc>
    7374:	01f00a93          	li	s5,31
    7378:	02012783          	lw	a5,32(sp)
    737c:	40fa8ab3          	sub	s5,s5,a5
    7380:	03012783          	lw	a5,48(sp)
    7384:	ffca8a93          	addi	s5,s5,-4
    7388:	01fafa93          	andi	s5,s5,31
    738c:	00fa8633          	add	a2,s5,a5
    7390:	09512623          	sw	s5,140(sp)
    7394:	000a8793          	mv	a5,s5
    7398:	28c040e3          	bgtz	a2,7e18 <__gdtoa+0xfbc>
    739c:	02012703          	lw	a4,32(sp)
    73a0:	00f70633          	add	a2,a4,a5
    73a4:	30c04263          	bgtz	a2,76a8 <__gdtoa+0x84c>
    73a8:	05012783          	lw	a5,80(sp)
    73ac:	280798e3          	bnez	a5,7e3c <__gdtoa+0xfe0>
    73b0:	03412783          	lw	a5,52(sp)
    73b4:	3af05ae3          	blez	a5,7f68 <__gdtoa+0x110c>
    73b8:	04012783          	lw	a5,64(sp)
    73bc:	2c078ce3          	beqz	a5,7e94 <__gdtoa+0x1038>
    73c0:	014a8633          	add	a2,s5,s4
    73c4:	62c040e3          	bgtz	a2,81e4 <__gdtoa+0x1388>
    73c8:	01c12783          	lw	a5,28(sp)
    73cc:	00098a13          	mv	s4,s3
    73d0:	68079ae3          	bnez	a5,8264 <__gdtoa+0x1408>
    73d4:	01a12e23          	sw	s10,28(sp)
    73d8:	01012c83          	lw	s9,16(sp)
    73dc:	03412d03          	lw	s10,52(sp)
    73e0:	000f0c13          	mv	s8,t5
    73e4:	00100793          	li	a5,1
    73e8:	01e12c23          	sw	t5,24(sp)
    73ec:	0b00006f          	j	749c <__gdtoa+0x640>
    73f0:	00040513          	mv	a0,s0
    73f4:	35c020ef          	jal	9750 <_Bfree>
    73f8:	000ad463          	bgez	s5,7400 <__gdtoa+0x5a4>
    73fc:	0000106f          	j	83fc <__gdtoa+0x15a0>
    7400:	015ceab3          	or	s5,s9,s5
    7404:	000a9a63          	bnez	s5,7418 <__gdtoa+0x5bc>
    7408:	00092783          	lw	a5,0(s2)
    740c:	0017f793          	andi	a5,a5,1
    7410:	00079463          	bnez	a5,7418 <__gdtoa+0x5bc>
    7414:	7e90006f          	j	83fc <__gdtoa+0x15a0>
    7418:	02812783          	lw	a5,40(sp)
    741c:	00200713          	li	a4,2
    7420:	00e78463          	beq	a5,a4,7428 <__gdtoa+0x5cc>
    7424:	3440106f          	j	8768 <__gdtoa+0x190c>
    7428:	01bc0023          	sb	s11,0(s8)
    742c:	08c12783          	lw	a5,140(sp)
    7430:	001c0c13          	addi	s8,s8,1
    7434:	00fd1463          	bne	s10,a5,743c <__gdtoa+0x5e0>
    7438:	2580106f          	j	8690 <__gdtoa+0x1834>
    743c:	00048593          	mv	a1,s1
    7440:	00000693          	li	a3,0
    7444:	00a00613          	li	a2,10
    7448:	00040513          	mv	a0,s0
    744c:	328020ef          	jal	9774 <__multadd>
    7450:	00050493          	mv	s1,a0
    7454:	26050863          	beqz	a0,76c4 <__gdtoa+0x868>
    7458:	00000693          	li	a3,0
    745c:	00a00613          	li	a2,10
    7460:	00098593          	mv	a1,s3
    7464:	00040513          	mv	a0,s0
    7468:	114988e3          	beq	s3,s4,7d78 <__gdtoa+0xf1c>
    746c:	308020ef          	jal	9774 <__multadd>
    7470:	00050993          	mv	s3,a0
    7474:	24050863          	beqz	a0,76c4 <__gdtoa+0x868>
    7478:	000a0593          	mv	a1,s4
    747c:	00000693          	li	a3,0
    7480:	00a00613          	li	a2,10
    7484:	00040513          	mv	a0,s0
    7488:	2ec020ef          	jal	9774 <__multadd>
    748c:	00050a13          	mv	s4,a0
    7490:	22050a63          	beqz	a0,76c4 <__gdtoa+0x868>
    7494:	08c12783          	lw	a5,140(sp)
    7498:	00178793          	addi	a5,a5,1
    749c:	000b8593          	mv	a1,s7
    74a0:	00048513          	mv	a0,s1
    74a4:	08f12623          	sw	a5,140(sp)
    74a8:	6d8010ef          	jal	8b80 <__quorem_D2A>
    74ac:	00050b13          	mv	s6,a0
    74b0:	00098593          	mv	a1,s3
    74b4:	00048513          	mv	a0,s1
    74b8:	429020ef          	jal	a0e0 <__mcmp>
    74bc:	000b8593          	mv	a1,s7
    74c0:	00050a93          	mv	s5,a0
    74c4:	000a0613          	mv	a2,s4
    74c8:	00040513          	mv	a0,s0
    74cc:	46d020ef          	jal	a138 <__mdiff>
    74d0:	030b0d93          	addi	s11,s6,48
    74d4:	00050593          	mv	a1,a0
    74d8:	1e050663          	beqz	a0,76c4 <__gdtoa+0x868>
    74dc:	00c52783          	lw	a5,12(a0)
    74e0:	f00798e3          	bnez	a5,73f0 <__gdtoa+0x594>
    74e4:	00a12823          	sw	a0,16(sp)
    74e8:	00048513          	mv	a0,s1
    74ec:	3f5020ef          	jal	a0e0 <__mcmp>
    74f0:	01012583          	lw	a1,16(sp)
    74f4:	00050793          	mv	a5,a0
    74f8:	00040513          	mv	a0,s0
    74fc:	00f12823          	sw	a5,16(sp)
    7500:	250020ef          	jal	9750 <_Bfree>
    7504:	01012783          	lw	a5,16(sp)
    7508:	00fce733          	or	a4,s9,a5
    750c:	00070463          	beqz	a4,7514 <__gdtoa+0x6b8>
    7510:	4b00106f          	j	89c0 <__gdtoa+0x1b64>
    7514:	00092783          	lw	a5,0(s2)
    7518:	0017f793          	andi	a5,a5,1
    751c:	060798e3          	bnez	a5,7d8c <__gdtoa+0xf30>
    7520:	02812783          	lw	a5,40(sp)
    7524:	00079463          	bnez	a5,752c <__gdtoa+0x6d0>
    7528:	3880106f          	j	88b0 <__gdtoa+0x1a54>
    752c:	ef504ee3          	bgtz	s5,7428 <__gdtoa+0x5cc>
    7530:	0104a683          	lw	a3,16(s1)
    7534:	00100793          	li	a5,1
    7538:	01812f03          	lw	t5,24(sp)
    753c:	01c12d03          	lw	s10,28(sp)
    7540:	00070c93          	mv	s9,a4
    7544:	00d7c463          	blt	a5,a3,754c <__gdtoa+0x6f0>
    7548:	4440106f          	j	898c <__gdtoa+0x1b30>
    754c:	02812703          	lw	a4,40(sp)
    7550:	00200793          	li	a5,2
    7554:	000f0b13          	mv	s6,t5
    7558:	02f71463          	bne	a4,a5,7580 <__gdtoa+0x724>
    755c:	4040106f          	j	8960 <__gdtoa+0x1b04>
    7560:	214020ef          	jal	9774 <__multadd>
    7564:	000b8593          	mv	a1,s7
    7568:	00050493          	mv	s1,a0
    756c:	14050c63          	beqz	a0,76c4 <__gdtoa+0x868>
    7570:	610010ef          	jal	8b80 <__quorem_D2A>
    7574:	03050d93          	addi	s11,a0,48
    7578:	00090c13          	mv	s8,s2
    757c:	000a8a13          	mv	s4,s5
    7580:	000a0593          	mv	a1,s4
    7584:	000b8513          	mv	a0,s7
    7588:	359020ef          	jal	a0e0 <__mcmp>
    758c:	00050793          	mv	a5,a0
    7590:	00000693          	li	a3,0
    7594:	00a00613          	li	a2,10
    7598:	000a0593          	mv	a1,s4
    759c:	00040513          	mv	a0,s0
    75a0:	001c0913          	addi	s2,s8,1
    75a4:	00f04463          	bgtz	a5,75ac <__gdtoa+0x750>
    75a8:	3a00106f          	j	8948 <__gdtoa+0x1aec>
    75ac:	ffb90fa3          	sb	s11,-1(s2)
    75b0:	1c4020ef          	jal	9774 <__multadd>
    75b4:	00050a93          	mv	s5,a0
    75b8:	00000693          	li	a3,0
    75bc:	00a00613          	li	a2,10
    75c0:	00048593          	mv	a1,s1
    75c4:	00040513          	mv	a0,s0
    75c8:	0e0a8e63          	beqz	s5,76c4 <__gdtoa+0x868>
    75cc:	f9499ae3          	bne	s3,s4,7560 <__gdtoa+0x704>
    75d0:	000a8993          	mv	s3,s5
    75d4:	f8dff06f          	j	7560 <__gdtoa+0x704>
    75d8:	00400793          	li	a5,4
    75dc:	10f31663          	bne	t1,a5,76e8 <__gdtoa+0x88c>
    75e0:	00812703          	lw	a4,8(sp)
    75e4:	00c12603          	lw	a2,12(sp)
    75e8:	0a412c83          	lw	s9,164(sp)
    75ec:	0cc12083          	lw	ra,204(sp)
    75f0:	0b012b03          	lw	s6,176(sp)
    75f4:	0a012d03          	lw	s10,160(sp)
    75f8:	ffff87b7          	lui	a5,0xffff8
    75fc:	00f72023          	sw	a5,0(a4)
    7600:	00300693          	li	a3,3
    7604:	3f018593          	addi	a1,gp,1008 # 12bc0 <keypad_map+0x60>
    7608:	0d010113          	addi	sp,sp,208
    760c:	4a40106f          	j	8ab0 <__nrv_alloc_D2A>
    7610:	00048593          	mv	a1,s1
    7614:	00040513          	mv	a0,s0
    7618:	138020ef          	jal	9750 <_Bfree>
    761c:	0c412483          	lw	s1,196(sp)
    7620:	0c012903          	lw	s2,192(sp)
    7624:	0bc12983          	lw	s3,188(sp)
    7628:	0b412a83          	lw	s5,180(sp)
    762c:	0ac12b83          	lw	s7,172(sp)
    7630:	0a812c03          	lw	s8,168(sp)
    7634:	09c12d83          	lw	s11,156(sp)
    7638:	00812703          	lw	a4,8(sp)
    763c:	00c12603          	lw	a2,12(sp)
    7640:	00100793          	li	a5,1
    7644:	00040513          	mv	a0,s0
    7648:	00f72023          	sw	a5,0(a4)
    764c:	00100693          	li	a3,1
    7650:	3e018593          	addi	a1,gp,992 # 12bb0 <keypad_map+0x50>
    7654:	45c010ef          	jal	8ab0 <__nrv_alloc_D2A>
    7658:	0c812403          	lw	s0,200(sp)
    765c:	00050f13          	mv	t5,a0
    7660:	0cc12083          	lw	ra,204(sp)
    7664:	0a412c83          	lw	s9,164(sp)
    7668:	0b012b03          	lw	s6,176(sp)
    766c:	0a012d03          	lw	s10,160(sp)
    7670:	000f0513          	mv	a0,t5
    7674:	0d010113          	addi	sp,sp,208
    7678:	00008067          	ret
    767c:	00812703          	lw	a4,8(sp)
    7680:	00c12603          	lw	a2,12(sp)
    7684:	0cc12083          	lw	ra,204(sp)
    7688:	0b012b03          	lw	s6,176(sp)
    768c:	0a012d03          	lw	s10,160(sp)
    7690:	ffff87b7          	lui	a5,0xffff8
    7694:	00f72023          	sw	a5,0(a4)
    7698:	00800693          	li	a3,8
    769c:	3e418593          	addi	a1,gp,996 # 12bb4 <keypad_map+0x54>
    76a0:	0d010113          	addi	sp,sp,208
    76a4:	40c0106f          	j	8ab0 <__nrv_alloc_D2A>
    76a8:	000b8593          	mv	a1,s7
    76ac:	00040513          	mv	a0,s0
    76b0:	03e12023          	sw	t5,32(sp)
    76b4:	0a5020ef          	jal	9f58 <__lshift>
    76b8:	02012f03          	lw	t5,32(sp)
    76bc:	00050b93          	mv	s7,a0
    76c0:	ce0514e3          	bnez	a0,73a8 <__gdtoa+0x54c>
    76c4:	0c812403          	lw	s0,200(sp)
    76c8:	0c412483          	lw	s1,196(sp)
    76cc:	0c012903          	lw	s2,192(sp)
    76d0:	0bc12983          	lw	s3,188(sp)
    76d4:	0b812a03          	lw	s4,184(sp)
    76d8:	0b412a83          	lw	s5,180(sp)
    76dc:	0ac12b83          	lw	s7,172(sp)
    76e0:	0a812c03          	lw	s8,168(sp)
    76e4:	09c12d83          	lw	s11,156(sp)
    76e8:	00000f13          	li	t5,0
    76ec:	f75ff06f          	j	7660 <__gdtoa+0x804>
    76f0:	0004a823          	sw	zero,16(s1)
    76f4:	8a1ff06f          	j	6f94 <__gdtoa+0x138>
    76f8:	00100793          	li	a5,1
    76fc:	04f12823          	sw	a5,80(sp)
    7700:	02012823          	sw	zero,48(sp)
    7704:	fffa0793          	addi	a5,s4,-1
    7708:	3c07c063          	bltz	a5,7ac8 <__gdtoa+0xc6c>
    770c:	01c12783          	lw	a5,28(sp)
    7710:	a607d0e3          	bgez	a5,7170 <__gdtoa+0x314>
    7714:	01c12783          	lw	a5,28(sp)
    7718:	03012703          	lw	a4,48(sp)
    771c:	00012e23          	sw	zero,28(sp)
    7720:	02f12e23          	sw	a5,60(sp)
    7724:	40f70733          	sub	a4,a4,a5
    7728:	02e12823          	sw	a4,48(sp)
    772c:	40f00733          	neg	a4,a5
    7730:	02e12c23          	sw	a4,56(sp)
    7734:	a55ff06f          	j	7188 <__gdtoa+0x32c>
    7738:	00050593          	mv	a1,a0
    773c:	00048513          	mv	a0,s1
    7740:	638010ef          	jal	8d78 <__rshift_D2A>
    7744:	08c12683          	lw	a3,140(sp)
    7748:	015687b3          	add	a5,a3,s5
    774c:	02f12223          	sw	a5,36(sp)
    7750:	40dc0c33          	sub	s8,s8,a3
    7754:	855ff06f          	j	6fa8 <__gdtoa+0x14c>
    7758:	02812783          	lw	a5,40(sp)
    775c:	00012823          	sw	zero,16(sp)
    7760:	3fd78793          	addi	a5,a5,1021 # ffff83fd <_memory_end+0xfffd83fd>
    7764:	7f87ba13          	sltiu	s4,a5,2040
    7768:	000b8513          	mv	a0,s7
    776c:	6f8070ef          	jal	ee64 <__floatsidf>
    7770:	000136b7          	lui	a3,0x13
    7774:	4786a603          	lw	a2,1144(a3) # 13478 <__clz_tab+0x12c>
    7778:	47c6a683          	lw	a3,1148(a3)
    777c:	0d1060ef          	jal	e04c <__muldf3>
    7780:	664070ef          	jal	ede4 <__fixdfsi>
    7784:	00100793          	li	a5,1
    7788:	00350593          	addi	a1,a0,3
    778c:	04f12023          	sw	a5,64(sp)
    7790:	fff00793          	li	a5,-1
    7794:	00058693          	mv	a3,a1
    7798:	00012c23          	sw	zero,24(sp)
    779c:	04f12a23          	sw	a5,84(sp)
    77a0:	02f12a23          	sw	a5,52(sp)
    77a4:	a59ff06f          	j	71fc <__gdtoa+0x3a0>
    77a8:	02812783          	lw	a5,40(sp)
    77ac:	00300693          	li	a3,3
    77b0:	40f687b3          	sub	a5,a3,a5
    77b4:	02f12423          	sw	a5,40(sp)
    77b8:	03412783          	lw	a5,52(sp)
    77bc:	00e00693          	li	a3,14
    77c0:	a6f6e6e3          	bltu	a3,a5,722c <__gdtoa+0x3d0>
    77c4:	a60a04e3          	beqz	s4,722c <__gdtoa+0x3d0>
    77c8:	03c12703          	lw	a4,60(sp)
    77cc:	02812683          	lw	a3,40(sp)
    77d0:	00d766b3          	or	a3,a4,a3
    77d4:	a4069ce3          	bnez	a3,722c <__gdtoa+0x3d0>
    77d8:	05012703          	lw	a4,80(sp)
    77dc:	08012623          	sw	zero,140(sp)
    77e0:	05312c23          	sw	s3,88(sp)
    77e4:	04412b03          	lw	s6,68(sp)
    77e8:	02070463          	beqz	a4,7810 <__gdtoa+0x9b4>
    77ec:	000136b7          	lui	a3,0x13
    77f0:	4806a603          	lw	a2,1152(a3) # 13480 <__clz_tab+0x134>
    77f4:	4846a683          	lw	a3,1156(a3)
    77f8:	000b0513          	mv	a0,s6
    77fc:	00098593          	mv	a1,s3
    7800:	03e12423          	sw	t5,40(sp)
    7804:	76c060ef          	jal	df70 <__ledf2>
    7808:	02812f03          	lw	t5,40(sp)
    780c:	6a0540e3          	bltz	a0,86ac <__gdtoa+0x1850>
    7810:	04412783          	lw	a5,68(sp)
    7814:	03e12423          	sw	t5,40(sp)
    7818:	00078613          	mv	a2,a5
    781c:	00078513          	mv	a0,a5
    7820:	05812783          	lw	a5,88(sp)
    7824:	00078693          	mv	a3,a5
    7828:	00078593          	mv	a1,a5
    782c:	76c050ef          	jal	cf98 <__adddf3>
    7830:	000136b7          	lui	a3,0x13
    7834:	4986a603          	lw	a2,1176(a3) # 13498 <__clz_tab+0x14c>
    7838:	49c6a683          	lw	a3,1180(a3)
    783c:	75c050ef          	jal	cf98 <__adddf3>
    7840:	fcc007b7          	lui	a5,0xfcc00
    7844:	00b78a33          	add	s4,a5,a1
    7848:	03412783          	lw	a5,52(sp)
    784c:	02812f03          	lw	t5,40(sp)
    7850:	00050713          	mv	a4,a0
    7854:	28078ee3          	beqz	a5,82f0 <__gdtoa+0x1494>
    7858:	03412783          	lw	a5,52(sp)
    785c:	04412e83          	lw	t4,68(sp)
    7860:	05812803          	lw	a6,88(sp)
    7864:	06012023          	sw	zero,96(sp)
    7868:	04f12e23          	sw	a5,92(sp)
    786c:	05c12683          	lw	a3,92(sp)
    7870:	000137b7          	lui	a5,0x13
    7874:	04012583          	lw	a1,64(sp)
    7878:	fff68693          	addi	a3,a3,-1
    787c:	fb878613          	addi	a2,a5,-72 # 12fb8 <__mprec_tens>
    7880:	00369693          	slli	a3,a3,0x3
    7884:	00c686b3          	add	a3,a3,a2
    7888:	07012223          	sw	a6,100(sp)
    788c:	03d12423          	sw	t4,40(sp)
    7890:	0006a603          	lw	a2,0(a3)
    7894:	0046a683          	lw	a3,4(a3)
    7898:	44058ae3          	beqz	a1,84ec <__gdtoa+0x1690>
    789c:	000135b7          	lui	a1,0x13
    78a0:	4a85a503          	lw	a0,1192(a1) # 134a8 <__clz_tab+0x15c>
    78a4:	4ac5a583          	lw	a1,1196(a1)
    78a8:	06f12e23          	sw	a5,124(sp)
    78ac:	001f0b13          	addi	s6,t5,1
    78b0:	07e12a23          	sw	t5,116(sp)
    78b4:	04e12423          	sw	a4,72(sp)
    78b8:	675050ef          	jal	d72c <__divdf3>
    78bc:	04812703          	lw	a4,72(sp)
    78c0:	000a0693          	mv	a3,s4
    78c4:	00070613          	mv	a2,a4
    78c8:	575060ef          	jal	e63c <__subdf3>
    78cc:	02812e83          	lw	t4,40(sp)
    78d0:	06412803          	lw	a6,100(sp)
    78d4:	00050613          	mv	a2,a0
    78d8:	00058693          	mv	a3,a1
    78dc:	000e8513          	mv	a0,t4
    78e0:	00080593          	mv	a1,a6
    78e4:	07d12423          	sw	t4,104(sp)
    78e8:	05012423          	sw	a6,72(sp)
    78ec:	06c12623          	sw	a2,108(sp)
    78f0:	06d12823          	sw	a3,112(sp)
    78f4:	4f0070ef          	jal	ede4 <__fixdfsi>
    78f8:	02a12423          	sw	a0,40(sp)
    78fc:	568070ef          	jal	ee64 <__floatsidf>
    7900:	06812e83          	lw	t4,104(sp)
    7904:	04812803          	lw	a6,72(sp)
    7908:	00050613          	mv	a2,a0
    790c:	00058693          	mv	a3,a1
    7910:	000e8513          	mv	a0,t4
    7914:	00080593          	mv	a1,a6
    7918:	525060ef          	jal	e63c <__subdf3>
    791c:	02812e03          	lw	t3,40(sp)
    7920:	07412f03          	lw	t5,116(sp)
    7924:	00050613          	mv	a2,a0
    7928:	00058693          	mv	a3,a1
    792c:	00050a13          	mv	s4,a0
    7930:	00058993          	mv	s3,a1
    7934:	06c12503          	lw	a0,108(sp)
    7938:	07012583          	lw	a1,112(sp)
    793c:	030e0e13          	addi	t3,t3,48
    7940:	01cf0023          	sb	t3,0(t5)
    7944:	03e12423          	sw	t5,40(sp)
    7948:	54c060ef          	jal	de94 <__gedf2>
    794c:	02812f03          	lw	t5,40(sp)
    7950:	6aa048e3          	bgtz	a0,8800 <__gdtoa+0x19a4>
    7954:	000136b7          	lui	a3,0x13
    7958:	4806a783          	lw	a5,1152(a3) # 13480 <__clz_tab+0x134>
    795c:	4846a803          	lw	a6,1156(a3)
    7960:	000136b7          	lui	a3,0x13
    7964:	04f12423          	sw	a5,72(sp)
    7968:	05012623          	sw	a6,76(sp)
    796c:	4886a783          	lw	a5,1160(a3) # 13488 <__clz_tab+0x13c>
    7970:	48c6a803          	lw	a6,1164(a3)
    7974:	06912223          	sw	s1,100(sp)
    7978:	07712a23          	sw	s7,116(sp)
    797c:	07812c23          	sw	s8,120(sp)
    7980:	06c12483          	lw	s1,108(sp)
    7984:	05c12c03          	lw	s8,92(sp)
    7988:	07012b83          	lw	s7,112(sp)
    798c:	02f12423          	sw	a5,40(sp)
    7990:	03012623          	sw	a6,44(sp)
    7994:	05e12e23          	sw	t5,92(sp)
    7998:	06812423          	sw	s0,104(sp)
    799c:	0800006f          	j	7a1c <__gdtoa+0xbc0>
    79a0:	08c12783          	lw	a5,140(sp)
    79a4:	00178793          	addi	a5,a5,1
    79a8:	08f12623          	sw	a5,140(sp)
    79ac:	6d87d8e3          	bge	a5,s8,887c <__gdtoa+0x1a20>
    79b0:	69c060ef          	jal	e04c <__muldf3>
    79b4:	02812603          	lw	a2,40(sp)
    79b8:	02c12683          	lw	a3,44(sp)
    79bc:	00050493          	mv	s1,a0
    79c0:	00058b93          	mv	s7,a1
    79c4:	000a0513          	mv	a0,s4
    79c8:	00098593          	mv	a1,s3
    79cc:	680060ef          	jal	e04c <__muldf3>
    79d0:	00058a13          	mv	s4,a1
    79d4:	00050413          	mv	s0,a0
    79d8:	40c070ef          	jal	ede4 <__fixdfsi>
    79dc:	00050993          	mv	s3,a0
    79e0:	484070ef          	jal	ee64 <__floatsidf>
    79e4:	00050613          	mv	a2,a0
    79e8:	00058693          	mv	a3,a1
    79ec:	00040513          	mv	a0,s0
    79f0:	000a0593          	mv	a1,s4
    79f4:	449060ef          	jal	e63c <__subdf3>
    79f8:	03098793          	addi	a5,s3,48
    79fc:	00048613          	mv	a2,s1
    7a00:	000b8693          	mv	a3,s7
    7a04:	00fb0023          	sb	a5,0(s6)
    7a08:	001b0b13          	addi	s6,s6,1
    7a0c:	00050a13          	mv	s4,a0
    7a10:	00058993          	mv	s3,a1
    7a14:	55c060ef          	jal	df70 <__ledf2>
    7a18:	5c054ee3          	bltz	a0,87f4 <__gdtoa+0x1998>
    7a1c:	04812503          	lw	a0,72(sp)
    7a20:	04c12583          	lw	a1,76(sp)
    7a24:	000a0613          	mv	a2,s4
    7a28:	00098693          	mv	a3,s3
    7a2c:	411060ef          	jal	e63c <__subdf3>
    7a30:	00050613          	mv	a2,a0
    7a34:	00058693          	mv	a3,a1
    7a38:	00048513          	mv	a0,s1
    7a3c:	000b8593          	mv	a1,s7
    7a40:	454060ef          	jal	de94 <__gedf2>
    7a44:	00050793          	mv	a5,a0
    7a48:	02812603          	lw	a2,40(sp)
    7a4c:	02c12683          	lw	a3,44(sp)
    7a50:	00048513          	mv	a0,s1
    7a54:	000b8593          	mv	a1,s7
    7a58:	f4f054e3          	blez	a5,79a0 <__gdtoa+0xb44>
    7a5c:	06012783          	lw	a5,96(sp)
    7a60:	06412483          	lw	s1,100(sp)
    7a64:	05c12f03          	lw	t5,92(sp)
    7a68:	06812403          	lw	s0,104(sp)
    7a6c:	fffb4b83          	lbu	s7,-1(s6)
    7a70:	00178d93          	addi	s11,a5,1
    7a74:	03900693          	li	a3,57
    7a78:	0100006f          	j	7a88 <__gdtoa+0xc2c>
    7a7c:	26ff02e3          	beq	t5,a5,84e0 <__gdtoa+0x1684>
    7a80:	fff7cb83          	lbu	s7,-1(a5)
    7a84:	00078b13          	mv	s6,a5
    7a88:	fffb0793          	addi	a5,s6,-1
    7a8c:	fedb88e3          	beq	s7,a3,7a7c <__gdtoa+0xc20>
    7a90:	001b8693          	addi	a3,s7,1
    7a94:	0ff6f693          	zext.b	a3,a3
    7a98:	00d78023          	sb	a3,0(a5)
    7a9c:	000d8b93          	mv	s7,s11
    7aa0:	02000c93          	li	s9,32
    7aa4:	2140006f          	j	7cb8 <__gdtoa+0xe5c>
    7aa8:	0c812403          	lw	s0,200(sp)
    7aac:	0c412483          	lw	s1,196(sp)
    7ab0:	0c012903          	lw	s2,192(sp)
    7ab4:	0b412a83          	lw	s5,180(sp)
    7ab8:	0ac12b83          	lw	s7,172(sp)
    7abc:	09c12d83          	lw	s11,156(sp)
    7ac0:	00000f13          	li	t5,0
    7ac4:	b9dff06f          	j	7660 <__gdtoa+0x804>
    7ac8:	00100693          	li	a3,1
    7acc:	414687b3          	sub	a5,a3,s4
    7ad0:	02f12823          	sw	a5,48(sp)
    7ad4:	02012023          	sw	zero,32(sp)
    7ad8:	c35ff06f          	j	770c <__gdtoa+0x8b0>
    7adc:	03812b03          	lw	s6,56(sp)
    7ae0:	03012a03          	lw	s4,48(sp)
    7ae4:	00000993          	li	s3,0
    7ae8:	ff0ff06f          	j	72d8 <__gdtoa+0x47c>
    7aec:	00200793          	li	a5,2
    7af0:	02f12423          	sw	a5,40(sp)
    7af4:	f30ff06f          	j	7224 <__gdtoa+0x3c8>
    7af8:	01c12783          	lw	a5,28(sp)
    7afc:	04012823          	sw	zero,80(sp)
    7b00:	fff78793          	addi	a5,a5,-1
    7b04:	00f12e23          	sw	a5,28(sp)
    7b08:	bf9ff06f          	j	7700 <__gdtoa+0x8a4>
    7b0c:	ffc78793          	addi	a5,a5,-4
    7b10:	00f12823          	sw	a5,16(sp)
    7b14:	00400613          	li	a2,4
    7b18:	22c78a63          	beq	a5,a2,7d4c <__gdtoa+0xef0>
    7b1c:	6ed78463          	beq	a5,a3,8204 <__gdtoa+0x13a8>
    7b20:	00200693          	li	a3,2
    7b24:	04012023          	sw	zero,64(sp)
    7b28:	00000a13          	li	s4,0
    7b2c:	22d78663          	beq	a5,a3,7d58 <__gdtoa+0xefc>
    7b30:	00300793          	li	a5,3
    7b34:	00f12823          	sw	a5,16(sp)
    7b38:	ea0ff06f          	j	71d8 <__gdtoa+0x37c>
    7b3c:	000136b7          	lui	a3,0x13
    7b40:	00379793          	slli	a5,a5,0x3
    7b44:	fb868693          	addi	a3,a3,-72 # 12fb8 <__mprec_tens>
    7b48:	00d787b3          	add	a5,a5,a3
    7b4c:	0007aa03          	lw	s4,0(a5)
    7b50:	0047aa83          	lw	s5,4(a5)
    7b54:	01812783          	lw	a5,24(sp)
    7b58:	5407c463          	bltz	a5,80a0 <__gdtoa+0x1244>
    7b5c:	04812b03          	lw	s6,72(sp)
    7b60:	00100793          	li	a5,1
    7b64:	000a0613          	mv	a2,s4
    7b68:	000a8693          	mv	a3,s5
    7b6c:	000b0513          	mv	a0,s6
    7b70:	00098593          	mv	a1,s3
    7b74:	01e12823          	sw	t5,16(sp)
    7b78:	08f12623          	sw	a5,140(sp)
    7b7c:	3b1050ef          	jal	d72c <__divdf3>
    7b80:	264070ef          	jal	ede4 <__fixdfsi>
    7b84:	00050913          	mv	s2,a0
    7b88:	2dc070ef          	jal	ee64 <__floatsidf>
    7b8c:	000a0613          	mv	a2,s4
    7b90:	000a8693          	mv	a3,s5
    7b94:	4b8060ef          	jal	e04c <__muldf3>
    7b98:	00050613          	mv	a2,a0
    7b9c:	00058693          	mv	a3,a1
    7ba0:	000b0513          	mv	a0,s6
    7ba4:	00098593          	mv	a1,s3
    7ba8:	295060ef          	jal	e63c <__subdf3>
    7bac:	01012f03          	lw	t5,16(sp)
    7bb0:	03c12703          	lw	a4,60(sp)
    7bb4:	03090793          	addi	a5,s2,48
    7bb8:	00ff0023          	sb	a5,0(t5)
    7bbc:	00000613          	li	a2,0
    7bc0:	00000693          	li	a3,0
    7bc4:	00170d93          	addi	s11,a4,1
    7bc8:	001f0b13          	addi	s6,t5,1
    7bcc:	00050c13          	mv	s8,a0
    7bd0:	00058993          	mv	s3,a1
    7bd4:	234060ef          	jal	de08 <__eqdf2>
    7bd8:	01012f03          	lw	t5,16(sp)
    7bdc:	000d8b93          	mv	s7,s11
    7be0:	0c050c63          	beqz	a0,7cb8 <__gdtoa+0xe5c>
    7be4:	000137b7          	lui	a5,0x13
    7be8:	48c7a803          	lw	a6,1164(a5) # 1348c <__clz_tab+0x140>
    7bec:	4887a783          	lw	a5,1160(a5)
    7bf0:	01912e23          	sw	s9,28(sp)
    7bf4:	01b12c23          	sw	s11,24(sp)
    7bf8:	03412c83          	lw	s9,52(sp)
    7bfc:	000c0d93          	mv	s11,s8
    7c00:	00f12823          	sw	a5,16(sp)
    7c04:	00098c13          	mv	s8,s3
    7c08:	01012a23          	sw	a6,20(sp)
    7c0c:	000f0993          	mv	s3,t5
    7c10:	0700006f          	j	7c80 <__gdtoa+0xe24>
    7c14:	09112623          	sw	a7,140(sp)
    7c18:	434060ef          	jal	e04c <__muldf3>
    7c1c:	000a0613          	mv	a2,s4
    7c20:	000a8693          	mv	a3,s5
    7c24:	00050d93          	mv	s11,a0
    7c28:	00058c13          	mv	s8,a1
    7c2c:	301050ef          	jal	d72c <__divdf3>
    7c30:	1b4070ef          	jal	ede4 <__fixdfsi>
    7c34:	00050913          	mv	s2,a0
    7c38:	22c070ef          	jal	ee64 <__floatsidf>
    7c3c:	000a0613          	mv	a2,s4
    7c40:	000a8693          	mv	a3,s5
    7c44:	408060ef          	jal	e04c <__muldf3>
    7c48:	00050613          	mv	a2,a0
    7c4c:	00058693          	mv	a3,a1
    7c50:	000d8513          	mv	a0,s11
    7c54:	000c0593          	mv	a1,s8
    7c58:	1e5060ef          	jal	e63c <__subdf3>
    7c5c:	001b0b13          	addi	s6,s6,1
    7c60:	03090793          	addi	a5,s2,48
    7c64:	fefb0fa3          	sb	a5,-1(s6)
    7c68:	00000613          	li	a2,0
    7c6c:	00000693          	li	a3,0
    7c70:	00050d93          	mv	s11,a0
    7c74:	00058c13          	mv	s8,a1
    7c78:	190060ef          	jal	de08 <__eqdf2>
    7c7c:	40050c63          	beqz	a0,8094 <__gdtoa+0x1238>
    7c80:	08c12803          	lw	a6,140(sp)
    7c84:	01012603          	lw	a2,16(sp)
    7c88:	01412683          	lw	a3,20(sp)
    7c8c:	000d8513          	mv	a0,s11
    7c90:	000c0593          	mv	a1,s8
    7c94:	00180893          	addi	a7,a6,1
    7c98:	f7981ee3          	bne	a6,s9,7c14 <__gdtoa+0xdb8>
    7c9c:	02812703          	lw	a4,40(sp)
    7ca0:	01812d83          	lw	s11,24(sp)
    7ca4:	00098f13          	mv	t5,s3
    7ca8:	7c070063          	beqz	a4,8468 <__gdtoa+0x160c>
    7cac:	00100793          	li	a5,1
    7cb0:	01000c93          	li	s9,16
    7cb4:	1ef708e3          	beq	a4,a5,86a4 <__gdtoa+0x1848>
    7cb8:	00048593          	mv	a1,s1
    7cbc:	00040513          	mv	a0,s0
    7cc0:	01e12823          	sw	t5,16(sp)
    7cc4:	28d010ef          	jal	9750 <_Bfree>
    7cc8:	00812783          	lw	a5,8(sp)
    7ccc:	000b0023          	sb	zero,0(s6)
    7cd0:	01012f03          	lw	t5,16(sp)
    7cd4:	0177a023          	sw	s7,0(a5)
    7cd8:	00c12783          	lw	a5,12(sp)
    7cdc:	00078463          	beqz	a5,7ce4 <__gdtoa+0xe88>
    7ce0:	0167a023          	sw	s6,0(a5)
    7ce4:	000d2783          	lw	a5,0(s10)
    7ce8:	0c812403          	lw	s0,200(sp)
    7cec:	0c412483          	lw	s1,196(sp)
    7cf0:	0197e7b3          	or	a5,a5,s9
    7cf4:	0c012903          	lw	s2,192(sp)
    7cf8:	0bc12983          	lw	s3,188(sp)
    7cfc:	0b812a03          	lw	s4,184(sp)
    7d00:	0b412a83          	lw	s5,180(sp)
    7d04:	0ac12b83          	lw	s7,172(sp)
    7d08:	0a812c03          	lw	s8,168(sp)
    7d0c:	09c12d83          	lw	s11,156(sp)
    7d10:	00fd2023          	sw	a5,0(s10)
    7d14:	94dff06f          	j	7660 <__gdtoa+0x804>
    7d18:	e4dc1e63          	bne	s8,a3,7374 <__gdtoa+0x518>
    7d1c:	004da783          	lw	a5,4(s11)
    7d20:	00178793          	addi	a5,a5,1
    7d24:	e557d863          	bge	a5,s5,7374 <__gdtoa+0x518>
    7d28:	03012783          	lw	a5,48(sp)
    7d2c:	00178793          	addi	a5,a5,1
    7d30:	02f12823          	sw	a5,48(sp)
    7d34:	02012783          	lw	a5,32(sp)
    7d38:	00178793          	addi	a5,a5,1
    7d3c:	02f12023          	sw	a5,32(sp)
    7d40:	00100793          	li	a5,1
    7d44:	00f12e23          	sw	a5,28(sp)
    7d48:	e2cff06f          	j	7374 <__gdtoa+0x518>
    7d4c:	00100793          	li	a5,1
    7d50:	00000a13          	li	s4,0
    7d54:	04f12023          	sw	a5,64(sp)
    7d58:	01812583          	lw	a1,24(sp)
    7d5c:	00b04463          	bgtz	a1,7d64 <__gdtoa+0xf08>
    7d60:	00100593          	li	a1,1
    7d64:	00058693          	mv	a3,a1
    7d68:	04b12a23          	sw	a1,84(sp)
    7d6c:	02b12a23          	sw	a1,52(sp)
    7d70:	00b12c23          	sw	a1,24(sp)
    7d74:	c88ff06f          	j	71fc <__gdtoa+0x3a0>
    7d78:	1fd010ef          	jal	9774 <__multadd>
    7d7c:	00050993          	mv	s3,a0
    7d80:	940502e3          	beqz	a0,76c4 <__gdtoa+0x868>
    7d84:	00050a13          	mv	s4,a0
    7d88:	f0cff06f          	j	7494 <__gdtoa+0x638>
    7d8c:	e80ade63          	bgez	s5,7428 <__gdtoa+0x5cc>
    7d90:	02812783          	lw	a5,40(sp)
    7d94:	01812f03          	lw	t5,24(sp)
    7d98:	01c12d03          	lw	s10,28(sp)
    7d9c:	00070c93          	mv	s9,a4
    7da0:	3c079ee3          	bnez	a5,897c <__gdtoa+0x1b20>
    7da4:	0104a683          	lw	a3,16(s1)
    7da8:	00100793          	li	a5,1
    7dac:	01000c93          	li	s9,16
    7db0:	001c0913          	addi	s2,s8,1
    7db4:	36d7d0e3          	bge	a5,a3,8914 <__gdtoa+0x1ab8>
    7db8:	00098a93          	mv	s5,s3
    7dbc:	00090b13          	mv	s6,s2
    7dc0:	01bc0023          	sb	s11,0(s8)
    7dc4:	000a0993          	mv	s3,s4
    7dc8:	000b8593          	mv	a1,s7
    7dcc:	00040513          	mv	a0,s0
    7dd0:	01e12823          	sw	t5,16(sp)
    7dd4:	17d010ef          	jal	9750 <_Bfree>
    7dd8:	03c12783          	lw	a5,60(sp)
    7ddc:	01012f03          	lw	t5,16(sp)
    7de0:	00178b93          	addi	s7,a5,1
    7de4:	ec098ae3          	beqz	s3,7cb8 <__gdtoa+0xe5c>
    7de8:	000a8c63          	beqz	s5,7e00 <__gdtoa+0xfa4>
    7dec:	013a8a63          	beq	s5,s3,7e00 <__gdtoa+0xfa4>
    7df0:	000a8593          	mv	a1,s5
    7df4:	00040513          	mv	a0,s0
    7df8:	159010ef          	jal	9750 <_Bfree>
    7dfc:	01012f03          	lw	t5,16(sp)
    7e00:	00098593          	mv	a1,s3
    7e04:	00040513          	mv	a0,s0
    7e08:	01e12823          	sw	t5,16(sp)
    7e0c:	145010ef          	jal	9750 <_Bfree>
    7e10:	01012f03          	lw	t5,16(sp)
    7e14:	ea5ff06f          	j	7cb8 <__gdtoa+0xe5c>
    7e18:	00048593          	mv	a1,s1
    7e1c:	00040513          	mv	a0,s0
    7e20:	03e12223          	sw	t5,36(sp)
    7e24:	134020ef          	jal	9f58 <__lshift>
    7e28:	00050493          	mv	s1,a0
    7e2c:	88050ce3          	beqz	a0,76c4 <__gdtoa+0x868>
    7e30:	08c12783          	lw	a5,140(sp)
    7e34:	02412f03          	lw	t5,36(sp)
    7e38:	d64ff06f          	j	739c <__gdtoa+0x540>
    7e3c:	000b8593          	mv	a1,s7
    7e40:	00048513          	mv	a0,s1
    7e44:	03e12023          	sw	t5,32(sp)
    7e48:	298020ef          	jal	a0e0 <__mcmp>
    7e4c:	02012f03          	lw	t5,32(sp)
    7e50:	d6055063          	bgez	a0,73b0 <__gdtoa+0x554>
    7e54:	03c12783          	lw	a5,60(sp)
    7e58:	00048593          	mv	a1,s1
    7e5c:	00000693          	li	a3,0
    7e60:	fff78793          	addi	a5,a5,-1
    7e64:	00a00613          	li	a2,10
    7e68:	00040513          	mv	a0,s0
    7e6c:	02f12e23          	sw	a5,60(sp)
    7e70:	105010ef          	jal	9774 <__multadd>
    7e74:	00050493          	mv	s1,a0
    7e78:	840506e3          	beqz	a0,76c4 <__gdtoa+0x868>
    7e7c:	04012783          	lw	a5,64(sp)
    7e80:	02012f03          	lw	t5,32(sp)
    7e84:	120792e3          	bnez	a5,87a8 <__gdtoa+0x194c>
    7e88:	05412783          	lw	a5,84(sp)
    7e8c:	1ef05863          	blez	a5,807c <__gdtoa+0x1220>
    7e90:	02f12a23          	sw	a5,52(sp)
    7e94:	03412903          	lw	s2,52(sp)
    7e98:	000f0c13          	mv	s8,t5
    7e9c:	00100793          	li	a5,1
    7ea0:	000f0a13          	mv	s4,t5
    7ea4:	0180006f          	j	7ebc <__gdtoa+0x1060>
    7ea8:	0cd010ef          	jal	9774 <__multadd>
    7eac:	00050493          	mv	s1,a0
    7eb0:	80050ae3          	beqz	a0,76c4 <__gdtoa+0x868>
    7eb4:	08c12783          	lw	a5,140(sp)
    7eb8:	00178793          	addi	a5,a5,1
    7ebc:	000b8593          	mv	a1,s7
    7ec0:	00048513          	mv	a0,s1
    7ec4:	08f12623          	sw	a5,140(sp)
    7ec8:	4b9000ef          	jal	8b80 <__quorem_D2A>
    7ecc:	03050d93          	addi	s11,a0,48
    7ed0:	01bc0023          	sb	s11,0(s8)
    7ed4:	08c12783          	lw	a5,140(sp)
    7ed8:	00000693          	li	a3,0
    7edc:	00a00613          	li	a2,10
    7ee0:	00048593          	mv	a1,s1
    7ee4:	00040513          	mv	a0,s0
    7ee8:	001c0c13          	addi	s8,s8,1
    7eec:	fb27cee3          	blt	a5,s2,7ea8 <__gdtoa+0x104c>
    7ef0:	000a0f13          	mv	t5,s4
    7ef4:	00000a93          	li	s5,0
    7ef8:	02812703          	lw	a4,40(sp)
    7efc:	48070a63          	beqz	a4,8390 <__gdtoa+0x1534>
    7f00:	00200793          	li	a5,2
    7f04:	0104a683          	lw	a3,16(s1)
    7f08:	4cf70063          	beq	a4,a5,83c8 <__gdtoa+0x156c>
    7f0c:	00100793          	li	a5,1
    7f10:	2ad7c463          	blt	a5,a3,81b8 <__gdtoa+0x135c>
    7f14:	0144a783          	lw	a5,20(s1)
    7f18:	2a079063          	bnez	a5,81b8 <__gdtoa+0x135c>
    7f1c:	00f037b3          	snez	a5,a5
    7f20:	00479c93          	slli	s9,a5,0x4
    7f24:	03000693          	li	a3,48
    7f28:	fffc4783          	lbu	a5,-1(s8)
    7f2c:	000c0b13          	mv	s6,s8
    7f30:	fffc0c13          	addi	s8,s8,-1
    7f34:	fed78ae3          	beq	a5,a3,7f28 <__gdtoa+0x10cc>
    7f38:	e91ff06f          	j	7dc8 <__gdtoa+0xf6c>
    7f3c:	03412783          	lw	a5,52(sp)
    7f40:	03812703          	lw	a4,56(sp)
    7f44:	fff78693          	addi	a3,a5,-1
    7f48:	1ad74a63          	blt	a4,a3,80fc <__gdtoa+0x12a0>
    7f4c:	40d70b33          	sub	s6,a4,a3
    7f50:	7e07d263          	bgez	a5,8734 <__gdtoa+0x18d8>
    7f54:	03012783          	lw	a5,48(sp)
    7f58:	03412703          	lw	a4,52(sp)
    7f5c:	08012623          	sw	zero,140(sp)
    7f60:	40e78a33          	sub	s4,a5,a4
    7f64:	b58ff06f          	j	72bc <__gdtoa+0x460>
    7f68:	01012703          	lw	a4,16(sp)
    7f6c:	00200793          	li	a5,2
    7f70:	c4e7d463          	bge	a5,a4,73b8 <__gdtoa+0x55c>
    7f74:	000b8593          	mv	a1,s7
    7f78:	00000693          	li	a3,0
    7f7c:	00500613          	li	a2,5
    7f80:	00040513          	mv	a0,s0
    7f84:	01e12823          	sw	t5,16(sp)
    7f88:	7ec010ef          	jal	9774 <__multadd>
    7f8c:	00050593          	mv	a1,a0
    7f90:	f2050a63          	beqz	a0,76c4 <__gdtoa+0x868>
    7f94:	03412783          	lw	a5,52(sp)
    7f98:	01012f03          	lw	t5,16(sp)
    7f9c:	14079663          	bnez	a5,80e8 <__gdtoa+0x128c>
    7fa0:	00a12823          	sw	a0,16(sp)
    7fa4:	00048513          	mv	a0,s1
    7fa8:	01e12e23          	sw	t5,28(sp)
    7fac:	134020ef          	jal	a0e0 <__mcmp>
    7fb0:	01012583          	lw	a1,16(sp)
    7fb4:	01c12f03          	lw	t5,28(sp)
    7fb8:	12a05863          	blez	a0,80e8 <__gdtoa+0x128c>
    7fbc:	03c12783          	lw	a5,60(sp)
    7fc0:	00278b93          	addi	s7,a5,2
    7fc4:	03100793          	li	a5,49
    7fc8:	001f0b13          	addi	s6,t5,1
    7fcc:	00ff0023          	sb	a5,0(t5)
    7fd0:	02000c93          	li	s9,32
    7fd4:	00040513          	mv	a0,s0
    7fd8:	01e12823          	sw	t5,16(sp)
    7fdc:	774010ef          	jal	9750 <_Bfree>
    7fe0:	01012f03          	lw	t5,16(sp)
    7fe4:	cc098ae3          	beqz	s3,7cb8 <__gdtoa+0xe5c>
    7fe8:	e19ff06f          	j	7e00 <__gdtoa+0xfa4>
    7fec:	00100693          	li	a3,1
    7ff0:	00100593          	li	a1,1
    7ff4:	a08ff06f          	j	71fc <__gdtoa+0x3a0>
    7ff8:	00050593          	mv	a1,a0
    7ffc:	00078613          	mv	a2,a5
    8000:	00040513          	mv	a0,s0
    8004:	611010ef          	jal	9e14 <__pow5mult>
    8008:	00050b93          	mv	s7,a0
    800c:	ea050c63          	beqz	a0,76c4 <__gdtoa+0x868>
    8010:	01012783          	lw	a5,16(sp)
    8014:	00100693          	li	a3,1
    8018:	02412f03          	lw	t5,36(sp)
    801c:	20f6dc63          	bge	a3,a5,8234 <__gdtoa+0x13d8>
    8020:	010ba783          	lw	a5,16(s7)
    8024:	03e12223          	sw	t5,36(sp)
    8028:	00378793          	addi	a5,a5,3
    802c:	00279793          	slli	a5,a5,0x2
    8030:	00fb87b3          	add	a5,s7,a5
    8034:	0047a503          	lw	a0,4(a5)
    8038:	1b1010ef          	jal	99e8 <__hi0bits>
    803c:	02412f03          	lw	t5,36(sp)
    8040:	00050a93          	mv	s5,a0
    8044:	01912e23          	sw	s9,28(sp)
    8048:	b30ff06f          	j	7378 <__gdtoa+0x51c>
    804c:	01012783          	lw	a5,16(sp)
    8050:	00100693          	li	a3,1
    8054:	eef6c4e3          	blt	a3,a5,7f3c <__gdtoa+0x10e0>
    8058:	03012783          	lw	a5,48(sp)
    805c:	02012703          	lw	a4,32(sp)
    8060:	03812b03          	lw	s6,56(sp)
    8064:	00078a13          	mv	s4,a5
    8068:	00c70733          	add	a4,a4,a2
    806c:	00f607b3          	add	a5,a2,a5
    8070:	02e12023          	sw	a4,32(sp)
    8074:	02f12823          	sw	a5,48(sp)
    8078:	a44ff06f          	j	72bc <__gdtoa+0x460>
    807c:	01012703          	lw	a4,16(sp)
    8080:	00200793          	li	a5,2
    8084:	0ae7cce3          	blt	a5,a4,893c <__gdtoa+0x1ae0>
    8088:	05412783          	lw	a5,84(sp)
    808c:	02f12a23          	sw	a5,52(sp)
    8090:	e05ff06f          	j	7e94 <__gdtoa+0x1038>
    8094:	01c12c83          	lw	s9,28(sp)
    8098:	00098f13          	mv	t5,s3
    809c:	c1dff06f          	j	7cb8 <__gdtoa+0xe5c>
    80a0:	03412783          	lw	a5,52(sp)
    80a4:	aaf04ce3          	bgtz	a5,7b5c <__gdtoa+0xd00>
    80a8:	02079c63          	bnez	a5,80e0 <__gdtoa+0x1284>
    80ac:	000137b7          	lui	a5,0x13
    80b0:	4a07a603          	lw	a2,1184(a5) # 134a0 <__clz_tab+0x154>
    80b4:	4a47a683          	lw	a3,1188(a5)
    80b8:	000a0513          	mv	a0,s4
    80bc:	000a8593          	mv	a1,s5
    80c0:	01e12823          	sw	t5,16(sp)
    80c4:	789050ef          	jal	e04c <__muldf3>
    80c8:	04812883          	lw	a7,72(sp)
    80cc:	00098693          	mv	a3,s3
    80d0:	00088613          	mv	a2,a7
    80d4:	5c1050ef          	jal	de94 <__gedf2>
    80d8:	01012f03          	lw	t5,16(sp)
    80dc:	6a054c63          	bltz	a0,8794 <__gdtoa+0x1938>
    80e0:	00000593          	li	a1,0
    80e4:	00000993          	li	s3,0
    80e8:	01812783          	lw	a5,24(sp)
    80ec:	000f0b13          	mv	s6,t5
    80f0:	01000c93          	li	s9,16
    80f4:	40f00bb3          	neg	s7,a5
    80f8:	eddff06f          	j	7fd4 <__gdtoa+0x1178>
    80fc:	03812783          	lw	a5,56(sp)
    8100:	03012703          	lw	a4,48(sp)
    8104:	00000b13          	li	s6,0
    8108:	40f68633          	sub	a2,a3,a5
    810c:	01c12783          	lw	a5,28(sp)
    8110:	00070a13          	mv	s4,a4
    8114:	02d12c23          	sw	a3,56(sp)
    8118:	00c787b3          	add	a5,a5,a2
    811c:	00f12e23          	sw	a5,28(sp)
    8120:	02012603          	lw	a2,32(sp)
    8124:	03412783          	lw	a5,52(sp)
    8128:	00f60633          	add	a2,a2,a5
    812c:	08f12623          	sw	a5,140(sp)
    8130:	00f707b3          	add	a5,a4,a5
    8134:	02c12023          	sw	a2,32(sp)
    8138:	02f12823          	sw	a5,48(sp)
    813c:	980ff06f          	j	72bc <__gdtoa+0x460>
    8140:	00098593          	mv	a1,s3
    8144:	000b0613          	mv	a2,s6
    8148:	00040513          	mv	a0,s0
    814c:	03e12223          	sw	t5,36(sp)
    8150:	4c5010ef          	jal	9e14 <__pow5mult>
    8154:	00050993          	mv	s3,a0
    8158:	d6050663          	beqz	a0,76c4 <__gdtoa+0x868>
    815c:	00050593          	mv	a1,a0
    8160:	00048613          	mv	a2,s1
    8164:	00040513          	mv	a0,s0
    8168:	281010ef          	jal	9be8 <__multiply>
    816c:	00050b93          	mv	s7,a0
    8170:	d4050a63          	beqz	a0,76c4 <__gdtoa+0x868>
    8174:	00048593          	mv	a1,s1
    8178:	00040513          	mv	a0,s0
    817c:	5d4010ef          	jal	9750 <_Bfree>
    8180:	03812783          	lw	a5,56(sp)
    8184:	02412f03          	lw	t5,36(sp)
    8188:	000b8493          	mv	s1,s7
    818c:	416787b3          	sub	a5,a5,s6
    8190:	02f12c23          	sw	a5,56(sp)
    8194:	9a078863          	beqz	a5,7344 <__gdtoa+0x4e8>
    8198:	98cff06f          	j	7324 <__gdtoa+0x4c8>
    819c:	00098a93          	mv	s5,s3
    81a0:	000c0793          	mv	a5,s8
    81a4:	001c0913          	addi	s2,s8,1
    81a8:	000a0993          	mv	s3,s4
    81ac:	03900693          	li	a3,57
    81b0:	00090c13          	mv	s8,s2
    81b4:	00d78023          	sb	a3,0(a5)
    81b8:	03900693          	li	a3,57
    81bc:	0080006f          	j	81c4 <__gdtoa+0x1368>
    81c0:	238f0063          	beq	t5,s8,83e0 <__gdtoa+0x1584>
    81c4:	fffc4783          	lbu	a5,-1(s8)
    81c8:	000c0b13          	mv	s6,s8
    81cc:	fffc0c13          	addi	s8,s8,-1
    81d0:	fed788e3          	beq	a5,a3,81c0 <__gdtoa+0x1364>
    81d4:	00178793          	addi	a5,a5,1
    81d8:	00fc0023          	sb	a5,0(s8)
    81dc:	02000c93          	li	s9,32
    81e0:	be9ff06f          	j	7dc8 <__gdtoa+0xf6c>
    81e4:	00098593          	mv	a1,s3
    81e8:	00040513          	mv	a0,s0
    81ec:	01e12c23          	sw	t5,24(sp)
    81f0:	569010ef          	jal	9f58 <__lshift>
    81f4:	01812f03          	lw	t5,24(sp)
    81f8:	00050993          	mv	s3,a0
    81fc:	9c051663          	bnez	a0,73c8 <__gdtoa+0x56c>
    8200:	cc4ff06f          	j	76c4 <__gdtoa+0x868>
    8204:	00100793          	li	a5,1
    8208:	00000a13          	li	s4,0
    820c:	04f12023          	sw	a5,64(sp)
    8210:	fc9fe06f          	j	71d8 <__gdtoa+0x37c>
    8214:	00100793          	li	a5,1
    8218:	04f12023          	sw	a5,64(sp)
    821c:	fbdfe06f          	j	71d8 <__gdtoa+0x37c>
    8220:	00100793          	li	a5,1
    8224:	04f12023          	sw	a5,64(sp)
    8228:	b31ff06f          	j	7d58 <__gdtoa+0xefc>
    822c:	04012023          	sw	zero,64(sp)
    8230:	b29ff06f          	j	7d58 <__gdtoa+0xefc>
    8234:	dedc16e3          	bne	s8,a3,8020 <__gdtoa+0x11c4>
    8238:	004da783          	lw	a5,4(s11)
    823c:	00178793          	addi	a5,a5,1
    8240:	df57d0e3          	bge	a5,s5,8020 <__gdtoa+0x11c4>
    8244:	03012783          	lw	a5,48(sp)
    8248:	00100c93          	li	s9,1
    824c:	00178793          	addi	a5,a5,1
    8250:	02f12823          	sw	a5,48(sp)
    8254:	02012783          	lw	a5,32(sp)
    8258:	00178793          	addi	a5,a5,1
    825c:	02f12023          	sw	a5,32(sp)
    8260:	dc1ff06f          	j	8020 <__gdtoa+0x11c4>
    8264:	0049a583          	lw	a1,4(s3)
    8268:	00040513          	mv	a0,s0
    826c:	01e12c23          	sw	t5,24(sp)
    8270:	42c010ef          	jal	969c <_Balloc>
    8274:	00050a13          	mv	s4,a0
    8278:	c4050663          	beqz	a0,76c4 <__gdtoa+0x868>
    827c:	0109a603          	lw	a2,16(s3)
    8280:	00c98593          	addi	a1,s3,12
    8284:	00c50513          	addi	a0,a0,12
    8288:	00260613          	addi	a2,a2,2
    828c:	00261613          	slli	a2,a2,0x2
    8290:	824fe0ef          	jal	62b4 <memcpy>
    8294:	000a0593          	mv	a1,s4
    8298:	00100613          	li	a2,1
    829c:	00040513          	mv	a0,s0
    82a0:	4b9010ef          	jal	9f58 <__lshift>
    82a4:	01812f03          	lw	t5,24(sp)
    82a8:	00050a13          	mv	s4,a0
    82ac:	00050463          	beqz	a0,82b4 <__gdtoa+0x1458>
    82b0:	924ff06f          	j	73d4 <__gdtoa+0x578>
    82b4:	c10ff06f          	j	76c4 <__gdtoa+0x868>
    82b8:	000b0613          	mv	a2,s6
    82bc:	00098693          	mv	a3,s3
    82c0:	000b0513          	mv	a0,s6
    82c4:	00098593          	mv	a1,s3
    82c8:	03e12423          	sw	t5,40(sp)
    82cc:	4cd040ef          	jal	cf98 <__adddf3>
    82d0:	000136b7          	lui	a3,0x13
    82d4:	4986a603          	lw	a2,1176(a3) # 13498 <__clz_tab+0x14c>
    82d8:	49c6a683          	lw	a3,1180(a3)
    82dc:	4bd040ef          	jal	cf98 <__adddf3>
    82e0:	02812f03          	lw	t5,40(sp)
    82e4:	fcc007b7          	lui	a5,0xfcc00
    82e8:	00050713          	mv	a4,a0
    82ec:	00b78a33          	add	s4,a5,a1
    82f0:	000136b7          	lui	a3,0x13
    82f4:	4a06a603          	lw	a2,1184(a3) # 134a0 <__clz_tab+0x154>
    82f8:	04412503          	lw	a0,68(sp)
    82fc:	4a46a683          	lw	a3,1188(a3)
    8300:	05812583          	lw	a1,88(sp)
    8304:	03e12423          	sw	t5,40(sp)
    8308:	04e12423          	sw	a4,72(sp)
    830c:	330060ef          	jal	e63c <__subdf3>
    8310:	04812703          	lw	a4,72(sp)
    8314:	000a0693          	mv	a3,s4
    8318:	00050993          	mv	s3,a0
    831c:	00070613          	mv	a2,a4
    8320:	00058b13          	mv	s6,a1
    8324:	371050ef          	jal	de94 <__gedf2>
    8328:	02812f03          	lw	t5,40(sp)
    832c:	42a04663          	bgtz	a0,8758 <__gdtoa+0x18fc>
    8330:	04812703          	lw	a4,72(sp)
    8334:	800008b7          	lui	a7,0x80000
    8338:	0148c8b3          	xor	a7,a7,s4
    833c:	00070613          	mv	a2,a4
    8340:	00098513          	mv	a0,s3
    8344:	00088693          	mv	a3,a7
    8348:	000b0593          	mv	a1,s6
    834c:	425050ef          	jal	df70 <__ledf2>
    8350:	02812f03          	lw	t5,40(sp)
    8354:	d80546e3          	bltz	a0,80e0 <__gdtoa+0x1284>
    8358:	04412783          	lw	a5,68(sp)
    835c:	02412703          	lw	a4,36(sp)
    8360:	05812983          	lw	s3,88(sp)
    8364:	04f12423          	sw	a5,72(sp)
    8368:	000137b7          	lui	a5,0x13
    836c:	50074463          	bltz	a4,8874 <__gdtoa+0x1a18>
    8370:	fb87aa03          	lw	s4,-72(a5) # 12fb8 <__mprec_tens>
    8374:	fbc7aa83          	lw	s5,-68(a5)
    8378:	01812783          	lw	a5,24(sp)
    837c:	02012423          	sw	zero,40(sp)
    8380:	fc07de63          	bgez	a5,7b5c <__gdtoa+0xd00>
    8384:	03412783          	lw	a5,52(sp)
    8388:	fc079a63          	bnez	a5,7b5c <__gdtoa+0xd00>
    838c:	d21ff06f          	j	80ac <__gdtoa+0x1250>
    8390:	00048593          	mv	a1,s1
    8394:	00100613          	li	a2,1
    8398:	00040513          	mv	a0,s0
    839c:	01e12823          	sw	t5,16(sp)
    83a0:	3b9010ef          	jal	9f58 <__lshift>
    83a4:	00050493          	mv	s1,a0
    83a8:	b0050e63          	beqz	a0,76c4 <__gdtoa+0x868>
    83ac:	000b8593          	mv	a1,s7
    83b0:	531010ef          	jal	a0e0 <__mcmp>
    83b4:	01012f03          	lw	t5,16(sp)
    83b8:	e0a040e3          	bgtz	a0,81b8 <__gdtoa+0x135c>
    83bc:	00051663          	bnez	a0,83c8 <__gdtoa+0x156c>
    83c0:	001dfd93          	andi	s11,s11,1
    83c4:	de0d9ae3          	bnez	s11,81b8 <__gdtoa+0x135c>
    83c8:	0104a683          	lw	a3,16(s1)
    83cc:	00100793          	li	a5,1
    83d0:	01000c93          	li	s9,16
    83d4:	b4d7c8e3          	blt	a5,a3,7f24 <__gdtoa+0x10c8>
    83d8:	0144a783          	lw	a5,20(s1)
    83dc:	b41ff06f          	j	7f1c <__gdtoa+0x10c0>
    83e0:	03c12783          	lw	a5,60(sp)
    83e4:	02000c93          	li	s9,32
    83e8:	00178793          	addi	a5,a5,1
    83ec:	02f12e23          	sw	a5,60(sp)
    83f0:	03100793          	li	a5,49
    83f4:	00ff0023          	sb	a5,0(t5)
    83f8:	9d1ff06f          	j	7dc8 <__gdtoa+0xf6c>
    83fc:	02812783          	lw	a5,40(sp)
    8400:	01812f03          	lw	t5,24(sp)
    8404:	01c12d03          	lw	s10,28(sp)
    8408:	00078e63          	beqz	a5,8424 <__gdtoa+0x15c8>
    840c:	0104a683          	lw	a3,16(s1)
    8410:	00100793          	li	a5,1
    8414:	92d7cc63          	blt	a5,a3,754c <__gdtoa+0x6f0>
    8418:	0144a783          	lw	a5,20(s1)
    841c:	00078463          	beqz	a5,8424 <__gdtoa+0x15c8>
    8420:	92cff06f          	j	754c <__gdtoa+0x6f0>
    8424:	00048593          	mv	a1,s1
    8428:	00100613          	li	a2,1
    842c:	00040513          	mv	a0,s0
    8430:	01e12823          	sw	t5,16(sp)
    8434:	325010ef          	jal	9f58 <__lshift>
    8438:	00050493          	mv	s1,a0
    843c:	a8050463          	beqz	a0,76c4 <__gdtoa+0x868>
    8440:	000b8593          	mv	a1,s7
    8444:	49d010ef          	jal	a0e0 <__mcmp>
    8448:	01012f03          	lw	t5,16(sp)
    844c:	4ca05c63          	blez	a0,8924 <__gdtoa+0x1ac8>
    8450:	03900793          	li	a5,57
    8454:	d4fd84e3          	beq	s11,a5,819c <__gdtoa+0x1340>
    8458:	02000793          	li	a5,32
    845c:	031b0d93          	addi	s11,s6,49
    8460:	02f12423          	sw	a5,40(sp)
    8464:	941ff06f          	j	7da4 <__gdtoa+0xf48>
    8468:	00050613          	mv	a2,a0
    846c:	00058693          	mv	a3,a1
    8470:	01e12823          	sw	t5,16(sp)
    8474:	325040ef          	jal	cf98 <__adddf3>
    8478:	000a0613          	mv	a2,s4
    847c:	000a8693          	mv	a3,s5
    8480:	00050c13          	mv	s8,a0
    8484:	00058993          	mv	s3,a1
    8488:	20d050ef          	jal	de94 <__gedf2>
    848c:	fffb4b83          	lbu	s7,-1(s6)
    8490:	01012f03          	lw	t5,16(sp)
    8494:	dea04063          	bgtz	a0,7a74 <__gdtoa+0xc18>
    8498:	000c0513          	mv	a0,s8
    849c:	00098593          	mv	a1,s3
    84a0:	000a0613          	mv	a2,s4
    84a4:	000a8693          	mv	a3,s5
    84a8:	161050ef          	jal	de08 <__eqdf2>
    84ac:	01012f03          	lw	t5,16(sp)
    84b0:	00051663          	bnez	a0,84bc <__gdtoa+0x1660>
    84b4:	00197913          	andi	s2,s2,1
    84b8:	da091e63          	bnez	s2,7a74 <__gdtoa+0xc18>
    84bc:	000b0793          	mv	a5,s6
    84c0:	01000c93          	li	s9,16
    84c4:	03000613          	li	a2,48
    84c8:	fff7c703          	lbu	a4,-1(a5)
    84cc:	00078b13          	mv	s6,a5
    84d0:	fff78793          	addi	a5,a5,-1
    84d4:	fec70ae3          	beq	a4,a2,84c8 <__gdtoa+0x166c>
    84d8:	000d8b93          	mv	s7,s11
    84dc:	fdcff06f          	j	7cb8 <__gdtoa+0xe5c>
    84e0:	03100693          	li	a3,49
    84e4:	001d8d93          	addi	s11,s11,1
    84e8:	db0ff06f          	j	7a98 <__gdtoa+0xc3c>
    84ec:	00070513          	mv	a0,a4
    84f0:	000a0593          	mv	a1,s4
    84f4:	06f12e23          	sw	a5,124(sp)
    84f8:	07e12823          	sw	t5,112(sp)
    84fc:	351050ef          	jal	e04c <__muldf3>
    8500:	000136b7          	lui	a3,0x13
    8504:	4886a783          	lw	a5,1160(a3) # 13488 <__clz_tab+0x13c>
    8508:	07012f03          	lw	t5,112(sp)
    850c:	48c6a803          	lw	a6,1164(a3)
    8510:	04812603          	lw	a2,72(sp)
    8514:	02f12423          	sw	a5,40(sp)
    8518:	07c12783          	lw	a5,124(sp)
    851c:	06b12623          	sw	a1,108(sp)
    8520:	00000693          	li	a3,0
    8524:	00100593          	li	a1,1
    8528:	06912823          	sw	s1,112(sp)
    852c:	06812a23          	sw	s0,116(sp)
    8530:	05c12483          	lw	s1,92(sp)
    8534:	07212c23          	sw	s2,120(sp)
    8538:	03012623          	sw	a6,44(sp)
    853c:	06a12423          	sw	a0,104(sp)
    8540:	08b12623          	sw	a1,140(sp)
    8544:	07312223          	sw	s3,100(sp)
    8548:	000f0b13          	mv	s6,t5
    854c:	05e12e23          	sw	t5,92(sp)
    8550:	00068413          	mv	s0,a3
    8554:	00078b93          	mv	s7,a5
    8558:	00060913          	mv	s2,a2
    855c:	0180006f          	j	8574 <__gdtoa+0x1718>
    8560:	08612623          	sw	t1,140(sp)
    8564:	2e9050ef          	jal	e04c <__muldf3>
    8568:	00050913          	mv	s2,a0
    856c:	00058993          	mv	s3,a1
    8570:	00100413          	li	s0,1
    8574:	00090513          	mv	a0,s2
    8578:	00098593          	mv	a1,s3
    857c:	069060ef          	jal	ede4 <__fixdfsi>
    8580:	00050a13          	mv	s4,a0
    8584:	02050463          	beqz	a0,85ac <__gdtoa+0x1750>
    8588:	0dd060ef          	jal	ee64 <__floatsidf>
    858c:	00050613          	mv	a2,a0
    8590:	00058693          	mv	a3,a1
    8594:	00090513          	mv	a0,s2
    8598:	00098593          	mv	a1,s3
    859c:	0a0060ef          	jal	e63c <__subdf3>
    85a0:	00050913          	mv	s2,a0
    85a4:	00058993          	mv	s3,a1
    85a8:	00100413          	li	s0,1
    85ac:	030a0793          	addi	a5,s4,48
    85b0:	001b0b13          	addi	s6,s6,1
    85b4:	0ff7f793          	zext.b	a5,a5
    85b8:	fefb0fa3          	sb	a5,-1(s6)
    85bc:	08c12883          	lw	a7,140(sp)
    85c0:	02812603          	lw	a2,40(sp)
    85c4:	02c12683          	lw	a3,44(sp)
    85c8:	00090513          	mv	a0,s2
    85cc:	00098593          	mv	a1,s3
    85d0:	00188313          	addi	t1,a7,1 # 80000001 <_memory_end+0x7ffe0001>
    85d4:	f89896e3          	bne	a7,s1,8560 <__gdtoa+0x1704>
    85d8:	000b8713          	mv	a4,s7
    85dc:	00040693          	mv	a3,s0
    85e0:	00078b93          	mv	s7,a5
    85e4:	07012483          	lw	s1,112(sp)
    85e8:	05c12f03          	lw	t5,92(sp)
    85ec:	07412403          	lw	s0,116(sp)
    85f0:	07812903          	lw	s2,120(sp)
    85f4:	00070793          	mv	a5,a4
    85f8:	00068663          	beqz	a3,8604 <__gdtoa+0x17a8>
    85fc:	04a12423          	sw	a0,72(sp)
    8600:	07312223          	sw	s3,100(sp)
    8604:	000139b7          	lui	s3,0x13
    8608:	4a89a603          	lw	a2,1192(s3) # 134a8 <__clz_tab+0x15c>
    860c:	4ac9a683          	lw	a3,1196(s3)
    8610:	06812503          	lw	a0,104(sp)
    8614:	06c12583          	lw	a1,108(sp)
    8618:	03e12423          	sw	t5,40(sp)
    861c:	04f12e23          	sw	a5,92(sp)
    8620:	179040ef          	jal	cf98 <__adddf3>
    8624:	06412a03          	lw	s4,100(sp)
    8628:	04812603          	lw	a2,72(sp)
    862c:	000a0693          	mv	a3,s4
    8630:	141050ef          	jal	df70 <__ledf2>
    8634:	02812f03          	lw	t5,40(sp)
    8638:	1e054c63          	bltz	a0,8830 <__gdtoa+0x19d4>
    863c:	06812603          	lw	a2,104(sp)
    8640:	06c12683          	lw	a3,108(sp)
    8644:	4a89a503          	lw	a0,1192(s3)
    8648:	4ac9a583          	lw	a1,1196(s3)
    864c:	7f1050ef          	jal	e63c <__subdf3>
    8650:	04812603          	lw	a2,72(sp)
    8654:	000a0693          	mv	a3,s4
    8658:	03d050ef          	jal	de94 <__gedf2>
    865c:	02812f03          	lw	t5,40(sp)
    8660:	05c12783          	lw	a5,92(sp)
    8664:	26a04e63          	bgtz	a0,88e0 <__gdtoa+0x1a84>
    8668:	04412703          	lw	a4,68(sp)
    866c:	05812983          	lw	s3,88(sp)
    8670:	04e12423          	sw	a4,72(sp)
    8674:	02412703          	lw	a4,36(sp)
    8678:	ce075ce3          	bgez	a4,8370 <__gdtoa+0x1514>
    867c:	03812b03          	lw	s6,56(sp)
    8680:	03012a03          	lw	s4,48(sp)
    8684:	02012423          	sw	zero,40(sp)
    8688:	00000993          	li	s3,0
    868c:	c4dfe06f          	j	72d8 <__gdtoa+0x47c>
    8690:	00098a93          	mv	s5,s3
    8694:	01812f03          	lw	t5,24(sp)
    8698:	01c12d03          	lw	s10,28(sp)
    869c:	000a0993          	mv	s3,s4
    86a0:	859ff06f          	j	7ef8 <__gdtoa+0x109c>
    86a4:	fffb4b83          	lbu	s7,-1(s6)
    86a8:	bccff06f          	j	7a74 <__gdtoa+0xc18>
    86ac:	03412783          	lw	a5,52(sp)
    86b0:	c00784e3          	beqz	a5,82b8 <__gdtoa+0x145c>
    86b4:	05412783          	lw	a5,84(sp)
    86b8:	caf050e3          	blez	a5,8358 <__gdtoa+0x14fc>
    86bc:	000136b7          	lui	a3,0x13
    86c0:	4886a603          	lw	a2,1160(a3) # 13488 <__clz_tab+0x13c>
    86c4:	48c6a683          	lw	a3,1164(a3)
    86c8:	00098593          	mv	a1,s3
    86cc:	000b0513          	mv	a0,s6
    86d0:	07e12423          	sw	t5,104(sp)
    86d4:	179050ef          	jal	e04c <__muldf3>
    86d8:	000136b7          	lui	a3,0x13
    86dc:	4906a603          	lw	a2,1168(a3) # 13490 <__clz_tab+0x144>
    86e0:	4946a683          	lw	a3,1172(a3)
    86e4:	00058993          	mv	s3,a1
    86e8:	04a12423          	sw	a0,72(sp)
    86ec:	06a12223          	sw	a0,100(sp)
    86f0:	02b12423          	sw	a1,40(sp)
    86f4:	159050ef          	jal	e04c <__muldf3>
    86f8:	000136b7          	lui	a3,0x13
    86fc:	4986a603          	lw	a2,1176(a3) # 13498 <__clz_tab+0x14c>
    8700:	49c6a683          	lw	a3,1180(a3)
    8704:	095040ef          	jal	cf98 <__adddf3>
    8708:	fcc007b7          	lui	a5,0xfcc00
    870c:	00b78a33          	add	s4,a5,a1
    8710:	05412783          	lw	a5,84(sp)
    8714:	06412e83          	lw	t4,100(sp)
    8718:	06812f03          	lw	t5,104(sp)
    871c:	04f12e23          	sw	a5,92(sp)
    8720:	fff00793          	li	a5,-1
    8724:	00050713          	mv	a4,a0
    8728:	06f12023          	sw	a5,96(sp)
    872c:	00098813          	mv	a6,s3
    8730:	93cff06f          	j	786c <__gdtoa+0xa10>
    8734:	03012703          	lw	a4,48(sp)
    8738:	02012683          	lw	a3,32(sp)
    873c:	08f12623          	sw	a5,140(sp)
    8740:	00070a13          	mv	s4,a4
    8744:	00f686b3          	add	a3,a3,a5
    8748:	00f707b3          	add	a5,a4,a5
    874c:	02d12023          	sw	a3,32(sp)
    8750:	02f12823          	sw	a5,48(sp)
    8754:	b69fe06f          	j	72bc <__gdtoa+0x460>
    8758:	00200b93          	li	s7,2
    875c:	00000593          	li	a1,0
    8760:	00000993          	li	s3,0
    8764:	861ff06f          	j	7fc4 <__gdtoa+0x1168>
    8768:	03900793          	li	a5,57
    876c:	01812f03          	lw	t5,24(sp)
    8770:	01c12d03          	lw	s10,28(sp)
    8774:	a2fd84e3          	beq	s11,a5,819c <__gdtoa+0x1340>
    8778:	001d8d93          	addi	s11,s11,1
    877c:	00098a93          	mv	s5,s3
    8780:	001c0b13          	addi	s6,s8,1
    8784:	01bc0023          	sb	s11,0(s8)
    8788:	000a0993          	mv	s3,s4
    878c:	02000c93          	li	s9,32
    8790:	e38ff06f          	j	7dc8 <__gdtoa+0xf6c>
    8794:	03c12783          	lw	a5,60(sp)
    8798:	00000593          	li	a1,0
    879c:	00000993          	li	s3,0
    87a0:	00278b93          	addi	s7,a5,2 # fcc00002 <_memory_end+0xfcbe0002>
    87a4:	821ff06f          	j	7fc4 <__gdtoa+0x1168>
    87a8:	00098593          	mv	a1,s3
    87ac:	00000693          	li	a3,0
    87b0:	00a00613          	li	a2,10
    87b4:	00040513          	mv	a0,s0
    87b8:	7bd000ef          	jal	9774 <__multadd>
    87bc:	00050993          	mv	s3,a0
    87c0:	00051463          	bnez	a0,87c8 <__gdtoa+0x196c>
    87c4:	f01fe06f          	j	76c4 <__gdtoa+0x868>
    87c8:	05412783          	lw	a5,84(sp)
    87cc:	02012f03          	lw	t5,32(sp)
    87d0:	00f05663          	blez	a5,87dc <__gdtoa+0x1980>
    87d4:	02f12a23          	sw	a5,52(sp)
    87d8:	be9fe06f          	j	73c0 <__gdtoa+0x564>
    87dc:	01012703          	lw	a4,16(sp)
    87e0:	00200793          	li	a5,2
    87e4:	14e7cc63          	blt	a5,a4,893c <__gdtoa+0x1ae0>
    87e8:	05412783          	lw	a5,84(sp)
    87ec:	02f12a23          	sw	a5,52(sp)
    87f0:	bd1fe06f          	j	73c0 <__gdtoa+0x564>
    87f4:	06412483          	lw	s1,100(sp)
    87f8:	05c12f03          	lw	t5,92(sp)
    87fc:	06812403          	lw	s0,104(sp)
    8800:	000a0513          	mv	a0,s4
    8804:	00098593          	mv	a1,s3
    8808:	00000613          	li	a2,0
    880c:	00000693          	li	a3,0
    8810:	01e12823          	sw	t5,16(sp)
    8814:	5f4050ef          	jal	de08 <__eqdf2>
    8818:	00a037b3          	snez	a5,a0
    881c:	00479c93          	slli	s9,a5,0x4
    8820:	06012783          	lw	a5,96(sp)
    8824:	01012f03          	lw	t5,16(sp)
    8828:	00178b93          	addi	s7,a5,1
    882c:	c8cff06f          	j	7cb8 <__gdtoa+0xe5c>
    8830:	06012783          	lw	a5,96(sp)
    8834:	00178d93          	addi	s11,a5,1
    8838:	a3cff06f          	j	7a74 <__gdtoa+0xc18>
    883c:	03412783          	lw	a5,52(sp)
    8840:	03812703          	lw	a4,56(sp)
    8844:	fff78693          	addi	a3,a5,-1
    8848:	8ad74ae3          	blt	a4,a3,80fc <__gdtoa+0x12a0>
    884c:	03012583          	lw	a1,48(sp)
    8850:	02012603          	lw	a2,32(sp)
    8854:	08f12623          	sw	a5,140(sp)
    8858:	00058a13          	mv	s4,a1
    885c:	00f60633          	add	a2,a2,a5
    8860:	00f587b3          	add	a5,a1,a5
    8864:	02c12023          	sw	a2,32(sp)
    8868:	40d70b33          	sub	s6,a4,a3
    886c:	02f12823          	sw	a5,48(sp)
    8870:	a4dfe06f          	j	72bc <__gdtoa+0x460>
    8874:	02012423          	sw	zero,40(sp)
    8878:	9c9fe06f          	j	7240 <__gdtoa+0x3e4>
    887c:	04412703          	lw	a4,68(sp)
    8880:	06412483          	lw	s1,100(sp)
    8884:	07412b83          	lw	s7,116(sp)
    8888:	04e12423          	sw	a4,72(sp)
    888c:	02412703          	lw	a4,36(sp)
    8890:	07812c03          	lw	s8,120(sp)
    8894:	05c12f03          	lw	t5,92(sp)
    8898:	06812403          	lw	s0,104(sp)
    889c:	07c12783          	lw	a5,124(sp)
    88a0:	05812983          	lw	s3,88(sp)
    88a4:	ac0756e3          	bgez	a4,8370 <__gdtoa+0x1514>
    88a8:	02012423          	sw	zero,40(sp)
    88ac:	99dfe06f          	j	7248 <__gdtoa+0x3ec>
    88b0:	03900793          	li	a5,57
    88b4:	01812f03          	lw	t5,24(sp)
    88b8:	01c12d03          	lw	s10,28(sp)
    88bc:	8efd80e3          	beq	s11,a5,819c <__gdtoa+0x1340>
    88c0:	0f505063          	blez	s5,89a0 <__gdtoa+0x1b44>
    88c4:	031b0d93          	addi	s11,s6,49
    88c8:	02000c93          	li	s9,32
    88cc:	00098a93          	mv	s5,s3
    88d0:	001c0b13          	addi	s6,s8,1
    88d4:	01bc0023          	sb	s11,0(s8)
    88d8:	000a0993          	mv	s3,s4
    88dc:	cecff06f          	j	7dc8 <__gdtoa+0xf6c>
    88e0:	04812503          	lw	a0,72(sp)
    88e4:	000a0593          	mv	a1,s4
    88e8:	00000613          	li	a2,0
    88ec:	00000693          	li	a3,0
    88f0:	01e12823          	sw	t5,16(sp)
    88f4:	514050ef          	jal	de08 <__eqdf2>
    88f8:	06012703          	lw	a4,96(sp)
    88fc:	00a037b3          	snez	a5,a0
    8900:	00479c93          	slli	s9,a5,0x4
    8904:	01012f03          	lw	t5,16(sp)
    8908:	000b0793          	mv	a5,s6
    890c:	00170d93          	addi	s11,a4,1
    8910:	bb5ff06f          	j	84c4 <__gdtoa+0x1668>
    8914:	0144a783          	lw	a5,20(s1)
    8918:	ca079063          	bnez	a5,7db8 <__gdtoa+0xf5c>
    891c:	02812c83          	lw	s9,40(sp)
    8920:	c98ff06f          	j	7db8 <__gdtoa+0xf5c>
    8924:	00051663          	bnez	a0,8930 <__gdtoa+0x1ad4>
    8928:	001df793          	andi	a5,s11,1
    892c:	b20792e3          	bnez	a5,8450 <__gdtoa+0x15f4>
    8930:	02000793          	li	a5,32
    8934:	02f12423          	sw	a5,40(sp)
    8938:	c6cff06f          	j	7da4 <__gdtoa+0xf48>
    893c:	05412783          	lw	a5,84(sp)
    8940:	02f12a23          	sw	a5,52(sp)
    8944:	e30ff06f          	j	7f74 <__gdtoa+0x1118>
    8948:	03900793          	li	a5,57
    894c:	000b0f13          	mv	t5,s6
    8950:	00fd8e63          	beq	s11,a5,896c <__gdtoa+0x1b10>
    8954:	001d8d93          	addi	s11,s11,1
    8958:	02000c93          	li	s9,32
    895c:	c5cff06f          	j	7db8 <__gdtoa+0xf5c>
    8960:	01000c93          	li	s9,16
    8964:	001c0913          	addi	s2,s8,1
    8968:	c50ff06f          	j	7db8 <__gdtoa+0xf5c>
    896c:	00098a93          	mv	s5,s3
    8970:	000c0793          	mv	a5,s8
    8974:	000a0993          	mv	s3,s4
    8978:	835ff06f          	j	81ac <__gdtoa+0x1350>
    897c:	0104a683          	lw	a3,16(s1)
    8980:	00100793          	li	a5,1
    8984:	00d7d463          	bge	a5,a3,898c <__gdtoa+0x1b30>
    8988:	bc5fe06f          	j	754c <__gdtoa+0x6f0>
    898c:	0144a783          	lw	a5,20(s1)
    8990:	00078463          	beqz	a5,8998 <__gdtoa+0x1b3c>
    8994:	bb9fe06f          	j	754c <__gdtoa+0x6f0>
    8998:	001c0913          	addi	s2,s8,1
    899c:	c1cff06f          	j	7db8 <__gdtoa+0xf5c>
    89a0:	0104a683          	lw	a3,16(s1)
    89a4:	00100793          	li	a5,1
    89a8:	01000c93          	li	s9,16
    89ac:	f2d7c0e3          	blt	a5,a3,88cc <__gdtoa+0x1a70>
    89b0:	0144a783          	lw	a5,20(s1)
    89b4:	00f037b3          	snez	a5,a5
    89b8:	00479c93          	slli	s9,a5,0x4
    89bc:	f11ff06f          	j	88cc <__gdtoa+0x1a70>
    89c0:	020ac263          	bltz	s5,89e4 <__gdtoa+0x1b88>
    89c4:	015ceab3          	or	s5,s9,s5
    89c8:	000a9863          	bnez	s5,89d8 <__gdtoa+0x1b7c>
    89cc:	00092703          	lw	a4,0(s2)
    89d0:	00177713          	andi	a4,a4,1
    89d4:	00070863          	beqz	a4,89e4 <__gdtoa+0x1b88>
    89d8:	00f04463          	bgtz	a5,89e0 <__gdtoa+0x1b84>
    89dc:	a4dfe06f          	j	7428 <__gdtoa+0x5cc>
    89e0:	a39fe06f          	j	7418 <__gdtoa+0x5bc>
    89e4:	02812703          	lw	a4,40(sp)
    89e8:	01812f03          	lw	t5,24(sp)
    89ec:	01c12d03          	lw	s10,28(sp)
    89f0:	02070863          	beqz	a4,8a20 <__gdtoa+0x1bc4>
    89f4:	0104a603          	lw	a2,16(s1)
    89f8:	00100693          	li	a3,1
    89fc:	00c6d463          	bge	a3,a2,8a04 <__gdtoa+0x1ba8>
    8a00:	b4dfe06f          	j	754c <__gdtoa+0x6f0>
    8a04:	0144a683          	lw	a3,20(s1)
    8a08:	00068463          	beqz	a3,8a10 <__gdtoa+0x1bb4>
    8a0c:	b41fe06f          	j	754c <__gdtoa+0x6f0>
    8a10:	a0f04ae3          	bgtz	a5,8424 <__gdtoa+0x15c8>
    8a14:	00000c93          	li	s9,0
    8a18:	001c0913          	addi	s2,s8,1
    8a1c:	b9cff06f          	j	7db8 <__gdtoa+0xf5c>
    8a20:	b8f05263          	blez	a5,7da4 <__gdtoa+0xf48>
    8a24:	a01ff06f          	j	8424 <__gdtoa+0x15c8>

00008a28 <__rv_alloc_D2A.part.0>:
    8a28:	ff010113          	addi	sp,sp,-16
    8a2c:	3f418693          	addi	a3,gp,1012 # 12bc4 <keypad_map+0x64>
    8a30:	00000613          	li	a2,0
    8a34:	03900593          	li	a1,57
    8a38:	40818513          	addi	a0,gp,1032 # 12bd8 <keypad_map+0x78>
    8a3c:	00112623          	sw	ra,12(sp)
    8a40:	2b5020ef          	jal	b4f4 <__assert_func>

00008a44 <__rv_alloc_D2A>:
    8a44:	ff010113          	addi	sp,sp,-16
    8a48:	00812423          	sw	s0,8(sp)
    8a4c:	00112623          	sw	ra,12(sp)
    8a50:	01700693          	li	a3,23
    8a54:	00050413          	mv	s0,a0
    8a58:	00100713          	li	a4,1
    8a5c:	00400793          	li	a5,4
    8a60:	04b6f063          	bgeu	a3,a1,8aa0 <__rv_alloc_D2A+0x5c>
    8a64:	00179793          	slli	a5,a5,0x1
    8a68:	01478693          	addi	a3,a5,20
    8a6c:	00070613          	mv	a2,a4
    8a70:	00170713          	addi	a4,a4,1
    8a74:	fed5f8e3          	bgeu	a1,a3,8a64 <__rv_alloc_D2A+0x20>
    8a78:	00060593          	mv	a1,a2
    8a7c:	02c42e23          	sw	a2,60(s0)
    8a80:	00040513          	mv	a0,s0
    8a84:	419000ef          	jal	969c <_Balloc>
    8a88:	02050263          	beqz	a0,8aac <__rv_alloc_D2A+0x68>
    8a8c:	00c12083          	lw	ra,12(sp)
    8a90:	02a42c23          	sw	a0,56(s0)
    8a94:	00812403          	lw	s0,8(sp)
    8a98:	01010113          	addi	sp,sp,16
    8a9c:	00008067          	ret
    8aa0:	02052e23          	sw	zero,60(a0)
    8aa4:	00000593          	li	a1,0
    8aa8:	fd9ff06f          	j	8a80 <__rv_alloc_D2A+0x3c>
    8aac:	f7dff0ef          	jal	8a28 <__rv_alloc_D2A.part.0>

00008ab0 <__nrv_alloc_D2A>:
    8ab0:	ff010113          	addi	sp,sp,-16
    8ab4:	00812423          	sw	s0,8(sp)
    8ab8:	00912223          	sw	s1,4(sp)
    8abc:	01212023          	sw	s2,0(sp)
    8ac0:	00112623          	sw	ra,12(sp)
    8ac4:	01700813          	li	a6,23
    8ac8:	00050493          	mv	s1,a0
    8acc:	00058413          	mv	s0,a1
    8ad0:	00060913          	mv	s2,a2
    8ad4:	00100713          	li	a4,1
    8ad8:	00400793          	li	a5,4
    8adc:	06d87a63          	bgeu	a6,a3,8b50 <__nrv_alloc_D2A+0xa0>
    8ae0:	00179793          	slli	a5,a5,0x1
    8ae4:	01478813          	addi	a6,a5,20
    8ae8:	00070593          	mv	a1,a4
    8aec:	00170713          	addi	a4,a4,1
    8af0:	ff06f8e3          	bgeu	a3,a6,8ae0 <__nrv_alloc_D2A+0x30>
    8af4:	02b4ae23          	sw	a1,60(s1)
    8af8:	00048513          	mv	a0,s1
    8afc:	3a1000ef          	jal	969c <_Balloc>
    8b00:	06050263          	beqz	a0,8b64 <__nrv_alloc_D2A+0xb4>
    8b04:	02a4ac23          	sw	a0,56(s1)
    8b08:	00044783          	lbu	a5,0(s0)
    8b0c:	00140593          	addi	a1,s0,1
    8b10:	00f50023          	sb	a5,0(a0)
    8b14:	04078463          	beqz	a5,8b5c <__nrv_alloc_D2A+0xac>
    8b18:	00050793          	mv	a5,a0
    8b1c:	0005c703          	lbu	a4,0(a1)
    8b20:	00178793          	addi	a5,a5,1
    8b24:	00158593          	addi	a1,a1,1
    8b28:	00e78023          	sb	a4,0(a5)
    8b2c:	fe0718e3          	bnez	a4,8b1c <__nrv_alloc_D2A+0x6c>
    8b30:	00090463          	beqz	s2,8b38 <__nrv_alloc_D2A+0x88>
    8b34:	00f92023          	sw	a5,0(s2)
    8b38:	00c12083          	lw	ra,12(sp)
    8b3c:	00812403          	lw	s0,8(sp)
    8b40:	00412483          	lw	s1,4(sp)
    8b44:	00012903          	lw	s2,0(sp)
    8b48:	01010113          	addi	sp,sp,16
    8b4c:	00008067          	ret
    8b50:	02052e23          	sw	zero,60(a0)
    8b54:	00000593          	li	a1,0
    8b58:	fa1ff06f          	j	8af8 <__nrv_alloc_D2A+0x48>
    8b5c:	00050793          	mv	a5,a0
    8b60:	fd1ff06f          	j	8b30 <__nrv_alloc_D2A+0x80>
    8b64:	ec5ff0ef          	jal	8a28 <__rv_alloc_D2A.part.0>

00008b68 <__freedtoa>:
    8b68:	03c52683          	lw	a3,60(a0)
    8b6c:	00100713          	li	a4,1
    8b70:	00d71733          	sll	a4,a4,a3
    8b74:	00d5a223          	sw	a3,4(a1)
    8b78:	00e5a423          	sw	a4,8(a1)
    8b7c:	3d50006f          	j	9750 <_Bfree>

00008b80 <__quorem_D2A>:
    8b80:	fe010113          	addi	sp,sp,-32
    8b84:	00912a23          	sw	s1,20(sp)
    8b88:	01052783          	lw	a5,16(a0)
    8b8c:	0105a483          	lw	s1,16(a1)
    8b90:	00112e23          	sw	ra,28(sp)
    8b94:	1c97c863          	blt	a5,s1,8d64 <__quorem_D2A+0x1e4>
    8b98:	fff48493          	addi	s1,s1,-1
    8b9c:	00249313          	slli	t1,s1,0x2
    8ba0:	00812c23          	sw	s0,24(sp)
    8ba4:	01458413          	addi	s0,a1,20
    8ba8:	01312623          	sw	s3,12(sp)
    8bac:	01412423          	sw	s4,8(sp)
    8bb0:	006409b3          	add	s3,s0,t1
    8bb4:	01450a13          	addi	s4,a0,20
    8bb8:	0009a783          	lw	a5,0(s3)
    8bbc:	006a0333          	add	t1,s4,t1
    8bc0:	00032703          	lw	a4,0(t1)
    8bc4:	01212823          	sw	s2,16(sp)
    8bc8:	01512223          	sw	s5,4(sp)
    8bcc:	00178793          	addi	a5,a5,1
    8bd0:	02f75933          	divu	s2,a4,a5
    8bd4:	00050a93          	mv	s5,a0
    8bd8:	0af76e63          	bltu	a4,a5,8c94 <__quorem_D2A+0x114>
    8bdc:	00010537          	lui	a0,0x10
    8be0:	00040893          	mv	a7,s0
    8be4:	000a0813          	mv	a6,s4
    8be8:	00000f13          	li	t5,0
    8bec:	00000e93          	li	t4,0
    8bf0:	fff50513          	addi	a0,a0,-1 # ffff <__multf3+0xd47>
    8bf4:	0008a783          	lw	a5,0(a7)
    8bf8:	00082603          	lw	a2,0(a6)
    8bfc:	00480813          	addi	a6,a6,4
    8c00:	00a7f6b3          	and	a3,a5,a0
    8c04:	0107d793          	srli	a5,a5,0x10
    8c08:	00a67733          	and	a4,a2,a0
    8c0c:	01065e13          	srli	t3,a2,0x10
    8c10:	00488893          	addi	a7,a7,4
    8c14:	032686b3          	mul	a3,a3,s2
    8c18:	032787b3          	mul	a5,a5,s2
    8c1c:	01e686b3          	add	a3,a3,t5
    8c20:	00a6f633          	and	a2,a3,a0
    8c24:	40c70733          	sub	a4,a4,a2
    8c28:	41d70733          	sub	a4,a4,t4
    8c2c:	0106d693          	srli	a3,a3,0x10
    8c30:	01075613          	srli	a2,a4,0x10
    8c34:	00167613          	andi	a2,a2,1
    8c38:	00a77733          	and	a4,a4,a0
    8c3c:	00d787b3          	add	a5,a5,a3
    8c40:	00a7f6b3          	and	a3,a5,a0
    8c44:	00d60633          	add	a2,a2,a3
    8c48:	40ce06b3          	sub	a3,t3,a2
    8c4c:	01069613          	slli	a2,a3,0x10
    8c50:	00e66733          	or	a4,a2,a4
    8c54:	0106d693          	srli	a3,a3,0x10
    8c58:	fee82e23          	sw	a4,-4(a6)
    8c5c:	0107df13          	srli	t5,a5,0x10
    8c60:	0016fe93          	andi	t4,a3,1
    8c64:	f919f8e3          	bgeu	s3,a7,8bf4 <__quorem_D2A+0x74>
    8c68:	00032783          	lw	a5,0(t1)
    8c6c:	02079463          	bnez	a5,8c94 <__quorem_D2A+0x114>
    8c70:	ffc30313          	addi	t1,t1,-4
    8c74:	006a6863          	bltu	s4,t1,8c84 <__quorem_D2A+0x104>
    8c78:	0180006f          	j	8c90 <__quorem_D2A+0x110>
    8c7c:	fff48493          	addi	s1,s1,-1
    8c80:	006a7863          	bgeu	s4,t1,8c90 <__quorem_D2A+0x110>
    8c84:	00032783          	lw	a5,0(t1)
    8c88:	ffc30313          	addi	t1,t1,-4
    8c8c:	fe0788e3          	beqz	a5,8c7c <__quorem_D2A+0xfc>
    8c90:	009aa823          	sw	s1,16(s5)
    8c94:	000a8513          	mv	a0,s5
    8c98:	448010ef          	jal	a0e0 <__mcmp>
    8c9c:	0a054063          	bltz	a0,8d3c <__quorem_D2A+0x1bc>
    8ca0:	00010537          	lui	a0,0x10
    8ca4:	000a0593          	mv	a1,s4
    8ca8:	00000693          	li	a3,0
    8cac:	fff50513          	addi	a0,a0,-1 # ffff <__multf3+0xd47>
    8cb0:	0005a783          	lw	a5,0(a1)
    8cb4:	00042603          	lw	a2,0(s0)
    8cb8:	00458593          	addi	a1,a1,4
    8cbc:	00a7f733          	and	a4,a5,a0
    8cc0:	00a67833          	and	a6,a2,a0
    8cc4:	41070733          	sub	a4,a4,a6
    8cc8:	40d70733          	sub	a4,a4,a3
    8ccc:	01075693          	srli	a3,a4,0x10
    8cd0:	0016f693          	andi	a3,a3,1
    8cd4:	01065613          	srli	a2,a2,0x10
    8cd8:	00c686b3          	add	a3,a3,a2
    8cdc:	0107d793          	srli	a5,a5,0x10
    8ce0:	40d787b3          	sub	a5,a5,a3
    8ce4:	01079693          	slli	a3,a5,0x10
    8ce8:	00a77733          	and	a4,a4,a0
    8cec:	00e6e733          	or	a4,a3,a4
    8cf0:	0107d793          	srli	a5,a5,0x10
    8cf4:	00440413          	addi	s0,s0,4
    8cf8:	fee5ae23          	sw	a4,-4(a1)
    8cfc:	0017f693          	andi	a3,a5,1
    8d00:	fa89f8e3          	bgeu	s3,s0,8cb0 <__quorem_D2A+0x130>
    8d04:	00249793          	slli	a5,s1,0x2
    8d08:	00fa07b3          	add	a5,s4,a5
    8d0c:	0007a703          	lw	a4,0(a5)
    8d10:	02071463          	bnez	a4,8d38 <__quorem_D2A+0x1b8>
    8d14:	ffc78793          	addi	a5,a5,-4
    8d18:	00fa6863          	bltu	s4,a5,8d28 <__quorem_D2A+0x1a8>
    8d1c:	0180006f          	j	8d34 <__quorem_D2A+0x1b4>
    8d20:	fff48493          	addi	s1,s1,-1
    8d24:	00fa7863          	bgeu	s4,a5,8d34 <__quorem_D2A+0x1b4>
    8d28:	0007a703          	lw	a4,0(a5)
    8d2c:	ffc78793          	addi	a5,a5,-4
    8d30:	fe0708e3          	beqz	a4,8d20 <__quorem_D2A+0x1a0>
    8d34:	009aa823          	sw	s1,16(s5)
    8d38:	00190913          	addi	s2,s2,1
    8d3c:	01812403          	lw	s0,24(sp)
    8d40:	01c12083          	lw	ra,28(sp)
    8d44:	00c12983          	lw	s3,12(sp)
    8d48:	00812a03          	lw	s4,8(sp)
    8d4c:	00412a83          	lw	s5,4(sp)
    8d50:	01412483          	lw	s1,20(sp)
    8d54:	00090513          	mv	a0,s2
    8d58:	01012903          	lw	s2,16(sp)
    8d5c:	02010113          	addi	sp,sp,32
    8d60:	00008067          	ret
    8d64:	01c12083          	lw	ra,28(sp)
    8d68:	01412483          	lw	s1,20(sp)
    8d6c:	00000513          	li	a0,0
    8d70:	02010113          	addi	sp,sp,32
    8d74:	00008067          	ret

00008d78 <__rshift_D2A>:
    8d78:	01052803          	lw	a6,16(a0)
    8d7c:	4055de13          	srai	t3,a1,0x5
    8d80:	010e4863          	blt	t3,a6,8d90 <__rshift_D2A+0x18>
    8d84:	00052823          	sw	zero,16(a0)
    8d88:	00052a23          	sw	zero,20(a0)
    8d8c:	00008067          	ret
    8d90:	01450313          	addi	t1,a0,20
    8d94:	00281613          	slli	a2,a6,0x2
    8d98:	002e1793          	slli	a5,t3,0x2
    8d9c:	01f5f593          	andi	a1,a1,31
    8da0:	00c30633          	add	a2,t1,a2
    8da4:	00f307b3          	add	a5,t1,a5
    8da8:	06058263          	beqz	a1,8e0c <__rshift_D2A+0x94>
    8dac:	0007a683          	lw	a3,0(a5)
    8db0:	02000e93          	li	t4,32
    8db4:	00478793          	addi	a5,a5,4
    8db8:	40be8eb3          	sub	t4,t4,a1
    8dbc:	00b6d6b3          	srl	a3,a3,a1
    8dc0:	08c7f463          	bgeu	a5,a2,8e48 <__rshift_D2A+0xd0>
    8dc4:	00030893          	mv	a7,t1
    8dc8:	0007a703          	lw	a4,0(a5)
    8dcc:	00488893          	addi	a7,a7,4
    8dd0:	00478793          	addi	a5,a5,4
    8dd4:	01d71733          	sll	a4,a4,t4
    8dd8:	00d76733          	or	a4,a4,a3
    8ddc:	fee8ae23          	sw	a4,-4(a7)
    8de0:	ffc7a683          	lw	a3,-4(a5)
    8de4:	00b6d6b3          	srl	a3,a3,a1
    8de8:	fec7e0e3          	bltu	a5,a2,8dc8 <__rshift_D2A+0x50>
    8dec:	41c80833          	sub	a6,a6,t3
    8df0:	00281813          	slli	a6,a6,0x2
    8df4:	ffc80813          	addi	a6,a6,-4
    8df8:	01030833          	add	a6,t1,a6
    8dfc:	00d82023          	sw	a3,0(a6)
    8e00:	02068a63          	beqz	a3,8e34 <__rshift_D2A+0xbc>
    8e04:	00480813          	addi	a6,a6,4
    8e08:	02c0006f          	j	8e34 <__rshift_D2A+0xbc>
    8e0c:	00030713          	mv	a4,t1
    8e10:	f6c7fae3          	bgeu	a5,a2,8d84 <__rshift_D2A+0xc>
    8e14:	0007a683          	lw	a3,0(a5)
    8e18:	00478793          	addi	a5,a5,4
    8e1c:	00470713          	addi	a4,a4,4
    8e20:	fed72e23          	sw	a3,-4(a4)
    8e24:	fec7e8e3          	bltu	a5,a2,8e14 <__rshift_D2A+0x9c>
    8e28:	41c80833          	sub	a6,a6,t3
    8e2c:	00281813          	slli	a6,a6,0x2
    8e30:	01030833          	add	a6,t1,a6
    8e34:	406807b3          	sub	a5,a6,t1
    8e38:	4027d793          	srai	a5,a5,0x2
    8e3c:	00f52823          	sw	a5,16(a0)
    8e40:	f46804e3          	beq	a6,t1,8d88 <__rshift_D2A+0x10>
    8e44:	00008067          	ret
    8e48:	00d52a23          	sw	a3,20(a0)
    8e4c:	f2068ce3          	beqz	a3,8d84 <__rshift_D2A+0xc>
    8e50:	00030813          	mv	a6,t1
    8e54:	00480813          	addi	a6,a6,4
    8e58:	fddff06f          	j	8e34 <__rshift_D2A+0xbc>

00008e5c <__trailz_D2A>:
    8e5c:	01052703          	lw	a4,16(a0)
    8e60:	fe010113          	addi	sp,sp,-32
    8e64:	01450513          	addi	a0,a0,20
    8e68:	00271713          	slli	a4,a4,0x2
    8e6c:	00812c23          	sw	s0,24(sp)
    8e70:	00112e23          	sw	ra,28(sp)
    8e74:	00e50733          	add	a4,a0,a4
    8e78:	00000413          	li	s0,0
    8e7c:	00e56a63          	bltu	a0,a4,8e90 <__trailz_D2A+0x34>
    8e80:	02c0006f          	j	8eac <__trailz_D2A+0x50>
    8e84:	00450513          	addi	a0,a0,4
    8e88:	02040413          	addi	s0,s0,32
    8e8c:	02e57063          	bgeu	a0,a4,8eac <__trailz_D2A+0x50>
    8e90:	00052783          	lw	a5,0(a0)
    8e94:	fe0788e3          	beqz	a5,8e84 <__trailz_D2A+0x28>
    8e98:	00e57a63          	bgeu	a0,a4,8eac <__trailz_D2A+0x50>
    8e9c:	00c10513          	addi	a0,sp,12
    8ea0:	00f12623          	sw	a5,12(sp)
    8ea4:	3bd000ef          	jal	9a60 <__lo0bits>
    8ea8:	00a40433          	add	s0,s0,a0
    8eac:	01c12083          	lw	ra,28(sp)
    8eb0:	00040513          	mv	a0,s0
    8eb4:	01812403          	lw	s0,24(sp)
    8eb8:	02010113          	addi	sp,sp,32
    8ebc:	00008067          	ret

00008ec0 <_malloc_r>:
    8ec0:	fd010113          	addi	sp,sp,-48
    8ec4:	01312e23          	sw	s3,28(sp)
    8ec8:	02112623          	sw	ra,44(sp)
    8ecc:	02812423          	sw	s0,40(sp)
    8ed0:	02912223          	sw	s1,36(sp)
    8ed4:	03212023          	sw	s2,32(sp)
    8ed8:	00b58793          	addi	a5,a1,11
    8edc:	01600713          	li	a4,22
    8ee0:	00050993          	mv	s3,a0
    8ee4:	08f76263          	bltu	a4,a5,8f68 <_malloc_r+0xa8>
    8ee8:	01000793          	li	a5,16
    8eec:	20b7e663          	bltu	a5,a1,90f8 <_malloc_r+0x238>
    8ef0:	7a4000ef          	jal	9694 <__malloc_lock>
    8ef4:	01800793          	li	a5,24
    8ef8:	00200593          	li	a1,2
    8efc:	01000493          	li	s1,16
    8f00:	00013937          	lui	s2,0x13
    8f04:	5ec90913          	addi	s2,s2,1516 # 135ec <__malloc_av_>
    8f08:	00f907b3          	add	a5,s2,a5
    8f0c:	0047a403          	lw	s0,4(a5)
    8f10:	ff878713          	addi	a4,a5,-8
    8f14:	34e40e63          	beq	s0,a4,9270 <_malloc_r+0x3b0>
    8f18:	00442783          	lw	a5,4(s0)
    8f1c:	00c42683          	lw	a3,12(s0)
    8f20:	00842603          	lw	a2,8(s0)
    8f24:	ffc7f793          	andi	a5,a5,-4
    8f28:	00f407b3          	add	a5,s0,a5
    8f2c:	0047a703          	lw	a4,4(a5)
    8f30:	00d62623          	sw	a3,12(a2)
    8f34:	00c6a423          	sw	a2,8(a3)
    8f38:	00176713          	ori	a4,a4,1
    8f3c:	00098513          	mv	a0,s3
    8f40:	00e7a223          	sw	a4,4(a5)
    8f44:	754000ef          	jal	9698 <__malloc_unlock>
    8f48:	00840513          	addi	a0,s0,8
    8f4c:	02c12083          	lw	ra,44(sp)
    8f50:	02812403          	lw	s0,40(sp)
    8f54:	02412483          	lw	s1,36(sp)
    8f58:	02012903          	lw	s2,32(sp)
    8f5c:	01c12983          	lw	s3,28(sp)
    8f60:	03010113          	addi	sp,sp,48
    8f64:	00008067          	ret
    8f68:	ff87f493          	andi	s1,a5,-8
    8f6c:	1807c663          	bltz	a5,90f8 <_malloc_r+0x238>
    8f70:	18b4e463          	bltu	s1,a1,90f8 <_malloc_r+0x238>
    8f74:	720000ef          	jal	9694 <__malloc_lock>
    8f78:	1f700793          	li	a5,503
    8f7c:	4097f463          	bgeu	a5,s1,9384 <_malloc_r+0x4c4>
    8f80:	0094d793          	srli	a5,s1,0x9
    8f84:	18078263          	beqz	a5,9108 <_malloc_r+0x248>
    8f88:	00400713          	li	a4,4
    8f8c:	34f76a63          	bltu	a4,a5,92e0 <_malloc_r+0x420>
    8f90:	0064d793          	srli	a5,s1,0x6
    8f94:	03978593          	addi	a1,a5,57
    8f98:	03878813          	addi	a6,a5,56
    8f9c:	00359613          	slli	a2,a1,0x3
    8fa0:	00013937          	lui	s2,0x13
    8fa4:	5ec90913          	addi	s2,s2,1516 # 135ec <__malloc_av_>
    8fa8:	00c90633          	add	a2,s2,a2
    8fac:	00462403          	lw	s0,4(a2)
    8fb0:	ff860613          	addi	a2,a2,-8
    8fb4:	02860863          	beq	a2,s0,8fe4 <_malloc_r+0x124>
    8fb8:	00f00513          	li	a0,15
    8fbc:	0140006f          	j	8fd0 <_malloc_r+0x110>
    8fc0:	00c42683          	lw	a3,12(s0)
    8fc4:	2a075263          	bgez	a4,9268 <_malloc_r+0x3a8>
    8fc8:	00d60e63          	beq	a2,a3,8fe4 <_malloc_r+0x124>
    8fcc:	00068413          	mv	s0,a3
    8fd0:	00442783          	lw	a5,4(s0)
    8fd4:	ffc7f793          	andi	a5,a5,-4
    8fd8:	40978733          	sub	a4,a5,s1
    8fdc:	fee552e3          	bge	a0,a4,8fc0 <_malloc_r+0x100>
    8fe0:	00080593          	mv	a1,a6
    8fe4:	01092403          	lw	s0,16(s2)
    8fe8:	00013837          	lui	a6,0x13
    8fec:	5f480813          	addi	a6,a6,1524 # 135f4 <__malloc_av_+0x8>
    8ff0:	27040863          	beq	s0,a6,9260 <_malloc_r+0x3a0>
    8ff4:	00442783          	lw	a5,4(s0)
    8ff8:	00f00693          	li	a3,15
    8ffc:	ffc7f793          	andi	a5,a5,-4
    9000:	40978733          	sub	a4,a5,s1
    9004:	38e6c663          	blt	a3,a4,9390 <_malloc_r+0x4d0>
    9008:	01092a23          	sw	a6,20(s2)
    900c:	01092823          	sw	a6,16(s2)
    9010:	34075a63          	bgez	a4,9364 <_malloc_r+0x4a4>
    9014:	1ff00713          	li	a4,511
    9018:	00492503          	lw	a0,4(s2)
    901c:	26f76263          	bltu	a4,a5,9280 <_malloc_r+0x3c0>
    9020:	ff87f713          	andi	a4,a5,-8
    9024:	00870713          	addi	a4,a4,8
    9028:	00e90733          	add	a4,s2,a4
    902c:	00072683          	lw	a3,0(a4)
    9030:	0057d613          	srli	a2,a5,0x5
    9034:	00100793          	li	a5,1
    9038:	00c797b3          	sll	a5,a5,a2
    903c:	00f56533          	or	a0,a0,a5
    9040:	ff870793          	addi	a5,a4,-8
    9044:	00f42623          	sw	a5,12(s0)
    9048:	00d42423          	sw	a3,8(s0)
    904c:	00a92223          	sw	a0,4(s2)
    9050:	00872023          	sw	s0,0(a4)
    9054:	0086a623          	sw	s0,12(a3)
    9058:	4025d793          	srai	a5,a1,0x2
    905c:	00100613          	li	a2,1
    9060:	00f61633          	sll	a2,a2,a5
    9064:	0ac56a63          	bltu	a0,a2,9118 <_malloc_r+0x258>
    9068:	00a677b3          	and	a5,a2,a0
    906c:	02079463          	bnez	a5,9094 <_malloc_r+0x1d4>
    9070:	00161613          	slli	a2,a2,0x1
    9074:	ffc5f593          	andi	a1,a1,-4
    9078:	00a677b3          	and	a5,a2,a0
    907c:	00458593          	addi	a1,a1,4
    9080:	00079a63          	bnez	a5,9094 <_malloc_r+0x1d4>
    9084:	00161613          	slli	a2,a2,0x1
    9088:	00a677b3          	and	a5,a2,a0
    908c:	00458593          	addi	a1,a1,4
    9090:	fe078ae3          	beqz	a5,9084 <_malloc_r+0x1c4>
    9094:	00f00893          	li	a7,15
    9098:	00359313          	slli	t1,a1,0x3
    909c:	00690333          	add	t1,s2,t1
    90a0:	00030513          	mv	a0,t1
    90a4:	00c52783          	lw	a5,12(a0)
    90a8:	00058e13          	mv	t3,a1
    90ac:	24f50c63          	beq	a0,a5,9304 <_malloc_r+0x444>
    90b0:	0047a703          	lw	a4,4(a5)
    90b4:	00078413          	mv	s0,a5
    90b8:	00c7a783          	lw	a5,12(a5)
    90bc:	ffc77713          	andi	a4,a4,-4
    90c0:	409706b3          	sub	a3,a4,s1
    90c4:	24d8cc63          	blt	a7,a3,931c <_malloc_r+0x45c>
    90c8:	fe06c2e3          	bltz	a3,90ac <_malloc_r+0x1ec>
    90cc:	00e40733          	add	a4,s0,a4
    90d0:	00472683          	lw	a3,4(a4)
    90d4:	00842603          	lw	a2,8(s0)
    90d8:	00098513          	mv	a0,s3
    90dc:	0016e693          	ori	a3,a3,1
    90e0:	00d72223          	sw	a3,4(a4)
    90e4:	00f62623          	sw	a5,12(a2)
    90e8:	00c7a423          	sw	a2,8(a5)
    90ec:	5ac000ef          	jal	9698 <__malloc_unlock>
    90f0:	00840513          	addi	a0,s0,8
    90f4:	e59ff06f          	j	8f4c <_malloc_r+0x8c>
    90f8:	00c00793          	li	a5,12
    90fc:	00f9a023          	sw	a5,0(s3)
    9100:	00000513          	li	a0,0
    9104:	e49ff06f          	j	8f4c <_malloc_r+0x8c>
    9108:	20000613          	li	a2,512
    910c:	04000593          	li	a1,64
    9110:	03f00813          	li	a6,63
    9114:	e8dff06f          	j	8fa0 <_malloc_r+0xe0>
    9118:	00892403          	lw	s0,8(s2)
    911c:	01612823          	sw	s6,16(sp)
    9120:	00442783          	lw	a5,4(s0)
    9124:	ffc7fb13          	andi	s6,a5,-4
    9128:	009b6863          	bltu	s6,s1,9138 <_malloc_r+0x278>
    912c:	409b0733          	sub	a4,s6,s1
    9130:	00f00793          	li	a5,15
    9134:	0ee7c463          	blt	a5,a4,921c <_malloc_r+0x35c>
    9138:	000147b7          	lui	a5,0x14
    913c:	01912223          	sw	s9,4(sp)
    9140:	00014cb7          	lui	s9,0x14
    9144:	01512a23          	sw	s5,20(sp)
    9148:	bd0ca703          	lw	a4,-1072(s9) # 13bd0 <__malloc_sbrk_base>
    914c:	d487aa83          	lw	s5,-696(a5) # 13d48 <__malloc_top_pad>
    9150:	01412c23          	sw	s4,24(sp)
    9154:	01712623          	sw	s7,12(sp)
    9158:	fff00793          	li	a5,-1
    915c:	01640a33          	add	s4,s0,s6
    9160:	01548ab3          	add	s5,s1,s5
    9164:	3cf70e63          	beq	a4,a5,9540 <_malloc_r+0x680>
    9168:	000017b7          	lui	a5,0x1
    916c:	00f78793          	addi	a5,a5,15 # 100f <uart_init+0x13>
    9170:	00fa8ab3          	add	s5,s5,a5
    9174:	fffff7b7          	lui	a5,0xfffff
    9178:	00fafab3          	and	s5,s5,a5
    917c:	000a8593          	mv	a1,s5
    9180:	00098513          	mv	a0,s3
    9184:	194020ef          	jal	b318 <_sbrk_r>
    9188:	fff00793          	li	a5,-1
    918c:	00050b93          	mv	s7,a0
    9190:	46f50263          	beq	a0,a5,95f4 <_malloc_r+0x734>
    9194:	01812423          	sw	s8,8(sp)
    9198:	25456463          	bltu	a0,s4,93e0 <_malloc_r+0x520>
    919c:	00014c37          	lui	s8,0x14
    91a0:	d10c0c13          	addi	s8,s8,-752 # 13d10 <__malloc_current_mallinfo>
    91a4:	000c2583          	lw	a1,0(s8)
    91a8:	00ba85b3          	add	a1,s5,a1
    91ac:	00bc2023          	sw	a1,0(s8)
    91b0:	00058713          	mv	a4,a1
    91b4:	2aaa1c63          	bne	s4,a0,946c <_malloc_r+0x5ac>
    91b8:	01451793          	slli	a5,a0,0x14
    91bc:	2a079863          	bnez	a5,946c <_malloc_r+0x5ac>
    91c0:	00892b83          	lw	s7,8(s2)
    91c4:	015b07b3          	add	a5,s6,s5
    91c8:	0017e793          	ori	a5,a5,1
    91cc:	00fba223          	sw	a5,4(s7)
    91d0:	00014737          	lui	a4,0x14
    91d4:	d4472683          	lw	a3,-700(a4) # 13d44 <__malloc_max_sbrked_mem>
    91d8:	00b6f463          	bgeu	a3,a1,91e0 <_malloc_r+0x320>
    91dc:	d4b72223          	sw	a1,-700(a4)
    91e0:	00014737          	lui	a4,0x14
    91e4:	d4072683          	lw	a3,-704(a4) # 13d40 <__malloc_max_total_mem>
    91e8:	00b6f463          	bgeu	a3,a1,91f0 <_malloc_r+0x330>
    91ec:	d4b72023          	sw	a1,-704(a4)
    91f0:	00812c03          	lw	s8,8(sp)
    91f4:	000b8413          	mv	s0,s7
    91f8:	ffc7f793          	andi	a5,a5,-4
    91fc:	40978733          	sub	a4,a5,s1
    9200:	3897ec63          	bltu	a5,s1,9598 <_malloc_r+0x6d8>
    9204:	00f00793          	li	a5,15
    9208:	38e7d863          	bge	a5,a4,9598 <_malloc_r+0x6d8>
    920c:	01812a03          	lw	s4,24(sp)
    9210:	01412a83          	lw	s5,20(sp)
    9214:	00c12b83          	lw	s7,12(sp)
    9218:	00412c83          	lw	s9,4(sp)
    921c:	0014e793          	ori	a5,s1,1
    9220:	00f42223          	sw	a5,4(s0)
    9224:	009404b3          	add	s1,s0,s1
    9228:	00992423          	sw	s1,8(s2)
    922c:	00176713          	ori	a4,a4,1
    9230:	00098513          	mv	a0,s3
    9234:	00e4a223          	sw	a4,4(s1)
    9238:	460000ef          	jal	9698 <__malloc_unlock>
    923c:	02c12083          	lw	ra,44(sp)
    9240:	00840513          	addi	a0,s0,8
    9244:	02812403          	lw	s0,40(sp)
    9248:	01012b03          	lw	s6,16(sp)
    924c:	02412483          	lw	s1,36(sp)
    9250:	02012903          	lw	s2,32(sp)
    9254:	01c12983          	lw	s3,28(sp)
    9258:	03010113          	addi	sp,sp,48
    925c:	00008067          	ret
    9260:	00492503          	lw	a0,4(s2)
    9264:	df5ff06f          	j	9058 <_malloc_r+0x198>
    9268:	00842603          	lw	a2,8(s0)
    926c:	cbdff06f          	j	8f28 <_malloc_r+0x68>
    9270:	00c7a403          	lw	s0,12(a5) # fffff00c <_memory_end+0xfffdf00c>
    9274:	00258593          	addi	a1,a1,2
    9278:	d68786e3          	beq	a5,s0,8fe4 <_malloc_r+0x124>
    927c:	c9dff06f          	j	8f18 <_malloc_r+0x58>
    9280:	0097d713          	srli	a4,a5,0x9
    9284:	00400693          	li	a3,4
    9288:	14e6f263          	bgeu	a3,a4,93cc <_malloc_r+0x50c>
    928c:	01400693          	li	a3,20
    9290:	32e6e663          	bltu	a3,a4,95bc <_malloc_r+0x6fc>
    9294:	05c70613          	addi	a2,a4,92
    9298:	05b70693          	addi	a3,a4,91
    929c:	00361613          	slli	a2,a2,0x3
    92a0:	00c90633          	add	a2,s2,a2
    92a4:	00062703          	lw	a4,0(a2)
    92a8:	ff860613          	addi	a2,a2,-8
    92ac:	00e61863          	bne	a2,a4,92bc <_malloc_r+0x3fc>
    92b0:	2980006f          	j	9548 <_malloc_r+0x688>
    92b4:	00872703          	lw	a4,8(a4)
    92b8:	00e60863          	beq	a2,a4,92c8 <_malloc_r+0x408>
    92bc:	00472683          	lw	a3,4(a4)
    92c0:	ffc6f693          	andi	a3,a3,-4
    92c4:	fed7e8e3          	bltu	a5,a3,92b4 <_malloc_r+0x3f4>
    92c8:	00c72603          	lw	a2,12(a4)
    92cc:	00c42623          	sw	a2,12(s0)
    92d0:	00e42423          	sw	a4,8(s0)
    92d4:	00862423          	sw	s0,8(a2)
    92d8:	00872623          	sw	s0,12(a4)
    92dc:	d7dff06f          	j	9058 <_malloc_r+0x198>
    92e0:	01400713          	li	a4,20
    92e4:	10f77863          	bgeu	a4,a5,93f4 <_malloc_r+0x534>
    92e8:	05400713          	li	a4,84
    92ec:	2ef76663          	bltu	a4,a5,95d8 <_malloc_r+0x718>
    92f0:	00c4d793          	srli	a5,s1,0xc
    92f4:	06f78593          	addi	a1,a5,111
    92f8:	06e78813          	addi	a6,a5,110
    92fc:	00359613          	slli	a2,a1,0x3
    9300:	ca1ff06f          	j	8fa0 <_malloc_r+0xe0>
    9304:	001e0e13          	addi	t3,t3,1
    9308:	003e7793          	andi	a5,t3,3
    930c:	00850513          	addi	a0,a0,8
    9310:	10078063          	beqz	a5,9410 <_malloc_r+0x550>
    9314:	00c52783          	lw	a5,12(a0)
    9318:	d95ff06f          	j	90ac <_malloc_r+0x1ec>
    931c:	00842603          	lw	a2,8(s0)
    9320:	0014e593          	ori	a1,s1,1
    9324:	00b42223          	sw	a1,4(s0)
    9328:	00f62623          	sw	a5,12(a2)
    932c:	00c7a423          	sw	a2,8(a5)
    9330:	009404b3          	add	s1,s0,s1
    9334:	00992a23          	sw	s1,20(s2)
    9338:	00992823          	sw	s1,16(s2)
    933c:	0016e793          	ori	a5,a3,1
    9340:	0104a623          	sw	a6,12(s1)
    9344:	0104a423          	sw	a6,8(s1)
    9348:	00f4a223          	sw	a5,4(s1)
    934c:	00e40733          	add	a4,s0,a4
    9350:	00098513          	mv	a0,s3
    9354:	00d72023          	sw	a3,0(a4)
    9358:	340000ef          	jal	9698 <__malloc_unlock>
    935c:	00840513          	addi	a0,s0,8
    9360:	bedff06f          	j	8f4c <_malloc_r+0x8c>
    9364:	00f407b3          	add	a5,s0,a5
    9368:	0047a703          	lw	a4,4(a5)
    936c:	00098513          	mv	a0,s3
    9370:	00176713          	ori	a4,a4,1
    9374:	00e7a223          	sw	a4,4(a5)
    9378:	320000ef          	jal	9698 <__malloc_unlock>
    937c:	00840513          	addi	a0,s0,8
    9380:	bcdff06f          	j	8f4c <_malloc_r+0x8c>
    9384:	0034d593          	srli	a1,s1,0x3
    9388:	00848793          	addi	a5,s1,8
    938c:	b75ff06f          	j	8f00 <_malloc_r+0x40>
    9390:	0014e693          	ori	a3,s1,1
    9394:	00d42223          	sw	a3,4(s0)
    9398:	009404b3          	add	s1,s0,s1
    939c:	00992a23          	sw	s1,20(s2)
    93a0:	00992823          	sw	s1,16(s2)
    93a4:	00176693          	ori	a3,a4,1
    93a8:	0104a623          	sw	a6,12(s1)
    93ac:	0104a423          	sw	a6,8(s1)
    93b0:	00d4a223          	sw	a3,4(s1)
    93b4:	00f407b3          	add	a5,s0,a5
    93b8:	00098513          	mv	a0,s3
    93bc:	00e7a023          	sw	a4,0(a5)
    93c0:	2d8000ef          	jal	9698 <__malloc_unlock>
    93c4:	00840513          	addi	a0,s0,8
    93c8:	b85ff06f          	j	8f4c <_malloc_r+0x8c>
    93cc:	0067d713          	srli	a4,a5,0x6
    93d0:	03970613          	addi	a2,a4,57
    93d4:	03870693          	addi	a3,a4,56
    93d8:	00361613          	slli	a2,a2,0x3
    93dc:	ec5ff06f          	j	92a0 <_malloc_r+0x3e0>
    93e0:	07240c63          	beq	s0,s2,9458 <_malloc_r+0x598>
    93e4:	00892403          	lw	s0,8(s2)
    93e8:	00812c03          	lw	s8,8(sp)
    93ec:	00442783          	lw	a5,4(s0)
    93f0:	e09ff06f          	j	91f8 <_malloc_r+0x338>
    93f4:	05c78593          	addi	a1,a5,92
    93f8:	05b78813          	addi	a6,a5,91
    93fc:	00359613          	slli	a2,a1,0x3
    9400:	ba1ff06f          	j	8fa0 <_malloc_r+0xe0>
    9404:	00832783          	lw	a5,8(t1)
    9408:	fff58593          	addi	a1,a1,-1
    940c:	28679063          	bne	a5,t1,968c <_malloc_r+0x7cc>
    9410:	0035f793          	andi	a5,a1,3
    9414:	ff830313          	addi	t1,t1,-8
    9418:	fe0796e3          	bnez	a5,9404 <_malloc_r+0x544>
    941c:	00492703          	lw	a4,4(s2)
    9420:	fff64793          	not	a5,a2
    9424:	00e7f7b3          	and	a5,a5,a4
    9428:	00f92223          	sw	a5,4(s2)
    942c:	00161613          	slli	a2,a2,0x1
    9430:	cec7e4e3          	bltu	a5,a2,9118 <_malloc_r+0x258>
    9434:	ce0602e3          	beqz	a2,9118 <_malloc_r+0x258>
    9438:	00f67733          	and	a4,a2,a5
    943c:	00071a63          	bnez	a4,9450 <_malloc_r+0x590>
    9440:	00161613          	slli	a2,a2,0x1
    9444:	00f67733          	and	a4,a2,a5
    9448:	004e0e13          	addi	t3,t3,4
    944c:	fe070ae3          	beqz	a4,9440 <_malloc_r+0x580>
    9450:	000e0593          	mv	a1,t3
    9454:	c45ff06f          	j	9098 <_malloc_r+0x1d8>
    9458:	00014c37          	lui	s8,0x14
    945c:	d10c0c13          	addi	s8,s8,-752 # 13d10 <__malloc_current_mallinfo>
    9460:	000c2703          	lw	a4,0(s8)
    9464:	00ea8733          	add	a4,s5,a4
    9468:	00ec2023          	sw	a4,0(s8)
    946c:	bd0ca683          	lw	a3,-1072(s9)
    9470:	fff00793          	li	a5,-1
    9474:	18f68663          	beq	a3,a5,9600 <_malloc_r+0x740>
    9478:	414b87b3          	sub	a5,s7,s4
    947c:	00e787b3          	add	a5,a5,a4
    9480:	00fc2023          	sw	a5,0(s8)
    9484:	007bfc93          	andi	s9,s7,7
    9488:	0c0c8c63          	beqz	s9,9560 <_malloc_r+0x6a0>
    948c:	419b8bb3          	sub	s7,s7,s9
    9490:	000017b7          	lui	a5,0x1
    9494:	00878793          	addi	a5,a5,8 # 1008 <uart_init+0xc>
    9498:	008b8b93          	addi	s7,s7,8
    949c:	419785b3          	sub	a1,a5,s9
    94a0:	015b8ab3          	add	s5,s7,s5
    94a4:	415585b3          	sub	a1,a1,s5
    94a8:	01459593          	slli	a1,a1,0x14
    94ac:	0145da13          	srli	s4,a1,0x14
    94b0:	000a0593          	mv	a1,s4
    94b4:	00098513          	mv	a0,s3
    94b8:	661010ef          	jal	b318 <_sbrk_r>
    94bc:	fff00793          	li	a5,-1
    94c0:	18f50063          	beq	a0,a5,9640 <_malloc_r+0x780>
    94c4:	41750533          	sub	a0,a0,s7
    94c8:	01450ab3          	add	s5,a0,s4
    94cc:	000c2703          	lw	a4,0(s8)
    94d0:	01792423          	sw	s7,8(s2)
    94d4:	001ae793          	ori	a5,s5,1
    94d8:	00ea05b3          	add	a1,s4,a4
    94dc:	00bc2023          	sw	a1,0(s8)
    94e0:	00fba223          	sw	a5,4(s7)
    94e4:	cf2406e3          	beq	s0,s2,91d0 <_malloc_r+0x310>
    94e8:	00f00693          	li	a3,15
    94ec:	0b66f063          	bgeu	a3,s6,958c <_malloc_r+0x6cc>
    94f0:	00442703          	lw	a4,4(s0)
    94f4:	ff4b0793          	addi	a5,s6,-12
    94f8:	ff87f793          	andi	a5,a5,-8
    94fc:	00177713          	andi	a4,a4,1
    9500:	00f76733          	or	a4,a4,a5
    9504:	00e42223          	sw	a4,4(s0)
    9508:	00500613          	li	a2,5
    950c:	00f40733          	add	a4,s0,a5
    9510:	00c72223          	sw	a2,4(a4)
    9514:	00c72423          	sw	a2,8(a4)
    9518:	00f6e663          	bltu	a3,a5,9524 <_malloc_r+0x664>
    951c:	004ba783          	lw	a5,4(s7)
    9520:	cb1ff06f          	j	91d0 <_malloc_r+0x310>
    9524:	00840593          	addi	a1,s0,8
    9528:	00098513          	mv	a0,s3
    952c:	a80fd0ef          	jal	67ac <_free_r>
    9530:	00892b83          	lw	s7,8(s2)
    9534:	000c2583          	lw	a1,0(s8)
    9538:	004ba783          	lw	a5,4(s7)
    953c:	c95ff06f          	j	91d0 <_malloc_r+0x310>
    9540:	010a8a93          	addi	s5,s5,16
    9544:	c39ff06f          	j	917c <_malloc_r+0x2bc>
    9548:	4026d693          	srai	a3,a3,0x2
    954c:	00100793          	li	a5,1
    9550:	00d797b3          	sll	a5,a5,a3
    9554:	00f56533          	or	a0,a0,a5
    9558:	00a92223          	sw	a0,4(s2)
    955c:	d71ff06f          	j	92cc <_malloc_r+0x40c>
    9560:	015b85b3          	add	a1,s7,s5
    9564:	40b005b3          	neg	a1,a1
    9568:	01459593          	slli	a1,a1,0x14
    956c:	0145da13          	srli	s4,a1,0x14
    9570:	000a0593          	mv	a1,s4
    9574:	00098513          	mv	a0,s3
    9578:	5a1010ef          	jal	b318 <_sbrk_r>
    957c:	fff00793          	li	a5,-1
    9580:	f4f512e3          	bne	a0,a5,94c4 <_malloc_r+0x604>
    9584:	00000a13          	li	s4,0
    9588:	f45ff06f          	j	94cc <_malloc_r+0x60c>
    958c:	00812c03          	lw	s8,8(sp)
    9590:	00100793          	li	a5,1
    9594:	00fba223          	sw	a5,4(s7)
    9598:	00098513          	mv	a0,s3
    959c:	0fc000ef          	jal	9698 <__malloc_unlock>
    95a0:	00000513          	li	a0,0
    95a4:	01812a03          	lw	s4,24(sp)
    95a8:	01412a83          	lw	s5,20(sp)
    95ac:	01012b03          	lw	s6,16(sp)
    95b0:	00c12b83          	lw	s7,12(sp)
    95b4:	00412c83          	lw	s9,4(sp)
    95b8:	995ff06f          	j	8f4c <_malloc_r+0x8c>
    95bc:	05400693          	li	a3,84
    95c0:	04e6e463          	bltu	a3,a4,9608 <_malloc_r+0x748>
    95c4:	00c7d713          	srli	a4,a5,0xc
    95c8:	06f70613          	addi	a2,a4,111
    95cc:	06e70693          	addi	a3,a4,110
    95d0:	00361613          	slli	a2,a2,0x3
    95d4:	ccdff06f          	j	92a0 <_malloc_r+0x3e0>
    95d8:	15400713          	li	a4,340
    95dc:	04f76463          	bltu	a4,a5,9624 <_malloc_r+0x764>
    95e0:	00f4d793          	srli	a5,s1,0xf
    95e4:	07878593          	addi	a1,a5,120
    95e8:	07778813          	addi	a6,a5,119
    95ec:	00359613          	slli	a2,a1,0x3
    95f0:	9b1ff06f          	j	8fa0 <_malloc_r+0xe0>
    95f4:	00892403          	lw	s0,8(s2)
    95f8:	00442783          	lw	a5,4(s0)
    95fc:	bfdff06f          	j	91f8 <_malloc_r+0x338>
    9600:	bd7ca823          	sw	s7,-1072(s9)
    9604:	e81ff06f          	j	9484 <_malloc_r+0x5c4>
    9608:	15400693          	li	a3,340
    960c:	04e6e463          	bltu	a3,a4,9654 <_malloc_r+0x794>
    9610:	00f7d713          	srli	a4,a5,0xf
    9614:	07870613          	addi	a2,a4,120
    9618:	07770693          	addi	a3,a4,119
    961c:	00361613          	slli	a2,a2,0x3
    9620:	c81ff06f          	j	92a0 <_malloc_r+0x3e0>
    9624:	55400713          	li	a4,1364
    9628:	04f76463          	bltu	a4,a5,9670 <_malloc_r+0x7b0>
    962c:	0124d793          	srli	a5,s1,0x12
    9630:	07d78593          	addi	a1,a5,125
    9634:	07c78813          	addi	a6,a5,124
    9638:	00359613          	slli	a2,a1,0x3
    963c:	965ff06f          	j	8fa0 <_malloc_r+0xe0>
    9640:	ff8c8c93          	addi	s9,s9,-8
    9644:	019a8ab3          	add	s5,s5,s9
    9648:	417a8ab3          	sub	s5,s5,s7
    964c:	00000a13          	li	s4,0
    9650:	e7dff06f          	j	94cc <_malloc_r+0x60c>
    9654:	55400693          	li	a3,1364
    9658:	02e6e463          	bltu	a3,a4,9680 <_malloc_r+0x7c0>
    965c:	0127d713          	srli	a4,a5,0x12
    9660:	07d70613          	addi	a2,a4,125
    9664:	07c70693          	addi	a3,a4,124
    9668:	00361613          	slli	a2,a2,0x3
    966c:	c35ff06f          	j	92a0 <_malloc_r+0x3e0>
    9670:	3f800613          	li	a2,1016
    9674:	07f00593          	li	a1,127
    9678:	07e00813          	li	a6,126
    967c:	925ff06f          	j	8fa0 <_malloc_r+0xe0>
    9680:	3f800613          	li	a2,1016
    9684:	07e00693          	li	a3,126
    9688:	c19ff06f          	j	92a0 <_malloc_r+0x3e0>
    968c:	00492783          	lw	a5,4(s2)
    9690:	d9dff06f          	j	942c <_malloc_r+0x56c>

00009694 <__malloc_lock>:
    9694:	00008067          	ret

00009698 <__malloc_unlock>:
    9698:	00008067          	ret

0000969c <_Balloc>:
    969c:	04452783          	lw	a5,68(a0)
    96a0:	ff010113          	addi	sp,sp,-16
    96a4:	00812423          	sw	s0,8(sp)
    96a8:	00912223          	sw	s1,4(sp)
    96ac:	00112623          	sw	ra,12(sp)
    96b0:	00050413          	mv	s0,a0
    96b4:	00058493          	mv	s1,a1
    96b8:	02078c63          	beqz	a5,96f0 <_Balloc+0x54>
    96bc:	00249713          	slli	a4,s1,0x2
    96c0:	00e787b3          	add	a5,a5,a4
    96c4:	0007a503          	lw	a0,0(a5)
    96c8:	04050463          	beqz	a0,9710 <_Balloc+0x74>
    96cc:	00052703          	lw	a4,0(a0)
    96d0:	00e7a023          	sw	a4,0(a5)
    96d4:	00052823          	sw	zero,16(a0)
    96d8:	00052623          	sw	zero,12(a0)
    96dc:	00c12083          	lw	ra,12(sp)
    96e0:	00812403          	lw	s0,8(sp)
    96e4:	00412483          	lw	s1,4(sp)
    96e8:	01010113          	addi	sp,sp,16
    96ec:	00008067          	ret
    96f0:	02100613          	li	a2,33
    96f4:	00400593          	li	a1,4
    96f8:	65d010ef          	jal	b554 <_calloc_r>
    96fc:	04a42223          	sw	a0,68(s0)
    9700:	00050793          	mv	a5,a0
    9704:	fa051ce3          	bnez	a0,96bc <_Balloc+0x20>
    9708:	00000513          	li	a0,0
    970c:	fd1ff06f          	j	96dc <_Balloc+0x40>
    9710:	01212023          	sw	s2,0(sp)
    9714:	00100913          	li	s2,1
    9718:	00991933          	sll	s2,s2,s1
    971c:	00590613          	addi	a2,s2,5
    9720:	00261613          	slli	a2,a2,0x2
    9724:	00100593          	li	a1,1
    9728:	00040513          	mv	a0,s0
    972c:	629010ef          	jal	b554 <_calloc_r>
    9730:	00050a63          	beqz	a0,9744 <_Balloc+0xa8>
    9734:	01252423          	sw	s2,8(a0)
    9738:	00952223          	sw	s1,4(a0)
    973c:	00012903          	lw	s2,0(sp)
    9740:	f95ff06f          	j	96d4 <_Balloc+0x38>
    9744:	00012903          	lw	s2,0(sp)
    9748:	00000513          	li	a0,0
    974c:	f91ff06f          	j	96dc <_Balloc+0x40>

00009750 <_Bfree>:
    9750:	02058063          	beqz	a1,9770 <_Bfree+0x20>
    9754:	0045a703          	lw	a4,4(a1)
    9758:	04452783          	lw	a5,68(a0)
    975c:	00271713          	slli	a4,a4,0x2
    9760:	00e787b3          	add	a5,a5,a4
    9764:	0007a703          	lw	a4,0(a5)
    9768:	00e5a023          	sw	a4,0(a1)
    976c:	00b7a023          	sw	a1,0(a5)
    9770:	00008067          	ret

00009774 <__multadd>:
    9774:	fe010113          	addi	sp,sp,-32
    9778:	00912a23          	sw	s1,20(sp)
    977c:	0105a483          	lw	s1,16(a1)
    9780:	00010337          	lui	t1,0x10
    9784:	00812c23          	sw	s0,24(sp)
    9788:	01212823          	sw	s2,16(sp)
    978c:	01312623          	sw	s3,12(sp)
    9790:	00112e23          	sw	ra,28(sp)
    9794:	00058913          	mv	s2,a1
    9798:	00050993          	mv	s3,a0
    979c:	00068413          	mv	s0,a3
    97a0:	01458813          	addi	a6,a1,20
    97a4:	00000893          	li	a7,0
    97a8:	fff30313          	addi	t1,t1,-1 # ffff <__multf3+0xd47>
    97ac:	00082783          	lw	a5,0(a6)
    97b0:	00480813          	addi	a6,a6,4
    97b4:	00188893          	addi	a7,a7,1
    97b8:	0067f733          	and	a4,a5,t1
    97bc:	02c70733          	mul	a4,a4,a2
    97c0:	0107d693          	srli	a3,a5,0x10
    97c4:	02c686b3          	mul	a3,a3,a2
    97c8:	008707b3          	add	a5,a4,s0
    97cc:	0107d713          	srli	a4,a5,0x10
    97d0:	0067f7b3          	and	a5,a5,t1
    97d4:	00e686b3          	add	a3,a3,a4
    97d8:	01069713          	slli	a4,a3,0x10
    97dc:	00f707b3          	add	a5,a4,a5
    97e0:	fef82e23          	sw	a5,-4(a6)
    97e4:	0106d413          	srli	s0,a3,0x10
    97e8:	fc98c2e3          	blt	a7,s1,97ac <__multadd+0x38>
    97ec:	02040263          	beqz	s0,9810 <__multadd+0x9c>
    97f0:	00892783          	lw	a5,8(s2)
    97f4:	02f4de63          	bge	s1,a5,9830 <__multadd+0xbc>
    97f8:	00448793          	addi	a5,s1,4
    97fc:	00279793          	slli	a5,a5,0x2
    9800:	00f907b3          	add	a5,s2,a5
    9804:	0087a223          	sw	s0,4(a5)
    9808:	00148493          	addi	s1,s1,1
    980c:	00992823          	sw	s1,16(s2)
    9810:	01c12083          	lw	ra,28(sp)
    9814:	01812403          	lw	s0,24(sp)
    9818:	01412483          	lw	s1,20(sp)
    981c:	00c12983          	lw	s3,12(sp)
    9820:	00090513          	mv	a0,s2
    9824:	01012903          	lw	s2,16(sp)
    9828:	02010113          	addi	sp,sp,32
    982c:	00008067          	ret
    9830:	00492583          	lw	a1,4(s2)
    9834:	00098513          	mv	a0,s3
    9838:	01412423          	sw	s4,8(sp)
    983c:	00158593          	addi	a1,a1,1
    9840:	e5dff0ef          	jal	969c <_Balloc>
    9844:	00050a13          	mv	s4,a0
    9848:	04050e63          	beqz	a0,98a4 <__multadd+0x130>
    984c:	01092603          	lw	a2,16(s2)
    9850:	00c90593          	addi	a1,s2,12
    9854:	00c50513          	addi	a0,a0,12
    9858:	00260613          	addi	a2,a2,2
    985c:	00261613          	slli	a2,a2,0x2
    9860:	a55fc0ef          	jal	62b4 <memcpy>
    9864:	00492703          	lw	a4,4(s2)
    9868:	0449a783          	lw	a5,68(s3)
    986c:	00271713          	slli	a4,a4,0x2
    9870:	00e787b3          	add	a5,a5,a4
    9874:	0007a703          	lw	a4,0(a5)
    9878:	00e92023          	sw	a4,0(s2)
    987c:	0127a023          	sw	s2,0(a5)
    9880:	00448793          	addi	a5,s1,4
    9884:	000a0913          	mv	s2,s4
    9888:	00279793          	slli	a5,a5,0x2
    988c:	00f907b3          	add	a5,s2,a5
    9890:	00812a03          	lw	s4,8(sp)
    9894:	00148493          	addi	s1,s1,1
    9898:	0087a223          	sw	s0,4(a5)
    989c:	00992823          	sw	s1,16(s2)
    98a0:	f71ff06f          	j	9810 <__multadd+0x9c>
    98a4:	3f418693          	addi	a3,gp,1012 # 12bc4 <keypad_map+0x64>
    98a8:	00000613          	li	a2,0
    98ac:	0ba00593          	li	a1,186
    98b0:	48818513          	addi	a0,gp,1160 # 12c58 <keypad_map+0xf8>
    98b4:	441010ef          	jal	b4f4 <__assert_func>

000098b8 <__s2b>:
    98b8:	fe010113          	addi	sp,sp,-32
    98bc:	00812c23          	sw	s0,24(sp)
    98c0:	00912a23          	sw	s1,20(sp)
    98c4:	01212823          	sw	s2,16(sp)
    98c8:	01312623          	sw	s3,12(sp)
    98cc:	01412423          	sw	s4,8(sp)
    98d0:	00068993          	mv	s3,a3
    98d4:	00900793          	li	a5,9
    98d8:	00868693          	addi	a3,a3,8
    98dc:	00112e23          	sw	ra,28(sp)
    98e0:	02f6c6b3          	div	a3,a3,a5
    98e4:	00050913          	mv	s2,a0
    98e8:	00058413          	mv	s0,a1
    98ec:	00060a13          	mv	s4,a2
    98f0:	00070493          	mv	s1,a4
    98f4:	0d37da63          	bge	a5,s3,99c8 <__s2b+0x110>
    98f8:	00100793          	li	a5,1
    98fc:	00000593          	li	a1,0
    9900:	00179793          	slli	a5,a5,0x1
    9904:	00158593          	addi	a1,a1,1
    9908:	fed7cce3          	blt	a5,a3,9900 <__s2b+0x48>
    990c:	00090513          	mv	a0,s2
    9910:	d8dff0ef          	jal	969c <_Balloc>
    9914:	00050593          	mv	a1,a0
    9918:	0a050c63          	beqz	a0,99d0 <__s2b+0x118>
    991c:	00100793          	li	a5,1
    9920:	00f52823          	sw	a5,16(a0)
    9924:	00952a23          	sw	s1,20(a0)
    9928:	00900793          	li	a5,9
    992c:	0947d863          	bge	a5,s4,99bc <__s2b+0x104>
    9930:	01512223          	sw	s5,4(sp)
    9934:	00940a93          	addi	s5,s0,9
    9938:	000a8493          	mv	s1,s5
    993c:	01440433          	add	s0,s0,s4
    9940:	0004c683          	lbu	a3,0(s1)
    9944:	00a00613          	li	a2,10
    9948:	00090513          	mv	a0,s2
    994c:	fd068693          	addi	a3,a3,-48
    9950:	e25ff0ef          	jal	9774 <__multadd>
    9954:	00148493          	addi	s1,s1,1
    9958:	00050593          	mv	a1,a0
    995c:	fe8492e3          	bne	s1,s0,9940 <__s2b+0x88>
    9960:	ff8a0413          	addi	s0,s4,-8
    9964:	008a8433          	add	s0,s5,s0
    9968:	00412a83          	lw	s5,4(sp)
    996c:	033a5663          	bge	s4,s3,9998 <__s2b+0xe0>
    9970:	414989b3          	sub	s3,s3,s4
    9974:	013409b3          	add	s3,s0,s3
    9978:	00044683          	lbu	a3,0(s0)
    997c:	00a00613          	li	a2,10
    9980:	00090513          	mv	a0,s2
    9984:	fd068693          	addi	a3,a3,-48
    9988:	dedff0ef          	jal	9774 <__multadd>
    998c:	00140413          	addi	s0,s0,1
    9990:	00050593          	mv	a1,a0
    9994:	ff3412e3          	bne	s0,s3,9978 <__s2b+0xc0>
    9998:	01c12083          	lw	ra,28(sp)
    999c:	01812403          	lw	s0,24(sp)
    99a0:	01412483          	lw	s1,20(sp)
    99a4:	01012903          	lw	s2,16(sp)
    99a8:	00c12983          	lw	s3,12(sp)
    99ac:	00812a03          	lw	s4,8(sp)
    99b0:	00058513          	mv	a0,a1
    99b4:	02010113          	addi	sp,sp,32
    99b8:	00008067          	ret
    99bc:	00a40413          	addi	s0,s0,10
    99c0:	00900a13          	li	s4,9
    99c4:	fa9ff06f          	j	996c <__s2b+0xb4>
    99c8:	00000593          	li	a1,0
    99cc:	f41ff06f          	j	990c <__s2b+0x54>
    99d0:	3f418693          	addi	a3,gp,1012 # 12bc4 <keypad_map+0x64>
    99d4:	00000613          	li	a2,0
    99d8:	0d300593          	li	a1,211
    99dc:	48818513          	addi	a0,gp,1160 # 12c58 <keypad_map+0xf8>
    99e0:	01512223          	sw	s5,4(sp)
    99e4:	311010ef          	jal	b4f4 <__assert_func>

000099e8 <__hi0bits>:
    99e8:	00050793          	mv	a5,a0
    99ec:	00010737          	lui	a4,0x10
    99f0:	00000513          	li	a0,0
    99f4:	00e7f663          	bgeu	a5,a4,9a00 <__hi0bits+0x18>
    99f8:	01079793          	slli	a5,a5,0x10
    99fc:	01000513          	li	a0,16
    9a00:	01000737          	lui	a4,0x1000
    9a04:	00e7f663          	bgeu	a5,a4,9a10 <__hi0bits+0x28>
    9a08:	00850513          	addi	a0,a0,8
    9a0c:	00879793          	slli	a5,a5,0x8
    9a10:	10000737          	lui	a4,0x10000
    9a14:	00e7f663          	bgeu	a5,a4,9a20 <__hi0bits+0x38>
    9a18:	00450513          	addi	a0,a0,4
    9a1c:	00479793          	slli	a5,a5,0x4
    9a20:	40000737          	lui	a4,0x40000
    9a24:	00e7ea63          	bltu	a5,a4,9a38 <__hi0bits+0x50>
    9a28:	fff7c793          	not	a5,a5
    9a2c:	01f7d793          	srli	a5,a5,0x1f
    9a30:	00f50533          	add	a0,a0,a5
    9a34:	00008067          	ret
    9a38:	00279793          	slli	a5,a5,0x2
    9a3c:	0007ca63          	bltz	a5,9a50 <__hi0bits+0x68>
    9a40:	00179713          	slli	a4,a5,0x1
    9a44:	00074a63          	bltz	a4,9a58 <__hi0bits+0x70>
    9a48:	02000513          	li	a0,32
    9a4c:	00008067          	ret
    9a50:	00250513          	addi	a0,a0,2
    9a54:	00008067          	ret
    9a58:	00350513          	addi	a0,a0,3
    9a5c:	00008067          	ret

00009a60 <__lo0bits>:
    9a60:	00052783          	lw	a5,0(a0)
    9a64:	00050713          	mv	a4,a0
    9a68:	0077f693          	andi	a3,a5,7
    9a6c:	02068463          	beqz	a3,9a94 <__lo0bits+0x34>
    9a70:	0017f693          	andi	a3,a5,1
    9a74:	00000513          	li	a0,0
    9a78:	04069e63          	bnez	a3,9ad4 <__lo0bits+0x74>
    9a7c:	0027f693          	andi	a3,a5,2
    9a80:	0a068863          	beqz	a3,9b30 <__lo0bits+0xd0>
    9a84:	0017d793          	srli	a5,a5,0x1
    9a88:	00f72023          	sw	a5,0(a4) # 40000000 <_memory_end+0x3ffe0000>
    9a8c:	00100513          	li	a0,1
    9a90:	00008067          	ret
    9a94:	01079693          	slli	a3,a5,0x10
    9a98:	0106d693          	srli	a3,a3,0x10
    9a9c:	00000513          	li	a0,0
    9aa0:	06068e63          	beqz	a3,9b1c <__lo0bits+0xbc>
    9aa4:	0ff7f693          	zext.b	a3,a5
    9aa8:	06068063          	beqz	a3,9b08 <__lo0bits+0xa8>
    9aac:	00f7f693          	andi	a3,a5,15
    9ab0:	04068263          	beqz	a3,9af4 <__lo0bits+0x94>
    9ab4:	0037f693          	andi	a3,a5,3
    9ab8:	02068463          	beqz	a3,9ae0 <__lo0bits+0x80>
    9abc:	0017f693          	andi	a3,a5,1
    9ac0:	00069c63          	bnez	a3,9ad8 <__lo0bits+0x78>
    9ac4:	0017d793          	srli	a5,a5,0x1
    9ac8:	00150513          	addi	a0,a0,1
    9acc:	00079663          	bnez	a5,9ad8 <__lo0bits+0x78>
    9ad0:	02000513          	li	a0,32
    9ad4:	00008067          	ret
    9ad8:	00f72023          	sw	a5,0(a4)
    9adc:	00008067          	ret
    9ae0:	0027d793          	srli	a5,a5,0x2
    9ae4:	0017f693          	andi	a3,a5,1
    9ae8:	00250513          	addi	a0,a0,2
    9aec:	fe0696e3          	bnez	a3,9ad8 <__lo0bits+0x78>
    9af0:	fd5ff06f          	j	9ac4 <__lo0bits+0x64>
    9af4:	0047d793          	srli	a5,a5,0x4
    9af8:	0037f693          	andi	a3,a5,3
    9afc:	00450513          	addi	a0,a0,4
    9b00:	fa069ee3          	bnez	a3,9abc <__lo0bits+0x5c>
    9b04:	fddff06f          	j	9ae0 <__lo0bits+0x80>
    9b08:	0087d793          	srli	a5,a5,0x8
    9b0c:	00f7f693          	andi	a3,a5,15
    9b10:	00850513          	addi	a0,a0,8
    9b14:	fa0690e3          	bnez	a3,9ab4 <__lo0bits+0x54>
    9b18:	fddff06f          	j	9af4 <__lo0bits+0x94>
    9b1c:	0107d793          	srli	a5,a5,0x10
    9b20:	0ff7f693          	zext.b	a3,a5
    9b24:	01000513          	li	a0,16
    9b28:	f80692e3          	bnez	a3,9aac <__lo0bits+0x4c>
    9b2c:	fddff06f          	j	9b08 <__lo0bits+0xa8>
    9b30:	0027d793          	srli	a5,a5,0x2
    9b34:	00f72023          	sw	a5,0(a4)
    9b38:	00200513          	li	a0,2
    9b3c:	00008067          	ret

00009b40 <__i2b>:
    9b40:	04452783          	lw	a5,68(a0)
    9b44:	ff010113          	addi	sp,sp,-16
    9b48:	00812423          	sw	s0,8(sp)
    9b4c:	00912223          	sw	s1,4(sp)
    9b50:	00112623          	sw	ra,12(sp)
    9b54:	00050413          	mv	s0,a0
    9b58:	00058493          	mv	s1,a1
    9b5c:	02078c63          	beqz	a5,9b94 <__i2b+0x54>
    9b60:	0047a503          	lw	a0,4(a5)
    9b64:	04050e63          	beqz	a0,9bc0 <__i2b+0x80>
    9b68:	00052703          	lw	a4,0(a0)
    9b6c:	00e7a223          	sw	a4,4(a5)
    9b70:	00c12083          	lw	ra,12(sp)
    9b74:	00812403          	lw	s0,8(sp)
    9b78:	00100793          	li	a5,1
    9b7c:	00952a23          	sw	s1,20(a0)
    9b80:	00052623          	sw	zero,12(a0)
    9b84:	00f52823          	sw	a5,16(a0)
    9b88:	00412483          	lw	s1,4(sp)
    9b8c:	01010113          	addi	sp,sp,16
    9b90:	00008067          	ret
    9b94:	02100613          	li	a2,33
    9b98:	00400593          	li	a1,4
    9b9c:	1b9010ef          	jal	b554 <_calloc_r>
    9ba0:	04a42223          	sw	a0,68(s0)
    9ba4:	00050793          	mv	a5,a0
    9ba8:	fa051ce3          	bnez	a0,9b60 <__i2b+0x20>
    9bac:	3f418693          	addi	a3,gp,1012 # 12bc4 <keypad_map+0x64>
    9bb0:	00000613          	li	a2,0
    9bb4:	14500593          	li	a1,325
    9bb8:	48818513          	addi	a0,gp,1160 # 12c58 <keypad_map+0xf8>
    9bbc:	139010ef          	jal	b4f4 <__assert_func>
    9bc0:	01c00613          	li	a2,28
    9bc4:	00100593          	li	a1,1
    9bc8:	00040513          	mv	a0,s0
    9bcc:	189010ef          	jal	b554 <_calloc_r>
    9bd0:	fc050ee3          	beqz	a0,9bac <__i2b+0x6c>
    9bd4:	00100793          	li	a5,1
    9bd8:	00f52223          	sw	a5,4(a0)
    9bdc:	00200793          	li	a5,2
    9be0:	00f52423          	sw	a5,8(a0)
    9be4:	f8dff06f          	j	9b70 <__i2b+0x30>

00009be8 <__multiply>:
    9be8:	fe010113          	addi	sp,sp,-32
    9bec:	01212823          	sw	s2,16(sp)
    9bf0:	01312623          	sw	s3,12(sp)
    9bf4:	0105a903          	lw	s2,16(a1)
    9bf8:	01062983          	lw	s3,16(a2)
    9bfc:	00912a23          	sw	s1,20(sp)
    9c00:	01412423          	sw	s4,8(sp)
    9c04:	00112e23          	sw	ra,28(sp)
    9c08:	00812c23          	sw	s0,24(sp)
    9c0c:	00058a13          	mv	s4,a1
    9c10:	00060493          	mv	s1,a2
    9c14:	01394c63          	blt	s2,s3,9c2c <__multiply+0x44>
    9c18:	00098713          	mv	a4,s3
    9c1c:	00058493          	mv	s1,a1
    9c20:	00090993          	mv	s3,s2
    9c24:	00060a13          	mv	s4,a2
    9c28:	00070913          	mv	s2,a4
    9c2c:	0084a783          	lw	a5,8(s1)
    9c30:	0044a583          	lw	a1,4(s1)
    9c34:	01298433          	add	s0,s3,s2
    9c38:	0087a7b3          	slt	a5,a5,s0
    9c3c:	00f585b3          	add	a1,a1,a5
    9c40:	a5dff0ef          	jal	969c <_Balloc>
    9c44:	1a050e63          	beqz	a0,9e00 <__multiply+0x218>
    9c48:	01450313          	addi	t1,a0,20
    9c4c:	00241893          	slli	a7,s0,0x2
    9c50:	011308b3          	add	a7,t1,a7
    9c54:	00030793          	mv	a5,t1
    9c58:	01137863          	bgeu	t1,a7,9c68 <__multiply+0x80>
    9c5c:	0007a023          	sw	zero,0(a5)
    9c60:	00478793          	addi	a5,a5,4
    9c64:	ff17ece3          	bltu	a5,a7,9c5c <__multiply+0x74>
    9c68:	014a0813          	addi	a6,s4,20
    9c6c:	00291e13          	slli	t3,s2,0x2
    9c70:	01448e93          	addi	t4,s1,20
    9c74:	00299593          	slli	a1,s3,0x2
    9c78:	01c80e33          	add	t3,a6,t3
    9c7c:	00be85b3          	add	a1,t4,a1
    9c80:	13c87663          	bgeu	a6,t3,9dac <__multiply+0x1c4>
    9c84:	01548793          	addi	a5,s1,21
    9c88:	00400f13          	li	t5,4
    9c8c:	16f5f063          	bgeu	a1,a5,9dec <__multiply+0x204>
    9c90:	000106b7          	lui	a3,0x10
    9c94:	fff68693          	addi	a3,a3,-1 # ffff <__multf3+0xd47>
    9c98:	0180006f          	j	9cb0 <__multiply+0xc8>
    9c9c:	010fdf93          	srli	t6,t6,0x10
    9ca0:	080f9863          	bnez	t6,9d30 <__multiply+0x148>
    9ca4:	00480813          	addi	a6,a6,4
    9ca8:	00430313          	addi	t1,t1,4
    9cac:	11c87063          	bgeu	a6,t3,9dac <__multiply+0x1c4>
    9cb0:	00082f83          	lw	t6,0(a6)
    9cb4:	00dff3b3          	and	t2,t6,a3
    9cb8:	fe0382e3          	beqz	t2,9c9c <__multiply+0xb4>
    9cbc:	00030293          	mv	t0,t1
    9cc0:	000e8f93          	mv	t6,t4
    9cc4:	00000493          	li	s1,0
    9cc8:	000fa783          	lw	a5,0(t6)
    9ccc:	0002a603          	lw	a2,0(t0) # 628c <memset+0xb4>
    9cd0:	00428293          	addi	t0,t0,4
    9cd4:	00d7f733          	and	a4,a5,a3
    9cd8:	02770733          	mul	a4,a4,t2
    9cdc:	0107d793          	srli	a5,a5,0x10
    9ce0:	00d67933          	and	s2,a2,a3
    9ce4:	01065613          	srli	a2,a2,0x10
    9ce8:	004f8f93          	addi	t6,t6,4
    9cec:	027787b3          	mul	a5,a5,t2
    9cf0:	01270733          	add	a4,a4,s2
    9cf4:	00970733          	add	a4,a4,s1
    9cf8:	01075493          	srli	s1,a4,0x10
    9cfc:	00d77733          	and	a4,a4,a3
    9d00:	00c787b3          	add	a5,a5,a2
    9d04:	009787b3          	add	a5,a5,s1
    9d08:	01079613          	slli	a2,a5,0x10
    9d0c:	00e66733          	or	a4,a2,a4
    9d10:	fee2ae23          	sw	a4,-4(t0)
    9d14:	0107d493          	srli	s1,a5,0x10
    9d18:	fabfe8e3          	bltu	t6,a1,9cc8 <__multiply+0xe0>
    9d1c:	01e307b3          	add	a5,t1,t5
    9d20:	0097a023          	sw	s1,0(a5)
    9d24:	00082f83          	lw	t6,0(a6)
    9d28:	010fdf93          	srli	t6,t6,0x10
    9d2c:	f60f8ce3          	beqz	t6,9ca4 <__multiply+0xbc>
    9d30:	00032703          	lw	a4,0(t1)
    9d34:	00030293          	mv	t0,t1
    9d38:	000e8613          	mv	a2,t4
    9d3c:	00070493          	mv	s1,a4
    9d40:	00000393          	li	t2,0
    9d44:	00062783          	lw	a5,0(a2)
    9d48:	0104d993          	srli	s3,s1,0x10
    9d4c:	00d77733          	and	a4,a4,a3
    9d50:	00d7f7b3          	and	a5,a5,a3
    9d54:	03f787b3          	mul	a5,a5,t6
    9d58:	0042a483          	lw	s1,4(t0)
    9d5c:	00428293          	addi	t0,t0,4
    9d60:	00460613          	addi	a2,a2,4
    9d64:	00d4f933          	and	s2,s1,a3
    9d68:	007787b3          	add	a5,a5,t2
    9d6c:	013787b3          	add	a5,a5,s3
    9d70:	01079393          	slli	t2,a5,0x10
    9d74:	00e3e733          	or	a4,t2,a4
    9d78:	fee2ae23          	sw	a4,-4(t0)
    9d7c:	ffe65703          	lhu	a4,-2(a2)
    9d80:	0107d793          	srli	a5,a5,0x10
    9d84:	03f70733          	mul	a4,a4,t6
    9d88:	01270733          	add	a4,a4,s2
    9d8c:	00f70733          	add	a4,a4,a5
    9d90:	01075393          	srli	t2,a4,0x10
    9d94:	fab668e3          	bltu	a2,a1,9d44 <__multiply+0x15c>
    9d98:	01e307b3          	add	a5,t1,t5
    9d9c:	00e7a023          	sw	a4,0(a5)
    9da0:	00480813          	addi	a6,a6,4
    9da4:	00430313          	addi	t1,t1,4
    9da8:	f1c864e3          	bltu	a6,t3,9cb0 <__multiply+0xc8>
    9dac:	00804863          	bgtz	s0,9dbc <__multiply+0x1d4>
    9db0:	0180006f          	j	9dc8 <__multiply+0x1e0>
    9db4:	fff40413          	addi	s0,s0,-1
    9db8:	00040863          	beqz	s0,9dc8 <__multiply+0x1e0>
    9dbc:	ffc8a783          	lw	a5,-4(a7)
    9dc0:	ffc88893          	addi	a7,a7,-4
    9dc4:	fe0788e3          	beqz	a5,9db4 <__multiply+0x1cc>
    9dc8:	01c12083          	lw	ra,28(sp)
    9dcc:	00852823          	sw	s0,16(a0)
    9dd0:	01812403          	lw	s0,24(sp)
    9dd4:	01412483          	lw	s1,20(sp)
    9dd8:	01012903          	lw	s2,16(sp)
    9ddc:	00c12983          	lw	s3,12(sp)
    9de0:	00812a03          	lw	s4,8(sp)
    9de4:	02010113          	addi	sp,sp,32
    9de8:	00008067          	ret
    9dec:	409587b3          	sub	a5,a1,s1
    9df0:	feb78793          	addi	a5,a5,-21
    9df4:	ffc7f793          	andi	a5,a5,-4
    9df8:	00478f13          	addi	t5,a5,4
    9dfc:	e95ff06f          	j	9c90 <__multiply+0xa8>
    9e00:	3f418693          	addi	a3,gp,1012 # 12bc4 <keypad_map+0x64>
    9e04:	00000613          	li	a2,0
    9e08:	16200593          	li	a1,354
    9e0c:	48818513          	addi	a0,gp,1160 # 12c58 <keypad_map+0xf8>
    9e10:	6e4010ef          	jal	b4f4 <__assert_func>

00009e14 <__pow5mult>:
    9e14:	fe010113          	addi	sp,sp,-32
    9e18:	00812c23          	sw	s0,24(sp)
    9e1c:	01212823          	sw	s2,16(sp)
    9e20:	01312623          	sw	s3,12(sp)
    9e24:	00112e23          	sw	ra,28(sp)
    9e28:	00367793          	andi	a5,a2,3
    9e2c:	00060413          	mv	s0,a2
    9e30:	00050993          	mv	s3,a0
    9e34:	00058913          	mv	s2,a1
    9e38:	0a079c63          	bnez	a5,9ef0 <__pow5mult+0xdc>
    9e3c:	40245413          	srai	s0,s0,0x2
    9e40:	06040a63          	beqz	s0,9eb4 <__pow5mult+0xa0>
    9e44:	00912a23          	sw	s1,20(sp)
    9e48:	0409a483          	lw	s1,64(s3)
    9e4c:	0c048463          	beqz	s1,9f14 <__pow5mult+0x100>
    9e50:	00147793          	andi	a5,s0,1
    9e54:	02079063          	bnez	a5,9e74 <__pow5mult+0x60>
    9e58:	40145413          	srai	s0,s0,0x1
    9e5c:	04040a63          	beqz	s0,9eb0 <__pow5mult+0x9c>
    9e60:	0004a503          	lw	a0,0(s1)
    9e64:	06050663          	beqz	a0,9ed0 <__pow5mult+0xbc>
    9e68:	00050493          	mv	s1,a0
    9e6c:	00147793          	andi	a5,s0,1
    9e70:	fe0784e3          	beqz	a5,9e58 <__pow5mult+0x44>
    9e74:	00048613          	mv	a2,s1
    9e78:	00090593          	mv	a1,s2
    9e7c:	00098513          	mv	a0,s3
    9e80:	d69ff0ef          	jal	9be8 <__multiply>
    9e84:	02090063          	beqz	s2,9ea4 <__pow5mult+0x90>
    9e88:	00492703          	lw	a4,4(s2)
    9e8c:	0449a783          	lw	a5,68(s3)
    9e90:	00271713          	slli	a4,a4,0x2
    9e94:	00e787b3          	add	a5,a5,a4
    9e98:	0007a703          	lw	a4,0(a5)
    9e9c:	00e92023          	sw	a4,0(s2)
    9ea0:	0127a023          	sw	s2,0(a5)
    9ea4:	40145413          	srai	s0,s0,0x1
    9ea8:	00050913          	mv	s2,a0
    9eac:	fa041ae3          	bnez	s0,9e60 <__pow5mult+0x4c>
    9eb0:	01412483          	lw	s1,20(sp)
    9eb4:	01c12083          	lw	ra,28(sp)
    9eb8:	01812403          	lw	s0,24(sp)
    9ebc:	00c12983          	lw	s3,12(sp)
    9ec0:	00090513          	mv	a0,s2
    9ec4:	01012903          	lw	s2,16(sp)
    9ec8:	02010113          	addi	sp,sp,32
    9ecc:	00008067          	ret
    9ed0:	00048613          	mv	a2,s1
    9ed4:	00048593          	mv	a1,s1
    9ed8:	00098513          	mv	a0,s3
    9edc:	d0dff0ef          	jal	9be8 <__multiply>
    9ee0:	00a4a023          	sw	a0,0(s1)
    9ee4:	00052023          	sw	zero,0(a0)
    9ee8:	00050493          	mv	s1,a0
    9eec:	f81ff06f          	j	9e6c <__pow5mult+0x58>
    9ef0:	fff78793          	addi	a5,a5,-1
    9ef4:	78c18713          	addi	a4,gp,1932 # 12f5c <p05.0>
    9ef8:	00279793          	slli	a5,a5,0x2
    9efc:	00f707b3          	add	a5,a4,a5
    9f00:	0007a603          	lw	a2,0(a5)
    9f04:	00000693          	li	a3,0
    9f08:	86dff0ef          	jal	9774 <__multadd>
    9f0c:	00050913          	mv	s2,a0
    9f10:	f2dff06f          	j	9e3c <__pow5mult+0x28>
    9f14:	00100593          	li	a1,1
    9f18:	00098513          	mv	a0,s3
    9f1c:	f80ff0ef          	jal	969c <_Balloc>
    9f20:	00050493          	mv	s1,a0
    9f24:	02050063          	beqz	a0,9f44 <__pow5mult+0x130>
    9f28:	27100793          	li	a5,625
    9f2c:	00f52a23          	sw	a5,20(a0)
    9f30:	00100793          	li	a5,1
    9f34:	00f52823          	sw	a5,16(a0)
    9f38:	04a9a023          	sw	a0,64(s3)
    9f3c:	00052023          	sw	zero,0(a0)
    9f40:	f11ff06f          	j	9e50 <__pow5mult+0x3c>
    9f44:	3f418693          	addi	a3,gp,1012 # 12bc4 <keypad_map+0x64>
    9f48:	00000613          	li	a2,0
    9f4c:	14500593          	li	a1,325
    9f50:	48818513          	addi	a0,gp,1160 # 12c58 <keypad_map+0xf8>
    9f54:	5a0010ef          	jal	b4f4 <__assert_func>

00009f58 <__lshift>:
    9f58:	fe010113          	addi	sp,sp,-32
    9f5c:	01512223          	sw	s5,4(sp)
    9f60:	0105aa83          	lw	s5,16(a1)
    9f64:	0085a783          	lw	a5,8(a1)
    9f68:	01312623          	sw	s3,12(sp)
    9f6c:	40565993          	srai	s3,a2,0x5
    9f70:	01598ab3          	add	s5,s3,s5
    9f74:	00812c23          	sw	s0,24(sp)
    9f78:	00912a23          	sw	s1,20(sp)
    9f7c:	01212823          	sw	s2,16(sp)
    9f80:	01412423          	sw	s4,8(sp)
    9f84:	00112e23          	sw	ra,28(sp)
    9f88:	001a8913          	addi	s2,s5,1
    9f8c:	00058493          	mv	s1,a1
    9f90:	00060413          	mv	s0,a2
    9f94:	0045a583          	lw	a1,4(a1)
    9f98:	00050a13          	mv	s4,a0
    9f9c:	0127d863          	bge	a5,s2,9fac <__lshift+0x54>
    9fa0:	00179793          	slli	a5,a5,0x1
    9fa4:	00158593          	addi	a1,a1,1
    9fa8:	ff27cce3          	blt	a5,s2,9fa0 <__lshift+0x48>
    9fac:	000a0513          	mv	a0,s4
    9fb0:	eecff0ef          	jal	969c <_Balloc>
    9fb4:	10050c63          	beqz	a0,a0cc <__lshift+0x174>
    9fb8:	01450813          	addi	a6,a0,20
    9fbc:	03305463          	blez	s3,9fe4 <__lshift+0x8c>
    9fc0:	00598993          	addi	s3,s3,5
    9fc4:	00299993          	slli	s3,s3,0x2
    9fc8:	01350733          	add	a4,a0,s3
    9fcc:	00080793          	mv	a5,a6
    9fd0:	00478793          	addi	a5,a5,4
    9fd4:	fe07ae23          	sw	zero,-4(a5)
    9fd8:	fee79ce3          	bne	a5,a4,9fd0 <__lshift+0x78>
    9fdc:	fec98993          	addi	s3,s3,-20
    9fe0:	01380833          	add	a6,a6,s3
    9fe4:	0104a883          	lw	a7,16(s1)
    9fe8:	01448793          	addi	a5,s1,20
    9fec:	01f47613          	andi	a2,s0,31
    9ff0:	00289893          	slli	a7,a7,0x2
    9ff4:	011788b3          	add	a7,a5,a7
    9ff8:	0a060463          	beqz	a2,a0a0 <__lshift+0x148>
    9ffc:	02000593          	li	a1,32
    a000:	40c585b3          	sub	a1,a1,a2
    a004:	00080313          	mv	t1,a6
    a008:	00000693          	li	a3,0
    a00c:	0007a703          	lw	a4,0(a5)
    a010:	00430313          	addi	t1,t1,4
    a014:	00478793          	addi	a5,a5,4
    a018:	00c71733          	sll	a4,a4,a2
    a01c:	00d76733          	or	a4,a4,a3
    a020:	fee32e23          	sw	a4,-4(t1)
    a024:	ffc7a683          	lw	a3,-4(a5)
    a028:	00b6d6b3          	srl	a3,a3,a1
    a02c:	ff17e0e3          	bltu	a5,a7,a00c <__lshift+0xb4>
    a030:	01548793          	addi	a5,s1,21
    a034:	00400713          	li	a4,4
    a038:	00f8ea63          	bltu	a7,a5,a04c <__lshift+0xf4>
    a03c:	409887b3          	sub	a5,a7,s1
    a040:	feb78793          	addi	a5,a5,-21
    a044:	ffc7f793          	andi	a5,a5,-4
    a048:	00478713          	addi	a4,a5,4
    a04c:	00e80833          	add	a6,a6,a4
    a050:	00d82023          	sw	a3,0(a6)
    a054:	00069463          	bnez	a3,a05c <__lshift+0x104>
    a058:	000a8913          	mv	s2,s5
    a05c:	0044a703          	lw	a4,4(s1)
    a060:	044a2783          	lw	a5,68(s4)
    a064:	01c12083          	lw	ra,28(sp)
    a068:	00271713          	slli	a4,a4,0x2
    a06c:	00e787b3          	add	a5,a5,a4
    a070:	0007a703          	lw	a4,0(a5)
    a074:	01252823          	sw	s2,16(a0)
    a078:	01812403          	lw	s0,24(sp)
    a07c:	00e4a023          	sw	a4,0(s1)
    a080:	0097a023          	sw	s1,0(a5)
    a084:	01012903          	lw	s2,16(sp)
    a088:	01412483          	lw	s1,20(sp)
    a08c:	00c12983          	lw	s3,12(sp)
    a090:	00812a03          	lw	s4,8(sp)
    a094:	00412a83          	lw	s5,4(sp)
    a098:	02010113          	addi	sp,sp,32
    a09c:	00008067          	ret
    a0a0:	0007a703          	lw	a4,0(a5)
    a0a4:	00478793          	addi	a5,a5,4
    a0a8:	00480813          	addi	a6,a6,4
    a0ac:	fee82e23          	sw	a4,-4(a6)
    a0b0:	fb17f4e3          	bgeu	a5,a7,a058 <__lshift+0x100>
    a0b4:	0007a703          	lw	a4,0(a5)
    a0b8:	00478793          	addi	a5,a5,4
    a0bc:	00480813          	addi	a6,a6,4
    a0c0:	fee82e23          	sw	a4,-4(a6)
    a0c4:	fd17eee3          	bltu	a5,a7,a0a0 <__lshift+0x148>
    a0c8:	f91ff06f          	j	a058 <__lshift+0x100>
    a0cc:	3f418693          	addi	a3,gp,1012 # 12bc4 <keypad_map+0x64>
    a0d0:	00000613          	li	a2,0
    a0d4:	1de00593          	li	a1,478
    a0d8:	48818513          	addi	a0,gp,1160 # 12c58 <keypad_map+0xf8>
    a0dc:	418010ef          	jal	b4f4 <__assert_func>

0000a0e0 <__mcmp>:
    a0e0:	01052703          	lw	a4,16(a0)
    a0e4:	0105a783          	lw	a5,16(a1)
    a0e8:	00050813          	mv	a6,a0
    a0ec:	40f70533          	sub	a0,a4,a5
    a0f0:	04f71263          	bne	a4,a5,a134 <__mcmp+0x54>
    a0f4:	00279793          	slli	a5,a5,0x2
    a0f8:	01480813          	addi	a6,a6,20
    a0fc:	01458593          	addi	a1,a1,20
    a100:	00f80733          	add	a4,a6,a5
    a104:	00f587b3          	add	a5,a1,a5
    a108:	0080006f          	j	a110 <__mcmp+0x30>
    a10c:	02e87463          	bgeu	a6,a4,a134 <__mcmp+0x54>
    a110:	ffc72603          	lw	a2,-4(a4)
    a114:	ffc7a683          	lw	a3,-4(a5)
    a118:	ffc70713          	addi	a4,a4,-4
    a11c:	ffc78793          	addi	a5,a5,-4
    a120:	fed606e3          	beq	a2,a3,a10c <__mcmp+0x2c>
    a124:	00100513          	li	a0,1
    a128:	00d67663          	bgeu	a2,a3,a134 <__mcmp+0x54>
    a12c:	fff00513          	li	a0,-1
    a130:	00008067          	ret
    a134:	00008067          	ret

0000a138 <__mdiff>:
    a138:	0105a703          	lw	a4,16(a1)
    a13c:	01062783          	lw	a5,16(a2)
    a140:	ff010113          	addi	sp,sp,-16
    a144:	00812423          	sw	s0,8(sp)
    a148:	00912223          	sw	s1,4(sp)
    a14c:	00112623          	sw	ra,12(sp)
    a150:	01212023          	sw	s2,0(sp)
    a154:	00058413          	mv	s0,a1
    a158:	00060493          	mv	s1,a2
    a15c:	40f706b3          	sub	a3,a4,a5
    a160:	18f71e63          	bne	a4,a5,a2fc <__mdiff+0x1c4>
    a164:	00279693          	slli	a3,a5,0x2
    a168:	01458613          	addi	a2,a1,20
    a16c:	01448713          	addi	a4,s1,20
    a170:	00d607b3          	add	a5,a2,a3
    a174:	00d70733          	add	a4,a4,a3
    a178:	0080006f          	j	a180 <__mdiff+0x48>
    a17c:	18f67c63          	bgeu	a2,a5,a314 <__mdiff+0x1dc>
    a180:	ffc7a583          	lw	a1,-4(a5)
    a184:	ffc72683          	lw	a3,-4(a4)
    a188:	ffc78793          	addi	a5,a5,-4
    a18c:	ffc70713          	addi	a4,a4,-4
    a190:	fed586e3          	beq	a1,a3,a17c <__mdiff+0x44>
    a194:	00100913          	li	s2,1
    a198:	00d5ea63          	bltu	a1,a3,a1ac <__mdiff+0x74>
    a19c:	00048793          	mv	a5,s1
    a1a0:	00000913          	li	s2,0
    a1a4:	00040493          	mv	s1,s0
    a1a8:	00078413          	mv	s0,a5
    a1ac:	0044a583          	lw	a1,4(s1)
    a1b0:	cecff0ef          	jal	969c <_Balloc>
    a1b4:	1a050663          	beqz	a0,a360 <__mdiff+0x228>
    a1b8:	0104a883          	lw	a7,16(s1)
    a1bc:	01042283          	lw	t0,16(s0)
    a1c0:	01448f93          	addi	t6,s1,20
    a1c4:	00289313          	slli	t1,a7,0x2
    a1c8:	01440813          	addi	a6,s0,20
    a1cc:	00229293          	slli	t0,t0,0x2
    a1d0:	01450593          	addi	a1,a0,20
    a1d4:	00010e37          	lui	t3,0x10
    a1d8:	01252623          	sw	s2,12(a0)
    a1dc:	006f8333          	add	t1,t6,t1
    a1e0:	005802b3          	add	t0,a6,t0
    a1e4:	00058f13          	mv	t5,a1
    a1e8:	000f8e93          	mv	t4,t6
    a1ec:	00000693          	li	a3,0
    a1f0:	fffe0e13          	addi	t3,t3,-1 # ffff <__multf3+0xd47>
    a1f4:	000ea703          	lw	a4,0(t4)
    a1f8:	00082603          	lw	a2,0(a6)
    a1fc:	004f0f13          	addi	t5,t5,4
    a200:	01c777b3          	and	a5,a4,t3
    a204:	01c673b3          	and	t2,a2,t3
    a208:	407787b3          	sub	a5,a5,t2
    a20c:	00d787b3          	add	a5,a5,a3
    a210:	01075713          	srli	a4,a4,0x10
    a214:	01065613          	srli	a2,a2,0x10
    a218:	4107d693          	srai	a3,a5,0x10
    a21c:	40c70733          	sub	a4,a4,a2
    a220:	00d70733          	add	a4,a4,a3
    a224:	01071693          	slli	a3,a4,0x10
    a228:	01c7f7b3          	and	a5,a5,t3
    a22c:	00d7e7b3          	or	a5,a5,a3
    a230:	00480813          	addi	a6,a6,4
    a234:	feff2e23          	sw	a5,-4(t5)
    a238:	004e8e93          	addi	t4,t4,4
    a23c:	41075693          	srai	a3,a4,0x10
    a240:	fa586ae3          	bltu	a6,t0,a1f4 <__mdiff+0xbc>
    a244:	01540713          	addi	a4,s0,21
    a248:	40828433          	sub	s0,t0,s0
    a24c:	feb40413          	addi	s0,s0,-21
    a250:	00e2b2b3          	sltu	t0,t0,a4
    a254:	0012cf13          	xori	t5,t0,1
    a258:	00245413          	srli	s0,s0,0x2
    a25c:	00400713          	li	a4,4
    a260:	0a028463          	beqz	t0,a308 <__mdiff+0x1d0>
    a264:	00ef8fb3          	add	t6,t6,a4
    a268:	00e58833          	add	a6,a1,a4
    a26c:	00010eb7          	lui	t4,0x10
    a270:	00080e13          	mv	t3,a6
    a274:	000f8613          	mv	a2,t6
    a278:	fffe8e93          	addi	t4,t4,-1 # ffff <__multf3+0xd47>
    a27c:	0c6ff463          	bgeu	t6,t1,a344 <__mdiff+0x20c>
    a280:	00062783          	lw	a5,0(a2)
    a284:	004e0e13          	addi	t3,t3,4
    a288:	00460613          	addi	a2,a2,4
    a28c:	01d7f733          	and	a4,a5,t4
    a290:	00d70733          	add	a4,a4,a3
    a294:	0107d593          	srli	a1,a5,0x10
    a298:	41075713          	srai	a4,a4,0x10
    a29c:	00b70733          	add	a4,a4,a1
    a2a0:	00d787b3          	add	a5,a5,a3
    a2a4:	01d7f7b3          	and	a5,a5,t4
    a2a8:	01071693          	slli	a3,a4,0x10
    a2ac:	00d7e7b3          	or	a5,a5,a3
    a2b0:	fefe2e23          	sw	a5,-4(t3)
    a2b4:	41075693          	srai	a3,a4,0x10
    a2b8:	fc6664e3          	bltu	a2,t1,a280 <__mdiff+0x148>
    a2bc:	fff30313          	addi	t1,t1,-1
    a2c0:	41f30333          	sub	t1,t1,t6
    a2c4:	ffc37313          	andi	t1,t1,-4
    a2c8:	00680733          	add	a4,a6,t1
    a2cc:	00079a63          	bnez	a5,a2e0 <__mdiff+0x1a8>
    a2d0:	ffc72783          	lw	a5,-4(a4)
    a2d4:	fff88893          	addi	a7,a7,-1
    a2d8:	ffc70713          	addi	a4,a4,-4
    a2dc:	fe078ae3          	beqz	a5,a2d0 <__mdiff+0x198>
    a2e0:	00c12083          	lw	ra,12(sp)
    a2e4:	00812403          	lw	s0,8(sp)
    a2e8:	01152823          	sw	a7,16(a0)
    a2ec:	00412483          	lw	s1,4(sp)
    a2f0:	00012903          	lw	s2,0(sp)
    a2f4:	01010113          	addi	sp,sp,16
    a2f8:	00008067          	ret
    a2fc:	00100913          	li	s2,1
    a300:	e806dee3          	bgez	a3,a19c <__mdiff+0x64>
    a304:	ea9ff06f          	j	a1ac <__mdiff+0x74>
    a308:	00140713          	addi	a4,s0,1
    a30c:	00271713          	slli	a4,a4,0x2
    a310:	f55ff06f          	j	a264 <__mdiff+0x12c>
    a314:	00000593          	li	a1,0
    a318:	b84ff0ef          	jal	969c <_Balloc>
    a31c:	04050c63          	beqz	a0,a374 <__mdiff+0x23c>
    a320:	00c12083          	lw	ra,12(sp)
    a324:	00812403          	lw	s0,8(sp)
    a328:	00100793          	li	a5,1
    a32c:	00f52823          	sw	a5,16(a0)
    a330:	00052a23          	sw	zero,20(a0)
    a334:	00412483          	lw	s1,4(sp)
    a338:	00012903          	lw	s2,0(sp)
    a33c:	01010113          	addi	sp,sp,16
    a340:	00008067          	ret
    a344:	00000713          	li	a4,0
    a348:	000f1663          	bnez	t5,a354 <__mdiff+0x21c>
    a34c:	00e58733          	add	a4,a1,a4
    a350:	f7dff06f          	j	a2cc <__mdiff+0x194>
    a354:	00241713          	slli	a4,s0,0x2
    a358:	00e58733          	add	a4,a1,a4
    a35c:	f71ff06f          	j	a2cc <__mdiff+0x194>
    a360:	3f418693          	addi	a3,gp,1012 # 12bc4 <keypad_map+0x64>
    a364:	00000613          	li	a2,0
    a368:	24500593          	li	a1,581
    a36c:	48818513          	addi	a0,gp,1160 # 12c58 <keypad_map+0xf8>
    a370:	184010ef          	jal	b4f4 <__assert_func>
    a374:	3f418693          	addi	a3,gp,1012 # 12bc4 <keypad_map+0x64>
    a378:	00000613          	li	a2,0
    a37c:	23700593          	li	a1,567
    a380:	48818513          	addi	a0,gp,1160 # 12c58 <keypad_map+0xf8>
    a384:	170010ef          	jal	b4f4 <__assert_func>

0000a388 <__ulp>:
    a388:	7ff007b7          	lui	a5,0x7ff00
    a38c:	00b7f5b3          	and	a1,a5,a1
    a390:	fcc007b7          	lui	a5,0xfcc00
    a394:	00f585b3          	add	a1,a1,a5
    a398:	00000793          	li	a5,0
    a39c:	00b05663          	blez	a1,a3a8 <__ulp+0x20>
    a3a0:	00078513          	mv	a0,a5
    a3a4:	00008067          	ret
    a3a8:	40b005b3          	neg	a1,a1
    a3ac:	4145d593          	srai	a1,a1,0x14
    a3b0:	01300793          	li	a5,19
    a3b4:	00b7cc63          	blt	a5,a1,a3cc <__ulp+0x44>
    a3b8:	000807b7          	lui	a5,0x80
    a3bc:	40b7d5b3          	sra	a1,a5,a1
    a3c0:	00000793          	li	a5,0
    a3c4:	00078513          	mv	a0,a5
    a3c8:	00008067          	ret
    a3cc:	fec58593          	addi	a1,a1,-20
    a3d0:	01e00713          	li	a4,30
    a3d4:	00100793          	li	a5,1
    a3d8:	00b74663          	blt	a4,a1,a3e4 <__ulp+0x5c>
    a3dc:	800007b7          	lui	a5,0x80000
    a3e0:	00b7d7b3          	srl	a5,a5,a1
    a3e4:	00000593          	li	a1,0
    a3e8:	00078513          	mv	a0,a5
    a3ec:	00008067          	ret

0000a3f0 <__b2d>:
    a3f0:	fe010113          	addi	sp,sp,-32
    a3f4:	00912a23          	sw	s1,20(sp)
    a3f8:	01052483          	lw	s1,16(a0)
    a3fc:	00812c23          	sw	s0,24(sp)
    a400:	01450413          	addi	s0,a0,20
    a404:	00249493          	slli	s1,s1,0x2
    a408:	009404b3          	add	s1,s0,s1
    a40c:	01212823          	sw	s2,16(sp)
    a410:	ffc4a903          	lw	s2,-4(s1)
    a414:	01312623          	sw	s3,12(sp)
    a418:	01412423          	sw	s4,8(sp)
    a41c:	00090513          	mv	a0,s2
    a420:	00058993          	mv	s3,a1
    a424:	00112e23          	sw	ra,28(sp)
    a428:	dc0ff0ef          	jal	99e8 <__hi0bits>
    a42c:	02000713          	li	a4,32
    a430:	40a707b3          	sub	a5,a4,a0
    a434:	00f9a023          	sw	a5,0(s3)
    a438:	00a00793          	li	a5,10
    a43c:	ffc48a13          	addi	s4,s1,-4
    a440:	08a7dc63          	bge	a5,a0,a4d8 <__b2d+0xe8>
    a444:	ff550613          	addi	a2,a0,-11
    a448:	05447063          	bgeu	s0,s4,a488 <__b2d+0x98>
    a44c:	ff84a783          	lw	a5,-8(s1)
    a450:	04060c63          	beqz	a2,a4a8 <__b2d+0xb8>
    a454:	40c706b3          	sub	a3,a4,a2
    a458:	00d7d733          	srl	a4,a5,a3
    a45c:	00c91933          	sll	s2,s2,a2
    a460:	00e96933          	or	s2,s2,a4
    a464:	ff848593          	addi	a1,s1,-8
    a468:	3ff00737          	lui	a4,0x3ff00
    a46c:	00e96733          	or	a4,s2,a4
    a470:	00c797b3          	sll	a5,a5,a2
    a474:	02b47e63          	bgeu	s0,a1,a4b0 <__b2d+0xc0>
    a478:	ff44a603          	lw	a2,-12(s1)
    a47c:	00d656b3          	srl	a3,a2,a3
    a480:	00d7e7b3          	or	a5,a5,a3
    a484:	02c0006f          	j	a4b0 <__b2d+0xc0>
    a488:	00b00793          	li	a5,11
    a48c:	00f50c63          	beq	a0,a5,a4a4 <__b2d+0xb4>
    a490:	00c91933          	sll	s2,s2,a2
    a494:	3ff00737          	lui	a4,0x3ff00
    a498:	00e96733          	or	a4,s2,a4
    a49c:	00000793          	li	a5,0
    a4a0:	0100006f          	j	a4b0 <__b2d+0xc0>
    a4a4:	00000793          	li	a5,0
    a4a8:	3ff00737          	lui	a4,0x3ff00
    a4ac:	00e96733          	or	a4,s2,a4
    a4b0:	01c12083          	lw	ra,28(sp)
    a4b4:	01812403          	lw	s0,24(sp)
    a4b8:	01412483          	lw	s1,20(sp)
    a4bc:	01012903          	lw	s2,16(sp)
    a4c0:	00c12983          	lw	s3,12(sp)
    a4c4:	00812a03          	lw	s4,8(sp)
    a4c8:	00078513          	mv	a0,a5
    a4cc:	00070593          	mv	a1,a4
    a4d0:	02010113          	addi	sp,sp,32
    a4d4:	00008067          	ret
    a4d8:	00b00693          	li	a3,11
    a4dc:	40a686b3          	sub	a3,a3,a0
    a4e0:	3ff007b7          	lui	a5,0x3ff00
    a4e4:	00d95733          	srl	a4,s2,a3
    a4e8:	00f76733          	or	a4,a4,a5
    a4ec:	00000793          	li	a5,0
    a4f0:	01447663          	bgeu	s0,s4,a4fc <__b2d+0x10c>
    a4f4:	ff84a783          	lw	a5,-8(s1)
    a4f8:	00d7d7b3          	srl	a5,a5,a3
    a4fc:	01550513          	addi	a0,a0,21
    a500:	00a91933          	sll	s2,s2,a0
    a504:	00f967b3          	or	a5,s2,a5
    a508:	fa9ff06f          	j	a4b0 <__b2d+0xc0>

0000a50c <__d2b>:
    a50c:	fd010113          	addi	sp,sp,-48
    a510:	01512a23          	sw	s5,20(sp)
    a514:	00058a93          	mv	s5,a1
    a518:	00100593          	li	a1,1
    a51c:	02912223          	sw	s1,36(sp)
    a520:	01312e23          	sw	s3,28(sp)
    a524:	01412c23          	sw	s4,24(sp)
    a528:	02112623          	sw	ra,44(sp)
    a52c:	02812423          	sw	s0,40(sp)
    a530:	03212023          	sw	s2,32(sp)
    a534:	00060493          	mv	s1,a2
    a538:	00068a13          	mv	s4,a3
    a53c:	00070993          	mv	s3,a4
    a540:	95cff0ef          	jal	969c <_Balloc>
    a544:	10050263          	beqz	a0,a648 <__d2b+0x13c>
    a548:	00100737          	lui	a4,0x100
    a54c:	0144d913          	srli	s2,s1,0x14
    a550:	fff70793          	addi	a5,a4,-1 # fffff <_memory_end+0xdffff>
    a554:	7ff97913          	andi	s2,s2,2047
    a558:	00050413          	mv	s0,a0
    a55c:	0097f7b3          	and	a5,a5,s1
    a560:	00090463          	beqz	s2,a568 <__d2b+0x5c>
    a564:	00e7e7b3          	or	a5,a5,a4
    a568:	00f12623          	sw	a5,12(sp)
    a56c:	060a9263          	bnez	s5,a5d0 <__d2b+0xc4>
    a570:	00c10513          	addi	a0,sp,12
    a574:	cecff0ef          	jal	9a60 <__lo0bits>
    a578:	00c12703          	lw	a4,12(sp)
    a57c:	00100493          	li	s1,1
    a580:	00942823          	sw	s1,16(s0)
    a584:	00e42a23          	sw	a4,20(s0)
    a588:	02050793          	addi	a5,a0,32
    a58c:	08090863          	beqz	s2,a61c <__d2b+0x110>
    a590:	bcd90913          	addi	s2,s2,-1075
    a594:	00f90933          	add	s2,s2,a5
    a598:	03500493          	li	s1,53
    a59c:	012a2023          	sw	s2,0(s4)
    a5a0:	40f48533          	sub	a0,s1,a5
    a5a4:	00a9a023          	sw	a0,0(s3)
    a5a8:	02c12083          	lw	ra,44(sp)
    a5ac:	00040513          	mv	a0,s0
    a5b0:	02812403          	lw	s0,40(sp)
    a5b4:	02412483          	lw	s1,36(sp)
    a5b8:	02012903          	lw	s2,32(sp)
    a5bc:	01c12983          	lw	s3,28(sp)
    a5c0:	01812a03          	lw	s4,24(sp)
    a5c4:	01412a83          	lw	s5,20(sp)
    a5c8:	03010113          	addi	sp,sp,48
    a5cc:	00008067          	ret
    a5d0:	00810513          	addi	a0,sp,8
    a5d4:	01512423          	sw	s5,8(sp)
    a5d8:	c88ff0ef          	jal	9a60 <__lo0bits>
    a5dc:	00c12703          	lw	a4,12(sp)
    a5e0:	00050793          	mv	a5,a0
    a5e4:	04050e63          	beqz	a0,a640 <__d2b+0x134>
    a5e8:	00812603          	lw	a2,8(sp)
    a5ec:	02000693          	li	a3,32
    a5f0:	40a686b3          	sub	a3,a3,a0
    a5f4:	00d716b3          	sll	a3,a4,a3
    a5f8:	00a75733          	srl	a4,a4,a0
    a5fc:	00c6e6b3          	or	a3,a3,a2
    a600:	00e12623          	sw	a4,12(sp)
    a604:	00e034b3          	snez	s1,a4
    a608:	00148493          	addi	s1,s1,1
    a60c:	00d42a23          	sw	a3,20(s0)
    a610:	00e42c23          	sw	a4,24(s0)
    a614:	00942823          	sw	s1,16(s0)
    a618:	f6091ce3          	bnez	s2,a590 <__d2b+0x84>
    a61c:	00249713          	slli	a4,s1,0x2
    a620:	00e40733          	add	a4,s0,a4
    a624:	01072503          	lw	a0,16(a4)
    a628:	bce78793          	addi	a5,a5,-1074 # 3feffbce <_memory_end+0x3fedfbce>
    a62c:	00fa2023          	sw	a5,0(s4)
    a630:	bb8ff0ef          	jal	99e8 <__hi0bits>
    a634:	00549493          	slli	s1,s1,0x5
    a638:	40a48533          	sub	a0,s1,a0
    a63c:	f69ff06f          	j	a5a4 <__d2b+0x98>
    a640:	00812683          	lw	a3,8(sp)
    a644:	fc1ff06f          	j	a604 <__d2b+0xf8>
    a648:	3f418693          	addi	a3,gp,1012 # 12bc4 <keypad_map+0x64>
    a64c:	00000613          	li	a2,0
    a650:	30f00593          	li	a1,783
    a654:	48818513          	addi	a0,gp,1160 # 12c58 <keypad_map+0xf8>
    a658:	69d000ef          	jal	b4f4 <__assert_func>

0000a65c <__ratio>:
    a65c:	fd010113          	addi	sp,sp,-48
    a660:	03212023          	sw	s2,32(sp)
    a664:	00058913          	mv	s2,a1
    a668:	00810593          	addi	a1,sp,8
    a66c:	02112623          	sw	ra,44(sp)
    a670:	02812423          	sw	s0,40(sp)
    a674:	02912223          	sw	s1,36(sp)
    a678:	01312e23          	sw	s3,28(sp)
    a67c:	00050993          	mv	s3,a0
    a680:	d71ff0ef          	jal	a3f0 <__b2d>
    a684:	00050493          	mv	s1,a0
    a688:	00058413          	mv	s0,a1
    a68c:	00090513          	mv	a0,s2
    a690:	00c10593          	addi	a1,sp,12
    a694:	d5dff0ef          	jal	a3f0 <__b2d>
    a698:	01092703          	lw	a4,16(s2)
    a69c:	0109a783          	lw	a5,16(s3)
    a6a0:	00c12683          	lw	a3,12(sp)
    a6a4:	40e787b3          	sub	a5,a5,a4
    a6a8:	00812703          	lw	a4,8(sp)
    a6ac:	00579793          	slli	a5,a5,0x5
    a6b0:	40d70733          	sub	a4,a4,a3
    a6b4:	00e787b3          	add	a5,a5,a4
    a6b8:	00050713          	mv	a4,a0
    a6bc:	02f05e63          	blez	a5,a6f8 <__ratio+0x9c>
    a6c0:	01479793          	slli	a5,a5,0x14
    a6c4:	00878433          	add	s0,a5,s0
    a6c8:	00058693          	mv	a3,a1
    a6cc:	00048513          	mv	a0,s1
    a6d0:	00040593          	mv	a1,s0
    a6d4:	00070613          	mv	a2,a4
    a6d8:	054030ef          	jal	d72c <__divdf3>
    a6dc:	02c12083          	lw	ra,44(sp)
    a6e0:	02812403          	lw	s0,40(sp)
    a6e4:	02412483          	lw	s1,36(sp)
    a6e8:	02012903          	lw	s2,32(sp)
    a6ec:	01c12983          	lw	s3,28(sp)
    a6f0:	03010113          	addi	sp,sp,48
    a6f4:	00008067          	ret
    a6f8:	01479793          	slli	a5,a5,0x14
    a6fc:	40f585b3          	sub	a1,a1,a5
    a700:	fc9ff06f          	j	a6c8 <__ratio+0x6c>

0000a704 <_mprec_log10>:
    a704:	ff010113          	addi	sp,sp,-16
    a708:	01212023          	sw	s2,0(sp)
    a70c:	00112623          	sw	ra,12(sp)
    a710:	01700793          	li	a5,23
    a714:	00050913          	mv	s2,a0
    a718:	04a7de63          	bge	a5,a0,a774 <_mprec_log10+0x70>
    a71c:	00013737          	lui	a4,0x13
    a720:	48072783          	lw	a5,1152(a4) # 13480 <__clz_tab+0x134>
    a724:	48472583          	lw	a1,1156(a4)
    a728:	00013737          	lui	a4,0x13
    a72c:	00812423          	sw	s0,8(sp)
    a730:	00912223          	sw	s1,4(sp)
    a734:	48872403          	lw	s0,1160(a4) # 13488 <__clz_tab+0x13c>
    a738:	48c72483          	lw	s1,1164(a4)
    a73c:	00078513          	mv	a0,a5
    a740:	00040613          	mv	a2,s0
    a744:	00048693          	mv	a3,s1
    a748:	105030ef          	jal	e04c <__muldf3>
    a74c:	fff90913          	addi	s2,s2,-1
    a750:	00050793          	mv	a5,a0
    a754:	fe0914e3          	bnez	s2,a73c <_mprec_log10+0x38>
    a758:	00812403          	lw	s0,8(sp)
    a75c:	00c12083          	lw	ra,12(sp)
    a760:	00412483          	lw	s1,4(sp)
    a764:	00012903          	lw	s2,0(sp)
    a768:	00078513          	mv	a0,a5
    a76c:	01010113          	addi	sp,sp,16
    a770:	00008067          	ret
    a774:	00013737          	lui	a4,0x13
    a778:	00351913          	slli	s2,a0,0x3
    a77c:	fb870713          	addi	a4,a4,-72 # 12fb8 <__mprec_tens>
    a780:	01270733          	add	a4,a4,s2
    a784:	00072783          	lw	a5,0(a4)
    a788:	00c12083          	lw	ra,12(sp)
    a78c:	00472583          	lw	a1,4(a4)
    a790:	00012903          	lw	s2,0(sp)
    a794:	00078513          	mv	a0,a5
    a798:	01010113          	addi	sp,sp,16
    a79c:	00008067          	ret

0000a7a0 <__copybits>:
    a7a0:	01062683          	lw	a3,16(a2)
    a7a4:	fff58593          	addi	a1,a1,-1
    a7a8:	4055d593          	srai	a1,a1,0x5
    a7ac:	00158593          	addi	a1,a1,1
    a7b0:	01460793          	addi	a5,a2,20
    a7b4:	00269693          	slli	a3,a3,0x2
    a7b8:	00259593          	slli	a1,a1,0x2
    a7bc:	00d786b3          	add	a3,a5,a3
    a7c0:	00b505b3          	add	a1,a0,a1
    a7c4:	02d7f863          	bgeu	a5,a3,a7f4 <__copybits+0x54>
    a7c8:	00050713          	mv	a4,a0
    a7cc:	0007a803          	lw	a6,0(a5)
    a7d0:	00478793          	addi	a5,a5,4
    a7d4:	00470713          	addi	a4,a4,4
    a7d8:	ff072e23          	sw	a6,-4(a4)
    a7dc:	fed7e8e3          	bltu	a5,a3,a7cc <__copybits+0x2c>
    a7e0:	40c687b3          	sub	a5,a3,a2
    a7e4:	feb78793          	addi	a5,a5,-21
    a7e8:	ffc7f793          	andi	a5,a5,-4
    a7ec:	00478793          	addi	a5,a5,4
    a7f0:	00f50533          	add	a0,a0,a5
    a7f4:	00b57863          	bgeu	a0,a1,a804 <__copybits+0x64>
    a7f8:	00450513          	addi	a0,a0,4
    a7fc:	fe052e23          	sw	zero,-4(a0)
    a800:	feb56ce3          	bltu	a0,a1,a7f8 <__copybits+0x58>
    a804:	00008067          	ret

0000a808 <__any_on>:
    a808:	01052703          	lw	a4,16(a0)
    a80c:	4055d613          	srai	a2,a1,0x5
    a810:	01450693          	addi	a3,a0,20
    a814:	02c75263          	bge	a4,a2,a838 <__any_on+0x30>
    a818:	00271713          	slli	a4,a4,0x2
    a81c:	00e687b3          	add	a5,a3,a4
    a820:	04f6f263          	bgeu	a3,a5,a864 <__any_on+0x5c>
    a824:	ffc7a703          	lw	a4,-4(a5)
    a828:	ffc78793          	addi	a5,a5,-4
    a82c:	fe070ae3          	beqz	a4,a820 <__any_on+0x18>
    a830:	00100513          	li	a0,1
    a834:	00008067          	ret
    a838:	00261793          	slli	a5,a2,0x2
    a83c:	00f687b3          	add	a5,a3,a5
    a840:	fee650e3          	bge	a2,a4,a820 <__any_on+0x18>
    a844:	01f5f593          	andi	a1,a1,31
    a848:	fc058ce3          	beqz	a1,a820 <__any_on+0x18>
    a84c:	0007a603          	lw	a2,0(a5)
    a850:	00100513          	li	a0,1
    a854:	00b65733          	srl	a4,a2,a1
    a858:	00b71733          	sll	a4,a4,a1
    a85c:	fce602e3          	beq	a2,a4,a820 <__any_on+0x18>
    a860:	00008067          	ret
    a864:	00000513          	li	a0,0
    a868:	00008067          	ret

0000a86c <_realloc_r>:
    a86c:	fd010113          	addi	sp,sp,-48
    a870:	02912223          	sw	s1,36(sp)
    a874:	02112623          	sw	ra,44(sp)
    a878:	00060493          	mv	s1,a2
    a87c:	1e058863          	beqz	a1,aa6c <_realloc_r+0x200>
    a880:	02812423          	sw	s0,40(sp)
    a884:	03212023          	sw	s2,32(sp)
    a888:	00058413          	mv	s0,a1
    a88c:	01312e23          	sw	s3,28(sp)
    a890:	01512a23          	sw	s5,20(sp)
    a894:	01412c23          	sw	s4,24(sp)
    a898:	00050913          	mv	s2,a0
    a89c:	df9fe0ef          	jal	9694 <__malloc_lock>
    a8a0:	ffc42703          	lw	a4,-4(s0)
    a8a4:	00b48793          	addi	a5,s1,11
    a8a8:	01600693          	li	a3,22
    a8ac:	ff840a93          	addi	s5,s0,-8
    a8b0:	ffc77993          	andi	s3,a4,-4
    a8b4:	10f6f263          	bgeu	a3,a5,a9b8 <_realloc_r+0x14c>
    a8b8:	ff87fa13          	andi	s4,a5,-8
    a8bc:	1007c263          	bltz	a5,a9c0 <_realloc_r+0x154>
    a8c0:	109a6063          	bltu	s4,s1,a9c0 <_realloc_r+0x154>
    a8c4:	1349d263          	bge	s3,s4,a9e8 <_realloc_r+0x17c>
    a8c8:	000137b7          	lui	a5,0x13
    a8cc:	01812423          	sw	s8,8(sp)
    a8d0:	5ec78c13          	addi	s8,a5,1516 # 135ec <__malloc_av_>
    a8d4:	008c2603          	lw	a2,8(s8)
    a8d8:	013a86b3          	add	a3,s5,s3
    a8dc:	0046a783          	lw	a5,4(a3)
    a8e0:	1cd60863          	beq	a2,a3,aab0 <_realloc_r+0x244>
    a8e4:	ffe7f613          	andi	a2,a5,-2
    a8e8:	00c68633          	add	a2,a3,a2
    a8ec:	00462603          	lw	a2,4(a2)
    a8f0:	00167613          	andi	a2,a2,1
    a8f4:	14061a63          	bnez	a2,aa48 <_realloc_r+0x1dc>
    a8f8:	ffc7f793          	andi	a5,a5,-4
    a8fc:	00f98633          	add	a2,s3,a5
    a900:	0d465863          	bge	a2,s4,a9d0 <_realloc_r+0x164>
    a904:	00177713          	andi	a4,a4,1
    a908:	02071c63          	bnez	a4,a940 <_realloc_r+0xd4>
    a90c:	01712623          	sw	s7,12(sp)
    a910:	ff842b83          	lw	s7,-8(s0)
    a914:	01612823          	sw	s6,16(sp)
    a918:	417a8bb3          	sub	s7,s5,s7
    a91c:	004ba703          	lw	a4,4(s7)
    a920:	ffc77713          	andi	a4,a4,-4
    a924:	00e787b3          	add	a5,a5,a4
    a928:	01378b33          	add	s6,a5,s3
    a92c:	334b5c63          	bge	s6,s4,ac64 <_realloc_r+0x3f8>
    a930:	00e98b33          	add	s6,s3,a4
    a934:	294b5863          	bge	s6,s4,abc4 <_realloc_r+0x358>
    a938:	01012b03          	lw	s6,16(sp)
    a93c:	00c12b83          	lw	s7,12(sp)
    a940:	00048593          	mv	a1,s1
    a944:	00090513          	mv	a0,s2
    a948:	d78fe0ef          	jal	8ec0 <_malloc_r>
    a94c:	00050493          	mv	s1,a0
    a950:	40050863          	beqz	a0,ad60 <_realloc_r+0x4f4>
    a954:	ffc42783          	lw	a5,-4(s0)
    a958:	ff850713          	addi	a4,a0,-8
    a95c:	ffe7f793          	andi	a5,a5,-2
    a960:	00fa87b3          	add	a5,s5,a5
    a964:	24e78663          	beq	a5,a4,abb0 <_realloc_r+0x344>
    a968:	ffc98613          	addi	a2,s3,-4
    a96c:	02400793          	li	a5,36
    a970:	2ec7e463          	bltu	a5,a2,ac58 <_realloc_r+0x3ec>
    a974:	01300713          	li	a4,19
    a978:	20c76a63          	bltu	a4,a2,ab8c <_realloc_r+0x320>
    a97c:	00050793          	mv	a5,a0
    a980:	00040713          	mv	a4,s0
    a984:	00072683          	lw	a3,0(a4)
    a988:	00d7a023          	sw	a3,0(a5)
    a98c:	00472683          	lw	a3,4(a4)
    a990:	00d7a223          	sw	a3,4(a5)
    a994:	00872703          	lw	a4,8(a4)
    a998:	00e7a423          	sw	a4,8(a5)
    a99c:	00040593          	mv	a1,s0
    a9a0:	00090513          	mv	a0,s2
    a9a4:	e09fb0ef          	jal	67ac <_free_r>
    a9a8:	00090513          	mv	a0,s2
    a9ac:	cedfe0ef          	jal	9698 <__malloc_unlock>
    a9b0:	00812c03          	lw	s8,8(sp)
    a9b4:	06c0006f          	j	aa20 <_realloc_r+0x1b4>
    a9b8:	01000a13          	li	s4,16
    a9bc:	f09a74e3          	bgeu	s4,s1,a8c4 <_realloc_r+0x58>
    a9c0:	00c00793          	li	a5,12
    a9c4:	00f92023          	sw	a5,0(s2)
    a9c8:	00000493          	li	s1,0
    a9cc:	0540006f          	j	aa20 <_realloc_r+0x1b4>
    a9d0:	00c6a783          	lw	a5,12(a3)
    a9d4:	0086a703          	lw	a4,8(a3)
    a9d8:	00812c03          	lw	s8,8(sp)
    a9dc:	00060993          	mv	s3,a2
    a9e0:	00f72623          	sw	a5,12(a4)
    a9e4:	00e7a423          	sw	a4,8(a5)
    a9e8:	004aa783          	lw	a5,4(s5)
    a9ec:	414986b3          	sub	a3,s3,s4
    a9f0:	00f00613          	li	a2,15
    a9f4:	0017f793          	andi	a5,a5,1
    a9f8:	013a8733          	add	a4,s5,s3
    a9fc:	08d66263          	bltu	a2,a3,aa80 <_realloc_r+0x214>
    aa00:	0137e7b3          	or	a5,a5,s3
    aa04:	00faa223          	sw	a5,4(s5)
    aa08:	00472783          	lw	a5,4(a4)
    aa0c:	0017e793          	ori	a5,a5,1
    aa10:	00f72223          	sw	a5,4(a4)
    aa14:	00090513          	mv	a0,s2
    aa18:	c81fe0ef          	jal	9698 <__malloc_unlock>
    aa1c:	00040493          	mv	s1,s0
    aa20:	02812403          	lw	s0,40(sp)
    aa24:	02c12083          	lw	ra,44(sp)
    aa28:	02012903          	lw	s2,32(sp)
    aa2c:	01c12983          	lw	s3,28(sp)
    aa30:	01812a03          	lw	s4,24(sp)
    aa34:	01412a83          	lw	s5,20(sp)
    aa38:	00048513          	mv	a0,s1
    aa3c:	02412483          	lw	s1,36(sp)
    aa40:	03010113          	addi	sp,sp,48
    aa44:	00008067          	ret
    aa48:	00177713          	andi	a4,a4,1
    aa4c:	ee071ae3          	bnez	a4,a940 <_realloc_r+0xd4>
    aa50:	01712623          	sw	s7,12(sp)
    aa54:	ff842b83          	lw	s7,-8(s0)
    aa58:	01612823          	sw	s6,16(sp)
    aa5c:	417a8bb3          	sub	s7,s5,s7
    aa60:	004ba703          	lw	a4,4(s7)
    aa64:	ffc77713          	andi	a4,a4,-4
    aa68:	ec9ff06f          	j	a930 <_realloc_r+0xc4>
    aa6c:	02c12083          	lw	ra,44(sp)
    aa70:	02412483          	lw	s1,36(sp)
    aa74:	00060593          	mv	a1,a2
    aa78:	03010113          	addi	sp,sp,48
    aa7c:	c44fe06f          	j	8ec0 <_malloc_r>
    aa80:	0147e7b3          	or	a5,a5,s4
    aa84:	00faa223          	sw	a5,4(s5)
    aa88:	014a85b3          	add	a1,s5,s4
    aa8c:	0016e693          	ori	a3,a3,1
    aa90:	00d5a223          	sw	a3,4(a1)
    aa94:	00472783          	lw	a5,4(a4)
    aa98:	00858593          	addi	a1,a1,8
    aa9c:	00090513          	mv	a0,s2
    aaa0:	0017e793          	ori	a5,a5,1
    aaa4:	00f72223          	sw	a5,4(a4)
    aaa8:	d05fb0ef          	jal	67ac <_free_r>
    aaac:	f69ff06f          	j	aa14 <_realloc_r+0x1a8>
    aab0:	ffc7f793          	andi	a5,a5,-4
    aab4:	013786b3          	add	a3,a5,s3
    aab8:	010a0613          	addi	a2,s4,16
    aabc:	26c6d063          	bge	a3,a2,ad1c <_realloc_r+0x4b0>
    aac0:	00177713          	andi	a4,a4,1
    aac4:	e6071ee3          	bnez	a4,a940 <_realloc_r+0xd4>
    aac8:	01712623          	sw	s7,12(sp)
    aacc:	ff842b83          	lw	s7,-8(s0)
    aad0:	01612823          	sw	s6,16(sp)
    aad4:	417a8bb3          	sub	s7,s5,s7
    aad8:	004ba703          	lw	a4,4(s7)
    aadc:	ffc77713          	andi	a4,a4,-4
    aae0:	00e787b3          	add	a5,a5,a4
    aae4:	01378b33          	add	s6,a5,s3
    aae8:	e4cb44e3          	blt	s6,a2,a930 <_realloc_r+0xc4>
    aaec:	00cba783          	lw	a5,12(s7)
    aaf0:	008ba703          	lw	a4,8(s7)
    aaf4:	ffc98613          	addi	a2,s3,-4
    aaf8:	02400693          	li	a3,36
    aafc:	00f72623          	sw	a5,12(a4)
    ab00:	00e7a423          	sw	a4,8(a5)
    ab04:	008b8493          	addi	s1,s7,8
    ab08:	28c6e463          	bltu	a3,a2,ad90 <_realloc_r+0x524>
    ab0c:	01300713          	li	a4,19
    ab10:	00048793          	mv	a5,s1
    ab14:	02c77263          	bgeu	a4,a2,ab38 <_realloc_r+0x2cc>
    ab18:	00042703          	lw	a4,0(s0)
    ab1c:	01b00793          	li	a5,27
    ab20:	00eba423          	sw	a4,8(s7)
    ab24:	00442703          	lw	a4,4(s0)
    ab28:	00eba623          	sw	a4,12(s7)
    ab2c:	26c7ea63          	bltu	a5,a2,ada0 <_realloc_r+0x534>
    ab30:	00840413          	addi	s0,s0,8
    ab34:	010b8793          	addi	a5,s7,16
    ab38:	00042703          	lw	a4,0(s0)
    ab3c:	00e7a023          	sw	a4,0(a5)
    ab40:	00442703          	lw	a4,4(s0)
    ab44:	00e7a223          	sw	a4,4(a5)
    ab48:	00842703          	lw	a4,8(s0)
    ab4c:	00e7a423          	sw	a4,8(a5)
    ab50:	014b8733          	add	a4,s7,s4
    ab54:	414b0b33          	sub	s6,s6,s4
    ab58:	00ec2423          	sw	a4,8(s8)
    ab5c:	001b6793          	ori	a5,s6,1
    ab60:	00f72223          	sw	a5,4(a4)
    ab64:	004ba783          	lw	a5,4(s7)
    ab68:	00090513          	mv	a0,s2
    ab6c:	0017f793          	andi	a5,a5,1
    ab70:	0147e7b3          	or	a5,a5,s4
    ab74:	00fba223          	sw	a5,4(s7)
    ab78:	b21fe0ef          	jal	9698 <__malloc_unlock>
    ab7c:	01012b03          	lw	s6,16(sp)
    ab80:	00c12b83          	lw	s7,12(sp)
    ab84:	00812c03          	lw	s8,8(sp)
    ab88:	e99ff06f          	j	aa20 <_realloc_r+0x1b4>
    ab8c:	00042683          	lw	a3,0(s0)
    ab90:	01b00713          	li	a4,27
    ab94:	00d52023          	sw	a3,0(a0)
    ab98:	00442683          	lw	a3,4(s0)
    ab9c:	00d52223          	sw	a3,4(a0)
    aba0:	14c76e63          	bltu	a4,a2,acfc <_realloc_r+0x490>
    aba4:	00840713          	addi	a4,s0,8
    aba8:	00850793          	addi	a5,a0,8
    abac:	dd9ff06f          	j	a984 <_realloc_r+0x118>
    abb0:	ffc52783          	lw	a5,-4(a0)
    abb4:	00812c03          	lw	s8,8(sp)
    abb8:	ffc7f793          	andi	a5,a5,-4
    abbc:	00f989b3          	add	s3,s3,a5
    abc0:	e29ff06f          	j	a9e8 <_realloc_r+0x17c>
    abc4:	00cba783          	lw	a5,12(s7)
    abc8:	008ba703          	lw	a4,8(s7)
    abcc:	ffc98613          	addi	a2,s3,-4
    abd0:	02400693          	li	a3,36
    abd4:	00f72623          	sw	a5,12(a4)
    abd8:	00e7a423          	sw	a4,8(a5)
    abdc:	008b8493          	addi	s1,s7,8
    abe0:	10c6e663          	bltu	a3,a2,acec <_realloc_r+0x480>
    abe4:	01300713          	li	a4,19
    abe8:	00048793          	mv	a5,s1
    abec:	02c77c63          	bgeu	a4,a2,ac24 <_realloc_r+0x3b8>
    abf0:	00042703          	lw	a4,0(s0)
    abf4:	01b00793          	li	a5,27
    abf8:	00eba423          	sw	a4,8(s7)
    abfc:	00442703          	lw	a4,4(s0)
    ac00:	00eba623          	sw	a4,12(s7)
    ac04:	14c7f863          	bgeu	a5,a2,ad54 <_realloc_r+0x4e8>
    ac08:	00842783          	lw	a5,8(s0)
    ac0c:	00fba823          	sw	a5,16(s7)
    ac10:	00c42783          	lw	a5,12(s0)
    ac14:	00fbaa23          	sw	a5,20(s7)
    ac18:	0ad60c63          	beq	a2,a3,acd0 <_realloc_r+0x464>
    ac1c:	01040413          	addi	s0,s0,16
    ac20:	018b8793          	addi	a5,s7,24
    ac24:	00042703          	lw	a4,0(s0)
    ac28:	00e7a023          	sw	a4,0(a5)
    ac2c:	00442703          	lw	a4,4(s0)
    ac30:	00e7a223          	sw	a4,4(a5)
    ac34:	00842703          	lw	a4,8(s0)
    ac38:	00e7a423          	sw	a4,8(a5)
    ac3c:	000b0993          	mv	s3,s6
    ac40:	000b8a93          	mv	s5,s7
    ac44:	01012b03          	lw	s6,16(sp)
    ac48:	00c12b83          	lw	s7,12(sp)
    ac4c:	00812c03          	lw	s8,8(sp)
    ac50:	00048413          	mv	s0,s1
    ac54:	d95ff06f          	j	a9e8 <_realloc_r+0x17c>
    ac58:	00040593          	mv	a1,s0
    ac5c:	c70fb0ef          	jal	60cc <memmove>
    ac60:	d3dff06f          	j	a99c <_realloc_r+0x130>
    ac64:	00c6a783          	lw	a5,12(a3)
    ac68:	0086a703          	lw	a4,8(a3)
    ac6c:	ffc98613          	addi	a2,s3,-4
    ac70:	02400693          	li	a3,36
    ac74:	00f72623          	sw	a5,12(a4)
    ac78:	00e7a423          	sw	a4,8(a5)
    ac7c:	008ba703          	lw	a4,8(s7)
    ac80:	00cba783          	lw	a5,12(s7)
    ac84:	008b8493          	addi	s1,s7,8
    ac88:	00f72623          	sw	a5,12(a4)
    ac8c:	00e7a423          	sw	a4,8(a5)
    ac90:	04c6ee63          	bltu	a3,a2,acec <_realloc_r+0x480>
    ac94:	01300713          	li	a4,19
    ac98:	00048793          	mv	a5,s1
    ac9c:	f8c774e3          	bgeu	a4,a2,ac24 <_realloc_r+0x3b8>
    aca0:	00042703          	lw	a4,0(s0)
    aca4:	01b00793          	li	a5,27
    aca8:	00eba423          	sw	a4,8(s7)
    acac:	00442703          	lw	a4,4(s0)
    acb0:	00eba623          	sw	a4,12(s7)
    acb4:	0ac7f063          	bgeu	a5,a2,ad54 <_realloc_r+0x4e8>
    acb8:	00842703          	lw	a4,8(s0)
    acbc:	02400793          	li	a5,36
    acc0:	00eba823          	sw	a4,16(s7)
    acc4:	00c42703          	lw	a4,12(s0)
    acc8:	00ebaa23          	sw	a4,20(s7)
    accc:	f4f618e3          	bne	a2,a5,ac1c <_realloc_r+0x3b0>
    acd0:	01042703          	lw	a4,16(s0)
    acd4:	020b8793          	addi	a5,s7,32
    acd8:	01840413          	addi	s0,s0,24
    acdc:	00ebac23          	sw	a4,24(s7)
    ace0:	ffc42703          	lw	a4,-4(s0)
    ace4:	00ebae23          	sw	a4,28(s7)
    ace8:	f3dff06f          	j	ac24 <_realloc_r+0x3b8>
    acec:	00040593          	mv	a1,s0
    acf0:	00048513          	mv	a0,s1
    acf4:	bd8fb0ef          	jal	60cc <memmove>
    acf8:	f45ff06f          	j	ac3c <_realloc_r+0x3d0>
    acfc:	00842703          	lw	a4,8(s0)
    ad00:	00e52423          	sw	a4,8(a0)
    ad04:	00c42703          	lw	a4,12(s0)
    ad08:	00e52623          	sw	a4,12(a0)
    ad0c:	06f60463          	beq	a2,a5,ad74 <_realloc_r+0x508>
    ad10:	01040713          	addi	a4,s0,16
    ad14:	01050793          	addi	a5,a0,16
    ad18:	c6dff06f          	j	a984 <_realloc_r+0x118>
    ad1c:	014a8ab3          	add	s5,s5,s4
    ad20:	414686b3          	sub	a3,a3,s4
    ad24:	015c2423          	sw	s5,8(s8)
    ad28:	0016e793          	ori	a5,a3,1
    ad2c:	00faa223          	sw	a5,4(s5)
    ad30:	ffc42783          	lw	a5,-4(s0)
    ad34:	00090513          	mv	a0,s2
    ad38:	00040493          	mv	s1,s0
    ad3c:	0017f793          	andi	a5,a5,1
    ad40:	0147e7b3          	or	a5,a5,s4
    ad44:	fef42e23          	sw	a5,-4(s0)
    ad48:	951fe0ef          	jal	9698 <__malloc_unlock>
    ad4c:	00812c03          	lw	s8,8(sp)
    ad50:	cd1ff06f          	j	aa20 <_realloc_r+0x1b4>
    ad54:	00840413          	addi	s0,s0,8
    ad58:	010b8793          	addi	a5,s7,16
    ad5c:	ec9ff06f          	j	ac24 <_realloc_r+0x3b8>
    ad60:	00090513          	mv	a0,s2
    ad64:	935fe0ef          	jal	9698 <__malloc_unlock>
    ad68:	00000493          	li	s1,0
    ad6c:	00812c03          	lw	s8,8(sp)
    ad70:	cb1ff06f          	j	aa20 <_realloc_r+0x1b4>
    ad74:	01042683          	lw	a3,16(s0)
    ad78:	01840713          	addi	a4,s0,24
    ad7c:	01850793          	addi	a5,a0,24
    ad80:	00d52823          	sw	a3,16(a0)
    ad84:	01442683          	lw	a3,20(s0)
    ad88:	00d52a23          	sw	a3,20(a0)
    ad8c:	bf9ff06f          	j	a984 <_realloc_r+0x118>
    ad90:	00040593          	mv	a1,s0
    ad94:	00048513          	mv	a0,s1
    ad98:	b34fb0ef          	jal	60cc <memmove>
    ad9c:	db5ff06f          	j	ab50 <_realloc_r+0x2e4>
    ada0:	00842783          	lw	a5,8(s0)
    ada4:	00fba823          	sw	a5,16(s7)
    ada8:	00c42783          	lw	a5,12(s0)
    adac:	00fbaa23          	sw	a5,20(s7)
    adb0:	00d60863          	beq	a2,a3,adc0 <_realloc_r+0x554>
    adb4:	01040413          	addi	s0,s0,16
    adb8:	018b8793          	addi	a5,s7,24
    adbc:	d7dff06f          	j	ab38 <_realloc_r+0x2cc>
    adc0:	01042703          	lw	a4,16(s0)
    adc4:	020b8793          	addi	a5,s7,32
    adc8:	01840413          	addi	s0,s0,24
    adcc:	00ebac23          	sw	a4,24(s7)
    add0:	ffc42703          	lw	a4,-4(s0)
    add4:	00ebae23          	sw	a4,28(s7)
    add8:	d61ff06f          	j	ab38 <_realloc_r+0x2cc>

0000addc <_fclose_r>:
    addc:	ff010113          	addi	sp,sp,-16
    ade0:	00112623          	sw	ra,12(sp)
    ade4:	01212023          	sw	s2,0(sp)
    ade8:	02058863          	beqz	a1,ae18 <_fclose_r+0x3c>
    adec:	00812423          	sw	s0,8(sp)
    adf0:	00912223          	sw	s1,4(sp)
    adf4:	00058413          	mv	s0,a1
    adf8:	00050493          	mv	s1,a0
    adfc:	00050663          	beqz	a0,ae08 <_fclose_r+0x2c>
    ae00:	03452783          	lw	a5,52(a0)
    ae04:	0c078c63          	beqz	a5,aedc <_fclose_r+0x100>
    ae08:	00c41783          	lh	a5,12(s0)
    ae0c:	02079263          	bnez	a5,ae30 <_fclose_r+0x54>
    ae10:	00812403          	lw	s0,8(sp)
    ae14:	00412483          	lw	s1,4(sp)
    ae18:	00c12083          	lw	ra,12(sp)
    ae1c:	00000913          	li	s2,0
    ae20:	00090513          	mv	a0,s2
    ae24:	00012903          	lw	s2,0(sp)
    ae28:	01010113          	addi	sp,sp,16
    ae2c:	00008067          	ret
    ae30:	00040593          	mv	a1,s0
    ae34:	00048513          	mv	a0,s1
    ae38:	f39f90ef          	jal	4d70 <__sflush_r>
    ae3c:	02c42783          	lw	a5,44(s0)
    ae40:	00050913          	mv	s2,a0
    ae44:	00078a63          	beqz	a5,ae58 <_fclose_r+0x7c>
    ae48:	01c42583          	lw	a1,28(s0)
    ae4c:	00048513          	mv	a0,s1
    ae50:	000780e7          	jalr	a5
    ae54:	06054463          	bltz	a0,aebc <_fclose_r+0xe0>
    ae58:	00c45783          	lhu	a5,12(s0)
    ae5c:	0807f793          	andi	a5,a5,128
    ae60:	06079663          	bnez	a5,aecc <_fclose_r+0xf0>
    ae64:	03042583          	lw	a1,48(s0)
    ae68:	00058c63          	beqz	a1,ae80 <_fclose_r+0xa4>
    ae6c:	04040793          	addi	a5,s0,64
    ae70:	00f58663          	beq	a1,a5,ae7c <_fclose_r+0xa0>
    ae74:	00048513          	mv	a0,s1
    ae78:	935fb0ef          	jal	67ac <_free_r>
    ae7c:	02042823          	sw	zero,48(s0)
    ae80:	04442583          	lw	a1,68(s0)
    ae84:	00058863          	beqz	a1,ae94 <_fclose_r+0xb8>
    ae88:	00048513          	mv	a0,s1
    ae8c:	921fb0ef          	jal	67ac <_free_r>
    ae90:	04042223          	sw	zero,68(s0)
    ae94:	d70fa0ef          	jal	5404 <__sfp_lock_acquire>
    ae98:	00041623          	sh	zero,12(s0)
    ae9c:	d6cfa0ef          	jal	5408 <__sfp_lock_release>
    aea0:	00c12083          	lw	ra,12(sp)
    aea4:	00812403          	lw	s0,8(sp)
    aea8:	00412483          	lw	s1,4(sp)
    aeac:	00090513          	mv	a0,s2
    aeb0:	00012903          	lw	s2,0(sp)
    aeb4:	01010113          	addi	sp,sp,16
    aeb8:	00008067          	ret
    aebc:	00c45783          	lhu	a5,12(s0)
    aec0:	fff00913          	li	s2,-1
    aec4:	0807f793          	andi	a5,a5,128
    aec8:	f8078ee3          	beqz	a5,ae64 <_fclose_r+0x88>
    aecc:	01042583          	lw	a1,16(s0)
    aed0:	00048513          	mv	a0,s1
    aed4:	8d9fb0ef          	jal	67ac <_free_r>
    aed8:	f8dff06f          	j	ae64 <_fclose_r+0x88>
    aedc:	d00fa0ef          	jal	53dc <__sinit>
    aee0:	f29ff06f          	j	ae08 <_fclose_r+0x2c>

0000aee4 <fclose>:
    aee4:	000147b7          	lui	a5,0x14
    aee8:	00050593          	mv	a1,a0
    aeec:	bcc7a503          	lw	a0,-1076(a5) # 13bcc <_impure_ptr>
    aef0:	eedff06f          	j	addc <_fclose_r>

0000aef4 <__smakebuf_r>:
    aef4:	00c59783          	lh	a5,12(a1)
    aef8:	f8010113          	addi	sp,sp,-128
    aefc:	06812c23          	sw	s0,120(sp)
    af00:	06112e23          	sw	ra,124(sp)
    af04:	0027f713          	andi	a4,a5,2
    af08:	00058413          	mv	s0,a1
    af0c:	02070463          	beqz	a4,af34 <__smakebuf_r+0x40>
    af10:	04358793          	addi	a5,a1,67
    af14:	00f5a023          	sw	a5,0(a1)
    af18:	00f5a823          	sw	a5,16(a1)
    af1c:	00100793          	li	a5,1
    af20:	00f5aa23          	sw	a5,20(a1)
    af24:	07c12083          	lw	ra,124(sp)
    af28:	07812403          	lw	s0,120(sp)
    af2c:	08010113          	addi	sp,sp,128
    af30:	00008067          	ret
    af34:	00e59583          	lh	a1,14(a1)
    af38:	06912a23          	sw	s1,116(sp)
    af3c:	07212823          	sw	s2,112(sp)
    af40:	07312623          	sw	s3,108(sp)
    af44:	07412423          	sw	s4,104(sp)
    af48:	00050493          	mv	s1,a0
    af4c:	0805c663          	bltz	a1,afd8 <__smakebuf_r+0xe4>
    af50:	00810613          	addi	a2,sp,8
    af54:	2fc000ef          	jal	b250 <_fstat_r>
    af58:	06054e63          	bltz	a0,afd4 <__smakebuf_r+0xe0>
    af5c:	00c12783          	lw	a5,12(sp)
    af60:	0000f937          	lui	s2,0xf
    af64:	000019b7          	lui	s3,0x1
    af68:	00f97933          	and	s2,s2,a5
    af6c:	ffffe7b7          	lui	a5,0xffffe
    af70:	00f90933          	add	s2,s2,a5
    af74:	00193913          	seqz	s2,s2
    af78:	40000a13          	li	s4,1024
    af7c:	80098993          	addi	s3,s3,-2048 # 800 <main+0x514>
    af80:	000a0593          	mv	a1,s4
    af84:	00048513          	mv	a0,s1
    af88:	f39fd0ef          	jal	8ec0 <_malloc_r>
    af8c:	00c41783          	lh	a5,12(s0)
    af90:	06050863          	beqz	a0,b000 <__smakebuf_r+0x10c>
    af94:	0807e793          	ori	a5,a5,128
    af98:	00a42023          	sw	a0,0(s0)
    af9c:	00a42823          	sw	a0,16(s0)
    afa0:	00f41623          	sh	a5,12(s0)
    afa4:	01442a23          	sw	s4,20(s0)
    afa8:	0a091063          	bnez	s2,b048 <__smakebuf_r+0x154>
    afac:	0137e7b3          	or	a5,a5,s3
    afb0:	07c12083          	lw	ra,124(sp)
    afb4:	00f41623          	sh	a5,12(s0)
    afb8:	07812403          	lw	s0,120(sp)
    afbc:	07412483          	lw	s1,116(sp)
    afc0:	07012903          	lw	s2,112(sp)
    afc4:	06c12983          	lw	s3,108(sp)
    afc8:	06812a03          	lw	s4,104(sp)
    afcc:	08010113          	addi	sp,sp,128
    afd0:	00008067          	ret
    afd4:	00c41783          	lh	a5,12(s0)
    afd8:	0807f793          	andi	a5,a5,128
    afdc:	00000913          	li	s2,0
    afe0:	04078e63          	beqz	a5,b03c <__smakebuf_r+0x148>
    afe4:	04000a13          	li	s4,64
    afe8:	000a0593          	mv	a1,s4
    afec:	00048513          	mv	a0,s1
    aff0:	ed1fd0ef          	jal	8ec0 <_malloc_r>
    aff4:	00c41783          	lh	a5,12(s0)
    aff8:	00000993          	li	s3,0
    affc:	f8051ce3          	bnez	a0,af94 <__smakebuf_r+0xa0>
    b000:	2007f713          	andi	a4,a5,512
    b004:	04071e63          	bnez	a4,b060 <__smakebuf_r+0x16c>
    b008:	ffc7f793          	andi	a5,a5,-4
    b00c:	0027e793          	ori	a5,a5,2
    b010:	04340713          	addi	a4,s0,67
    b014:	00f41623          	sh	a5,12(s0)
    b018:	00100793          	li	a5,1
    b01c:	07412483          	lw	s1,116(sp)
    b020:	07012903          	lw	s2,112(sp)
    b024:	06c12983          	lw	s3,108(sp)
    b028:	06812a03          	lw	s4,104(sp)
    b02c:	00e42023          	sw	a4,0(s0)
    b030:	00e42823          	sw	a4,16(s0)
    b034:	00f42a23          	sw	a5,20(s0)
    b038:	eedff06f          	j	af24 <__smakebuf_r+0x30>
    b03c:	40000a13          	li	s4,1024
    b040:	00000993          	li	s3,0
    b044:	f3dff06f          	j	af80 <__smakebuf_r+0x8c>
    b048:	00e41583          	lh	a1,14(s0)
    b04c:	00048513          	mv	a0,s1
    b050:	268000ef          	jal	b2b8 <_isatty_r>
    b054:	02051063          	bnez	a0,b074 <__smakebuf_r+0x180>
    b058:	00c41783          	lh	a5,12(s0)
    b05c:	f51ff06f          	j	afac <__smakebuf_r+0xb8>
    b060:	07412483          	lw	s1,116(sp)
    b064:	07012903          	lw	s2,112(sp)
    b068:	06c12983          	lw	s3,108(sp)
    b06c:	06812a03          	lw	s4,104(sp)
    b070:	eb5ff06f          	j	af24 <__smakebuf_r+0x30>
    b074:	00c45783          	lhu	a5,12(s0)
    b078:	ffc7f793          	andi	a5,a5,-4
    b07c:	0017e793          	ori	a5,a5,1
    b080:	01079793          	slli	a5,a5,0x10
    b084:	4107d793          	srai	a5,a5,0x10
    b088:	f25ff06f          	j	afac <__smakebuf_r+0xb8>

0000b08c <__swhatbuf_r>:
    b08c:	f9010113          	addi	sp,sp,-112
    b090:	06812423          	sw	s0,104(sp)
    b094:	00058413          	mv	s0,a1
    b098:	00e59583          	lh	a1,14(a1)
    b09c:	06912223          	sw	s1,100(sp)
    b0a0:	07212023          	sw	s2,96(sp)
    b0a4:	06112623          	sw	ra,108(sp)
    b0a8:	00060493          	mv	s1,a2
    b0ac:	00068913          	mv	s2,a3
    b0b0:	0405ca63          	bltz	a1,b104 <__swhatbuf_r+0x78>
    b0b4:	00810613          	addi	a2,sp,8
    b0b8:	198000ef          	jal	b250 <_fstat_r>
    b0bc:	04054463          	bltz	a0,b104 <__swhatbuf_r+0x78>
    b0c0:	00c12703          	lw	a4,12(sp)
    b0c4:	0000f7b7          	lui	a5,0xf
    b0c8:	06c12083          	lw	ra,108(sp)
    b0cc:	00e7f7b3          	and	a5,a5,a4
    b0d0:	ffffe737          	lui	a4,0xffffe
    b0d4:	00e787b3          	add	a5,a5,a4
    b0d8:	06812403          	lw	s0,104(sp)
    b0dc:	0017b793          	seqz	a5,a5
    b0e0:	00f92023          	sw	a5,0(s2) # f000 <__eqtf2+0x74>
    b0e4:	40000713          	li	a4,1024
    b0e8:	00e4a023          	sw	a4,0(s1)
    b0ec:	00001537          	lui	a0,0x1
    b0f0:	06412483          	lw	s1,100(sp)
    b0f4:	06012903          	lw	s2,96(sp)
    b0f8:	80050513          	addi	a0,a0,-2048 # 800 <main+0x514>
    b0fc:	07010113          	addi	sp,sp,112
    b100:	00008067          	ret
    b104:	00c45783          	lhu	a5,12(s0)
    b108:	0807f793          	andi	a5,a5,128
    b10c:	02078863          	beqz	a5,b13c <__swhatbuf_r+0xb0>
    b110:	06c12083          	lw	ra,108(sp)
    b114:	06812403          	lw	s0,104(sp)
    b118:	00000793          	li	a5,0
    b11c:	00f92023          	sw	a5,0(s2)
    b120:	04000713          	li	a4,64
    b124:	00e4a023          	sw	a4,0(s1)
    b128:	06012903          	lw	s2,96(sp)
    b12c:	06412483          	lw	s1,100(sp)
    b130:	00000513          	li	a0,0
    b134:	07010113          	addi	sp,sp,112
    b138:	00008067          	ret
    b13c:	06c12083          	lw	ra,108(sp)
    b140:	06812403          	lw	s0,104(sp)
    b144:	00f92023          	sw	a5,0(s2)
    b148:	40000713          	li	a4,1024
    b14c:	00e4a023          	sw	a4,0(s1)
    b150:	06012903          	lw	s2,96(sp)
    b154:	06412483          	lw	s1,100(sp)
    b158:	00000513          	li	a0,0
    b15c:	07010113          	addi	sp,sp,112
    b160:	00008067          	ret

0000b164 <_setlocale_r>:
    b164:	ff010113          	addi	sp,sp,-16
    b168:	00112623          	sw	ra,12(sp)
    b16c:	00912223          	sw	s1,4(sp)
    b170:	02060a63          	beqz	a2,b1a4 <_setlocale_r+0x40>
    b174:	50818593          	addi	a1,gp,1288 # 12cd8 <keypad_map+0x178>
    b178:	00060513          	mv	a0,a2
    b17c:	00812423          	sw	s0,8(sp)
    b180:	00060413          	mv	s0,a2
    b184:	1f4000ef          	jal	b378 <strcmp>
    b188:	02051063          	bnez	a0,b1a8 <_setlocale_r+0x44>
    b18c:	00812403          	lw	s0,8(sp)
    b190:	50418513          	addi	a0,gp,1284 # 12cd4 <keypad_map+0x174>
    b194:	00c12083          	lw	ra,12(sp)
    b198:	00412483          	lw	s1,4(sp)
    b19c:	01010113          	addi	sp,sp,16
    b1a0:	00008067          	ret
    b1a4:	fedff06f          	j	b190 <_setlocale_r+0x2c>
    b1a8:	50418593          	addi	a1,gp,1284 # 12cd4 <keypad_map+0x174>
    b1ac:	00040513          	mv	a0,s0
    b1b0:	1c8000ef          	jal	b378 <strcmp>
    b1b4:	fc050ce3          	beqz	a0,b18c <_setlocale_r+0x28>
    b1b8:	52018593          	addi	a1,gp,1312 # 12cf0 <keypad_map+0x190>
    b1bc:	00040513          	mv	a0,s0
    b1c0:	1b8000ef          	jal	b378 <strcmp>
    b1c4:	fc0504e3          	beqz	a0,b18c <_setlocale_r+0x28>
    b1c8:	00812403          	lw	s0,8(sp)
    b1cc:	00000513          	li	a0,0
    b1d0:	fc5ff06f          	j	b194 <_setlocale_r+0x30>

0000b1d4 <__locale_mb_cur_max>:
    b1d4:	000147b7          	lui	a5,0x14
    b1d8:	b1c7c503          	lbu	a0,-1252(a5) # 13b1c <__global_locale+0x128>
    b1dc:	00008067          	ret

0000b1e0 <setlocale>:
    b1e0:	ff010113          	addi	sp,sp,-16
    b1e4:	00112623          	sw	ra,12(sp)
    b1e8:	00912223          	sw	s1,4(sp)
    b1ec:	02058a63          	beqz	a1,b220 <setlocale+0x40>
    b1f0:	00812423          	sw	s0,8(sp)
    b1f4:	00058413          	mv	s0,a1
    b1f8:	50818593          	addi	a1,gp,1288 # 12cd8 <keypad_map+0x178>
    b1fc:	00040513          	mv	a0,s0
    b200:	178000ef          	jal	b378 <strcmp>
    b204:	02051063          	bnez	a0,b224 <setlocale+0x44>
    b208:	00812403          	lw	s0,8(sp)
    b20c:	50418513          	addi	a0,gp,1284 # 12cd4 <keypad_map+0x174>
    b210:	00c12083          	lw	ra,12(sp)
    b214:	00412483          	lw	s1,4(sp)
    b218:	01010113          	addi	sp,sp,16
    b21c:	00008067          	ret
    b220:	fedff06f          	j	b20c <setlocale+0x2c>
    b224:	50418593          	addi	a1,gp,1284 # 12cd4 <keypad_map+0x174>
    b228:	00040513          	mv	a0,s0
    b22c:	14c000ef          	jal	b378 <strcmp>
    b230:	fc050ce3          	beqz	a0,b208 <setlocale+0x28>
    b234:	52018593          	addi	a1,gp,1312 # 12cf0 <keypad_map+0x190>
    b238:	00040513          	mv	a0,s0
    b23c:	13c000ef          	jal	b378 <strcmp>
    b240:	fc0504e3          	beqz	a0,b208 <setlocale+0x28>
    b244:	00812403          	lw	s0,8(sp)
    b248:	00000513          	li	a0,0
    b24c:	fc5ff06f          	j	b210 <setlocale+0x30>

0000b250 <_fstat_r>:
    b250:	ff010113          	addi	sp,sp,-16
    b254:	00058713          	mv	a4,a1
    b258:	00812423          	sw	s0,8(sp)
    b25c:	00912223          	sw	s1,4(sp)
    b260:	00050413          	mv	s0,a0
    b264:	000144b7          	lui	s1,0x14
    b268:	00060593          	mv	a1,a2
    b26c:	00070513          	mv	a0,a4
    b270:	00112623          	sw	ra,12(sp)
    b274:	d204ae23          	sw	zero,-708(s1) # 13d3c <errno>
    b278:	834f70ef          	jal	22ac <_fstat>
    b27c:	fff00793          	li	a5,-1
    b280:	00f50c63          	beq	a0,a5,b298 <_fstat_r+0x48>
    b284:	00c12083          	lw	ra,12(sp)
    b288:	00812403          	lw	s0,8(sp)
    b28c:	00412483          	lw	s1,4(sp)
    b290:	01010113          	addi	sp,sp,16
    b294:	00008067          	ret
    b298:	d3c4a783          	lw	a5,-708(s1)
    b29c:	fe0784e3          	beqz	a5,b284 <_fstat_r+0x34>
    b2a0:	00c12083          	lw	ra,12(sp)
    b2a4:	00f42023          	sw	a5,0(s0)
    b2a8:	00812403          	lw	s0,8(sp)
    b2ac:	00412483          	lw	s1,4(sp)
    b2b0:	01010113          	addi	sp,sp,16
    b2b4:	00008067          	ret

0000b2b8 <_isatty_r>:
    b2b8:	ff010113          	addi	sp,sp,-16
    b2bc:	00812423          	sw	s0,8(sp)
    b2c0:	00912223          	sw	s1,4(sp)
    b2c4:	00050413          	mv	s0,a0
    b2c8:	000144b7          	lui	s1,0x14
    b2cc:	00058513          	mv	a0,a1
    b2d0:	00112623          	sw	ra,12(sp)
    b2d4:	d204ae23          	sw	zero,-708(s1) # 13d3c <errno>
    b2d8:	ffdf60ef          	jal	22d4 <_isatty>
    b2dc:	fff00793          	li	a5,-1
    b2e0:	00f50c63          	beq	a0,a5,b2f8 <_isatty_r+0x40>
    b2e4:	00c12083          	lw	ra,12(sp)
    b2e8:	00812403          	lw	s0,8(sp)
    b2ec:	00412483          	lw	s1,4(sp)
    b2f0:	01010113          	addi	sp,sp,16
    b2f4:	00008067          	ret
    b2f8:	d3c4a783          	lw	a5,-708(s1)
    b2fc:	fe0784e3          	beqz	a5,b2e4 <_isatty_r+0x2c>
    b300:	00c12083          	lw	ra,12(sp)
    b304:	00f42023          	sw	a5,0(s0)
    b308:	00812403          	lw	s0,8(sp)
    b30c:	00412483          	lw	s1,4(sp)
    b310:	01010113          	addi	sp,sp,16
    b314:	00008067          	ret

0000b318 <_sbrk_r>:
    b318:	ff010113          	addi	sp,sp,-16
    b31c:	00812423          	sw	s0,8(sp)
    b320:	00912223          	sw	s1,4(sp)
    b324:	00050413          	mv	s0,a0
    b328:	000144b7          	lui	s1,0x14
    b32c:	00058513          	mv	a0,a1
    b330:	00112623          	sw	ra,12(sp)
    b334:	d204ae23          	sw	zero,-708(s1) # 13d3c <errno>
    b338:	fc1f60ef          	jal	22f8 <_sbrk>
    b33c:	fff00793          	li	a5,-1
    b340:	00f50c63          	beq	a0,a5,b358 <_sbrk_r+0x40>
    b344:	00c12083          	lw	ra,12(sp)
    b348:	00812403          	lw	s0,8(sp)
    b34c:	00412483          	lw	s1,4(sp)
    b350:	01010113          	addi	sp,sp,16
    b354:	00008067          	ret
    b358:	d3c4a783          	lw	a5,-708(s1)
    b35c:	fe0784e3          	beqz	a5,b344 <_sbrk_r+0x2c>
    b360:	00c12083          	lw	ra,12(sp)
    b364:	00f42023          	sw	a5,0(s0)
    b368:	00812403          	lw	s0,8(sp)
    b36c:	00412483          	lw	s1,4(sp)
    b370:	01010113          	addi	sp,sp,16
    b374:	00008067          	ret

0000b378 <strcmp>:
    b378:	00b56733          	or	a4,a0,a1
    b37c:	fff00393          	li	t2,-1
    b380:	00377713          	andi	a4,a4,3
    b384:	10071063          	bnez	a4,b484 <strcmp+0x10c>
    b388:	7f7f87b7          	lui	a5,0x7f7f8
    b38c:	f7f78793          	addi	a5,a5,-129 # 7f7f7f7f <_memory_end+0x7f7d7f7f>
    b390:	00052603          	lw	a2,0(a0)
    b394:	0005a683          	lw	a3,0(a1)
    b398:	00f672b3          	and	t0,a2,a5
    b39c:	00f66333          	or	t1,a2,a5
    b3a0:	00f282b3          	add	t0,t0,a5
    b3a4:	0062e2b3          	or	t0,t0,t1
    b3a8:	10729263          	bne	t0,t2,b4ac <strcmp+0x134>
    b3ac:	08d61663          	bne	a2,a3,b438 <strcmp+0xc0>
    b3b0:	00452603          	lw	a2,4(a0)
    b3b4:	0045a683          	lw	a3,4(a1)
    b3b8:	00f672b3          	and	t0,a2,a5
    b3bc:	00f66333          	or	t1,a2,a5
    b3c0:	00f282b3          	add	t0,t0,a5
    b3c4:	0062e2b3          	or	t0,t0,t1
    b3c8:	0c729e63          	bne	t0,t2,b4a4 <strcmp+0x12c>
    b3cc:	06d61663          	bne	a2,a3,b438 <strcmp+0xc0>
    b3d0:	00852603          	lw	a2,8(a0)
    b3d4:	0085a683          	lw	a3,8(a1)
    b3d8:	00f672b3          	and	t0,a2,a5
    b3dc:	00f66333          	or	t1,a2,a5
    b3e0:	00f282b3          	add	t0,t0,a5
    b3e4:	0062e2b3          	or	t0,t0,t1
    b3e8:	0c729863          	bne	t0,t2,b4b8 <strcmp+0x140>
    b3ec:	04d61663          	bne	a2,a3,b438 <strcmp+0xc0>
    b3f0:	00c52603          	lw	a2,12(a0)
    b3f4:	00c5a683          	lw	a3,12(a1)
    b3f8:	00f672b3          	and	t0,a2,a5
    b3fc:	00f66333          	or	t1,a2,a5
    b400:	00f282b3          	add	t0,t0,a5
    b404:	0062e2b3          	or	t0,t0,t1
    b408:	0c729263          	bne	t0,t2,b4cc <strcmp+0x154>
    b40c:	02d61663          	bne	a2,a3,b438 <strcmp+0xc0>
    b410:	01052603          	lw	a2,16(a0)
    b414:	0105a683          	lw	a3,16(a1)
    b418:	00f672b3          	and	t0,a2,a5
    b41c:	00f66333          	or	t1,a2,a5
    b420:	00f282b3          	add	t0,t0,a5
    b424:	0062e2b3          	or	t0,t0,t1
    b428:	0a729c63          	bne	t0,t2,b4e0 <strcmp+0x168>
    b42c:	01450513          	addi	a0,a0,20
    b430:	01458593          	addi	a1,a1,20
    b434:	f4d60ee3          	beq	a2,a3,b390 <strcmp+0x18>
    b438:	01061713          	slli	a4,a2,0x10
    b43c:	01069793          	slli	a5,a3,0x10
    b440:	00f71e63          	bne	a4,a5,b45c <strcmp+0xe4>
    b444:	01065713          	srli	a4,a2,0x10
    b448:	0106d793          	srli	a5,a3,0x10
    b44c:	40f70533          	sub	a0,a4,a5
    b450:	0ff57593          	zext.b	a1,a0
    b454:	02059063          	bnez	a1,b474 <strcmp+0xfc>
    b458:	00008067          	ret
    b45c:	01075713          	srli	a4,a4,0x10
    b460:	0107d793          	srli	a5,a5,0x10
    b464:	40f70533          	sub	a0,a4,a5
    b468:	0ff57593          	zext.b	a1,a0
    b46c:	00059463          	bnez	a1,b474 <strcmp+0xfc>
    b470:	00008067          	ret
    b474:	0ff77713          	zext.b	a4,a4
    b478:	0ff7f793          	zext.b	a5,a5
    b47c:	40f70533          	sub	a0,a4,a5
    b480:	00008067          	ret
    b484:	00054603          	lbu	a2,0(a0)
    b488:	0005c683          	lbu	a3,0(a1)
    b48c:	00150513          	addi	a0,a0,1
    b490:	00158593          	addi	a1,a1,1
    b494:	00d61463          	bne	a2,a3,b49c <strcmp+0x124>
    b498:	fe0616e3          	bnez	a2,b484 <strcmp+0x10c>
    b49c:	40d60533          	sub	a0,a2,a3
    b4a0:	00008067          	ret
    b4a4:	00450513          	addi	a0,a0,4
    b4a8:	00458593          	addi	a1,a1,4
    b4ac:	fcd61ce3          	bne	a2,a3,b484 <strcmp+0x10c>
    b4b0:	00000513          	li	a0,0
    b4b4:	00008067          	ret
    b4b8:	00850513          	addi	a0,a0,8
    b4bc:	00858593          	addi	a1,a1,8
    b4c0:	fcd612e3          	bne	a2,a3,b484 <strcmp+0x10c>
    b4c4:	00000513          	li	a0,0
    b4c8:	00008067          	ret
    b4cc:	00c50513          	addi	a0,a0,12
    b4d0:	00c58593          	addi	a1,a1,12
    b4d4:	fad618e3          	bne	a2,a3,b484 <strcmp+0x10c>
    b4d8:	00000513          	li	a0,0
    b4dc:	00008067          	ret
    b4e0:	01050513          	addi	a0,a0,16
    b4e4:	01058593          	addi	a1,a1,16
    b4e8:	f8d61ee3          	bne	a2,a3,b484 <strcmp+0x10c>
    b4ec:	00000513          	li	a0,0
    b4f0:	00008067          	ret

0000b4f4 <__assert_func>:
    b4f4:	000147b7          	lui	a5,0x14
    b4f8:	bcc7a703          	lw	a4,-1076(a5) # 13bcc <_impure_ptr>
    b4fc:	ff010113          	addi	sp,sp,-16
    b500:	00068793          	mv	a5,a3
    b504:	00060813          	mv	a6,a2
    b508:	00112623          	sw	ra,12(sp)
    b50c:	00c72883          	lw	a7,12(a4) # ffffe00c <_memory_end+0xfffde00c>
    b510:	00050693          	mv	a3,a0
    b514:	00058713          	mv	a4,a1
    b518:	00078613          	mv	a2,a5
    b51c:	00080c63          	beqz	a6,b534 <__assert_func+0x40>
    b520:	51418793          	addi	a5,gp,1300 # 12ce4 <keypad_map+0x184>
    b524:	52418593          	addi	a1,gp,1316 # 12cf4 <keypad_map+0x194>
    b528:	00088513          	mv	a0,a7
    b52c:	1f8000ef          	jal	b724 <fiprintf>
    b530:	494010ef          	jal	c9c4 <abort>
    b534:	52018793          	addi	a5,gp,1312 # 12cf0 <keypad_map+0x190>
    b538:	52018813          	addi	a6,gp,1312 # 12cf0 <keypad_map+0x190>
    b53c:	fe9ff06f          	j	b524 <__assert_func+0x30>

0000b540 <__assert>:
    b540:	ff010113          	addi	sp,sp,-16
    b544:	00060693          	mv	a3,a2
    b548:	00000613          	li	a2,0
    b54c:	00112623          	sw	ra,12(sp)
    b550:	fa5ff0ef          	jal	b4f4 <__assert_func>

0000b554 <_calloc_r>:
    b554:	02c5b7b3          	mulhu	a5,a1,a2
    b558:	ff010113          	addi	sp,sp,-16
    b55c:	00112623          	sw	ra,12(sp)
    b560:	00812423          	sw	s0,8(sp)
    b564:	02c585b3          	mul	a1,a1,a2
    b568:	0a079063          	bnez	a5,b608 <_calloc_r+0xb4>
    b56c:	955fd0ef          	jal	8ec0 <_malloc_r>
    b570:	00050413          	mv	s0,a0
    b574:	0a050063          	beqz	a0,b614 <_calloc_r+0xc0>
    b578:	ffc52603          	lw	a2,-4(a0)
    b57c:	02400713          	li	a4,36
    b580:	ffc67613          	andi	a2,a2,-4
    b584:	ffc60613          	addi	a2,a2,-4
    b588:	04c76863          	bltu	a4,a2,b5d8 <_calloc_r+0x84>
    b58c:	01300693          	li	a3,19
    b590:	00050793          	mv	a5,a0
    b594:	02c6f263          	bgeu	a3,a2,b5b8 <_calloc_r+0x64>
    b598:	00052023          	sw	zero,0(a0)
    b59c:	00052223          	sw	zero,4(a0)
    b5a0:	01b00793          	li	a5,27
    b5a4:	04c7f863          	bgeu	a5,a2,b5f4 <_calloc_r+0xa0>
    b5a8:	00052423          	sw	zero,8(a0)
    b5ac:	00052623          	sw	zero,12(a0)
    b5b0:	01050793          	addi	a5,a0,16
    b5b4:	06e60c63          	beq	a2,a4,b62c <_calloc_r+0xd8>
    b5b8:	0007a023          	sw	zero,0(a5)
    b5bc:	0007a223          	sw	zero,4(a5)
    b5c0:	0007a423          	sw	zero,8(a5)
    b5c4:	00c12083          	lw	ra,12(sp)
    b5c8:	00040513          	mv	a0,s0
    b5cc:	00812403          	lw	s0,8(sp)
    b5d0:	01010113          	addi	sp,sp,16
    b5d4:	00008067          	ret
    b5d8:	00000593          	li	a1,0
    b5dc:	bfdfa0ef          	jal	61d8 <memset>
    b5e0:	00c12083          	lw	ra,12(sp)
    b5e4:	00040513          	mv	a0,s0
    b5e8:	00812403          	lw	s0,8(sp)
    b5ec:	01010113          	addi	sp,sp,16
    b5f0:	00008067          	ret
    b5f4:	00850793          	addi	a5,a0,8
    b5f8:	0007a023          	sw	zero,0(a5)
    b5fc:	0007a223          	sw	zero,4(a5)
    b600:	0007a423          	sw	zero,8(a5)
    b604:	fc1ff06f          	j	b5c4 <_calloc_r+0x70>
    b608:	3b0010ef          	jal	c9b8 <__errno>
    b60c:	00c00793          	li	a5,12
    b610:	00f52023          	sw	a5,0(a0)
    b614:	00000413          	li	s0,0
    b618:	00c12083          	lw	ra,12(sp)
    b61c:	00040513          	mv	a0,s0
    b620:	00812403          	lw	s0,8(sp)
    b624:	01010113          	addi	sp,sp,16
    b628:	00008067          	ret
    b62c:	00052823          	sw	zero,16(a0)
    b630:	01850793          	addi	a5,a0,24
    b634:	00052a23          	sw	zero,20(a0)
    b638:	f81ff06f          	j	b5b8 <_calloc_r+0x64>

0000b63c <_mbtowc_r>:
    b63c:	000147b7          	lui	a5,0x14
    b640:	ad87a783          	lw	a5,-1320(a5) # 13ad8 <__global_locale+0xe4>
    b644:	00078067          	jr	a5

0000b648 <__ascii_mbtowc>:
    b648:	02058063          	beqz	a1,b668 <__ascii_mbtowc+0x20>
    b64c:	04060263          	beqz	a2,b690 <__ascii_mbtowc+0x48>
    b650:	04068863          	beqz	a3,b6a0 <__ascii_mbtowc+0x58>
    b654:	00064783          	lbu	a5,0(a2)
    b658:	00f5a023          	sw	a5,0(a1)
    b65c:	00064503          	lbu	a0,0(a2)
    b660:	00a03533          	snez	a0,a0
    b664:	00008067          	ret
    b668:	ff010113          	addi	sp,sp,-16
    b66c:	00c10593          	addi	a1,sp,12
    b670:	02060463          	beqz	a2,b698 <__ascii_mbtowc+0x50>
    b674:	02068a63          	beqz	a3,b6a8 <__ascii_mbtowc+0x60>
    b678:	00064783          	lbu	a5,0(a2)
    b67c:	00f5a023          	sw	a5,0(a1)
    b680:	00064503          	lbu	a0,0(a2)
    b684:	00a03533          	snez	a0,a0
    b688:	01010113          	addi	sp,sp,16
    b68c:	00008067          	ret
    b690:	00000513          	li	a0,0
    b694:	00008067          	ret
    b698:	00000513          	li	a0,0
    b69c:	fedff06f          	j	b688 <__ascii_mbtowc+0x40>
    b6a0:	ffe00513          	li	a0,-2
    b6a4:	00008067          	ret
    b6a8:	ffe00513          	li	a0,-2
    b6ac:	fddff06f          	j	b688 <__ascii_mbtowc+0x40>

0000b6b0 <_wctomb_r>:
    b6b0:	000147b7          	lui	a5,0x14
    b6b4:	ad47a783          	lw	a5,-1324(a5) # 13ad4 <__global_locale+0xe0>
    b6b8:	00078067          	jr	a5

0000b6bc <__ascii_wctomb>:
    b6bc:	02058463          	beqz	a1,b6e4 <__ascii_wctomb+0x28>
    b6c0:	0ff00793          	li	a5,255
    b6c4:	00c7e863          	bltu	a5,a2,b6d4 <__ascii_wctomb+0x18>
    b6c8:	00c58023          	sb	a2,0(a1)
    b6cc:	00100513          	li	a0,1
    b6d0:	00008067          	ret
    b6d4:	08a00793          	li	a5,138
    b6d8:	00f52023          	sw	a5,0(a0)
    b6dc:	fff00513          	li	a0,-1
    b6e0:	00008067          	ret
    b6e4:	00000513          	li	a0,0
    b6e8:	00008067          	ret

0000b6ec <_fiprintf_r>:
    b6ec:	fc010113          	addi	sp,sp,-64
    b6f0:	02c10313          	addi	t1,sp,44
    b6f4:	02d12623          	sw	a3,44(sp)
    b6f8:	00030693          	mv	a3,t1
    b6fc:	00112e23          	sw	ra,28(sp)
    b700:	02e12823          	sw	a4,48(sp)
    b704:	02f12a23          	sw	a5,52(sp)
    b708:	03012c23          	sw	a6,56(sp)
    b70c:	03112e23          	sw	a7,60(sp)
    b710:	00612623          	sw	t1,12(sp)
    b714:	060000ef          	jal	b774 <_vfiprintf_r>
    b718:	01c12083          	lw	ra,28(sp)
    b71c:	04010113          	addi	sp,sp,64
    b720:	00008067          	ret

0000b724 <fiprintf>:
    b724:	00050e13          	mv	t3,a0
    b728:	00014537          	lui	a0,0x14
    b72c:	fc010113          	addi	sp,sp,-64
    b730:	bcc52503          	lw	a0,-1076(a0) # 13bcc <_impure_ptr>
    b734:	02810313          	addi	t1,sp,40
    b738:	02c12423          	sw	a2,40(sp)
    b73c:	02d12623          	sw	a3,44(sp)
    b740:	00058613          	mv	a2,a1
    b744:	00030693          	mv	a3,t1
    b748:	000e0593          	mv	a1,t3
    b74c:	00112e23          	sw	ra,28(sp)
    b750:	02e12823          	sw	a4,48(sp)
    b754:	02f12a23          	sw	a5,52(sp)
    b758:	03012c23          	sw	a6,56(sp)
    b75c:	03112e23          	sw	a7,60(sp)
    b760:	00612623          	sw	t1,12(sp)
    b764:	010000ef          	jal	b774 <_vfiprintf_r>
    b768:	01c12083          	lw	ra,28(sp)
    b76c:	04010113          	addi	sp,sp,64
    b770:	00008067          	ret

0000b774 <_vfiprintf_r>:
    b774:	ed010113          	addi	sp,sp,-304
    b778:	11312e23          	sw	s3,284(sp)
    b77c:	11512a23          	sw	s5,276(sp)
    b780:	11612823          	sw	s6,272(sp)
    b784:	11712623          	sw	s7,268(sp)
    b788:	12112623          	sw	ra,300(sp)
    b78c:	11a12023          	sw	s10,256(sp)
    b790:	00050b93          	mv	s7,a0
    b794:	00058a93          	mv	s5,a1
    b798:	00060993          	mv	s3,a2
    b79c:	00068b13          	mv	s6,a3
    b7a0:	00050663          	beqz	a0,b7ac <_vfiprintf_r+0x38>
    b7a4:	03452783          	lw	a5,52(a0)
    b7a8:	76078ae3          	beqz	a5,c71c <_vfiprintf_r+0xfa8>
    b7ac:	00ca9703          	lh	a4,12(s5)
    b7b0:	064aa783          	lw	a5,100(s5)
    b7b4:	01271693          	slli	a3,a4,0x12
    b7b8:	0206c063          	bltz	a3,b7d8 <_vfiprintf_r+0x64>
    b7bc:	ffffe6b7          	lui	a3,0xffffe
    b7c0:	fff68693          	addi	a3,a3,-1 # ffffdfff <_memory_end+0xfffddfff>
    b7c4:	00002637          	lui	a2,0x2
    b7c8:	00c76733          	or	a4,a4,a2
    b7cc:	00d7f7b3          	and	a5,a5,a3
    b7d0:	00ea9623          	sh	a4,12(s5)
    b7d4:	06faa223          	sw	a5,100(s5)
    b7d8:	01279713          	slli	a4,a5,0x12
    b7dc:	00075463          	bgez	a4,b7e4 <_vfiprintf_r+0x70>
    b7e0:	0cc0106f          	j	c8ac <_vfiprintf_r+0x1138>
    b7e4:	00ca9783          	lh	a5,12(s5)
    b7e8:	0087f713          	andi	a4,a5,8
    b7ec:	2e070c63          	beqz	a4,bae4 <_vfiprintf_r+0x370>
    b7f0:	010aa703          	lw	a4,16(s5)
    b7f4:	2e070863          	beqz	a4,bae4 <_vfiprintf_r+0x370>
    b7f8:	01a7f793          	andi	a5,a5,26
    b7fc:	00a00713          	li	a4,10
    b800:	30e78263          	beq	a5,a4,bb04 <_vfiprintf_r+0x390>
    b804:	000137b7          	lui	a5,0x13
    b808:	00000d13          	li	s10,0
    b80c:	11812423          	sw	s8,264(sp)
    b810:	11912223          	sw	s9,260(sp)
    b814:	04c10c13          	addi	s8,sp,76
    b818:	18478793          	addi	a5,a5,388 # 13184 <_ctype_+0x104>
    b81c:	00013cb7          	lui	s9,0x13
    b820:	12812423          	sw	s0,296(sp)
    b824:	13212023          	sw	s2,288(sp)
    b828:	11412c23          	sw	s4,280(sp)
    b82c:	000d0913          	mv	s2,s10
    b830:	12912223          	sw	s1,292(sp)
    b834:	0fb12e23          	sw	s11,252(sp)
    b838:	05812023          	sw	s8,64(sp)
    b83c:	04012423          	sw	zero,72(sp)
    b840:	04012223          	sw	zero,68(sp)
    b844:	000c0413          	mv	s0,s8
    b848:	00012223          	sw	zero,4(sp)
    b84c:	00012a23          	sw	zero,20(sp)
    b850:	00012c23          	sw	zero,24(sp)
    b854:	00012e23          	sw	zero,28(sp)
    b858:	00f12023          	sw	a5,0(sp)
    b85c:	01000a13          	li	s4,16
    b860:	2f0c8c93          	addi	s9,s9,752 # 132f0 <zeroes.0>
    b864:	000b0d13          	mv	s10,s6
    b868:	0009c783          	lbu	a5,0(s3)
    b86c:	1c078863          	beqz	a5,ba3c <_vfiprintf_r+0x2c8>
    b870:	00098493          	mv	s1,s3
    b874:	02500713          	li	a4,37
    b878:	2ce78263          	beq	a5,a4,bb3c <_vfiprintf_r+0x3c8>
    b87c:	0014c783          	lbu	a5,1(s1)
    b880:	00148493          	addi	s1,s1,1
    b884:	fe079ae3          	bnez	a5,b878 <_vfiprintf_r+0x104>
    b888:	41348b33          	sub	s6,s1,s3
    b88c:	1b348863          	beq	s1,s3,ba3c <_vfiprintf_r+0x2c8>
    b890:	04812703          	lw	a4,72(sp)
    b894:	04412783          	lw	a5,68(sp)
    b898:	01342023          	sw	s3,0(s0)
    b89c:	01670733          	add	a4,a4,s6
    b8a0:	00178793          	addi	a5,a5,1
    b8a4:	01642223          	sw	s6,4(s0)
    b8a8:	04e12423          	sw	a4,72(sp)
    b8ac:	04f12223          	sw	a5,68(sp)
    b8b0:	00700713          	li	a4,7
    b8b4:	00840413          	addi	s0,s0,8
    b8b8:	28f74a63          	blt	a4,a5,bb4c <_vfiprintf_r+0x3d8>
    b8bc:	0004c783          	lbu	a5,0(s1)
    b8c0:	01690933          	add	s2,s2,s6
    b8c4:	16078c63          	beqz	a5,ba3c <_vfiprintf_r+0x2c8>
    b8c8:	0014c783          	lbu	a5,1(s1)
    b8cc:	00148993          	addi	s3,s1,1
    b8d0:	02010da3          	sb	zero,59(sp)
    b8d4:	fff00d93          	li	s11,-1
    b8d8:	00000b13          	li	s6,0
    b8dc:	00000813          	li	a6,0
    b8e0:	05a00493          	li	s1,90
    b8e4:	00198993          	addi	s3,s3,1
    b8e8:	00078613          	mv	a2,a5
    b8ec:	fe060713          	addi	a4,a2,-32 # 1fe0 <i2c_eeprom_read_byte+0x20>
    b8f0:	04e4e663          	bltu	s1,a4,b93c <_vfiprintf_r+0x1c8>
    b8f4:	00012783          	lw	a5,0(sp)
    b8f8:	00271713          	slli	a4,a4,0x2
    b8fc:	00f70733          	add	a4,a4,a5
    b900:	00072783          	lw	a5,0(a4)
    b904:	00078067          	jr	a5
    b908:	00000b13          	li	s6,0
    b90c:	fd060793          	addi	a5,a2,-48
    b910:	00900693          	li	a3,9
    b914:	0009c603          	lbu	a2,0(s3)
    b918:	002b1713          	slli	a4,s6,0x2
    b91c:	01670b33          	add	s6,a4,s6
    b920:	001b1b13          	slli	s6,s6,0x1
    b924:	01678b33          	add	s6,a5,s6
    b928:	fd060793          	addi	a5,a2,-48
    b92c:	00198993          	addi	s3,s3,1
    b930:	fef6f2e3          	bgeu	a3,a5,b914 <_vfiprintf_r+0x1a0>
    b934:	fe060713          	addi	a4,a2,-32
    b938:	fae4fee3          	bgeu	s1,a4,b8f4 <_vfiprintf_r+0x180>
    b93c:	10060063          	beqz	a2,ba3c <_vfiprintf_r+0x2c8>
    b940:	08c10623          	sb	a2,140(sp)
    b944:	02010da3          	sb	zero,59(sp)
    b948:	00100893          	li	a7,1
    b94c:	00100e13          	li	t3,1
    b950:	08c10493          	addi	s1,sp,140
    b954:	00000d93          	li	s11,0
    b958:	00000293          	li	t0,0
    b95c:	08487f93          	andi	t6,a6,132
    b960:	04812703          	lw	a4,72(sp)
    b964:	04412783          	lw	a5,68(sp)
    b968:	000f9663          	bnez	t6,b974 <_vfiprintf_r+0x200>
    b96c:	411b0eb3          	sub	t4,s6,a7
    b970:	1dd04ee3          	bgtz	t4,c34c <_vfiprintf_r+0xbd8>
    b974:	03b14603          	lbu	a2,59(sp)
    b978:	02060863          	beqz	a2,b9a8 <_vfiprintf_r+0x234>
    b97c:	03b10613          	addi	a2,sp,59
    b980:	00c42023          	sw	a2,0(s0)
    b984:	00178793          	addi	a5,a5,1
    b988:	00100613          	li	a2,1
    b98c:	00170713          	addi	a4,a4,1
    b990:	00c42223          	sw	a2,4(s0)
    b994:	04e12423          	sw	a4,72(sp)
    b998:	04f12223          	sw	a5,68(sp)
    b99c:	00700613          	li	a2,7
    b9a0:	00840413          	addi	s0,s0,8
    b9a4:	22f64463          	blt	a2,a5,bbcc <_vfiprintf_r+0x458>
    b9a8:	02028863          	beqz	t0,b9d8 <_vfiprintf_r+0x264>
    b9ac:	03c10613          	addi	a2,sp,60
    b9b0:	00c42023          	sw	a2,0(s0)
    b9b4:	00178793          	addi	a5,a5,1
    b9b8:	00200613          	li	a2,2
    b9bc:	00270713          	addi	a4,a4,2
    b9c0:	00c42223          	sw	a2,4(s0)
    b9c4:	04e12423          	sw	a4,72(sp)
    b9c8:	04f12223          	sw	a5,68(sp)
    b9cc:	00700613          	li	a2,7
    b9d0:	00840413          	addi	s0,s0,8
    b9d4:	2af642e3          	blt	a2,a5,c478 <_vfiprintf_r+0xd04>
    b9d8:	08000613          	li	a2,128
    b9dc:	6ccf8c63          	beq	t6,a2,c0b4 <_vfiprintf_r+0x940>
    b9e0:	41cd8db3          	sub	s11,s11,t3
    b9e4:	7fb04463          	bgtz	s11,c1cc <_vfiprintf_r+0xa58>
    b9e8:	00ee0733          	add	a4,t3,a4
    b9ec:	00178793          	addi	a5,a5,1
    b9f0:	00942023          	sw	s1,0(s0)
    b9f4:	01c42223          	sw	t3,4(s0)
    b9f8:	04e12423          	sw	a4,72(sp)
    b9fc:	04f12223          	sw	a5,68(sp)
    ba00:	00700613          	li	a2,7
    ba04:	00840413          	addi	s0,s0,8
    ba08:	0af64ee3          	blt	a2,a5,c2c4 <_vfiprintf_r+0xb50>
    ba0c:	00487813          	andi	a6,a6,4
    ba10:	00080663          	beqz	a6,ba1c <_vfiprintf_r+0x2a8>
    ba14:	411b04b3          	sub	s1,s6,a7
    ba18:	20904063          	bgtz	s1,bc18 <_vfiprintf_r+0x4a4>
    ba1c:	011b5463          	bge	s6,a7,ba24 <_vfiprintf_r+0x2b0>
    ba20:	00088b13          	mv	s6,a7
    ba24:	01690933          	add	s2,s2,s6
    ba28:	14071063          	bnez	a4,bb68 <_vfiprintf_r+0x3f4>
    ba2c:	0009c783          	lbu	a5,0(s3)
    ba30:	04012223          	sw	zero,68(sp)
    ba34:	000c0413          	mv	s0,s8
    ba38:	e2079ce3          	bnez	a5,b870 <_vfiprintf_r+0xfc>
    ba3c:	04812783          	lw	a5,72(sp)
    ba40:	00090d13          	mv	s10,s2
    ba44:	12078e63          	beqz	a5,bb80 <_vfiprintf_r+0x40c>
    ba48:	04010613          	addi	a2,sp,64
    ba4c:	000a8593          	mv	a1,s5
    ba50:	000b8513          	mv	a0,s7
    ba54:	ad0f90ef          	jal	4d24 <__sprint_r>
    ba58:	1280006f          	j	bb80 <_vfiprintf_r+0x40c>
    ba5c:	000d2b03          	lw	s6,0(s10)
    ba60:	004d0d13          	addi	s10,s10,4
    ba64:	380b4a63          	bltz	s6,bdf8 <_vfiprintf_r+0x684>
    ba68:	0009c783          	lbu	a5,0(s3)
    ba6c:	e79ff06f          	j	b8e4 <_vfiprintf_r+0x170>
    ba70:	0009c783          	lbu	a5,0(s3)
    ba74:	02086813          	ori	a6,a6,32
    ba78:	e6dff06f          	j	b8e4 <_vfiprintf_r+0x170>
    ba7c:	01086813          	ori	a6,a6,16
    ba80:	02087793          	andi	a5,a6,32
    ba84:	26078263          	beqz	a5,bce8 <_vfiprintf_r+0x574>
    ba88:	007d0d13          	addi	s10,s10,7
    ba8c:	ff8d7d13          	andi	s10,s10,-8
    ba90:	004d2703          	lw	a4,4(s10)
    ba94:	000d2783          	lw	a5,0(s10)
    ba98:	008d0d13          	addi	s10,s10,8
    ba9c:	00070893          	mv	a7,a4
    baa0:	26074a63          	bltz	a4,bd14 <_vfiprintf_r+0x5a0>
    baa4:	280dc863          	bltz	s11,bd34 <_vfiprintf_r+0x5c0>
    baa8:	0117e733          	or	a4,a5,a7
    baac:	f7f87813          	andi	a6,a6,-129
    bab0:	28071263          	bnez	a4,bd34 <_vfiprintf_r+0x5c0>
    bab4:	5e0d98e3          	bnez	s11,c8a4 <_vfiprintf_r+0x1130>
    bab8:	03b14783          	lbu	a5,59(sp)
    babc:	00000893          	li	a7,0
    bac0:	00000e13          	li	t3,0
    bac4:	0f010493          	addi	s1,sp,240
    bac8:	00078463          	beqz	a5,bad0 <_vfiprintf_r+0x35c>
    bacc:	00188893          	addi	a7,a7,1
    bad0:	00287293          	andi	t0,a6,2
    bad4:	e80284e3          	beqz	t0,b95c <_vfiprintf_r+0x1e8>
    bad8:	00288893          	addi	a7,a7,2
    badc:	00200293          	li	t0,2
    bae0:	e7dff06f          	j	b95c <_vfiprintf_r+0x1e8>
    bae4:	000a8593          	mv	a1,s5
    bae8:	000b8513          	mv	a0,s7
    baec:	880fa0ef          	jal	5b6c <__swsetup_r>
    baf0:	5a051ee3          	bnez	a0,c8ac <_vfiprintf_r+0x1138>
    baf4:	00ca9783          	lh	a5,12(s5)
    baf8:	00a00713          	li	a4,10
    bafc:	01a7f793          	andi	a5,a5,26
    bb00:	d0e792e3          	bne	a5,a4,b804 <_vfiprintf_r+0x90>
    bb04:	00ea9783          	lh	a5,14(s5)
    bb08:	ce07cee3          	bltz	a5,b804 <_vfiprintf_r+0x90>
    bb0c:	12c12083          	lw	ra,300(sp)
    bb10:	10012d03          	lw	s10,256(sp)
    bb14:	000b0693          	mv	a3,s6
    bb18:	00098613          	mv	a2,s3
    bb1c:	11012b03          	lw	s6,272(sp)
    bb20:	11c12983          	lw	s3,284(sp)
    bb24:	000a8593          	mv	a1,s5
    bb28:	000b8513          	mv	a0,s7
    bb2c:	11412a83          	lw	s5,276(sp)
    bb30:	10c12b83          	lw	s7,268(sp)
    bb34:	13010113          	addi	sp,sp,304
    bb38:	5b50006f          	j	c8ec <__sbprintf>
    bb3c:	41348b33          	sub	s6,s1,s3
    bb40:	d53498e3          	bne	s1,s3,b890 <_vfiprintf_r+0x11c>
    bb44:	0004c783          	lbu	a5,0(s1)
    bb48:	d7dff06f          	j	b8c4 <_vfiprintf_r+0x150>
    bb4c:	04010613          	addi	a2,sp,64
    bb50:	000a8593          	mv	a1,s5
    bb54:	000b8513          	mv	a0,s7
    bb58:	9ccf90ef          	jal	4d24 <__sprint_r>
    bb5c:	02051063          	bnez	a0,bb7c <_vfiprintf_r+0x408>
    bb60:	000c0413          	mv	s0,s8
    bb64:	d59ff06f          	j	b8bc <_vfiprintf_r+0x148>
    bb68:	04010613          	addi	a2,sp,64
    bb6c:	000a8593          	mv	a1,s5
    bb70:	000b8513          	mv	a0,s7
    bb74:	9b0f90ef          	jal	4d24 <__sprint_r>
    bb78:	ea050ae3          	beqz	a0,ba2c <_vfiprintf_r+0x2b8>
    bb7c:	00090d13          	mv	s10,s2
    bb80:	00cad783          	lhu	a5,12(s5)
    bb84:	12812403          	lw	s0,296(sp)
    bb88:	12412483          	lw	s1,292(sp)
    bb8c:	0407f793          	andi	a5,a5,64
    bb90:	12012903          	lw	s2,288(sp)
    bb94:	11812a03          	lw	s4,280(sp)
    bb98:	10812c03          	lw	s8,264(sp)
    bb9c:	10412c83          	lw	s9,260(sp)
    bba0:	0fc12d83          	lw	s11,252(sp)
    bba4:	500794e3          	bnez	a5,c8ac <_vfiprintf_r+0x1138>
    bba8:	12c12083          	lw	ra,300(sp)
    bbac:	11c12983          	lw	s3,284(sp)
    bbb0:	11412a83          	lw	s5,276(sp)
    bbb4:	11012b03          	lw	s6,272(sp)
    bbb8:	10c12b83          	lw	s7,268(sp)
    bbbc:	000d0513          	mv	a0,s10
    bbc0:	10012d03          	lw	s10,256(sp)
    bbc4:	13010113          	addi	sp,sp,304
    bbc8:	00008067          	ret
    bbcc:	04010613          	addi	a2,sp,64
    bbd0:	000a8593          	mv	a1,s5
    bbd4:	000b8513          	mv	a0,s7
    bbd8:	03112223          	sw	a7,36(sp)
    bbdc:	03c12023          	sw	t3,32(sp)
    bbe0:	01012823          	sw	a6,16(sp)
    bbe4:	01f12623          	sw	t6,12(sp)
    bbe8:	00512423          	sw	t0,8(sp)
    bbec:	938f90ef          	jal	4d24 <__sprint_r>
    bbf0:	f80516e3          	bnez	a0,bb7c <_vfiprintf_r+0x408>
    bbf4:	04812703          	lw	a4,72(sp)
    bbf8:	04412783          	lw	a5,68(sp)
    bbfc:	02412883          	lw	a7,36(sp)
    bc00:	02012e03          	lw	t3,32(sp)
    bc04:	01012803          	lw	a6,16(sp)
    bc08:	00c12f83          	lw	t6,12(sp)
    bc0c:	00812283          	lw	t0,8(sp)
    bc10:	000c0413          	mv	s0,s8
    bc14:	d95ff06f          	j	b9a8 <_vfiprintf_r+0x234>
    bc18:	00013337          	lui	t1,0x13
    bc1c:	01000613          	li	a2,16
    bc20:	04412783          	lw	a5,68(sp)
    bc24:	30030313          	addi	t1,t1,768 # 13300 <blanks.1>
    bc28:	06965e63          	bge	a2,s1,bca4 <_vfiprintf_r+0x530>
    bc2c:	00040693          	mv	a3,s0
    bc30:	01000d93          	li	s11,16
    bc34:	00700813          	li	a6,7
    bc38:	01112423          	sw	a7,8(sp)
    bc3c:	00030413          	mv	s0,t1
    bc40:	00c0006f          	j	bc4c <_vfiprintf_r+0x4d8>
    bc44:	ff048493          	addi	s1,s1,-16
    bc48:	049dd863          	bge	s11,s1,bc98 <_vfiprintf_r+0x524>
    bc4c:	01070713          	addi	a4,a4,16
    bc50:	00178793          	addi	a5,a5,1
    bc54:	0086a023          	sw	s0,0(a3)
    bc58:	01b6a223          	sw	s11,4(a3)
    bc5c:	04e12423          	sw	a4,72(sp)
    bc60:	04f12223          	sw	a5,68(sp)
    bc64:	00868693          	addi	a3,a3,8
    bc68:	fcf85ee3          	bge	a6,a5,bc44 <_vfiprintf_r+0x4d0>
    bc6c:	04010613          	addi	a2,sp,64
    bc70:	000a8593          	mv	a1,s5
    bc74:	000b8513          	mv	a0,s7
    bc78:	8acf90ef          	jal	4d24 <__sprint_r>
    bc7c:	f00510e3          	bnez	a0,bb7c <_vfiprintf_r+0x408>
    bc80:	ff048493          	addi	s1,s1,-16
    bc84:	04812703          	lw	a4,72(sp)
    bc88:	04412783          	lw	a5,68(sp)
    bc8c:	000c0693          	mv	a3,s8
    bc90:	00700813          	li	a6,7
    bc94:	fa9dcce3          	blt	s11,s1,bc4c <_vfiprintf_r+0x4d8>
    bc98:	00812883          	lw	a7,8(sp)
    bc9c:	00040313          	mv	t1,s0
    bca0:	00068413          	mv	s0,a3
    bca4:	00970733          	add	a4,a4,s1
    bca8:	00178793          	addi	a5,a5,1
    bcac:	00642023          	sw	t1,0(s0)
    bcb0:	00942223          	sw	s1,4(s0)
    bcb4:	04e12423          	sw	a4,72(sp)
    bcb8:	04f12223          	sw	a5,68(sp)
    bcbc:	00700613          	li	a2,7
    bcc0:	d4f65ee3          	bge	a2,a5,ba1c <_vfiprintf_r+0x2a8>
    bcc4:	04010613          	addi	a2,sp,64
    bcc8:	000a8593          	mv	a1,s5
    bccc:	000b8513          	mv	a0,s7
    bcd0:	01112423          	sw	a7,8(sp)
    bcd4:	850f90ef          	jal	4d24 <__sprint_r>
    bcd8:	ea0512e3          	bnez	a0,bb7c <_vfiprintf_r+0x408>
    bcdc:	04812703          	lw	a4,72(sp)
    bce0:	00812883          	lw	a7,8(sp)
    bce4:	d39ff06f          	j	ba1c <_vfiprintf_r+0x2a8>
    bce8:	01087713          	andi	a4,a6,16
    bcec:	000d2783          	lw	a5,0(s10)
    bcf0:	004d0d13          	addi	s10,s10,4
    bcf4:	0e071c63          	bnez	a4,bdec <_vfiprintf_r+0x678>
    bcf8:	04087713          	andi	a4,a6,64
    bcfc:	0e070463          	beqz	a4,bde4 <_vfiprintf_r+0x670>
    bd00:	01079793          	slli	a5,a5,0x10
    bd04:	4107d793          	srai	a5,a5,0x10
    bd08:	41f7d893          	srai	a7,a5,0x1f
    bd0c:	00088713          	mv	a4,a7
    bd10:	d8075ae3          	bgez	a4,baa4 <_vfiprintf_r+0x330>
    bd14:	02d00613          	li	a2,45
    bd18:	00f03733          	snez	a4,a5
    bd1c:	411008b3          	neg	a7,a7
    bd20:	02c10da3          	sb	a2,59(sp)
    bd24:	40e888b3          	sub	a7,a7,a4
    bd28:	40f007b3          	neg	a5,a5
    bd2c:	000dc463          	bltz	s11,bd34 <_vfiprintf_r+0x5c0>
    bd30:	f7f87813          	andi	a6,a6,-129
    bd34:	0c089ee3          	bnez	a7,c610 <_vfiprintf_r+0xe9c>
    bd38:	00900713          	li	a4,9
    bd3c:	0cf76ae3          	bltu	a4,a5,c610 <_vfiprintf_r+0xe9c>
    bd40:	03078793          	addi	a5,a5,48
    bd44:	0ff7f793          	zext.b	a5,a5
    bd48:	0ef107a3          	sb	a5,239(sp)
    bd4c:	000d8893          	mv	a7,s11
    bd50:	01b04463          	bgtz	s11,bd58 <_vfiprintf_r+0x5e4>
    bd54:	00100893          	li	a7,1
    bd58:	00100e13          	li	t3,1
    bd5c:	0ef10493          	addi	s1,sp,239
    bd60:	03b14783          	lbu	a5,59(sp)
    bd64:	d60794e3          	bnez	a5,bacc <_vfiprintf_r+0x358>
    bd68:	d69ff06f          	j	bad0 <_vfiprintf_r+0x35c>
    bd6c:	000d2483          	lw	s1,0(s10)
    bd70:	02010da3          	sb	zero,59(sp)
    bd74:	004d0d13          	addi	s10,s10,4
    bd78:	1c048ee3          	beqz	s1,c754 <_vfiprintf_r+0xfe0>
    bd7c:	01012423          	sw	a6,8(sp)
    bd80:	060dc6e3          	bltz	s11,c5ec <_vfiprintf_r+0xe78>
    bd84:	000d8613          	mv	a2,s11
    bd88:	00000593          	li	a1,0
    bd8c:	00048513          	mv	a0,s1
    bd90:	f21f90ef          	jal	5cb0 <memchr>
    bd94:	00812803          	lw	a6,8(sp)
    bd98:	000d8e13          	mv	t3,s11
    bd9c:	00050463          	beqz	a0,bda4 <_vfiprintf_r+0x630>
    bda0:	40950e33          	sub	t3,a0,s1
    bda4:	03b14783          	lbu	a5,59(sp)
    bda8:	fffe4893          	not	a7,t3
    bdac:	41f8d893          	srai	a7,a7,0x1f
    bdb0:	011e78b3          	and	a7,t3,a7
    bdb4:	00000d93          	li	s11,0
    bdb8:	00000293          	li	t0,0
    bdbc:	d00798e3          	bnez	a5,bacc <_vfiprintf_r+0x358>
    bdc0:	b9dff06f          	j	b95c <_vfiprintf_r+0x1e8>
    bdc4:	000d2783          	lw	a5,0(s10)
    bdc8:	02010da3          	sb	zero,59(sp)
    bdcc:	004d0d13          	addi	s10,s10,4
    bdd0:	08f10623          	sb	a5,140(sp)
    bdd4:	00100893          	li	a7,1
    bdd8:	00100e13          	li	t3,1
    bddc:	08c10493          	addi	s1,sp,140
    bde0:	b75ff06f          	j	b954 <_vfiprintf_r+0x1e0>
    bde4:	20087713          	andi	a4,a6,512
    bde8:	280716e3          	bnez	a4,c874 <_vfiprintf_r+0x1100>
    bdec:	41f7d893          	srai	a7,a5,0x1f
    bdf0:	00088713          	mv	a4,a7
    bdf4:	cadff06f          	j	baa0 <_vfiprintf_r+0x32c>
    bdf8:	41600b33          	neg	s6,s6
    bdfc:	0009c783          	lbu	a5,0(s3)
    be00:	00486813          	ori	a6,a6,4
    be04:	ae1ff06f          	j	b8e4 <_vfiprintf_r+0x170>
    be08:	02b00713          	li	a4,43
    be0c:	0009c783          	lbu	a5,0(s3)
    be10:	02e10da3          	sb	a4,59(sp)
    be14:	ad1ff06f          	j	b8e4 <_vfiprintf_r+0x170>
    be18:	0009c783          	lbu	a5,0(s3)
    be1c:	08086813          	ori	a6,a6,128
    be20:	ac5ff06f          	j	b8e4 <_vfiprintf_r+0x170>
    be24:	0009c603          	lbu	a2,0(s3)
    be28:	02a00793          	li	a5,42
    be2c:	00198693          	addi	a3,s3,1
    be30:	28f602e3          	beq	a2,a5,c8b4 <_vfiprintf_r+0x1140>
    be34:	fd060793          	addi	a5,a2,-48
    be38:	00900713          	li	a4,9
    be3c:	00000d93          	li	s11,0
    be40:	00900593          	li	a1,9
    be44:	02f76463          	bltu	a4,a5,be6c <_vfiprintf_r+0x6f8>
    be48:	0006c603          	lbu	a2,0(a3)
    be4c:	002d9713          	slli	a4,s11,0x2
    be50:	01b70db3          	add	s11,a4,s11
    be54:	001d9d93          	slli	s11,s11,0x1
    be58:	00fd8db3          	add	s11,s11,a5
    be5c:	fd060793          	addi	a5,a2,-48
    be60:	00168693          	addi	a3,a3,1
    be64:	fef5f2e3          	bgeu	a1,a5,be48 <_vfiprintf_r+0x6d4>
    be68:	6e0dc263          	bltz	s11,c54c <_vfiprintf_r+0xdd8>
    be6c:	00068993          	mv	s3,a3
    be70:	a7dff06f          	j	b8ec <_vfiprintf_r+0x178>
    be74:	000b8513          	mv	a0,s7
    be78:	01012423          	sw	a6,8(sp)
    be7c:	fadf90ef          	jal	5e28 <_localeconv_r>
    be80:	00452783          	lw	a5,4(a0)
    be84:	00078513          	mv	a0,a5
    be88:	00f12e23          	sw	a5,28(sp)
    be8c:	dccfa0ef          	jal	6458 <strlen>
    be90:	00050793          	mv	a5,a0
    be94:	000b8513          	mv	a0,s7
    be98:	00f12c23          	sw	a5,24(sp)
    be9c:	f8df90ef          	jal	5e28 <_localeconv_r>
    bea0:	00852703          	lw	a4,8(a0)
    bea4:	01812783          	lw	a5,24(sp)
    bea8:	00812803          	lw	a6,8(sp)
    beac:	00e12a23          	sw	a4,20(sp)
    beb0:	ba078ce3          	beqz	a5,ba68 <_vfiprintf_r+0x2f4>
    beb4:	01412703          	lw	a4,20(sp)
    beb8:	0009c783          	lbu	a5,0(s3)
    bebc:	a20704e3          	beqz	a4,b8e4 <_vfiprintf_r+0x170>
    bec0:	00074703          	lbu	a4,0(a4)
    bec4:	a20700e3          	beqz	a4,b8e4 <_vfiprintf_r+0x170>
    bec8:	40086813          	ori	a6,a6,1024
    becc:	a19ff06f          	j	b8e4 <_vfiprintf_r+0x170>
    bed0:	0009c783          	lbu	a5,0(s3)
    bed4:	00186813          	ori	a6,a6,1
    bed8:	a0dff06f          	j	b8e4 <_vfiprintf_r+0x170>
    bedc:	03b14703          	lbu	a4,59(sp)
    bee0:	0009c783          	lbu	a5,0(s3)
    bee4:	a00710e3          	bnez	a4,b8e4 <_vfiprintf_r+0x170>
    bee8:	02000713          	li	a4,32
    beec:	02e10da3          	sb	a4,59(sp)
    bef0:	9f5ff06f          	j	b8e4 <_vfiprintf_r+0x170>
    bef4:	01086713          	ori	a4,a6,16
    bef8:	02077793          	andi	a5,a4,32
    befc:	5e078463          	beqz	a5,c4e4 <_vfiprintf_r+0xd70>
    bf00:	007d0d13          	addi	s10,s10,7
    bf04:	ff8d7d13          	andi	s10,s10,-8
    bf08:	000d2783          	lw	a5,0(s10)
    bf0c:	004d2583          	lw	a1,4(s10)
    bf10:	008d0d13          	addi	s10,s10,8
    bf14:	02010da3          	sb	zero,59(sp)
    bf18:	bff77813          	andi	a6,a4,-1025
    bf1c:	0c0dc063          	bltz	s11,bfdc <_vfiprintf_r+0x868>
    bf20:	00b7e633          	or	a2,a5,a1
    bf24:	b7f77713          	andi	a4,a4,-1153
    bf28:	7e061263          	bnez	a2,c70c <_vfiprintf_r+0xf98>
    bf2c:	00080e13          	mv	t3,a6
    bf30:	00000793          	li	a5,0
    bf34:	00070813          	mv	a6,a4
    bf38:	080d9663          	bnez	s11,bfc4 <_vfiprintf_r+0x850>
    bf3c:	b6079ee3          	bnez	a5,bab8 <_vfiprintf_r+0x344>
    bf40:	001e7e13          	andi	t3,t3,1
    bf44:	5c0e0c63          	beqz	t3,c51c <_vfiprintf_r+0xda8>
    bf48:	03000793          	li	a5,48
    bf4c:	0ef107a3          	sb	a5,239(sp)
    bf50:	000e0893          	mv	a7,t3
    bf54:	0ef10493          	addi	s1,sp,239
    bf58:	e09ff06f          	j	bd60 <_vfiprintf_r+0x5ec>
    bf5c:	0009c783          	lbu	a5,0(s3)
    bf60:	06c00713          	li	a4,108
    bf64:	7ce78863          	beq	a5,a4,c734 <_vfiprintf_r+0xfc0>
    bf68:	01086813          	ori	a6,a6,16
    bf6c:	979ff06f          	j	b8e4 <_vfiprintf_r+0x170>
    bf70:	0009c783          	lbu	a5,0(s3)
    bf74:	06800713          	li	a4,104
    bf78:	7ae78663          	beq	a5,a4,c724 <_vfiprintf_r+0xfb0>
    bf7c:	04086813          	ori	a6,a6,64
    bf80:	965ff06f          	j	b8e4 <_vfiprintf_r+0x170>
    bf84:	01086e13          	ori	t3,a6,16
    bf88:	020e7793          	andi	a5,t3,32
    bf8c:	52078863          	beqz	a5,c4bc <_vfiprintf_r+0xd48>
    bf90:	007d0d13          	addi	s10,s10,7
    bf94:	ff8d7d13          	andi	s10,s10,-8
    bf98:	000d2783          	lw	a5,0(s10)
    bf9c:	004d2883          	lw	a7,4(s10)
    bfa0:	008d0d13          	addi	s10,s10,8
    bfa4:	02010da3          	sb	zero,59(sp)
    bfa8:	000e0813          	mv	a6,t3
    bfac:	d80dc4e3          	bltz	s11,bd34 <_vfiprintf_r+0x5c0>
    bfb0:	0117e733          	or	a4,a5,a7
    bfb4:	f7fe7813          	andi	a6,t3,-129
    bfb8:	d6071ee3          	bnez	a4,bd34 <_vfiprintf_r+0x5c0>
    bfbc:	00100793          	li	a5,1
    bfc0:	f60d8ee3          	beqz	s11,bf3c <_vfiprintf_r+0x7c8>
    bfc4:	00100713          	li	a4,1
    bfc8:	0ce78ee3          	beq	a5,a4,c8a4 <_vfiprintf_r+0x1130>
    bfcc:	00200713          	li	a4,2
    bfd0:	7ae78863          	beq	a5,a4,c780 <_vfiprintf_r+0x100c>
    bfd4:	00000793          	li	a5,0
    bfd8:	00000593          	li	a1,0
    bfdc:	0f010493          	addi	s1,sp,240
    bfe0:	01d59693          	slli	a3,a1,0x1d
    bfe4:	0077f713          	andi	a4,a5,7
    bfe8:	0037d793          	srli	a5,a5,0x3
    bfec:	03070713          	addi	a4,a4,48
    bff0:	00f6e7b3          	or	a5,a3,a5
    bff4:	0035d593          	srli	a1,a1,0x3
    bff8:	fee48fa3          	sb	a4,-1(s1)
    bffc:	00b7e6b3          	or	a3,a5,a1
    c000:	00048513          	mv	a0,s1
    c004:	fff48493          	addi	s1,s1,-1
    c008:	fc069ce3          	bnez	a3,bfe0 <_vfiprintf_r+0x86c>
    c00c:	00187793          	andi	a5,a6,1
    c010:	32078263          	beqz	a5,c334 <_vfiprintf_r+0xbc0>
    c014:	03000793          	li	a5,48
    c018:	30f70e63          	beq	a4,a5,c334 <_vfiprintf_r+0xbc0>
    c01c:	ffe50513          	addi	a0,a0,-2
    c020:	fef48fa3          	sb	a5,-1(s1)
    c024:	0f010793          	addi	a5,sp,240
    c028:	40a78e33          	sub	t3,a5,a0
    c02c:	000d8893          	mv	a7,s11
    c030:	51cdc863          	blt	s11,t3,c540 <_vfiprintf_r+0xdcc>
    c034:	00050493          	mv	s1,a0
    c038:	d29ff06f          	j	bd60 <_vfiprintf_r+0x5ec>
    c03c:	00008737          	lui	a4,0x8
    c040:	83070713          	addi	a4,a4,-2000 # 7830 <__gdtoa+0x9d4>
    c044:	02e11e23          	sh	a4,60(sp)
    c048:	3b018713          	addi	a4,gp,944 # 12b80 <keypad_map+0x20>
    c04c:	000d2783          	lw	a5,0(s10)
    c050:	00000593          	li	a1,0
    c054:	00286813          	ori	a6,a6,2
    c058:	004d0d13          	addi	s10,s10,4
    c05c:	00e12223          	sw	a4,4(sp)
    c060:	02010da3          	sb	zero,59(sp)
    c064:	280dce63          	bltz	s11,c300 <_vfiprintf_r+0xb8c>
    c068:	00b7e733          	or	a4,a5,a1
    c06c:	f7f87613          	andi	a2,a6,-129
    c070:	28071263          	bnez	a4,c2f4 <_vfiprintf_r+0xb80>
    c074:	00080e13          	mv	t3,a6
    c078:	00200793          	li	a5,2
    c07c:	00060813          	mv	a6,a2
    c080:	eb9ff06f          	j	bf38 <_vfiprintf_r+0x7c4>
    c084:	02087793          	andi	a5,a6,32
    c088:	4a079063          	bnez	a5,c528 <_vfiprintf_r+0xdb4>
    c08c:	01087793          	andi	a5,a6,16
    c090:	6a079a63          	bnez	a5,c744 <_vfiprintf_r+0xfd0>
    c094:	04087793          	andi	a5,a6,64
    c098:	7e079863          	bnez	a5,c888 <_vfiprintf_r+0x1114>
    c09c:	20087813          	andi	a6,a6,512
    c0a0:	6a080263          	beqz	a6,c744 <_vfiprintf_r+0xfd0>
    c0a4:	000d2783          	lw	a5,0(s10)
    c0a8:	004d0d13          	addi	s10,s10,4
    c0ac:	01278023          	sb	s2,0(a5)
    c0b0:	fb8ff06f          	j	b868 <_vfiprintf_r+0xf4>
    c0b4:	411b0333          	sub	t1,s6,a7
    c0b8:	926054e3          	blez	t1,b9e0 <_vfiprintf_r+0x26c>
    c0bc:	00013f37          	lui	t5,0x13
    c0c0:	01000613          	li	a2,16
    c0c4:	2f0f0f13          	addi	t5,t5,752 # 132f0 <zeroes.0>
    c0c8:	0a665063          	bge	a2,t1,c168 <_vfiprintf_r+0x9f4>
    c0cc:	00912423          	sw	s1,8(sp)
    c0d0:	00040693          	mv	a3,s0
    c0d4:	01000e93          	li	t4,16
    c0d8:	00700f93          	li	t6,7
    c0dc:	01012623          	sw	a6,12(sp)
    c0e0:	01c12823          	sw	t3,16(sp)
    c0e4:	00030413          	mv	s0,t1
    c0e8:	03112023          	sw	a7,32(sp)
    c0ec:	000f0493          	mv	s1,t5
    c0f0:	00c0006f          	j	c0fc <_vfiprintf_r+0x988>
    c0f4:	ff040413          	addi	s0,s0,-16
    c0f8:	048eda63          	bge	t4,s0,c14c <_vfiprintf_r+0x9d8>
    c0fc:	01070713          	addi	a4,a4,16
    c100:	00178793          	addi	a5,a5,1
    c104:	0096a023          	sw	s1,0(a3)
    c108:	01d6a223          	sw	t4,4(a3)
    c10c:	04e12423          	sw	a4,72(sp)
    c110:	04f12223          	sw	a5,68(sp)
    c114:	00868693          	addi	a3,a3,8
    c118:	fcffdee3          	bge	t6,a5,c0f4 <_vfiprintf_r+0x980>
    c11c:	04010613          	addi	a2,sp,64
    c120:	000a8593          	mv	a1,s5
    c124:	000b8513          	mv	a0,s7
    c128:	bfdf80ef          	jal	4d24 <__sprint_r>
    c12c:	a40518e3          	bnez	a0,bb7c <_vfiprintf_r+0x408>
    c130:	01000e93          	li	t4,16
    c134:	ff040413          	addi	s0,s0,-16
    c138:	04812703          	lw	a4,72(sp)
    c13c:	04412783          	lw	a5,68(sp)
    c140:	000c0693          	mv	a3,s8
    c144:	00700f93          	li	t6,7
    c148:	fa8ecae3          	blt	t4,s0,c0fc <_vfiprintf_r+0x988>
    c14c:	00048f13          	mv	t5,s1
    c150:	00c12803          	lw	a6,12(sp)
    c154:	01012e03          	lw	t3,16(sp)
    c158:	02012883          	lw	a7,32(sp)
    c15c:	00812483          	lw	s1,8(sp)
    c160:	00040313          	mv	t1,s0
    c164:	00068413          	mv	s0,a3
    c168:	00670733          	add	a4,a4,t1
    c16c:	00178793          	addi	a5,a5,1
    c170:	01e42023          	sw	t5,0(s0)
    c174:	00642223          	sw	t1,4(s0)
    c178:	04e12423          	sw	a4,72(sp)
    c17c:	04f12223          	sw	a5,68(sp)
    c180:	00700613          	li	a2,7
    c184:	00840413          	addi	s0,s0,8
    c188:	84f65ce3          	bge	a2,a5,b9e0 <_vfiprintf_r+0x26c>
    c18c:	04010613          	addi	a2,sp,64
    c190:	000a8593          	mv	a1,s5
    c194:	000b8513          	mv	a0,s7
    c198:	01112823          	sw	a7,16(sp)
    c19c:	01c12623          	sw	t3,12(sp)
    c1a0:	01012423          	sw	a6,8(sp)
    c1a4:	b81f80ef          	jal	4d24 <__sprint_r>
    c1a8:	9c051ae3          	bnez	a0,bb7c <_vfiprintf_r+0x408>
    c1ac:	00c12e03          	lw	t3,12(sp)
    c1b0:	04812703          	lw	a4,72(sp)
    c1b4:	04412783          	lw	a5,68(sp)
    c1b8:	41cd8db3          	sub	s11,s11,t3
    c1bc:	01012883          	lw	a7,16(sp)
    c1c0:	00812803          	lw	a6,8(sp)
    c1c4:	000c0413          	mv	s0,s8
    c1c8:	83b050e3          	blez	s11,b9e8 <_vfiprintf_r+0x274>
    c1cc:	00013f37          	lui	t5,0x13
    c1d0:	2f0f0f13          	addi	t5,t5,752 # 132f0 <zeroes.0>
    c1d4:	09ba5863          	bge	s4,s11,c264 <_vfiprintf_r+0xaf0>
    c1d8:	00040693          	mv	a3,s0
    c1dc:	00700313          	li	t1,7
    c1e0:	000d8413          	mv	s0,s11
    c1e4:	01012423          	sw	a6,8(sp)
    c1e8:	01c12623          	sw	t3,12(sp)
    c1ec:	01112823          	sw	a7,16(sp)
    c1f0:	000c8d93          	mv	s11,s9
    c1f4:	00c0006f          	j	c200 <_vfiprintf_r+0xa8c>
    c1f8:	ff040413          	addi	s0,s0,-16
    c1fc:	048a5863          	bge	s4,s0,c24c <_vfiprintf_r+0xad8>
    c200:	01070713          	addi	a4,a4,16
    c204:	00178793          	addi	a5,a5,1
    c208:	0196a023          	sw	s9,0(a3)
    c20c:	0146a223          	sw	s4,4(a3)
    c210:	04e12423          	sw	a4,72(sp)
    c214:	04f12223          	sw	a5,68(sp)
    c218:	00868693          	addi	a3,a3,8
    c21c:	fcf35ee3          	bge	t1,a5,c1f8 <_vfiprintf_r+0xa84>
    c220:	04010613          	addi	a2,sp,64
    c224:	000a8593          	mv	a1,s5
    c228:	000b8513          	mv	a0,s7
    c22c:	af9f80ef          	jal	4d24 <__sprint_r>
    c230:	940516e3          	bnez	a0,bb7c <_vfiprintf_r+0x408>
    c234:	ff040413          	addi	s0,s0,-16
    c238:	04812703          	lw	a4,72(sp)
    c23c:	04412783          	lw	a5,68(sp)
    c240:	000c0693          	mv	a3,s8
    c244:	00700313          	li	t1,7
    c248:	fa8a4ce3          	blt	s4,s0,c200 <_vfiprintf_r+0xa8c>
    c24c:	00812803          	lw	a6,8(sp)
    c250:	00c12e03          	lw	t3,12(sp)
    c254:	01012883          	lw	a7,16(sp)
    c258:	000d8f13          	mv	t5,s11
    c25c:	00040d93          	mv	s11,s0
    c260:	00068413          	mv	s0,a3
    c264:	01b70733          	add	a4,a4,s11
    c268:	00178793          	addi	a5,a5,1
    c26c:	01e42023          	sw	t5,0(s0)
    c270:	01b42223          	sw	s11,4(s0)
    c274:	04e12423          	sw	a4,72(sp)
    c278:	04f12223          	sw	a5,68(sp)
    c27c:	00700613          	li	a2,7
    c280:	00840413          	addi	s0,s0,8
    c284:	f6f65263          	bge	a2,a5,b9e8 <_vfiprintf_r+0x274>
    c288:	04010613          	addi	a2,sp,64
    c28c:	000a8593          	mv	a1,s5
    c290:	000b8513          	mv	a0,s7
    c294:	01112823          	sw	a7,16(sp)
    c298:	01c12623          	sw	t3,12(sp)
    c29c:	01012423          	sw	a6,8(sp)
    c2a0:	a85f80ef          	jal	4d24 <__sprint_r>
    c2a4:	8c051ce3          	bnez	a0,bb7c <_vfiprintf_r+0x408>
    c2a8:	04812703          	lw	a4,72(sp)
    c2ac:	04412783          	lw	a5,68(sp)
    c2b0:	01012883          	lw	a7,16(sp)
    c2b4:	00c12e03          	lw	t3,12(sp)
    c2b8:	00812803          	lw	a6,8(sp)
    c2bc:	000c0413          	mv	s0,s8
    c2c0:	f28ff06f          	j	b9e8 <_vfiprintf_r+0x274>
    c2c4:	04010613          	addi	a2,sp,64
    c2c8:	000a8593          	mv	a1,s5
    c2cc:	000b8513          	mv	a0,s7
    c2d0:	01112623          	sw	a7,12(sp)
    c2d4:	01012423          	sw	a6,8(sp)
    c2d8:	a4df80ef          	jal	4d24 <__sprint_r>
    c2dc:	8a0510e3          	bnez	a0,bb7c <_vfiprintf_r+0x408>
    c2e0:	04812703          	lw	a4,72(sp)
    c2e4:	00c12883          	lw	a7,12(sp)
    c2e8:	00812803          	lw	a6,8(sp)
    c2ec:	000c0413          	mv	s0,s8
    c2f0:	f1cff06f          	j	ba0c <_vfiprintf_r+0x298>
    c2f4:	00200713          	li	a4,2
    c2f8:	00060813          	mv	a6,a2
    c2fc:	ce0700e3          	beqz	a4,bfdc <_vfiprintf_r+0x868>
    c300:	00412603          	lw	a2,4(sp)
    c304:	0f010493          	addi	s1,sp,240
    c308:	00f7f713          	andi	a4,a5,15
    c30c:	00e60733          	add	a4,a2,a4
    c310:	00074683          	lbu	a3,0(a4)
    c314:	0047d793          	srli	a5,a5,0x4
    c318:	01c59713          	slli	a4,a1,0x1c
    c31c:	00f767b3          	or	a5,a4,a5
    c320:	0045d593          	srli	a1,a1,0x4
    c324:	fed48fa3          	sb	a3,-1(s1)
    c328:	00b7e733          	or	a4,a5,a1
    c32c:	fff48493          	addi	s1,s1,-1
    c330:	fc071ce3          	bnez	a4,c308 <_vfiprintf_r+0xb94>
    c334:	0f010793          	addi	a5,sp,240
    c338:	40978e33          	sub	t3,a5,s1
    c33c:	000d8893          	mv	a7,s11
    c340:	a3cdd0e3          	bge	s11,t3,bd60 <_vfiprintf_r+0x5ec>
    c344:	000e0893          	mv	a7,t3
    c348:	a19ff06f          	j	bd60 <_vfiprintf_r+0x5ec>
    c34c:	00013337          	lui	t1,0x13
    c350:	01000613          	li	a2,16
    c354:	30030313          	addi	t1,t1,768 # 13300 <blanks.1>
    c358:	0bd65863          	bge	a2,t4,c408 <_vfiprintf_r+0xc94>
    c35c:	00912823          	sw	s1,16(sp)
    c360:	00040693          	mv	a3,s0
    c364:	01000f13          	li	t5,16
    c368:	00700393          	li	t2,7
    c36c:	00512423          	sw	t0,8(sp)
    c370:	01f12623          	sw	t6,12(sp)
    c374:	03012023          	sw	a6,32(sp)
    c378:	03c12223          	sw	t3,36(sp)
    c37c:	000e8413          	mv	s0,t4
    c380:	03112423          	sw	a7,40(sp)
    c384:	00030493          	mv	s1,t1
    c388:	00c0006f          	j	c394 <_vfiprintf_r+0xc20>
    c38c:	ff040413          	addi	s0,s0,-16
    c390:	048f5a63          	bge	t5,s0,c3e4 <_vfiprintf_r+0xc70>
    c394:	01070713          	addi	a4,a4,16
    c398:	00178793          	addi	a5,a5,1
    c39c:	0096a023          	sw	s1,0(a3)
    c3a0:	01e6a223          	sw	t5,4(a3)
    c3a4:	04e12423          	sw	a4,72(sp)
    c3a8:	04f12223          	sw	a5,68(sp)
    c3ac:	00868693          	addi	a3,a3,8
    c3b0:	fcf3dee3          	bge	t2,a5,c38c <_vfiprintf_r+0xc18>
    c3b4:	04010613          	addi	a2,sp,64
    c3b8:	000a8593          	mv	a1,s5
    c3bc:	000b8513          	mv	a0,s7
    c3c0:	965f80ef          	jal	4d24 <__sprint_r>
    c3c4:	fa051c63          	bnez	a0,bb7c <_vfiprintf_r+0x408>
    c3c8:	01000f13          	li	t5,16
    c3cc:	ff040413          	addi	s0,s0,-16
    c3d0:	04812703          	lw	a4,72(sp)
    c3d4:	04412783          	lw	a5,68(sp)
    c3d8:	000c0693          	mv	a3,s8
    c3dc:	00700393          	li	t2,7
    c3e0:	fa8f4ae3          	blt	t5,s0,c394 <_vfiprintf_r+0xc20>
    c3e4:	00048313          	mv	t1,s1
    c3e8:	00812283          	lw	t0,8(sp)
    c3ec:	00c12f83          	lw	t6,12(sp)
    c3f0:	02012803          	lw	a6,32(sp)
    c3f4:	02412e03          	lw	t3,36(sp)
    c3f8:	02812883          	lw	a7,40(sp)
    c3fc:	01012483          	lw	s1,16(sp)
    c400:	00040e93          	mv	t4,s0
    c404:	00068413          	mv	s0,a3
    c408:	01d70733          	add	a4,a4,t4
    c40c:	00178793          	addi	a5,a5,1
    c410:	00642023          	sw	t1,0(s0)
    c414:	01d42223          	sw	t4,4(s0)
    c418:	04e12423          	sw	a4,72(sp)
    c41c:	04f12223          	sw	a5,68(sp)
    c420:	00700613          	li	a2,7
    c424:	00840413          	addi	s0,s0,8
    c428:	d4f65663          	bge	a2,a5,b974 <_vfiprintf_r+0x200>
    c42c:	04010613          	addi	a2,sp,64
    c430:	000a8593          	mv	a1,s5
    c434:	000b8513          	mv	a0,s7
    c438:	03112223          	sw	a7,36(sp)
    c43c:	03c12023          	sw	t3,32(sp)
    c440:	01012823          	sw	a6,16(sp)
    c444:	01f12623          	sw	t6,12(sp)
    c448:	00512423          	sw	t0,8(sp)
    c44c:	8d9f80ef          	jal	4d24 <__sprint_r>
    c450:	f2051663          	bnez	a0,bb7c <_vfiprintf_r+0x408>
    c454:	04812703          	lw	a4,72(sp)
    c458:	04412783          	lw	a5,68(sp)
    c45c:	02412883          	lw	a7,36(sp)
    c460:	02012e03          	lw	t3,32(sp)
    c464:	01012803          	lw	a6,16(sp)
    c468:	00c12f83          	lw	t6,12(sp)
    c46c:	00812283          	lw	t0,8(sp)
    c470:	000c0413          	mv	s0,s8
    c474:	d00ff06f          	j	b974 <_vfiprintf_r+0x200>
    c478:	04010613          	addi	a2,sp,64
    c47c:	000a8593          	mv	a1,s5
    c480:	000b8513          	mv	a0,s7
    c484:	03112023          	sw	a7,32(sp)
    c488:	01c12823          	sw	t3,16(sp)
    c48c:	01012623          	sw	a6,12(sp)
    c490:	01f12423          	sw	t6,8(sp)
    c494:	891f80ef          	jal	4d24 <__sprint_r>
    c498:	ee051263          	bnez	a0,bb7c <_vfiprintf_r+0x408>
    c49c:	04812703          	lw	a4,72(sp)
    c4a0:	04412783          	lw	a5,68(sp)
    c4a4:	02012883          	lw	a7,32(sp)
    c4a8:	01012e03          	lw	t3,16(sp)
    c4ac:	00c12803          	lw	a6,12(sp)
    c4b0:	00812f83          	lw	t6,8(sp)
    c4b4:	000c0413          	mv	s0,s8
    c4b8:	d20ff06f          	j	b9d8 <_vfiprintf_r+0x264>
    c4bc:	010e7713          	andi	a4,t3,16
    c4c0:	000d2783          	lw	a5,0(s10)
    c4c4:	004d0d13          	addi	s10,s10,4
    c4c8:	00071a63          	bnez	a4,c4dc <_vfiprintf_r+0xd68>
    c4cc:	040e7713          	andi	a4,t3,64
    c4d0:	28070e63          	beqz	a4,c76c <_vfiprintf_r+0xff8>
    c4d4:	01079793          	slli	a5,a5,0x10
    c4d8:	0107d793          	srli	a5,a5,0x10
    c4dc:	00000893          	li	a7,0
    c4e0:	ac5ff06f          	j	bfa4 <_vfiprintf_r+0x830>
    c4e4:	01077613          	andi	a2,a4,16
    c4e8:	000d2783          	lw	a5,0(s10)
    c4ec:	004d0d13          	addi	s10,s10,4
    c4f0:	02061263          	bnez	a2,c514 <_vfiprintf_r+0xda0>
    c4f4:	04077613          	andi	a2,a4,64
    c4f8:	00060a63          	beqz	a2,c50c <_vfiprintf_r+0xd98>
    c4fc:	01079793          	slli	a5,a5,0x10
    c500:	0107d793          	srli	a5,a5,0x10
    c504:	00000593          	li	a1,0
    c508:	a0dff06f          	j	bf14 <_vfiprintf_r+0x7a0>
    c50c:	20077613          	andi	a2,a4,512
    c510:	38061463          	bnez	a2,c898 <_vfiprintf_r+0x1124>
    c514:	00000593          	li	a1,0
    c518:	9fdff06f          	j	bf14 <_vfiprintf_r+0x7a0>
    c51c:	00000893          	li	a7,0
    c520:	0f010493          	addi	s1,sp,240
    c524:	83dff06f          	j	bd60 <_vfiprintf_r+0x5ec>
    c528:	000d2783          	lw	a5,0(s10)
    c52c:	41f95713          	srai	a4,s2,0x1f
    c530:	004d0d13          	addi	s10,s10,4
    c534:	0127a023          	sw	s2,0(a5)
    c538:	00e7a223          	sw	a4,4(a5)
    c53c:	b2cff06f          	j	b868 <_vfiprintf_r+0xf4>
    c540:	000e0893          	mv	a7,t3
    c544:	00050493          	mv	s1,a0
    c548:	819ff06f          	j	bd60 <_vfiprintf_r+0x5ec>
    c54c:	fff00d93          	li	s11,-1
    c550:	00068993          	mv	s3,a3
    c554:	b98ff06f          	j	b8ec <_vfiprintf_r+0x178>
    c558:	00080e13          	mv	t3,a6
    c55c:	a2dff06f          	j	bf88 <_vfiprintf_r+0x814>
    c560:	00080713          	mv	a4,a6
    c564:	995ff06f          	j	bef8 <_vfiprintf_r+0x784>
    c568:	3c418793          	addi	a5,gp,964 # 12b94 <keypad_map+0x34>
    c56c:	00f12223          	sw	a5,4(sp)
    c570:	02087793          	andi	a5,a6,32
    c574:	04078863          	beqz	a5,c5c4 <_vfiprintf_r+0xe50>
    c578:	007d0d13          	addi	s10,s10,7
    c57c:	ff8d7d13          	andi	s10,s10,-8
    c580:	000d2783          	lw	a5,0(s10)
    c584:	004d2583          	lw	a1,4(s10)
    c588:	008d0d13          	addi	s10,s10,8
    c58c:	00187713          	andi	a4,a6,1
    c590:	00070e63          	beqz	a4,c5ac <_vfiprintf_r+0xe38>
    c594:	00b7e733          	or	a4,a5,a1
    c598:	00070a63          	beqz	a4,c5ac <_vfiprintf_r+0xe38>
    c59c:	03000713          	li	a4,48
    c5a0:	02e10e23          	sb	a4,60(sp)
    c5a4:	02c10ea3          	sb	a2,61(sp)
    c5a8:	00286813          	ori	a6,a6,2
    c5ac:	bff87813          	andi	a6,a6,-1025
    c5b0:	ab1ff06f          	j	c060 <_vfiprintf_r+0x8ec>
    c5b4:	3b018793          	addi	a5,gp,944 # 12b80 <keypad_map+0x20>
    c5b8:	00f12223          	sw	a5,4(sp)
    c5bc:	02087793          	andi	a5,a6,32
    c5c0:	fa079ce3          	bnez	a5,c578 <_vfiprintf_r+0xe04>
    c5c4:	01087713          	andi	a4,a6,16
    c5c8:	000d2783          	lw	a5,0(s10)
    c5cc:	004d0d13          	addi	s10,s10,4
    c5d0:	02071c63          	bnez	a4,c608 <_vfiprintf_r+0xe94>
    c5d4:	04087713          	andi	a4,a6,64
    c5d8:	02070463          	beqz	a4,c600 <_vfiprintf_r+0xe8c>
    c5dc:	01079793          	slli	a5,a5,0x10
    c5e0:	0107d793          	srli	a5,a5,0x10
    c5e4:	00000593          	li	a1,0
    c5e8:	fa5ff06f          	j	c58c <_vfiprintf_r+0xe18>
    c5ec:	00048513          	mv	a0,s1
    c5f0:	e69f90ef          	jal	6458 <strlen>
    c5f4:	00812803          	lw	a6,8(sp)
    c5f8:	00050e13          	mv	t3,a0
    c5fc:	fa8ff06f          	j	bda4 <_vfiprintf_r+0x630>
    c600:	20087713          	andi	a4,a6,512
    c604:	26071263          	bnez	a4,c868 <_vfiprintf_r+0x10f4>
    c608:	00000593          	li	a1,0
    c60c:	f81ff06f          	j	c58c <_vfiprintf_r+0xe18>
    c610:	ccccdf37          	lui	t5,0xccccd
    c614:	ccccdfb7          	lui	t6,0xccccd
    c618:	01412283          	lw	t0,20(sp)
    c61c:	40087e13          	andi	t3,a6,1024
    c620:	00000593          	li	a1,0
    c624:	0f010513          	addi	a0,sp,240
    c628:	00500313          	li	t1,5
    c62c:	ccdf0f13          	addi	t5,t5,-819 # cccccccd <_memory_end+0xcccacccd>
    c630:	cccf8f93          	addi	t6,t6,-820 # cccccccc <_memory_end+0xcccacccc>
    c634:	0ff00e93          	li	t4,255
    c638:	0540006f          	j	c68c <_vfiprintf_r+0xf18>
    c63c:	00f4b733          	sltu	a4,s1,a5
    c640:	00e48733          	add	a4,s1,a4
    c644:	02677733          	remu	a4,a4,t1
    c648:	40e78733          	sub	a4,a5,a4
    c64c:	00e7b633          	sltu	a2,a5,a4
    c650:	40c88633          	sub	a2,a7,a2
    c654:	03f703b3          	mul	t2,a4,t6
    c658:	03e60633          	mul	a2,a2,t5
    c65c:	03e73533          	mulhu	a0,a4,t5
    c660:	00760633          	add	a2,a2,t2
    c664:	03e70733          	mul	a4,a4,t5
    c668:	00a60633          	add	a2,a2,a0
    c66c:	01f61513          	slli	a0,a2,0x1f
    c670:	00165613          	srli	a2,a2,0x1
    c674:	00175713          	srli	a4,a4,0x1
    c678:	00e56733          	or	a4,a0,a4
    c67c:	1c088c63          	beqz	a7,c854 <_vfiprintf_r+0x10e0>
    c680:	00070793          	mv	a5,a4
    c684:	00060893          	mv	a7,a2
    c688:	00068513          	mv	a0,a3
    c68c:	011784b3          	add	s1,a5,a7
    c690:	00f4b733          	sltu	a4,s1,a5
    c694:	00e48733          	add	a4,s1,a4
    c698:	02677733          	remu	a4,a4,t1
    c69c:	fff50693          	addi	a3,a0,-1
    c6a0:	00158593          	addi	a1,a1,1
    c6a4:	40e78733          	sub	a4,a5,a4
    c6a8:	00e7b3b3          	sltu	t2,a5,a4
    c6ac:	407883b3          	sub	t2,a7,t2
    c6b0:	03e73633          	mulhu	a2,a4,t5
    c6b4:	03e383b3          	mul	t2,t2,t5
    c6b8:	03e70733          	mul	a4,a4,t5
    c6bc:	00c383b3          	add	t2,t2,a2
    c6c0:	01f39393          	slli	t2,t2,0x1f
    c6c4:	00175613          	srli	a2,a4,0x1
    c6c8:	00c3e633          	or	a2,t2,a2
    c6cc:	00261713          	slli	a4,a2,0x2
    c6d0:	00c70733          	add	a4,a4,a2
    c6d4:	00171713          	slli	a4,a4,0x1
    c6d8:	40e78733          	sub	a4,a5,a4
    c6dc:	03070713          	addi	a4,a4,48
    c6e0:	fee50fa3          	sb	a4,-1(a0)
    c6e4:	f40e0ce3          	beqz	t3,c63c <_vfiprintf_r+0xec8>
    c6e8:	0002c703          	lbu	a4,0(t0)
    c6ec:	f4b718e3          	bne	a4,a1,c63c <_vfiprintf_r+0xec8>
    c6f0:	f5d586e3          	beq	a1,t4,c63c <_vfiprintf_r+0xec8>
    c6f4:	08089c63          	bnez	a7,c78c <_vfiprintf_r+0x1018>
    c6f8:	00900713          	li	a4,9
    c6fc:	08f76863          	bltu	a4,a5,c78c <_vfiprintf_r+0x1018>
    c700:	00068493          	mv	s1,a3
    c704:	00512a23          	sw	t0,20(sp)
    c708:	c2dff06f          	j	c334 <_vfiprintf_r+0xbc0>
    c70c:	00070813          	mv	a6,a4
    c710:	00000713          	li	a4,0
    c714:	8c0704e3          	beqz	a4,bfdc <_vfiprintf_r+0x868>
    c718:	be9ff06f          	j	c300 <_vfiprintf_r+0xb8c>
    c71c:	cc1f80ef          	jal	53dc <__sinit>
    c720:	88cff06f          	j	b7ac <_vfiprintf_r+0x38>
    c724:	0019c783          	lbu	a5,1(s3)
    c728:	20086813          	ori	a6,a6,512
    c72c:	00198993          	addi	s3,s3,1
    c730:	9b4ff06f          	j	b8e4 <_vfiprintf_r+0x170>
    c734:	0019c783          	lbu	a5,1(s3)
    c738:	02086813          	ori	a6,a6,32
    c73c:	00198993          	addi	s3,s3,1
    c740:	9a4ff06f          	j	b8e4 <_vfiprintf_r+0x170>
    c744:	000d2783          	lw	a5,0(s10)
    c748:	004d0d13          	addi	s10,s10,4
    c74c:	0127a023          	sw	s2,0(a5)
    c750:	918ff06f          	j	b868 <_vfiprintf_r+0xf4>
    c754:	00600793          	li	a5,6
    c758:	000d8e13          	mv	t3,s11
    c75c:	11b7e263          	bltu	a5,s11,c860 <_vfiprintf_r+0x10ec>
    c760:	000e0893          	mv	a7,t3
    c764:	3d818493          	addi	s1,gp,984 # 12ba8 <keypad_map+0x48>
    c768:	9ecff06f          	j	b954 <_vfiprintf_r+0x1e0>
    c76c:	200e7713          	andi	a4,t3,512
    c770:	d60706e3          	beqz	a4,c4dc <_vfiprintf_r+0xd68>
    c774:	0ff7f793          	zext.b	a5,a5
    c778:	00000893          	li	a7,0
    c77c:	829ff06f          	j	bfa4 <_vfiprintf_r+0x830>
    c780:	00000793          	li	a5,0
    c784:	00000593          	li	a1,0
    c788:	b79ff06f          	j	c300 <_vfiprintf_r+0xb8c>
    c78c:	02f12423          	sw	a5,40(sp)
    c790:	01812783          	lw	a5,24(sp)
    c794:	01c12583          	lw	a1,28(sp)
    c798:	03112623          	sw	a7,44(sp)
    c79c:	40f686b3          	sub	a3,a3,a5
    c7a0:	00078613          	mv	a2,a5
    c7a4:	00068513          	mv	a0,a3
    c7a8:	03f12223          	sw	t6,36(sp)
    c7ac:	03e12023          	sw	t5,32(sp)
    c7b0:	01c12a23          	sw	t3,20(sp)
    c7b4:	01012823          	sw	a6,16(sp)
    c7b8:	00512623          	sw	t0,12(sp)
    c7bc:	00d12423          	sw	a3,8(sp)
    c7c0:	db4f90ef          	jal	5d74 <strncpy>
    c7c4:	02812783          	lw	a5,40(sp)
    c7c8:	00500613          	li	a2,5
    c7cc:	00c12283          	lw	t0,12(sp)
    c7d0:	00f4b733          	sltu	a4,s1,a5
    c7d4:	00e48733          	add	a4,s1,a4
    c7d8:	02c77733          	remu	a4,a4,a2
    c7dc:	0012c603          	lbu	a2,1(t0)
    c7e0:	02c12883          	lw	a7,44(sp)
    c7e4:	ccccd537          	lui	a0,0xccccd
    c7e8:	00c03633          	snez	a2,a2
    c7ec:	ccccd3b7          	lui	t2,0xccccd
    c7f0:	00c282b3          	add	t0,t0,a2
    c7f4:	ccd50513          	addi	a0,a0,-819 # cccccccd <_memory_end+0xcccacccd>
    c7f8:	ccc38393          	addi	t2,t2,-820 # cccccccc <_memory_end+0xcccacccc>
    c7fc:	00812683          	lw	a3,8(sp)
    c800:	01012803          	lw	a6,16(sp)
    c804:	01412e03          	lw	t3,20(sp)
    c808:	02012f03          	lw	t5,32(sp)
    c80c:	02412f83          	lw	t6,36(sp)
    c810:	00000593          	li	a1,0
    c814:	00500313          	li	t1,5
    c818:	0ff00e93          	li	t4,255
    c81c:	40e78733          	sub	a4,a5,a4
    c820:	00e7b633          	sltu	a2,a5,a4
    c824:	40c88633          	sub	a2,a7,a2
    c828:	027703b3          	mul	t2,a4,t2
    c82c:	02a60633          	mul	a2,a2,a0
    c830:	02a738b3          	mulhu	a7,a4,a0
    c834:	00760633          	add	a2,a2,t2
    c838:	02a707b3          	mul	a5,a4,a0
    c83c:	01160633          	add	a2,a2,a7
    c840:	01f61713          	slli	a4,a2,0x1f
    c844:	00165613          	srli	a2,a2,0x1
    c848:	0017d793          	srli	a5,a5,0x1
    c84c:	00f76733          	or	a4,a4,a5
    c850:	e31ff06f          	j	c680 <_vfiprintf_r+0xf0c>
    c854:	00900513          	li	a0,9
    c858:	e2f564e3          	bltu	a0,a5,c680 <_vfiprintf_r+0xf0c>
    c85c:	ea5ff06f          	j	c700 <_vfiprintf_r+0xf8c>
    c860:	00600e13          	li	t3,6
    c864:	efdff06f          	j	c760 <_vfiprintf_r+0xfec>
    c868:	0ff7f793          	zext.b	a5,a5
    c86c:	00000593          	li	a1,0
    c870:	d1dff06f          	j	c58c <_vfiprintf_r+0xe18>
    c874:	01879793          	slli	a5,a5,0x18
    c878:	4187d793          	srai	a5,a5,0x18
    c87c:	41f7d893          	srai	a7,a5,0x1f
    c880:	00088713          	mv	a4,a7
    c884:	a1cff06f          	j	baa0 <_vfiprintf_r+0x32c>
    c888:	000d2783          	lw	a5,0(s10)
    c88c:	004d0d13          	addi	s10,s10,4
    c890:	01279023          	sh	s2,0(a5)
    c894:	fd5fe06f          	j	b868 <_vfiprintf_r+0xf4>
    c898:	0ff7f793          	zext.b	a5,a5
    c89c:	00000593          	li	a1,0
    c8a0:	e74ff06f          	j	bf14 <_vfiprintf_r+0x7a0>
    c8a4:	03000793          	li	a5,48
    c8a8:	ca0ff06f          	j	bd48 <_vfiprintf_r+0x5d4>
    c8ac:	fff00d13          	li	s10,-1
    c8b0:	af8ff06f          	j	bba8 <_vfiprintf_r+0x434>
    c8b4:	000d2d83          	lw	s11,0(s10)
    c8b8:	004d0d13          	addi	s10,s10,4
    c8bc:	000dd463          	bgez	s11,c8c4 <_vfiprintf_r+0x1150>
    c8c0:	fff00d93          	li	s11,-1
    c8c4:	0019c783          	lbu	a5,1(s3)
    c8c8:	00068993          	mv	s3,a3
    c8cc:	818ff06f          	j	b8e4 <_vfiprintf_r+0x170>

0000c8d0 <vfiprintf>:
    c8d0:	00014737          	lui	a4,0x14
    c8d4:	00050793          	mv	a5,a0
    c8d8:	bcc72503          	lw	a0,-1076(a4) # 13bcc <_impure_ptr>
    c8dc:	00060693          	mv	a3,a2
    c8e0:	00058613          	mv	a2,a1
    c8e4:	00078593          	mv	a1,a5
    c8e8:	e8dfe06f          	j	b774 <_vfiprintf_r>

0000c8ec <__sbprintf>:
    c8ec:	b8010113          	addi	sp,sp,-1152
    c8f0:	00c59783          	lh	a5,12(a1)
    c8f4:	00e5d703          	lhu	a4,14(a1)
    c8f8:	46812c23          	sw	s0,1144(sp)
    c8fc:	00058413          	mv	s0,a1
    c900:	000105b7          	lui	a1,0x10
    c904:	ffd58593          	addi	a1,a1,-3 # fffd <__multf3+0xd45>
    c908:	06442e03          	lw	t3,100(s0)
    c90c:	01c42303          	lw	t1,28(s0)
    c910:	02442883          	lw	a7,36(s0)
    c914:	01071713          	slli	a4,a4,0x10
    c918:	00b7f7b3          	and	a5,a5,a1
    c91c:	00e7e7b3          	or	a5,a5,a4
    c920:	40000813          	li	a6,1024
    c924:	00f12a23          	sw	a5,20(sp)
    c928:	00810593          	addi	a1,sp,8
    c92c:	07010793          	addi	a5,sp,112
    c930:	46912a23          	sw	s1,1140(sp)
    c934:	47212823          	sw	s2,1136(sp)
    c938:	46112e23          	sw	ra,1148(sp)
    c93c:	00050913          	mv	s2,a0
    c940:	07c12623          	sw	t3,108(sp)
    c944:	02612223          	sw	t1,36(sp)
    c948:	03112623          	sw	a7,44(sp)
    c94c:	00f12423          	sw	a5,8(sp)
    c950:	00f12c23          	sw	a5,24(sp)
    c954:	01012823          	sw	a6,16(sp)
    c958:	01012e23          	sw	a6,28(sp)
    c95c:	02012023          	sw	zero,32(sp)
    c960:	e15fe0ef          	jal	b774 <_vfiprintf_r>
    c964:	00050493          	mv	s1,a0
    c968:	02055c63          	bgez	a0,c9a0 <__sbprintf+0xb4>
    c96c:	01415783          	lhu	a5,20(sp)
    c970:	0407f793          	andi	a5,a5,64
    c974:	00078863          	beqz	a5,c984 <__sbprintf+0x98>
    c978:	00c45783          	lhu	a5,12(s0)
    c97c:	0407e793          	ori	a5,a5,64
    c980:	00f41623          	sh	a5,12(s0)
    c984:	47c12083          	lw	ra,1148(sp)
    c988:	47812403          	lw	s0,1144(sp)
    c98c:	47012903          	lw	s2,1136(sp)
    c990:	00048513          	mv	a0,s1
    c994:	47412483          	lw	s1,1140(sp)
    c998:	48010113          	addi	sp,sp,1152
    c99c:	00008067          	ret
    c9a0:	00810593          	addi	a1,sp,8
    c9a4:	00090513          	mv	a0,s2
    c9a8:	e14f80ef          	jal	4fbc <_fflush_r>
    c9ac:	fc0500e3          	beqz	a0,c96c <__sbprintf+0x80>
    c9b0:	fff00493          	li	s1,-1
    c9b4:	fb9ff06f          	j	c96c <__sbprintf+0x80>

0000c9b8 <__errno>:
    c9b8:	000147b7          	lui	a5,0x14
    c9bc:	bcc7a503          	lw	a0,-1076(a5) # 13bcc <_impure_ptr>
    c9c0:	00008067          	ret

0000c9c4 <abort>:
    c9c4:	ff010113          	addi	sp,sp,-16
    c9c8:	00600513          	li	a0,6
    c9cc:	00112623          	sw	ra,12(sp)
    c9d0:	2a8000ef          	jal	cc78 <raise>
    c9d4:	00100513          	li	a0,1
    c9d8:	945f50ef          	jal	231c <_exit>

0000c9dc <_init_signal_r>:
    c9dc:	11852783          	lw	a5,280(a0)
    c9e0:	00078663          	beqz	a5,c9ec <_init_signal_r+0x10>
    c9e4:	00000513          	li	a0,0
    c9e8:	00008067          	ret
    c9ec:	ff010113          	addi	sp,sp,-16
    c9f0:	08000593          	li	a1,128
    c9f4:	00812423          	sw	s0,8(sp)
    c9f8:	00112623          	sw	ra,12(sp)
    c9fc:	00050413          	mv	s0,a0
    ca00:	cc0fc0ef          	jal	8ec0 <_malloc_r>
    ca04:	10a42c23          	sw	a0,280(s0)
    ca08:	02050463          	beqz	a0,ca30 <_init_signal_r+0x54>
    ca0c:	08050793          	addi	a5,a0,128
    ca10:	00052023          	sw	zero,0(a0)
    ca14:	00450513          	addi	a0,a0,4
    ca18:	fef51ce3          	bne	a0,a5,ca10 <_init_signal_r+0x34>
    ca1c:	00000513          	li	a0,0
    ca20:	00c12083          	lw	ra,12(sp)
    ca24:	00812403          	lw	s0,8(sp)
    ca28:	01010113          	addi	sp,sp,16
    ca2c:	00008067          	ret
    ca30:	fff00513          	li	a0,-1
    ca34:	fedff06f          	j	ca20 <_init_signal_r+0x44>

0000ca38 <_signal_r>:
    ca38:	fe010113          	addi	sp,sp,-32
    ca3c:	00912a23          	sw	s1,20(sp)
    ca40:	00112e23          	sw	ra,28(sp)
    ca44:	01f00793          	li	a5,31
    ca48:	00050493          	mv	s1,a0
    ca4c:	02b7ec63          	bltu	a5,a1,ca84 <_signal_r+0x4c>
    ca50:	11852783          	lw	a5,280(a0)
    ca54:	00812c23          	sw	s0,24(sp)
    ca58:	00058413          	mv	s0,a1
    ca5c:	02078c63          	beqz	a5,ca94 <_signal_r+0x5c>
    ca60:	00241413          	slli	s0,s0,0x2
    ca64:	008787b3          	add	a5,a5,s0
    ca68:	01812403          	lw	s0,24(sp)
    ca6c:	0007a503          	lw	a0,0(a5)
    ca70:	00c7a023          	sw	a2,0(a5)
    ca74:	01c12083          	lw	ra,28(sp)
    ca78:	01412483          	lw	s1,20(sp)
    ca7c:	02010113          	addi	sp,sp,32
    ca80:	00008067          	ret
    ca84:	01600793          	li	a5,22
    ca88:	00f52023          	sw	a5,0(a0)
    ca8c:	fff00513          	li	a0,-1
    ca90:	fe5ff06f          	j	ca74 <_signal_r+0x3c>
    ca94:	08000593          	li	a1,128
    ca98:	00c12623          	sw	a2,12(sp)
    ca9c:	c24fc0ef          	jal	8ec0 <_malloc_r>
    caa0:	10a4ac23          	sw	a0,280(s1)
    caa4:	00c12603          	lw	a2,12(sp)
    caa8:	00050793          	mv	a5,a0
    caac:	00050713          	mv	a4,a0
    cab0:	08050693          	addi	a3,a0,128
    cab4:	00050a63          	beqz	a0,cac8 <_signal_r+0x90>
    cab8:	00072023          	sw	zero,0(a4)
    cabc:	00470713          	addi	a4,a4,4
    cac0:	fed71ce3          	bne	a4,a3,cab8 <_signal_r+0x80>
    cac4:	f9dff06f          	j	ca60 <_signal_r+0x28>
    cac8:	01812403          	lw	s0,24(sp)
    cacc:	fff00513          	li	a0,-1
    cad0:	fa5ff06f          	j	ca74 <_signal_r+0x3c>

0000cad4 <_raise_r>:
    cad4:	ff010113          	addi	sp,sp,-16
    cad8:	00912223          	sw	s1,4(sp)
    cadc:	00112623          	sw	ra,12(sp)
    cae0:	01f00793          	li	a5,31
    cae4:	00050493          	mv	s1,a0
    cae8:	0ab7e063          	bltu	a5,a1,cb88 <_raise_r+0xb4>
    caec:	11852783          	lw	a5,280(a0)
    caf0:	00812423          	sw	s0,8(sp)
    caf4:	00058413          	mv	s0,a1
    caf8:	04078463          	beqz	a5,cb40 <_raise_r+0x6c>
    cafc:	00259713          	slli	a4,a1,0x2
    cb00:	00e787b3          	add	a5,a5,a4
    cb04:	0007a703          	lw	a4,0(a5)
    cb08:	02070c63          	beqz	a4,cb40 <_raise_r+0x6c>
    cb0c:	00100693          	li	a3,1
    cb10:	00d70c63          	beq	a4,a3,cb28 <_raise_r+0x54>
    cb14:	fff00693          	li	a3,-1
    cb18:	04d70863          	beq	a4,a3,cb68 <_raise_r+0x94>
    cb1c:	0007a023          	sw	zero,0(a5)
    cb20:	00058513          	mv	a0,a1
    cb24:	000700e7          	jalr	a4
    cb28:	00812403          	lw	s0,8(sp)
    cb2c:	00000513          	li	a0,0
    cb30:	00c12083          	lw	ra,12(sp)
    cb34:	00412483          	lw	s1,4(sp)
    cb38:	01010113          	addi	sp,sp,16
    cb3c:	00008067          	ret
    cb40:	00048513          	mv	a0,s1
    cb44:	450000ef          	jal	cf94 <_getpid_r>
    cb48:	00040613          	mv	a2,s0
    cb4c:	00812403          	lw	s0,8(sp)
    cb50:	00c12083          	lw	ra,12(sp)
    cb54:	00050593          	mv	a1,a0
    cb58:	00048513          	mv	a0,s1
    cb5c:	00412483          	lw	s1,4(sp)
    cb60:	01010113          	addi	sp,sp,16
    cb64:	3c80006f          	j	cf2c <_kill_r>
    cb68:	00812403          	lw	s0,8(sp)
    cb6c:	00c12083          	lw	ra,12(sp)
    cb70:	01600793          	li	a5,22
    cb74:	00f52023          	sw	a5,0(a0)
    cb78:	00412483          	lw	s1,4(sp)
    cb7c:	00100513          	li	a0,1
    cb80:	01010113          	addi	sp,sp,16
    cb84:	00008067          	ret
    cb88:	01600793          	li	a5,22
    cb8c:	00f52023          	sw	a5,0(a0)
    cb90:	fff00513          	li	a0,-1
    cb94:	f9dff06f          	j	cb30 <_raise_r+0x5c>

0000cb98 <__sigtramp_r>:
    cb98:	01f00793          	li	a5,31
    cb9c:	0cb7ea63          	bltu	a5,a1,cc70 <__sigtramp_r+0xd8>
    cba0:	11852783          	lw	a5,280(a0)
    cba4:	ff010113          	addi	sp,sp,-16
    cba8:	00812423          	sw	s0,8(sp)
    cbac:	00912223          	sw	s1,4(sp)
    cbb0:	00112623          	sw	ra,12(sp)
    cbb4:	00058413          	mv	s0,a1
    cbb8:	00050493          	mv	s1,a0
    cbbc:	08078063          	beqz	a5,cc3c <__sigtramp_r+0xa4>
    cbc0:	00241713          	slli	a4,s0,0x2
    cbc4:	00e787b3          	add	a5,a5,a4
    cbc8:	0007a703          	lw	a4,0(a5)
    cbcc:	02070c63          	beqz	a4,cc04 <__sigtramp_r+0x6c>
    cbd0:	fff00693          	li	a3,-1
    cbd4:	06d70063          	beq	a4,a3,cc34 <__sigtramp_r+0x9c>
    cbd8:	00100693          	li	a3,1
    cbdc:	04d70063          	beq	a4,a3,cc1c <__sigtramp_r+0x84>
    cbe0:	00040513          	mv	a0,s0
    cbe4:	0007a023          	sw	zero,0(a5)
    cbe8:	000700e7          	jalr	a4
    cbec:	00000513          	li	a0,0
    cbf0:	00c12083          	lw	ra,12(sp)
    cbf4:	00812403          	lw	s0,8(sp)
    cbf8:	00412483          	lw	s1,4(sp)
    cbfc:	01010113          	addi	sp,sp,16
    cc00:	00008067          	ret
    cc04:	00c12083          	lw	ra,12(sp)
    cc08:	00812403          	lw	s0,8(sp)
    cc0c:	00412483          	lw	s1,4(sp)
    cc10:	00100513          	li	a0,1
    cc14:	01010113          	addi	sp,sp,16
    cc18:	00008067          	ret
    cc1c:	00c12083          	lw	ra,12(sp)
    cc20:	00812403          	lw	s0,8(sp)
    cc24:	00412483          	lw	s1,4(sp)
    cc28:	00300513          	li	a0,3
    cc2c:	01010113          	addi	sp,sp,16
    cc30:	00008067          	ret
    cc34:	00200513          	li	a0,2
    cc38:	fb9ff06f          	j	cbf0 <__sigtramp_r+0x58>
    cc3c:	08000593          	li	a1,128
    cc40:	a80fc0ef          	jal	8ec0 <_malloc_r>
    cc44:	10a4ac23          	sw	a0,280(s1)
    cc48:	00050793          	mv	a5,a0
    cc4c:	00050e63          	beqz	a0,cc68 <__sigtramp_r+0xd0>
    cc50:	00050713          	mv	a4,a0
    cc54:	08050693          	addi	a3,a0,128
    cc58:	00072023          	sw	zero,0(a4)
    cc5c:	00470713          	addi	a4,a4,4
    cc60:	fed71ce3          	bne	a4,a3,cc58 <__sigtramp_r+0xc0>
    cc64:	f5dff06f          	j	cbc0 <__sigtramp_r+0x28>
    cc68:	fff00513          	li	a0,-1
    cc6c:	f85ff06f          	j	cbf0 <__sigtramp_r+0x58>
    cc70:	fff00513          	li	a0,-1
    cc74:	00008067          	ret

0000cc78 <raise>:
    cc78:	ff010113          	addi	sp,sp,-16
    cc7c:	00912223          	sw	s1,4(sp)
    cc80:	00014737          	lui	a4,0x14
    cc84:	00112623          	sw	ra,12(sp)
    cc88:	01f00793          	li	a5,31
    cc8c:	bcc72483          	lw	s1,-1076(a4) # 13bcc <_impure_ptr>
    cc90:	08a7ee63          	bltu	a5,a0,cd2c <raise+0xb4>
    cc94:	1184a783          	lw	a5,280(s1)
    cc98:	00812423          	sw	s0,8(sp)
    cc9c:	00050413          	mv	s0,a0
    cca0:	04078263          	beqz	a5,cce4 <raise+0x6c>
    cca4:	00251713          	slli	a4,a0,0x2
    cca8:	00e787b3          	add	a5,a5,a4
    ccac:	0007a703          	lw	a4,0(a5)
    ccb0:	02070a63          	beqz	a4,cce4 <raise+0x6c>
    ccb4:	00100693          	li	a3,1
    ccb8:	00d70a63          	beq	a4,a3,cccc <raise+0x54>
    ccbc:	fff00693          	li	a3,-1
    ccc0:	04d70663          	beq	a4,a3,cd0c <raise+0x94>
    ccc4:	0007a023          	sw	zero,0(a5)
    ccc8:	000700e7          	jalr	a4
    cccc:	00812403          	lw	s0,8(sp)
    ccd0:	00000513          	li	a0,0
    ccd4:	00c12083          	lw	ra,12(sp)
    ccd8:	00412483          	lw	s1,4(sp)
    ccdc:	01010113          	addi	sp,sp,16
    cce0:	00008067          	ret
    cce4:	00048513          	mv	a0,s1
    cce8:	2ac000ef          	jal	cf94 <_getpid_r>
    ccec:	00040613          	mv	a2,s0
    ccf0:	00812403          	lw	s0,8(sp)
    ccf4:	00c12083          	lw	ra,12(sp)
    ccf8:	00050593          	mv	a1,a0
    ccfc:	00048513          	mv	a0,s1
    cd00:	00412483          	lw	s1,4(sp)
    cd04:	01010113          	addi	sp,sp,16
    cd08:	2240006f          	j	cf2c <_kill_r>
    cd0c:	00812403          	lw	s0,8(sp)
    cd10:	00c12083          	lw	ra,12(sp)
    cd14:	01600793          	li	a5,22
    cd18:	00f4a023          	sw	a5,0(s1)
    cd1c:	00100513          	li	a0,1
    cd20:	00412483          	lw	s1,4(sp)
    cd24:	01010113          	addi	sp,sp,16
    cd28:	00008067          	ret
    cd2c:	01600793          	li	a5,22
    cd30:	00f4a023          	sw	a5,0(s1)
    cd34:	fff00513          	li	a0,-1
    cd38:	f9dff06f          	j	ccd4 <raise+0x5c>

0000cd3c <signal>:
    cd3c:	ff010113          	addi	sp,sp,-16
    cd40:	01212023          	sw	s2,0(sp)
    cd44:	00014737          	lui	a4,0x14
    cd48:	00112623          	sw	ra,12(sp)
    cd4c:	01f00793          	li	a5,31
    cd50:	bcc72903          	lw	s2,-1076(a4) # 13bcc <_impure_ptr>
    cd54:	04a7e263          	bltu	a5,a0,cd98 <signal+0x5c>
    cd58:	00812423          	sw	s0,8(sp)
    cd5c:	00050413          	mv	s0,a0
    cd60:	11892503          	lw	a0,280(s2)
    cd64:	00912223          	sw	s1,4(sp)
    cd68:	00058493          	mv	s1,a1
    cd6c:	02050e63          	beqz	a0,cda8 <signal+0x6c>
    cd70:	00241413          	slli	s0,s0,0x2
    cd74:	008507b3          	add	a5,a0,s0
    cd78:	0007a503          	lw	a0,0(a5)
    cd7c:	00812403          	lw	s0,8(sp)
    cd80:	0097a023          	sw	s1,0(a5)
    cd84:	00412483          	lw	s1,4(sp)
    cd88:	00c12083          	lw	ra,12(sp)
    cd8c:	00012903          	lw	s2,0(sp)
    cd90:	01010113          	addi	sp,sp,16
    cd94:	00008067          	ret
    cd98:	01600793          	li	a5,22
    cd9c:	00f92023          	sw	a5,0(s2)
    cda0:	fff00513          	li	a0,-1
    cda4:	fe5ff06f          	j	cd88 <signal+0x4c>
    cda8:	08000593          	li	a1,128
    cdac:	00090513          	mv	a0,s2
    cdb0:	910fc0ef          	jal	8ec0 <_malloc_r>
    cdb4:	10a92c23          	sw	a0,280(s2)
    cdb8:	00050793          	mv	a5,a0
    cdbc:	08050713          	addi	a4,a0,128
    cdc0:	00050a63          	beqz	a0,cdd4 <signal+0x98>
    cdc4:	0007a023          	sw	zero,0(a5)
    cdc8:	00478793          	addi	a5,a5,4
    cdcc:	fef71ce3          	bne	a4,a5,cdc4 <signal+0x88>
    cdd0:	fa1ff06f          	j	cd70 <signal+0x34>
    cdd4:	00812403          	lw	s0,8(sp)
    cdd8:	00412483          	lw	s1,4(sp)
    cddc:	fff00513          	li	a0,-1
    cde0:	fa9ff06f          	j	cd88 <signal+0x4c>

0000cde4 <_init_signal>:
    cde4:	ff010113          	addi	sp,sp,-16
    cde8:	000147b7          	lui	a5,0x14
    cdec:	00812423          	sw	s0,8(sp)
    cdf0:	bcc7a403          	lw	s0,-1076(a5) # 13bcc <_impure_ptr>
    cdf4:	00112623          	sw	ra,12(sp)
    cdf8:	11842783          	lw	a5,280(s0)
    cdfc:	00078c63          	beqz	a5,ce14 <_init_signal+0x30>
    ce00:	00000513          	li	a0,0
    ce04:	00c12083          	lw	ra,12(sp)
    ce08:	00812403          	lw	s0,8(sp)
    ce0c:	01010113          	addi	sp,sp,16
    ce10:	00008067          	ret
    ce14:	08000593          	li	a1,128
    ce18:	00040513          	mv	a0,s0
    ce1c:	8a4fc0ef          	jal	8ec0 <_malloc_r>
    ce20:	10a42c23          	sw	a0,280(s0)
    ce24:	00050c63          	beqz	a0,ce3c <_init_signal+0x58>
    ce28:	08050793          	addi	a5,a0,128
    ce2c:	00052023          	sw	zero,0(a0)
    ce30:	00450513          	addi	a0,a0,4
    ce34:	fef51ce3          	bne	a0,a5,ce2c <_init_signal+0x48>
    ce38:	fc9ff06f          	j	ce00 <_init_signal+0x1c>
    ce3c:	fff00513          	li	a0,-1
    ce40:	fc5ff06f          	j	ce04 <_init_signal+0x20>

0000ce44 <__sigtramp>:
    ce44:	ff010113          	addi	sp,sp,-16
    ce48:	00912223          	sw	s1,4(sp)
    ce4c:	00014737          	lui	a4,0x14
    ce50:	00112623          	sw	ra,12(sp)
    ce54:	01f00793          	li	a5,31
    ce58:	bcc72483          	lw	s1,-1076(a4) # 13bcc <_impure_ptr>
    ce5c:	0ca7e463          	bltu	a5,a0,cf24 <__sigtramp+0xe0>
    ce60:	1184a783          	lw	a5,280(s1)
    ce64:	00812423          	sw	s0,8(sp)
    ce68:	00050413          	mv	s0,a0
    ce6c:	08078263          	beqz	a5,cef0 <__sigtramp+0xac>
    ce70:	00241713          	slli	a4,s0,0x2
    ce74:	00e787b3          	add	a5,a5,a4
    ce78:	0007a703          	lw	a4,0(a5)
    ce7c:	02070c63          	beqz	a4,ceb4 <__sigtramp+0x70>
    ce80:	fff00693          	li	a3,-1
    ce84:	06d70063          	beq	a4,a3,cee4 <__sigtramp+0xa0>
    ce88:	00100693          	li	a3,1
    ce8c:	04d70063          	beq	a4,a3,cecc <__sigtramp+0x88>
    ce90:	00040513          	mv	a0,s0
    ce94:	0007a023          	sw	zero,0(a5)
    ce98:	000700e7          	jalr	a4
    ce9c:	00812403          	lw	s0,8(sp)
    cea0:	00000513          	li	a0,0
    cea4:	00c12083          	lw	ra,12(sp)
    cea8:	00412483          	lw	s1,4(sp)
    ceac:	01010113          	addi	sp,sp,16
    ceb0:	00008067          	ret
    ceb4:	00812403          	lw	s0,8(sp)
    ceb8:	00c12083          	lw	ra,12(sp)
    cebc:	00412483          	lw	s1,4(sp)
    cec0:	00100513          	li	a0,1
    cec4:	01010113          	addi	sp,sp,16
    cec8:	00008067          	ret
    cecc:	00812403          	lw	s0,8(sp)
    ced0:	00c12083          	lw	ra,12(sp)
    ced4:	00412483          	lw	s1,4(sp)
    ced8:	00300513          	li	a0,3
    cedc:	01010113          	addi	sp,sp,16
    cee0:	00008067          	ret
    cee4:	00812403          	lw	s0,8(sp)
    cee8:	00200513          	li	a0,2
    ceec:	fb9ff06f          	j	cea4 <__sigtramp+0x60>
    cef0:	08000593          	li	a1,128
    cef4:	00048513          	mv	a0,s1
    cef8:	fc9fb0ef          	jal	8ec0 <_malloc_r>
    cefc:	10a4ac23          	sw	a0,280(s1)
    cf00:	00050793          	mv	a5,a0
    cf04:	00050e63          	beqz	a0,cf20 <__sigtramp+0xdc>
    cf08:	00050713          	mv	a4,a0
    cf0c:	08050693          	addi	a3,a0,128
    cf10:	00072023          	sw	zero,0(a4)
    cf14:	00470713          	addi	a4,a4,4
    cf18:	fee69ce3          	bne	a3,a4,cf10 <__sigtramp+0xcc>
    cf1c:	f55ff06f          	j	ce70 <__sigtramp+0x2c>
    cf20:	00812403          	lw	s0,8(sp)
    cf24:	fff00513          	li	a0,-1
    cf28:	f7dff06f          	j	cea4 <__sigtramp+0x60>

0000cf2c <_kill_r>:
    cf2c:	ff010113          	addi	sp,sp,-16
    cf30:	00058713          	mv	a4,a1
    cf34:	00812423          	sw	s0,8(sp)
    cf38:	00912223          	sw	s1,4(sp)
    cf3c:	00050413          	mv	s0,a0
    cf40:	000144b7          	lui	s1,0x14
    cf44:	00060593          	mv	a1,a2
    cf48:	00070513          	mv	a0,a4
    cf4c:	00112623          	sw	ra,12(sp)
    cf50:	d204ae23          	sw	zero,-708(s1) # 13d3c <errno>
    cf54:	be0f50ef          	jal	2334 <_kill>
    cf58:	fff00793          	li	a5,-1
    cf5c:	00f50c63          	beq	a0,a5,cf74 <_kill_r+0x48>
    cf60:	00c12083          	lw	ra,12(sp)
    cf64:	00812403          	lw	s0,8(sp)
    cf68:	00412483          	lw	s1,4(sp)
    cf6c:	01010113          	addi	sp,sp,16
    cf70:	00008067          	ret
    cf74:	d3c4a783          	lw	a5,-708(s1)
    cf78:	fe0784e3          	beqz	a5,cf60 <_kill_r+0x34>
    cf7c:	00c12083          	lw	ra,12(sp)
    cf80:	00f42023          	sw	a5,0(s0)
    cf84:	00812403          	lw	s0,8(sp)
    cf88:	00412483          	lw	s1,4(sp)
    cf8c:	01010113          	addi	sp,sp,16
    cf90:	00008067          	ret

0000cf94 <_getpid_r>:
    cf94:	bc8f506f          	j	235c <_getpid>

0000cf98 <__adddf3>:
    cf98:	00100837          	lui	a6,0x100
    cf9c:	fff80813          	addi	a6,a6,-1 # fffff <_memory_end+0xdffff>
    cfa0:	fe010113          	addi	sp,sp,-32
    cfa4:	00b878b3          	and	a7,a6,a1
    cfa8:	0145d713          	srli	a4,a1,0x14
    cfac:	01d55793          	srli	a5,a0,0x1d
    cfb0:	00d87833          	and	a6,a6,a3
    cfb4:	00912a23          	sw	s1,20(sp)
    cfb8:	7ff77493          	andi	s1,a4,2047
    cfbc:	00389713          	slli	a4,a7,0x3
    cfc0:	0146d893          	srli	a7,a3,0x14
    cfc4:	00381813          	slli	a6,a6,0x3
    cfc8:	01212823          	sw	s2,16(sp)
    cfcc:	00e7e7b3          	or	a5,a5,a4
    cfd0:	7ff8f893          	andi	a7,a7,2047
    cfd4:	01d65713          	srli	a4,a2,0x1d
    cfd8:	00112e23          	sw	ra,28(sp)
    cfdc:	00812c23          	sw	s0,24(sp)
    cfe0:	01312623          	sw	s3,12(sp)
    cfe4:	01f5d913          	srli	s2,a1,0x1f
    cfe8:	01f6d693          	srli	a3,a3,0x1f
    cfec:	01076733          	or	a4,a4,a6
    cff0:	00351513          	slli	a0,a0,0x3
    cff4:	00361613          	slli	a2,a2,0x3
    cff8:	41148833          	sub	a6,s1,a7
    cffc:	2ad91a63          	bne	s2,a3,d2b0 <__adddf3+0x318>
    d000:	11005c63          	blez	a6,d118 <__adddf3+0x180>
    d004:	04089063          	bnez	a7,d044 <__adddf3+0xac>
    d008:	00c766b3          	or	a3,a4,a2
    d00c:	66068063          	beqz	a3,d66c <__adddf3+0x6d4>
    d010:	fff80593          	addi	a1,a6,-1
    d014:	02059063          	bnez	a1,d034 <__adddf3+0x9c>
    d018:	00c50633          	add	a2,a0,a2
    d01c:	00a636b3          	sltu	a3,a2,a0
    d020:	00e78733          	add	a4,a5,a4
    d024:	00060513          	mv	a0,a2
    d028:	00d707b3          	add	a5,a4,a3
    d02c:	00100493          	li	s1,1
    d030:	06c0006f          	j	d09c <__adddf3+0x104>
    d034:	7ff00693          	li	a3,2047
    d038:	02d81063          	bne	a6,a3,d058 <__adddf3+0xc0>
    d03c:	7ff00493          	li	s1,2047
    d040:	1f80006f          	j	d238 <__adddf3+0x2a0>
    d044:	7ff00693          	li	a3,2047
    d048:	1ed48863          	beq	s1,a3,d238 <__adddf3+0x2a0>
    d04c:	008006b7          	lui	a3,0x800
    d050:	00d76733          	or	a4,a4,a3
    d054:	00080593          	mv	a1,a6
    d058:	03800693          	li	a3,56
    d05c:	0ab6c863          	blt	a3,a1,d10c <__adddf3+0x174>
    d060:	01f00693          	li	a3,31
    d064:	06b6ca63          	blt	a3,a1,d0d8 <__adddf3+0x140>
    d068:	02000813          	li	a6,32
    d06c:	40b80833          	sub	a6,a6,a1
    d070:	010716b3          	sll	a3,a4,a6
    d074:	00b658b3          	srl	a7,a2,a1
    d078:	01061833          	sll	a6,a2,a6
    d07c:	0116e6b3          	or	a3,a3,a7
    d080:	01003833          	snez	a6,a6
    d084:	0106e6b3          	or	a3,a3,a6
    d088:	00b755b3          	srl	a1,a4,a1
    d08c:	00a68533          	add	a0,a3,a0
    d090:	00f585b3          	add	a1,a1,a5
    d094:	00d536b3          	sltu	a3,a0,a3
    d098:	00d587b3          	add	a5,a1,a3
    d09c:	00879713          	slli	a4,a5,0x8
    d0a0:	18075c63          	bgez	a4,d238 <__adddf3+0x2a0>
    d0a4:	00148493          	addi	s1,s1,1
    d0a8:	7ff00713          	li	a4,2047
    d0ac:	5ae48a63          	beq	s1,a4,d660 <__adddf3+0x6c8>
    d0b0:	ff800737          	lui	a4,0xff800
    d0b4:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    d0b8:	00e7f733          	and	a4,a5,a4
    d0bc:	00155793          	srli	a5,a0,0x1
    d0c0:	00157513          	andi	a0,a0,1
    d0c4:	00a7e7b3          	or	a5,a5,a0
    d0c8:	01f71513          	slli	a0,a4,0x1f
    d0cc:	00f56533          	or	a0,a0,a5
    d0d0:	00175793          	srli	a5,a4,0x1
    d0d4:	1640006f          	j	d238 <__adddf3+0x2a0>
    d0d8:	fe058693          	addi	a3,a1,-32
    d0dc:	02000893          	li	a7,32
    d0e0:	00d756b3          	srl	a3,a4,a3
    d0e4:	00000813          	li	a6,0
    d0e8:	01158863          	beq	a1,a7,d0f8 <__adddf3+0x160>
    d0ec:	04000813          	li	a6,64
    d0f0:	40b80833          	sub	a6,a6,a1
    d0f4:	01071833          	sll	a6,a4,a6
    d0f8:	00c86833          	or	a6,a6,a2
    d0fc:	01003833          	snez	a6,a6
    d100:	0106e6b3          	or	a3,a3,a6
    d104:	00000593          	li	a1,0
    d108:	f85ff06f          	j	d08c <__adddf3+0xf4>
    d10c:	00c766b3          	or	a3,a4,a2
    d110:	00d036b3          	snez	a3,a3
    d114:	ff1ff06f          	j	d104 <__adddf3+0x16c>
    d118:	0c080a63          	beqz	a6,d1ec <__adddf3+0x254>
    d11c:	409886b3          	sub	a3,a7,s1
    d120:	02049463          	bnez	s1,d148 <__adddf3+0x1b0>
    d124:	00a7e5b3          	or	a1,a5,a0
    d128:	50058e63          	beqz	a1,d644 <__adddf3+0x6ac>
    d12c:	fff68593          	addi	a1,a3,-1 # 7fffff <_memory_end+0x7dffff>
    d130:	ee0584e3          	beqz	a1,d018 <__adddf3+0x80>
    d134:	7ff00813          	li	a6,2047
    d138:	03069263          	bne	a3,a6,d15c <__adddf3+0x1c4>
    d13c:	00070793          	mv	a5,a4
    d140:	00060513          	mv	a0,a2
    d144:	ef9ff06f          	j	d03c <__adddf3+0xa4>
    d148:	7ff00593          	li	a1,2047
    d14c:	feb888e3          	beq	a7,a1,d13c <__adddf3+0x1a4>
    d150:	008005b7          	lui	a1,0x800
    d154:	00b7e7b3          	or	a5,a5,a1
    d158:	00068593          	mv	a1,a3
    d15c:	03800693          	li	a3,56
    d160:	08b6c063          	blt	a3,a1,d1e0 <__adddf3+0x248>
    d164:	01f00693          	li	a3,31
    d168:	04b6c263          	blt	a3,a1,d1ac <__adddf3+0x214>
    d16c:	02000813          	li	a6,32
    d170:	40b80833          	sub	a6,a6,a1
    d174:	010796b3          	sll	a3,a5,a6
    d178:	00b55333          	srl	t1,a0,a1
    d17c:	01051833          	sll	a6,a0,a6
    d180:	0066e6b3          	or	a3,a3,t1
    d184:	01003833          	snez	a6,a6
    d188:	0106e6b3          	or	a3,a3,a6
    d18c:	00b7d5b3          	srl	a1,a5,a1
    d190:	00c68633          	add	a2,a3,a2
    d194:	00e585b3          	add	a1,a1,a4
    d198:	00d636b3          	sltu	a3,a2,a3
    d19c:	00060513          	mv	a0,a2
    d1a0:	00d587b3          	add	a5,a1,a3
    d1a4:	00088493          	mv	s1,a7
    d1a8:	ef5ff06f          	j	d09c <__adddf3+0x104>
    d1ac:	fe058693          	addi	a3,a1,-32 # 7fffe0 <_memory_end+0x7dffe0>
    d1b0:	02000313          	li	t1,32
    d1b4:	00d7d6b3          	srl	a3,a5,a3
    d1b8:	00000813          	li	a6,0
    d1bc:	00658863          	beq	a1,t1,d1cc <__adddf3+0x234>
    d1c0:	04000813          	li	a6,64
    d1c4:	40b80833          	sub	a6,a6,a1
    d1c8:	01079833          	sll	a6,a5,a6
    d1cc:	00a86833          	or	a6,a6,a0
    d1d0:	01003833          	snez	a6,a6
    d1d4:	0106e6b3          	or	a3,a3,a6
    d1d8:	00000593          	li	a1,0
    d1dc:	fb5ff06f          	j	d190 <__adddf3+0x1f8>
    d1e0:	00a7e6b3          	or	a3,a5,a0
    d1e4:	00d036b3          	snez	a3,a3
    d1e8:	ff1ff06f          	j	d1d8 <__adddf3+0x240>
    d1ec:	00148693          	addi	a3,s1,1
    d1f0:	7fe6f593          	andi	a1,a3,2046
    d1f4:	08059663          	bnez	a1,d280 <__adddf3+0x2e8>
    d1f8:	00a7e6b3          	or	a3,a5,a0
    d1fc:	06049263          	bnez	s1,d260 <__adddf3+0x2c8>
    d200:	44068863          	beqz	a3,d650 <__adddf3+0x6b8>
    d204:	00c766b3          	or	a3,a4,a2
    d208:	02068863          	beqz	a3,d238 <__adddf3+0x2a0>
    d20c:	00c50633          	add	a2,a0,a2
    d210:	00a636b3          	sltu	a3,a2,a0
    d214:	00e78733          	add	a4,a5,a4
    d218:	00d707b3          	add	a5,a4,a3
    d21c:	00879713          	slli	a4,a5,0x8
    d220:	00060513          	mv	a0,a2
    d224:	00075a63          	bgez	a4,d238 <__adddf3+0x2a0>
    d228:	ff800737          	lui	a4,0xff800
    d22c:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    d230:	00e7f7b3          	and	a5,a5,a4
    d234:	00100493          	li	s1,1
    d238:	00757713          	andi	a4,a0,7
    d23c:	44070863          	beqz	a4,d68c <__adddf3+0x6f4>
    d240:	00f57713          	andi	a4,a0,15
    d244:	00400693          	li	a3,4
    d248:	44d70263          	beq	a4,a3,d68c <__adddf3+0x6f4>
    d24c:	00450713          	addi	a4,a0,4
    d250:	00a736b3          	sltu	a3,a4,a0
    d254:	00d787b3          	add	a5,a5,a3
    d258:	00070513          	mv	a0,a4
    d25c:	4300006f          	j	d68c <__adddf3+0x6f4>
    d260:	ec068ee3          	beqz	a3,d13c <__adddf3+0x1a4>
    d264:	00c76633          	or	a2,a4,a2
    d268:	dc060ae3          	beqz	a2,d03c <__adddf3+0xa4>
    d26c:	00000913          	li	s2,0
    d270:	004007b7          	lui	a5,0x400
    d274:	00000513          	li	a0,0
    d278:	7ff00493          	li	s1,2047
    d27c:	4100006f          	j	d68c <__adddf3+0x6f4>
    d280:	7ff00593          	li	a1,2047
    d284:	3cb68c63          	beq	a3,a1,d65c <__adddf3+0x6c4>
    d288:	00c50633          	add	a2,a0,a2
    d28c:	00a63533          	sltu	a0,a2,a0
    d290:	00e78733          	add	a4,a5,a4
    d294:	00a70733          	add	a4,a4,a0
    d298:	01f71513          	slli	a0,a4,0x1f
    d29c:	00165613          	srli	a2,a2,0x1
    d2a0:	00c56533          	or	a0,a0,a2
    d2a4:	00175793          	srli	a5,a4,0x1
    d2a8:	00068493          	mv	s1,a3
    d2ac:	f8dff06f          	j	d238 <__adddf3+0x2a0>
    d2b0:	0f005c63          	blez	a6,d3a8 <__adddf3+0x410>
    d2b4:	08089e63          	bnez	a7,d350 <__adddf3+0x3b8>
    d2b8:	00c766b3          	or	a3,a4,a2
    d2bc:	3a068863          	beqz	a3,d66c <__adddf3+0x6d4>
    d2c0:	fff80693          	addi	a3,a6,-1
    d2c4:	02069063          	bnez	a3,d2e4 <__adddf3+0x34c>
    d2c8:	40c50633          	sub	a2,a0,a2
    d2cc:	00c536b3          	sltu	a3,a0,a2
    d2d0:	40e78733          	sub	a4,a5,a4
    d2d4:	00060513          	mv	a0,a2
    d2d8:	40d707b3          	sub	a5,a4,a3
    d2dc:	00100493          	li	s1,1
    d2e0:	0540006f          	j	d334 <__adddf3+0x39c>
    d2e4:	7ff00593          	li	a1,2047
    d2e8:	d4b80ae3          	beq	a6,a1,d03c <__adddf3+0xa4>
    d2ec:	03800593          	li	a1,56
    d2f0:	0ad5c663          	blt	a1,a3,d39c <__adddf3+0x404>
    d2f4:	01f00593          	li	a1,31
    d2f8:	06d5c863          	blt	a1,a3,d368 <__adddf3+0x3d0>
    d2fc:	02000813          	li	a6,32
    d300:	40d80833          	sub	a6,a6,a3
    d304:	00d658b3          	srl	a7,a2,a3
    d308:	010715b3          	sll	a1,a4,a6
    d30c:	01061833          	sll	a6,a2,a6
    d310:	0115e5b3          	or	a1,a1,a7
    d314:	01003833          	snez	a6,a6
    d318:	0105e633          	or	a2,a1,a6
    d31c:	00d756b3          	srl	a3,a4,a3
    d320:	40c50633          	sub	a2,a0,a2
    d324:	00c53733          	sltu	a4,a0,a2
    d328:	40d786b3          	sub	a3,a5,a3
    d32c:	00060513          	mv	a0,a2
    d330:	40e687b3          	sub	a5,a3,a4
    d334:	00879713          	slli	a4,a5,0x8
    d338:	f00750e3          	bgez	a4,d238 <__adddf3+0x2a0>
    d33c:	00800437          	lui	s0,0x800
    d340:	fff40413          	addi	s0,s0,-1 # 7fffff <_memory_end+0x7dffff>
    d344:	0087f433          	and	s0,a5,s0
    d348:	00050993          	mv	s3,a0
    d34c:	2100006f          	j	d55c <__adddf3+0x5c4>
    d350:	7ff00693          	li	a3,2047
    d354:	eed482e3          	beq	s1,a3,d238 <__adddf3+0x2a0>
    d358:	008006b7          	lui	a3,0x800
    d35c:	00d76733          	or	a4,a4,a3
    d360:	00080693          	mv	a3,a6
    d364:	f89ff06f          	j	d2ec <__adddf3+0x354>
    d368:	fe068593          	addi	a1,a3,-32 # 7fffe0 <_memory_end+0x7dffe0>
    d36c:	02000893          	li	a7,32
    d370:	00b755b3          	srl	a1,a4,a1
    d374:	00000813          	li	a6,0
    d378:	01168863          	beq	a3,a7,d388 <__adddf3+0x3f0>
    d37c:	04000813          	li	a6,64
    d380:	40d80833          	sub	a6,a6,a3
    d384:	01071833          	sll	a6,a4,a6
    d388:	00c86833          	or	a6,a6,a2
    d38c:	01003833          	snez	a6,a6
    d390:	0105e633          	or	a2,a1,a6
    d394:	00000693          	li	a3,0
    d398:	f89ff06f          	j	d320 <__adddf3+0x388>
    d39c:	00c76633          	or	a2,a4,a2
    d3a0:	00c03633          	snez	a2,a2
    d3a4:	ff1ff06f          	j	d394 <__adddf3+0x3fc>
    d3a8:	0e080863          	beqz	a6,d498 <__adddf3+0x500>
    d3ac:	40988833          	sub	a6,a7,s1
    d3b0:	04049263          	bnez	s1,d3f4 <__adddf3+0x45c>
    d3b4:	00a7e5b3          	or	a1,a5,a0
    d3b8:	2a058e63          	beqz	a1,d674 <__adddf3+0x6dc>
    d3bc:	fff80593          	addi	a1,a6,-1
    d3c0:	00059e63          	bnez	a1,d3dc <__adddf3+0x444>
    d3c4:	40a60533          	sub	a0,a2,a0
    d3c8:	40f70733          	sub	a4,a4,a5
    d3cc:	00a63633          	sltu	a2,a2,a0
    d3d0:	40c707b3          	sub	a5,a4,a2
    d3d4:	00068913          	mv	s2,a3
    d3d8:	f05ff06f          	j	d2dc <__adddf3+0x344>
    d3dc:	7ff00313          	li	t1,2047
    d3e0:	02681463          	bne	a6,t1,d408 <__adddf3+0x470>
    d3e4:	00070793          	mv	a5,a4
    d3e8:	00060513          	mv	a0,a2
    d3ec:	7ff00493          	li	s1,2047
    d3f0:	0d00006f          	j	d4c0 <__adddf3+0x528>
    d3f4:	7ff00593          	li	a1,2047
    d3f8:	feb886e3          	beq	a7,a1,d3e4 <__adddf3+0x44c>
    d3fc:	008005b7          	lui	a1,0x800
    d400:	00b7e7b3          	or	a5,a5,a1
    d404:	00080593          	mv	a1,a6
    d408:	03800813          	li	a6,56
    d40c:	08b84063          	blt	a6,a1,d48c <__adddf3+0x4f4>
    d410:	01f00813          	li	a6,31
    d414:	04b84263          	blt	a6,a1,d458 <__adddf3+0x4c0>
    d418:	02000313          	li	t1,32
    d41c:	40b30333          	sub	t1,t1,a1
    d420:	00b55e33          	srl	t3,a0,a1
    d424:	00679833          	sll	a6,a5,t1
    d428:	00651333          	sll	t1,a0,t1
    d42c:	01c86833          	or	a6,a6,t3
    d430:	00603333          	snez	t1,t1
    d434:	00686533          	or	a0,a6,t1
    d438:	00b7d5b3          	srl	a1,a5,a1
    d43c:	40a60533          	sub	a0,a2,a0
    d440:	40b705b3          	sub	a1,a4,a1
    d444:	00a63633          	sltu	a2,a2,a0
    d448:	40c587b3          	sub	a5,a1,a2
    d44c:	00088493          	mv	s1,a7
    d450:	00068913          	mv	s2,a3
    d454:	ee1ff06f          	j	d334 <__adddf3+0x39c>
    d458:	fe058813          	addi	a6,a1,-32 # 7fffe0 <_memory_end+0x7dffe0>
    d45c:	02000e13          	li	t3,32
    d460:	0107d833          	srl	a6,a5,a6
    d464:	00000313          	li	t1,0
    d468:	01c58863          	beq	a1,t3,d478 <__adddf3+0x4e0>
    d46c:	04000313          	li	t1,64
    d470:	40b30333          	sub	t1,t1,a1
    d474:	00679333          	sll	t1,a5,t1
    d478:	00a36333          	or	t1,t1,a0
    d47c:	00603333          	snez	t1,t1
    d480:	00686533          	or	a0,a6,t1
    d484:	00000593          	li	a1,0
    d488:	fb5ff06f          	j	d43c <__adddf3+0x4a4>
    d48c:	00a7e533          	or	a0,a5,a0
    d490:	00a03533          	snez	a0,a0
    d494:	ff1ff06f          	j	d484 <__adddf3+0x4ec>
    d498:	00148593          	addi	a1,s1,1
    d49c:	7fe5f593          	andi	a1,a1,2046
    d4a0:	08059663          	bnez	a1,d52c <__adddf3+0x594>
    d4a4:	00a7e833          	or	a6,a5,a0
    d4a8:	00c765b3          	or	a1,a4,a2
    d4ac:	06049063          	bnez	s1,d50c <__adddf3+0x574>
    d4b0:	00081c63          	bnez	a6,d4c8 <__adddf3+0x530>
    d4b4:	10058e63          	beqz	a1,d5d0 <__adddf3+0x638>
    d4b8:	00070793          	mv	a5,a4
    d4bc:	00060513          	mv	a0,a2
    d4c0:	00068913          	mv	s2,a3
    d4c4:	d75ff06f          	j	d238 <__adddf3+0x2a0>
    d4c8:	d60588e3          	beqz	a1,d238 <__adddf3+0x2a0>
    d4cc:	40c50833          	sub	a6,a0,a2
    d4d0:	010538b3          	sltu	a7,a0,a6
    d4d4:	40e785b3          	sub	a1,a5,a4
    d4d8:	411585b3          	sub	a1,a1,a7
    d4dc:	00859893          	slli	a7,a1,0x8
    d4e0:	0008dc63          	bgez	a7,d4f8 <__adddf3+0x560>
    d4e4:	40a60533          	sub	a0,a2,a0
    d4e8:	40f70733          	sub	a4,a4,a5
    d4ec:	00a63633          	sltu	a2,a2,a0
    d4f0:	40c707b3          	sub	a5,a4,a2
    d4f4:	fcdff06f          	j	d4c0 <__adddf3+0x528>
    d4f8:	00b86533          	or	a0,a6,a1
    d4fc:	18050463          	beqz	a0,d684 <__adddf3+0x6ec>
    d500:	00058793          	mv	a5,a1
    d504:	00080513          	mv	a0,a6
    d508:	d31ff06f          	j	d238 <__adddf3+0x2a0>
    d50c:	00081c63          	bnez	a6,d524 <__adddf3+0x58c>
    d510:	d4058ee3          	beqz	a1,d26c <__adddf3+0x2d4>
    d514:	00070793          	mv	a5,a4
    d518:	00060513          	mv	a0,a2
    d51c:	00068913          	mv	s2,a3
    d520:	b1dff06f          	j	d03c <__adddf3+0xa4>
    d524:	b0058ce3          	beqz	a1,d03c <__adddf3+0xa4>
    d528:	d45ff06f          	j	d26c <__adddf3+0x2d4>
    d52c:	40c505b3          	sub	a1,a0,a2
    d530:	00b53833          	sltu	a6,a0,a1
    d534:	40e78433          	sub	s0,a5,a4
    d538:	41040433          	sub	s0,s0,a6
    d53c:	00841813          	slli	a6,s0,0x8
    d540:	00058993          	mv	s3,a1
    d544:	08085063          	bgez	a6,d5c4 <__adddf3+0x62c>
    d548:	40a609b3          	sub	s3,a2,a0
    d54c:	40f70433          	sub	s0,a4,a5
    d550:	01363633          	sltu	a2,a2,s3
    d554:	40c40433          	sub	s0,s0,a2
    d558:	00068913          	mv	s2,a3
    d55c:	06040e63          	beqz	s0,d5d8 <__adddf3+0x640>
    d560:	00040513          	mv	a0,s0
    d564:	21c050ef          	jal	12780 <__clzsi2>
    d568:	ff850693          	addi	a3,a0,-8
    d56c:	02000793          	li	a5,32
    d570:	40d787b3          	sub	a5,a5,a3
    d574:	00d41433          	sll	s0,s0,a3
    d578:	00f9d7b3          	srl	a5,s3,a5
    d57c:	0087e7b3          	or	a5,a5,s0
    d580:	00d99433          	sll	s0,s3,a3
    d584:	0a96c463          	blt	a3,s1,d62c <__adddf3+0x694>
    d588:	409686b3          	sub	a3,a3,s1
    d58c:	00168613          	addi	a2,a3,1
    d590:	01f00713          	li	a4,31
    d594:	06c74263          	blt	a4,a2,d5f8 <__adddf3+0x660>
    d598:	02000713          	li	a4,32
    d59c:	40c70733          	sub	a4,a4,a2
    d5a0:	00e79533          	sll	a0,a5,a4
    d5a4:	00c456b3          	srl	a3,s0,a2
    d5a8:	00e41733          	sll	a4,s0,a4
    d5ac:	00d56533          	or	a0,a0,a3
    d5b0:	00e03733          	snez	a4,a4
    d5b4:	00e56533          	or	a0,a0,a4
    d5b8:	00c7d7b3          	srl	a5,a5,a2
    d5bc:	00000493          	li	s1,0
    d5c0:	c79ff06f          	j	d238 <__adddf3+0x2a0>
    d5c4:	0085e5b3          	or	a1,a1,s0
    d5c8:	f8059ae3          	bnez	a1,d55c <__adddf3+0x5c4>
    d5cc:	00000493          	li	s1,0
    d5d0:	00000913          	li	s2,0
    d5d4:	08c0006f          	j	d660 <__adddf3+0x6c8>
    d5d8:	00098513          	mv	a0,s3
    d5dc:	1a4050ef          	jal	12780 <__clzsi2>
    d5e0:	01850693          	addi	a3,a0,24
    d5e4:	01f00793          	li	a5,31
    d5e8:	f8d7d2e3          	bge	a5,a3,d56c <__adddf3+0x5d4>
    d5ec:	ff850793          	addi	a5,a0,-8
    d5f0:	00f997b3          	sll	a5,s3,a5
    d5f4:	f91ff06f          	j	d584 <__adddf3+0x5ec>
    d5f8:	fe168693          	addi	a3,a3,-31
    d5fc:	00d7d533          	srl	a0,a5,a3
    d600:	02000693          	li	a3,32
    d604:	00000713          	li	a4,0
    d608:	00d60863          	beq	a2,a3,d618 <__adddf3+0x680>
    d60c:	04000713          	li	a4,64
    d610:	40c70733          	sub	a4,a4,a2
    d614:	00e79733          	sll	a4,a5,a4
    d618:	00e46733          	or	a4,s0,a4
    d61c:	00e03733          	snez	a4,a4
    d620:	00e56533          	or	a0,a0,a4
    d624:	00000793          	li	a5,0
    d628:	f95ff06f          	j	d5bc <__adddf3+0x624>
    d62c:	ff800737          	lui	a4,0xff800
    d630:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    d634:	40d484b3          	sub	s1,s1,a3
    d638:	00e7f7b3          	and	a5,a5,a4
    d63c:	00040513          	mv	a0,s0
    d640:	bf9ff06f          	j	d238 <__adddf3+0x2a0>
    d644:	00070793          	mv	a5,a4
    d648:	00060513          	mv	a0,a2
    d64c:	c5dff06f          	j	d2a8 <__adddf3+0x310>
    d650:	00070793          	mv	a5,a4
    d654:	00060513          	mv	a0,a2
    d658:	be1ff06f          	j	d238 <__adddf3+0x2a0>
    d65c:	7ff00493          	li	s1,2047
    d660:	00000793          	li	a5,0
    d664:	00000513          	li	a0,0
    d668:	0240006f          	j	d68c <__adddf3+0x6f4>
    d66c:	00080493          	mv	s1,a6
    d670:	bc9ff06f          	j	d238 <__adddf3+0x2a0>
    d674:	00070793          	mv	a5,a4
    d678:	00060513          	mv	a0,a2
    d67c:	00080493          	mv	s1,a6
    d680:	e41ff06f          	j	d4c0 <__adddf3+0x528>
    d684:	00000793          	li	a5,0
    d688:	00000913          	li	s2,0
    d68c:	00879713          	slli	a4,a5,0x8
    d690:	00075e63          	bgez	a4,d6ac <__adddf3+0x714>
    d694:	00148493          	addi	s1,s1,1
    d698:	7ff00713          	li	a4,2047
    d69c:	08e48263          	beq	s1,a4,d720 <__adddf3+0x788>
    d6a0:	ff800737          	lui	a4,0xff800
    d6a4:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    d6a8:	00e7f7b3          	and	a5,a5,a4
    d6ac:	01d79693          	slli	a3,a5,0x1d
    d6b0:	00355513          	srli	a0,a0,0x3
    d6b4:	7ff00713          	li	a4,2047
    d6b8:	00a6e6b3          	or	a3,a3,a0
    d6bc:	0037d793          	srli	a5,a5,0x3
    d6c0:	00e49e63          	bne	s1,a4,d6dc <__adddf3+0x744>
    d6c4:	00f6e6b3          	or	a3,a3,a5
    d6c8:	00000793          	li	a5,0
    d6cc:	00068863          	beqz	a3,d6dc <__adddf3+0x744>
    d6d0:	000807b7          	lui	a5,0x80
    d6d4:	00000693          	li	a3,0
    d6d8:	00000913          	li	s2,0
    d6dc:	01449713          	slli	a4,s1,0x14
    d6e0:	7ff00637          	lui	a2,0x7ff00
    d6e4:	00c79793          	slli	a5,a5,0xc
    d6e8:	00c77733          	and	a4,a4,a2
    d6ec:	01c12083          	lw	ra,28(sp)
    d6f0:	01812403          	lw	s0,24(sp)
    d6f4:	00c7d793          	srli	a5,a5,0xc
    d6f8:	00f767b3          	or	a5,a4,a5
    d6fc:	01f91713          	slli	a4,s2,0x1f
    d700:	00e7e633          	or	a2,a5,a4
    d704:	01412483          	lw	s1,20(sp)
    d708:	01012903          	lw	s2,16(sp)
    d70c:	00c12983          	lw	s3,12(sp)
    d710:	00068513          	mv	a0,a3
    d714:	00060593          	mv	a1,a2
    d718:	02010113          	addi	sp,sp,32
    d71c:	00008067          	ret
    d720:	00000793          	li	a5,0
    d724:	00000513          	li	a0,0
    d728:	f85ff06f          	j	d6ac <__adddf3+0x714>

0000d72c <__divdf3>:
    d72c:	fd010113          	addi	sp,sp,-48
    d730:	0145d813          	srli	a6,a1,0x14
    d734:	02912223          	sw	s1,36(sp)
    d738:	03212023          	sw	s2,32(sp)
    d73c:	01312e23          	sw	s3,28(sp)
    d740:	01612823          	sw	s6,16(sp)
    d744:	01712623          	sw	s7,12(sp)
    d748:	00c59493          	slli	s1,a1,0xc
    d74c:	02112623          	sw	ra,44(sp)
    d750:	02812423          	sw	s0,40(sp)
    d754:	01412c23          	sw	s4,24(sp)
    d758:	01512a23          	sw	s5,20(sp)
    d75c:	7ff87813          	andi	a6,a6,2047
    d760:	00050b13          	mv	s6,a0
    d764:	00060b93          	mv	s7,a2
    d768:	00068913          	mv	s2,a3
    d76c:	00c4d493          	srli	s1,s1,0xc
    d770:	01f5d993          	srli	s3,a1,0x1f
    d774:	0a080063          	beqz	a6,d814 <__divdf3+0xe8>
    d778:	7ff00793          	li	a5,2047
    d77c:	10f80063          	beq	a6,a5,d87c <__divdf3+0x150>
    d780:	01d55a13          	srli	s4,a0,0x1d
    d784:	00349493          	slli	s1,s1,0x3
    d788:	009a6a33          	or	s4,s4,s1
    d78c:	008007b7          	lui	a5,0x800
    d790:	00fa6a33          	or	s4,s4,a5
    d794:	00351413          	slli	s0,a0,0x3
    d798:	c0180a93          	addi	s5,a6,-1023
    d79c:	00000b13          	li	s6,0
    d7a0:	01495713          	srli	a4,s2,0x14
    d7a4:	00c91493          	slli	s1,s2,0xc
    d7a8:	7ff77713          	andi	a4,a4,2047
    d7ac:	00c4d493          	srli	s1,s1,0xc
    d7b0:	01f95913          	srli	s2,s2,0x1f
    d7b4:	10070263          	beqz	a4,d8b8 <__divdf3+0x18c>
    d7b8:	7ff00793          	li	a5,2047
    d7bc:	16f70663          	beq	a4,a5,d928 <__divdf3+0x1fc>
    d7c0:	00349493          	slli	s1,s1,0x3
    d7c4:	01dbd793          	srli	a5,s7,0x1d
    d7c8:	0097e7b3          	or	a5,a5,s1
    d7cc:	008004b7          	lui	s1,0x800
    d7d0:	0097e4b3          	or	s1,a5,s1
    d7d4:	003b9f13          	slli	t5,s7,0x3
    d7d8:	c0170713          	addi	a4,a4,-1023
    d7dc:	00000793          	li	a5,0
    d7e0:	40ea8833          	sub	a6,s5,a4
    d7e4:	002b1713          	slli	a4,s6,0x2
    d7e8:	00f76733          	or	a4,a4,a5
    d7ec:	fff70713          	addi	a4,a4,-1
    d7f0:	00e00693          	li	a3,14
    d7f4:	0129c633          	xor	a2,s3,s2
    d7f8:	16e6e463          	bltu	a3,a4,d960 <__divdf3+0x234>
    d7fc:	000136b7          	lui	a3,0x13
    d800:	00271713          	slli	a4,a4,0x2
    d804:	31068693          	addi	a3,a3,784 # 13310 <blanks.1+0x10>
    d808:	00d70733          	add	a4,a4,a3
    d80c:	00072703          	lw	a4,0(a4)
    d810:	00070067          	jr	a4
    d814:	00a4ea33          	or	s4,s1,a0
    d818:	060a0e63          	beqz	s4,d894 <__divdf3+0x168>
    d81c:	02048e63          	beqz	s1,d858 <__divdf3+0x12c>
    d820:	00048513          	mv	a0,s1
    d824:	75d040ef          	jal	12780 <__clzsi2>
    d828:	ff550793          	addi	a5,a0,-11
    d82c:	01d00a13          	li	s4,29
    d830:	ff850713          	addi	a4,a0,-8
    d834:	40fa0a33          	sub	s4,s4,a5
    d838:	00e494b3          	sll	s1,s1,a4
    d83c:	014b5a33          	srl	s4,s6,s4
    d840:	009a6a33          	or	s4,s4,s1
    d844:	00eb14b3          	sll	s1,s6,a4
    d848:	c0d00813          	li	a6,-1011
    d84c:	40a80ab3          	sub	s5,a6,a0
    d850:	00048413          	mv	s0,s1
    d854:	f49ff06f          	j	d79c <__divdf3+0x70>
    d858:	729040ef          	jal	12780 <__clzsi2>
    d85c:	00050a13          	mv	s4,a0
    d860:	015a0793          	addi	a5,s4,21
    d864:	01c00713          	li	a4,28
    d868:	02050513          	addi	a0,a0,32
    d86c:	fcf750e3          	bge	a4,a5,d82c <__divdf3+0x100>
    d870:	ff8a0a13          	addi	s4,s4,-8
    d874:	014b1a33          	sll	s4,s6,s4
    d878:	fd1ff06f          	j	d848 <__divdf3+0x11c>
    d87c:	00a4ea33          	or	s4,s1,a0
    d880:	020a1263          	bnez	s4,d8a4 <__divdf3+0x178>
    d884:	00000413          	li	s0,0
    d888:	7ff00a93          	li	s5,2047
    d88c:	00200b13          	li	s6,2
    d890:	f11ff06f          	j	d7a0 <__divdf3+0x74>
    d894:	00000413          	li	s0,0
    d898:	00000a93          	li	s5,0
    d89c:	00100b13          	li	s6,1
    d8a0:	f01ff06f          	j	d7a0 <__divdf3+0x74>
    d8a4:	00050413          	mv	s0,a0
    d8a8:	00048a13          	mv	s4,s1
    d8ac:	7ff00a93          	li	s5,2047
    d8b0:	00300b13          	li	s6,3
    d8b4:	eedff06f          	j	d7a0 <__divdf3+0x74>
    d8b8:	0174ef33          	or	t5,s1,s7
    d8bc:	080f0263          	beqz	t5,d940 <__divdf3+0x214>
    d8c0:	04048063          	beqz	s1,d900 <__divdf3+0x1d4>
    d8c4:	00048513          	mv	a0,s1
    d8c8:	6b9040ef          	jal	12780 <__clzsi2>
    d8cc:	ff550713          	addi	a4,a0,-11
    d8d0:	01d00793          	li	a5,29
    d8d4:	ff850693          	addi	a3,a0,-8
    d8d8:	40e787b3          	sub	a5,a5,a4
    d8dc:	00d494b3          	sll	s1,s1,a3
    d8e0:	00fbd7b3          	srl	a5,s7,a5
    d8e4:	0097e7b3          	or	a5,a5,s1
    d8e8:	00db94b3          	sll	s1,s7,a3
    d8ec:	c0d00713          	li	a4,-1011
    d8f0:	00048f13          	mv	t5,s1
    d8f4:	40a70733          	sub	a4,a4,a0
    d8f8:	00078493          	mv	s1,a5
    d8fc:	ee1ff06f          	j	d7dc <__divdf3+0xb0>
    d900:	000b8513          	mv	a0,s7
    d904:	67d040ef          	jal	12780 <__clzsi2>
    d908:	00050793          	mv	a5,a0
    d90c:	01578713          	addi	a4,a5,21 # 800015 <_memory_end+0x7e0015>
    d910:	01c00693          	li	a3,28
    d914:	02050513          	addi	a0,a0,32
    d918:	fae6dce3          	bge	a3,a4,d8d0 <__divdf3+0x1a4>
    d91c:	ff878793          	addi	a5,a5,-8
    d920:	00fb97b3          	sll	a5,s7,a5
    d924:	fc9ff06f          	j	d8ec <__divdf3+0x1c0>
    d928:	0174ef33          	or	t5,s1,s7
    d92c:	020f1263          	bnez	t5,d950 <__divdf3+0x224>
    d930:	00000493          	li	s1,0
    d934:	7ff00713          	li	a4,2047
    d938:	00200793          	li	a5,2
    d93c:	ea5ff06f          	j	d7e0 <__divdf3+0xb4>
    d940:	00000493          	li	s1,0
    d944:	00000713          	li	a4,0
    d948:	00100793          	li	a5,1
    d94c:	e95ff06f          	j	d7e0 <__divdf3+0xb4>
    d950:	000b8f13          	mv	t5,s7
    d954:	7ff00713          	li	a4,2047
    d958:	00300793          	li	a5,3
    d95c:	e85ff06f          	j	d7e0 <__divdf3+0xb4>
    d960:	0144e663          	bltu	s1,s4,d96c <__divdf3+0x240>
    d964:	349a1c63          	bne	s4,s1,dcbc <__divdf3+0x590>
    d968:	35e46a63          	bltu	s0,t5,dcbc <__divdf3+0x590>
    d96c:	01fa1693          	slli	a3,s4,0x1f
    d970:	00145793          	srli	a5,s0,0x1
    d974:	01f41713          	slli	a4,s0,0x1f
    d978:	001a5a13          	srli	s4,s4,0x1
    d97c:	00f6e433          	or	s0,a3,a5
    d980:	00849893          	slli	a7,s1,0x8
    d984:	018f5593          	srli	a1,t5,0x18
    d988:	0115e5b3          	or	a1,a1,a7
    d98c:	0108d893          	srli	a7,a7,0x10
    d990:	031a5eb3          	divu	t4,s4,a7
    d994:	01059313          	slli	t1,a1,0x10
    d998:	01035313          	srli	t1,t1,0x10
    d99c:	01045793          	srli	a5,s0,0x10
    d9a0:	008f1513          	slli	a0,t5,0x8
    d9a4:	031a7a33          	remu	s4,s4,a7
    d9a8:	000e8693          	mv	a3,t4
    d9ac:	03d30e33          	mul	t3,t1,t4
    d9b0:	010a1a13          	slli	s4,s4,0x10
    d9b4:	0147e7b3          	or	a5,a5,s4
    d9b8:	01c7fe63          	bgeu	a5,t3,d9d4 <__divdf3+0x2a8>
    d9bc:	00f587b3          	add	a5,a1,a5
    d9c0:	fffe8693          	addi	a3,t4,-1
    d9c4:	00b7e863          	bltu	a5,a1,d9d4 <__divdf3+0x2a8>
    d9c8:	01c7f663          	bgeu	a5,t3,d9d4 <__divdf3+0x2a8>
    d9cc:	ffee8693          	addi	a3,t4,-2
    d9d0:	00b787b3          	add	a5,a5,a1
    d9d4:	41c787b3          	sub	a5,a5,t3
    d9d8:	0317df33          	divu	t5,a5,a7
    d9dc:	01041413          	slli	s0,s0,0x10
    d9e0:	01045413          	srli	s0,s0,0x10
    d9e4:	0317f7b3          	remu	a5,a5,a7
    d9e8:	000f0e13          	mv	t3,t5
    d9ec:	03e30eb3          	mul	t4,t1,t5
    d9f0:	01079793          	slli	a5,a5,0x10
    d9f4:	00f467b3          	or	a5,s0,a5
    d9f8:	01d7fe63          	bgeu	a5,t4,da14 <__divdf3+0x2e8>
    d9fc:	00f587b3          	add	a5,a1,a5
    da00:	ffff0e13          	addi	t3,t5,-1
    da04:	00b7e863          	bltu	a5,a1,da14 <__divdf3+0x2e8>
    da08:	01d7f663          	bgeu	a5,t4,da14 <__divdf3+0x2e8>
    da0c:	ffef0e13          	addi	t3,t5,-2
    da10:	00b787b3          	add	a5,a5,a1
    da14:	01069693          	slli	a3,a3,0x10
    da18:	00010437          	lui	s0,0x10
    da1c:	01c6e2b3          	or	t0,a3,t3
    da20:	fff40e13          	addi	t3,s0,-1 # ffff <__multf3+0xd47>
    da24:	01c2f6b3          	and	a3,t0,t3
    da28:	0102df93          	srli	t6,t0,0x10
    da2c:	01c57e33          	and	t3,a0,t3
    da30:	41d787b3          	sub	a5,a5,t4
    da34:	01055e93          	srli	t4,a0,0x10
    da38:	02de03b3          	mul	t2,t3,a3
    da3c:	03cf84b3          	mul	s1,t6,t3
    da40:	02de86b3          	mul	a3,t4,a3
    da44:	00968f33          	add	t5,a3,s1
    da48:	0103d693          	srli	a3,t2,0x10
    da4c:	01e686b3          	add	a3,a3,t5
    da50:	03df8fb3          	mul	t6,t6,t4
    da54:	0096f463          	bgeu	a3,s1,da5c <__divdf3+0x330>
    da58:	008f8fb3          	add	t6,t6,s0
    da5c:	0106df13          	srli	t5,a3,0x10
    da60:	01ff0f33          	add	t5,t5,t6
    da64:	00010fb7          	lui	t6,0x10
    da68:	ffff8f93          	addi	t6,t6,-1 # ffff <__multf3+0xd47>
    da6c:	01f6f6b3          	and	a3,a3,t6
    da70:	01069693          	slli	a3,a3,0x10
    da74:	01f3f3b3          	and	t2,t2,t6
    da78:	007686b3          	add	a3,a3,t2
    da7c:	01e7e863          	bltu	a5,t5,da8c <__divdf3+0x360>
    da80:	00028493          	mv	s1,t0
    da84:	05e79863          	bne	a5,t5,dad4 <__divdf3+0x3a8>
    da88:	04d77663          	bgeu	a4,a3,dad4 <__divdf3+0x3a8>
    da8c:	00a70fb3          	add	t6,a4,a0
    da90:	00efb3b3          	sltu	t2,t6,a4
    da94:	00b38433          	add	s0,t2,a1
    da98:	008787b3          	add	a5,a5,s0
    da9c:	fff28493          	addi	s1,t0,-1
    daa0:	000f8713          	mv	a4,t6
    daa4:	00f5e663          	bltu	a1,a5,dab0 <__divdf3+0x384>
    daa8:	02f59663          	bne	a1,a5,dad4 <__divdf3+0x3a8>
    daac:	02039463          	bnez	t2,dad4 <__divdf3+0x3a8>
    dab0:	01e7e663          	bltu	a5,t5,dabc <__divdf3+0x390>
    dab4:	02ff1063          	bne	t5,a5,dad4 <__divdf3+0x3a8>
    dab8:	00dffe63          	bgeu	t6,a3,dad4 <__divdf3+0x3a8>
    dabc:	01f50fb3          	add	t6,a0,t6
    dac0:	000f8713          	mv	a4,t6
    dac4:	00afbfb3          	sltu	t6,t6,a0
    dac8:	00bf8fb3          	add	t6,t6,a1
    dacc:	ffe28493          	addi	s1,t0,-2
    dad0:	01f787b3          	add	a5,a5,t6
    dad4:	40d706b3          	sub	a3,a4,a3
    dad8:	41e787b3          	sub	a5,a5,t5
    dadc:	00d73733          	sltu	a4,a4,a3
    dae0:	40e787b3          	sub	a5,a5,a4
    dae4:	fff00f13          	li	t5,-1
    dae8:	12f58663          	beq	a1,a5,dc14 <__divdf3+0x4e8>
    daec:	0317dfb3          	divu	t6,a5,a7
    daf0:	0106d713          	srli	a4,a3,0x10
    daf4:	0317f7b3          	remu	a5,a5,a7
    daf8:	03f30f33          	mul	t5,t1,t6
    dafc:	01079793          	slli	a5,a5,0x10
    db00:	00f767b3          	or	a5,a4,a5
    db04:	000f8713          	mv	a4,t6
    db08:	01e7fe63          	bgeu	a5,t5,db24 <__divdf3+0x3f8>
    db0c:	00f587b3          	add	a5,a1,a5
    db10:	ffff8713          	addi	a4,t6,-1
    db14:	00b7e863          	bltu	a5,a1,db24 <__divdf3+0x3f8>
    db18:	01e7f663          	bgeu	a5,t5,db24 <__divdf3+0x3f8>
    db1c:	ffef8713          	addi	a4,t6,-2
    db20:	00b787b3          	add	a5,a5,a1
    db24:	41e787b3          	sub	a5,a5,t5
    db28:	0317df33          	divu	t5,a5,a7
    db2c:	01069693          	slli	a3,a3,0x10
    db30:	0106d693          	srli	a3,a3,0x10
    db34:	0317f7b3          	remu	a5,a5,a7
    db38:	000f0893          	mv	a7,t5
    db3c:	03e30333          	mul	t1,t1,t5
    db40:	01079793          	slli	a5,a5,0x10
    db44:	00f6e7b3          	or	a5,a3,a5
    db48:	0067fe63          	bgeu	a5,t1,db64 <__divdf3+0x438>
    db4c:	00f587b3          	add	a5,a1,a5
    db50:	ffff0893          	addi	a7,t5,-1
    db54:	00b7e863          	bltu	a5,a1,db64 <__divdf3+0x438>
    db58:	0067f663          	bgeu	a5,t1,db64 <__divdf3+0x438>
    db5c:	ffef0893          	addi	a7,t5,-2
    db60:	00b787b3          	add	a5,a5,a1
    db64:	01071693          	slli	a3,a4,0x10
    db68:	0116e6b3          	or	a3,a3,a7
    db6c:	01069713          	slli	a4,a3,0x10
    db70:	01075713          	srli	a4,a4,0x10
    db74:	406787b3          	sub	a5,a5,t1
    db78:	0106d313          	srli	t1,a3,0x10
    db7c:	03c70f33          	mul	t5,a4,t3
    db80:	03c30e33          	mul	t3,t1,t3
    db84:	026e8333          	mul	t1,t4,t1
    db88:	02ee8eb3          	mul	t4,t4,a4
    db8c:	010f5713          	srli	a4,t5,0x10
    db90:	01ce8eb3          	add	t4,t4,t3
    db94:	01d70733          	add	a4,a4,t4
    db98:	01c77663          	bgeu	a4,t3,dba4 <__divdf3+0x478>
    db9c:	000108b7          	lui	a7,0x10
    dba0:	01130333          	add	t1,t1,a7
    dba4:	01075893          	srli	a7,a4,0x10
    dba8:	006888b3          	add	a7,a7,t1
    dbac:	00010337          	lui	t1,0x10
    dbb0:	fff30313          	addi	t1,t1,-1 # ffff <__multf3+0xd47>
    dbb4:	00677733          	and	a4,a4,t1
    dbb8:	01071713          	slli	a4,a4,0x10
    dbbc:	006f7f33          	and	t5,t5,t1
    dbc0:	01e70733          	add	a4,a4,t5
    dbc4:	0117e863          	bltu	a5,a7,dbd4 <__divdf3+0x4a8>
    dbc8:	23179c63          	bne	a5,a7,de00 <__divdf3+0x6d4>
    dbcc:	00068f13          	mv	t5,a3
    dbd0:	04070263          	beqz	a4,dc14 <__divdf3+0x4e8>
    dbd4:	00f587b3          	add	a5,a1,a5
    dbd8:	fff68f13          	addi	t5,a3,-1
    dbdc:	00078313          	mv	t1,a5
    dbe0:	02b7e463          	bltu	a5,a1,dc08 <__divdf3+0x4dc>
    dbe4:	0117e663          	bltu	a5,a7,dbf0 <__divdf3+0x4c4>
    dbe8:	21179a63          	bne	a5,a7,ddfc <__divdf3+0x6d0>
    dbec:	02e57063          	bgeu	a0,a4,dc0c <__divdf3+0x4e0>
    dbf0:	ffe68f13          	addi	t5,a3,-2
    dbf4:	00151693          	slli	a3,a0,0x1
    dbf8:	00a6b333          	sltu	t1,a3,a0
    dbfc:	00b30333          	add	t1,t1,a1
    dc00:	00678333          	add	t1,a5,t1
    dc04:	00068513          	mv	a0,a3
    dc08:	01131463          	bne	t1,a7,dc10 <__divdf3+0x4e4>
    dc0c:	00a70463          	beq	a4,a0,dc14 <__divdf3+0x4e8>
    dc10:	001f6f13          	ori	t5,t5,1
    dc14:	3ff80713          	addi	a4,a6,1023
    dc18:	10e05263          	blez	a4,dd1c <__divdf3+0x5f0>
    dc1c:	007f7793          	andi	a5,t5,7
    dc20:	02078063          	beqz	a5,dc40 <__divdf3+0x514>
    dc24:	00ff7793          	andi	a5,t5,15
    dc28:	00400693          	li	a3,4
    dc2c:	00d78a63          	beq	a5,a3,dc40 <__divdf3+0x514>
    dc30:	004f0793          	addi	a5,t5,4
    dc34:	01e7b6b3          	sltu	a3,a5,t5
    dc38:	00d484b3          	add	s1,s1,a3
    dc3c:	00078f13          	mv	t5,a5
    dc40:	00749793          	slli	a5,s1,0x7
    dc44:	0007da63          	bgez	a5,dc58 <__divdf3+0x52c>
    dc48:	ff0007b7          	lui	a5,0xff000
    dc4c:	fff78793          	addi	a5,a5,-1 # feffffff <_memory_end+0xfefdffff>
    dc50:	00f4f4b3          	and	s1,s1,a5
    dc54:	40080713          	addi	a4,a6,1024
    dc58:	7fe00793          	li	a5,2046
    dc5c:	08e7ca63          	blt	a5,a4,dcf0 <__divdf3+0x5c4>
    dc60:	003f5f13          	srli	t5,t5,0x3
    dc64:	01d49793          	slli	a5,s1,0x1d
    dc68:	01e7ef33          	or	t5,a5,t5
    dc6c:	0034d513          	srli	a0,s1,0x3
    dc70:	00c51513          	slli	a0,a0,0xc
    dc74:	02c12083          	lw	ra,44(sp)
    dc78:	02812403          	lw	s0,40(sp)
    dc7c:	00c55513          	srli	a0,a0,0xc
    dc80:	01471713          	slli	a4,a4,0x14
    dc84:	00a76733          	or	a4,a4,a0
    dc88:	01f61613          	slli	a2,a2,0x1f
    dc8c:	00c767b3          	or	a5,a4,a2
    dc90:	02412483          	lw	s1,36(sp)
    dc94:	02012903          	lw	s2,32(sp)
    dc98:	01c12983          	lw	s3,28(sp)
    dc9c:	01812a03          	lw	s4,24(sp)
    dca0:	01412a83          	lw	s5,20(sp)
    dca4:	01012b03          	lw	s6,16(sp)
    dca8:	00c12b83          	lw	s7,12(sp)
    dcac:	000f0513          	mv	a0,t5
    dcb0:	00078593          	mv	a1,a5
    dcb4:	03010113          	addi	sp,sp,48
    dcb8:	00008067          	ret
    dcbc:	fff80813          	addi	a6,a6,-1
    dcc0:	00000713          	li	a4,0
    dcc4:	cbdff06f          	j	d980 <__divdf3+0x254>
    dcc8:	00098613          	mv	a2,s3
    dccc:	000a0493          	mv	s1,s4
    dcd0:	00040f13          	mv	t5,s0
    dcd4:	000b0793          	mv	a5,s6
    dcd8:	00300713          	li	a4,3
    dcdc:	0ee78863          	beq	a5,a4,ddcc <__divdf3+0x6a0>
    dce0:	00100713          	li	a4,1
    dce4:	0ee78e63          	beq	a5,a4,dde0 <__divdf3+0x6b4>
    dce8:	00200713          	li	a4,2
    dcec:	f2e794e3          	bne	a5,a4,dc14 <__divdf3+0x4e8>
    dcf0:	00000513          	li	a0,0
    dcf4:	00000f13          	li	t5,0
    dcf8:	7ff00713          	li	a4,2047
    dcfc:	f75ff06f          	j	dc70 <__divdf3+0x544>
    dd00:	00090613          	mv	a2,s2
    dd04:	fd5ff06f          	j	dcd8 <__divdf3+0x5ac>
    dd08:	000804b7          	lui	s1,0x80
    dd0c:	00000f13          	li	t5,0
    dd10:	00000613          	li	a2,0
    dd14:	00300793          	li	a5,3
    dd18:	fc1ff06f          	j	dcd8 <__divdf3+0x5ac>
    dd1c:	00100513          	li	a0,1
    dd20:	40e50533          	sub	a0,a0,a4
    dd24:	03800793          	li	a5,56
    dd28:	0aa7cc63          	blt	a5,a0,dde0 <__divdf3+0x6b4>
    dd2c:	01f00793          	li	a5,31
    dd30:	06a7c463          	blt	a5,a0,dd98 <__divdf3+0x66c>
    dd34:	41e80813          	addi	a6,a6,1054
    dd38:	010497b3          	sll	a5,s1,a6
    dd3c:	00af5733          	srl	a4,t5,a0
    dd40:	010f1833          	sll	a6,t5,a6
    dd44:	00e7e7b3          	or	a5,a5,a4
    dd48:	01003833          	snez	a6,a6
    dd4c:	0107e7b3          	or	a5,a5,a6
    dd50:	00a4d533          	srl	a0,s1,a0
    dd54:	0077f713          	andi	a4,a5,7
    dd58:	02070063          	beqz	a4,dd78 <__divdf3+0x64c>
    dd5c:	00f7f713          	andi	a4,a5,15
    dd60:	00400693          	li	a3,4
    dd64:	00d70a63          	beq	a4,a3,dd78 <__divdf3+0x64c>
    dd68:	00478713          	addi	a4,a5,4
    dd6c:	00f736b3          	sltu	a3,a4,a5
    dd70:	00d50533          	add	a0,a0,a3
    dd74:	00070793          	mv	a5,a4
    dd78:	00851713          	slli	a4,a0,0x8
    dd7c:	06074863          	bltz	a4,ddec <__divdf3+0x6c0>
    dd80:	01d51f13          	slli	t5,a0,0x1d
    dd84:	0037d793          	srli	a5,a5,0x3
    dd88:	00ff6f33          	or	t5,t5,a5
    dd8c:	00355513          	srli	a0,a0,0x3
    dd90:	00000713          	li	a4,0
    dd94:	eddff06f          	j	dc70 <__divdf3+0x544>
    dd98:	fe100793          	li	a5,-31
    dd9c:	40e787b3          	sub	a5,a5,a4
    dda0:	02000693          	li	a3,32
    dda4:	00f4d7b3          	srl	a5,s1,a5
    dda8:	00000713          	li	a4,0
    ddac:	00d50663          	beq	a0,a3,ddb8 <__divdf3+0x68c>
    ddb0:	43e80713          	addi	a4,a6,1086
    ddb4:	00e49733          	sll	a4,s1,a4
    ddb8:	01e76733          	or	a4,a4,t5
    ddbc:	00e03733          	snez	a4,a4
    ddc0:	00e7e7b3          	or	a5,a5,a4
    ddc4:	00000513          	li	a0,0
    ddc8:	f8dff06f          	j	dd54 <__divdf3+0x628>
    ddcc:	00080537          	lui	a0,0x80
    ddd0:	00000f13          	li	t5,0
    ddd4:	7ff00713          	li	a4,2047
    ddd8:	00000613          	li	a2,0
    dddc:	e95ff06f          	j	dc70 <__divdf3+0x544>
    dde0:	00000513          	li	a0,0
    dde4:	00000f13          	li	t5,0
    dde8:	fa9ff06f          	j	dd90 <__divdf3+0x664>
    ddec:	00000513          	li	a0,0
    ddf0:	00000f13          	li	t5,0
    ddf4:	00100713          	li	a4,1
    ddf8:	e79ff06f          	j	dc70 <__divdf3+0x544>
    ddfc:	000f0693          	mv	a3,t5
    de00:	00068f13          	mv	t5,a3
    de04:	e0dff06f          	j	dc10 <__divdf3+0x4e4>

0000de08 <__eqdf2>:
    de08:	0145d713          	srli	a4,a1,0x14
    de0c:	001007b7          	lui	a5,0x100
    de10:	fff78793          	addi	a5,a5,-1 # fffff <_memory_end+0xdffff>
    de14:	0146d813          	srli	a6,a3,0x14
    de18:	00050313          	mv	t1,a0
    de1c:	00050e93          	mv	t4,a0
    de20:	7ff77713          	andi	a4,a4,2047
    de24:	7ff00513          	li	a0,2047
    de28:	00b7f8b3          	and	a7,a5,a1
    de2c:	00060f13          	mv	t5,a2
    de30:	00d7f7b3          	and	a5,a5,a3
    de34:	01f5d593          	srli	a1,a1,0x1f
    de38:	7ff87813          	andi	a6,a6,2047
    de3c:	01f6d693          	srli	a3,a3,0x1f
    de40:	00a71c63          	bne	a4,a0,de58 <__eqdf2+0x50>
    de44:	0068ee33          	or	t3,a7,t1
    de48:	00100513          	li	a0,1
    de4c:	000e1463          	bnez	t3,de54 <__eqdf2+0x4c>
    de50:	00e80663          	beq	a6,a4,de5c <__eqdf2+0x54>
    de54:	00008067          	ret
    de58:	00a81863          	bne	a6,a0,de68 <__eqdf2+0x60>
    de5c:	00c7e633          	or	a2,a5,a2
    de60:	00100513          	li	a0,1
    de64:	fe0618e3          	bnez	a2,de54 <__eqdf2+0x4c>
    de68:	00100513          	li	a0,1
    de6c:	ff0714e3          	bne	a4,a6,de54 <__eqdf2+0x4c>
    de70:	fef892e3          	bne	a7,a5,de54 <__eqdf2+0x4c>
    de74:	ffee90e3          	bne	t4,t5,de54 <__eqdf2+0x4c>
    de78:	00d58a63          	beq	a1,a3,de8c <__eqdf2+0x84>
    de7c:	fc071ce3          	bnez	a4,de54 <__eqdf2+0x4c>
    de80:	0068e8b3          	or	a7,a7,t1
    de84:	01103533          	snez	a0,a7
    de88:	00008067          	ret
    de8c:	00000513          	li	a0,0
    de90:	00008067          	ret

0000de94 <__gedf2>:
    de94:	0146d793          	srli	a5,a3,0x14
    de98:	0145d893          	srli	a7,a1,0x14
    de9c:	00100737          	lui	a4,0x100
    dea0:	fff70713          	addi	a4,a4,-1 # fffff <_memory_end+0xdffff>
    dea4:	00050813          	mv	a6,a0
    dea8:	00050e13          	mv	t3,a0
    deac:	7ff8f893          	andi	a7,a7,2047
    deb0:	7ff7f513          	andi	a0,a5,2047
    deb4:	7ff00793          	li	a5,2047
    deb8:	00b77333          	and	t1,a4,a1
    debc:	00060e93          	mv	t4,a2
    dec0:	00d77733          	and	a4,a4,a3
    dec4:	01f5d593          	srli	a1,a1,0x1f
    dec8:	01f6d693          	srli	a3,a3,0x1f
    decc:	00f89663          	bne	a7,a5,ded8 <__gedf2+0x44>
    ded0:	010367b3          	or	a5,t1,a6
    ded4:	06079c63          	bnez	a5,df4c <__gedf2+0xb8>
    ded8:	7ff00793          	li	a5,2047
    dedc:	00f51663          	bne	a0,a5,dee8 <__gedf2+0x54>
    dee0:	00c767b3          	or	a5,a4,a2
    dee4:	06079463          	bnez	a5,df4c <__gedf2+0xb8>
    dee8:	00000793          	li	a5,0
    deec:	00089663          	bnez	a7,def8 <__gedf2+0x64>
    def0:	01036833          	or	a6,t1,a6
    def4:	00183793          	seqz	a5,a6
    def8:	04051e63          	bnez	a0,df54 <__gedf2+0xc0>
    defc:	00c76633          	or	a2,a4,a2
    df00:	00078c63          	beqz	a5,df18 <__gedf2+0x84>
    df04:	02060063          	beqz	a2,df24 <__gedf2+0x90>
    df08:	00100513          	li	a0,1
    df0c:	00069c63          	bnez	a3,df24 <__gedf2+0x90>
    df10:	fff00513          	li	a0,-1
    df14:	00008067          	ret
    df18:	04061063          	bnez	a2,df58 <__gedf2+0xc4>
    df1c:	fff00513          	li	a0,-1
    df20:	04058463          	beqz	a1,df68 <__gedf2+0xd4>
    df24:	00008067          	ret
    df28:	fea8c0e3          	blt	a7,a0,df08 <__gedf2+0x74>
    df2c:	fe6768e3          	bltu	a4,t1,df1c <__gedf2+0x88>
    df30:	00e31863          	bne	t1,a4,df40 <__gedf2+0xac>
    df34:	ffcee4e3          	bltu	t4,t3,df1c <__gedf2+0x88>
    df38:	00000513          	li	a0,0
    df3c:	ffde74e3          	bgeu	t3,t4,df24 <__gedf2+0x90>
    df40:	00100513          	li	a0,1
    df44:	fe0590e3          	bnez	a1,df24 <__gedf2+0x90>
    df48:	fc9ff06f          	j	df10 <__gedf2+0x7c>
    df4c:	ffe00513          	li	a0,-2
    df50:	00008067          	ret
    df54:	fa079ae3          	bnez	a5,df08 <__gedf2+0x74>
    df58:	fcb692e3          	bne	a3,a1,df1c <__gedf2+0x88>
    df5c:	fd1556e3          	bge	a0,a7,df28 <__gedf2+0x94>
    df60:	fff00513          	li	a0,-1
    df64:	fc0690e3          	bnez	a3,df24 <__gedf2+0x90>
    df68:	00100513          	li	a0,1
    df6c:	00008067          	ret

0000df70 <__ledf2>:
    df70:	0146d793          	srli	a5,a3,0x14
    df74:	0145d893          	srli	a7,a1,0x14
    df78:	00100737          	lui	a4,0x100
    df7c:	fff70713          	addi	a4,a4,-1 # fffff <_memory_end+0xdffff>
    df80:	00050813          	mv	a6,a0
    df84:	00050e13          	mv	t3,a0
    df88:	7ff8f893          	andi	a7,a7,2047
    df8c:	7ff7f513          	andi	a0,a5,2047
    df90:	7ff00793          	li	a5,2047
    df94:	00b77333          	and	t1,a4,a1
    df98:	00060e93          	mv	t4,a2
    df9c:	00d77733          	and	a4,a4,a3
    dfa0:	01f5d593          	srli	a1,a1,0x1f
    dfa4:	01f6d693          	srli	a3,a3,0x1f
    dfa8:	00f89663          	bne	a7,a5,dfb4 <__ledf2+0x44>
    dfac:	010367b3          	or	a5,t1,a6
    dfb0:	06079c63          	bnez	a5,e028 <__ledf2+0xb8>
    dfb4:	7ff00793          	li	a5,2047
    dfb8:	00f51663          	bne	a0,a5,dfc4 <__ledf2+0x54>
    dfbc:	00c767b3          	or	a5,a4,a2
    dfc0:	06079463          	bnez	a5,e028 <__ledf2+0xb8>
    dfc4:	00000793          	li	a5,0
    dfc8:	00089663          	bnez	a7,dfd4 <__ledf2+0x64>
    dfcc:	01036833          	or	a6,t1,a6
    dfd0:	00183793          	seqz	a5,a6
    dfd4:	04051e63          	bnez	a0,e030 <__ledf2+0xc0>
    dfd8:	00c76633          	or	a2,a4,a2
    dfdc:	00078c63          	beqz	a5,dff4 <__ledf2+0x84>
    dfe0:	02060063          	beqz	a2,e000 <__ledf2+0x90>
    dfe4:	00100513          	li	a0,1
    dfe8:	00069c63          	bnez	a3,e000 <__ledf2+0x90>
    dfec:	fff00513          	li	a0,-1
    dff0:	00008067          	ret
    dff4:	04061063          	bnez	a2,e034 <__ledf2+0xc4>
    dff8:	fff00513          	li	a0,-1
    dffc:	04058463          	beqz	a1,e044 <__ledf2+0xd4>
    e000:	00008067          	ret
    e004:	fea8c0e3          	blt	a7,a0,dfe4 <__ledf2+0x74>
    e008:	fe6768e3          	bltu	a4,t1,dff8 <__ledf2+0x88>
    e00c:	00e31863          	bne	t1,a4,e01c <__ledf2+0xac>
    e010:	ffcee4e3          	bltu	t4,t3,dff8 <__ledf2+0x88>
    e014:	00000513          	li	a0,0
    e018:	ffde74e3          	bgeu	t3,t4,e000 <__ledf2+0x90>
    e01c:	00100513          	li	a0,1
    e020:	fe0590e3          	bnez	a1,e000 <__ledf2+0x90>
    e024:	fc9ff06f          	j	dfec <__ledf2+0x7c>
    e028:	00200513          	li	a0,2
    e02c:	00008067          	ret
    e030:	fa079ae3          	bnez	a5,dfe4 <__ledf2+0x74>
    e034:	fcb692e3          	bne	a3,a1,dff8 <__ledf2+0x88>
    e038:	fd1556e3          	bge	a0,a7,e004 <__ledf2+0x94>
    e03c:	fff00513          	li	a0,-1
    e040:	fc0690e3          	bnez	a3,e000 <__ledf2+0x90>
    e044:	00100513          	li	a0,1
    e048:	00008067          	ret

0000e04c <__muldf3>:
    e04c:	fd010113          	addi	sp,sp,-48
    e050:	01512a23          	sw	s5,20(sp)
    e054:	0145da93          	srli	s5,a1,0x14
    e058:	02812423          	sw	s0,40(sp)
    e05c:	02912223          	sw	s1,36(sp)
    e060:	01312e23          	sw	s3,28(sp)
    e064:	01412c23          	sw	s4,24(sp)
    e068:	01612823          	sw	s6,16(sp)
    e06c:	00c59493          	slli	s1,a1,0xc
    e070:	02112623          	sw	ra,44(sp)
    e074:	03212023          	sw	s2,32(sp)
    e078:	01712623          	sw	s7,12(sp)
    e07c:	7ffafa93          	andi	s5,s5,2047
    e080:	00050413          	mv	s0,a0
    e084:	00060b13          	mv	s6,a2
    e088:	00068993          	mv	s3,a3
    e08c:	00c4d493          	srli	s1,s1,0xc
    e090:	01f5da13          	srli	s4,a1,0x1f
    e094:	240a8e63          	beqz	s5,e2f0 <__muldf3+0x2a4>
    e098:	7ff00793          	li	a5,2047
    e09c:	2cfa8063          	beq	s5,a5,e35c <__muldf3+0x310>
    e0a0:	00349493          	slli	s1,s1,0x3
    e0a4:	01d55793          	srli	a5,a0,0x1d
    e0a8:	0097e7b3          	or	a5,a5,s1
    e0ac:	008004b7          	lui	s1,0x800
    e0b0:	0097e4b3          	or	s1,a5,s1
    e0b4:	00351913          	slli	s2,a0,0x3
    e0b8:	c01a8a93          	addi	s5,s5,-1023
    e0bc:	00000b93          	li	s7,0
    e0c0:	0149d713          	srli	a4,s3,0x14
    e0c4:	00c99413          	slli	s0,s3,0xc
    e0c8:	7ff77713          	andi	a4,a4,2047
    e0cc:	00c45413          	srli	s0,s0,0xc
    e0d0:	01f9d993          	srli	s3,s3,0x1f
    e0d4:	2c070063          	beqz	a4,e394 <__muldf3+0x348>
    e0d8:	7ff00793          	li	a5,2047
    e0dc:	32f70463          	beq	a4,a5,e404 <__muldf3+0x3b8>
    e0e0:	00341413          	slli	s0,s0,0x3
    e0e4:	01db5793          	srli	a5,s6,0x1d
    e0e8:	0087e7b3          	or	a5,a5,s0
    e0ec:	00800437          	lui	s0,0x800
    e0f0:	0087e433          	or	s0,a5,s0
    e0f4:	c0170693          	addi	a3,a4,-1023
    e0f8:	003b1793          	slli	a5,s6,0x3
    e0fc:	00000713          	li	a4,0
    e100:	00da8ab3          	add	s5,s5,a3
    e104:	002b9693          	slli	a3,s7,0x2
    e108:	00e6e6b3          	or	a3,a3,a4
    e10c:	00a00613          	li	a2,10
    e110:	001a8513          	addi	a0,s5,1
    e114:	40d64663          	blt	a2,a3,e520 <__muldf3+0x4d4>
    e118:	00200613          	li	a2,2
    e11c:	013a45b3          	xor	a1,s4,s3
    e120:	30d64e63          	blt	a2,a3,e43c <__muldf3+0x3f0>
    e124:	fff68693          	addi	a3,a3,-1
    e128:	00100613          	li	a2,1
    e12c:	32d67a63          	bgeu	a2,a3,e460 <__muldf3+0x414>
    e130:	00010337          	lui	t1,0x10
    e134:	fff30e13          	addi	t3,t1,-1 # ffff <__multf3+0xd47>
    e138:	01095713          	srli	a4,s2,0x10
    e13c:	0107d893          	srli	a7,a5,0x10
    e140:	01c97933          	and	s2,s2,t3
    e144:	01c7ff33          	and	t5,a5,t3
    e148:	03e907b3          	mul	a5,s2,t5
    e14c:	03e70eb3          	mul	t4,a4,t5
    e150:	0107d813          	srli	a6,a5,0x10
    e154:	03288633          	mul	a2,a7,s2
    e158:	01d60633          	add	a2,a2,t4
    e15c:	00c80833          	add	a6,a6,a2
    e160:	031706b3          	mul	a3,a4,a7
    e164:	01d87463          	bgeu	a6,t4,e16c <__muldf3+0x120>
    e168:	006686b3          	add	a3,a3,t1
    e16c:	01085293          	srli	t0,a6,0x10
    e170:	01c87833          	and	a6,a6,t3
    e174:	01c7f7b3          	and	a5,a5,t3
    e178:	01045613          	srli	a2,s0,0x10
    e17c:	01c47e33          	and	t3,s0,t3
    e180:	01081813          	slli	a6,a6,0x10
    e184:	00f80833          	add	a6,a6,a5
    e188:	03c90eb3          	mul	t4,s2,t3
    e18c:	03c707b3          	mul	a5,a4,t3
    e190:	03260933          	mul	s2,a2,s2
    e194:	02c70333          	mul	t1,a4,a2
    e198:	00f90933          	add	s2,s2,a5
    e19c:	010ed713          	srli	a4,t4,0x10
    e1a0:	01270733          	add	a4,a4,s2
    e1a4:	00f77663          	bgeu	a4,a5,e1b0 <__muldf3+0x164>
    e1a8:	000107b7          	lui	a5,0x10
    e1ac:	00f30333          	add	t1,t1,a5
    e1b0:	00010437          	lui	s0,0x10
    e1b4:	01075793          	srli	a5,a4,0x10
    e1b8:	fff40f93          	addi	t6,s0,-1 # ffff <__multf3+0xd47>
    e1bc:	00678333          	add	t1,a5,t1
    e1c0:	01f777b3          	and	a5,a4,t6
    e1c4:	01fefeb3          	and	t4,t4,t6
    e1c8:	01079793          	slli	a5,a5,0x10
    e1cc:	01f4ffb3          	and	t6,s1,t6
    e1d0:	01d787b3          	add	a5,a5,t4
    e1d4:	0104de93          	srli	t4,s1,0x10
    e1d8:	03ff03b3          	mul	t2,t5,t6
    e1dc:	00f282b3          	add	t0,t0,a5
    e1e0:	03ee8f33          	mul	t5,t4,t5
    e1e4:	0103d713          	srli	a4,t2,0x10
    e1e8:	03d884b3          	mul	s1,a7,t4
    e1ec:	03f888b3          	mul	a7,a7,t6
    e1f0:	01e888b3          	add	a7,a7,t5
    e1f4:	01170733          	add	a4,a4,a7
    e1f8:	01e77463          	bgeu	a4,t5,e200 <__muldf3+0x1b4>
    e1fc:	008484b3          	add	s1,s1,s0
    e200:	01075f13          	srli	t5,a4,0x10
    e204:	009f0f33          	add	t5,t5,s1
    e208:	000104b7          	lui	s1,0x10
    e20c:	fff48413          	addi	s0,s1,-1 # ffff <__multf3+0xd47>
    e210:	00877733          	and	a4,a4,s0
    e214:	0083f3b3          	and	t2,t2,s0
    e218:	01071713          	slli	a4,a4,0x10
    e21c:	007708b3          	add	a7,a4,t2
    e220:	03fe03b3          	mul	t2,t3,t6
    e224:	03ce8e33          	mul	t3,t4,t3
    e228:	03d60eb3          	mul	t4,a2,t4
    e22c:	03f60633          	mul	a2,a2,t6
    e230:	0103df93          	srli	t6,t2,0x10
    e234:	01c60633          	add	a2,a2,t3
    e238:	00cf8fb3          	add	t6,t6,a2
    e23c:	01cff463          	bgeu	t6,t3,e244 <__muldf3+0x1f8>
    e240:	009e8eb3          	add	t4,t4,s1
    e244:	008ff733          	and	a4,t6,s0
    e248:	0083f3b3          	and	t2,t2,s0
    e24c:	01071713          	slli	a4,a4,0x10
    e250:	005686b3          	add	a3,a3,t0
    e254:	00770733          	add	a4,a4,t2
    e258:	00670333          	add	t1,a4,t1
    e25c:	00f6b7b3          	sltu	a5,a3,a5
    e260:	00f307b3          	add	a5,t1,a5
    e264:	00e33633          	sltu	a2,t1,a4
    e268:	011688b3          	add	a7,a3,a7
    e26c:	0067b333          	sltu	t1,a5,t1
    e270:	00666633          	or	a2,a2,t1
    e274:	00d8b6b3          	sltu	a3,a7,a3
    e278:	01e78333          	add	t1,a5,t5
    e27c:	00d306b3          	add	a3,t1,a3
    e280:	00f33733          	sltu	a4,t1,a5
    e284:	010fdf93          	srli	t6,t6,0x10
    e288:	0066b333          	sltu	t1,a3,t1
    e28c:	00989793          	slli	a5,a7,0x9
    e290:	01f60633          	add	a2,a2,t6
    e294:	00676733          	or	a4,a4,t1
    e298:	00c70733          	add	a4,a4,a2
    e29c:	0107e7b3          	or	a5,a5,a6
    e2a0:	01d70733          	add	a4,a4,t4
    e2a4:	00f037b3          	snez	a5,a5
    e2a8:	0178d893          	srli	a7,a7,0x17
    e2ac:	00971713          	slli	a4,a4,0x9
    e2b0:	0176d413          	srli	s0,a3,0x17
    e2b4:	0117e7b3          	or	a5,a5,a7
    e2b8:	00969693          	slli	a3,a3,0x9
    e2bc:	00d7e7b3          	or	a5,a5,a3
    e2c0:	00771693          	slli	a3,a4,0x7
    e2c4:	00876433          	or	s0,a4,s0
    e2c8:	0206d063          	bgez	a3,e2e8 <__muldf3+0x29c>
    e2cc:	0017d713          	srli	a4,a5,0x1
    e2d0:	0017f793          	andi	a5,a5,1
    e2d4:	00f76733          	or	a4,a4,a5
    e2d8:	01f41793          	slli	a5,s0,0x1f
    e2dc:	00f767b3          	or	a5,a4,a5
    e2e0:	00145413          	srli	s0,s0,0x1
    e2e4:	00050a93          	mv	s5,a0
    e2e8:	000a8513          	mv	a0,s5
    e2ec:	18c0006f          	j	e478 <__muldf3+0x42c>
    e2f0:	00a4e933          	or	s2,s1,a0
    e2f4:	08090063          	beqz	s2,e374 <__muldf3+0x328>
    e2f8:	04048063          	beqz	s1,e338 <__muldf3+0x2ec>
    e2fc:	00048513          	mv	a0,s1
    e300:	480040ef          	jal	12780 <__clzsi2>
    e304:	ff550713          	addi	a4,a0,-11 # 7fff5 <_memory_end+0x5fff5>
    e308:	01d00793          	li	a5,29
    e30c:	ff850693          	addi	a3,a0,-8
    e310:	40e787b3          	sub	a5,a5,a4
    e314:	00d494b3          	sll	s1,s1,a3
    e318:	00f457b3          	srl	a5,s0,a5
    e31c:	0097e7b3          	or	a5,a5,s1
    e320:	00d414b3          	sll	s1,s0,a3
    e324:	c0d00a93          	li	s5,-1011
    e328:	00048913          	mv	s2,s1
    e32c:	40aa8ab3          	sub	s5,s5,a0
    e330:	00078493          	mv	s1,a5
    e334:	d89ff06f          	j	e0bc <__muldf3+0x70>
    e338:	448040ef          	jal	12780 <__clzsi2>
    e33c:	00050793          	mv	a5,a0
    e340:	01578713          	addi	a4,a5,21 # 10015 <__multf3+0xd5d>
    e344:	01c00693          	li	a3,28
    e348:	02050513          	addi	a0,a0,32
    e34c:	fae6dee3          	bge	a3,a4,e308 <__muldf3+0x2bc>
    e350:	ff878793          	addi	a5,a5,-8
    e354:	00f417b3          	sll	a5,s0,a5
    e358:	fcdff06f          	j	e324 <__muldf3+0x2d8>
    e35c:	00a4e933          	or	s2,s1,a0
    e360:	02091263          	bnez	s2,e384 <__muldf3+0x338>
    e364:	00000493          	li	s1,0
    e368:	7ff00a93          	li	s5,2047
    e36c:	00200b93          	li	s7,2
    e370:	d51ff06f          	j	e0c0 <__muldf3+0x74>
    e374:	00000493          	li	s1,0
    e378:	00000a93          	li	s5,0
    e37c:	00100b93          	li	s7,1
    e380:	d41ff06f          	j	e0c0 <__muldf3+0x74>
    e384:	00050913          	mv	s2,a0
    e388:	7ff00a93          	li	s5,2047
    e38c:	00300b93          	li	s7,3
    e390:	d31ff06f          	j	e0c0 <__muldf3+0x74>
    e394:	016467b3          	or	a5,s0,s6
    e398:	08078263          	beqz	a5,e41c <__muldf3+0x3d0>
    e39c:	04040063          	beqz	s0,e3dc <__muldf3+0x390>
    e3a0:	00040513          	mv	a0,s0
    e3a4:	3dc040ef          	jal	12780 <__clzsi2>
    e3a8:	ff550693          	addi	a3,a0,-11
    e3ac:	01d00713          	li	a4,29
    e3b0:	ff850793          	addi	a5,a0,-8
    e3b4:	40d70733          	sub	a4,a4,a3
    e3b8:	00f41433          	sll	s0,s0,a5
    e3bc:	00eb5733          	srl	a4,s6,a4
    e3c0:	00876733          	or	a4,a4,s0
    e3c4:	00fb1433          	sll	s0,s6,a5
    e3c8:	c0d00693          	li	a3,-1011
    e3cc:	00040793          	mv	a5,s0
    e3d0:	40a686b3          	sub	a3,a3,a0
    e3d4:	00070413          	mv	s0,a4
    e3d8:	d25ff06f          	j	e0fc <__muldf3+0xb0>
    e3dc:	000b0513          	mv	a0,s6
    e3e0:	3a0040ef          	jal	12780 <__clzsi2>
    e3e4:	00050793          	mv	a5,a0
    e3e8:	01578693          	addi	a3,a5,21
    e3ec:	01c00713          	li	a4,28
    e3f0:	02050513          	addi	a0,a0,32
    e3f4:	fad75ce3          	bge	a4,a3,e3ac <__muldf3+0x360>
    e3f8:	ff878793          	addi	a5,a5,-8
    e3fc:	00fb1733          	sll	a4,s6,a5
    e400:	fc9ff06f          	j	e3c8 <__muldf3+0x37c>
    e404:	016467b3          	or	a5,s0,s6
    e408:	02079263          	bnez	a5,e42c <__muldf3+0x3e0>
    e40c:	00000413          	li	s0,0
    e410:	7ff00693          	li	a3,2047
    e414:	00200713          	li	a4,2
    e418:	ce9ff06f          	j	e100 <__muldf3+0xb4>
    e41c:	00000413          	li	s0,0
    e420:	00000693          	li	a3,0
    e424:	00100713          	li	a4,1
    e428:	cd9ff06f          	j	e100 <__muldf3+0xb4>
    e42c:	000b0793          	mv	a5,s6
    e430:	7ff00693          	li	a3,2047
    e434:	00300713          	li	a4,3
    e438:	cc9ff06f          	j	e100 <__muldf3+0xb4>
    e43c:	00100613          	li	a2,1
    e440:	00d61633          	sll	a2,a2,a3
    e444:	53067693          	andi	a3,a2,1328
    e448:	0e069663          	bnez	a3,e534 <__muldf3+0x4e8>
    e44c:	24067813          	andi	a6,a2,576
    e450:	1a081a63          	bnez	a6,e604 <__muldf3+0x5b8>
    e454:	08867613          	andi	a2,a2,136
    e458:	cc060ce3          	beqz	a2,e130 <__muldf3+0xe4>
    e45c:	00098593          	mv	a1,s3
    e460:	00200693          	li	a3,2
    e464:	18d70863          	beq	a4,a3,e5f4 <__muldf3+0x5a8>
    e468:	00300693          	li	a3,3
    e46c:	1ad70463          	beq	a4,a3,e614 <__muldf3+0x5c8>
    e470:	00100693          	li	a3,1
    e474:	1ad70663          	beq	a4,a3,e620 <__muldf3+0x5d4>
    e478:	3ff50613          	addi	a2,a0,1023
    e47c:	0cc05463          	blez	a2,e544 <__muldf3+0x4f8>
    e480:	0077f713          	andi	a4,a5,7
    e484:	02070063          	beqz	a4,e4a4 <__muldf3+0x458>
    e488:	00f7f713          	andi	a4,a5,15
    e48c:	00400693          	li	a3,4
    e490:	00d70a63          	beq	a4,a3,e4a4 <__muldf3+0x458>
    e494:	00478713          	addi	a4,a5,4
    e498:	00f736b3          	sltu	a3,a4,a5
    e49c:	00d40433          	add	s0,s0,a3
    e4a0:	00070793          	mv	a5,a4
    e4a4:	00741713          	slli	a4,s0,0x7
    e4a8:	00075a63          	bgez	a4,e4bc <__muldf3+0x470>
    e4ac:	ff000737          	lui	a4,0xff000
    e4b0:	fff70713          	addi	a4,a4,-1 # feffffff <_memory_end+0xfefdffff>
    e4b4:	00e47433          	and	s0,s0,a4
    e4b8:	40050613          	addi	a2,a0,1024
    e4bc:	7fe00713          	li	a4,2046
    e4c0:	12c74a63          	blt	a4,a2,e5f4 <__muldf3+0x5a8>
    e4c4:	0037d793          	srli	a5,a5,0x3
    e4c8:	01d41693          	slli	a3,s0,0x1d
    e4cc:	00f6e6b3          	or	a3,a3,a5
    e4d0:	00345713          	srli	a4,s0,0x3
    e4d4:	00c71713          	slli	a4,a4,0xc
    e4d8:	02c12083          	lw	ra,44(sp)
    e4dc:	02812403          	lw	s0,40(sp)
    e4e0:	01461613          	slli	a2,a2,0x14
    e4e4:	00c75713          	srli	a4,a4,0xc
    e4e8:	01f59593          	slli	a1,a1,0x1f
    e4ec:	00e66633          	or	a2,a2,a4
    e4f0:	00b667b3          	or	a5,a2,a1
    e4f4:	02412483          	lw	s1,36(sp)
    e4f8:	02012903          	lw	s2,32(sp)
    e4fc:	01c12983          	lw	s3,28(sp)
    e500:	01812a03          	lw	s4,24(sp)
    e504:	01412a83          	lw	s5,20(sp)
    e508:	01012b03          	lw	s6,16(sp)
    e50c:	00c12b83          	lw	s7,12(sp)
    e510:	00068513          	mv	a0,a3
    e514:	00078593          	mv	a1,a5
    e518:	03010113          	addi	sp,sp,48
    e51c:	00008067          	ret
    e520:	00f00613          	li	a2,15
    e524:	0ec68863          	beq	a3,a2,e614 <__muldf3+0x5c8>
    e528:	00b00613          	li	a2,11
    e52c:	000a0593          	mv	a1,s4
    e530:	f2c686e3          	beq	a3,a2,e45c <__muldf3+0x410>
    e534:	00048413          	mv	s0,s1
    e538:	00090793          	mv	a5,s2
    e53c:	000b8713          	mv	a4,s7
    e540:	f21ff06f          	j	e460 <__muldf3+0x414>
    e544:	00100713          	li	a4,1
    e548:	40c70733          	sub	a4,a4,a2
    e54c:	03800693          	li	a3,56
    e550:	0ce6c863          	blt	a3,a4,e620 <__muldf3+0x5d4>
    e554:	01f00693          	li	a3,31
    e558:	06e6c463          	blt	a3,a4,e5c0 <__muldf3+0x574>
    e55c:	41e50513          	addi	a0,a0,1054
    e560:	00e7d633          	srl	a2,a5,a4
    e564:	00a416b3          	sll	a3,s0,a0
    e568:	00a79533          	sll	a0,a5,a0
    e56c:	00c6e6b3          	or	a3,a3,a2
    e570:	00a03533          	snez	a0,a0
    e574:	00a6e7b3          	or	a5,a3,a0
    e578:	00e45733          	srl	a4,s0,a4
    e57c:	0077f693          	andi	a3,a5,7
    e580:	02068063          	beqz	a3,e5a0 <__muldf3+0x554>
    e584:	00f7f693          	andi	a3,a5,15
    e588:	00400613          	li	a2,4
    e58c:	00c68a63          	beq	a3,a2,e5a0 <__muldf3+0x554>
    e590:	00478693          	addi	a3,a5,4
    e594:	00f6b633          	sltu	a2,a3,a5
    e598:	00c70733          	add	a4,a4,a2
    e59c:	00068793          	mv	a5,a3
    e5a0:	00871693          	slli	a3,a4,0x8
    e5a4:	0806c463          	bltz	a3,e62c <__muldf3+0x5e0>
    e5a8:	01d71693          	slli	a3,a4,0x1d
    e5ac:	0037d793          	srli	a5,a5,0x3
    e5b0:	00f6e6b3          	or	a3,a3,a5
    e5b4:	00375713          	srli	a4,a4,0x3
    e5b8:	00000613          	li	a2,0
    e5bc:	f19ff06f          	j	e4d4 <__muldf3+0x488>
    e5c0:	fe100693          	li	a3,-31
    e5c4:	40c686b3          	sub	a3,a3,a2
    e5c8:	02000813          	li	a6,32
    e5cc:	00d456b3          	srl	a3,s0,a3
    e5d0:	00000613          	li	a2,0
    e5d4:	01070663          	beq	a4,a6,e5e0 <__muldf3+0x594>
    e5d8:	43e50613          	addi	a2,a0,1086
    e5dc:	00c41633          	sll	a2,s0,a2
    e5e0:	00f66633          	or	a2,a2,a5
    e5e4:	00c03633          	snez	a2,a2
    e5e8:	00c6e7b3          	or	a5,a3,a2
    e5ec:	00000713          	li	a4,0
    e5f0:	f8dff06f          	j	e57c <__muldf3+0x530>
    e5f4:	00000713          	li	a4,0
    e5f8:	00000693          	li	a3,0
    e5fc:	7ff00613          	li	a2,2047
    e600:	ed5ff06f          	j	e4d4 <__muldf3+0x488>
    e604:	00080737          	lui	a4,0x80
    e608:	7ff00613          	li	a2,2047
    e60c:	00000593          	li	a1,0
    e610:	ec5ff06f          	j	e4d4 <__muldf3+0x488>
    e614:	00080737          	lui	a4,0x80
    e618:	00000693          	li	a3,0
    e61c:	fedff06f          	j	e608 <__muldf3+0x5bc>
    e620:	00000713          	li	a4,0
    e624:	00000693          	li	a3,0
    e628:	f91ff06f          	j	e5b8 <__muldf3+0x56c>
    e62c:	00000713          	li	a4,0
    e630:	00000693          	li	a3,0
    e634:	00100613          	li	a2,1
    e638:	e9dff06f          	j	e4d4 <__muldf3+0x488>

0000e63c <__subdf3>:
    e63c:	00100837          	lui	a6,0x100
    e640:	fff80813          	addi	a6,a6,-1 # fffff <_memory_end+0xdffff>
    e644:	fe010113          	addi	sp,sp,-32
    e648:	00b878b3          	and	a7,a6,a1
    e64c:	0145d713          	srli	a4,a1,0x14
    e650:	01d55793          	srli	a5,a0,0x1d
    e654:	00d87833          	and	a6,a6,a3
    e658:	01212823          	sw	s2,16(sp)
    e65c:	7ff77913          	andi	s2,a4,2047
    e660:	00389713          	slli	a4,a7,0x3
    e664:	0146d893          	srli	a7,a3,0x14
    e668:	00912a23          	sw	s1,20(sp)
    e66c:	00e7e7b3          	or	a5,a5,a4
    e670:	01f5d493          	srli	s1,a1,0x1f
    e674:	01d65713          	srli	a4,a2,0x1d
    e678:	00381813          	slli	a6,a6,0x3
    e67c:	00112e23          	sw	ra,28(sp)
    e680:	00812c23          	sw	s0,24(sp)
    e684:	01312623          	sw	s3,12(sp)
    e688:	7ff8f893          	andi	a7,a7,2047
    e68c:	7ff00593          	li	a1,2047
    e690:	00351513          	slli	a0,a0,0x3
    e694:	01f6d693          	srli	a3,a3,0x1f
    e698:	01076733          	or	a4,a4,a6
    e69c:	00361613          	slli	a2,a2,0x3
    e6a0:	00b89663          	bne	a7,a1,e6ac <__subdf3+0x70>
    e6a4:	00c765b3          	or	a1,a4,a2
    e6a8:	00059463          	bnez	a1,e6b0 <__subdf3+0x74>
    e6ac:	0016c693          	xori	a3,a3,1
    e6b0:	41190833          	sub	a6,s2,a7
    e6b4:	2a969a63          	bne	a3,s1,e968 <__subdf3+0x32c>
    e6b8:	11005c63          	blez	a6,e7d0 <__subdf3+0x194>
    e6bc:	04089063          	bnez	a7,e6fc <__subdf3+0xc0>
    e6c0:	00c766b3          	or	a3,a4,a2
    e6c4:	66068063          	beqz	a3,ed24 <__subdf3+0x6e8>
    e6c8:	fff80593          	addi	a1,a6,-1
    e6cc:	02059063          	bnez	a1,e6ec <__subdf3+0xb0>
    e6d0:	00c50633          	add	a2,a0,a2
    e6d4:	00a636b3          	sltu	a3,a2,a0
    e6d8:	00e78733          	add	a4,a5,a4
    e6dc:	00060513          	mv	a0,a2
    e6e0:	00d707b3          	add	a5,a4,a3
    e6e4:	00100913          	li	s2,1
    e6e8:	06c0006f          	j	e754 <__subdf3+0x118>
    e6ec:	7ff00693          	li	a3,2047
    e6f0:	02d81063          	bne	a6,a3,e710 <__subdf3+0xd4>
    e6f4:	7ff00913          	li	s2,2047
    e6f8:	1f80006f          	j	e8f0 <__subdf3+0x2b4>
    e6fc:	7ff00693          	li	a3,2047
    e700:	1ed90863          	beq	s2,a3,e8f0 <__subdf3+0x2b4>
    e704:	008006b7          	lui	a3,0x800
    e708:	00d76733          	or	a4,a4,a3
    e70c:	00080593          	mv	a1,a6
    e710:	03800693          	li	a3,56
    e714:	0ab6c863          	blt	a3,a1,e7c4 <__subdf3+0x188>
    e718:	01f00693          	li	a3,31
    e71c:	06b6ca63          	blt	a3,a1,e790 <__subdf3+0x154>
    e720:	02000813          	li	a6,32
    e724:	40b80833          	sub	a6,a6,a1
    e728:	010716b3          	sll	a3,a4,a6
    e72c:	00b658b3          	srl	a7,a2,a1
    e730:	01061833          	sll	a6,a2,a6
    e734:	0116e6b3          	or	a3,a3,a7
    e738:	01003833          	snez	a6,a6
    e73c:	0106e6b3          	or	a3,a3,a6
    e740:	00b755b3          	srl	a1,a4,a1
    e744:	00a68533          	add	a0,a3,a0
    e748:	00f585b3          	add	a1,a1,a5
    e74c:	00d536b3          	sltu	a3,a0,a3
    e750:	00d587b3          	add	a5,a1,a3
    e754:	00879713          	slli	a4,a5,0x8
    e758:	18075c63          	bgez	a4,e8f0 <__subdf3+0x2b4>
    e75c:	00190913          	addi	s2,s2,1
    e760:	7ff00713          	li	a4,2047
    e764:	5ae90a63          	beq	s2,a4,ed18 <__subdf3+0x6dc>
    e768:	ff800737          	lui	a4,0xff800
    e76c:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    e770:	00e7f733          	and	a4,a5,a4
    e774:	00155793          	srli	a5,a0,0x1
    e778:	00157513          	andi	a0,a0,1
    e77c:	00a7e7b3          	or	a5,a5,a0
    e780:	01f71513          	slli	a0,a4,0x1f
    e784:	00f56533          	or	a0,a0,a5
    e788:	00175793          	srli	a5,a4,0x1
    e78c:	1640006f          	j	e8f0 <__subdf3+0x2b4>
    e790:	fe058693          	addi	a3,a1,-32
    e794:	02000893          	li	a7,32
    e798:	00d756b3          	srl	a3,a4,a3
    e79c:	00000813          	li	a6,0
    e7a0:	01158863          	beq	a1,a7,e7b0 <__subdf3+0x174>
    e7a4:	04000813          	li	a6,64
    e7a8:	40b80833          	sub	a6,a6,a1
    e7ac:	01071833          	sll	a6,a4,a6
    e7b0:	00c86833          	or	a6,a6,a2
    e7b4:	01003833          	snez	a6,a6
    e7b8:	0106e6b3          	or	a3,a3,a6
    e7bc:	00000593          	li	a1,0
    e7c0:	f85ff06f          	j	e744 <__subdf3+0x108>
    e7c4:	00c766b3          	or	a3,a4,a2
    e7c8:	00d036b3          	snez	a3,a3
    e7cc:	ff1ff06f          	j	e7bc <__subdf3+0x180>
    e7d0:	0c080a63          	beqz	a6,e8a4 <__subdf3+0x268>
    e7d4:	412886b3          	sub	a3,a7,s2
    e7d8:	02091463          	bnez	s2,e800 <__subdf3+0x1c4>
    e7dc:	00a7e5b3          	or	a1,a5,a0
    e7e0:	50058e63          	beqz	a1,ecfc <__subdf3+0x6c0>
    e7e4:	fff68593          	addi	a1,a3,-1 # 7fffff <_memory_end+0x7dffff>
    e7e8:	ee0584e3          	beqz	a1,e6d0 <__subdf3+0x94>
    e7ec:	7ff00813          	li	a6,2047
    e7f0:	03069263          	bne	a3,a6,e814 <__subdf3+0x1d8>
    e7f4:	00070793          	mv	a5,a4
    e7f8:	00060513          	mv	a0,a2
    e7fc:	ef9ff06f          	j	e6f4 <__subdf3+0xb8>
    e800:	7ff00593          	li	a1,2047
    e804:	feb888e3          	beq	a7,a1,e7f4 <__subdf3+0x1b8>
    e808:	008005b7          	lui	a1,0x800
    e80c:	00b7e7b3          	or	a5,a5,a1
    e810:	00068593          	mv	a1,a3
    e814:	03800693          	li	a3,56
    e818:	08b6c063          	blt	a3,a1,e898 <__subdf3+0x25c>
    e81c:	01f00693          	li	a3,31
    e820:	04b6c263          	blt	a3,a1,e864 <__subdf3+0x228>
    e824:	02000813          	li	a6,32
    e828:	40b80833          	sub	a6,a6,a1
    e82c:	010796b3          	sll	a3,a5,a6
    e830:	00b55333          	srl	t1,a0,a1
    e834:	01051833          	sll	a6,a0,a6
    e838:	0066e6b3          	or	a3,a3,t1
    e83c:	01003833          	snez	a6,a6
    e840:	0106e6b3          	or	a3,a3,a6
    e844:	00b7d5b3          	srl	a1,a5,a1
    e848:	00c68633          	add	a2,a3,a2
    e84c:	00e585b3          	add	a1,a1,a4
    e850:	00d636b3          	sltu	a3,a2,a3
    e854:	00060513          	mv	a0,a2
    e858:	00d587b3          	add	a5,a1,a3
    e85c:	00088913          	mv	s2,a7
    e860:	ef5ff06f          	j	e754 <__subdf3+0x118>
    e864:	fe058693          	addi	a3,a1,-32 # 7fffe0 <_memory_end+0x7dffe0>
    e868:	02000313          	li	t1,32
    e86c:	00d7d6b3          	srl	a3,a5,a3
    e870:	00000813          	li	a6,0
    e874:	00658863          	beq	a1,t1,e884 <__subdf3+0x248>
    e878:	04000813          	li	a6,64
    e87c:	40b80833          	sub	a6,a6,a1
    e880:	01079833          	sll	a6,a5,a6
    e884:	00a86833          	or	a6,a6,a0
    e888:	01003833          	snez	a6,a6
    e88c:	0106e6b3          	or	a3,a3,a6
    e890:	00000593          	li	a1,0
    e894:	fb5ff06f          	j	e848 <__subdf3+0x20c>
    e898:	00a7e6b3          	or	a3,a5,a0
    e89c:	00d036b3          	snez	a3,a3
    e8a0:	ff1ff06f          	j	e890 <__subdf3+0x254>
    e8a4:	00190693          	addi	a3,s2,1
    e8a8:	7fe6f593          	andi	a1,a3,2046
    e8ac:	08059663          	bnez	a1,e938 <__subdf3+0x2fc>
    e8b0:	00a7e6b3          	or	a3,a5,a0
    e8b4:	06091263          	bnez	s2,e918 <__subdf3+0x2dc>
    e8b8:	44068863          	beqz	a3,ed08 <__subdf3+0x6cc>
    e8bc:	00c766b3          	or	a3,a4,a2
    e8c0:	02068863          	beqz	a3,e8f0 <__subdf3+0x2b4>
    e8c4:	00c50633          	add	a2,a0,a2
    e8c8:	00a636b3          	sltu	a3,a2,a0
    e8cc:	00e78733          	add	a4,a5,a4
    e8d0:	00d707b3          	add	a5,a4,a3
    e8d4:	00879713          	slli	a4,a5,0x8
    e8d8:	00060513          	mv	a0,a2
    e8dc:	00075a63          	bgez	a4,e8f0 <__subdf3+0x2b4>
    e8e0:	ff800737          	lui	a4,0xff800
    e8e4:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    e8e8:	00e7f7b3          	and	a5,a5,a4
    e8ec:	00100913          	li	s2,1
    e8f0:	00757713          	andi	a4,a0,7
    e8f4:	44070863          	beqz	a4,ed44 <__subdf3+0x708>
    e8f8:	00f57713          	andi	a4,a0,15
    e8fc:	00400693          	li	a3,4
    e900:	44d70263          	beq	a4,a3,ed44 <__subdf3+0x708>
    e904:	00450713          	addi	a4,a0,4
    e908:	00a736b3          	sltu	a3,a4,a0
    e90c:	00d787b3          	add	a5,a5,a3
    e910:	00070513          	mv	a0,a4
    e914:	4300006f          	j	ed44 <__subdf3+0x708>
    e918:	ec068ee3          	beqz	a3,e7f4 <__subdf3+0x1b8>
    e91c:	00c76633          	or	a2,a4,a2
    e920:	dc060ae3          	beqz	a2,e6f4 <__subdf3+0xb8>
    e924:	00000493          	li	s1,0
    e928:	004007b7          	lui	a5,0x400
    e92c:	00000513          	li	a0,0
    e930:	7ff00913          	li	s2,2047
    e934:	4100006f          	j	ed44 <__subdf3+0x708>
    e938:	7ff00593          	li	a1,2047
    e93c:	3cb68c63          	beq	a3,a1,ed14 <__subdf3+0x6d8>
    e940:	00c50633          	add	a2,a0,a2
    e944:	00a63533          	sltu	a0,a2,a0
    e948:	00e78733          	add	a4,a5,a4
    e94c:	00a70733          	add	a4,a4,a0
    e950:	01f71513          	slli	a0,a4,0x1f
    e954:	00165613          	srli	a2,a2,0x1
    e958:	00c56533          	or	a0,a0,a2
    e95c:	00175793          	srli	a5,a4,0x1
    e960:	00068913          	mv	s2,a3
    e964:	f8dff06f          	j	e8f0 <__subdf3+0x2b4>
    e968:	0f005c63          	blez	a6,ea60 <__subdf3+0x424>
    e96c:	08089e63          	bnez	a7,ea08 <__subdf3+0x3cc>
    e970:	00c766b3          	or	a3,a4,a2
    e974:	3a068863          	beqz	a3,ed24 <__subdf3+0x6e8>
    e978:	fff80693          	addi	a3,a6,-1
    e97c:	02069063          	bnez	a3,e99c <__subdf3+0x360>
    e980:	40c50633          	sub	a2,a0,a2
    e984:	00c536b3          	sltu	a3,a0,a2
    e988:	40e78733          	sub	a4,a5,a4
    e98c:	00060513          	mv	a0,a2
    e990:	40d707b3          	sub	a5,a4,a3
    e994:	00100913          	li	s2,1
    e998:	0540006f          	j	e9ec <__subdf3+0x3b0>
    e99c:	7ff00593          	li	a1,2047
    e9a0:	d4b80ae3          	beq	a6,a1,e6f4 <__subdf3+0xb8>
    e9a4:	03800593          	li	a1,56
    e9a8:	0ad5c663          	blt	a1,a3,ea54 <__subdf3+0x418>
    e9ac:	01f00593          	li	a1,31
    e9b0:	06d5c863          	blt	a1,a3,ea20 <__subdf3+0x3e4>
    e9b4:	02000813          	li	a6,32
    e9b8:	40d80833          	sub	a6,a6,a3
    e9bc:	00d658b3          	srl	a7,a2,a3
    e9c0:	010715b3          	sll	a1,a4,a6
    e9c4:	01061833          	sll	a6,a2,a6
    e9c8:	0115e5b3          	or	a1,a1,a7
    e9cc:	01003833          	snez	a6,a6
    e9d0:	0105e633          	or	a2,a1,a6
    e9d4:	00d756b3          	srl	a3,a4,a3
    e9d8:	40c50633          	sub	a2,a0,a2
    e9dc:	00c53733          	sltu	a4,a0,a2
    e9e0:	40d786b3          	sub	a3,a5,a3
    e9e4:	00060513          	mv	a0,a2
    e9e8:	40e687b3          	sub	a5,a3,a4
    e9ec:	00879713          	slli	a4,a5,0x8
    e9f0:	f00750e3          	bgez	a4,e8f0 <__subdf3+0x2b4>
    e9f4:	00800437          	lui	s0,0x800
    e9f8:	fff40413          	addi	s0,s0,-1 # 7fffff <_memory_end+0x7dffff>
    e9fc:	0087f433          	and	s0,a5,s0
    ea00:	00050993          	mv	s3,a0
    ea04:	2100006f          	j	ec14 <__subdf3+0x5d8>
    ea08:	7ff00693          	li	a3,2047
    ea0c:	eed902e3          	beq	s2,a3,e8f0 <__subdf3+0x2b4>
    ea10:	008006b7          	lui	a3,0x800
    ea14:	00d76733          	or	a4,a4,a3
    ea18:	00080693          	mv	a3,a6
    ea1c:	f89ff06f          	j	e9a4 <__subdf3+0x368>
    ea20:	fe068593          	addi	a1,a3,-32 # 7fffe0 <_memory_end+0x7dffe0>
    ea24:	02000893          	li	a7,32
    ea28:	00b755b3          	srl	a1,a4,a1
    ea2c:	00000813          	li	a6,0
    ea30:	01168863          	beq	a3,a7,ea40 <__subdf3+0x404>
    ea34:	04000813          	li	a6,64
    ea38:	40d80833          	sub	a6,a6,a3
    ea3c:	01071833          	sll	a6,a4,a6
    ea40:	00c86833          	or	a6,a6,a2
    ea44:	01003833          	snez	a6,a6
    ea48:	0105e633          	or	a2,a1,a6
    ea4c:	00000693          	li	a3,0
    ea50:	f89ff06f          	j	e9d8 <__subdf3+0x39c>
    ea54:	00c76633          	or	a2,a4,a2
    ea58:	00c03633          	snez	a2,a2
    ea5c:	ff1ff06f          	j	ea4c <__subdf3+0x410>
    ea60:	0e080863          	beqz	a6,eb50 <__subdf3+0x514>
    ea64:	41288833          	sub	a6,a7,s2
    ea68:	04091263          	bnez	s2,eaac <__subdf3+0x470>
    ea6c:	00a7e5b3          	or	a1,a5,a0
    ea70:	2a058e63          	beqz	a1,ed2c <__subdf3+0x6f0>
    ea74:	fff80593          	addi	a1,a6,-1
    ea78:	00059e63          	bnez	a1,ea94 <__subdf3+0x458>
    ea7c:	40a60533          	sub	a0,a2,a0
    ea80:	40f70733          	sub	a4,a4,a5
    ea84:	00a63633          	sltu	a2,a2,a0
    ea88:	40c707b3          	sub	a5,a4,a2
    ea8c:	00068493          	mv	s1,a3
    ea90:	f05ff06f          	j	e994 <__subdf3+0x358>
    ea94:	7ff00313          	li	t1,2047
    ea98:	02681463          	bne	a6,t1,eac0 <__subdf3+0x484>
    ea9c:	00070793          	mv	a5,a4
    eaa0:	00060513          	mv	a0,a2
    eaa4:	7ff00913          	li	s2,2047
    eaa8:	0d00006f          	j	eb78 <__subdf3+0x53c>
    eaac:	7ff00593          	li	a1,2047
    eab0:	feb886e3          	beq	a7,a1,ea9c <__subdf3+0x460>
    eab4:	008005b7          	lui	a1,0x800
    eab8:	00b7e7b3          	or	a5,a5,a1
    eabc:	00080593          	mv	a1,a6
    eac0:	03800813          	li	a6,56
    eac4:	08b84063          	blt	a6,a1,eb44 <__subdf3+0x508>
    eac8:	01f00813          	li	a6,31
    eacc:	04b84263          	blt	a6,a1,eb10 <__subdf3+0x4d4>
    ead0:	02000313          	li	t1,32
    ead4:	40b30333          	sub	t1,t1,a1
    ead8:	00b55e33          	srl	t3,a0,a1
    eadc:	00679833          	sll	a6,a5,t1
    eae0:	00651333          	sll	t1,a0,t1
    eae4:	01c86833          	or	a6,a6,t3
    eae8:	00603333          	snez	t1,t1
    eaec:	00686533          	or	a0,a6,t1
    eaf0:	00b7d5b3          	srl	a1,a5,a1
    eaf4:	40a60533          	sub	a0,a2,a0
    eaf8:	40b705b3          	sub	a1,a4,a1
    eafc:	00a63633          	sltu	a2,a2,a0
    eb00:	40c587b3          	sub	a5,a1,a2
    eb04:	00088913          	mv	s2,a7
    eb08:	00068493          	mv	s1,a3
    eb0c:	ee1ff06f          	j	e9ec <__subdf3+0x3b0>
    eb10:	fe058813          	addi	a6,a1,-32 # 7fffe0 <_memory_end+0x7dffe0>
    eb14:	02000e13          	li	t3,32
    eb18:	0107d833          	srl	a6,a5,a6
    eb1c:	00000313          	li	t1,0
    eb20:	01c58863          	beq	a1,t3,eb30 <__subdf3+0x4f4>
    eb24:	04000313          	li	t1,64
    eb28:	40b30333          	sub	t1,t1,a1
    eb2c:	00679333          	sll	t1,a5,t1
    eb30:	00a36333          	or	t1,t1,a0
    eb34:	00603333          	snez	t1,t1
    eb38:	00686533          	or	a0,a6,t1
    eb3c:	00000593          	li	a1,0
    eb40:	fb5ff06f          	j	eaf4 <__subdf3+0x4b8>
    eb44:	00a7e533          	or	a0,a5,a0
    eb48:	00a03533          	snez	a0,a0
    eb4c:	ff1ff06f          	j	eb3c <__subdf3+0x500>
    eb50:	00190593          	addi	a1,s2,1
    eb54:	7fe5f593          	andi	a1,a1,2046
    eb58:	08059663          	bnez	a1,ebe4 <__subdf3+0x5a8>
    eb5c:	00c765b3          	or	a1,a4,a2
    eb60:	00a7e833          	or	a6,a5,a0
    eb64:	06091063          	bnez	s2,ebc4 <__subdf3+0x588>
    eb68:	00081c63          	bnez	a6,eb80 <__subdf3+0x544>
    eb6c:	10058e63          	beqz	a1,ec88 <__subdf3+0x64c>
    eb70:	00070793          	mv	a5,a4
    eb74:	00060513          	mv	a0,a2
    eb78:	00068493          	mv	s1,a3
    eb7c:	d75ff06f          	j	e8f0 <__subdf3+0x2b4>
    eb80:	d60588e3          	beqz	a1,e8f0 <__subdf3+0x2b4>
    eb84:	40c50833          	sub	a6,a0,a2
    eb88:	010538b3          	sltu	a7,a0,a6
    eb8c:	40e785b3          	sub	a1,a5,a4
    eb90:	411585b3          	sub	a1,a1,a7
    eb94:	00859893          	slli	a7,a1,0x8
    eb98:	0008dc63          	bgez	a7,ebb0 <__subdf3+0x574>
    eb9c:	40a60533          	sub	a0,a2,a0
    eba0:	40f70733          	sub	a4,a4,a5
    eba4:	00a63633          	sltu	a2,a2,a0
    eba8:	40c707b3          	sub	a5,a4,a2
    ebac:	fcdff06f          	j	eb78 <__subdf3+0x53c>
    ebb0:	00b86533          	or	a0,a6,a1
    ebb4:	18050463          	beqz	a0,ed3c <__subdf3+0x700>
    ebb8:	00058793          	mv	a5,a1
    ebbc:	00080513          	mv	a0,a6
    ebc0:	d31ff06f          	j	e8f0 <__subdf3+0x2b4>
    ebc4:	00081c63          	bnez	a6,ebdc <__subdf3+0x5a0>
    ebc8:	d4058ee3          	beqz	a1,e924 <__subdf3+0x2e8>
    ebcc:	00070793          	mv	a5,a4
    ebd0:	00060513          	mv	a0,a2
    ebd4:	00068493          	mv	s1,a3
    ebd8:	b1dff06f          	j	e6f4 <__subdf3+0xb8>
    ebdc:	b0058ce3          	beqz	a1,e6f4 <__subdf3+0xb8>
    ebe0:	d45ff06f          	j	e924 <__subdf3+0x2e8>
    ebe4:	40c505b3          	sub	a1,a0,a2
    ebe8:	00b53833          	sltu	a6,a0,a1
    ebec:	40e78433          	sub	s0,a5,a4
    ebf0:	41040433          	sub	s0,s0,a6
    ebf4:	00841813          	slli	a6,s0,0x8
    ebf8:	00058993          	mv	s3,a1
    ebfc:	08085063          	bgez	a6,ec7c <__subdf3+0x640>
    ec00:	40a609b3          	sub	s3,a2,a0
    ec04:	40f70433          	sub	s0,a4,a5
    ec08:	01363633          	sltu	a2,a2,s3
    ec0c:	40c40433          	sub	s0,s0,a2
    ec10:	00068493          	mv	s1,a3
    ec14:	06040e63          	beqz	s0,ec90 <__subdf3+0x654>
    ec18:	00040513          	mv	a0,s0
    ec1c:	365030ef          	jal	12780 <__clzsi2>
    ec20:	ff850693          	addi	a3,a0,-8
    ec24:	02000793          	li	a5,32
    ec28:	40d787b3          	sub	a5,a5,a3
    ec2c:	00d41433          	sll	s0,s0,a3
    ec30:	00f9d7b3          	srl	a5,s3,a5
    ec34:	0087e7b3          	or	a5,a5,s0
    ec38:	00d99433          	sll	s0,s3,a3
    ec3c:	0b26c463          	blt	a3,s2,ece4 <__subdf3+0x6a8>
    ec40:	412686b3          	sub	a3,a3,s2
    ec44:	00168613          	addi	a2,a3,1
    ec48:	01f00713          	li	a4,31
    ec4c:	06c74263          	blt	a4,a2,ecb0 <__subdf3+0x674>
    ec50:	02000713          	li	a4,32
    ec54:	40c70733          	sub	a4,a4,a2
    ec58:	00e79533          	sll	a0,a5,a4
    ec5c:	00c456b3          	srl	a3,s0,a2
    ec60:	00e41733          	sll	a4,s0,a4
    ec64:	00d56533          	or	a0,a0,a3
    ec68:	00e03733          	snez	a4,a4
    ec6c:	00e56533          	or	a0,a0,a4
    ec70:	00c7d7b3          	srl	a5,a5,a2
    ec74:	00000913          	li	s2,0
    ec78:	c79ff06f          	j	e8f0 <__subdf3+0x2b4>
    ec7c:	0085e5b3          	or	a1,a1,s0
    ec80:	f8059ae3          	bnez	a1,ec14 <__subdf3+0x5d8>
    ec84:	00000913          	li	s2,0
    ec88:	00000493          	li	s1,0
    ec8c:	08c0006f          	j	ed18 <__subdf3+0x6dc>
    ec90:	00098513          	mv	a0,s3
    ec94:	2ed030ef          	jal	12780 <__clzsi2>
    ec98:	01850693          	addi	a3,a0,24
    ec9c:	01f00793          	li	a5,31
    eca0:	f8d7d2e3          	bge	a5,a3,ec24 <__subdf3+0x5e8>
    eca4:	ff850793          	addi	a5,a0,-8
    eca8:	00f997b3          	sll	a5,s3,a5
    ecac:	f91ff06f          	j	ec3c <__subdf3+0x600>
    ecb0:	fe168693          	addi	a3,a3,-31
    ecb4:	00d7d533          	srl	a0,a5,a3
    ecb8:	02000693          	li	a3,32
    ecbc:	00000713          	li	a4,0
    ecc0:	00d60863          	beq	a2,a3,ecd0 <__subdf3+0x694>
    ecc4:	04000713          	li	a4,64
    ecc8:	40c70733          	sub	a4,a4,a2
    eccc:	00e79733          	sll	a4,a5,a4
    ecd0:	00e46733          	or	a4,s0,a4
    ecd4:	00e03733          	snez	a4,a4
    ecd8:	00e56533          	or	a0,a0,a4
    ecdc:	00000793          	li	a5,0
    ece0:	f95ff06f          	j	ec74 <__subdf3+0x638>
    ece4:	ff800737          	lui	a4,0xff800
    ece8:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    ecec:	40d90933          	sub	s2,s2,a3
    ecf0:	00e7f7b3          	and	a5,a5,a4
    ecf4:	00040513          	mv	a0,s0
    ecf8:	bf9ff06f          	j	e8f0 <__subdf3+0x2b4>
    ecfc:	00070793          	mv	a5,a4
    ed00:	00060513          	mv	a0,a2
    ed04:	c5dff06f          	j	e960 <__subdf3+0x324>
    ed08:	00070793          	mv	a5,a4
    ed0c:	00060513          	mv	a0,a2
    ed10:	be1ff06f          	j	e8f0 <__subdf3+0x2b4>
    ed14:	7ff00913          	li	s2,2047
    ed18:	00000793          	li	a5,0
    ed1c:	00000513          	li	a0,0
    ed20:	0240006f          	j	ed44 <__subdf3+0x708>
    ed24:	00080913          	mv	s2,a6
    ed28:	bc9ff06f          	j	e8f0 <__subdf3+0x2b4>
    ed2c:	00070793          	mv	a5,a4
    ed30:	00060513          	mv	a0,a2
    ed34:	00080913          	mv	s2,a6
    ed38:	e41ff06f          	j	eb78 <__subdf3+0x53c>
    ed3c:	00000793          	li	a5,0
    ed40:	00000493          	li	s1,0
    ed44:	00879713          	slli	a4,a5,0x8
    ed48:	00075e63          	bgez	a4,ed64 <__subdf3+0x728>
    ed4c:	00190913          	addi	s2,s2,1
    ed50:	7ff00713          	li	a4,2047
    ed54:	08e90263          	beq	s2,a4,edd8 <__subdf3+0x79c>
    ed58:	ff800737          	lui	a4,0xff800
    ed5c:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    ed60:	00e7f7b3          	and	a5,a5,a4
    ed64:	01d79693          	slli	a3,a5,0x1d
    ed68:	00355513          	srli	a0,a0,0x3
    ed6c:	7ff00713          	li	a4,2047
    ed70:	00a6e6b3          	or	a3,a3,a0
    ed74:	0037d793          	srli	a5,a5,0x3
    ed78:	00e91e63          	bne	s2,a4,ed94 <__subdf3+0x758>
    ed7c:	00f6e6b3          	or	a3,a3,a5
    ed80:	00000793          	li	a5,0
    ed84:	00068863          	beqz	a3,ed94 <__subdf3+0x758>
    ed88:	000807b7          	lui	a5,0x80
    ed8c:	00000693          	li	a3,0
    ed90:	00000493          	li	s1,0
    ed94:	01491713          	slli	a4,s2,0x14
    ed98:	7ff00637          	lui	a2,0x7ff00
    ed9c:	00c79793          	slli	a5,a5,0xc
    eda0:	00c77733          	and	a4,a4,a2
    eda4:	01c12083          	lw	ra,28(sp)
    eda8:	01812403          	lw	s0,24(sp)
    edac:	00c7d793          	srli	a5,a5,0xc
    edb0:	00f767b3          	or	a5,a4,a5
    edb4:	01f49713          	slli	a4,s1,0x1f
    edb8:	00e7e633          	or	a2,a5,a4
    edbc:	01412483          	lw	s1,20(sp)
    edc0:	01012903          	lw	s2,16(sp)
    edc4:	00c12983          	lw	s3,12(sp)
    edc8:	00068513          	mv	a0,a3
    edcc:	00060593          	mv	a1,a2
    edd0:	02010113          	addi	sp,sp,32
    edd4:	00008067          	ret
    edd8:	00000793          	li	a5,0
    eddc:	00000513          	li	a0,0
    ede0:	f85ff06f          	j	ed64 <__subdf3+0x728>

0000ede4 <__fixdfsi>:
    ede4:	0145d713          	srli	a4,a1,0x14
    ede8:	001006b7          	lui	a3,0x100
    edec:	fff68793          	addi	a5,a3,-1 # fffff <_memory_end+0xdffff>
    edf0:	7ff77713          	andi	a4,a4,2047
    edf4:	3fe00613          	li	a2,1022
    edf8:	00b7f7b3          	and	a5,a5,a1
    edfc:	01f5d593          	srli	a1,a1,0x1f
    ee00:	04e65e63          	bge	a2,a4,ee5c <__fixdfsi+0x78>
    ee04:	41d00613          	li	a2,1053
    ee08:	00e65a63          	bge	a2,a4,ee1c <__fixdfsi+0x38>
    ee0c:	80000537          	lui	a0,0x80000
    ee10:	fff50513          	addi	a0,a0,-1 # 7fffffff <_memory_end+0x7ffdffff>
    ee14:	00a58533          	add	a0,a1,a0
    ee18:	00008067          	ret
    ee1c:	00d7e7b3          	or	a5,a5,a3
    ee20:	43300693          	li	a3,1075
    ee24:	40e686b3          	sub	a3,a3,a4
    ee28:	01f00613          	li	a2,31
    ee2c:	02d64063          	blt	a2,a3,ee4c <__fixdfsi+0x68>
    ee30:	bed70713          	addi	a4,a4,-1043
    ee34:	00e797b3          	sll	a5,a5,a4
    ee38:	00d55533          	srl	a0,a0,a3
    ee3c:	00a7e533          	or	a0,a5,a0
    ee40:	02058063          	beqz	a1,ee60 <__fixdfsi+0x7c>
    ee44:	40a00533          	neg	a0,a0
    ee48:	00008067          	ret
    ee4c:	41300693          	li	a3,1043
    ee50:	40e68733          	sub	a4,a3,a4
    ee54:	00e7d533          	srl	a0,a5,a4
    ee58:	fe9ff06f          	j	ee40 <__fixdfsi+0x5c>
    ee5c:	00000513          	li	a0,0
    ee60:	00008067          	ret

0000ee64 <__floatsidf>:
    ee64:	ff010113          	addi	sp,sp,-16
    ee68:	00112623          	sw	ra,12(sp)
    ee6c:	00812423          	sw	s0,8(sp)
    ee70:	00912223          	sw	s1,4(sp)
    ee74:	08050663          	beqz	a0,ef00 <__floatsidf+0x9c>
    ee78:	41f55793          	srai	a5,a0,0x1f
    ee7c:	00a7c433          	xor	s0,a5,a0
    ee80:	40f40433          	sub	s0,s0,a5
    ee84:	01f55493          	srli	s1,a0,0x1f
    ee88:	00040513          	mv	a0,s0
    ee8c:	0f5030ef          	jal	12780 <__clzsi2>
    ee90:	41e00713          	li	a4,1054
    ee94:	00a00793          	li	a5,10
    ee98:	40a70733          	sub	a4,a4,a0
    ee9c:	04a7c863          	blt	a5,a0,eeec <__floatsidf+0x88>
    eea0:	00b00793          	li	a5,11
    eea4:	40a787b3          	sub	a5,a5,a0
    eea8:	01550513          	addi	a0,a0,21
    eeac:	00f457b3          	srl	a5,s0,a5
    eeb0:	00a41433          	sll	s0,s0,a0
    eeb4:	00048513          	mv	a0,s1
    eeb8:	00c79793          	slli	a5,a5,0xc
    eebc:	00c7d793          	srli	a5,a5,0xc
    eec0:	01471713          	slli	a4,a4,0x14
    eec4:	01f51513          	slli	a0,a0,0x1f
    eec8:	00f76733          	or	a4,a4,a5
    eecc:	00c12083          	lw	ra,12(sp)
    eed0:	00a767b3          	or	a5,a4,a0
    eed4:	00040513          	mv	a0,s0
    eed8:	00812403          	lw	s0,8(sp)
    eedc:	00412483          	lw	s1,4(sp)
    eee0:	00078593          	mv	a1,a5
    eee4:	01010113          	addi	sp,sp,16
    eee8:	00008067          	ret
    eeec:	ff550513          	addi	a0,a0,-11
    eef0:	00a417b3          	sll	a5,s0,a0
    eef4:	00048513          	mv	a0,s1
    eef8:	00000413          	li	s0,0
    eefc:	fbdff06f          	j	eeb8 <__floatsidf+0x54>
    ef00:	00000713          	li	a4,0
    ef04:	00000793          	li	a5,0
    ef08:	ff1ff06f          	j	eef8 <__floatsidf+0x94>

0000ef0c <__floatunsidf>:
    ef0c:	ff010113          	addi	sp,sp,-16
    ef10:	00812423          	sw	s0,8(sp)
    ef14:	00112623          	sw	ra,12(sp)
    ef18:	00050413          	mv	s0,a0
    ef1c:	06050263          	beqz	a0,ef80 <__floatunsidf+0x74>
    ef20:	061030ef          	jal	12780 <__clzsi2>
    ef24:	41e00713          	li	a4,1054
    ef28:	00a00793          	li	a5,10
    ef2c:	40a70733          	sub	a4,a4,a0
    ef30:	04a7c063          	blt	a5,a0,ef70 <__floatunsidf+0x64>
    ef34:	00b00793          	li	a5,11
    ef38:	40a787b3          	sub	a5,a5,a0
    ef3c:	01550513          	addi	a0,a0,21
    ef40:	00f457b3          	srl	a5,s0,a5
    ef44:	00a41433          	sll	s0,s0,a0
    ef48:	00c12083          	lw	ra,12(sp)
    ef4c:	00040513          	mv	a0,s0
    ef50:	00c79793          	slli	a5,a5,0xc
    ef54:	00812403          	lw	s0,8(sp)
    ef58:	01471713          	slli	a4,a4,0x14
    ef5c:	00c7d793          	srli	a5,a5,0xc
    ef60:	00f766b3          	or	a3,a4,a5
    ef64:	00068593          	mv	a1,a3
    ef68:	01010113          	addi	sp,sp,16
    ef6c:	00008067          	ret
    ef70:	ff550513          	addi	a0,a0,-11
    ef74:	00a417b3          	sll	a5,s0,a0
    ef78:	00000413          	li	s0,0
    ef7c:	fcdff06f          	j	ef48 <__floatunsidf+0x3c>
    ef80:	00000793          	li	a5,0
    ef84:	00000713          	li	a4,0
    ef88:	fc1ff06f          	j	ef48 <__floatunsidf+0x3c>

0000ef8c <__eqtf2>:
    ef8c:	00c52783          	lw	a5,12(a0)
    ef90:	0005af03          	lw	t5,0(a1)
    ef94:	0045af83          	lw	t6,4(a1)
    ef98:	0085a283          	lw	t0,8(a1)
    ef9c:	00c5a583          	lw	a1,12(a1)
    efa0:	00008737          	lui	a4,0x8
    efa4:	0107d693          	srli	a3,a5,0x10
    efa8:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x11a3>
    efac:	01079813          	slli	a6,a5,0x10
    efb0:	01059e93          	slli	t4,a1,0x10
    efb4:	01f7d613          	srli	a2,a5,0x1f
    efb8:	00e6f6b3          	and	a3,a3,a4
    efbc:	0105d793          	srli	a5,a1,0x10
    efc0:	00052883          	lw	a7,0(a0)
    efc4:	00452303          	lw	t1,4(a0)
    efc8:	00852e03          	lw	t3,8(a0)
    efcc:	ff010113          	addi	sp,sp,-16
    efd0:	01085813          	srli	a6,a6,0x10
    efd4:	010ede93          	srli	t4,t4,0x10
    efd8:	00e7f7b3          	and	a5,a5,a4
    efdc:	01f5d593          	srli	a1,a1,0x1f
    efe0:	02e69063          	bne	a3,a4,f000 <__eqtf2+0x74>
    efe4:	0068e733          	or	a4,a7,t1
    efe8:	01c76733          	or	a4,a4,t3
    efec:	01076733          	or	a4,a4,a6
    eff0:	00100513          	li	a0,1
    eff4:	04071a63          	bnez	a4,f048 <__eqtf2+0xbc>
    eff8:	04d79863          	bne	a5,a3,f048 <__eqtf2+0xbc>
    effc:	0080006f          	j	f004 <__eqtf2+0x78>
    f000:	00e79c63          	bne	a5,a4,f018 <__eqtf2+0x8c>
    f004:	01ff6733          	or	a4,t5,t6
    f008:	00576733          	or	a4,a4,t0
    f00c:	01d76733          	or	a4,a4,t4
    f010:	00100513          	li	a0,1
    f014:	02071a63          	bnez	a4,f048 <__eqtf2+0xbc>
    f018:	00100513          	li	a0,1
    f01c:	02d79663          	bne	a5,a3,f048 <__eqtf2+0xbc>
    f020:	03e89463          	bne	a7,t5,f048 <__eqtf2+0xbc>
    f024:	03f31263          	bne	t1,t6,f048 <__eqtf2+0xbc>
    f028:	025e1063          	bne	t3,t0,f048 <__eqtf2+0xbc>
    f02c:	01d81e63          	bne	a6,t4,f048 <__eqtf2+0xbc>
    f030:	02b60063          	beq	a2,a1,f050 <__eqtf2+0xc4>
    f034:	00079a63          	bnez	a5,f048 <__eqtf2+0xbc>
    f038:	0068e533          	or	a0,a7,t1
    f03c:	01c56533          	or	a0,a0,t3
    f040:	01056533          	or	a0,a0,a6
    f044:	00a03533          	snez	a0,a0
    f048:	01010113          	addi	sp,sp,16
    f04c:	00008067          	ret
    f050:	00000513          	li	a0,0
    f054:	ff5ff06f          	j	f048 <__eqtf2+0xbc>

0000f058 <__getf2>:
    f058:	00c52783          	lw	a5,12(a0)
    f05c:	00c5a683          	lw	a3,12(a1)
    f060:	00008737          	lui	a4,0x8
    f064:	0107d613          	srli	a2,a5,0x10
    f068:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x11a3>
    f06c:	01079813          	slli	a6,a5,0x10
    f070:	01069293          	slli	t0,a3,0x10
    f074:	00052883          	lw	a7,0(a0)
    f078:	00452303          	lw	t1,4(a0)
    f07c:	00852e03          	lw	t3,8(a0)
    f080:	00e67633          	and	a2,a2,a4
    f084:	0106d513          	srli	a0,a3,0x10
    f088:	0005ae83          	lw	t4,0(a1)
    f08c:	0045af03          	lw	t5,4(a1)
    f090:	0085af83          	lw	t6,8(a1)
    f094:	ff010113          	addi	sp,sp,-16
    f098:	01085813          	srli	a6,a6,0x10
    f09c:	01f7d793          	srli	a5,a5,0x1f
    f0a0:	0102d293          	srli	t0,t0,0x10
    f0a4:	00e57533          	and	a0,a0,a4
    f0a8:	01f6d693          	srli	a3,a3,0x1f
    f0ac:	00e61a63          	bne	a2,a4,f0c0 <__getf2+0x68>
    f0b0:	01136733          	or	a4,t1,a7
    f0b4:	01c76733          	or	a4,a4,t3
    f0b8:	01076733          	or	a4,a4,a6
    f0bc:	0a071463          	bnez	a4,f164 <__getf2+0x10c>
    f0c0:	00008737          	lui	a4,0x8
    f0c4:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x11a3>
    f0c8:	00e51a63          	bne	a0,a4,f0dc <__getf2+0x84>
    f0cc:	01eee733          	or	a4,t4,t5
    f0d0:	01f76733          	or	a4,a4,t6
    f0d4:	00576733          	or	a4,a4,t0
    f0d8:	08071663          	bnez	a4,f164 <__getf2+0x10c>
    f0dc:	00000713          	li	a4,0
    f0e0:	00061a63          	bnez	a2,f0f4 <__getf2+0x9c>
    f0e4:	01136733          	or	a4,t1,a7
    f0e8:	01c76733          	or	a4,a4,t3
    f0ec:	01076733          	or	a4,a4,a6
    f0f0:	00173713          	seqz	a4,a4
    f0f4:	06051c63          	bnez	a0,f16c <__getf2+0x114>
    f0f8:	01eee5b3          	or	a1,t4,t5
    f0fc:	01f5e5b3          	or	a1,a1,t6
    f100:	0055e5b3          	or	a1,a1,t0
    f104:	00070c63          	beqz	a4,f11c <__getf2+0xc4>
    f108:	02058063          	beqz	a1,f128 <__getf2+0xd0>
    f10c:	00100513          	li	a0,1
    f110:	00069c63          	bnez	a3,f128 <__getf2+0xd0>
    f114:	fff00513          	li	a0,-1
    f118:	0100006f          	j	f128 <__getf2+0xd0>
    f11c:	04059a63          	bnez	a1,f170 <__getf2+0x118>
    f120:	fff00513          	li	a0,-1
    f124:	04078e63          	beqz	a5,f180 <__getf2+0x128>
    f128:	01010113          	addi	sp,sp,16
    f12c:	00008067          	ret
    f130:	fca64ee3          	blt	a2,a0,f10c <__getf2+0xb4>
    f134:	ff02e6e3          	bltu	t0,a6,f120 <__getf2+0xc8>
    f138:	02581063          	bne	a6,t0,f158 <__getf2+0x100>
    f13c:	ffcfe2e3          	bltu	t6,t3,f120 <__getf2+0xc8>
    f140:	01fe1c63          	bne	t3,t6,f158 <__getf2+0x100>
    f144:	fc6f6ee3          	bltu	t5,t1,f120 <__getf2+0xc8>
    f148:	01e31863          	bne	t1,t5,f158 <__getf2+0x100>
    f14c:	fd1eeae3          	bltu	t4,a7,f120 <__getf2+0xc8>
    f150:	00000513          	li	a0,0
    f154:	fdd8fae3          	bgeu	a7,t4,f128 <__getf2+0xd0>
    f158:	00100513          	li	a0,1
    f15c:	fc0796e3          	bnez	a5,f128 <__getf2+0xd0>
    f160:	fb5ff06f          	j	f114 <__getf2+0xbc>
    f164:	ffe00513          	li	a0,-2
    f168:	fc1ff06f          	j	f128 <__getf2+0xd0>
    f16c:	fa0710e3          	bnez	a4,f10c <__getf2+0xb4>
    f170:	faf698e3          	bne	a3,a5,f120 <__getf2+0xc8>
    f174:	fac55ee3          	bge	a0,a2,f130 <__getf2+0xd8>
    f178:	fff00513          	li	a0,-1
    f17c:	fa0696e3          	bnez	a3,f128 <__getf2+0xd0>
    f180:	00100513          	li	a0,1
    f184:	fa5ff06f          	j	f128 <__getf2+0xd0>

0000f188 <__letf2>:
    f188:	00c52783          	lw	a5,12(a0)
    f18c:	00c5a683          	lw	a3,12(a1)
    f190:	00008737          	lui	a4,0x8
    f194:	0107d613          	srli	a2,a5,0x10
    f198:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x11a3>
    f19c:	01079813          	slli	a6,a5,0x10
    f1a0:	01069293          	slli	t0,a3,0x10
    f1a4:	00052883          	lw	a7,0(a0)
    f1a8:	00452303          	lw	t1,4(a0)
    f1ac:	00852e03          	lw	t3,8(a0)
    f1b0:	00e67633          	and	a2,a2,a4
    f1b4:	0106d513          	srli	a0,a3,0x10
    f1b8:	0005ae83          	lw	t4,0(a1)
    f1bc:	0045af03          	lw	t5,4(a1)
    f1c0:	0085af83          	lw	t6,8(a1)
    f1c4:	ff010113          	addi	sp,sp,-16
    f1c8:	01085813          	srli	a6,a6,0x10
    f1cc:	01f7d793          	srli	a5,a5,0x1f
    f1d0:	0102d293          	srli	t0,t0,0x10
    f1d4:	00e57533          	and	a0,a0,a4
    f1d8:	01f6d693          	srli	a3,a3,0x1f
    f1dc:	00e61a63          	bne	a2,a4,f1f0 <__letf2+0x68>
    f1e0:	01136733          	or	a4,t1,a7
    f1e4:	01c76733          	or	a4,a4,t3
    f1e8:	01076733          	or	a4,a4,a6
    f1ec:	0a071463          	bnez	a4,f294 <__letf2+0x10c>
    f1f0:	00008737          	lui	a4,0x8
    f1f4:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x11a3>
    f1f8:	00e51a63          	bne	a0,a4,f20c <__letf2+0x84>
    f1fc:	01eee733          	or	a4,t4,t5
    f200:	01f76733          	or	a4,a4,t6
    f204:	00576733          	or	a4,a4,t0
    f208:	08071663          	bnez	a4,f294 <__letf2+0x10c>
    f20c:	00000713          	li	a4,0
    f210:	00061a63          	bnez	a2,f224 <__letf2+0x9c>
    f214:	01136733          	or	a4,t1,a7
    f218:	01c76733          	or	a4,a4,t3
    f21c:	01076733          	or	a4,a4,a6
    f220:	00173713          	seqz	a4,a4
    f224:	06051c63          	bnez	a0,f29c <__letf2+0x114>
    f228:	01eee5b3          	or	a1,t4,t5
    f22c:	01f5e5b3          	or	a1,a1,t6
    f230:	0055e5b3          	or	a1,a1,t0
    f234:	00070c63          	beqz	a4,f24c <__letf2+0xc4>
    f238:	02058063          	beqz	a1,f258 <__letf2+0xd0>
    f23c:	00100513          	li	a0,1
    f240:	00069c63          	bnez	a3,f258 <__letf2+0xd0>
    f244:	fff00513          	li	a0,-1
    f248:	0100006f          	j	f258 <__letf2+0xd0>
    f24c:	04059a63          	bnez	a1,f2a0 <__letf2+0x118>
    f250:	fff00513          	li	a0,-1
    f254:	04078e63          	beqz	a5,f2b0 <__letf2+0x128>
    f258:	01010113          	addi	sp,sp,16
    f25c:	00008067          	ret
    f260:	fca64ee3          	blt	a2,a0,f23c <__letf2+0xb4>
    f264:	ff02e6e3          	bltu	t0,a6,f250 <__letf2+0xc8>
    f268:	02581063          	bne	a6,t0,f288 <__letf2+0x100>
    f26c:	ffcfe2e3          	bltu	t6,t3,f250 <__letf2+0xc8>
    f270:	01fe1c63          	bne	t3,t6,f288 <__letf2+0x100>
    f274:	fc6f6ee3          	bltu	t5,t1,f250 <__letf2+0xc8>
    f278:	01e31863          	bne	t1,t5,f288 <__letf2+0x100>
    f27c:	fd1eeae3          	bltu	t4,a7,f250 <__letf2+0xc8>
    f280:	00000513          	li	a0,0
    f284:	fdd8fae3          	bgeu	a7,t4,f258 <__letf2+0xd0>
    f288:	00100513          	li	a0,1
    f28c:	fc0796e3          	bnez	a5,f258 <__letf2+0xd0>
    f290:	fb5ff06f          	j	f244 <__letf2+0xbc>
    f294:	00200513          	li	a0,2
    f298:	fc1ff06f          	j	f258 <__letf2+0xd0>
    f29c:	fa0710e3          	bnez	a4,f23c <__letf2+0xb4>
    f2a0:	faf698e3          	bne	a3,a5,f250 <__letf2+0xc8>
    f2a4:	fac55ee3          	bge	a0,a2,f260 <__letf2+0xd8>
    f2a8:	fff00513          	li	a0,-1
    f2ac:	fa0696e3          	bnez	a3,f258 <__letf2+0xd0>
    f2b0:	00100513          	li	a0,1
    f2b4:	fa5ff06f          	j	f258 <__letf2+0xd0>

0000f2b8 <__multf3>:
    f2b8:	f5010113          	addi	sp,sp,-176
    f2bc:	09412c23          	sw	s4,152(sp)
    f2c0:	00c5aa03          	lw	s4,12(a1)
    f2c4:	0005a783          	lw	a5,0(a1)
    f2c8:	0085a683          	lw	a3,8(a1)
    f2cc:	0a812423          	sw	s0,168(sp)
    f2d0:	00050413          	mv	s0,a0
    f2d4:	0045a503          	lw	a0,4(a1)
    f2d8:	010a1713          	slli	a4,s4,0x10
    f2dc:	0b212023          	sw	s2,160(sp)
    f2e0:	09312e23          	sw	s3,156(sp)
    f2e4:	00062903          	lw	s2,0(a2) # 7ff00000 <_memory_end+0x7fee0000>
    f2e8:	00c62983          	lw	s3,12(a2)
    f2ec:	09512a23          	sw	s5,148(sp)
    f2f0:	09612823          	sw	s6,144(sp)
    f2f4:	00862a83          	lw	s5,8(a2)
    f2f8:	00462b03          	lw	s6,4(a2)
    f2fc:	00008637          	lui	a2,0x8
    f300:	0a912223          	sw	s1,164(sp)
    f304:	01075713          	srli	a4,a4,0x10
    f308:	010a5493          	srli	s1,s4,0x10
    f30c:	fff60613          	addi	a2,a2,-1 # 7fff <__gdtoa+0x11a3>
    f310:	05412e23          	sw	s4,92(sp)
    f314:	0a112623          	sw	ra,172(sp)
    f318:	09712623          	sw	s7,140(sp)
    f31c:	09812423          	sw	s8,136(sp)
    f320:	09912223          	sw	s9,132(sp)
    f324:	09a12023          	sw	s10,128(sp)
    f328:	07b12e23          	sw	s11,124(sp)
    f32c:	04f12823          	sw	a5,80(sp)
    f330:	04a12a23          	sw	a0,84(sp)
    f334:	04d12c23          	sw	a3,88(sp)
    f338:	02f12023          	sw	a5,32(sp)
    f33c:	02a12223          	sw	a0,36(sp)
    f340:	02d12423          	sw	a3,40(sp)
    f344:	02e12623          	sw	a4,44(sp)
    f348:	00c4f4b3          	and	s1,s1,a2
    f34c:	01fa5a13          	srli	s4,s4,0x1f
    f350:	080482e3          	beqz	s1,fbd4 <__multf3+0x91c>
    f354:	1ac48ce3          	beq	s1,a2,fd0c <__multf3+0xa54>
    f358:	000106b7          	lui	a3,0x10
    f35c:	00d76733          	or	a4,a4,a3
    f360:	02e12623          	sw	a4,44(sp)
    f364:	02010593          	addi	a1,sp,32
    f368:	02c10713          	addi	a4,sp,44
    f36c:	00072683          	lw	a3,0(a4)
    f370:	ffc72603          	lw	a2,-4(a4)
    f374:	ffc70713          	addi	a4,a4,-4
    f378:	00369693          	slli	a3,a3,0x3
    f37c:	01d65613          	srli	a2,a2,0x1d
    f380:	00c6e6b3          	or	a3,a3,a2
    f384:	00d72223          	sw	a3,4(a4)
    f388:	fee592e3          	bne	a1,a4,f36c <__multf3+0xb4>
    f38c:	00379793          	slli	a5,a5,0x3
    f390:	02f12023          	sw	a5,32(sp)
    f394:	ffffc7b7          	lui	a5,0xffffc
    f398:	00178793          	addi	a5,a5,1 # ffffc001 <_memory_end+0xfffdc001>
    f39c:	00f484b3          	add	s1,s1,a5
    f3a0:	00000b93          	li	s7,0
    f3a4:	01099513          	slli	a0,s3,0x10
    f3a8:	00008737          	lui	a4,0x8
    f3ac:	0109d793          	srli	a5,s3,0x10
    f3b0:	01055513          	srli	a0,a0,0x10
    f3b4:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x11a3>
    f3b8:	05312e23          	sw	s3,92(sp)
    f3bc:	05212823          	sw	s2,80(sp)
    f3c0:	05612a23          	sw	s6,84(sp)
    f3c4:	05512c23          	sw	s5,88(sp)
    f3c8:	03212823          	sw	s2,48(sp)
    f3cc:	03612a23          	sw	s6,52(sp)
    f3d0:	03512c23          	sw	s5,56(sp)
    f3d4:	02a12e23          	sw	a0,60(sp)
    f3d8:	00e7f7b3          	and	a5,a5,a4
    f3dc:	01f9d993          	srli	s3,s3,0x1f
    f3e0:	14078ae3          	beqz	a5,fd34 <__multf3+0xa7c>
    f3e4:	28e784e3          	beq	a5,a4,fe6c <__multf3+0xbb4>
    f3e8:	00010737          	lui	a4,0x10
    f3ec:	00e56533          	or	a0,a0,a4
    f3f0:	02a12e23          	sw	a0,60(sp)
    f3f4:	03010593          	addi	a1,sp,48
    f3f8:	03c10713          	addi	a4,sp,60
    f3fc:	00072683          	lw	a3,0(a4) # 10000 <__multf3+0xd48>
    f400:	ffc72603          	lw	a2,-4(a4)
    f404:	ffc70713          	addi	a4,a4,-4
    f408:	00369693          	slli	a3,a3,0x3
    f40c:	01d65613          	srli	a2,a2,0x1d
    f410:	00c6e6b3          	or	a3,a3,a2
    f414:	00d72223          	sw	a3,4(a4)
    f418:	fee592e3          	bne	a1,a4,f3fc <__multf3+0x144>
    f41c:	ffffc737          	lui	a4,0xffffc
    f420:	00391913          	slli	s2,s2,0x3
    f424:	00170713          	addi	a4,a4,1 # ffffc001 <_memory_end+0xfffdc001>
    f428:	03212823          	sw	s2,48(sp)
    f42c:	00e787b3          	add	a5,a5,a4
    f430:	00000693          	li	a3,0
    f434:	009787b3          	add	a5,a5,s1
    f438:	00f12623          	sw	a5,12(sp)
    f43c:	00178793          	addi	a5,a5,1
    f440:	00f12423          	sw	a5,8(sp)
    f444:	002b9793          	slli	a5,s7,0x2
    f448:	00d7e7b3          	or	a5,a5,a3
    f44c:	00a00713          	li	a4,10
    f450:	28f742e3          	blt	a4,a5,fed4 <__multf3+0xc1c>
    f454:	013a4733          	xor	a4,s4,s3
    f458:	00e12223          	sw	a4,4(sp)
    f45c:	00200713          	li	a4,2
    f460:	22f74ae3          	blt	a4,a5,fe94 <__multf3+0xbdc>
    f464:	fff78793          	addi	a5,a5,-1
    f468:	00100713          	li	a4,1
    f46c:	28f770e3          	bgeu	a4,a5,feec <__multf3+0xc34>
    f470:	02012883          	lw	a7,32(sp)
    f474:	03012f03          	lw	t5,48(sp)
    f478:	000105b7          	lui	a1,0x10
    f47c:	fff58713          	addi	a4,a1,-1 # ffff <__multf3+0xd47>
    f480:	0108d913          	srli	s2,a7,0x10
    f484:	010f5493          	srli	s1,t5,0x10
    f488:	00e8f8b3          	and	a7,a7,a4
    f48c:	00ef7f33          	and	t5,t5,a4
    f490:	031f0633          	mul	a2,t5,a7
    f494:	03e90533          	mul	a0,s2,t5
    f498:	01065793          	srli	a5,a2,0x10
    f49c:	031486b3          	mul	a3,s1,a7
    f4a0:	00a686b3          	add	a3,a3,a0
    f4a4:	00d787b3          	add	a5,a5,a3
    f4a8:	02990bb3          	mul	s7,s2,s1
    f4ac:	00a7f463          	bgeu	a5,a0,f4b4 <__multf3+0x1fc>
    f4b0:	00bb8bb3          	add	s7,s7,a1
    f4b4:	03412e83          	lw	t4,52(sp)
    f4b8:	0107d693          	srli	a3,a5,0x10
    f4bc:	00e7f7b3          	and	a5,a5,a4
    f4c0:	00e67633          	and	a2,a2,a4
    f4c4:	01079793          	slli	a5,a5,0x10
    f4c8:	00c787b3          	add	a5,a5,a2
    f4cc:	010ed293          	srli	t0,t4,0x10
    f4d0:	00eefeb3          	and	t4,t4,a4
    f4d4:	03d90633          	mul	a2,s2,t4
    f4d8:	00f12823          	sw	a5,16(sp)
    f4dc:	04f12823          	sw	a5,80(sp)
    f4e0:	03128733          	mul	a4,t0,a7
    f4e4:	031e87b3          	mul	a5,t4,a7
    f4e8:	00c70733          	add	a4,a4,a2
    f4ec:	0107d313          	srli	t1,a5,0x10
    f4f0:	00e30333          	add	t1,t1,a4
    f4f4:	02590b33          	mul	s6,s2,t0
    f4f8:	00c37663          	bgeu	t1,a2,f504 <__multf3+0x24c>
    f4fc:	00010737          	lui	a4,0x10
    f500:	00eb0b33          	add	s6,s6,a4
    f504:	02412803          	lw	a6,36(sp)
    f508:	00010737          	lui	a4,0x10
    f50c:	fff70613          	addi	a2,a4,-1 # ffff <__multf3+0xd47>
    f510:	01035513          	srli	a0,t1,0x10
    f514:	00c37333          	and	t1,t1,a2
    f518:	00c7f7b3          	and	a5,a5,a2
    f51c:	01085393          	srli	t2,a6,0x10
    f520:	01031313          	slli	t1,t1,0x10
    f524:	00c87833          	and	a6,a6,a2
    f528:	00f30333          	add	t1,t1,a5
    f52c:	03e38fb3          	mul	t6,t2,t5
    f530:	006686b3          	add	a3,a3,t1
    f534:	03e807b3          	mul	a5,a6,t5
    f538:	03048e33          	mul	t3,s1,a6
    f53c:	0107d613          	srli	a2,a5,0x10
    f540:	01fe0e33          	add	t3,t3,t6
    f544:	01c60633          	add	a2,a2,t3
    f548:	027485b3          	mul	a1,s1,t2
    f54c:	01f67463          	bgeu	a2,t6,f554 <__multf3+0x29c>
    f550:	00e585b3          	add	a1,a1,a4
    f554:	01065a93          	srli	s5,a2,0x10
    f558:	00010737          	lui	a4,0x10
    f55c:	00ba8ab3          	add	s5,s5,a1
    f560:	fff70593          	addi	a1,a4,-1 # ffff <__multf3+0xd47>
    f564:	00b7f7b3          	and	a5,a5,a1
    f568:	00b67633          	and	a2,a2,a1
    f56c:	01061613          	slli	a2,a2,0x10
    f570:	030e85b3          	mul	a1,t4,a6
    f574:	00f60633          	add	a2,a2,a5
    f578:	03d38fb3          	mul	t6,t2,t4
    f57c:	0105d793          	srli	a5,a1,0x10
    f580:	03028e33          	mul	t3,t0,a6
    f584:	01fe0e33          	add	t3,t3,t6
    f588:	01c787b3          	add	a5,a5,t3
    f58c:	027289b3          	mul	s3,t0,t2
    f590:	01f7f463          	bgeu	a5,t6,f598 <__multf3+0x2e0>
    f594:	00e989b3          	add	s3,s3,a4
    f598:	0107d713          	srli	a4,a5,0x10
    f59c:	01370733          	add	a4,a4,s3
    f5a0:	00010a37          	lui	s4,0x10
    f5a4:	00e12a23          	sw	a4,20(sp)
    f5a8:	fffa0713          	addi	a4,s4,-1 # ffff <__multf3+0xd47>
    f5ac:	03812e03          	lw	t3,56(sp)
    f5b0:	00e7f7b3          	and	a5,a5,a4
    f5b4:	00e5f5b3          	and	a1,a1,a4
    f5b8:	01079793          	slli	a5,a5,0x10
    f5bc:	00b787b3          	add	a5,a5,a1
    f5c0:	00f12c23          	sw	a5,24(sp)
    f5c4:	010e5793          	srli	a5,t3,0x10
    f5c8:	00ee7e33          	and	t3,t3,a4
    f5cc:	031e05b3          	mul	a1,t3,a7
    f5d0:	03c90c33          	mul	s8,s2,t3
    f5d4:	0105d713          	srli	a4,a1,0x10
    f5d8:	031789b3          	mul	s3,a5,a7
    f5dc:	018989b3          	add	s3,s3,s8
    f5e0:	01370733          	add	a4,a4,s3
    f5e4:	02f90fb3          	mul	t6,s2,a5
    f5e8:	01877463          	bgeu	a4,s8,f5f0 <__multf3+0x338>
    f5ec:	014f8fb3          	add	t6,t6,s4
    f5f0:	01075993          	srli	s3,a4,0x10
    f5f4:	00010cb7          	lui	s9,0x10
    f5f8:	01f98fb3          	add	t6,s3,t6
    f5fc:	fffc8993          	addi	s3,s9,-1 # ffff <__multf3+0xd47>
    f600:	01377733          	and	a4,a4,s3
    f604:	0135f5b3          	and	a1,a1,s3
    f608:	01071713          	slli	a4,a4,0x10
    f60c:	00b70733          	add	a4,a4,a1
    f610:	02812583          	lw	a1,40(sp)
    f614:	01f12e23          	sw	t6,28(sp)
    f618:	0105df93          	srli	t6,a1,0x10
    f61c:	0135f5b3          	and	a1,a1,s3
    f620:	03e58a33          	mul	s4,a1,t5
    f624:	03ef8d33          	mul	s10,t6,t5
    f628:	010a5d93          	srli	s11,s4,0x10
    f62c:	02b489b3          	mul	s3,s1,a1
    f630:	01a989b3          	add	s3,s3,s10
    f634:	013d89b3          	add	s3,s11,s3
    f638:	03f48c33          	mul	s8,s1,t6
    f63c:	01a9f463          	bgeu	s3,s10,f644 <__multf3+0x38c>
    f640:	019c0c33          	add	s8,s8,s9
    f644:	00db86b3          	add	a3,s7,a3
    f648:	0066b333          	sltu	t1,a3,t1
    f64c:	0109dd13          	srli	s10,s3,0x10
    f650:	00650533          	add	a0,a0,t1
    f654:	00010cb7          	lui	s9,0x10
    f658:	01650533          	add	a0,a0,s6
    f65c:	018d0d33          	add	s10,s10,s8
    f660:	00c68633          	add	a2,a3,a2
    f664:	fffc8c13          	addi	s8,s9,-1 # ffff <__multf3+0xd47>
    f668:	01550ab3          	add	s5,a0,s5
    f66c:	0189f9b3          	and	s3,s3,s8
    f670:	00d636b3          	sltu	a3,a2,a3
    f674:	00da86b3          	add	a3,s5,a3
    f678:	01099993          	slli	s3,s3,0x10
    f67c:	018a7a33          	and	s4,s4,s8
    f680:	01498a33          	add	s4,s3,s4
    f684:	00aab9b3          	sltu	s3,s5,a0
    f688:	0156bab3          	sltu	s5,a3,s5
    f68c:	0159e9b3          	or	s3,s3,s5
    f690:	00653533          	sltu	a0,a0,t1
    f694:	00a98533          	add	a0,s3,a0
    f698:	01812303          	lw	t1,24(sp)
    f69c:	01412983          	lw	s3,20(sp)
    f6a0:	04c12a23          	sw	a2,84(sp)
    f6a4:	00668333          	add	t1,a3,t1
    f6a8:	01350ab3          	add	s5,a0,s3
    f6ac:	01c12983          	lw	s3,28(sp)
    f6b0:	00d336b3          	sltu	a3,t1,a3
    f6b4:	00da86b3          	add	a3,s5,a3
    f6b8:	00e30733          	add	a4,t1,a4
    f6bc:	01368b33          	add	s6,a3,s3
    f6c0:	00673333          	sltu	t1,a4,t1
    f6c4:	006b0333          	add	t1,s6,t1
    f6c8:	01470a33          	add	s4,a4,s4
    f6cc:	01a30d33          	add	s10,t1,s10
    f6d0:	00ea3733          	sltu	a4,s4,a4
    f6d4:	00aab533          	sltu	a0,s5,a0
    f6d8:	00ed0733          	add	a4,s10,a4
    f6dc:	0156bab3          	sltu	s5,a3,s5
    f6e0:	00db36b3          	sltu	a3,s6,a3
    f6e4:	01633b33          	sltu	s6,t1,s6
    f6e8:	0166e6b3          	or	a3,a3,s6
    f6ec:	006d39b3          	sltu	s3,s10,t1
    f6f0:	01556ab3          	or	s5,a0,s5
    f6f4:	01a73d33          	sltu	s10,a4,s10
    f6f8:	00da8ab3          	add	s5,s5,a3
    f6fc:	01a9e9b3          	or	s3,s3,s10
    f700:	015989b3          	add	s3,s3,s5
    f704:	03c12a83          	lw	s5,60(sp)
    f708:	05412c23          	sw	s4,88(sp)
    f70c:	010adb13          	srli	s6,s5,0x10
    f710:	018afab3          	and	s5,s5,s8
    f714:	031a86b3          	mul	a3,s5,a7
    f718:	03590533          	mul	a0,s2,s5
    f71c:	031b08b3          	mul	a7,s6,a7
    f720:	00a88333          	add	t1,a7,a0
    f724:	0106d893          	srli	a7,a3,0x10
    f728:	006888b3          	add	a7,a7,t1
    f72c:	03690933          	mul	s2,s2,s6
    f730:	00a8f463          	bgeu	a7,a0,f738 <__multf3+0x480>
    f734:	01990933          	add	s2,s2,s9
    f738:	02c12b83          	lw	s7,44(sp)
    f73c:	0108d513          	srli	a0,a7,0x10
    f740:	01250533          	add	a0,a0,s2
    f744:	00010c37          	lui	s8,0x10
    f748:	00a12a23          	sw	a0,20(sp)
    f74c:	fffc0513          	addi	a0,s8,-1 # ffff <__multf3+0xd47>
    f750:	010bd913          	srli	s2,s7,0x10
    f754:	00abfbb3          	and	s7,s7,a0
    f758:	00a6f6b3          	and	a3,a3,a0
    f75c:	00a8f8b3          	and	a7,a7,a0
    f760:	03248333          	mul	t1,s1,s2
    f764:	01089893          	slli	a7,a7,0x10
    f768:	00d888b3          	add	a7,a7,a3
    f76c:	03eb8533          	mul	a0,s7,t5
    f770:	037484b3          	mul	s1,s1,s7
    f774:	01055693          	srli	a3,a0,0x10
    f778:	03e90f33          	mul	t5,s2,t5
    f77c:	01e484b3          	add	s1,s1,t5
    f780:	009686b3          	add	a3,a3,s1
    f784:	01e6f463          	bgeu	a3,t5,f78c <__multf3+0x4d4>
    f788:	01830333          	add	t1,t1,s8
    f78c:	0106df13          	srli	t5,a3,0x10
    f790:	006f0333          	add	t1,t5,t1
    f794:	00010cb7          	lui	s9,0x10
    f798:	00612c23          	sw	t1,24(sp)
    f79c:	fffc8313          	addi	t1,s9,-1 # ffff <__multf3+0xd47>
    f7a0:	00657533          	and	a0,a0,t1
    f7a4:	0066f6b3          	and	a3,a3,t1
    f7a8:	03c38f33          	mul	t5,t2,t3
    f7ac:	01069693          	slli	a3,a3,0x10
    f7b0:	00a686b3          	add	a3,a3,a0
    f7b4:	03c80333          	mul	t1,a6,t3
    f7b8:	030784b3          	mul	s1,a5,a6
    f7bc:	01035513          	srli	a0,t1,0x10
    f7c0:	01e484b3          	add	s1,s1,t5
    f7c4:	00950533          	add	a0,a0,s1
    f7c8:	02f38c33          	mul	s8,t2,a5
    f7cc:	01e57463          	bgeu	a0,t5,f7d4 <__multf3+0x51c>
    f7d0:	019c0c33          	add	s8,s8,s9
    f7d4:	00010d37          	lui	s10,0x10
    f7d8:	fffd0f13          	addi	t5,s10,-1 # ffff <__multf3+0xd47>
    f7dc:	01055493          	srli	s1,a0,0x10
    f7e0:	01e57533          	and	a0,a0,t5
    f7e4:	01e37333          	and	t1,t1,t5
    f7e8:	01051513          	slli	a0,a0,0x10
    f7ec:	018484b3          	add	s1,s1,s8
    f7f0:	02b28f33          	mul	t5,t0,a1
    f7f4:	00650533          	add	a0,a0,t1
    f7f8:	03df8c33          	mul	s8,t6,t4
    f7fc:	02be8333          	mul	t1,t4,a1
    f800:	018f0f33          	add	t5,t5,s8
    f804:	01035d93          	srli	s11,t1,0x10
    f808:	01ed8f33          	add	t5,s11,t5
    f80c:	03f28cb3          	mul	s9,t0,t6
    f810:	018f7463          	bgeu	t5,s8,f818 <__multf3+0x560>
    f814:	01ac8cb3          	add	s9,s9,s10
    f818:	010f5c13          	srli	s8,t5,0x10
    f81c:	019c0c33          	add	s8,s8,s9
    f820:	00010cb7          	lui	s9,0x10
    f824:	fffc8d13          	addi	s10,s9,-1 # ffff <__multf3+0xd47>
    f828:	01af7f33          	and	t5,t5,s10
    f82c:	010f1f13          	slli	t5,t5,0x10
    f830:	01a37333          	and	t1,t1,s10
    f834:	006f0333          	add	t1,t5,t1
    f838:	01412f03          	lw	t5,20(sp)
    f83c:	011708b3          	add	a7,a4,a7
    f840:	01812d03          	lw	s10,24(sp)
    f844:	01e98f33          	add	t5,s3,t5
    f848:	00e8b733          	sltu	a4,a7,a4
    f84c:	00ef0733          	add	a4,t5,a4
    f850:	00d886b3          	add	a3,a7,a3
    f854:	01a70d33          	add	s10,a4,s10
    f858:	0116b8b3          	sltu	a7,a3,a7
    f85c:	011d08b3          	add	a7,s10,a7
    f860:	00a68533          	add	a0,a3,a0
    f864:	009884b3          	add	s1,a7,s1
    f868:	00d536b3          	sltu	a3,a0,a3
    f86c:	00d486b3          	add	a3,s1,a3
    f870:	013f39b3          	sltu	s3,t5,s3
    f874:	01e73f33          	sltu	t5,a4,t5
    f878:	00ed3733          	sltu	a4,s10,a4
    f87c:	01a8bd33          	sltu	s10,a7,s10
    f880:	01e9ef33          	or	t5,s3,t5
    f884:	0114b8b3          	sltu	a7,s1,a7
    f888:	01a76733          	or	a4,a4,s10
    f88c:	0096b4b3          	sltu	s1,a3,s1
    f890:	01868c33          	add	s8,a3,s8
    f894:	00ef0733          	add	a4,t5,a4
    f898:	0098e8b3          	or	a7,a7,s1
    f89c:	00e884b3          	add	s1,a7,a4
    f8a0:	03cf8f33          	mul	t5,t6,t3
    f8a4:	00dc38b3          	sltu	a7,s8,a3
    f8a8:	00650333          	add	t1,a0,t1
    f8ac:	00a33533          	sltu	a0,t1,a0
    f8b0:	00ac0533          	add	a0,s8,a0
    f8b4:	01853c33          	sltu	s8,a0,s8
    f8b8:	0188e8b3          	or	a7,a7,s8
    f8bc:	04612e23          	sw	t1,92(sp)
    f8c0:	009888b3          	add	a7,a7,s1
    f8c4:	02be06b3          	mul	a3,t3,a1
    f8c8:	02b789b3          	mul	s3,a5,a1
    f8cc:	0106d713          	srli	a4,a3,0x10
    f8d0:	01e989b3          	add	s3,s3,t5
    f8d4:	01370733          	add	a4,a4,s3
    f8d8:	03f784b3          	mul	s1,a5,t6
    f8dc:	01e77463          	bgeu	a4,t5,f8e4 <__multf3+0x62c>
    f8e0:	019484b3          	add	s1,s1,s9
    f8e4:	01075f13          	srli	t5,a4,0x10
    f8e8:	009f0f33          	add	t5,t5,s1
    f8ec:	000104b7          	lui	s1,0x10
    f8f0:	fff48993          	addi	s3,s1,-1 # ffff <__multf3+0xd47>
    f8f4:	01377733          	and	a4,a4,s3
    f8f8:	0136f6b3          	and	a3,a3,s3
    f8fc:	01071713          	slli	a4,a4,0x10
    f900:	035389b3          	mul	s3,t2,s5
    f904:	00d70733          	add	a4,a4,a3
    f908:	030a86b3          	mul	a3,s5,a6
    f90c:	030b0833          	mul	a6,s6,a6
    f910:	01380c33          	add	s8,a6,s3
    f914:	0106d813          	srli	a6,a3,0x10
    f918:	01880833          	add	a6,a6,s8
    f91c:	036383b3          	mul	t2,t2,s6
    f920:	01387463          	bgeu	a6,s3,f928 <__multf3+0x670>
    f924:	009383b3          	add	t2,t2,s1
    f928:	01085493          	srli	s1,a6,0x10
    f92c:	00010c37          	lui	s8,0x10
    f930:	007483b3          	add	t2,s1,t2
    f934:	fffc0493          	addi	s1,s8,-1 # ffff <__multf3+0xd47>
    f938:	0096f6b3          	and	a3,a3,s1
    f93c:	00987833          	and	a6,a6,s1
    f940:	01081813          	slli	a6,a6,0x10
    f944:	03db89b3          	mul	s3,s7,t4
    f948:	00d80833          	add	a6,a6,a3
    f94c:	03d90eb3          	mul	t4,s2,t4
    f950:	0109d693          	srli	a3,s3,0x10
    f954:	032284b3          	mul	s1,t0,s2
    f958:	037282b3          	mul	t0,t0,s7
    f95c:	01d282b3          	add	t0,t0,t4
    f960:	005686b3          	add	a3,a3,t0
    f964:	01d6f463          	bgeu	a3,t4,f96c <__multf3+0x6b4>
    f968:	018484b3          	add	s1,s1,s8
    f96c:	0106de93          	srli	t4,a3,0x10
    f970:	009e8eb3          	add	t4,t4,s1
    f974:	000104b7          	lui	s1,0x10
    f978:	fff48293          	addi	t0,s1,-1 # ffff <__multf3+0xd47>
    f97c:	0056f6b3          	and	a3,a3,t0
    f980:	0059f9b3          	and	s3,s3,t0
    f984:	01069693          	slli	a3,a3,0x10
    f988:	02ba82b3          	mul	t0,s5,a1
    f98c:	013686b3          	add	a3,a3,s3
    f990:	02bb05b3          	mul	a1,s6,a1
    f994:	035f89b3          	mul	s3,t6,s5
    f998:	01358c33          	add	s8,a1,s3
    f99c:	0102d593          	srli	a1,t0,0x10
    f9a0:	018585b3          	add	a1,a1,s8
    f9a4:	036f8fb3          	mul	t6,t6,s6
    f9a8:	0135f463          	bgeu	a1,s3,f9b0 <__multf3+0x6f8>
    f9ac:	009f8fb3          	add	t6,t6,s1
    f9b0:	0105d493          	srli	s1,a1,0x10
    f9b4:	01f48fb3          	add	t6,s1,t6
    f9b8:	000104b7          	lui	s1,0x10
    f9bc:	fff48993          	addi	s3,s1,-1 # ffff <__multf3+0xd47>
    f9c0:	0135f5b3          	and	a1,a1,s3
    f9c4:	0132f2b3          	and	t0,t0,s3
    f9c8:	01059593          	slli	a1,a1,0x10
    f9cc:	032789b3          	mul	s3,a5,s2
    f9d0:	005585b3          	add	a1,a1,t0
    f9d4:	037787b3          	mul	a5,a5,s7
    f9d8:	03cb82b3          	mul	t0,s7,t3
    f9dc:	03c90e33          	mul	t3,s2,t3
    f9e0:	0102dc13          	srli	s8,t0,0x10
    f9e4:	01c787b3          	add	a5,a5,t3
    f9e8:	00fc07b3          	add	a5,s8,a5
    f9ec:	01c7f463          	bgeu	a5,t3,f9f4 <__multf3+0x73c>
    f9f0:	009989b3          	add	s3,s3,s1
    f9f4:	00e50733          	add	a4,a0,a4
    f9f8:	01070833          	add	a6,a4,a6
    f9fc:	01e88f33          	add	t5,a7,t5
    fa00:	00a73533          	sltu	a0,a4,a0
    fa04:	00af0533          	add	a0,t5,a0
    fa08:	00d806b3          	add	a3,a6,a3
    fa0c:	007503b3          	add	t2,a0,t2
    fa10:	00e83733          	sltu	a4,a6,a4
    fa14:	06d12023          	sw	a3,96(sp)
    fa18:	0106b6b3          	sltu	a3,a3,a6
    fa1c:	037a8833          	mul	a6,s5,s7
    fa20:	00e38733          	add	a4,t2,a4
    fa24:	01d70eb3          	add	t4,a4,t4
    fa28:	00de86b3          	add	a3,t4,a3
    fa2c:	0107de13          	srli	t3,a5,0x10
    fa30:	011f38b3          	sltu	a7,t5,a7
    fa34:	000104b7          	lui	s1,0x10
    fa38:	01e53f33          	sltu	t5,a0,t5
    fa3c:	00a3b533          	sltu	a0,t2,a0
    fa40:	007733b3          	sltu	t2,a4,t2
    fa44:	03590ab3          	mul	s5,s2,s5
    fa48:	013e0e33          	add	t3,t3,s3
    fa4c:	00756533          	or	a0,a0,t2
    fa50:	fff48993          	addi	s3,s1,-1 # ffff <__multf3+0xd47>
    fa54:	00eeb733          	sltu	a4,t4,a4
    fa58:	01e8e8b3          	or	a7,a7,t5
    fa5c:	01d6beb3          	sltu	t4,a3,t4
    fa60:	00a888b3          	add	a7,a7,a0
    fa64:	0137f7b3          	and	a5,a5,s3
    fa68:	01d76733          	or	a4,a4,t4
    fa6c:	032b0933          	mul	s2,s6,s2
    fa70:	00b685b3          	add	a1,a3,a1
    fa74:	01170733          	add	a4,a4,a7
    fa78:	01079793          	slli	a5,a5,0x10
    fa7c:	0132f2b3          	and	t0,t0,s3
    fa80:	01f70fb3          	add	t6,a4,t6
    fa84:	005787b3          	add	a5,a5,t0
    fa88:	00d5b6b3          	sltu	a3,a1,a3
    fa8c:	00df86b3          	add	a3,t6,a3
    fa90:	00f587b3          	add	a5,a1,a5
    fa94:	037b0b33          	mul	s6,s6,s7
    fa98:	00efb733          	sltu	a4,t6,a4
    fa9c:	01c68e33          	add	t3,a3,t3
    faa0:	01f6bfb3          	sltu	t6,a3,t6
    faa4:	06f12223          	sw	a5,100(sp)
    faa8:	00b7b7b3          	sltu	a5,a5,a1
    faac:	01f76533          	or	a0,a4,t6
    fab0:	00fe07b3          	add	a5,t3,a5
    fab4:	01085713          	srli	a4,a6,0x10
    fab8:	00de36b3          	sltu	a3,t3,a3
    fabc:	015b0b33          	add	s6,s6,s5
    fac0:	01c7be33          	sltu	t3,a5,t3
    fac4:	01670733          	add	a4,a4,s6
    fac8:	01c6e6b3          	or	a3,a3,t3
    facc:	01577463          	bgeu	a4,s5,fad4 <__multf3+0x81c>
    fad0:	00990933          	add	s2,s2,s1
    fad4:	01075593          	srli	a1,a4,0x10
    fad8:	00a585b3          	add	a1,a1,a0
    fadc:	00010537          	lui	a0,0x10
    fae0:	fff50513          	addi	a0,a0,-1 # ffff <__multf3+0xd47>
    fae4:	00a77733          	and	a4,a4,a0
    fae8:	01071713          	slli	a4,a4,0x10
    faec:	00a87833          	and	a6,a6,a0
    faf0:	01070733          	add	a4,a4,a6
    faf4:	00e78733          	add	a4,a5,a4
    faf8:	00d586b3          	add	a3,a1,a3
    fafc:	00f737b3          	sltu	a5,a4,a5
    fb00:	00f687b3          	add	a5,a3,a5
    fb04:	012787b3          	add	a5,a5,s2
    fb08:	06f12623          	sw	a5,108(sp)
    fb0c:	01012783          	lw	a5,16(sp)
    fb10:	00d31313          	slli	t1,t1,0xd
    fb14:	06e12423          	sw	a4,104(sp)
    fb18:	00c7e7b3          	or	a5,a5,a2
    fb1c:	0147e7b3          	or	a5,a5,s4
    fb20:	00f36333          	or	t1,t1,a5
    fb24:	06010613          	addi	a2,sp,96
    fb28:	05010793          	addi	a5,sp,80
    fb2c:	00c7a703          	lw	a4,12(a5)
    fb30:	0107a683          	lw	a3,16(a5)
    fb34:	00478793          	addi	a5,a5,4
    fb38:	01375713          	srli	a4,a4,0x13
    fb3c:	00d69693          	slli	a3,a3,0xd
    fb40:	00d76733          	or	a4,a4,a3
    fb44:	fee7ae23          	sw	a4,-4(a5)
    fb48:	fef612e3          	bne	a2,a5,fb2c <__multf3+0x874>
    fb4c:	05012783          	lw	a5,80(sp)
    fb50:	00603333          	snez	t1,t1
    fb54:	05c12703          	lw	a4,92(sp)
    fb58:	00f36333          	or	t1,t1,a5
    fb5c:	05812783          	lw	a5,88(sp)
    fb60:	04e12623          	sw	a4,76(sp)
    fb64:	04612023          	sw	t1,64(sp)
    fb68:	04f12423          	sw	a5,72(sp)
    fb6c:	05412783          	lw	a5,84(sp)
    fb70:	04f12223          	sw	a5,68(sp)
    fb74:	00b71793          	slli	a5,a4,0xb
    fb78:	0407d863          	bgez	a5,fbc8 <__multf3+0x910>
    fb7c:	01f31313          	slli	t1,t1,0x1f
    fb80:	04010793          	addi	a5,sp,64
    fb84:	04c10593          	addi	a1,sp,76
    fb88:	0007a683          	lw	a3,0(a5)
    fb8c:	0047a603          	lw	a2,4(a5)
    fb90:	00478793          	addi	a5,a5,4
    fb94:	0016d693          	srli	a3,a3,0x1
    fb98:	01f61613          	slli	a2,a2,0x1f
    fb9c:	00c6e6b3          	or	a3,a3,a2
    fba0:	fed7ae23          	sw	a3,-4(a5)
    fba4:	fef592e3          	bne	a1,a5,fb88 <__multf3+0x8d0>
    fba8:	04012783          	lw	a5,64(sp)
    fbac:	00603333          	snez	t1,t1
    fbb0:	00175713          	srli	a4,a4,0x1
    fbb4:	0067e7b3          	or	a5,a5,t1
    fbb8:	04f12023          	sw	a5,64(sp)
    fbbc:	00812783          	lw	a5,8(sp)
    fbc0:	04e12623          	sw	a4,76(sp)
    fbc4:	00f12623          	sw	a5,12(sp)
    fbc8:	00c12783          	lw	a5,12(sp)
    fbcc:	00f12423          	sw	a5,8(sp)
    fbd0:	3780006f          	j	ff48 <__multf3+0xc90>
    fbd4:	00a7e633          	or	a2,a5,a0
    fbd8:	00d66633          	or	a2,a2,a3
    fbdc:	00e66633          	or	a2,a2,a4
    fbe0:	14060463          	beqz	a2,fd28 <__multf3+0xa70>
    fbe4:	0a070063          	beqz	a4,fc84 <__multf3+0x9cc>
    fbe8:	00070513          	mv	a0,a4
    fbec:	395020ef          	jal	12780 <__clzsi2>
    fbf0:	ff450713          	addi	a4,a0,-12
    fbf4:	40575593          	srai	a1,a4,0x5
    fbf8:	01f77713          	andi	a4,a4,31
    fbfc:	0a070e63          	beqz	a4,fcb8 <__multf3+0xa00>
    fc00:	ffc00693          	li	a3,-4
    fc04:	02d586b3          	mul	a3,a1,a3
    fc08:	02000813          	li	a6,32
    fc0c:	02010313          	addi	t1,sp,32
    fc10:	40e80833          	sub	a6,a6,a4
    fc14:	00c68793          	addi	a5,a3,12 # 1000c <__multf3+0xd54>
    fc18:	00f307b3          	add	a5,t1,a5
    fc1c:	40d006b3          	neg	a3,a3
    fc20:	0cf31463          	bne	t1,a5,fce8 <__multf3+0xa30>
    fc24:	fff58793          	addi	a5,a1,-1
    fc28:	00259593          	slli	a1,a1,0x2
    fc2c:	05058693          	addi	a3,a1,80
    fc30:	02010613          	addi	a2,sp,32
    fc34:	00c685b3          	add	a1,a3,a2
    fc38:	02012683          	lw	a3,32(sp)
    fc3c:	00e69733          	sll	a4,a3,a4
    fc40:	fae5a823          	sw	a4,-80(a1)
    fc44:	00178793          	addi	a5,a5,1
    fc48:	00279793          	slli	a5,a5,0x2
    fc4c:	00800693          	li	a3,8
    fc50:	02010713          	addi	a4,sp,32
    fc54:	00d7ea63          	bltu	a5,a3,fc68 <__multf3+0x9b0>
    fc58:	02012023          	sw	zero,32(sp)
    fc5c:	00072223          	sw	zero,4(a4)
    fc60:	ff878793          	addi	a5,a5,-8
    fc64:	02810713          	addi	a4,sp,40
    fc68:	00400693          	li	a3,4
    fc6c:	00d7e463          	bltu	a5,a3,fc74 <__multf3+0x9bc>
    fc70:	00072023          	sw	zero,0(a4)
    fc74:	ffffc4b7          	lui	s1,0xffffc
    fc78:	01148493          	addi	s1,s1,17 # ffffc011 <_memory_end+0xfffdc011>
    fc7c:	40a484b3          	sub	s1,s1,a0
    fc80:	f20ff06f          	j	f3a0 <__multf3+0xe8>
    fc84:	00068a63          	beqz	a3,fc98 <__multf3+0x9e0>
    fc88:	00068513          	mv	a0,a3
    fc8c:	2f5020ef          	jal	12780 <__clzsi2>
    fc90:	02050513          	addi	a0,a0,32
    fc94:	f5dff06f          	j	fbf0 <__multf3+0x938>
    fc98:	00050863          	beqz	a0,fca8 <__multf3+0x9f0>
    fc9c:	2e5020ef          	jal	12780 <__clzsi2>
    fca0:	04050513          	addi	a0,a0,64
    fca4:	f4dff06f          	j	fbf0 <__multf3+0x938>
    fca8:	00078513          	mv	a0,a5
    fcac:	2d5020ef          	jal	12780 <__clzsi2>
    fcb0:	06050513          	addi	a0,a0,96
    fcb4:	f3dff06f          	j	fbf0 <__multf3+0x938>
    fcb8:	ffc00693          	li	a3,-4
    fcbc:	02d586b3          	mul	a3,a1,a3
    fcc0:	02c10793          	addi	a5,sp,44
    fcc4:	00300713          	li	a4,3
    fcc8:	00d78633          	add	a2,a5,a3
    fccc:	00062603          	lw	a2,0(a2)
    fcd0:	fff70713          	addi	a4,a4,-1
    fcd4:	ffc78793          	addi	a5,a5,-4
    fcd8:	00c7a223          	sw	a2,4(a5)
    fcdc:	feb756e3          	bge	a4,a1,fcc8 <__multf3+0xa10>
    fce0:	fff58793          	addi	a5,a1,-1
    fce4:	f61ff06f          	j	fc44 <__multf3+0x98c>
    fce8:	0007a603          	lw	a2,0(a5)
    fcec:	ffc7a883          	lw	a7,-4(a5)
    fcf0:	00d78e33          	add	t3,a5,a3
    fcf4:	00e61633          	sll	a2,a2,a4
    fcf8:	0108d8b3          	srl	a7,a7,a6
    fcfc:	01166633          	or	a2,a2,a7
    fd00:	00ce2023          	sw	a2,0(t3)
    fd04:	ffc78793          	addi	a5,a5,-4
    fd08:	f19ff06f          	j	fc20 <__multf3+0x968>
    fd0c:	00a7e7b3          	or	a5,a5,a0
    fd10:	00d7e7b3          	or	a5,a5,a3
    fd14:	00e7e7b3          	or	a5,a5,a4
    fd18:	00200b93          	li	s7,2
    fd1c:	e8078463          	beqz	a5,f3a4 <__multf3+0xec>
    fd20:	00300b93          	li	s7,3
    fd24:	e80ff06f          	j	f3a4 <__multf3+0xec>
    fd28:	00000493          	li	s1,0
    fd2c:	00100b93          	li	s7,1
    fd30:	e74ff06f          	j	f3a4 <__multf3+0xec>
    fd34:	016967b3          	or	a5,s2,s6
    fd38:	0157e7b3          	or	a5,a5,s5
    fd3c:	00a7e7b3          	or	a5,a5,a0
    fd40:	14078463          	beqz	a5,fe88 <__multf3+0xbd0>
    fd44:	08050e63          	beqz	a0,fde0 <__multf3+0xb28>
    fd48:	239020ef          	jal	12780 <__clzsi2>
    fd4c:	ff450693          	addi	a3,a0,-12
    fd50:	4056d793          	srai	a5,a3,0x5
    fd54:	01f6f693          	andi	a3,a3,31
    fd58:	0c068063          	beqz	a3,fe18 <__multf3+0xb60>
    fd5c:	ffc00613          	li	a2,-4
    fd60:	02c78633          	mul	a2,a5,a2
    fd64:	02000813          	li	a6,32
    fd68:	03010313          	addi	t1,sp,48
    fd6c:	40d80833          	sub	a6,a6,a3
    fd70:	00c60713          	addi	a4,a2,12
    fd74:	00e30733          	add	a4,t1,a4
    fd78:	40c00633          	neg	a2,a2
    fd7c:	0ce31663          	bne	t1,a4,fe48 <__multf3+0xb90>
    fd80:	fff78713          	addi	a4,a5,-1
    fd84:	00279793          	slli	a5,a5,0x2
    fd88:	02010613          	addi	a2,sp,32
    fd8c:	05078793          	addi	a5,a5,80
    fd90:	00c787b3          	add	a5,a5,a2
    fd94:	03012603          	lw	a2,48(sp)
    fd98:	00d616b3          	sll	a3,a2,a3
    fd9c:	fcd7a023          	sw	a3,-64(a5)
    fda0:	00170793          	addi	a5,a4,1
    fda4:	00279793          	slli	a5,a5,0x2
    fda8:	00800693          	li	a3,8
    fdac:	03010713          	addi	a4,sp,48
    fdb0:	00d7ea63          	bltu	a5,a3,fdc4 <__multf3+0xb0c>
    fdb4:	02012823          	sw	zero,48(sp)
    fdb8:	00072223          	sw	zero,4(a4)
    fdbc:	ff878793          	addi	a5,a5,-8
    fdc0:	03810713          	addi	a4,sp,56
    fdc4:	00400693          	li	a3,4
    fdc8:	00d7e463          	bltu	a5,a3,fdd0 <__multf3+0xb18>
    fdcc:	00072023          	sw	zero,0(a4)
    fdd0:	ffffc7b7          	lui	a5,0xffffc
    fdd4:	01178793          	addi	a5,a5,17 # ffffc011 <_memory_end+0xfffdc011>
    fdd8:	40a787b3          	sub	a5,a5,a0
    fddc:	e54ff06f          	j	f430 <__multf3+0x178>
    fde0:	000a8a63          	beqz	s5,fdf4 <__multf3+0xb3c>
    fde4:	000a8513          	mv	a0,s5
    fde8:	199020ef          	jal	12780 <__clzsi2>
    fdec:	02050513          	addi	a0,a0,32
    fdf0:	f5dff06f          	j	fd4c <__multf3+0xa94>
    fdf4:	000b0a63          	beqz	s6,fe08 <__multf3+0xb50>
    fdf8:	000b0513          	mv	a0,s6
    fdfc:	185020ef          	jal	12780 <__clzsi2>
    fe00:	04050513          	addi	a0,a0,64
    fe04:	f49ff06f          	j	fd4c <__multf3+0xa94>
    fe08:	00090513          	mv	a0,s2
    fe0c:	175020ef          	jal	12780 <__clzsi2>
    fe10:	06050513          	addi	a0,a0,96
    fe14:	f39ff06f          	j	fd4c <__multf3+0xa94>
    fe18:	ffc00613          	li	a2,-4
    fe1c:	02c78633          	mul	a2,a5,a2
    fe20:	03c10713          	addi	a4,sp,60
    fe24:	00300693          	li	a3,3
    fe28:	00c705b3          	add	a1,a4,a2
    fe2c:	0005a583          	lw	a1,0(a1)
    fe30:	fff68693          	addi	a3,a3,-1
    fe34:	ffc70713          	addi	a4,a4,-4
    fe38:	00b72223          	sw	a1,4(a4)
    fe3c:	fef6d6e3          	bge	a3,a5,fe28 <__multf3+0xb70>
    fe40:	fff78713          	addi	a4,a5,-1
    fe44:	f5dff06f          	j	fda0 <__multf3+0xae8>
    fe48:	00072583          	lw	a1,0(a4)
    fe4c:	ffc72883          	lw	a7,-4(a4)
    fe50:	00c70e33          	add	t3,a4,a2
    fe54:	00d595b3          	sll	a1,a1,a3
    fe58:	0108d8b3          	srl	a7,a7,a6
    fe5c:	0115e5b3          	or	a1,a1,a7
    fe60:	00be2023          	sw	a1,0(t3)
    fe64:	ffc70713          	addi	a4,a4,-4
    fe68:	f15ff06f          	j	fd7c <__multf3+0xac4>
    fe6c:	01696933          	or	s2,s2,s6
    fe70:	01596933          	or	s2,s2,s5
    fe74:	00a96933          	or	s2,s2,a0
    fe78:	00200693          	li	a3,2
    fe7c:	da090c63          	beqz	s2,f434 <__multf3+0x17c>
    fe80:	00300693          	li	a3,3
    fe84:	db0ff06f          	j	f434 <__multf3+0x17c>
    fe88:	00000793          	li	a5,0
    fe8c:	00100693          	li	a3,1
    fe90:	da4ff06f          	j	f434 <__multf3+0x17c>
    fe94:	00100713          	li	a4,1
    fe98:	00f717b3          	sll	a5,a4,a5
    fe9c:	5307f713          	andi	a4,a5,1328
    fea0:	06071863          	bnez	a4,ff10 <__multf3+0xc58>
    fea4:	0887f713          	andi	a4,a5,136
    fea8:	04071063          	bnez	a4,fee8 <__multf3+0xc30>
    feac:	2407f793          	andi	a5,a5,576
    feb0:	dc078063          	beqz	a5,f470 <__multf3+0x1b8>
    feb4:	000087b7          	lui	a5,0x8
    feb8:	04f12623          	sw	a5,76(sp)
    febc:	04012423          	sw	zero,72(sp)
    fec0:	04012223          	sw	zero,68(sp)
    fec4:	04012023          	sw	zero,64(sp)
    fec8:	fff78793          	addi	a5,a5,-1 # 7fff <__gdtoa+0x11a3>
    fecc:	00012223          	sw	zero,4(sp)
    fed0:	1440006f          	j	10014 <__multf3+0xd5c>
    fed4:	00f00713          	li	a4,15
    fed8:	fce78ee3          	beq	a5,a4,feb4 <__multf3+0xbfc>
    fedc:	00b00713          	li	a4,11
    fee0:	01412223          	sw	s4,4(sp)
    fee4:	02e79663          	bne	a5,a4,ff10 <__multf3+0xc58>
    fee8:	01312223          	sw	s3,4(sp)
    feec:	03012783          	lw	a5,48(sp)
    fef0:	00068b93          	mv	s7,a3
    fef4:	04f12023          	sw	a5,64(sp)
    fef8:	03412783          	lw	a5,52(sp)
    fefc:	04f12223          	sw	a5,68(sp)
    ff00:	03812783          	lw	a5,56(sp)
    ff04:	04f12423          	sw	a5,72(sp)
    ff08:	03c12783          	lw	a5,60(sp)
    ff0c:	0200006f          	j	ff2c <__multf3+0xc74>
    ff10:	02012783          	lw	a5,32(sp)
    ff14:	04f12023          	sw	a5,64(sp)
    ff18:	02412783          	lw	a5,36(sp)
    ff1c:	04f12223          	sw	a5,68(sp)
    ff20:	02812783          	lw	a5,40(sp)
    ff24:	04f12423          	sw	a5,72(sp)
    ff28:	02c12783          	lw	a5,44(sp)
    ff2c:	04f12623          	sw	a5,76(sp)
    ff30:	00200793          	li	a5,2
    ff34:	36fb8663          	beq	s7,a5,102a0 <__multf3+0xfe8>
    ff38:	00300793          	li	a5,3
    ff3c:	f6fb8ce3          	beq	s7,a5,feb4 <__multf3+0xbfc>
    ff40:	00100793          	li	a5,1
    ff44:	34fb8463          	beq	s7,a5,1028c <__multf3+0xfd4>
    ff48:	00812703          	lw	a4,8(sp)
    ff4c:	000047b7          	lui	a5,0x4
    ff50:	fff78793          	addi	a5,a5,-1 # 3fff <_vfprintf_r+0x1bf3>
    ff54:	00f707b3          	add	a5,a4,a5
    ff58:	12f05a63          	blez	a5,1008c <__multf3+0xdd4>
    ff5c:	04012703          	lw	a4,64(sp)
    ff60:	00777693          	andi	a3,a4,7
    ff64:	04068463          	beqz	a3,ffac <__multf3+0xcf4>
    ff68:	00f77693          	andi	a3,a4,15
    ff6c:	00400613          	li	a2,4
    ff70:	02c68e63          	beq	a3,a2,ffac <__multf3+0xcf4>
    ff74:	00470713          	addi	a4,a4,4
    ff78:	00473693          	sltiu	a3,a4,4
    ff7c:	04e12023          	sw	a4,64(sp)
    ff80:	04412703          	lw	a4,68(sp)
    ff84:	00e68733          	add	a4,a3,a4
    ff88:	04e12223          	sw	a4,68(sp)
    ff8c:	00d73733          	sltu	a4,a4,a3
    ff90:	04812683          	lw	a3,72(sp)
    ff94:	00e68733          	add	a4,a3,a4
    ff98:	04e12423          	sw	a4,72(sp)
    ff9c:	00d73733          	sltu	a4,a4,a3
    ffa0:	04c12683          	lw	a3,76(sp)
    ffa4:	00d70733          	add	a4,a4,a3
    ffa8:	04e12623          	sw	a4,76(sp)
    ffac:	04c12703          	lw	a4,76(sp)
    ffb0:	00b71693          	slli	a3,a4,0xb
    ffb4:	0206d063          	bgez	a3,ffd4 <__multf3+0xd1c>
    ffb8:	fff007b7          	lui	a5,0xfff00
    ffbc:	fff78793          	addi	a5,a5,-1 # ffefffff <_memory_end+0xffedffff>
    ffc0:	00f77733          	and	a4,a4,a5
    ffc4:	04e12623          	sw	a4,76(sp)
    ffc8:	00812703          	lw	a4,8(sp)
    ffcc:	000047b7          	lui	a5,0x4
    ffd0:	00f707b3          	add	a5,a4,a5
    ffd4:	04010713          	addi	a4,sp,64
    ffd8:	04c10593          	addi	a1,sp,76
    ffdc:	00072683          	lw	a3,0(a4)
    ffe0:	00472603          	lw	a2,4(a4)
    ffe4:	00470713          	addi	a4,a4,4
    ffe8:	0036d693          	srli	a3,a3,0x3
    ffec:	01d61613          	slli	a2,a2,0x1d
    fff0:	00c6e6b3          	or	a3,a3,a2
    fff4:	fed72e23          	sw	a3,-4(a4)
    fff8:	fee592e3          	bne	a1,a4,ffdc <__multf3+0xd24>
    fffc:	000086b7          	lui	a3,0x8
   10000:	ffe68693          	addi	a3,a3,-2 # 7ffe <__gdtoa+0x11a2>
   10004:	04c12703          	lw	a4,76(sp)
   10008:	28f6cc63          	blt	a3,a5,102a0 <__multf3+0xfe8>
   1000c:	00375713          	srli	a4,a4,0x3
   10010:	04e12623          	sw	a4,76(sp)
   10014:	04c12703          	lw	a4,76(sp)
   10018:	0ac12083          	lw	ra,172(sp)
   1001c:	00040513          	mv	a0,s0
   10020:	04e11e23          	sh	a4,92(sp)
   10024:	00412703          	lw	a4,4(sp)
   10028:	0a412483          	lw	s1,164(sp)
   1002c:	0a012903          	lw	s2,160(sp)
   10030:	00f71713          	slli	a4,a4,0xf
   10034:	00f767b3          	or	a5,a4,a5
   10038:	04f11f23          	sh	a5,94(sp)
   1003c:	04012783          	lw	a5,64(sp)
   10040:	09c12983          	lw	s3,156(sp)
   10044:	09812a03          	lw	s4,152(sp)
   10048:	00f42023          	sw	a5,0(s0)
   1004c:	04412783          	lw	a5,68(sp)
   10050:	09412a83          	lw	s5,148(sp)
   10054:	09012b03          	lw	s6,144(sp)
   10058:	00f42223          	sw	a5,4(s0)
   1005c:	04812783          	lw	a5,72(sp)
   10060:	08c12b83          	lw	s7,140(sp)
   10064:	08812c03          	lw	s8,136(sp)
   10068:	00f42423          	sw	a5,8(s0)
   1006c:	05c12783          	lw	a5,92(sp)
   10070:	08412c83          	lw	s9,132(sp)
   10074:	08012d03          	lw	s10,128(sp)
   10078:	00f42623          	sw	a5,12(s0)
   1007c:	0a812403          	lw	s0,168(sp)
   10080:	07c12d83          	lw	s11,124(sp)
   10084:	0b010113          	addi	sp,sp,176
   10088:	00008067          	ret
   1008c:	00100693          	li	a3,1
   10090:	40f686b3          	sub	a3,a3,a5
   10094:	07400793          	li	a5,116
   10098:	1cd7ca63          	blt	a5,a3,1026c <__multf3+0xfb4>
   1009c:	04010613          	addi	a2,sp,64
   100a0:	4056d713          	srai	a4,a3,0x5
   100a4:	00060513          	mv	a0,a2
   100a8:	01f6f693          	andi	a3,a3,31
   100ac:	00000793          	li	a5,0
   100b0:	00000593          	li	a1,0
   100b4:	02e59e63          	bne	a1,a4,100f0 <__multf3+0xe38>
   100b8:	00300593          	li	a1,3
   100bc:	40e585b3          	sub	a1,a1,a4
   100c0:	00271513          	slli	a0,a4,0x2
   100c4:	04069063          	bnez	a3,10104 <__multf3+0xe4c>
   100c8:	00060813          	mv	a6,a2
   100cc:	00a808b3          	add	a7,a6,a0
   100d0:	0008a883          	lw	a7,0(a7) # 10000 <__multf3+0xd48>
   100d4:	00168693          	addi	a3,a3,1
   100d8:	00480813          	addi	a6,a6,4
   100dc:	ff182e23          	sw	a7,-4(a6)
   100e0:	fed5d6e3          	bge	a1,a3,100cc <__multf3+0xe14>
   100e4:	00400693          	li	a3,4
   100e8:	40e68733          	sub	a4,a3,a4
   100ec:	06c0006f          	j	10158 <__multf3+0xea0>
   100f0:	00052803          	lw	a6,0(a0)
   100f4:	00158593          	addi	a1,a1,1
   100f8:	00450513          	addi	a0,a0,4
   100fc:	0107e7b3          	or	a5,a5,a6
   10100:	fb5ff06f          	j	100b4 <__multf3+0xdfc>
   10104:	05050813          	addi	a6,a0,80
   10108:	02010893          	addi	a7,sp,32
   1010c:	01180833          	add	a6,a6,a7
   10110:	fd082803          	lw	a6,-48(a6)
   10114:	02000313          	li	t1,32
   10118:	40d30333          	sub	t1,t1,a3
   1011c:	00681833          	sll	a6,a6,t1
   10120:	0107e7b3          	or	a5,a5,a6
   10124:	00000e13          	li	t3,0
   10128:	00a60833          	add	a6,a2,a0
   1012c:	40a00533          	neg	a0,a0
   10130:	0ebe4063          	blt	t3,a1,10210 <__multf3+0xf58>
   10134:	00400513          	li	a0,4
   10138:	00259593          	slli	a1,a1,0x2
   1013c:	40e50733          	sub	a4,a0,a4
   10140:	05058593          	addi	a1,a1,80
   10144:	02010513          	addi	a0,sp,32
   10148:	00a585b3          	add	a1,a1,a0
   1014c:	04c12503          	lw	a0,76(sp)
   10150:	00d556b3          	srl	a3,a0,a3
   10154:	fcd5a823          	sw	a3,-48(a1)
   10158:	00400693          	li	a3,4
   1015c:	40e686b3          	sub	a3,a3,a4
   10160:	00269693          	slli	a3,a3,0x2
   10164:	00271713          	slli	a4,a4,0x2
   10168:	00800593          	li	a1,8
   1016c:	00e60733          	add	a4,a2,a4
   10170:	00b6ea63          	bltu	a3,a1,10184 <__multf3+0xecc>
   10174:	00072023          	sw	zero,0(a4)
   10178:	00072223          	sw	zero,4(a4)
   1017c:	ff868693          	addi	a3,a3,-8
   10180:	00870713          	addi	a4,a4,8
   10184:	00400593          	li	a1,4
   10188:	00b6e463          	bltu	a3,a1,10190 <__multf3+0xed8>
   1018c:	00072023          	sw	zero,0(a4)
   10190:	04012703          	lw	a4,64(sp)
   10194:	00f037b3          	snez	a5,a5
   10198:	00e7e7b3          	or	a5,a5,a4
   1019c:	04f12023          	sw	a5,64(sp)
   101a0:	0077f713          	andi	a4,a5,7
   101a4:	04070463          	beqz	a4,101ec <__multf3+0xf34>
   101a8:	00f7f713          	andi	a4,a5,15
   101ac:	00400693          	li	a3,4
   101b0:	02d70e63          	beq	a4,a3,101ec <__multf3+0xf34>
   101b4:	04412703          	lw	a4,68(sp)
   101b8:	00478793          	addi	a5,a5,4 # 4004 <_vfprintf_r+0x1bf8>
   101bc:	04f12023          	sw	a5,64(sp)
   101c0:	0047b793          	sltiu	a5,a5,4
   101c4:	00f707b3          	add	a5,a4,a5
   101c8:	04f12223          	sw	a5,68(sp)
   101cc:	00e7b7b3          	sltu	a5,a5,a4
   101d0:	04812703          	lw	a4,72(sp)
   101d4:	00f707b3          	add	a5,a4,a5
   101d8:	04f12423          	sw	a5,72(sp)
   101dc:	00e7b7b3          	sltu	a5,a5,a4
   101e0:	04c12703          	lw	a4,76(sp)
   101e4:	00e787b3          	add	a5,a5,a4
   101e8:	04f12623          	sw	a5,76(sp)
   101ec:	04c12703          	lw	a4,76(sp)
   101f0:	00c71793          	slli	a5,a4,0xc
   101f4:	0407d263          	bgez	a5,10238 <__multf3+0xf80>
   101f8:	04012623          	sw	zero,76(sp)
   101fc:	04012423          	sw	zero,72(sp)
   10200:	04012223          	sw	zero,68(sp)
   10204:	04012023          	sw	zero,64(sp)
   10208:	00100793          	li	a5,1
   1020c:	e09ff06f          	j	10014 <__multf3+0xd5c>
   10210:	00082883          	lw	a7,0(a6)
   10214:	00482e83          	lw	t4,4(a6)
   10218:	00a80f33          	add	t5,a6,a0
   1021c:	00d8d8b3          	srl	a7,a7,a3
   10220:	006e9eb3          	sll	t4,t4,t1
   10224:	01d8e8b3          	or	a7,a7,t4
   10228:	011f2023          	sw	a7,0(t5)
   1022c:	001e0e13          	addi	t3,t3,1
   10230:	00480813          	addi	a6,a6,4
   10234:	efdff06f          	j	10130 <__multf3+0xe78>
   10238:	00c60593          	addi	a1,a2,12
   1023c:	00062783          	lw	a5,0(a2)
   10240:	00462683          	lw	a3,4(a2)
   10244:	00460613          	addi	a2,a2,4
   10248:	0037d793          	srli	a5,a5,0x3
   1024c:	01d69693          	slli	a3,a3,0x1d
   10250:	00d7e7b3          	or	a5,a5,a3
   10254:	fef62e23          	sw	a5,-4(a2)
   10258:	fec592e3          	bne	a1,a2,1023c <__multf3+0xf84>
   1025c:	00375713          	srli	a4,a4,0x3
   10260:	04e12623          	sw	a4,76(sp)
   10264:	00000793          	li	a5,0
   10268:	dadff06f          	j	10014 <__multf3+0xd5c>
   1026c:	04412703          	lw	a4,68(sp)
   10270:	04012783          	lw	a5,64(sp)
   10274:	00e7e7b3          	or	a5,a5,a4
   10278:	04812703          	lw	a4,72(sp)
   1027c:	00e7e7b3          	or	a5,a5,a4
   10280:	04c12703          	lw	a4,76(sp)
   10284:	00e7e7b3          	or	a5,a5,a4
   10288:	fc078ee3          	beqz	a5,10264 <__multf3+0xfac>
   1028c:	04012623          	sw	zero,76(sp)
   10290:	04012423          	sw	zero,72(sp)
   10294:	04012223          	sw	zero,68(sp)
   10298:	04012023          	sw	zero,64(sp)
   1029c:	fc9ff06f          	j	10264 <__multf3+0xfac>
   102a0:	000087b7          	lui	a5,0x8
   102a4:	04012623          	sw	zero,76(sp)
   102a8:	04012423          	sw	zero,72(sp)
   102ac:	04012223          	sw	zero,68(sp)
   102b0:	04012023          	sw	zero,64(sp)
   102b4:	fff78793          	addi	a5,a5,-1 # 7fff <__gdtoa+0x11a3>
   102b8:	d5dff06f          	j	10014 <__multf3+0xd5c>

000102bc <__subtf3>:
   102bc:	f9010113          	addi	sp,sp,-112
   102c0:	0085a703          	lw	a4,8(a1)
   102c4:	05512a23          	sw	s5,84(sp)
   102c8:	00c5aa83          	lw	s5,12(a1)
   102cc:	0005a783          	lw	a5,0(a1)
   102d0:	0045a683          	lw	a3,4(a1)
   102d4:	02e12c23          	sw	a4,56(sp)
   102d8:	00e12c23          	sw	a4,24(sp)
   102dc:	010a9713          	slli	a4,s5,0x10
   102e0:	06912223          	sw	s1,100(sp)
   102e4:	01075713          	srli	a4,a4,0x10
   102e8:	001a9493          	slli	s1,s5,0x1
   102ec:	00462803          	lw	a6,4(a2)
   102f0:	00862583          	lw	a1,8(a2)
   102f4:	06812423          	sw	s0,104(sp)
   102f8:	07212023          	sw	s2,96(sp)
   102fc:	00062403          	lw	s0,0(a2)
   10300:	00c62903          	lw	s2,12(a2)
   10304:	05412c23          	sw	s4,88(sp)
   10308:	03512e23          	sw	s5,60(sp)
   1030c:	00050a13          	mv	s4,a0
   10310:	06112623          	sw	ra,108(sp)
   10314:	05312e23          	sw	s3,92(sp)
   10318:	05612823          	sw	s6,80(sp)
   1031c:	05712623          	sw	s7,76(sp)
   10320:	05812423          	sw	s8,72(sp)
   10324:	02f12823          	sw	a5,48(sp)
   10328:	02d12a23          	sw	a3,52(sp)
   1032c:	00f12823          	sw	a5,16(sp)
   10330:	00d12a23          	sw	a3,20(sp)
   10334:	00e12e23          	sw	a4,28(sp)
   10338:	0114d493          	srli	s1,s1,0x11
   1033c:	01fada93          	srli	s5,s5,0x1f
   10340:	01010513          	addi	a0,sp,16
   10344:	01c10613          	addi	a2,sp,28
   10348:	00062703          	lw	a4,0(a2)
   1034c:	ffc62683          	lw	a3,-4(a2)
   10350:	ffc60613          	addi	a2,a2,-4
   10354:	00371713          	slli	a4,a4,0x3
   10358:	01d6d693          	srli	a3,a3,0x1d
   1035c:	00d76733          	or	a4,a4,a3
   10360:	00e62223          	sw	a4,4(a2)
   10364:	fec512e3          	bne	a0,a2,10348 <__subtf3+0x8c>
   10368:	01091713          	slli	a4,s2,0x10
   1036c:	00191b93          	slli	s7,s2,0x1
   10370:	00379793          	slli	a5,a5,0x3
   10374:	01075713          	srli	a4,a4,0x10
   10378:	03012a23          	sw	a6,52(sp)
   1037c:	03212e23          	sw	s2,60(sp)
   10380:	03012223          	sw	a6,36(sp)
   10384:	00f12823          	sw	a5,16(sp)
   10388:	02812823          	sw	s0,48(sp)
   1038c:	02b12c23          	sw	a1,56(sp)
   10390:	02812023          	sw	s0,32(sp)
   10394:	02b12423          	sw	a1,40(sp)
   10398:	02e12623          	sw	a4,44(sp)
   1039c:	011bdb93          	srli	s7,s7,0x11
   103a0:	01f95913          	srli	s2,s2,0x1f
   103a4:	02010813          	addi	a6,sp,32
   103a8:	02c10313          	addi	t1,sp,44
   103ac:	00032703          	lw	a4,0(t1)
   103b0:	ffc32683          	lw	a3,-4(t1)
   103b4:	ffc30313          	addi	t1,t1,-4
   103b8:	00371713          	slli	a4,a4,0x3
   103bc:	01d6d693          	srli	a3,a3,0x1d
   103c0:	00d76733          	or	a4,a4,a3
   103c4:	00e32223          	sw	a4,4(t1)
   103c8:	fe6812e3          	bne	a6,t1,103ac <__subtf3+0xf0>
   103cc:	00341413          	slli	s0,s0,0x3
   103d0:	00008737          	lui	a4,0x8
   103d4:	02812023          	sw	s0,32(sp)
   103d8:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x11a3>
   103dc:	02eb9063          	bne	s7,a4,103fc <__subtf3+0x140>
   103e0:	02812683          	lw	a3,40(sp)
   103e4:	02412703          	lw	a4,36(sp)
   103e8:	00d76733          	or	a4,a4,a3
   103ec:	02c12683          	lw	a3,44(sp)
   103f0:	00d76733          	or	a4,a4,a3
   103f4:	00876733          	or	a4,a4,s0
   103f8:	00071463          	bnez	a4,10400 <__subtf3+0x144>
   103fc:	00194913          	xori	s2,s2,1
   10400:	417488b3          	sub	a7,s1,s7
   10404:	095916e3          	bne	s2,s5,10c90 <__subtf3+0x9d4>
   10408:	45105263          	blez	a7,1084c <__subtf3+0x590>
   1040c:	01412903          	lw	s2,20(sp)
   10410:	01812983          	lw	s3,24(sp)
   10414:	01c12b03          	lw	s6,28(sp)
   10418:	0a0b9263          	bnez	s7,104bc <__subtf3+0x200>
   1041c:	02412683          	lw	a3,36(sp)
   10420:	02812703          	lw	a4,40(sp)
   10424:	02c12583          	lw	a1,44(sp)
   10428:	00e6e633          	or	a2,a3,a4
   1042c:	00b66633          	or	a2,a2,a1
   10430:	00866633          	or	a2,a2,s0
   10434:	00061e63          	bnez	a2,10450 <__subtf3+0x194>
   10438:	02f12823          	sw	a5,48(sp)
   1043c:	03212a23          	sw	s2,52(sp)
   10440:	03312c23          	sw	s3,56(sp)
   10444:	03612e23          	sw	s6,60(sp)
   10448:	00088493          	mv	s1,a7
   1044c:	08c0006f          	j	104d8 <__subtf3+0x21c>
   10450:	fff88613          	addi	a2,a7,-1
   10454:	04061863          	bnez	a2,104a4 <__subtf3+0x1e8>
   10458:	00878433          	add	s0,a5,s0
   1045c:	01268933          	add	s2,a3,s2
   10460:	02812823          	sw	s0,48(sp)
   10464:	00f43433          	sltu	s0,s0,a5
   10468:	00890433          	add	s0,s2,s0
   1046c:	02812a23          	sw	s0,52(sp)
   10470:	00d936b3          	sltu	a3,s2,a3
   10474:	01243433          	sltu	s0,s0,s2
   10478:	013709b3          	add	s3,a4,s3
   1047c:	0086e6b3          	or	a3,a3,s0
   10480:	00d986b3          	add	a3,s3,a3
   10484:	02d12c23          	sw	a3,56(sp)
   10488:	00e9b7b3          	sltu	a5,s3,a4
   1048c:	0136b6b3          	sltu	a3,a3,s3
   10490:	00d7e7b3          	or	a5,a5,a3
   10494:	016585b3          	add	a1,a1,s6
   10498:	00b787b3          	add	a5,a5,a1
   1049c:	00100493          	li	s1,1
   104a0:	2fc0006f          	j	1079c <__subtf3+0x4e0>
   104a4:	00008737          	lui	a4,0x8
   104a8:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x11a3>
   104ac:	00e88463          	beq	a7,a4,104b4 <__subtf3+0x1f8>
   104b0:	2500106f          	j	11700 <__subtf3+0x1444>
   104b4:	02f12823          	sw	a5,48(sp)
   104b8:	4400006f          	j	108f8 <__subtf3+0x63c>
   104bc:	00008737          	lui	a4,0x8
   104c0:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x11a3>
   104c4:	16e49a63          	bne	s1,a4,10638 <__subtf3+0x37c>
   104c8:	02f12823          	sw	a5,48(sp)
   104cc:	03212a23          	sw	s2,52(sp)
   104d0:	03312c23          	sw	s3,56(sp)
   104d4:	03612e23          	sw	s6,60(sp)
   104d8:	03012783          	lw	a5,48(sp)
   104dc:	0077f713          	andi	a4,a5,7
   104e0:	04070463          	beqz	a4,10528 <__subtf3+0x26c>
   104e4:	00f7f713          	andi	a4,a5,15
   104e8:	00400693          	li	a3,4
   104ec:	02d70e63          	beq	a4,a3,10528 <__subtf3+0x26c>
   104f0:	03412703          	lw	a4,52(sp)
   104f4:	00478793          	addi	a5,a5,4
   104f8:	02f12823          	sw	a5,48(sp)
   104fc:	0047b793          	sltiu	a5,a5,4
   10500:	00f707b3          	add	a5,a4,a5
   10504:	02f12a23          	sw	a5,52(sp)
   10508:	00e7b7b3          	sltu	a5,a5,a4
   1050c:	03812703          	lw	a4,56(sp)
   10510:	00f707b3          	add	a5,a4,a5
   10514:	02f12c23          	sw	a5,56(sp)
   10518:	00e7b7b3          	sltu	a5,a5,a4
   1051c:	03c12703          	lw	a4,60(sp)
   10520:	00e787b3          	add	a5,a5,a4
   10524:	02f12e23          	sw	a5,60(sp)
   10528:	03c12783          	lw	a5,60(sp)
   1052c:	00c79713          	slli	a4,a5,0xc
   10530:	02075463          	bgez	a4,10558 <__subtf3+0x29c>
   10534:	00008737          	lui	a4,0x8
   10538:	00148493          	addi	s1,s1,1
   1053c:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x11a3>
   10540:	00e49463          	bne	s1,a4,10548 <__subtf3+0x28c>
   10544:	1a80106f          	j	116ec <__subtf3+0x1430>
   10548:	fff80737          	lui	a4,0xfff80
   1054c:	fff70713          	addi	a4,a4,-1 # fff7ffff <_memory_end+0xfff5ffff>
   10550:	00e7f7b3          	and	a5,a5,a4
   10554:	02f12e23          	sw	a5,60(sp)
   10558:	03010793          	addi	a5,sp,48
   1055c:	03c10613          	addi	a2,sp,60
   10560:	0007a703          	lw	a4,0(a5)
   10564:	0047a683          	lw	a3,4(a5)
   10568:	00478793          	addi	a5,a5,4
   1056c:	00375713          	srli	a4,a4,0x3
   10570:	01d69693          	slli	a3,a3,0x1d
   10574:	00d76733          	or	a4,a4,a3
   10578:	fee7ae23          	sw	a4,-4(a5)
   1057c:	fec792e3          	bne	a5,a2,10560 <__subtf3+0x2a4>
   10580:	03c12703          	lw	a4,60(sp)
   10584:	000086b7          	lui	a3,0x8
   10588:	fff68793          	addi	a5,a3,-1 # 7fff <__gdtoa+0x11a3>
   1058c:	00375713          	srli	a4,a4,0x3
   10590:	02e12e23          	sw	a4,60(sp)
   10594:	02f49a63          	bne	s1,a5,105c8 <__subtf3+0x30c>
   10598:	03412603          	lw	a2,52(sp)
   1059c:	03012783          	lw	a5,48(sp)
   105a0:	00c7e7b3          	or	a5,a5,a2
   105a4:	03812603          	lw	a2,56(sp)
   105a8:	00c7e7b3          	or	a5,a5,a2
   105ac:	00e7e7b3          	or	a5,a5,a4
   105b0:	00078c63          	beqz	a5,105c8 <__subtf3+0x30c>
   105b4:	02d12e23          	sw	a3,60(sp)
   105b8:	02012c23          	sw	zero,56(sp)
   105bc:	02012a23          	sw	zero,52(sp)
   105c0:	02012823          	sw	zero,48(sp)
   105c4:	00000a93          	li	s5,0
   105c8:	03c12783          	lw	a5,60(sp)
   105cc:	01149493          	slli	s1,s1,0x11
   105d0:	0114d493          	srli	s1,s1,0x11
   105d4:	00f11623          	sh	a5,12(sp)
   105d8:	03012783          	lw	a5,48(sp)
   105dc:	00fa9a93          	slli	s5,s5,0xf
   105e0:	009aeab3          	or	s5,s5,s1
   105e4:	00fa2023          	sw	a5,0(s4)
   105e8:	03412783          	lw	a5,52(sp)
   105ec:	01511723          	sh	s5,14(sp)
   105f0:	06c12083          	lw	ra,108(sp)
   105f4:	00fa2223          	sw	a5,4(s4)
   105f8:	03812783          	lw	a5,56(sp)
   105fc:	06812403          	lw	s0,104(sp)
   10600:	06412483          	lw	s1,100(sp)
   10604:	00fa2423          	sw	a5,8(s4)
   10608:	00c12783          	lw	a5,12(sp)
   1060c:	06012903          	lw	s2,96(sp)
   10610:	05c12983          	lw	s3,92(sp)
   10614:	00fa2623          	sw	a5,12(s4)
   10618:	05412a83          	lw	s5,84(sp)
   1061c:	05012b03          	lw	s6,80(sp)
   10620:	04c12b83          	lw	s7,76(sp)
   10624:	04812c03          	lw	s8,72(sp)
   10628:	000a0513          	mv	a0,s4
   1062c:	05812a03          	lw	s4,88(sp)
   10630:	07010113          	addi	sp,sp,112
   10634:	00008067          	ret
   10638:	02c12703          	lw	a4,44(sp)
   1063c:	000806b7          	lui	a3,0x80
   10640:	00d76733          	or	a4,a4,a3
   10644:	02e12623          	sw	a4,44(sp)
   10648:	07400713          	li	a4,116
   1064c:	01175463          	bge	a4,a7,10654 <__subtf3+0x398>
   10650:	0bc0106f          	j	1170c <__subtf3+0x1450>
   10654:	00088613          	mv	a2,a7
   10658:	40565693          	srai	a3,a2,0x5
   1065c:	00030513          	mv	a0,t1
   10660:	01f67613          	andi	a2,a2,31
   10664:	00000713          	li	a4,0
   10668:	00000593          	li	a1,0
   1066c:	02d59c63          	bne	a1,a3,106a4 <__subtf3+0x3e8>
   10670:	00300593          	li	a1,3
   10674:	40d585b3          	sub	a1,a1,a3
   10678:	00269513          	slli	a0,a3,0x2
   1067c:	02061e63          	bnez	a2,106b8 <__subtf3+0x3fc>
   10680:	00a308b3          	add	a7,t1,a0
   10684:	0008a883          	lw	a7,0(a7)
   10688:	00160613          	addi	a2,a2,1
   1068c:	00430313          	addi	t1,t1,4
   10690:	ff132e23          	sw	a7,-4(t1)
   10694:	fec5d6e3          	bge	a1,a2,10680 <__subtf3+0x3c4>
   10698:	00400613          	li	a2,4
   1069c:	40d606b3          	sub	a3,a2,a3
   106a0:	0640006f          	j	10704 <__subtf3+0x448>
   106a4:	00052883          	lw	a7,0(a0)
   106a8:	00158593          	addi	a1,a1,1
   106ac:	00450513          	addi	a0,a0,4
   106b0:	01176733          	or	a4,a4,a7
   106b4:	fb9ff06f          	j	1066c <__subtf3+0x3b0>
   106b8:	04050893          	addi	a7,a0,64
   106bc:	002888b3          	add	a7,a7,sp
   106c0:	fe08a883          	lw	a7,-32(a7)
   106c4:	02000e13          	li	t3,32
   106c8:	40ce0e33          	sub	t3,t3,a2
   106cc:	01c898b3          	sll	a7,a7,t3
   106d0:	01176733          	or	a4,a4,a7
   106d4:	00000e93          	li	t4,0
   106d8:	00a808b3          	add	a7,a6,a0
   106dc:	40a00533          	neg	a0,a0
   106e0:	14bec263          	blt	t4,a1,10824 <__subtf3+0x568>
   106e4:	00400513          	li	a0,4
   106e8:	40d506b3          	sub	a3,a0,a3
   106ec:	02c12503          	lw	a0,44(sp)
   106f0:	00259593          	slli	a1,a1,0x2
   106f4:	04058593          	addi	a1,a1,64
   106f8:	002585b3          	add	a1,a1,sp
   106fc:	00c55633          	srl	a2,a0,a2
   10700:	fec5a023          	sw	a2,-32(a1)
   10704:	00400613          	li	a2,4
   10708:	40d60633          	sub	a2,a2,a3
   1070c:	00261613          	slli	a2,a2,0x2
   10710:	00269693          	slli	a3,a3,0x2
   10714:	00800593          	li	a1,8
   10718:	00d806b3          	add	a3,a6,a3
   1071c:	00b66a63          	bltu	a2,a1,10730 <__subtf3+0x474>
   10720:	0006a023          	sw	zero,0(a3) # 80000 <_memory_end+0x60000>
   10724:	0006a223          	sw	zero,4(a3)
   10728:	ff860613          	addi	a2,a2,-8
   1072c:	00868693          	addi	a3,a3,8
   10730:	00400593          	li	a1,4
   10734:	00b66463          	bltu	a2,a1,1073c <__subtf3+0x480>
   10738:	0006a023          	sw	zero,0(a3)
   1073c:	02012683          	lw	a3,32(sp)
   10740:	00e03733          	snez	a4,a4
   10744:	00d76733          	or	a4,a4,a3
   10748:	02412683          	lw	a3,36(sp)
   1074c:	02e12023          	sw	a4,32(sp)
   10750:	00e78733          	add	a4,a5,a4
   10754:	01268933          	add	s2,a3,s2
   10758:	02e12823          	sw	a4,48(sp)
   1075c:	00f73733          	sltu	a4,a4,a5
   10760:	02812783          	lw	a5,40(sp)
   10764:	00e90733          	add	a4,s2,a4
   10768:	02e12a23          	sw	a4,52(sp)
   1076c:	00d936b3          	sltu	a3,s2,a3
   10770:	01273733          	sltu	a4,a4,s2
   10774:	013789b3          	add	s3,a5,s3
   10778:	00e6e733          	or	a4,a3,a4
   1077c:	00e98733          	add	a4,s3,a4
   10780:	02e12c23          	sw	a4,56(sp)
   10784:	00f9b7b3          	sltu	a5,s3,a5
   10788:	01373733          	sltu	a4,a4,s3
   1078c:	00e7e7b3          	or	a5,a5,a4
   10790:	02c12703          	lw	a4,44(sp)
   10794:	00eb0733          	add	a4,s6,a4
   10798:	00e787b3          	add	a5,a5,a4
   1079c:	02f12e23          	sw	a5,60(sp)
   107a0:	00c79713          	slli	a4,a5,0xc
   107a4:	d2075ae3          	bgez	a4,104d8 <__subtf3+0x21c>
   107a8:	03012683          	lw	a3,48(sp)
   107ac:	fff80737          	lui	a4,0xfff80
   107b0:	fff70713          	addi	a4,a4,-1 # fff7ffff <_memory_end+0xfff5ffff>
   107b4:	00e7f7b3          	and	a5,a5,a4
   107b8:	02f12e23          	sw	a5,60(sp)
   107bc:	00148493          	addi	s1,s1,1
   107c0:	01f69693          	slli	a3,a3,0x1f
   107c4:	03010713          	addi	a4,sp,48
   107c8:	03c10513          	addi	a0,sp,60
   107cc:	00072603          	lw	a2,0(a4)
   107d0:	00472583          	lw	a1,4(a4)
   107d4:	00470713          	addi	a4,a4,4
   107d8:	00165613          	srli	a2,a2,0x1
   107dc:	01f59593          	slli	a1,a1,0x1f
   107e0:	00b66633          	or	a2,a2,a1
   107e4:	fec72e23          	sw	a2,-4(a4)
   107e8:	fee512e3          	bne	a0,a4,107cc <__subtf3+0x510>
   107ec:	03012703          	lw	a4,48(sp)
   107f0:	0017d793          	srli	a5,a5,0x1
   107f4:	02f12e23          	sw	a5,60(sp)
   107f8:	00d037b3          	snez	a5,a3
   107fc:	00f767b3          	or	a5,a4,a5
   10800:	02f12823          	sw	a5,48(sp)
   10804:	000087b7          	lui	a5,0x8
   10808:	fff78793          	addi	a5,a5,-1 # 7fff <__gdtoa+0x11a3>
   1080c:	ccf496e3          	bne	s1,a5,104d8 <__subtf3+0x21c>
   10810:	02012e23          	sw	zero,60(sp)
   10814:	02012c23          	sw	zero,56(sp)
   10818:	02012a23          	sw	zero,52(sp)
   1081c:	02012823          	sw	zero,48(sp)
   10820:	cb9ff06f          	j	104d8 <__subtf3+0x21c>
   10824:	0008a303          	lw	t1,0(a7)
   10828:	0048af03          	lw	t5,4(a7)
   1082c:	00a88fb3          	add	t6,a7,a0
   10830:	00c35333          	srl	t1,t1,a2
   10834:	01cf1f33          	sll	t5,t5,t3
   10838:	01e36333          	or	t1,t1,t5
   1083c:	006fa023          	sw	t1,0(t6)
   10840:	001e8e93          	addi	t4,t4,1
   10844:	00488893          	addi	a7,a7,4
   10848:	e99ff06f          	j	106e0 <__subtf3+0x424>
   1084c:	02412903          	lw	s2,36(sp)
   10850:	02812983          	lw	s3,40(sp)
   10854:	02c12b03          	lw	s6,44(sp)
   10858:	26088263          	beqz	a7,10abc <__subtf3+0x800>
   1085c:	409b8833          	sub	a6,s7,s1
   10860:	0a049c63          	bnez	s1,10918 <__subtf3+0x65c>
   10864:	01412683          	lw	a3,20(sp)
   10868:	01812703          	lw	a4,24(sp)
   1086c:	01c12883          	lw	a7,28(sp)
   10870:	00e6e5b3          	or	a1,a3,a4
   10874:	0115e5b3          	or	a1,a1,a7
   10878:	00f5e5b3          	or	a1,a1,a5
   1087c:	00059e63          	bnez	a1,10898 <__subtf3+0x5dc>
   10880:	02812823          	sw	s0,48(sp)
   10884:	03212a23          	sw	s2,52(sp)
   10888:	03312c23          	sw	s3,56(sp)
   1088c:	03612e23          	sw	s6,60(sp)
   10890:	00080493          	mv	s1,a6
   10894:	c45ff06f          	j	104d8 <__subtf3+0x21c>
   10898:	fff80593          	addi	a1,a6,-1
   1089c:	04059663          	bnez	a1,108e8 <__subtf3+0x62c>
   108a0:	00878433          	add	s0,a5,s0
   108a4:	01268933          	add	s2,a3,s2
   108a8:	02812823          	sw	s0,48(sp)
   108ac:	00f43433          	sltu	s0,s0,a5
   108b0:	00890433          	add	s0,s2,s0
   108b4:	02812a23          	sw	s0,52(sp)
   108b8:	00d936b3          	sltu	a3,s2,a3
   108bc:	01243433          	sltu	s0,s0,s2
   108c0:	013709b3          	add	s3,a4,s3
   108c4:	0086e6b3          	or	a3,a3,s0
   108c8:	00d986b3          	add	a3,s3,a3
   108cc:	02d12c23          	sw	a3,56(sp)
   108d0:	00e9b7b3          	sltu	a5,s3,a4
   108d4:	0136b6b3          	sltu	a3,a3,s3
   108d8:	00d7e7b3          	or	a5,a5,a3
   108dc:	016888b3          	add	a7,a7,s6
   108e0:	011787b3          	add	a5,a5,a7
   108e4:	bb9ff06f          	j	1049c <__subtf3+0x1e0>
   108e8:	000087b7          	lui	a5,0x8
   108ec:	fff78793          	addi	a5,a5,-1 # 7fff <__gdtoa+0x11a3>
   108f0:	62f818e3          	bne	a6,a5,11720 <__subtf3+0x1464>
   108f4:	02812823          	sw	s0,48(sp)
   108f8:	03212a23          	sw	s2,52(sp)
   108fc:	03312c23          	sw	s3,56(sp)
   10900:	03612e23          	sw	s6,60(sp)
   10904:	000084b7          	lui	s1,0x8
   10908:	fff48493          	addi	s1,s1,-1 # 7fff <__gdtoa+0x11a3>
   1090c:	bcdff06f          	j	104d8 <__subtf3+0x21c>
   10910:	00078413          	mv	s0,a5
   10914:	fe1ff06f          	j	108f4 <__subtf3+0x638>
   10918:	000087b7          	lui	a5,0x8
   1091c:	fff78793          	addi	a5,a5,-1 # 7fff <__gdtoa+0x11a3>
   10920:	fcfb8ae3          	beq	s7,a5,108f4 <__subtf3+0x638>
   10924:	01c12783          	lw	a5,28(sp)
   10928:	00080737          	lui	a4,0x80
   1092c:	00e7e7b3          	or	a5,a5,a4
   10930:	00f12e23          	sw	a5,28(sp)
   10934:	07400793          	li	a5,116
   10938:	5f07c8e3          	blt	a5,a6,11728 <__subtf3+0x146c>
   1093c:	00080593          	mv	a1,a6
   10940:	02000713          	li	a4,32
   10944:	02e5c733          	div	a4,a1,a4
   10948:	00060693          	mv	a3,a2
   1094c:	00000493          	li	s1,0
   10950:	00000793          	li	a5,0
   10954:	02e7ce63          	blt	a5,a4,10990 <__subtf3+0x6d4>
   10958:	00300793          	li	a5,3
   1095c:	01f5f893          	andi	a7,a1,31
   10960:	40e787b3          	sub	a5,a5,a4
   10964:	00271813          	slli	a6,a4,0x2
   10968:	02089e63          	bnez	a7,109a4 <__subtf3+0x6e8>
   1096c:	010606b3          	add	a3,a2,a6
   10970:	0006a683          	lw	a3,0(a3)
   10974:	00188893          	addi	a7,a7,1
   10978:	00460613          	addi	a2,a2,4
   1097c:	fed62e23          	sw	a3,-4(a2)
   10980:	ff17d6e3          	bge	a5,a7,1096c <__subtf3+0x6b0>
   10984:	00400793          	li	a5,4
   10988:	40e78733          	sub	a4,a5,a4
   1098c:	0780006f          	j	10a04 <__subtf3+0x748>
   10990:	0006a803          	lw	a6,0(a3)
   10994:	00178793          	addi	a5,a5,1
   10998:	00468693          	addi	a3,a3,4
   1099c:	0104e4b3          	or	s1,s1,a6
   109a0:	fb5ff06f          	j	10954 <__subtf3+0x698>
   109a4:	02000693          	li	a3,32
   109a8:	02d5e5b3          	rem	a1,a1,a3
   109ac:	40b685b3          	sub	a1,a3,a1
   109b0:	00070693          	mv	a3,a4
   109b4:	00075463          	bgez	a4,109bc <__subtf3+0x700>
   109b8:	00000693          	li	a3,0
   109bc:	00269693          	slli	a3,a3,0x2
   109c0:	04068693          	addi	a3,a3,64
   109c4:	002686b3          	add	a3,a3,sp
   109c8:	fd06a683          	lw	a3,-48(a3)
   109cc:	00000313          	li	t1,0
   109d0:	00b696b3          	sll	a3,a3,a1
   109d4:	00d4e4b3          	or	s1,s1,a3
   109d8:	010506b3          	add	a3,a0,a6
   109dc:	41000833          	neg	a6,a6
   109e0:	0af34a63          	blt	t1,a5,10a94 <__subtf3+0x7d8>
   109e4:	00400693          	li	a3,4
   109e8:	40e68733          	sub	a4,a3,a4
   109ec:	01c12683          	lw	a3,28(sp)
   109f0:	00279793          	slli	a5,a5,0x2
   109f4:	04078793          	addi	a5,a5,64
   109f8:	002787b3          	add	a5,a5,sp
   109fc:	0116d6b3          	srl	a3,a3,a7
   10a00:	fcd7a823          	sw	a3,-48(a5)
   10a04:	00572793          	slti	a5,a4,5
   10a08:	00000613          	li	a2,0
   10a0c:	00078863          	beqz	a5,10a1c <__subtf3+0x760>
   10a10:	00400613          	li	a2,4
   10a14:	40e60633          	sub	a2,a2,a4
   10a18:	00261613          	slli	a2,a2,0x2
   10a1c:	00271713          	slli	a4,a4,0x2
   10a20:	00e50533          	add	a0,a0,a4
   10a24:	00000593          	li	a1,0
   10a28:	fb0f50ef          	jal	61d8 <memset>
   10a2c:	01012703          	lw	a4,16(sp)
   10a30:	009037b3          	snez	a5,s1
   10a34:	00e7e7b3          	or	a5,a5,a4
   10a38:	01412683          	lw	a3,20(sp)
   10a3c:	00f12823          	sw	a5,16(sp)
   10a40:	00f407b3          	add	a5,s0,a5
   10a44:	01268933          	add	s2,a3,s2
   10a48:	02f12823          	sw	a5,48(sp)
   10a4c:	0087b7b3          	sltu	a5,a5,s0
   10a50:	00f90733          	add	a4,s2,a5
   10a54:	01812783          	lw	a5,24(sp)
   10a58:	02e12a23          	sw	a4,52(sp)
   10a5c:	00d936b3          	sltu	a3,s2,a3
   10a60:	01273733          	sltu	a4,a4,s2
   10a64:	013789b3          	add	s3,a5,s3
   10a68:	00e6e733          	or	a4,a3,a4
   10a6c:	00e98733          	add	a4,s3,a4
   10a70:	02e12c23          	sw	a4,56(sp)
   10a74:	00f9b7b3          	sltu	a5,s3,a5
   10a78:	01373733          	sltu	a4,a4,s3
   10a7c:	00e7e7b3          	or	a5,a5,a4
   10a80:	01c12703          	lw	a4,28(sp)
   10a84:	000b8493          	mv	s1,s7
   10a88:	00eb0733          	add	a4,s6,a4
   10a8c:	00e787b3          	add	a5,a5,a4
   10a90:	d0dff06f          	j	1079c <__subtf3+0x4e0>
   10a94:	0006a603          	lw	a2,0(a3)
   10a98:	0046ae03          	lw	t3,4(a3)
   10a9c:	01068eb3          	add	t4,a3,a6
   10aa0:	01165633          	srl	a2,a2,a7
   10aa4:	00be1e33          	sll	t3,t3,a1
   10aa8:	01c66633          	or	a2,a2,t3
   10aac:	00cea023          	sw	a2,0(t4)
   10ab0:	00130313          	addi	t1,t1,1
   10ab4:	00468693          	addi	a3,a3,4
   10ab8:	f29ff06f          	j	109e0 <__subtf3+0x724>
   10abc:	00148813          	addi	a6,s1,1
   10ac0:	01181893          	slli	a7,a6,0x11
   10ac4:	0128d893          	srli	a7,a7,0x12
   10ac8:	01412683          	lw	a3,20(sp)
   10acc:	01812703          	lw	a4,24(sp)
   10ad0:	01c12603          	lw	a2,28(sp)
   10ad4:	03010593          	addi	a1,sp,48
   10ad8:	03c10513          	addi	a0,sp,60
   10adc:	10089e63          	bnez	a7,10bf8 <__subtf3+0x93c>
   10ae0:	00e6e833          	or	a6,a3,a4
   10ae4:	00c86833          	or	a6,a6,a2
   10ae8:	00f86833          	or	a6,a6,a5
   10aec:	0a049863          	bnez	s1,10b9c <__subtf3+0x8e0>
   10af0:	00081e63          	bnez	a6,10b0c <__subtf3+0x850>
   10af4:	02812823          	sw	s0,48(sp)
   10af8:	03212a23          	sw	s2,52(sp)
   10afc:	03312c23          	sw	s3,56(sp)
   10b00:	03612e23          	sw	s6,60(sp)
   10b04:	00000493          	li	s1,0
   10b08:	9d1ff06f          	j	104d8 <__subtf3+0x21c>
   10b0c:	013965b3          	or	a1,s2,s3
   10b10:	0165e5b3          	or	a1,a1,s6
   10b14:	0085e5b3          	or	a1,a1,s0
   10b18:	00059c63          	bnez	a1,10b30 <__subtf3+0x874>
   10b1c:	02f12823          	sw	a5,48(sp)
   10b20:	02d12a23          	sw	a3,52(sp)
   10b24:	02e12c23          	sw	a4,56(sp)
   10b28:	02c12e23          	sw	a2,60(sp)
   10b2c:	9adff06f          	j	104d8 <__subtf3+0x21c>
   10b30:	00878433          	add	s0,a5,s0
   10b34:	01268933          	add	s2,a3,s2
   10b38:	02812823          	sw	s0,48(sp)
   10b3c:	00f43433          	sltu	s0,s0,a5
   10b40:	00890433          	add	s0,s2,s0
   10b44:	02812a23          	sw	s0,52(sp)
   10b48:	00d936b3          	sltu	a3,s2,a3
   10b4c:	01243433          	sltu	s0,s0,s2
   10b50:	013709b3          	add	s3,a4,s3
   10b54:	0086e6b3          	or	a3,a3,s0
   10b58:	00d986b3          	add	a3,s3,a3
   10b5c:	02d12c23          	sw	a3,56(sp)
   10b60:	00e9b733          	sltu	a4,s3,a4
   10b64:	0136b6b3          	sltu	a3,a3,s3
   10b68:	00d76733          	or	a4,a4,a3
   10b6c:	01660633          	add	a2,a2,s6
   10b70:	00c70733          	add	a4,a4,a2
   10b74:	00c71793          	slli	a5,a4,0xc
   10b78:	0007c663          	bltz	a5,10b84 <__subtf3+0x8c8>
   10b7c:	02e12e23          	sw	a4,60(sp)
   10b80:	959ff06f          	j	104d8 <__subtf3+0x21c>
   10b84:	fff807b7          	lui	a5,0xfff80
   10b88:	fff78793          	addi	a5,a5,-1 # fff7ffff <_memory_end+0xfff5ffff>
   10b8c:	00f77733          	and	a4,a4,a5
   10b90:	02e12e23          	sw	a4,60(sp)
   10b94:	00100493          	li	s1,1
   10b98:	941ff06f          	j	104d8 <__subtf3+0x21c>
   10b9c:	1a080463          	beqz	a6,10d44 <__subtf3+0xa88>
   10ba0:	01396933          	or	s2,s2,s3
   10ba4:	01696933          	or	s2,s2,s6
   10ba8:	00896933          	or	s2,s2,s0
   10bac:	1a090063          	beqz	s2,10d4c <__subtf3+0xa90>
   10bb0:	000087b7          	lui	a5,0x8
   10bb4:	02f12e23          	sw	a5,60(sp)
   10bb8:	02012c23          	sw	zero,56(sp)
   10bbc:	02012a23          	sw	zero,52(sp)
   10bc0:	02012823          	sw	zero,48(sp)
   10bc4:	00050793          	mv	a5,a0
   10bc8:	0007a703          	lw	a4,0(a5) # 8000 <__gdtoa+0x11a4>
   10bcc:	ffc7a683          	lw	a3,-4(a5)
   10bd0:	ffc78793          	addi	a5,a5,-4
   10bd4:	00371713          	slli	a4,a4,0x3
   10bd8:	01d6d693          	srli	a3,a3,0x1d
   10bdc:	00d76733          	or	a4,a4,a3
   10be0:	00e7a223          	sw	a4,4(a5)
   10be4:	fef592e3          	bne	a1,a5,10bc8 <__subtf3+0x90c>
   10be8:	000084b7          	lui	s1,0x8
   10bec:	fff48493          	addi	s1,s1,-1 # 7fff <__gdtoa+0x11a3>
   10bf0:	00000a93          	li	s5,0
   10bf4:	8e5ff06f          	j	104d8 <__subtf3+0x21c>
   10bf8:	00878433          	add	s0,a5,s0
   10bfc:	01268933          	add	s2,a3,s2
   10c00:	02812823          	sw	s0,48(sp)
   10c04:	00f43433          	sltu	s0,s0,a5
   10c08:	00890433          	add	s0,s2,s0
   10c0c:	02812a23          	sw	s0,52(sp)
   10c10:	00d936b3          	sltu	a3,s2,a3
   10c14:	01243433          	sltu	s0,s0,s2
   10c18:	013709b3          	add	s3,a4,s3
   10c1c:	0086e6b3          	or	a3,a3,s0
   10c20:	00d986b3          	add	a3,s3,a3
   10c24:	02d12c23          	sw	a3,56(sp)
   10c28:	00e9b733          	sltu	a4,s3,a4
   10c2c:	0136b6b3          	sltu	a3,a3,s3
   10c30:	00d76733          	or	a4,a4,a3
   10c34:	01660633          	add	a2,a2,s6
   10c38:	00c70733          	add	a4,a4,a2
   10c3c:	02e12e23          	sw	a4,60(sp)
   10c40:	00058793          	mv	a5,a1
   10c44:	0007a683          	lw	a3,0(a5)
   10c48:	0047a603          	lw	a2,4(a5)
   10c4c:	00478793          	addi	a5,a5,4
   10c50:	0016d693          	srli	a3,a3,0x1
   10c54:	01f61613          	slli	a2,a2,0x1f
   10c58:	00c6e6b3          	or	a3,a3,a2
   10c5c:	fed7ae23          	sw	a3,-4(a5)
   10c60:	fef512e3          	bne	a0,a5,10c44 <__subtf3+0x988>
   10c64:	000087b7          	lui	a5,0x8
   10c68:	fff78793          	addi	a5,a5,-1 # 7fff <__gdtoa+0x11a3>
   10c6c:	00f80863          	beq	a6,a5,10c7c <__subtf3+0x9c0>
   10c70:	00175713          	srli	a4,a4,0x1
   10c74:	02e12e23          	sw	a4,60(sp)
   10c78:	c19ff06f          	j	10890 <__subtf3+0x5d4>
   10c7c:	02012e23          	sw	zero,60(sp)
   10c80:	02012c23          	sw	zero,56(sp)
   10c84:	02012a23          	sw	zero,52(sp)
   10c88:	02012823          	sw	zero,48(sp)
   10c8c:	c05ff06f          	j	10890 <__subtf3+0x5d4>
   10c90:	29105c63          	blez	a7,10f28 <__subtf3+0xc6c>
   10c94:	01412903          	lw	s2,20(sp)
   10c98:	01812983          	lw	s3,24(sp)
   10c9c:	01c12b03          	lw	s6,28(sp)
   10ca0:	0a0b9e63          	bnez	s7,10d5c <__subtf3+0xaa0>
   10ca4:	02412e03          	lw	t3,36(sp)
   10ca8:	02812503          	lw	a0,40(sp)
   10cac:	02c12683          	lw	a3,44(sp)
   10cb0:	00ae6733          	or	a4,t3,a0
   10cb4:	00d76733          	or	a4,a4,a3
   10cb8:	00876733          	or	a4,a4,s0
   10cbc:	f6070e63          	beqz	a4,10438 <__subtf3+0x17c>
   10cc0:	fff88e93          	addi	t4,a7,-1
   10cc4:	040e9c63          	bnez	t4,10d1c <__subtf3+0xa60>
   10cc8:	40878733          	sub	a4,a5,s0
   10ccc:	41c90633          	sub	a2,s2,t3
   10cd0:	00e7b5b3          	sltu	a1,a5,a4
   10cd4:	00c93833          	sltu	a6,s2,a2
   10cd8:	40b60633          	sub	a2,a2,a1
   10cdc:	00000593          	li	a1,0
   10ce0:	00e7f663          	bgeu	a5,a4,10cec <__subtf3+0xa30>
   10ce4:	412e0e33          	sub	t3,t3,s2
   10ce8:	001e3593          	seqz	a1,t3
   10cec:	0105e7b3          	or	a5,a1,a6
   10cf0:	40a985b3          	sub	a1,s3,a0
   10cf4:	00b9b833          	sltu	a6,s3,a1
   10cf8:	40f585b3          	sub	a1,a1,a5
   10cfc:	00078663          	beqz	a5,10d08 <__subtf3+0xa4c>
   10d00:	41350533          	sub	a0,a0,s3
   10d04:	00153e93          	seqz	t4,a0
   10d08:	40db07b3          	sub	a5,s6,a3
   10d0c:	010ee6b3          	or	a3,t4,a6
   10d10:	40d787b3          	sub	a5,a5,a3
   10d14:	00100493          	li	s1,1
   10d18:	1bc0006f          	j	10ed4 <__subtf3+0xc18>
   10d1c:	00008737          	lui	a4,0x8
   10d20:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x11a3>
   10d24:	f8e88863          	beq	a7,a4,104b4 <__subtf3+0x1f8>
   10d28:	07400713          	li	a4,116
   10d2c:	05d75c63          	bge	a4,t4,10d84 <__subtf3+0xac8>
   10d30:	02012623          	sw	zero,44(sp)
   10d34:	02012423          	sw	zero,40(sp)
   10d38:	02012223          	sw	zero,36(sp)
   10d3c:	00100713          	li	a4,1
   10d40:	1340006f          	j	10e74 <__subtf3+0xbb8>
   10d44:	00040793          	mv	a5,s0
   10d48:	f6cff06f          	j	104b4 <__subtf3+0x1f8>
   10d4c:	00068913          	mv	s2,a3
   10d50:	00070993          	mv	s3,a4
   10d54:	00060b13          	mv	s6,a2
   10d58:	f5cff06f          	j	104b4 <__subtf3+0x1f8>
   10d5c:	00008737          	lui	a4,0x8
   10d60:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x11a3>
   10d64:	bae486e3          	beq	s1,a4,10910 <__subtf3+0x654>
   10d68:	02c12703          	lw	a4,44(sp)
   10d6c:	000806b7          	lui	a3,0x80
   10d70:	00d76733          	or	a4,a4,a3
   10d74:	02e12623          	sw	a4,44(sp)
   10d78:	07400713          	li	a4,116
   10d7c:	fb174ae3          	blt	a4,a7,10d30 <__subtf3+0xa74>
   10d80:	00088e93          	mv	t4,a7
   10d84:	405ed693          	srai	a3,t4,0x5
   10d88:	00030593          	mv	a1,t1
   10d8c:	01fefe93          	andi	t4,t4,31
   10d90:	00000713          	li	a4,0
   10d94:	00000613          	li	a2,0
   10d98:	02d61c63          	bne	a2,a3,10dd0 <__subtf3+0xb14>
   10d9c:	00300613          	li	a2,3
   10da0:	40d60633          	sub	a2,a2,a3
   10da4:	00269593          	slli	a1,a3,0x2
   10da8:	020e9e63          	bnez	t4,10de4 <__subtf3+0xb28>
   10dac:	00b30533          	add	a0,t1,a1
   10db0:	00052503          	lw	a0,0(a0)
   10db4:	001e8e93          	addi	t4,t4,1
   10db8:	00430313          	addi	t1,t1,4
   10dbc:	fea32e23          	sw	a0,-4(t1)
   10dc0:	ffd656e3          	bge	a2,t4,10dac <__subtf3+0xaf0>
   10dc4:	00400613          	li	a2,4
   10dc8:	40d606b3          	sub	a3,a2,a3
   10dcc:	0640006f          	j	10e30 <__subtf3+0xb74>
   10dd0:	0005a503          	lw	a0,0(a1)
   10dd4:	00160613          	addi	a2,a2,1
   10dd8:	00458593          	addi	a1,a1,4
   10ddc:	00a76733          	or	a4,a4,a0
   10de0:	fb9ff06f          	j	10d98 <__subtf3+0xadc>
   10de4:	04058513          	addi	a0,a1,64
   10de8:	00250533          	add	a0,a0,sp
   10dec:	fe052503          	lw	a0,-32(a0)
   10df0:	02000313          	li	t1,32
   10df4:	41d30333          	sub	t1,t1,t4
   10df8:	00651533          	sll	a0,a0,t1
   10dfc:	00a76733          	or	a4,a4,a0
   10e00:	00000e13          	li	t3,0
   10e04:	00b80533          	add	a0,a6,a1
   10e08:	40b005b3          	neg	a1,a1
   10e0c:	0ece4a63          	blt	t3,a2,10f00 <__subtf3+0xc44>
   10e10:	00400593          	li	a1,4
   10e14:	40d586b3          	sub	a3,a1,a3
   10e18:	02c12583          	lw	a1,44(sp)
   10e1c:	00261613          	slli	a2,a2,0x2
   10e20:	04060613          	addi	a2,a2,64
   10e24:	00260633          	add	a2,a2,sp
   10e28:	01d5d5b3          	srl	a1,a1,t4
   10e2c:	feb62023          	sw	a1,-32(a2)
   10e30:	00400613          	li	a2,4
   10e34:	40d60633          	sub	a2,a2,a3
   10e38:	00261613          	slli	a2,a2,0x2
   10e3c:	00269693          	slli	a3,a3,0x2
   10e40:	00800593          	li	a1,8
   10e44:	00d806b3          	add	a3,a6,a3
   10e48:	00b66a63          	bltu	a2,a1,10e5c <__subtf3+0xba0>
   10e4c:	0006a023          	sw	zero,0(a3) # 80000 <_memory_end+0x60000>
   10e50:	0006a223          	sw	zero,4(a3)
   10e54:	ff860613          	addi	a2,a2,-8
   10e58:	00868693          	addi	a3,a3,8
   10e5c:	00400593          	li	a1,4
   10e60:	00b66463          	bltu	a2,a1,10e68 <__subtf3+0xbac>
   10e64:	0006a023          	sw	zero,0(a3)
   10e68:	02012683          	lw	a3,32(sp)
   10e6c:	00e03733          	snez	a4,a4
   10e70:	00d76733          	or	a4,a4,a3
   10e74:	02412583          	lw	a1,36(sp)
   10e78:	02e12023          	sw	a4,32(sp)
   10e7c:	40e78733          	sub	a4,a5,a4
   10e80:	40b90633          	sub	a2,s2,a1
   10e84:	00e7b6b3          	sltu	a3,a5,a4
   10e88:	00c93533          	sltu	a0,s2,a2
   10e8c:	40d60633          	sub	a2,a2,a3
   10e90:	00000693          	li	a3,0
   10e94:	00e7f663          	bgeu	a5,a4,10ea0 <__subtf3+0xbe4>
   10e98:	412585b3          	sub	a1,a1,s2
   10e9c:	0015b693          	seqz	a3,a1
   10ea0:	00a6e7b3          	or	a5,a3,a0
   10ea4:	02812503          	lw	a0,40(sp)
   10ea8:	00000693          	li	a3,0
   10eac:	40a985b3          	sub	a1,s3,a0
   10eb0:	00b9b833          	sltu	a6,s3,a1
   10eb4:	40f585b3          	sub	a1,a1,a5
   10eb8:	00078663          	beqz	a5,10ec4 <__subtf3+0xc08>
   10ebc:	41350533          	sub	a0,a0,s3
   10ec0:	00153693          	seqz	a3,a0
   10ec4:	02c12783          	lw	a5,44(sp)
   10ec8:	0106e6b3          	or	a3,a3,a6
   10ecc:	40fb07b3          	sub	a5,s6,a5
   10ed0:	40d787b3          	sub	a5,a5,a3
   10ed4:	02e12823          	sw	a4,48(sp)
   10ed8:	02f12e23          	sw	a5,60(sp)
   10edc:	02b12c23          	sw	a1,56(sp)
   10ee0:	02c12a23          	sw	a2,52(sp)
   10ee4:	00c79713          	slli	a4,a5,0xc
   10ee8:	de075863          	bgez	a4,104d8 <__subtf3+0x21c>
   10eec:	00080737          	lui	a4,0x80
   10ef0:	fff70713          	addi	a4,a4,-1 # 7ffff <_memory_end+0x5ffff>
   10ef4:	00e7f7b3          	and	a5,a5,a4
   10ef8:	02f12e23          	sw	a5,60(sp)
   10efc:	5700006f          	j	1146c <__subtf3+0x11b0>
   10f00:	00052883          	lw	a7,0(a0)
   10f04:	00452f03          	lw	t5,4(a0)
   10f08:	00b50fb3          	add	t6,a0,a1
   10f0c:	01d8d8b3          	srl	a7,a7,t4
   10f10:	006f1f33          	sll	t5,t5,t1
   10f14:	01e8e8b3          	or	a7,a7,t5
   10f18:	011fa023          	sw	a7,0(t6)
   10f1c:	001e0e13          	addi	t3,t3,1
   10f20:	00450513          	addi	a0,a0,4
   10f24:	ee9ff06f          	j	10e0c <__subtf3+0xb50>
   10f28:	02412c03          	lw	s8,36(sp)
   10f2c:	02812b03          	lw	s6,40(sp)
   10f30:	02c12983          	lw	s3,44(sp)
   10f34:	28088463          	beqz	a7,111bc <__subtf3+0xf00>
   10f38:	409b8333          	sub	t1,s7,s1
   10f3c:	0a049e63          	bnez	s1,10ff8 <__subtf3+0xd3c>
   10f40:	01412583          	lw	a1,20(sp)
   10f44:	01812803          	lw	a6,24(sp)
   10f48:	01c12683          	lw	a3,28(sp)
   10f4c:	0105e8b3          	or	a7,a1,a6
   10f50:	00d8e8b3          	or	a7,a7,a3
   10f54:	00f8e8b3          	or	a7,a7,a5
   10f58:	02089063          	bnez	a7,10f78 <__subtf3+0xcbc>
   10f5c:	02812823          	sw	s0,48(sp)
   10f60:	03812a23          	sw	s8,52(sp)
   10f64:	03612c23          	sw	s6,56(sp)
   10f68:	03312e23          	sw	s3,60(sp)
   10f6c:	00030493          	mv	s1,t1
   10f70:	00090a93          	mv	s5,s2
   10f74:	d64ff06f          	j	104d8 <__subtf3+0x21c>
   10f78:	fff30893          	addi	a7,t1,-1
   10f7c:	04089c63          	bnez	a7,10fd4 <__subtf3+0xd18>
   10f80:	40f40733          	sub	a4,s0,a5
   10f84:	40bc0633          	sub	a2,s8,a1
   10f88:	00e437b3          	sltu	a5,s0,a4
   10f8c:	00cc3533          	sltu	a0,s8,a2
   10f90:	40f60633          	sub	a2,a2,a5
   10f94:	00000793          	li	a5,0
   10f98:	00e47663          	bgeu	s0,a4,10fa4 <__subtf3+0xce8>
   10f9c:	418585b3          	sub	a1,a1,s8
   10fa0:	0015b793          	seqz	a5,a1
   10fa4:	00a7e7b3          	or	a5,a5,a0
   10fa8:	410b05b3          	sub	a1,s6,a6
   10fac:	00bb3533          	sltu	a0,s6,a1
   10fb0:	40f585b3          	sub	a1,a1,a5
   10fb4:	00078663          	beqz	a5,10fc0 <__subtf3+0xd04>
   10fb8:	41680833          	sub	a6,a6,s6
   10fbc:	00183893          	seqz	a7,a6
   10fc0:	40d987b3          	sub	a5,s3,a3
   10fc4:	00a8e6b3          	or	a3,a7,a0
   10fc8:	40d787b3          	sub	a5,a5,a3
   10fcc:	00090a93          	mv	s5,s2
   10fd0:	d45ff06f          	j	10d14 <__subtf3+0xa58>
   10fd4:	000087b7          	lui	a5,0x8
   10fd8:	fff78793          	addi	a5,a5,-1 # 7fff <__gdtoa+0x11a3>
   10fdc:	76f31063          	bne	t1,a5,1173c <__subtf3+0x1480>
   10fe0:	02812823          	sw	s0,48(sp)
   10fe4:	03812a23          	sw	s8,52(sp)
   10fe8:	03612c23          	sw	s6,56(sp)
   10fec:	03312e23          	sw	s3,60(sp)
   10ff0:	00090a93          	mv	s5,s2
   10ff4:	911ff06f          	j	10904 <__subtf3+0x648>
   10ff8:	000087b7          	lui	a5,0x8
   10ffc:	fff78793          	addi	a5,a5,-1 # 7fff <__gdtoa+0x11a3>
   11000:	fefb80e3          	beq	s7,a5,10fe0 <__subtf3+0xd24>
   11004:	01c12783          	lw	a5,28(sp)
   11008:	00080737          	lui	a4,0x80
   1100c:	00e7e7b3          	or	a5,a5,a4
   11010:	00f12e23          	sw	a5,28(sp)
   11014:	07400793          	li	a5,116
   11018:	1867c863          	blt	a5,t1,111a8 <__subtf3+0xeec>
   1101c:	02000793          	li	a5,32
   11020:	02f347b3          	div	a5,t1,a5
   11024:	00060693          	mv	a3,a2
   11028:	00000493          	li	s1,0
   1102c:	00000713          	li	a4,0
   11030:	02f74e63          	blt	a4,a5,1106c <__subtf3+0xdb0>
   11034:	00300713          	li	a4,3
   11038:	01f37893          	andi	a7,t1,31
   1103c:	40f70e33          	sub	t3,a4,a5
   11040:	00279593          	slli	a1,a5,0x2
   11044:	02089e63          	bnez	a7,11080 <__subtf3+0xdc4>
   11048:	00b60733          	add	a4,a2,a1
   1104c:	00072703          	lw	a4,0(a4) # 80000 <_memory_end+0x60000>
   11050:	00188893          	addi	a7,a7,1
   11054:	00460613          	addi	a2,a2,4
   11058:	fee62e23          	sw	a4,-4(a2)
   1105c:	ff1e56e3          	bge	t3,a7,11048 <__subtf3+0xd8c>
   11060:	00400713          	li	a4,4
   11064:	40f707b3          	sub	a5,a4,a5
   11068:	0780006f          	j	110e0 <__subtf3+0xe24>
   1106c:	0006a583          	lw	a1,0(a3)
   11070:	00170713          	addi	a4,a4,1
   11074:	00468693          	addi	a3,a3,4
   11078:	00b4e4b3          	or	s1,s1,a1
   1107c:	fb5ff06f          	j	11030 <__subtf3+0xd74>
   11080:	02000613          	li	a2,32
   11084:	02c36733          	rem	a4,t1,a2
   11088:	00078693          	mv	a3,a5
   1108c:	40e60633          	sub	a2,a2,a4
   11090:	0007d463          	bgez	a5,11098 <__subtf3+0xddc>
   11094:	00000693          	li	a3,0
   11098:	00269693          	slli	a3,a3,0x2
   1109c:	04068713          	addi	a4,a3,64
   110a0:	002706b3          	add	a3,a4,sp
   110a4:	fd06a703          	lw	a4,-48(a3)
   110a8:	00b506b3          	add	a3,a0,a1
   110ac:	40b005b3          	neg	a1,a1
   110b0:	00c71733          	sll	a4,a4,a2
   110b4:	00e4e4b3          	or	s1,s1,a4
   110b8:	00000713          	li	a4,0
   110bc:	0dc74263          	blt	a4,t3,11180 <__subtf3+0xec4>
   110c0:	01c12683          	lw	a3,28(sp)
   110c4:	00400713          	li	a4,4
   110c8:	40f707b3          	sub	a5,a4,a5
   110cc:	002e1713          	slli	a4,t3,0x2
   110d0:	04070713          	addi	a4,a4,64
   110d4:	00270733          	add	a4,a4,sp
   110d8:	0116d6b3          	srl	a3,a3,a7
   110dc:	fcd72823          	sw	a3,-48(a4)
   110e0:	0057a713          	slti	a4,a5,5
   110e4:	00000613          	li	a2,0
   110e8:	00070863          	beqz	a4,110f8 <__subtf3+0xe3c>
   110ec:	00400613          	li	a2,4
   110f0:	40f60633          	sub	a2,a2,a5
   110f4:	00261613          	slli	a2,a2,0x2
   110f8:	00279793          	slli	a5,a5,0x2
   110fc:	00f50533          	add	a0,a0,a5
   11100:	00000593          	li	a1,0
   11104:	8d4f50ef          	jal	61d8 <memset>
   11108:	01012783          	lw	a5,16(sp)
   1110c:	00903733          	snez	a4,s1
   11110:	00f76733          	or	a4,a4,a5
   11114:	01412683          	lw	a3,20(sp)
   11118:	00e12823          	sw	a4,16(sp)
   1111c:	40e40733          	sub	a4,s0,a4
   11120:	40dc0633          	sub	a2,s8,a3
   11124:	00e437b3          	sltu	a5,s0,a4
   11128:	00cc35b3          	sltu	a1,s8,a2
   1112c:	40f60633          	sub	a2,a2,a5
   11130:	00000793          	li	a5,0
   11134:	00e47663          	bgeu	s0,a4,11140 <__subtf3+0xe84>
   11138:	418686b3          	sub	a3,a3,s8
   1113c:	0016b793          	seqz	a5,a3
   11140:	01812503          	lw	a0,24(sp)
   11144:	00b7e7b3          	or	a5,a5,a1
   11148:	00000693          	li	a3,0
   1114c:	40ab05b3          	sub	a1,s6,a0
   11150:	00bb3833          	sltu	a6,s6,a1
   11154:	40f585b3          	sub	a1,a1,a5
   11158:	00078663          	beqz	a5,11164 <__subtf3+0xea8>
   1115c:	41650533          	sub	a0,a0,s6
   11160:	00153693          	seqz	a3,a0
   11164:	01c12783          	lw	a5,28(sp)
   11168:	0106e6b3          	or	a3,a3,a6
   1116c:	000b8493          	mv	s1,s7
   11170:	40f987b3          	sub	a5,s3,a5
   11174:	40d787b3          	sub	a5,a5,a3
   11178:	00090a93          	mv	s5,s2
   1117c:	d59ff06f          	j	10ed4 <__subtf3+0xc18>
   11180:	0006a803          	lw	a6,0(a3)
   11184:	0046a303          	lw	t1,4(a3)
   11188:	00b68eb3          	add	t4,a3,a1
   1118c:	01185833          	srl	a6,a6,a7
   11190:	00c31333          	sll	t1,t1,a2
   11194:	00686833          	or	a6,a6,t1
   11198:	010ea023          	sw	a6,0(t4)
   1119c:	00170713          	addi	a4,a4,1
   111a0:	00468693          	addi	a3,a3,4
   111a4:	f19ff06f          	j	110bc <__subtf3+0xe00>
   111a8:	00012e23          	sw	zero,28(sp)
   111ac:	00012c23          	sw	zero,24(sp)
   111b0:	00012a23          	sw	zero,20(sp)
   111b4:	00100713          	li	a4,1
   111b8:	f5dff06f          	j	11114 <__subtf3+0xe58>
   111bc:	00148593          	addi	a1,s1,1
   111c0:	01159513          	slli	a0,a1,0x11
   111c4:	01255513          	srli	a0,a0,0x12
   111c8:	01412683          	lw	a3,20(sp)
   111cc:	01812603          	lw	a2,24(sp)
   111d0:	01c12703          	lw	a4,28(sp)
   111d4:	00008837          	lui	a6,0x8
   111d8:	1c051e63          	bnez	a0,113b4 <__subtf3+0x10f8>
   111dc:	016c6533          	or	a0,s8,s6
   111e0:	00c6e5b3          	or	a1,a3,a2
   111e4:	01356533          	or	a0,a0,s3
   111e8:	00e5e5b3          	or	a1,a1,a4
   111ec:	00856533          	or	a0,a0,s0
   111f0:	00f5e5b3          	or	a1,a1,a5
   111f4:	10049863          	bnez	s1,11304 <__subtf3+0x1048>
   111f8:	02059263          	bnez	a1,1121c <__subtf3+0xf60>
   111fc:	02812823          	sw	s0,48(sp)
   11200:	03812a23          	sw	s8,52(sp)
   11204:	03612c23          	sw	s6,56(sp)
   11208:	03312e23          	sw	s3,60(sp)
   1120c:	00090a93          	mv	s5,s2
   11210:	ac051463          	bnez	a0,104d8 <__subtf3+0x21c>
   11214:	00000493          	li	s1,0
   11218:	9d9ff06f          	j	10bf0 <__subtf3+0x934>
   1121c:	00051c63          	bnez	a0,11234 <__subtf3+0xf78>
   11220:	02f12823          	sw	a5,48(sp)
   11224:	02d12a23          	sw	a3,52(sp)
   11228:	02c12c23          	sw	a2,56(sp)
   1122c:	02e12e23          	sw	a4,60(sp)
   11230:	8d5ff06f          	j	10b04 <__subtf3+0x848>
   11234:	40878533          	sub	a0,a5,s0
   11238:	41868e33          	sub	t3,a3,s8
   1123c:	00a7b833          	sltu	a6,a5,a0
   11240:	01c6b8b3          	sltu	a7,a3,t3
   11244:	410e0833          	sub	a6,t3,a6
   11248:	00000593          	li	a1,0
   1124c:	00a7f463          	bgeu	a5,a0,11254 <__subtf3+0xf98>
   11250:	001e3593          	seqz	a1,t3
   11254:	0115e5b3          	or	a1,a1,a7
   11258:	416608b3          	sub	a7,a2,s6
   1125c:	01163f33          	sltu	t5,a2,a7
   11260:	40b88eb3          	sub	t4,a7,a1
   11264:	00000313          	li	t1,0
   11268:	00058463          	beqz	a1,11270 <__subtf3+0xfb4>
   1126c:	0018b313          	seqz	t1,a7
   11270:	01e36333          	or	t1,t1,t5
   11274:	413705b3          	sub	a1,a4,s3
   11278:	406585b3          	sub	a1,a1,t1
   1127c:	02b12e23          	sw	a1,60(sp)
   11280:	03d12c23          	sw	t4,56(sp)
   11284:	03012a23          	sw	a6,52(sp)
   11288:	02a12823          	sw	a0,48(sp)
   1128c:	00c59313          	slli	t1,a1,0xc
   11290:	06035063          	bgez	t1,112f0 <__subtf3+0x1034>
   11294:	40f407b3          	sub	a5,s0,a5
   11298:	40dc06b3          	sub	a3,s8,a3
   1129c:	00f435b3          	sltu	a1,s0,a5
   112a0:	00dc3c33          	sltu	s8,s8,a3
   112a4:	40b686b3          	sub	a3,a3,a1
   112a8:	00000593          	li	a1,0
   112ac:	00f47463          	bgeu	s0,a5,112b4 <__subtf3+0xff8>
   112b0:	001e3593          	seqz	a1,t3
   112b4:	40cb0633          	sub	a2,s6,a2
   112b8:	0185ec33          	or	s8,a1,s8
   112bc:	00cb3b33          	sltu	s6,s6,a2
   112c0:	00000513          	li	a0,0
   112c4:	41860633          	sub	a2,a2,s8
   112c8:	000c0463          	beqz	s8,112d0 <__subtf3+0x1014>
   112cc:	0018b513          	seqz	a0,a7
   112d0:	40e98733          	sub	a4,s3,a4
   112d4:	01656533          	or	a0,a0,s6
   112d8:	40a70733          	sub	a4,a4,a0
   112dc:	02e12e23          	sw	a4,60(sp)
   112e0:	02c12c23          	sw	a2,56(sp)
   112e4:	02d12a23          	sw	a3,52(sp)
   112e8:	02f12823          	sw	a5,48(sp)
   112ec:	c85ff06f          	j	10f70 <__subtf3+0xcb4>
   112f0:	01056533          	or	a0,a0,a6
   112f4:	01d56533          	or	a0,a0,t4
   112f8:	00b56533          	or	a0,a0,a1
   112fc:	f0050ce3          	beqz	a0,11214 <__subtf3+0xf58>
   11300:	805ff06f          	j	10b04 <__subtf3+0x848>
   11304:	03010893          	addi	a7,sp,48
   11308:	04059e63          	bnez	a1,11364 <__subtf3+0x10a8>
   1130c:	02051e63          	bnez	a0,11348 <__subtf3+0x108c>
   11310:	03012e23          	sw	a6,60(sp)
   11314:	02012c23          	sw	zero,56(sp)
   11318:	02012a23          	sw	zero,52(sp)
   1131c:	02012823          	sw	zero,48(sp)
   11320:	03c10793          	addi	a5,sp,60
   11324:	0007a703          	lw	a4,0(a5)
   11328:	ffc7a683          	lw	a3,-4(a5)
   1132c:	ffc78793          	addi	a5,a5,-4
   11330:	00371713          	slli	a4,a4,0x3
   11334:	01d6d693          	srli	a3,a3,0x1d
   11338:	00d76733          	or	a4,a4,a3
   1133c:	00e7a223          	sw	a4,4(a5)
   11340:	fef892e3          	bne	a7,a5,11324 <__subtf3+0x1068>
   11344:	8a5ff06f          	j	10be8 <__subtf3+0x92c>
   11348:	02812823          	sw	s0,48(sp)
   1134c:	03812a23          	sw	s8,52(sp)
   11350:	03612c23          	sw	s6,56(sp)
   11354:	03312e23          	sw	s3,60(sp)
   11358:	00090a93          	mv	s5,s2
   1135c:	fff80493          	addi	s1,a6,-1 # 7fff <__gdtoa+0x11a3>
   11360:	978ff06f          	j	104d8 <__subtf3+0x21c>
   11364:	00051c63          	bnez	a0,1137c <__subtf3+0x10c0>
   11368:	02f12823          	sw	a5,48(sp)
   1136c:	02d12a23          	sw	a3,52(sp)
   11370:	02c12c23          	sw	a2,56(sp)
   11374:	02e12e23          	sw	a4,60(sp)
   11378:	fe5ff06f          	j	1135c <__subtf3+0x10a0>
   1137c:	03012e23          	sw	a6,60(sp)
   11380:	02012c23          	sw	zero,56(sp)
   11384:	02012a23          	sw	zero,52(sp)
   11388:	02012823          	sw	zero,48(sp)
   1138c:	03c10793          	addi	a5,sp,60
   11390:	0007a703          	lw	a4,0(a5)
   11394:	ffc7a683          	lw	a3,-4(a5)
   11398:	ffc78793          	addi	a5,a5,-4
   1139c:	00371713          	slli	a4,a4,0x3
   113a0:	01d6d693          	srli	a3,a3,0x1d
   113a4:	00d76733          	or	a4,a4,a3
   113a8:	00e7a223          	sw	a4,4(a5)
   113ac:	fef892e3          	bne	a7,a5,11390 <__subtf3+0x10d4>
   113b0:	839ff06f          	j	10be8 <__subtf3+0x92c>
   113b4:	40878533          	sub	a0,a5,s0
   113b8:	41868eb3          	sub	t4,a3,s8
   113bc:	00a7b833          	sltu	a6,a5,a0
   113c0:	01d6b333          	sltu	t1,a3,t4
   113c4:	410e8833          	sub	a6,t4,a6
   113c8:	00000593          	li	a1,0
   113cc:	00a7f463          	bgeu	a5,a0,113d4 <__subtf3+0x1118>
   113d0:	001eb593          	seqz	a1,t4
   113d4:	0065e5b3          	or	a1,a1,t1
   113d8:	41660333          	sub	t1,a2,s6
   113dc:	00663fb3          	sltu	t6,a2,t1
   113e0:	40b30f33          	sub	t5,t1,a1
   113e4:	00000e13          	li	t3,0
   113e8:	00058463          	beqz	a1,113f0 <__subtf3+0x1134>
   113ec:	00133e13          	seqz	t3,t1
   113f0:	01fe6e33          	or	t3,t3,t6
   113f4:	413705b3          	sub	a1,a4,s3
   113f8:	41c585b3          	sub	a1,a1,t3
   113fc:	02b12e23          	sw	a1,60(sp)
   11400:	03e12c23          	sw	t5,56(sp)
   11404:	03012a23          	sw	a6,52(sp)
   11408:	02a12823          	sw	a0,48(sp)
   1140c:	00c59e13          	slli	t3,a1,0xc
   11410:	140e5663          	bgez	t3,1155c <__subtf3+0x12a0>
   11414:	40f407b3          	sub	a5,s0,a5
   11418:	40dc06b3          	sub	a3,s8,a3
   1141c:	00f435b3          	sltu	a1,s0,a5
   11420:	00dc3c33          	sltu	s8,s8,a3
   11424:	40b686b3          	sub	a3,a3,a1
   11428:	00000593          	li	a1,0
   1142c:	00f47463          	bgeu	s0,a5,11434 <__subtf3+0x1178>
   11430:	001eb593          	seqz	a1,t4
   11434:	40cb0633          	sub	a2,s6,a2
   11438:	0185ec33          	or	s8,a1,s8
   1143c:	00cb3b33          	sltu	s6,s6,a2
   11440:	41860633          	sub	a2,a2,s8
   11444:	000c0463          	beqz	s8,1144c <__subtf3+0x1190>
   11448:	00133893          	seqz	a7,t1
   1144c:	40e985b3          	sub	a1,s3,a4
   11450:	0168e733          	or	a4,a7,s6
   11454:	40e58733          	sub	a4,a1,a4
   11458:	02e12e23          	sw	a4,60(sp)
   1145c:	02c12c23          	sw	a2,56(sp)
   11460:	02d12a23          	sw	a3,52(sp)
   11464:	02f12823          	sw	a5,48(sp)
   11468:	00090a93          	mv	s5,s2
   1146c:	03c12503          	lw	a0,60(sp)
   11470:	10050063          	beqz	a0,11570 <__subtf3+0x12b4>
   11474:	30c010ef          	jal	12780 <__clzsi2>
   11478:	ff450513          	addi	a0,a0,-12
   1147c:	02000713          	li	a4,32
   11480:	01f57813          	andi	a6,a0,31
   11484:	02e547b3          	div	a5,a0,a4
   11488:	12080063          	beqz	a6,115a8 <__subtf3+0x12ec>
   1148c:	03010313          	addi	t1,sp,48
   11490:	02e566b3          	rem	a3,a0,a4
   11494:	40d70633          	sub	a2,a4,a3
   11498:	ffc00693          	li	a3,-4
   1149c:	02d786b3          	mul	a3,a5,a3
   114a0:	00c68713          	addi	a4,a3,12
   114a4:	00e30733          	add	a4,t1,a4
   114a8:	40d006b3          	neg	a3,a3
   114ac:	12e31663          	bne	t1,a4,115d8 <__subtf3+0x131c>
   114b0:	03012683          	lw	a3,48(sp)
   114b4:	fff78713          	addi	a4,a5,-1
   114b8:	00279793          	slli	a5,a5,0x2
   114bc:	04078793          	addi	a5,a5,64
   114c0:	002787b3          	add	a5,a5,sp
   114c4:	010696b3          	sll	a3,a3,a6
   114c8:	fed7a823          	sw	a3,-16(a5)
   114cc:	00170713          	addi	a4,a4,1
   114d0:	03010793          	addi	a5,sp,48
   114d4:	00271713          	slli	a4,a4,0x2
   114d8:	00800693          	li	a3,8
   114dc:	00078893          	mv	a7,a5
   114e0:	00d76a63          	bltu	a4,a3,114f4 <__subtf3+0x1238>
   114e4:	02012823          	sw	zero,48(sp)
   114e8:	0007a223          	sw	zero,4(a5)
   114ec:	ff870713          	addi	a4,a4,-8
   114f0:	03810793          	addi	a5,sp,56
   114f4:	00400693          	li	a3,4
   114f8:	00d76463          	bltu	a4,a3,11500 <__subtf3+0x1244>
   114fc:	0007a023          	sw	zero,0(a5)
   11500:	1c954863          	blt	a0,s1,116d0 <__subtf3+0x1414>
   11504:	40950533          	sub	a0,a0,s1
   11508:	00150513          	addi	a0,a0,1
   1150c:	40555713          	srai	a4,a0,0x5
   11510:	01f57793          	andi	a5,a0,31
   11514:	00088593          	mv	a1,a7
   11518:	00088613          	mv	a2,a7
   1151c:	00000313          	li	t1,0
   11520:	00000693          	li	a3,0
   11524:	0ce69c63          	bne	a3,a4,115fc <__subtf3+0x1340>
   11528:	00300693          	li	a3,3
   1152c:	40e686b3          	sub	a3,a3,a4
   11530:	00271613          	slli	a2,a4,0x2
   11534:	0c079e63          	bnez	a5,11610 <__subtf3+0x1354>
   11538:	00c58533          	add	a0,a1,a2
   1153c:	00052503          	lw	a0,0(a0)
   11540:	00178793          	addi	a5,a5,1
   11544:	00458593          	addi	a1,a1,4
   11548:	fea5ae23          	sw	a0,-4(a1)
   1154c:	fef6d6e3          	bge	a3,a5,11538 <__subtf3+0x127c>
   11550:	00400793          	li	a5,4
   11554:	40e78733          	sub	a4,a5,a4
   11558:	1040006f          	j	1165c <__subtf3+0x13a0>
   1155c:	01056533          	or	a0,a0,a6
   11560:	01e56533          	or	a0,a0,t5
   11564:	00b56533          	or	a0,a0,a1
   11568:	ca0506e3          	beqz	a0,11214 <__subtf3+0xf58>
   1156c:	f01ff06f          	j	1146c <__subtf3+0x11b0>
   11570:	03812503          	lw	a0,56(sp)
   11574:	00050863          	beqz	a0,11584 <__subtf3+0x12c8>
   11578:	208010ef          	jal	12780 <__clzsi2>
   1157c:	02050513          	addi	a0,a0,32
   11580:	ef9ff06f          	j	11478 <__subtf3+0x11bc>
   11584:	03412503          	lw	a0,52(sp)
   11588:	00050863          	beqz	a0,11598 <__subtf3+0x12dc>
   1158c:	1f4010ef          	jal	12780 <__clzsi2>
   11590:	04050513          	addi	a0,a0,64
   11594:	ee5ff06f          	j	11478 <__subtf3+0x11bc>
   11598:	03012503          	lw	a0,48(sp)
   1159c:	1e4010ef          	jal	12780 <__clzsi2>
   115a0:	06050513          	addi	a0,a0,96
   115a4:	ed5ff06f          	j	11478 <__subtf3+0x11bc>
   115a8:	ffc00613          	li	a2,-4
   115ac:	02c78633          	mul	a2,a5,a2
   115b0:	03c10713          	addi	a4,sp,60
   115b4:	00300693          	li	a3,3
   115b8:	00c705b3          	add	a1,a4,a2
   115bc:	0005a583          	lw	a1,0(a1)
   115c0:	fff68693          	addi	a3,a3,-1
   115c4:	ffc70713          	addi	a4,a4,-4
   115c8:	00b72223          	sw	a1,4(a4)
   115cc:	fef6d6e3          	bge	a3,a5,115b8 <__subtf3+0x12fc>
   115d0:	fff78713          	addi	a4,a5,-1
   115d4:	ef9ff06f          	j	114cc <__subtf3+0x1210>
   115d8:	00072583          	lw	a1,0(a4)
   115dc:	ffc72883          	lw	a7,-4(a4)
   115e0:	00d70e33          	add	t3,a4,a3
   115e4:	010595b3          	sll	a1,a1,a6
   115e8:	00c8d8b3          	srl	a7,a7,a2
   115ec:	0115e5b3          	or	a1,a1,a7
   115f0:	00be2023          	sw	a1,0(t3)
   115f4:	ffc70713          	addi	a4,a4,-4
   115f8:	eb5ff06f          	j	114ac <__subtf3+0x11f0>
   115fc:	00062503          	lw	a0,0(a2)
   11600:	00168693          	addi	a3,a3,1
   11604:	00460613          	addi	a2,a2,4
   11608:	00a36333          	or	t1,t1,a0
   1160c:	f19ff06f          	j	11524 <__subtf3+0x1268>
   11610:	04060593          	addi	a1,a2,64
   11614:	002585b3          	add	a1,a1,sp
   11618:	ff05a583          	lw	a1,-16(a1)
   1161c:	02000813          	li	a6,32
   11620:	40f80833          	sub	a6,a6,a5
   11624:	010595b3          	sll	a1,a1,a6
   11628:	00b36333          	or	t1,t1,a1
   1162c:	00000e13          	li	t3,0
   11630:	00c885b3          	add	a1,a7,a2
   11634:	40c00633          	neg	a2,a2
   11638:	06de4863          	blt	t3,a3,116a8 <__subtf3+0x13ec>
   1163c:	00400613          	li	a2,4
   11640:	40e60733          	sub	a4,a2,a4
   11644:	03c12603          	lw	a2,60(sp)
   11648:	00269693          	slli	a3,a3,0x2
   1164c:	04068693          	addi	a3,a3,64
   11650:	002686b3          	add	a3,a3,sp
   11654:	00f657b3          	srl	a5,a2,a5
   11658:	fef6a823          	sw	a5,-16(a3)
   1165c:	00400693          	li	a3,4
   11660:	40e686b3          	sub	a3,a3,a4
   11664:	00271713          	slli	a4,a4,0x2
   11668:	00e887b3          	add	a5,a7,a4
   1166c:	00269713          	slli	a4,a3,0x2
   11670:	00800693          	li	a3,8
   11674:	00d76a63          	bltu	a4,a3,11688 <__subtf3+0x13cc>
   11678:	0007a023          	sw	zero,0(a5)
   1167c:	0007a223          	sw	zero,4(a5)
   11680:	ff870713          	addi	a4,a4,-8
   11684:	00878793          	addi	a5,a5,8
   11688:	00400693          	li	a3,4
   1168c:	00d76463          	bltu	a4,a3,11694 <__subtf3+0x13d8>
   11690:	0007a023          	sw	zero,0(a5)
   11694:	03012703          	lw	a4,48(sp)
   11698:	006037b3          	snez	a5,t1
   1169c:	00f767b3          	or	a5,a4,a5
   116a0:	02f12823          	sw	a5,48(sp)
   116a4:	c60ff06f          	j	10b04 <__subtf3+0x848>
   116a8:	0005a503          	lw	a0,0(a1)
   116ac:	0045ae83          	lw	t4,4(a1)
   116b0:	00c58f33          	add	t5,a1,a2
   116b4:	00f55533          	srl	a0,a0,a5
   116b8:	010e9eb3          	sll	t4,t4,a6
   116bc:	01d56533          	or	a0,a0,t4
   116c0:	00af2023          	sw	a0,0(t5)
   116c4:	001e0e13          	addi	t3,t3,1
   116c8:	00458593          	addi	a1,a1,4
   116cc:	f6dff06f          	j	11638 <__subtf3+0x137c>
   116d0:	03c12783          	lw	a5,60(sp)
   116d4:	fff80737          	lui	a4,0xfff80
   116d8:	fff70713          	addi	a4,a4,-1 # fff7ffff <_memory_end+0xfff5ffff>
   116dc:	00e7f7b3          	and	a5,a5,a4
   116e0:	40a484b3          	sub	s1,s1,a0
   116e4:	02f12e23          	sw	a5,60(sp)
   116e8:	df1fe06f          	j	104d8 <__subtf3+0x21c>
   116ec:	02012e23          	sw	zero,60(sp)
   116f0:	02012c23          	sw	zero,56(sp)
   116f4:	02012a23          	sw	zero,52(sp)
   116f8:	02012823          	sw	zero,48(sp)
   116fc:	e5dfe06f          	j	10558 <__subtf3+0x29c>
   11700:	07400713          	li	a4,116
   11704:	00c74463          	blt	a4,a2,1170c <__subtf3+0x1450>
   11708:	f51fe06f          	j	10658 <__subtf3+0x39c>
   1170c:	02012623          	sw	zero,44(sp)
   11710:	02012423          	sw	zero,40(sp)
   11714:	02012223          	sw	zero,36(sp)
   11718:	00100713          	li	a4,1
   1171c:	82cff06f          	j	10748 <__subtf3+0x48c>
   11720:	07400793          	li	a5,116
   11724:	a0b7de63          	bge	a5,a1,10940 <__subtf3+0x684>
   11728:	00012e23          	sw	zero,28(sp)
   1172c:	00012c23          	sw	zero,24(sp)
   11730:	00012a23          	sw	zero,20(sp)
   11734:	00100793          	li	a5,1
   11738:	b00ff06f          	j	10a38 <__subtf3+0x77c>
   1173c:	07400793          	li	a5,116
   11740:	a717c4e3          	blt	a5,a7,111a8 <__subtf3+0xeec>
   11744:	00088313          	mv	t1,a7
   11748:	8d5ff06f          	j	1101c <__subtf3+0xd60>

0001174c <__unordtf2>:
   1174c:	00052703          	lw	a4,0(a0)
   11750:	00452e83          	lw	t4,4(a0)
   11754:	00852e03          	lw	t3,8(a0)
   11758:	00c52503          	lw	a0,12(a0)
   1175c:	00c5a603          	lw	a2,12(a1)
   11760:	000086b7          	lui	a3,0x8
   11764:	fff68693          	addi	a3,a3,-1 # 7fff <__gdtoa+0x11a3>
   11768:	01055813          	srli	a6,a0,0x10
   1176c:	0005a783          	lw	a5,0(a1)
   11770:	0045a303          	lw	t1,4(a1)
   11774:	0085a883          	lw	a7,8(a1)
   11778:	00d87833          	and	a6,a6,a3
   1177c:	01065593          	srli	a1,a2,0x10
   11780:	ff010113          	addi	sp,sp,-16
   11784:	00d5f5b3          	and	a1,a1,a3
   11788:	02d81063          	bne	a6,a3,117a8 <__unordtf2+0x5c>
   1178c:	01d76733          	or	a4,a4,t4
   11790:	01051513          	slli	a0,a0,0x10
   11794:	01055513          	srli	a0,a0,0x10
   11798:	01c76733          	or	a4,a4,t3
   1179c:	00a76733          	or	a4,a4,a0
   117a0:	00100513          	li	a0,1
   117a4:	02071663          	bnez	a4,117d0 <__unordtf2+0x84>
   117a8:	00008737          	lui	a4,0x8
   117ac:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x11a3>
   117b0:	00000513          	li	a0,0
   117b4:	00e59e63          	bne	a1,a4,117d0 <__unordtf2+0x84>
   117b8:	0067e533          	or	a0,a5,t1
   117bc:	01061613          	slli	a2,a2,0x10
   117c0:	01156533          	or	a0,a0,a7
   117c4:	01065613          	srli	a2,a2,0x10
   117c8:	00c56533          	or	a0,a0,a2
   117cc:	00a03533          	snez	a0,a0
   117d0:	01010113          	addi	sp,sp,16
   117d4:	00008067          	ret

000117d8 <__fixtfsi>:
   117d8:	00052703          	lw	a4,0(a0)
   117dc:	00452683          	lw	a3,4(a0)
   117e0:	00c52783          	lw	a5,12(a0)
   117e4:	00852583          	lw	a1,8(a0)
   117e8:	fe010113          	addi	sp,sp,-32
   117ec:	00e12023          	sw	a4,0(sp)
   117f0:	00d12223          	sw	a3,4(sp)
   117f4:	00e12823          	sw	a4,16(sp)
   117f8:	00179693          	slli	a3,a5,0x1
   117fc:	00004737          	lui	a4,0x4
   11800:	00b12423          	sw	a1,8(sp)
   11804:	00f12623          	sw	a5,12(sp)
   11808:	00b12c23          	sw	a1,24(sp)
   1180c:	0116d693          	srli	a3,a3,0x11
   11810:	ffe70713          	addi	a4,a4,-2 # 3ffe <_vfprintf_r+0x1bf2>
   11814:	00000513          	li	a0,0
   11818:	02d75063          	bge	a4,a3,11838 <__fixtfsi+0x60>
   1181c:	00004737          	lui	a4,0x4
   11820:	01d70713          	addi	a4,a4,29 # 401d <_vfprintf_r+0x1c11>
   11824:	01f7d813          	srli	a6,a5,0x1f
   11828:	00d75c63          	bge	a4,a3,11840 <__fixtfsi+0x68>
   1182c:	80000537          	lui	a0,0x80000
   11830:	fff50513          	addi	a0,a0,-1 # 7fffffff <_memory_end+0x7ffdffff>
   11834:	00a80533          	add	a0,a6,a0
   11838:	02010113          	addi	sp,sp,32
   1183c:	00008067          	ret
   11840:	01079793          	slli	a5,a5,0x10
   11844:	00010737          	lui	a4,0x10
   11848:	0107d793          	srli	a5,a5,0x10
   1184c:	00e7e7b3          	or	a5,a5,a4
   11850:	00004737          	lui	a4,0x4
   11854:	06f70713          	addi	a4,a4,111 # 406f <_vfprintf_r+0x1c63>
   11858:	40d70733          	sub	a4,a4,a3
   1185c:	40575613          	srai	a2,a4,0x5
   11860:	00f12e23          	sw	a5,28(sp)
   11864:	01f77713          	andi	a4,a4,31
   11868:	02071463          	bnez	a4,11890 <__fixtfsi+0xb8>
   1186c:	00261613          	slli	a2,a2,0x2
   11870:	02060793          	addi	a5,a2,32
   11874:	00278633          	add	a2,a5,sp
   11878:	ff062783          	lw	a5,-16(a2)
   1187c:	00f12823          	sw	a5,16(sp)
   11880:	01012503          	lw	a0,16(sp)
   11884:	fa080ae3          	beqz	a6,11838 <__fixtfsi+0x60>
   11888:	40a00533          	neg	a0,a0
   1188c:	fadff06f          	j	11838 <__fixtfsi+0x60>
   11890:	00200513          	li	a0,2
   11894:	00000693          	li	a3,0
   11898:	02a61063          	bne	a2,a0,118b8 <__fixtfsi+0xe0>
   1189c:	02000693          	li	a3,32
   118a0:	40e686b3          	sub	a3,a3,a4
   118a4:	00d796b3          	sll	a3,a5,a3
   118a8:	00e5d5b3          	srl	a1,a1,a4
   118ac:	00b6e6b3          	or	a3,a3,a1
   118b0:	00d12823          	sw	a3,16(sp)
   118b4:	00100693          	li	a3,1
   118b8:	00269693          	slli	a3,a3,0x2
   118bc:	02068693          	addi	a3,a3,32
   118c0:	002686b3          	add	a3,a3,sp
   118c4:	00e7d7b3          	srl	a5,a5,a4
   118c8:	fef6a823          	sw	a5,-16(a3)
   118cc:	fb5ff06f          	j	11880 <__fixtfsi+0xa8>

000118d0 <__floatsitf>:
   118d0:	fd010113          	addi	sp,sp,-48
   118d4:	02912223          	sw	s1,36(sp)
   118d8:	02112623          	sw	ra,44(sp)
   118dc:	02812423          	sw	s0,40(sp)
   118e0:	03212023          	sw	s2,32(sp)
   118e4:	00050493          	mv	s1,a0
   118e8:	12058263          	beqz	a1,11a0c <__floatsitf+0x13c>
   118ec:	41f5d793          	srai	a5,a1,0x1f
   118f0:	00b7c433          	xor	s0,a5,a1
   118f4:	40f40433          	sub	s0,s0,a5
   118f8:	00040513          	mv	a0,s0
   118fc:	01f5d913          	srli	s2,a1,0x1f
   11900:	681000ef          	jal	12780 <__clzsi2>
   11904:	00004737          	lui	a4,0x4
   11908:	01e70713          	addi	a4,a4,30 # 401e <_vfprintf_r+0x1c12>
   1190c:	05150793          	addi	a5,a0,81
   11910:	40a70633          	sub	a2,a4,a0
   11914:	00812823          	sw	s0,16(sp)
   11918:	4057d713          	srai	a4,a5,0x5
   1191c:	00012a23          	sw	zero,20(sp)
   11920:	00012c23          	sw	zero,24(sp)
   11924:	00012e23          	sw	zero,28(sp)
   11928:	01f7f793          	andi	a5,a5,31
   1192c:	02078c63          	beqz	a5,11964 <__floatsitf+0x94>
   11930:	00200693          	li	a3,2
   11934:	0cd71863          	bne	a4,a3,11a04 <__floatsitf+0x134>
   11938:	02000693          	li	a3,32
   1193c:	40f686b3          	sub	a3,a3,a5
   11940:	00d456b3          	srl	a3,s0,a3
   11944:	00d12e23          	sw	a3,28(sp)
   11948:	fff70693          	addi	a3,a4,-1
   1194c:	00271713          	slli	a4,a4,0x2
   11950:	02070713          	addi	a4,a4,32
   11954:	00270733          	add	a4,a4,sp
   11958:	00f41433          	sll	s0,s0,a5
   1195c:	fe872823          	sw	s0,-16(a4)
   11960:	0340006f          	j	11994 <__floatsitf+0xc4>
   11964:	00300793          	li	a5,3
   11968:	40e787b3          	sub	a5,a5,a4
   1196c:	00279793          	slli	a5,a5,0x2
   11970:	02078793          	addi	a5,a5,32
   11974:	002787b3          	add	a5,a5,sp
   11978:	ff07a783          	lw	a5,-16(a5)
   1197c:	00200693          	li	a3,2
   11980:	00f12e23          	sw	a5,28(sp)
   11984:	00200793          	li	a5,2
   11988:	00f71663          	bne	a4,a5,11994 <__floatsitf+0xc4>
   1198c:	00812c23          	sw	s0,24(sp)
   11990:	00100693          	li	a3,1
   11994:	00269693          	slli	a3,a3,0x2
   11998:	00012823          	sw	zero,16(sp)
   1199c:	00012a23          	sw	zero,20(sp)
   119a0:	ffc68693          	addi	a3,a3,-4
   119a4:	00400793          	li	a5,4
   119a8:	00f6e463          	bltu	a3,a5,119b0 <__floatsitf+0xe0>
   119ac:	00012c23          	sw	zero,24(sp)
   119b0:	00090593          	mv	a1,s2
   119b4:	01c12783          	lw	a5,28(sp)
   119b8:	00f59413          	slli	s0,a1,0xf
   119bc:	00c46433          	or	s0,s0,a2
   119c0:	00f11623          	sh	a5,12(sp)
   119c4:	01012783          	lw	a5,16(sp)
   119c8:	00811723          	sh	s0,14(sp)
   119cc:	02c12083          	lw	ra,44(sp)
   119d0:	00f4a023          	sw	a5,0(s1)
   119d4:	01412783          	lw	a5,20(sp)
   119d8:	02812403          	lw	s0,40(sp)
   119dc:	02012903          	lw	s2,32(sp)
   119e0:	00f4a223          	sw	a5,4(s1)
   119e4:	01812783          	lw	a5,24(sp)
   119e8:	00048513          	mv	a0,s1
   119ec:	00f4a423          	sw	a5,8(s1)
   119f0:	00c12783          	lw	a5,12(sp)
   119f4:	00f4a623          	sw	a5,12(s1)
   119f8:	02412483          	lw	s1,36(sp)
   119fc:	03010113          	addi	sp,sp,48
   11a00:	00008067          	ret
   11a04:	00300713          	li	a4,3
   11a08:	f41ff06f          	j	11948 <__floatsitf+0x78>
   11a0c:	00012e23          	sw	zero,28(sp)
   11a10:	00012c23          	sw	zero,24(sp)
   11a14:	00012a23          	sw	zero,20(sp)
   11a18:	00012823          	sw	zero,16(sp)
   11a1c:	00000613          	li	a2,0
   11a20:	f95ff06f          	j	119b4 <__floatsitf+0xe4>

00011a24 <__eqsf2>:
   11a24:	01755693          	srli	a3,a0,0x17
   11a28:	008007b7          	lui	a5,0x800
   11a2c:	fff78793          	addi	a5,a5,-1 # 7fffff <_memory_end+0x7dffff>
   11a30:	0175d613          	srli	a2,a1,0x17
   11a34:	0ff6f693          	zext.b	a3,a3
   11a38:	0ff00893          	li	a7,255
   11a3c:	00a7f833          	and	a6,a5,a0
   11a40:	01f55713          	srli	a4,a0,0x1f
   11a44:	00b7f7b3          	and	a5,a5,a1
   11a48:	0ff67613          	zext.b	a2,a2
   11a4c:	01f5d593          	srli	a1,a1,0x1f
   11a50:	00100513          	li	a0,1
   11a54:	01169a63          	bne	a3,a7,11a68 <__eqsf2+0x44>
   11a58:	00081663          	bnez	a6,11a64 <__eqsf2+0x40>
   11a5c:	00d61463          	bne	a2,a3,11a64 <__eqsf2+0x40>
   11a60:	00078a63          	beqz	a5,11a74 <__eqsf2+0x50>
   11a64:	00008067          	ret
   11a68:	ff160ee3          	beq	a2,a7,11a64 <__eqsf2+0x40>
   11a6c:	fec69ce3          	bne	a3,a2,11a64 <__eqsf2+0x40>
   11a70:	fef81ae3          	bne	a6,a5,11a64 <__eqsf2+0x40>
   11a74:	00000513          	li	a0,0
   11a78:	feb706e3          	beq	a4,a1,11a64 <__eqsf2+0x40>
   11a7c:	00100513          	li	a0,1
   11a80:	fe0692e3          	bnez	a3,11a64 <__eqsf2+0x40>
   11a84:	01003533          	snez	a0,a6
   11a88:	00008067          	ret

00011a8c <__lesf2>:
   11a8c:	008007b7          	lui	a5,0x800
   11a90:	fff78793          	addi	a5,a5,-1 # 7fffff <_memory_end+0x7dffff>
   11a94:	01755693          	srli	a3,a0,0x17
   11a98:	00a7f633          	and	a2,a5,a0
   11a9c:	01f55713          	srli	a4,a0,0x1f
   11aa0:	0ff6f693          	zext.b	a3,a3
   11aa4:	0175d513          	srli	a0,a1,0x17
   11aa8:	0ff00813          	li	a6,255
   11aac:	00b7f7b3          	and	a5,a5,a1
   11ab0:	0ff57513          	zext.b	a0,a0
   11ab4:	01f5d593          	srli	a1,a1,0x1f
   11ab8:	01069463          	bne	a3,a6,11ac0 <__lesf2+0x34>
   11abc:	04061263          	bnez	a2,11b00 <__lesf2+0x74>
   11ac0:	0ff00813          	li	a6,255
   11ac4:	01051463          	bne	a0,a6,11acc <__lesf2+0x40>
   11ac8:	02079c63          	bnez	a5,11b00 <__lesf2+0x74>
   11acc:	04069a63          	bnez	a3,11b20 <__lesf2+0x94>
   11ad0:	02051c63          	bnez	a0,11b08 <__lesf2+0x7c>
   11ad4:	04061863          	bnez	a2,11b24 <__lesf2+0x98>
   11ad8:	04078263          	beqz	a5,11b1c <__lesf2+0x90>
   11adc:	00100513          	li	a0,1
   11ae0:	02059e63          	bnez	a1,11b1c <__lesf2+0x90>
   11ae4:	fff00513          	li	a0,-1
   11ae8:	00008067          	ret
   11aec:	fea6c8e3          	blt	a3,a0,11adc <__lesf2+0x50>
   11af0:	02c7e263          	bltu	a5,a2,11b14 <__lesf2+0x88>
   11af4:	00000513          	li	a0,0
   11af8:	02f67263          	bgeu	a2,a5,11b1c <__lesf2+0x90>
   11afc:	fe1ff06f          	j	11adc <__lesf2+0x50>
   11b00:	00200513          	li	a0,2
   11b04:	00008067          	ret
   11b08:	fc060ae3          	beqz	a2,11adc <__lesf2+0x50>
   11b0c:	00e59e63          	bne	a1,a4,11b28 <__lesf2+0x9c>
   11b10:	fcd55ee3          	bge	a0,a3,11aec <__lesf2+0x60>
   11b14:	fff00513          	li	a0,-1
   11b18:	00058c63          	beqz	a1,11b30 <__lesf2+0xa4>
   11b1c:	00008067          	ret
   11b20:	fe0516e3          	bnez	a0,11b0c <__lesf2+0x80>
   11b24:	fe0794e3          	bnez	a5,11b0c <__lesf2+0x80>
   11b28:	fff00513          	li	a0,-1
   11b2c:	fe0718e3          	bnez	a4,11b1c <__lesf2+0x90>
   11b30:	00100513          	li	a0,1
   11b34:	00008067          	ret

00011b38 <__mulsf3>:
   11b38:	fe010113          	addi	sp,sp,-32
   11b3c:	01212823          	sw	s2,16(sp)
   11b40:	01755913          	srli	s2,a0,0x17
   11b44:	00912a23          	sw	s1,20(sp)
   11b48:	01312623          	sw	s3,12(sp)
   11b4c:	01512223          	sw	s5,4(sp)
   11b50:	00951493          	slli	s1,a0,0x9
   11b54:	00112e23          	sw	ra,28(sp)
   11b58:	00812c23          	sw	s0,24(sp)
   11b5c:	01412423          	sw	s4,8(sp)
   11b60:	0ff97913          	zext.b	s2,s2
   11b64:	00058a93          	mv	s5,a1
   11b68:	0094d493          	srli	s1,s1,0x9
   11b6c:	01f55993          	srli	s3,a0,0x1f
   11b70:	10090863          	beqz	s2,11c80 <__mulsf3+0x148>
   11b74:	0ff00793          	li	a5,255
   11b78:	12f90463          	beq	s2,a5,11ca0 <__mulsf3+0x168>
   11b7c:	00349493          	slli	s1,s1,0x3
   11b80:	040007b7          	lui	a5,0x4000
   11b84:	00f4e4b3          	or	s1,s1,a5
   11b88:	f8190913          	addi	s2,s2,-127
   11b8c:	00000a13          	li	s4,0
   11b90:	017ad793          	srli	a5,s5,0x17
   11b94:	009a9413          	slli	s0,s5,0x9
   11b98:	0ff7f793          	zext.b	a5,a5
   11b9c:	00945413          	srli	s0,s0,0x9
   11ba0:	01fada93          	srli	s5,s5,0x1f
   11ba4:	10078e63          	beqz	a5,11cc0 <__mulsf3+0x188>
   11ba8:	0ff00713          	li	a4,255
   11bac:	12e78a63          	beq	a5,a4,11ce0 <__mulsf3+0x1a8>
   11bb0:	00341413          	slli	s0,s0,0x3
   11bb4:	04000737          	lui	a4,0x4000
   11bb8:	00e46433          	or	s0,s0,a4
   11bbc:	f8178793          	addi	a5,a5,-127 # 3ffff81 <_memory_end+0x3fdff81>
   11bc0:	00000713          	li	a4,0
   11bc4:	00f90933          	add	s2,s2,a5
   11bc8:	002a1793          	slli	a5,s4,0x2
   11bcc:	00e7e7b3          	or	a5,a5,a4
   11bd0:	00a00613          	li	a2,10
   11bd4:	00190693          	addi	a3,s2,1
   11bd8:	1ef64263          	blt	a2,a5,11dbc <__mulsf3+0x284>
   11bdc:	00200613          	li	a2,2
   11be0:	0159c9b3          	xor	s3,s3,s5
   11be4:	10f64e63          	blt	a2,a5,11d00 <__mulsf3+0x1c8>
   11be8:	fff78793          	addi	a5,a5,-1
   11bec:	00100613          	li	a2,1
   11bf0:	12f67a63          	bgeu	a2,a5,11d24 <__mulsf3+0x1ec>
   11bf4:	00010837          	lui	a6,0x10
   11bf8:	fff80513          	addi	a0,a6,-1 # ffff <__multf3+0xd47>
   11bfc:	0104d613          	srli	a2,s1,0x10
   11c00:	01045793          	srli	a5,s0,0x10
   11c04:	00a4f4b3          	and	s1,s1,a0
   11c08:	00a47433          	and	s0,s0,a0
   11c0c:	029405b3          	mul	a1,s0,s1
   11c10:	02860433          	mul	s0,a2,s0
   11c14:	02f60633          	mul	a2,a2,a5
   11c18:	029787b3          	mul	a5,a5,s1
   11c1c:	00878733          	add	a4,a5,s0
   11c20:	0105d793          	srli	a5,a1,0x10
   11c24:	00e787b3          	add	a5,a5,a4
   11c28:	0087f463          	bgeu	a5,s0,11c30 <__mulsf3+0xf8>
   11c2c:	01060633          	add	a2,a2,a6
   11c30:	00a7f733          	and	a4,a5,a0
   11c34:	01071713          	slli	a4,a4,0x10
   11c38:	00a5f5b3          	and	a1,a1,a0
   11c3c:	00b70733          	add	a4,a4,a1
   11c40:	0107d793          	srli	a5,a5,0x10
   11c44:	00671413          	slli	s0,a4,0x6
   11c48:	00c787b3          	add	a5,a5,a2
   11c4c:	01a75713          	srli	a4,a4,0x1a
   11c50:	00679793          	slli	a5,a5,0x6
   11c54:	00803433          	snez	s0,s0
   11c58:	00e46433          	or	s0,s0,a4
   11c5c:	00479713          	slli	a4,a5,0x4
   11c60:	0087e433          	or	s0,a5,s0
   11c64:	00075a63          	bgez	a4,11c78 <__mulsf3+0x140>
   11c68:	00145793          	srli	a5,s0,0x1
   11c6c:	00147413          	andi	s0,s0,1
   11c70:	0087e433          	or	s0,a5,s0
   11c74:	00068913          	mv	s2,a3
   11c78:	00090693          	mv	a3,s2
   11c7c:	0c00006f          	j	11d3c <__mulsf3+0x204>
   11c80:	02048a63          	beqz	s1,11cb4 <__mulsf3+0x17c>
   11c84:	00048513          	mv	a0,s1
   11c88:	2f9000ef          	jal	12780 <__clzsi2>
   11c8c:	ffb50793          	addi	a5,a0,-5
   11c90:	f8a00913          	li	s2,-118
   11c94:	00f494b3          	sll	s1,s1,a5
   11c98:	40a90933          	sub	s2,s2,a0
   11c9c:	ef1ff06f          	j	11b8c <__mulsf3+0x54>
   11ca0:	0ff00913          	li	s2,255
   11ca4:	00200a13          	li	s4,2
   11ca8:	ee0484e3          	beqz	s1,11b90 <__mulsf3+0x58>
   11cac:	00300a13          	li	s4,3
   11cb0:	ee1ff06f          	j	11b90 <__mulsf3+0x58>
   11cb4:	00000913          	li	s2,0
   11cb8:	00100a13          	li	s4,1
   11cbc:	ed5ff06f          	j	11b90 <__mulsf3+0x58>
   11cc0:	02040a63          	beqz	s0,11cf4 <__mulsf3+0x1bc>
   11cc4:	00040513          	mv	a0,s0
   11cc8:	2b9000ef          	jal	12780 <__clzsi2>
   11ccc:	ffb50793          	addi	a5,a0,-5
   11cd0:	00f41433          	sll	s0,s0,a5
   11cd4:	f8a00793          	li	a5,-118
   11cd8:	40a787b3          	sub	a5,a5,a0
   11cdc:	ee5ff06f          	j	11bc0 <__mulsf3+0x88>
   11ce0:	0ff00793          	li	a5,255
   11ce4:	00200713          	li	a4,2
   11ce8:	ec040ee3          	beqz	s0,11bc4 <__mulsf3+0x8c>
   11cec:	00300713          	li	a4,3
   11cf0:	ed5ff06f          	j	11bc4 <__mulsf3+0x8c>
   11cf4:	00000793          	li	a5,0
   11cf8:	00100713          	li	a4,1
   11cfc:	ec9ff06f          	j	11bc4 <__mulsf3+0x8c>
   11d00:	00100613          	li	a2,1
   11d04:	00f617b3          	sll	a5,a2,a5
   11d08:	5307f613          	andi	a2,a5,1328
   11d0c:	0c061063          	bnez	a2,11dcc <__mulsf3+0x294>
   11d10:	2407f613          	andi	a2,a5,576
   11d14:	12061263          	bnez	a2,11e38 <__mulsf3+0x300>
   11d18:	0887f793          	andi	a5,a5,136
   11d1c:	ec078ce3          	beqz	a5,11bf4 <__mulsf3+0xbc>
   11d20:	000a8993          	mv	s3,s5
   11d24:	00200793          	li	a5,2
   11d28:	10f70263          	beq	a4,a5,11e2c <__mulsf3+0x2f4>
   11d2c:	00300793          	li	a5,3
   11d30:	10f70463          	beq	a4,a5,11e38 <__mulsf3+0x300>
   11d34:	00100793          	li	a5,1
   11d38:	10f70863          	beq	a4,a5,11e48 <__mulsf3+0x310>
   11d3c:	07f68713          	addi	a4,a3,127
   11d40:	08e05c63          	blez	a4,11dd8 <__mulsf3+0x2a0>
   11d44:	00747793          	andi	a5,s0,7
   11d48:	00078a63          	beqz	a5,11d5c <__mulsf3+0x224>
   11d4c:	00f47793          	andi	a5,s0,15
   11d50:	00400613          	li	a2,4
   11d54:	00c78463          	beq	a5,a2,11d5c <__mulsf3+0x224>
   11d58:	00440413          	addi	s0,s0,4
   11d5c:	00441793          	slli	a5,s0,0x4
   11d60:	0007da63          	bgez	a5,11d74 <__mulsf3+0x23c>
   11d64:	f80007b7          	lui	a5,0xf8000
   11d68:	fff78793          	addi	a5,a5,-1 # f7ffffff <_memory_end+0xf7fdffff>
   11d6c:	00f47433          	and	s0,s0,a5
   11d70:	08068713          	addi	a4,a3,128
   11d74:	0fe00793          	li	a5,254
   11d78:	0ae7ca63          	blt	a5,a4,11e2c <__mulsf3+0x2f4>
   11d7c:	00345793          	srli	a5,s0,0x3
   11d80:	01c12083          	lw	ra,28(sp)
   11d84:	01812403          	lw	s0,24(sp)
   11d88:	00979793          	slli	a5,a5,0x9
   11d8c:	01771513          	slli	a0,a4,0x17
   11d90:	0097d793          	srli	a5,a5,0x9
   11d94:	01f99993          	slli	s3,s3,0x1f
   11d98:	00f56533          	or	a0,a0,a5
   11d9c:	01412483          	lw	s1,20(sp)
   11da0:	01012903          	lw	s2,16(sp)
   11da4:	00812a03          	lw	s4,8(sp)
   11da8:	00412a83          	lw	s5,4(sp)
   11dac:	01356533          	or	a0,a0,s3
   11db0:	00c12983          	lw	s3,12(sp)
   11db4:	02010113          	addi	sp,sp,32
   11db8:	00008067          	ret
   11dbc:	00f00613          	li	a2,15
   11dc0:	06c78c63          	beq	a5,a2,11e38 <__mulsf3+0x300>
   11dc4:	00b00613          	li	a2,11
   11dc8:	f4c78ce3          	beq	a5,a2,11d20 <__mulsf3+0x1e8>
   11dcc:	00048413          	mv	s0,s1
   11dd0:	000a0713          	mv	a4,s4
   11dd4:	f51ff06f          	j	11d24 <__mulsf3+0x1ec>
   11dd8:	00100793          	li	a5,1
   11ddc:	40e787b3          	sub	a5,a5,a4
   11de0:	01b00713          	li	a4,27
   11de4:	06f74263          	blt	a4,a5,11e48 <__mulsf3+0x310>
   11de8:	09e68693          	addi	a3,a3,158
   11dec:	00d416b3          	sll	a3,s0,a3
   11df0:	00f457b3          	srl	a5,s0,a5
   11df4:	00d036b3          	snez	a3,a3
   11df8:	00d7e7b3          	or	a5,a5,a3
   11dfc:	0077f713          	andi	a4,a5,7
   11e00:	00070a63          	beqz	a4,11e14 <__mulsf3+0x2dc>
   11e04:	00f7f713          	andi	a4,a5,15
   11e08:	00400693          	li	a3,4
   11e0c:	00d70463          	beq	a4,a3,11e14 <__mulsf3+0x2dc>
   11e10:	00478793          	addi	a5,a5,4
   11e14:	00579713          	slli	a4,a5,0x5
   11e18:	0037d793          	srli	a5,a5,0x3
   11e1c:	02075863          	bgez	a4,11e4c <__mulsf3+0x314>
   11e20:	00000793          	li	a5,0
   11e24:	00100713          	li	a4,1
   11e28:	f59ff06f          	j	11d80 <__mulsf3+0x248>
   11e2c:	00000793          	li	a5,0
   11e30:	0ff00713          	li	a4,255
   11e34:	f4dff06f          	j	11d80 <__mulsf3+0x248>
   11e38:	004007b7          	lui	a5,0x400
   11e3c:	0ff00713          	li	a4,255
   11e40:	00000993          	li	s3,0
   11e44:	f3dff06f          	j	11d80 <__mulsf3+0x248>
   11e48:	00000793          	li	a5,0
   11e4c:	00000713          	li	a4,0
   11e50:	f31ff06f          	j	11d80 <__mulsf3+0x248>

00011e54 <__subsf3>:
   11e54:	008006b7          	lui	a3,0x800
   11e58:	fff68693          	addi	a3,a3,-1 # 7fffff <_memory_end+0x7dffff>
   11e5c:	ff010113          	addi	sp,sp,-16
   11e60:	00a6f633          	and	a2,a3,a0
   11e64:	01755713          	srli	a4,a0,0x17
   11e68:	00812423          	sw	s0,8(sp)
   11e6c:	01f55413          	srli	s0,a0,0x1f
   11e70:	00361513          	slli	a0,a2,0x3
   11e74:	0175d613          	srli	a2,a1,0x17
   11e78:	00b6f6b3          	and	a3,a3,a1
   11e7c:	01212023          	sw	s2,0(sp)
   11e80:	00112623          	sw	ra,12(sp)
   11e84:	0ff77913          	zext.b	s2,a4
   11e88:	00912223          	sw	s1,4(sp)
   11e8c:	0ff67613          	zext.b	a2,a2
   11e90:	0ff00713          	li	a4,255
   11e94:	01f5d593          	srli	a1,a1,0x1f
   11e98:	00369793          	slli	a5,a3,0x3
   11e9c:	00e61463          	bne	a2,a4,11ea4 <__subsf3+0x50>
   11ea0:	00079463          	bnez	a5,11ea8 <__subsf3+0x54>
   11ea4:	0015c593          	xori	a1,a1,1
   11ea8:	40c906b3          	sub	a3,s2,a2
   11eac:	18859063          	bne	a1,s0,1202c <__subsf3+0x1d8>
   11eb0:	08d05c63          	blez	a3,11f48 <__subsf3+0xf4>
   11eb4:	02061663          	bnez	a2,11ee0 <__subsf3+0x8c>
   11eb8:	02078063          	beqz	a5,11ed8 <__subsf3+0x84>
   11ebc:	fff90693          	addi	a3,s2,-1
   11ec0:	00069863          	bnez	a3,11ed0 <__subsf3+0x7c>
   11ec4:	00a787b3          	add	a5,a5,a0
   11ec8:	00100913          	li	s2,1
   11ecc:	04c0006f          	j	11f18 <__subsf3+0xc4>
   11ed0:	0ff00713          	li	a4,255
   11ed4:	00e91e63          	bne	s2,a4,11ef0 <__subsf3+0x9c>
   11ed8:	00050793          	mv	a5,a0
   11edc:	10c0006f          	j	11fe8 <__subsf3+0x194>
   11ee0:	0ff00713          	li	a4,255
   11ee4:	fee90ae3          	beq	s2,a4,11ed8 <__subsf3+0x84>
   11ee8:	04000737          	lui	a4,0x4000
   11eec:	00e7e7b3          	or	a5,a5,a4
   11ef0:	01b00613          	li	a2,27
   11ef4:	00100713          	li	a4,1
   11ef8:	00d64e63          	blt	a2,a3,11f14 <__subsf3+0xc0>
   11efc:	02000613          	li	a2,32
   11f00:	00d7d733          	srl	a4,a5,a3
   11f04:	40d606b3          	sub	a3,a2,a3
   11f08:	00d796b3          	sll	a3,a5,a3
   11f0c:	00d036b3          	snez	a3,a3
   11f10:	00d76733          	or	a4,a4,a3
   11f14:	00a707b3          	add	a5,a4,a0
   11f18:	00579713          	slli	a4,a5,0x5
   11f1c:	0c075663          	bgez	a4,11fe8 <__subsf3+0x194>
   11f20:	00190913          	addi	s2,s2,1
   11f24:	0ff00713          	li	a4,255
   11f28:	2ce90a63          	beq	s2,a4,121fc <__subsf3+0x3a8>
   11f2c:	7e000737          	lui	a4,0x7e000
   11f30:	0017f693          	andi	a3,a5,1
   11f34:	fff70713          	addi	a4,a4,-1 # 7dffffff <_memory_end+0x7dfdffff>
   11f38:	0017d793          	srli	a5,a5,0x1
   11f3c:	00e7f7b3          	and	a5,a5,a4
   11f40:	00d7e7b3          	or	a5,a5,a3
   11f44:	0a40006f          	j	11fe8 <__subsf3+0x194>
   11f48:	06068663          	beqz	a3,11fb4 <__subsf3+0x160>
   11f4c:	41260733          	sub	a4,a2,s2
   11f50:	02091063          	bnez	s2,11f70 <__subsf3+0x11c>
   11f54:	0c050863          	beqz	a0,12024 <__subsf3+0x1d0>
   11f58:	fff70693          	addi	a3,a4,-1
   11f5c:	f60684e3          	beqz	a3,11ec4 <__subsf3+0x70>
   11f60:	0ff00593          	li	a1,255
   11f64:	02b71063          	bne	a4,a1,11f84 <__subsf3+0x130>
   11f68:	0ff00913          	li	s2,255
   11f6c:	07c0006f          	j	11fe8 <__subsf3+0x194>
   11f70:	0ff00693          	li	a3,255
   11f74:	fed60ae3          	beq	a2,a3,11f68 <__subsf3+0x114>
   11f78:	040006b7          	lui	a3,0x4000
   11f7c:	00d56533          	or	a0,a0,a3
   11f80:	00070693          	mv	a3,a4
   11f84:	01b00593          	li	a1,27
   11f88:	00100713          	li	a4,1
   11f8c:	00d5ce63          	blt	a1,a3,11fa8 <__subsf3+0x154>
   11f90:	02000713          	li	a4,32
   11f94:	40d70733          	sub	a4,a4,a3
   11f98:	00e51733          	sll	a4,a0,a4
   11f9c:	00d555b3          	srl	a1,a0,a3
   11fa0:	00e03733          	snez	a4,a4
   11fa4:	00e5e733          	or	a4,a1,a4
   11fa8:	00e787b3          	add	a5,a5,a4
   11fac:	00060913          	mv	s2,a2
   11fb0:	f69ff06f          	j	11f18 <__subsf3+0xc4>
   11fb4:	00190713          	addi	a4,s2,1
   11fb8:	0fe77693          	andi	a3,a4,254
   11fbc:	04069c63          	bnez	a3,12014 <__subsf3+0x1c0>
   11fc0:	04091263          	bnez	s2,12004 <__subsf3+0x1b0>
   11fc4:	02050263          	beqz	a0,11fe8 <__subsf3+0x194>
   11fc8:	f00788e3          	beqz	a5,11ed8 <__subsf3+0x84>
   11fcc:	00a787b3          	add	a5,a5,a0
   11fd0:	00579713          	slli	a4,a5,0x5
   11fd4:	00075a63          	bgez	a4,11fe8 <__subsf3+0x194>
   11fd8:	fc000737          	lui	a4,0xfc000
   11fdc:	fff70713          	addi	a4,a4,-1 # fbffffff <_memory_end+0xfbfdffff>
   11fe0:	00e7f7b3          	and	a5,a5,a4
   11fe4:	00100913          	li	s2,1
   11fe8:	0077f713          	andi	a4,a5,7
   11fec:	20070a63          	beqz	a4,12200 <__subsf3+0x3ac>
   11ff0:	00f7f713          	andi	a4,a5,15
   11ff4:	00400693          	li	a3,4
   11ff8:	20d70463          	beq	a4,a3,12200 <__subsf3+0x3ac>
   11ffc:	00478793          	addi	a5,a5,4 # 400004 <_memory_end+0x3e0004>
   12000:	2000006f          	j	12200 <__subsf3+0x3ac>
   12004:	f60502e3          	beqz	a0,11f68 <__subsf3+0x114>
   12008:	16079663          	bnez	a5,12174 <__subsf3+0x320>
   1200c:	00050793          	mv	a5,a0
   12010:	f59ff06f          	j	11f68 <__subsf3+0x114>
   12014:	0ff00693          	li	a3,255
   12018:	1ed70063          	beq	a4,a3,121f8 <__subsf3+0x3a4>
   1201c:	00f507b3          	add	a5,a0,a5
   12020:	0017d793          	srli	a5,a5,0x1
   12024:	00070913          	mv	s2,a4
   12028:	fc1ff06f          	j	11fe8 <__subsf3+0x194>
   1202c:	06d05e63          	blez	a3,120a8 <__subsf3+0x254>
   12030:	06061263          	bnez	a2,12094 <__subsf3+0x240>
   12034:	ea0782e3          	beqz	a5,11ed8 <__subsf3+0x84>
   12038:	fff90693          	addi	a3,s2,-1
   1203c:	00069863          	bnez	a3,1204c <__subsf3+0x1f8>
   12040:	40f507b3          	sub	a5,a0,a5
   12044:	00100913          	li	s2,1
   12048:	0340006f          	j	1207c <__subsf3+0x228>
   1204c:	0ff00713          	li	a4,255
   12050:	e8e904e3          	beq	s2,a4,11ed8 <__subsf3+0x84>
   12054:	01b00613          	li	a2,27
   12058:	00100713          	li	a4,1
   1205c:	00d64e63          	blt	a2,a3,12078 <__subsf3+0x224>
   12060:	02000613          	li	a2,32
   12064:	00d7d733          	srl	a4,a5,a3
   12068:	40d606b3          	sub	a3,a2,a3
   1206c:	00d796b3          	sll	a3,a5,a3
   12070:	00d036b3          	snez	a3,a3
   12074:	00d76733          	or	a4,a4,a3
   12078:	40e507b3          	sub	a5,a0,a4
   1207c:	00579713          	slli	a4,a5,0x5
   12080:	f60754e3          	bgez	a4,11fe8 <__subsf3+0x194>
   12084:	040004b7          	lui	s1,0x4000
   12088:	fff48493          	addi	s1,s1,-1 # 3ffffff <_memory_end+0x3fdffff>
   1208c:	0097f4b3          	and	s1,a5,s1
   12090:	1080006f          	j	12198 <__subsf3+0x344>
   12094:	0ff00713          	li	a4,255
   12098:	e4e900e3          	beq	s2,a4,11ed8 <__subsf3+0x84>
   1209c:	04000737          	lui	a4,0x4000
   120a0:	00e7e7b3          	or	a5,a5,a4
   120a4:	fb1ff06f          	j	12054 <__subsf3+0x200>
   120a8:	06068e63          	beqz	a3,12124 <__subsf3+0x2d0>
   120ac:	41260733          	sub	a4,a2,s2
   120b0:	02091663          	bnez	s2,120dc <__subsf3+0x288>
   120b4:	1a050e63          	beqz	a0,12270 <__subsf3+0x41c>
   120b8:	fff70693          	addi	a3,a4,-1 # 3ffffff <_memory_end+0x3fdffff>
   120bc:	00069863          	bnez	a3,120cc <__subsf3+0x278>
   120c0:	40a787b3          	sub	a5,a5,a0
   120c4:	00058413          	mv	s0,a1
   120c8:	f7dff06f          	j	12044 <__subsf3+0x1f0>
   120cc:	0ff00813          	li	a6,255
   120d0:	03071063          	bne	a4,a6,120f0 <__subsf3+0x29c>
   120d4:	0ff00913          	li	s2,255
   120d8:	19c0006f          	j	12274 <__subsf3+0x420>
   120dc:	0ff00693          	li	a3,255
   120e0:	fed60ae3          	beq	a2,a3,120d4 <__subsf3+0x280>
   120e4:	040006b7          	lui	a3,0x4000
   120e8:	00d56533          	or	a0,a0,a3
   120ec:	00070693          	mv	a3,a4
   120f0:	01b00813          	li	a6,27
   120f4:	00100713          	li	a4,1
   120f8:	00d84e63          	blt	a6,a3,12114 <__subsf3+0x2c0>
   120fc:	02000713          	li	a4,32
   12100:	40d70733          	sub	a4,a4,a3
   12104:	00e51733          	sll	a4,a0,a4
   12108:	00d55833          	srl	a6,a0,a3
   1210c:	00e03733          	snez	a4,a4
   12110:	00e86733          	or	a4,a6,a4
   12114:	40e787b3          	sub	a5,a5,a4
   12118:	00060913          	mv	s2,a2
   1211c:	00058413          	mv	s0,a1
   12120:	f5dff06f          	j	1207c <__subsf3+0x228>
   12124:	00190713          	addi	a4,s2,1
   12128:	0fe77713          	andi	a4,a4,254
   1212c:	04071c63          	bnez	a4,12184 <__subsf3+0x330>
   12130:	02091c63          	bnez	s2,12168 <__subsf3+0x314>
   12134:	00051863          	bnez	a0,12144 <__subsf3+0x2f0>
   12138:	12079e63          	bnez	a5,12274 <__subsf3+0x420>
   1213c:	00000413          	li	s0,0
   12140:	0c00006f          	j	12200 <__subsf3+0x3ac>
   12144:	d8078ae3          	beqz	a5,11ed8 <__subsf3+0x84>
   12148:	40f50733          	sub	a4,a0,a5
   1214c:	00571693          	slli	a3,a4,0x5
   12150:	40a787b3          	sub	a5,a5,a0
   12154:	1206c063          	bltz	a3,12274 <__subsf3+0x420>
   12158:	00070793          	mv	a5,a4
   1215c:	e80716e3          	bnez	a4,11fe8 <__subsf3+0x194>
   12160:	00000793          	li	a5,0
   12164:	fd9ff06f          	j	1213c <__subsf3+0x2e8>
   12168:	ea0510e3          	bnez	a0,12008 <__subsf3+0x1b4>
   1216c:	00058413          	mv	s0,a1
   12170:	de079ce3          	bnez	a5,11f68 <__subsf3+0x114>
   12174:	00000413          	li	s0,0
   12178:	020007b7          	lui	a5,0x2000
   1217c:	0ff00913          	li	s2,255
   12180:	0800006f          	j	12200 <__subsf3+0x3ac>
   12184:	40f504b3          	sub	s1,a0,a5
   12188:	00549713          	slli	a4,s1,0x5
   1218c:	04075463          	bgez	a4,121d4 <__subsf3+0x380>
   12190:	40a784b3          	sub	s1,a5,a0
   12194:	00058413          	mv	s0,a1
   12198:	00048513          	mv	a0,s1
   1219c:	5e4000ef          	jal	12780 <__clzsi2>
   121a0:	ffb50513          	addi	a0,a0,-5
   121a4:	00a494b3          	sll	s1,s1,a0
   121a8:	03254e63          	blt	a0,s2,121e4 <__subsf3+0x390>
   121ac:	41250533          	sub	a0,a0,s2
   121b0:	00150513          	addi	a0,a0,1
   121b4:	02000713          	li	a4,32
   121b8:	40a70733          	sub	a4,a4,a0
   121bc:	00a4d7b3          	srl	a5,s1,a0
   121c0:	00e494b3          	sll	s1,s1,a4
   121c4:	009034b3          	snez	s1,s1
   121c8:	0097e7b3          	or	a5,a5,s1
   121cc:	00000913          	li	s2,0
   121d0:	e19ff06f          	j	11fe8 <__subsf3+0x194>
   121d4:	fc0492e3          	bnez	s1,12198 <__subsf3+0x344>
   121d8:	00000793          	li	a5,0
   121dc:	00000913          	li	s2,0
   121e0:	f5dff06f          	j	1213c <__subsf3+0x2e8>
   121e4:	fc0007b7          	lui	a5,0xfc000
   121e8:	fff78793          	addi	a5,a5,-1 # fbffffff <_memory_end+0xfbfdffff>
   121ec:	40a90933          	sub	s2,s2,a0
   121f0:	00f4f7b3          	and	a5,s1,a5
   121f4:	df5ff06f          	j	11fe8 <__subsf3+0x194>
   121f8:	0ff00913          	li	s2,255
   121fc:	00000793          	li	a5,0
   12200:	00579713          	slli	a4,a5,0x5
   12204:	00075e63          	bgez	a4,12220 <__subsf3+0x3cc>
   12208:	00190913          	addi	s2,s2,1
   1220c:	0ff00713          	li	a4,255
   12210:	06e90663          	beq	s2,a4,1227c <__subsf3+0x428>
   12214:	fc000737          	lui	a4,0xfc000
   12218:	fff70713          	addi	a4,a4,-1 # fbffffff <_memory_end+0xfbfdffff>
   1221c:	00e7f7b3          	and	a5,a5,a4
   12220:	0ff00713          	li	a4,255
   12224:	0037d793          	srli	a5,a5,0x3
   12228:	00e91863          	bne	s2,a4,12238 <__subsf3+0x3e4>
   1222c:	00078663          	beqz	a5,12238 <__subsf3+0x3e4>
   12230:	004007b7          	lui	a5,0x400
   12234:	00000413          	li	s0,0
   12238:	00c12083          	lw	ra,12(sp)
   1223c:	01791713          	slli	a4,s2,0x17
   12240:	01f41513          	slli	a0,s0,0x1f
   12244:	7f8006b7          	lui	a3,0x7f800
   12248:	00812403          	lw	s0,8(sp)
   1224c:	00979793          	slli	a5,a5,0x9
   12250:	00d77733          	and	a4,a4,a3
   12254:	0097d793          	srli	a5,a5,0x9
   12258:	00f767b3          	or	a5,a4,a5
   1225c:	00412483          	lw	s1,4(sp)
   12260:	00012903          	lw	s2,0(sp)
   12264:	00a7e533          	or	a0,a5,a0
   12268:	01010113          	addi	sp,sp,16
   1226c:	00008067          	ret
   12270:	00070913          	mv	s2,a4
   12274:	00058413          	mv	s0,a1
   12278:	d71ff06f          	j	11fe8 <__subsf3+0x194>
   1227c:	00000793          	li	a5,0
   12280:	fa1ff06f          	j	12220 <__subsf3+0x3cc>

00012284 <__fixsfsi>:
   12284:	00800637          	lui	a2,0x800
   12288:	01755713          	srli	a4,a0,0x17
   1228c:	fff60793          	addi	a5,a2,-1 # 7fffff <_memory_end+0x7dffff>
   12290:	0ff77713          	zext.b	a4,a4
   12294:	07e00593          	li	a1,126
   12298:	00a7f7b3          	and	a5,a5,a0
   1229c:	01f55693          	srli	a3,a0,0x1f
   122a0:	04e5d663          	bge	a1,a4,122ec <__fixsfsi+0x68>
   122a4:	09d00593          	li	a1,157
   122a8:	00e5da63          	bge	a1,a4,122bc <__fixsfsi+0x38>
   122ac:	80000537          	lui	a0,0x80000
   122b0:	fff50513          	addi	a0,a0,-1 # 7fffffff <_memory_end+0x7ffdffff>
   122b4:	00a68533          	add	a0,a3,a0
   122b8:	00008067          	ret
   122bc:	00c7e533          	or	a0,a5,a2
   122c0:	09500793          	li	a5,149
   122c4:	00e7dc63          	bge	a5,a4,122dc <__fixsfsi+0x58>
   122c8:	f6a70713          	addi	a4,a4,-150
   122cc:	00e51533          	sll	a0,a0,a4
   122d0:	02068063          	beqz	a3,122f0 <__fixsfsi+0x6c>
   122d4:	40a00533          	neg	a0,a0
   122d8:	00008067          	ret
   122dc:	09600793          	li	a5,150
   122e0:	40e787b3          	sub	a5,a5,a4
   122e4:	00f55533          	srl	a0,a0,a5
   122e8:	fe9ff06f          	j	122d0 <__fixsfsi+0x4c>
   122ec:	00000513          	li	a0,0
   122f0:	00008067          	ret

000122f4 <__floatsisf>:
   122f4:	ff010113          	addi	sp,sp,-16
   122f8:	00112623          	sw	ra,12(sp)
   122fc:	00812423          	sw	s0,8(sp)
   12300:	00912223          	sw	s1,4(sp)
   12304:	00050793          	mv	a5,a0
   12308:	0e050063          	beqz	a0,123e8 <__floatsisf+0xf4>
   1230c:	41f55713          	srai	a4,a0,0x1f
   12310:	00a74433          	xor	s0,a4,a0
   12314:	40e40433          	sub	s0,s0,a4
   12318:	01f55493          	srli	s1,a0,0x1f
   1231c:	00040513          	mv	a0,s0
   12320:	460000ef          	jal	12780 <__clzsi2>
   12324:	09e00793          	li	a5,158
   12328:	40a787b3          	sub	a5,a5,a0
   1232c:	09600713          	li	a4,150
   12330:	04f74063          	blt	a4,a5,12370 <__floatsisf+0x7c>
   12334:	00800713          	li	a4,8
   12338:	0ae50e63          	beq	a0,a4,123f4 <__floatsisf+0x100>
   1233c:	ff850513          	addi	a0,a0,-8
   12340:	00a41433          	sll	s0,s0,a0
   12344:	00941413          	slli	s0,s0,0x9
   12348:	00945413          	srli	s0,s0,0x9
   1234c:	01779793          	slli	a5,a5,0x17
   12350:	00c12083          	lw	ra,12(sp)
   12354:	0087e7b3          	or	a5,a5,s0
   12358:	00812403          	lw	s0,8(sp)
   1235c:	01f49513          	slli	a0,s1,0x1f
   12360:	00a7e533          	or	a0,a5,a0
   12364:	00412483          	lw	s1,4(sp)
   12368:	01010113          	addi	sp,sp,16
   1236c:	00008067          	ret
   12370:	09900713          	li	a4,153
   12374:	06f75463          	bge	a4,a5,123dc <__floatsisf+0xe8>
   12378:	00500713          	li	a4,5
   1237c:	40a70733          	sub	a4,a4,a0
   12380:	01b50693          	addi	a3,a0,27
   12384:	00e45733          	srl	a4,s0,a4
   12388:	00d41433          	sll	s0,s0,a3
   1238c:	00803433          	snez	s0,s0
   12390:	00876733          	or	a4,a4,s0
   12394:	fc000437          	lui	s0,0xfc000
   12398:	fff40413          	addi	s0,s0,-1 # fbffffff <_memory_end+0xfbfdffff>
   1239c:	00777693          	andi	a3,a4,7
   123a0:	00877433          	and	s0,a4,s0
   123a4:	00068a63          	beqz	a3,123b8 <__floatsisf+0xc4>
   123a8:	00f77713          	andi	a4,a4,15
   123ac:	00400693          	li	a3,4
   123b0:	00d70463          	beq	a4,a3,123b8 <__floatsisf+0xc4>
   123b4:	00440413          	addi	s0,s0,4
   123b8:	00541713          	slli	a4,s0,0x5
   123bc:	00075c63          	bgez	a4,123d4 <__floatsisf+0xe0>
   123c0:	fc0007b7          	lui	a5,0xfc000
   123c4:	fff78793          	addi	a5,a5,-1 # fbffffff <_memory_end+0xfbfdffff>
   123c8:	00f47433          	and	s0,s0,a5
   123cc:	09f00793          	li	a5,159
   123d0:	40a787b3          	sub	a5,a5,a0
   123d4:	00345413          	srli	s0,s0,0x3
   123d8:	f6dff06f          	j	12344 <__floatsisf+0x50>
   123dc:	ffb50713          	addi	a4,a0,-5
   123e0:	00e41733          	sll	a4,s0,a4
   123e4:	fb1ff06f          	j	12394 <__floatsisf+0xa0>
   123e8:	00000493          	li	s1,0
   123ec:	00000413          	li	s0,0
   123f0:	f55ff06f          	j	12344 <__floatsisf+0x50>
   123f4:	09600793          	li	a5,150
   123f8:	f4dff06f          	j	12344 <__floatsisf+0x50>

000123fc <__extenddftf2>:
   123fc:	01465713          	srli	a4,a2,0x14
   12400:	00c61793          	slli	a5,a2,0xc
   12404:	7ff77713          	andi	a4,a4,2047
   12408:	fd010113          	addi	sp,sp,-48
   1240c:	00c7d793          	srli	a5,a5,0xc
   12410:	00170693          	addi	a3,a4,1
   12414:	02812423          	sw	s0,40(sp)
   12418:	02912223          	sw	s1,36(sp)
   1241c:	03212023          	sw	s2,32(sp)
   12420:	02112623          	sw	ra,44(sp)
   12424:	00b12823          	sw	a1,16(sp)
   12428:	00f12a23          	sw	a5,20(sp)
   1242c:	00012e23          	sw	zero,28(sp)
   12430:	00012c23          	sw	zero,24(sp)
   12434:	7fe6f693          	andi	a3,a3,2046
   12438:	00050913          	mv	s2,a0
   1243c:	00058413          	mv	s0,a1
   12440:	01f65493          	srli	s1,a2,0x1f
   12444:	08068263          	beqz	a3,124c8 <__extenddftf2+0xcc>
   12448:	000046b7          	lui	a3,0x4
   1244c:	c0068693          	addi	a3,a3,-1024 # 3c00 <_vfprintf_r+0x17f4>
   12450:	00d70733          	add	a4,a4,a3
   12454:	0047d693          	srli	a3,a5,0x4
   12458:	00d12e23          	sw	a3,28(sp)
   1245c:	01c79793          	slli	a5,a5,0x1c
   12460:	0045d693          	srli	a3,a1,0x4
   12464:	00d7e7b3          	or	a5,a5,a3
   12468:	01c59413          	slli	s0,a1,0x1c
   1246c:	00f12c23          	sw	a5,24(sp)
   12470:	00812a23          	sw	s0,20(sp)
   12474:	00012823          	sw	zero,16(sp)
   12478:	01c12783          	lw	a5,28(sp)
   1247c:	00f49493          	slli	s1,s1,0xf
   12480:	00e4e4b3          	or	s1,s1,a4
   12484:	00f11623          	sh	a5,12(sp)
   12488:	01012783          	lw	a5,16(sp)
   1248c:	00911723          	sh	s1,14(sp)
   12490:	02c12083          	lw	ra,44(sp)
   12494:	00f92023          	sw	a5,0(s2)
   12498:	01412783          	lw	a5,20(sp)
   1249c:	02812403          	lw	s0,40(sp)
   124a0:	02412483          	lw	s1,36(sp)
   124a4:	00f92223          	sw	a5,4(s2)
   124a8:	01812783          	lw	a5,24(sp)
   124ac:	00090513          	mv	a0,s2
   124b0:	00f92423          	sw	a5,8(s2)
   124b4:	00c12783          	lw	a5,12(sp)
   124b8:	00f92623          	sw	a5,12(s2)
   124bc:	02012903          	lw	s2,32(sp)
   124c0:	03010113          	addi	sp,sp,48
   124c4:	00008067          	ret
   124c8:	00b7e533          	or	a0,a5,a1
   124cc:	10071063          	bnez	a4,125cc <__extenddftf2+0x1d0>
   124d0:	fa0504e3          	beqz	a0,12478 <__extenddftf2+0x7c>
   124d4:	04078e63          	beqz	a5,12530 <__extenddftf2+0x134>
   124d8:	00078513          	mv	a0,a5
   124dc:	2a4000ef          	jal	12780 <__clzsi2>
   124e0:	03150693          	addi	a3,a0,49
   124e4:	4056d793          	srai	a5,a3,0x5
   124e8:	01f6f693          	andi	a3,a3,31
   124ec:	04068863          	beqz	a3,1253c <__extenddftf2+0x140>
   124f0:	ffc00613          	li	a2,-4
   124f4:	02c78633          	mul	a2,a5,a2
   124f8:	02000813          	li	a6,32
   124fc:	01010313          	addi	t1,sp,16
   12500:	40d80833          	sub	a6,a6,a3
   12504:	00c60713          	addi	a4,a2,12
   12508:	00e30733          	add	a4,t1,a4
   1250c:	40c00633          	neg	a2,a2
   12510:	08e31c63          	bne	t1,a4,125a8 <__extenddftf2+0x1ac>
   12514:	fff78713          	addi	a4,a5,-1
   12518:	00279793          	slli	a5,a5,0x2
   1251c:	02078793          	addi	a5,a5,32
   12520:	002787b3          	add	a5,a5,sp
   12524:	00d416b3          	sll	a3,s0,a3
   12528:	fed7a823          	sw	a3,-16(a5)
   1252c:	03c0006f          	j	12568 <__extenddftf2+0x16c>
   12530:	250000ef          	jal	12780 <__clzsi2>
   12534:	02050513          	addi	a0,a0,32
   12538:	fa9ff06f          	j	124e0 <__extenddftf2+0xe4>
   1253c:	ffc00613          	li	a2,-4
   12540:	02c78633          	mul	a2,a5,a2
   12544:	01c10713          	addi	a4,sp,28
   12548:	00300693          	li	a3,3
   1254c:	00c705b3          	add	a1,a4,a2
   12550:	0005a583          	lw	a1,0(a1)
   12554:	fff68693          	addi	a3,a3,-1
   12558:	ffc70713          	addi	a4,a4,-4
   1255c:	00b72223          	sw	a1,4(a4)
   12560:	fef6d6e3          	bge	a3,a5,1254c <__extenddftf2+0x150>
   12564:	fff78713          	addi	a4,a5,-1
   12568:	00170793          	addi	a5,a4,1
   1256c:	00279793          	slli	a5,a5,0x2
   12570:	00800693          	li	a3,8
   12574:	01010713          	addi	a4,sp,16
   12578:	00d7ea63          	bltu	a5,a3,1258c <__extenddftf2+0x190>
   1257c:	00012823          	sw	zero,16(sp)
   12580:	00072223          	sw	zero,4(a4)
   12584:	ff878793          	addi	a5,a5,-8
   12588:	01810713          	addi	a4,sp,24
   1258c:	00400693          	li	a3,4
   12590:	00d7e463          	bltu	a5,a3,12598 <__extenddftf2+0x19c>
   12594:	00072023          	sw	zero,0(a4)
   12598:	00004737          	lui	a4,0x4
   1259c:	c0c70713          	addi	a4,a4,-1012 # 3c0c <_vfprintf_r+0x1800>
   125a0:	40a70733          	sub	a4,a4,a0
   125a4:	ed5ff06f          	j	12478 <__extenddftf2+0x7c>
   125a8:	00072583          	lw	a1,0(a4)
   125ac:	ffc72883          	lw	a7,-4(a4)
   125b0:	00c70e33          	add	t3,a4,a2
   125b4:	00d595b3          	sll	a1,a1,a3
   125b8:	0108d8b3          	srl	a7,a7,a6
   125bc:	0115e5b3          	or	a1,a1,a7
   125c0:	00be2023          	sw	a1,0(t3)
   125c4:	ffc70713          	addi	a4,a4,-4
   125c8:	f49ff06f          	j	12510 <__extenddftf2+0x114>
   125cc:	02050863          	beqz	a0,125fc <__extenddftf2+0x200>
   125d0:	01c79713          	slli	a4,a5,0x1c
   125d4:	0045d693          	srli	a3,a1,0x4
   125d8:	00d76733          	or	a4,a4,a3
   125dc:	00e12c23          	sw	a4,24(sp)
   125e0:	0047d793          	srli	a5,a5,0x4
   125e4:	00008737          	lui	a4,0x8
   125e8:	01c59413          	slli	s0,a1,0x1c
   125ec:	00e7e7b3          	or	a5,a5,a4
   125f0:	00812a23          	sw	s0,20(sp)
   125f4:	00012823          	sw	zero,16(sp)
   125f8:	00f12e23          	sw	a5,28(sp)
   125fc:	00008737          	lui	a4,0x8
   12600:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x11a3>
   12604:	e75ff06f          	j	12478 <__extenddftf2+0x7c>

00012608 <__truncdfsf2>:
   12608:	0145d613          	srli	a2,a1,0x14
   1260c:	7ff67613          	andi	a2,a2,2047
   12610:	00c59793          	slli	a5,a1,0xc
   12614:	00160713          	addi	a4,a2,1
   12618:	0097d793          	srli	a5,a5,0x9
   1261c:	01d55693          	srli	a3,a0,0x1d
   12620:	7fe77713          	andi	a4,a4,2046
   12624:	00f6e6b3          	or	a3,a3,a5
   12628:	01f5d593          	srli	a1,a1,0x1f
   1262c:	00351793          	slli	a5,a0,0x3
   12630:	0a070663          	beqz	a4,126dc <__truncdfsf2+0xd4>
   12634:	c8060713          	addi	a4,a2,-896
   12638:	0fe00813          	li	a6,254
   1263c:	0ce84263          	blt	a6,a4,12700 <__truncdfsf2+0xf8>
   12640:	08e04063          	bgtz	a4,126c0 <__truncdfsf2+0xb8>
   12644:	fe900513          	li	a0,-23
   12648:	10a74a63          	blt	a4,a0,1275c <__truncdfsf2+0x154>
   1264c:	00800537          	lui	a0,0x800
   12650:	00a6e6b3          	or	a3,a3,a0
   12654:	01e00513          	li	a0,30
   12658:	40e50533          	sub	a0,a0,a4
   1265c:	01f00813          	li	a6,31
   12660:	02a84863          	blt	a6,a0,12690 <__truncdfsf2+0x88>
   12664:	c8260613          	addi	a2,a2,-894
   12668:	00a7d533          	srl	a0,a5,a0
   1266c:	00c797b3          	sll	a5,a5,a2
   12670:	00f037b3          	snez	a5,a5
   12674:	00c696b3          	sll	a3,a3,a2
   12678:	00d7e7b3          	or	a5,a5,a3
   1267c:	00f567b3          	or	a5,a0,a5
   12680:	00000713          	li	a4,0
   12684:	0077f693          	andi	a3,a5,7
   12688:	08068063          	beqz	a3,12708 <__truncdfsf2+0x100>
   1268c:	0d80006f          	j	12764 <__truncdfsf2+0x15c>
   12690:	ffe00813          	li	a6,-2
   12694:	40e80833          	sub	a6,a6,a4
   12698:	02000893          	li	a7,32
   1269c:	0106d833          	srl	a6,a3,a6
   126a0:	00000713          	li	a4,0
   126a4:	01150663          	beq	a0,a7,126b0 <__truncdfsf2+0xa8>
   126a8:	ca260613          	addi	a2,a2,-862
   126ac:	00c69733          	sll	a4,a3,a2
   126b0:	00f76733          	or	a4,a4,a5
   126b4:	00e03733          	snez	a4,a4
   126b8:	00e867b3          	or	a5,a6,a4
   126bc:	fc5ff06f          	j	12680 <__truncdfsf2+0x78>
   126c0:	00651513          	slli	a0,a0,0x6
   126c4:	00a03533          	snez	a0,a0
   126c8:	00369693          	slli	a3,a3,0x3
   126cc:	01d7d793          	srli	a5,a5,0x1d
   126d0:	00d566b3          	or	a3,a0,a3
   126d4:	00f6e7b3          	or	a5,a3,a5
   126d8:	fadff06f          	j	12684 <__truncdfsf2+0x7c>
   126dc:	00f6e7b3          	or	a5,a3,a5
   126e0:	00061663          	bnez	a2,126ec <__truncdfsf2+0xe4>
   126e4:	00f037b3          	snez	a5,a5
   126e8:	f99ff06f          	j	12680 <__truncdfsf2+0x78>
   126ec:	0ff00713          	li	a4,255
   126f0:	00078c63          	beqz	a5,12708 <__truncdfsf2+0x100>
   126f4:	00369693          	slli	a3,a3,0x3
   126f8:	020007b7          	lui	a5,0x2000
   126fc:	fd9ff06f          	j	126d4 <__truncdfsf2+0xcc>
   12700:	00000793          	li	a5,0
   12704:	0ff00713          	li	a4,255
   12708:	00579693          	slli	a3,a5,0x5
   1270c:	0006de63          	bgez	a3,12728 <__truncdfsf2+0x120>
   12710:	00170713          	addi	a4,a4,1
   12714:	0ff00693          	li	a3,255
   12718:	06d70063          	beq	a4,a3,12778 <__truncdfsf2+0x170>
   1271c:	fc0006b7          	lui	a3,0xfc000
   12720:	fff68693          	addi	a3,a3,-1 # fbffffff <_memory_end+0xfbfdffff>
   12724:	00d7f7b3          	and	a5,a5,a3
   12728:	0ff00693          	li	a3,255
   1272c:	0037d793          	srli	a5,a5,0x3
   12730:	00d71863          	bne	a4,a3,12740 <__truncdfsf2+0x138>
   12734:	00078663          	beqz	a5,12740 <__truncdfsf2+0x138>
   12738:	004007b7          	lui	a5,0x400
   1273c:	00000593          	li	a1,0
   12740:	7f8006b7          	lui	a3,0x7f800
   12744:	01771713          	slli	a4,a4,0x17
   12748:	00d77733          	and	a4,a4,a3
   1274c:	00f76733          	or	a4,a4,a5
   12750:	01f59513          	slli	a0,a1,0x1f
   12754:	00a76533          	or	a0,a4,a0
   12758:	00008067          	ret
   1275c:	00100793          	li	a5,1
   12760:	00000713          	li	a4,0
   12764:	00f7f693          	andi	a3,a5,15
   12768:	00400613          	li	a2,4
   1276c:	f8c68ee3          	beq	a3,a2,12708 <__truncdfsf2+0x100>
   12770:	00478793          	addi	a5,a5,4 # 400004 <_memory_end+0x3e0004>
   12774:	f95ff06f          	j	12708 <__truncdfsf2+0x100>
   12778:	00000793          	li	a5,0
   1277c:	fadff06f          	j	12728 <__truncdfsf2+0x120>

00012780 <__clzsi2>:
   12780:	000107b7          	lui	a5,0x10
   12784:	02f57a63          	bgeu	a0,a5,127b8 <__clzsi2+0x38>
   12788:	10053793          	sltiu	a5,a0,256
   1278c:	0017b793          	seqz	a5,a5
   12790:	00379793          	slli	a5,a5,0x3
   12794:	00013737          	lui	a4,0x13
   12798:	02000693          	li	a3,32
   1279c:	40f686b3          	sub	a3,a3,a5
   127a0:	00f55533          	srl	a0,a0,a5
   127a4:	34c70793          	addi	a5,a4,844 # 1334c <__clz_tab>
   127a8:	00a787b3          	add	a5,a5,a0
   127ac:	0007c503          	lbu	a0,0(a5) # 10000 <__multf3+0xd48>
   127b0:	40a68533          	sub	a0,a3,a0
   127b4:	00008067          	ret
   127b8:	01000737          	lui	a4,0x1000
   127bc:	01800793          	li	a5,24
   127c0:	fce57ae3          	bgeu	a0,a4,12794 <__clzsi2+0x14>
   127c4:	01000793          	li	a5,16
   127c8:	fcdff06f          	j	12794 <__clzsi2+0x14>
   127cc:	0000                	.insn	2, 0x
	...

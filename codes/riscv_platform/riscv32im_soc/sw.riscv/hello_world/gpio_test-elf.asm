
gpio_test.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00013197          	auipc	gp,0x13
       4:	91018193          	addi	gp,gp,-1776 # 12910 <__global_pointer$>
       8:	00020117          	auipc	sp,0x20
       c:	ff810113          	addi	sp,sp,-8 # 20000 <_memory_end>
      10:	00014e17          	auipc	t3,0x14
      14:	e38e0e13          	addi	t3,t3,-456 # 13e48 <CSRA_VERSION>
      18:	00014e97          	auipc	t4,0x14
      1c:	fc4e8e93          	addi	t4,t4,-60 # 13fdc <_bss_end>
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
      48:	6ec30313          	addi	t1,t1,1772 # 13730 <tohost>
      4c:	00532023          	sw	t0,0(t1)
      50:	0000006f          	j	50 <terminate+0x10>

00000054 <delay_ms>:
      54:	fd010113          	addi	sp,sp,-48
      58:	02812623          	sw	s0,44(sp)
      5c:	03010413          	addi	s0,sp,48
      60:	fca42e23          	sw	a0,-36(s0)
      64:	fdc42703          	lw	a4,-36(s0)
      68:	000027b7          	lui	a5,0x2
      6c:	71078793          	addi	a5,a5,1808 # 2710 <_vfprintf_r+0x200>
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
      b8:	de07a783          	lw	a5,-544(a5) # 13de0 <gpio_output_value>
      bc:	0ff7f713          	zext.b	a4,a5
      c0:	fec42783          	lw	a5,-20(s0)
      c4:	00879793          	slli	a5,a5,0x8
      c8:	00f76733          	or	a4,a4,a5
      cc:	000147b7          	lui	a5,0x14
      d0:	dee7a023          	sw	a4,-544(a5) # 13de0 <gpio_output_value>
      d4:	000147b7          	lui	a5,0x14
      d8:	de07a783          	lw	a5,-544(a5) # 13de0 <gpio_output_value>
      dc:	00078513          	mv	a0,a5
      e0:	5a0010ef          	jal	1680 <gpio_write>
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
     10c:	de07a783          	lw	a5,-544(a5) # 13de0 <gpio_output_value>
     110:	0ff7f713          	zext.b	a4,a5
     114:	000147b7          	lui	a5,0x14
     118:	dee7a023          	sw	a4,-544(a5) # 13de0 <gpio_output_value>
     11c:	000147b7          	lui	a5,0x14
     120:	de07a783          	lw	a5,-544(a5) # 13de0 <gpio_output_value>
     124:	00078513          	mv	a0,a5
     128:	558010ef          	jal	1680 <gpio_write>
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
     164:	058020ef          	jal	21bc <i2c_eeprom_read_bytes>
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
     234:	048020ef          	jal	227c <i2c_eeprom_write_bytes>
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
     280:	73d010ef          	jal	21bc <i2c_eeprom_read_bytes>
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
     300:	294010ef          	jal	1594 <uart_set_addr>
     304:	00100713          	li	a4,1
     308:	00000693          	li	a3,0
     30c:	00800613          	li	a2,8
     310:	0001c7b7          	lui	a5,0x1c
     314:	20078593          	addi	a1,a5,512 # 1c200 <_bss_end+0x8224>
     318:	05f5e7b7          	lui	a5,0x5f5e
     31c:	10078513          	addi	a0,a5,256 # 5f5e100 <_memory_end+0x5f3e100>
     320:	425000ef          	jal	f44 <uart_init>
     324:	90030537          	lui	a0,0x90030
     328:	6c8010ef          	jal	19f0 <gpio_set_addr>
     32c:	90030537          	lui	a0,0x90030
     330:	7a0010ef          	jal	1ad0 <keypad_init>
     334:	00000693          	li	a3,0
     338:	00000613          	li	a2,0
     33c:	00000593          	li	a1,0
     340:	000107b7          	lui	a5,0x10
     344:	fff78513          	addi	a0,a5,-1 # ffff <__multf3+0xc07>
     348:	36c010ef          	jal	16b4 <gpio_init>
     34c:	00f00513          	li	a0,15
     350:	330010ef          	jal	1680 <gpio_write>
     354:	da5ff0ef          	jal	f8 <led_clear>
     358:	00018513          	mv	a0,gp
     35c:	5bc000ef          	jal	918 <my_printf>
     360:	06400513          	li	a0,100
     364:	cf1ff0ef          	jal	54 <delay_ms>
     368:	90040537          	lui	a0,0x90040
     36c:	5a5010ef          	jal	2110 <i2c_set_addr>
     370:	01418513          	addi	a0,gp,20 # 12924 <__global_pointer$+0x14>
     374:	5a4000ef          	jal	918 <my_printf>
     378:	06400513          	li	a0,100
     37c:	cd9ff0ef          	jal	54 <delay_ms>
     380:	fc042623          	sw	zero,-52(s0)
     384:	eddff0ef          	jal	260 <is_password_set>
     388:	00050793          	mv	a5,a0
     38c:	06078463          	beqz	a5,3f4 <main+0x108>
     390:	fbc40793          	addi	a5,s0,-68
     394:	00078513          	mv	a0,a5
     398:	da9ff0ef          	jal	140 <read_password_from_eeprom>
     39c:	00050793          	mv	a5,a0
     3a0:	02079863          	bnez	a5,3d0 <main+0xe4>
     3a4:	00100793          	li	a5,1
     3a8:	fcf42623          	sw	a5,-52(s0)
     3ac:	00200793          	li	a5,2
     3b0:	fef42623          	sw	a5,-20(s0)
     3b4:	02818513          	addi	a0,gp,40 # 12938 <__global_pointer$+0x28>
     3b8:	560000ef          	jal	918 <my_printf>
     3bc:	04018513          	addi	a0,gp,64 # 12950 <__global_pointer$+0x40>
     3c0:	558000ef          	jal	918 <my_printf>
     3c4:	06418513          	addi	a0,gp,100 # 12974 <__global_pointer$+0x64>
     3c8:	550000ef          	jal	918 <my_printf>
     3cc:	0480006f          	j	414 <main+0x128>
     3d0:	fc042623          	sw	zero,-52(s0)
     3d4:	fe042623          	sw	zero,-20(s0)
     3d8:	0a418513          	addi	a0,gp,164 # 129b4 <__global_pointer$+0xa4>
     3dc:	53c000ef          	jal	918 <my_printf>
     3e0:	0bc18513          	addi	a0,gp,188 # 129cc <__global_pointer$+0xbc>
     3e4:	534000ef          	jal	918 <my_printf>
     3e8:	0e818513          	addi	a0,gp,232 # 129f8 <__global_pointer$+0xe8>
     3ec:	52c000ef          	jal	918 <my_printf>
     3f0:	0240006f          	j	414 <main+0x128>
     3f4:	fc042623          	sw	zero,-52(s0)
     3f8:	fe042623          	sw	zero,-20(s0)
     3fc:	0a418513          	addi	a0,gp,164 # 129b4 <__global_pointer$+0xa4>
     400:	518000ef          	jal	918 <my_printf>
     404:	0bc18513          	addi	a0,gp,188 # 129cc <__global_pointer$+0xbc>
     408:	510000ef          	jal	918 <my_printf>
     40c:	0e818513          	addi	a0,gp,232 # 129f8 <__global_pointer$+0xe8>
     410:	508000ef          	jal	918 <my_printf>
     414:	fe0405a3          	sb	zero,-21(s0)
     418:	fe040523          	sb	zero,-22(s0)
     41c:	fe042223          	sw	zero,-28(s0)
     420:	fe042023          	sw	zero,-32(s0)
     424:	fc040fa3          	sb	zero,-33(s0)
     428:	00500793          	li	a5,5
     42c:	fcf42423          	sw	a5,-56(s0)
     430:	00a00793          	li	a5,10
     434:	fcf42223          	sw	a5,-60(s0)
     438:	011010ef          	jal	1c48 <keypad_get_char>
     43c:	00050793          	mv	a5,a0
     440:	fcf401a3          	sb	a5,-61(s0)
     444:	fc344783          	lbu	a5,-61(s0)
     448:	38078263          	beqz	a5,7cc <main+0x4e0>
     44c:	fc344703          	lbu	a4,-61(s0)
     450:	fea44783          	lbu	a5,-22(s0)
     454:	34f71e63          	bne	a4,a5,7b0 <main+0x4c4>
     458:	fe442783          	lw	a5,-28(s0)
     45c:	00178793          	addi	a5,a5,1
     460:	fef42223          	sw	a5,-28(s0)
     464:	fe042023          	sw	zero,-32(s0)
     468:	fe442703          	lw	a4,-28(s0)
     46c:	fc842783          	lw	a5,-56(s0)
     470:	38f76663          	bltu	a4,a5,7fc <main+0x510>
     474:	fdf44783          	lbu	a5,-33(s0)
     478:	38079263          	bnez	a5,7fc <main+0x510>
     47c:	00100793          	li	a5,1
     480:	fcf40fa3          	sb	a5,-33(s0)
     484:	fc344703          	lbu	a4,-61(s0)
     488:	04100793          	li	a5,65
     48c:	04f71063          	bne	a4,a5,4cc <main+0x1e0>
     490:	fec42783          	lw	a5,-20(s0)
     494:	00078863          	beqz	a5,4a4 <main+0x1b8>
     498:	fec42703          	lw	a4,-20(s0)
     49c:	00200793          	li	a5,2
     4a0:	34f71e63          	bne	a4,a5,7fc <main+0x510>
     4a4:	00100793          	li	a5,1
     4a8:	fef42623          	sw	a5,-20(s0)
     4ac:	fe0405a3          	sb	zero,-21(s0)
     4b0:	12418513          	addi	a0,gp,292 # 12a34 <__global_pointer$+0x124>
     4b4:	464000ef          	jal	918 <my_printf>
     4b8:	14418513          	addi	a0,gp,324 # 12a54 <__global_pointer$+0x144>
     4bc:	45c000ef          	jal	918 <my_printf>
     4c0:	16c18513          	addi	a0,gp,364 # 12a7c <__global_pointer$+0x16c>
     4c4:	454000ef          	jal	918 <my_printf>
     4c8:	3340006f          	j	7fc <main+0x510>
     4cc:	fc344703          	lbu	a4,-61(s0)
     4d0:	04200793          	li	a5,66
     4d4:	02f71c63          	bne	a4,a5,50c <main+0x220>
     4d8:	fec42703          	lw	a4,-20(s0)
     4dc:	00100793          	li	a5,1
     4e0:	30f71e63          	bne	a4,a5,7fc <main+0x510>
     4e4:	00200793          	li	a5,2
     4e8:	fef42623          	sw	a5,-20(s0)
     4ec:	fe0405a3          	sb	zero,-21(s0)
     4f0:	02818513          	addi	a0,gp,40 # 12938 <__global_pointer$+0x28>
     4f4:	424000ef          	jal	918 <my_printf>
     4f8:	04018513          	addi	a0,gp,64 # 12950 <__global_pointer$+0x40>
     4fc:	41c000ef          	jal	918 <my_printf>
     500:	18018513          	addi	a0,gp,384 # 12a90 <__global_pointer$+0x180>
     504:	414000ef          	jal	918 <my_printf>
     508:	2f40006f          	j	7fc <main+0x510>
     50c:	fc344703          	lbu	a4,-61(s0)
     510:	04400793          	li	a5,68
     514:	22f71a63          	bne	a4,a5,748 <main+0x45c>
     518:	fec42703          	lw	a4,-20(s0)
     51c:	00100793          	li	a5,1
     520:	0ef71663          	bne	a4,a5,60c <main+0x320>
     524:	feb44703          	lbu	a4,-21(s0)
     528:	00400793          	li	a5,4
     52c:	0af71a63          	bne	a4,a5,5e0 <main+0x2f4>
     530:	fb840793          	addi	a5,s0,-72
     534:	00078513          	mv	a0,a5
     538:	c99ff0ef          	jal	1d0 <save_password_to_eeprom>
     53c:	00050793          	mv	a5,a0
     540:	06079a63          	bnez	a5,5b4 <main+0x2c8>
     544:	fc042c23          	sw	zero,-40(s0)
     548:	0300006f          	j	578 <main+0x28c>
     54c:	fd842783          	lw	a5,-40(s0)
     550:	ff078793          	addi	a5,a5,-16
     554:	008787b3          	add	a5,a5,s0
     558:	fc87c703          	lbu	a4,-56(a5)
     55c:	fd842783          	lw	a5,-40(s0)
     560:	ff078793          	addi	a5,a5,-16
     564:	008787b3          	add	a5,a5,s0
     568:	fce78623          	sb	a4,-52(a5)
     56c:	fd842783          	lw	a5,-40(s0)
     570:	00178793          	addi	a5,a5,1
     574:	fcf42c23          	sw	a5,-40(s0)
     578:	fd842703          	lw	a4,-40(s0)
     57c:	00300793          	li	a5,3
     580:	fce7d6e3          	bge	a5,a4,54c <main+0x260>
     584:	1a018513          	addi	a0,gp,416 # 12ab0 <__global_pointer$+0x1a0>
     588:	390000ef          	jal	918 <my_printf>
     58c:	00200793          	li	a5,2
     590:	fef42623          	sw	a5,-20(s0)
     594:	fe0405a3          	sb	zero,-21(s0)
     598:	1c418513          	addi	a0,gp,452 # 12ad4 <__global_pointer$+0x1c4>
     59c:	37c000ef          	jal	918 <my_printf>
     5a0:	04018513          	addi	a0,gp,64 # 12950 <__global_pointer$+0x40>
     5a4:	374000ef          	jal	918 <my_printf>
     5a8:	18018513          	addi	a0,gp,384 # 12a90 <__global_pointer$+0x180>
     5ac:	36c000ef          	jal	918 <my_printf>
     5b0:	24c0006f          	j	7fc <main+0x510>
     5b4:	1d818513          	addi	a0,gp,472 # 12ae8 <__global_pointer$+0x1d8>
     5b8:	360000ef          	jal	918 <my_printf>
     5bc:	fe042623          	sw	zero,-20(s0)
     5c0:	fe0405a3          	sb	zero,-21(s0)
     5c4:	1fc18513          	addi	a0,gp,508 # 12b0c <__global_pointer$+0x1fc>
     5c8:	350000ef          	jal	918 <my_printf>
     5cc:	0bc18513          	addi	a0,gp,188 # 129cc <__global_pointer$+0xbc>
     5d0:	348000ef          	jal	918 <my_printf>
     5d4:	0e818513          	addi	a0,gp,232 # 129f8 <__global_pointer$+0xe8>
     5d8:	340000ef          	jal	918 <my_printf>
     5dc:	2200006f          	j	7fc <main+0x510>
     5e0:	21018513          	addi	a0,gp,528 # 12b20 <__global_pointer$+0x210>
     5e4:	334000ef          	jal	918 <my_printf>
     5e8:	fe0405a3          	sb	zero,-21(s0)
     5ec:	fe042623          	sw	zero,-20(s0)
     5f0:	1fc18513          	addi	a0,gp,508 # 12b0c <__global_pointer$+0x1fc>
     5f4:	324000ef          	jal	918 <my_printf>
     5f8:	0bc18513          	addi	a0,gp,188 # 129cc <__global_pointer$+0xbc>
     5fc:	31c000ef          	jal	918 <my_printf>
     600:	0e818513          	addi	a0,gp,232 # 129f8 <__global_pointer$+0xe8>
     604:	314000ef          	jal	918 <my_printf>
     608:	1f40006f          	j	7fc <main+0x510>
     60c:	fec42703          	lw	a4,-20(s0)
     610:	00200793          	li	a5,2
     614:	1ef71463          	bne	a4,a5,7fc <main+0x510>
     618:	feb44703          	lbu	a4,-21(s0)
     61c:	00400793          	li	a5,4
     620:	0ef71663          	bne	a4,a5,70c <main+0x420>
     624:	00100793          	li	a5,1
     628:	fcf42a23          	sw	a5,-44(s0)
     62c:	fc042823          	sw	zero,-48(s0)
     630:	03c0006f          	j	66c <main+0x380>
     634:	fd042783          	lw	a5,-48(s0)
     638:	ff078793          	addi	a5,a5,-16
     63c:	008787b3          	add	a5,a5,s0
     640:	fc87c703          	lbu	a4,-56(a5)
     644:	fd042783          	lw	a5,-48(s0)
     648:	ff078793          	addi	a5,a5,-16
     64c:	008787b3          	add	a5,a5,s0
     650:	fcc7c783          	lbu	a5,-52(a5)
     654:	00f70663          	beq	a4,a5,660 <main+0x374>
     658:	fc042a23          	sw	zero,-44(s0)
     65c:	01c0006f          	j	678 <main+0x38c>
     660:	fd042783          	lw	a5,-48(s0)
     664:	00178793          	addi	a5,a5,1
     668:	fcf42823          	sw	a5,-48(s0)
     66c:	fd042703          	lw	a4,-48(s0)
     670:	00300793          	li	a5,3
     674:	fce7d0e3          	bge	a5,a4,634 <main+0x348>
     678:	fd442783          	lw	a5,-44(s0)
     67c:	04078a63          	beqz	a5,6d0 <main+0x3e4>
     680:	00300793          	li	a5,3
     684:	fef42623          	sw	a5,-20(s0)
     688:	00100513          	li	a0,1
     68c:	a15ff0ef          	jal	a0 <led_set>
     690:	23018513          	addi	a0,gp,560 # 12b40 <__global_pointer$+0x230>
     694:	284000ef          	jal	918 <my_printf>
     698:	000017b7          	lui	a5,0x1
     69c:	bb878513          	addi	a0,a5,-1096 # bb8 <my_printflt+0x13c>
     6a0:	9b5ff0ef          	jal	54 <delay_ms>
     6a4:	a55ff0ef          	jal	f8 <led_clear>
     6a8:	00200793          	li	a5,2
     6ac:	fef42623          	sw	a5,-20(s0)
     6b0:	fe0405a3          	sb	zero,-21(s0)
     6b4:	1c418513          	addi	a0,gp,452 # 12ad4 <__global_pointer$+0x1c4>
     6b8:	260000ef          	jal	918 <my_printf>
     6bc:	04018513          	addi	a0,gp,64 # 12950 <__global_pointer$+0x40>
     6c0:	258000ef          	jal	918 <my_printf>
     6c4:	18018513          	addi	a0,gp,384 # 12a90 <__global_pointer$+0x180>
     6c8:	250000ef          	jal	918 <my_printf>
     6cc:	1300006f          	j	7fc <main+0x510>
     6d0:	00200513          	li	a0,2
     6d4:	9cdff0ef          	jal	a0 <led_set>
     6d8:	24818513          	addi	a0,gp,584 # 12b58 <__global_pointer$+0x248>
     6dc:	23c000ef          	jal	918 <my_printf>
     6e0:	3e800513          	li	a0,1000
     6e4:	971ff0ef          	jal	54 <delay_ms>
     6e8:	a11ff0ef          	jal	f8 <led_clear>
     6ec:	fe0405a3          	sb	zero,-21(s0)
     6f0:	1c418513          	addi	a0,gp,452 # 12ad4 <__global_pointer$+0x1c4>
     6f4:	224000ef          	jal	918 <my_printf>
     6f8:	04018513          	addi	a0,gp,64 # 12950 <__global_pointer$+0x40>
     6fc:	21c000ef          	jal	918 <my_printf>
     700:	18018513          	addi	a0,gp,384 # 12a90 <__global_pointer$+0x180>
     704:	214000ef          	jal	918 <my_printf>
     708:	0f40006f          	j	7fc <main+0x510>
     70c:	00200513          	li	a0,2
     710:	991ff0ef          	jal	a0 <led_set>
     714:	24818513          	addi	a0,gp,584 # 12b58 <__global_pointer$+0x248>
     718:	200000ef          	jal	918 <my_printf>
     71c:	3e800513          	li	a0,1000
     720:	935ff0ef          	jal	54 <delay_ms>
     724:	9d5ff0ef          	jal	f8 <led_clear>
     728:	fe0405a3          	sb	zero,-21(s0)
     72c:	1c418513          	addi	a0,gp,452 # 12ad4 <__global_pointer$+0x1c4>
     730:	1e8000ef          	jal	918 <my_printf>
     734:	04018513          	addi	a0,gp,64 # 12950 <__global_pointer$+0x40>
     738:	1e0000ef          	jal	918 <my_printf>
     73c:	18018513          	addi	a0,gp,384 # 12a90 <__global_pointer$+0x180>
     740:	1d8000ef          	jal	918 <my_printf>
     744:	0b80006f          	j	7fc <main+0x510>
     748:	fc344703          	lbu	a4,-61(s0)
     74c:	02f00793          	li	a5,47
     750:	0ae7f663          	bgeu	a5,a4,7fc <main+0x510>
     754:	fc344703          	lbu	a4,-61(s0)
     758:	03900793          	li	a5,57
     75c:	0ae7e063          	bltu	a5,a4,7fc <main+0x510>
     760:	fec42703          	lw	a4,-20(s0)
     764:	00100793          	li	a5,1
     768:	00f70863          	beq	a4,a5,778 <main+0x48c>
     76c:	fec42703          	lw	a4,-20(s0)
     770:	00200793          	li	a5,2
     774:	08f71463          	bne	a4,a5,7fc <main+0x510>
     778:	feb44703          	lbu	a4,-21(s0)
     77c:	00300793          	li	a5,3
     780:	06e7ee63          	bltu	a5,a4,7fc <main+0x510>
     784:	feb44783          	lbu	a5,-21(s0)
     788:	ff078793          	addi	a5,a5,-16
     78c:	008787b3          	add	a5,a5,s0
     790:	fc344703          	lbu	a4,-61(s0)
     794:	fce78423          	sb	a4,-56(a5)
     798:	feb44783          	lbu	a5,-21(s0)
     79c:	00178793          	addi	a5,a5,1
     7a0:	fef405a3          	sb	a5,-21(s0)
     7a4:	02a00513          	li	a0,42
     7a8:	2b9000ef          	jal	1260 <uart_put_char>
     7ac:	0500006f          	j	7fc <main+0x510>
     7b0:	fc344783          	lbu	a5,-61(s0)
     7b4:	fef40523          	sb	a5,-22(s0)
     7b8:	00100793          	li	a5,1
     7bc:	fef42223          	sw	a5,-28(s0)
     7c0:	fe042023          	sw	zero,-32(s0)
     7c4:	fc040fa3          	sb	zero,-33(s0)
     7c8:	0340006f          	j	7fc <main+0x510>
     7cc:	fea44783          	lbu	a5,-22(s0)
     7d0:	02078663          	beqz	a5,7fc <main+0x510>
     7d4:	fe042783          	lw	a5,-32(s0)
     7d8:	00178793          	addi	a5,a5,1
     7dc:	fef42023          	sw	a5,-32(s0)
     7e0:	fe042703          	lw	a4,-32(s0)
     7e4:	fc442783          	lw	a5,-60(s0)
     7e8:	00f76a63          	bltu	a4,a5,7fc <main+0x510>
     7ec:	fe040523          	sb	zero,-22(s0)
     7f0:	fe042223          	sw	zero,-28(s0)
     7f4:	fe042023          	sw	zero,-32(s0)
     7f8:	fc040fa3          	sb	zero,-33(s0)
     7fc:	00100513          	li	a0,1
     800:	855ff0ef          	jal	54 <delay_ms>
     804:	c35ff06f          	j	438 <main+0x14c>

00000808 <my_putc>:
     808:	fe010113          	addi	sp,sp,-32
     80c:	00112e23          	sw	ra,28(sp)
     810:	00812c23          	sw	s0,24(sp)
     814:	02010413          	addi	s0,sp,32
     818:	fea42623          	sw	a0,-20(s0)
     81c:	feb42423          	sw	a1,-24(s0)
     820:	fec42783          	lw	a5,-20(s0)
     824:	0ff7f793          	zext.b	a5,a5
     828:	00078513          	mv	a0,a5
     82c:	235000ef          	jal	1260 <uart_put_char>
     830:	00050793          	mv	a5,a0
     834:	00078513          	mv	a0,a5
     838:	01c12083          	lw	ra,28(sp)
     83c:	01812403          	lw	s0,24(sp)
     840:	02010113          	addi	sp,sp,32
     844:	00008067          	ret

00000848 <my_putchar>:
     848:	fe010113          	addi	sp,sp,-32
     84c:	00112e23          	sw	ra,28(sp)
     850:	00812c23          	sw	s0,24(sp)
     854:	02010413          	addi	s0,sp,32
     858:	fea42623          	sw	a0,-20(s0)
     85c:	fec42783          	lw	a5,-20(s0)
     860:	0ff7f793          	zext.b	a5,a5
     864:	00078513          	mv	a0,a5
     868:	1f9000ef          	jal	1260 <uart_put_char>
     86c:	00050793          	mv	a5,a0
     870:	00078513          	mv	a0,a5
     874:	01c12083          	lw	ra,28(sp)
     878:	01812403          	lw	s0,24(sp)
     87c:	02010113          	addi	sp,sp,32
     880:	00008067          	ret

00000884 <my_getc>:
     884:	fe010113          	addi	sp,sp,-32
     888:	00112e23          	sw	ra,28(sp)
     88c:	00812c23          	sw	s0,24(sp)
     890:	02010413          	addi	s0,sp,32
     894:	fea42623          	sw	a0,-20(s0)
     898:	185000ef          	jal	121c <uart_get_char>
     89c:	00050793          	mv	a5,a0
     8a0:	00078513          	mv	a0,a5
     8a4:	01c12083          	lw	ra,28(sp)
     8a8:	01812403          	lw	s0,24(sp)
     8ac:	02010113          	addi	sp,sp,32
     8b0:	00008067          	ret

000008b4 <my_getchar>:
     8b4:	ff010113          	addi	sp,sp,-16
     8b8:	00112623          	sw	ra,12(sp)
     8bc:	00812423          	sw	s0,8(sp)
     8c0:	01010413          	addi	s0,sp,16
     8c4:	159000ef          	jal	121c <uart_get_char>
     8c8:	00050793          	mv	a5,a0
     8cc:	00078513          	mv	a0,a5
     8d0:	00c12083          	lw	ra,12(sp)
     8d4:	00812403          	lw	s0,8(sp)
     8d8:	01010113          	addi	sp,sp,16
     8dc:	00008067          	ret

000008e0 <my_puts>:
     8e0:	fd010113          	addi	sp,sp,-48
     8e4:	02112623          	sw	ra,44(sp)
     8e8:	02812423          	sw	s0,40(sp)
     8ec:	03010413          	addi	s0,sp,48
     8f0:	fca42e23          	sw	a0,-36(s0)
     8f4:	fdc42503          	lw	a0,-36(s0)
     8f8:	1d1000ef          	jal	12c8 <uart_put_string>
     8fc:	fea42623          	sw	a0,-20(s0)
     900:	fec42783          	lw	a5,-20(s0)
     904:	00078513          	mv	a0,a5
     908:	02c12083          	lw	ra,44(sp)
     90c:	02812403          	lw	s0,40(sp)
     910:	03010113          	addi	sp,sp,48
     914:	00008067          	ret

00000918 <my_printf>:
     918:	fb010113          	addi	sp,sp,-80
     91c:	02112623          	sw	ra,44(sp)
     920:	02812423          	sw	s0,40(sp)
     924:	03010413          	addi	s0,sp,48
     928:	fca42e23          	sw	a0,-36(s0)
     92c:	00b42223          	sw	a1,4(s0)
     930:	00c42423          	sw	a2,8(s0)
     934:	00d42623          	sw	a3,12(s0)
     938:	00e42823          	sw	a4,16(s0)
     93c:	00f42a23          	sw	a5,20(s0)
     940:	01042c23          	sw	a6,24(s0)
     944:	01142e23          	sw	a7,28(s0)
     948:	02040793          	addi	a5,s0,32
     94c:	fcf42c23          	sw	a5,-40(s0)
     950:	fd842783          	lw	a5,-40(s0)
     954:	fe478793          	addi	a5,a5,-28
     958:	fef42423          	sw	a5,-24(s0)
     95c:	fe842783          	lw	a5,-24(s0)
     960:	00078593          	mv	a1,a5
     964:	fdc42503          	lw	a0,-36(s0)
     968:	28c000ef          	jal	bf4 <my_vprintf>
     96c:	fea42623          	sw	a0,-20(s0)
     970:	fec42783          	lw	a5,-20(s0)
     974:	00078513          	mv	a0,a5
     978:	02c12083          	lw	ra,44(sp)
     97c:	02812403          	lw	s0,40(sp)
     980:	05010113          	addi	sp,sp,80
     984:	00008067          	ret

00000988 <my_printn>:
     988:	fd010113          	addi	sp,sp,-48
     98c:	02112623          	sw	ra,44(sp)
     990:	02812423          	sw	s0,40(sp)
     994:	03010413          	addi	s0,sp,48
     998:	fca42e23          	sw	a0,-36(s0)
     99c:	fcb42c23          	sw	a1,-40(s0)
     9a0:	fcc42a23          	sw	a2,-44(s0)
     9a4:	fe042623          	sw	zero,-20(s0)
     9a8:	fd842703          	lw	a4,-40(s0)
     9ac:	00a00793          	li	a5,10
     9b0:	02f71863          	bne	a4,a5,9e0 <my_printn+0x58>
     9b4:	fdc42783          	lw	a5,-36(s0)
     9b8:	0207d463          	bgez	a5,9e0 <my_printn+0x58>
     9bc:	02d00513          	li	a0,45
     9c0:	0a1000ef          	jal	1260 <uart_put_char>
     9c4:	00050713          	mv	a4,a0
     9c8:	fec42783          	lw	a5,-20(s0)
     9cc:	00f707b3          	add	a5,a4,a5
     9d0:	fef42623          	sw	a5,-20(s0)
     9d4:	fdc42783          	lw	a5,-36(s0)
     9d8:	40f007b3          	neg	a5,a5
     9dc:	fcf42e23          	sw	a5,-36(s0)
     9e0:	fd842783          	lw	a5,-40(s0)
     9e4:	fdc42703          	lw	a4,-36(s0)
     9e8:	02f757b3          	divu	a5,a4,a5
     9ec:	fef42423          	sw	a5,-24(s0)
     9f0:	fe842783          	lw	a5,-24(s0)
     9f4:	00079863          	bnez	a5,a04 <my_printn+0x7c>
     9f8:	fd442703          	lw	a4,-44(s0)
     9fc:	00100793          	li	a5,1
     a00:	02e7d863          	bge	a5,a4,a30 <my_printn+0xa8>
     a04:	fd442783          	lw	a5,-44(s0)
     a08:	fff78793          	addi	a5,a5,-1
     a0c:	fcf42a23          	sw	a5,-44(s0)
     a10:	fd442603          	lw	a2,-44(s0)
     a14:	fd842583          	lw	a1,-40(s0)
     a18:	fe842503          	lw	a0,-24(s0)
     a1c:	f6dff0ef          	jal	988 <my_printn>
     a20:	00050713          	mv	a4,a0
     a24:	fec42783          	lw	a5,-20(s0)
     a28:	00e787b3          	add	a5,a5,a4
     a2c:	fef42623          	sw	a5,-20(s0)
     a30:	fd842783          	lw	a5,-40(s0)
     a34:	fdc42703          	lw	a4,-36(s0)
     a38:	02f777b3          	remu	a5,a4,a5
     a3c:	00078713          	mv	a4,a5
     a40:	26018793          	addi	a5,gp,608 # 12b70 <__global_pointer$+0x260>
     a44:	00e787b3          	add	a5,a5,a4
     a48:	0007c783          	lbu	a5,0(a5)
     a4c:	00078513          	mv	a0,a5
     a50:	011000ef          	jal	1260 <uart_put_char>
     a54:	00050713          	mv	a4,a0
     a58:	fec42783          	lw	a5,-20(s0)
     a5c:	00f707b3          	add	a5,a4,a5
     a60:	fef42623          	sw	a5,-20(s0)
     a64:	fec42783          	lw	a5,-20(s0)
     a68:	00078513          	mv	a0,a5
     a6c:	02c12083          	lw	ra,44(sp)
     a70:	02812403          	lw	s0,40(sp)
     a74:	03010113          	addi	sp,sp,48
     a78:	00008067          	ret

00000a7c <my_printflt>:
     a7c:	fd010113          	addi	sp,sp,-48
     a80:	02112623          	sw	ra,44(sp)
     a84:	02812423          	sw	s0,40(sp)
     a88:	03010413          	addi	s0,sp,48
     a8c:	fca42e23          	sw	a0,-36(s0)
     a90:	fcb42c23          	sw	a1,-40(s0)
     a94:	fe042423          	sw	zero,-24(s0)
     a98:	00000593          	li	a1,0
     a9c:	fdc42503          	lw	a0,-36(s0)
     aa0:	12c110ef          	jal	11bcc <__lesf2>
     aa4:	00050793          	mv	a5,a0
     aa8:	0207d663          	bgez	a5,ad4 <my_printflt+0x58>
     aac:	02d00513          	li	a0,45
     ab0:	7b0000ef          	jal	1260 <uart_put_char>
     ab4:	00050713          	mv	a4,a0
     ab8:	fe842783          	lw	a5,-24(s0)
     abc:	00f707b3          	add	a5,a4,a5
     ac0:	fef42423          	sw	a5,-24(s0)
     ac4:	fdc42703          	lw	a4,-36(s0)
     ac8:	800007b7          	lui	a5,0x80000
     acc:	00f747b3          	xor	a5,a4,a5
     ad0:	fcf42e23          	sw	a5,-36(s0)
     ad4:	fdc42503          	lw	a0,-36(s0)
     ad8:	0ed110ef          	jal	123c4 <__fixsfsi>
     adc:	00050793          	mv	a5,a0
     ae0:	fef42223          	sw	a5,-28(s0)
     ae4:	fe442783          	lw	a5,-28(s0)
     ae8:	fd842603          	lw	a2,-40(s0)
     aec:	00a00593          	li	a1,10
     af0:	00078513          	mv	a0,a5
     af4:	e95ff0ef          	jal	988 <my_printn>
     af8:	00050713          	mv	a4,a0
     afc:	fe842783          	lw	a5,-24(s0)
     b00:	00e787b3          	add	a5,a5,a4
     b04:	fef42423          	sw	a5,-24(s0)
     b08:	02e00513          	li	a0,46
     b0c:	754000ef          	jal	1260 <uart_put_char>
     b10:	00050713          	mv	a4,a0
     b14:	fe842783          	lw	a5,-24(s0)
     b18:	00f707b3          	add	a5,a4,a5
     b1c:	fef42423          	sw	a5,-24(s0)
     b20:	fe442503          	lw	a0,-28(s0)
     b24:	111110ef          	jal	12434 <__floatsisf>
     b28:	00050793          	mv	a5,a0
     b2c:	00078593          	mv	a1,a5
     b30:	fdc42503          	lw	a0,-36(s0)
     b34:	460110ef          	jal	11f94 <__subsf3>
     b38:	00050793          	mv	a5,a0
     b3c:	fcf42e23          	sw	a5,-36(s0)
     b40:	fe042623          	sw	zero,-20(s0)
     b44:	2cc1a583          	lw	a1,716(gp) # 12bdc <__global_pointer$+0x2cc>
     b48:	fdc42503          	lw	a0,-36(s0)
     b4c:	12c110ef          	jal	11c78 <__mulsf3>
     b50:	00050793          	mv	a5,a0
     b54:	fcf42e23          	sw	a5,-36(s0)
     b58:	fdc42503          	lw	a0,-36(s0)
     b5c:	069110ef          	jal	123c4 <__fixsfsi>
     b60:	00050793          	mv	a5,a0
     b64:	fef42223          	sw	a5,-28(s0)
     b68:	fe442783          	lw	a5,-28(s0)
     b6c:	0ff7f793          	zext.b	a5,a5
     b70:	03078793          	addi	a5,a5,48 # 80000030 <_memory_end+0x7ffe0030>
     b74:	0ff7f793          	zext.b	a5,a5
     b78:	00078513          	mv	a0,a5
     b7c:	6e4000ef          	jal	1260 <uart_put_char>
     b80:	00050713          	mv	a4,a0
     b84:	fe842783          	lw	a5,-24(s0)
     b88:	00f707b3          	add	a5,a4,a5
     b8c:	fef42423          	sw	a5,-24(s0)
     b90:	fe442503          	lw	a0,-28(s0)
     b94:	0a1110ef          	jal	12434 <__floatsisf>
     b98:	00050793          	mv	a5,a0
     b9c:	00078593          	mv	a1,a5
     ba0:	fdc42503          	lw	a0,-36(s0)
     ba4:	3f0110ef          	jal	11f94 <__subsf3>
     ba8:	00050793          	mv	a5,a0
     bac:	fcf42e23          	sw	a5,-36(s0)
     bb0:	fec42783          	lw	a5,-20(s0)
     bb4:	00178793          	addi	a5,a5,1
     bb8:	fef42623          	sw	a5,-20(s0)
     bbc:	00000593          	li	a1,0
     bc0:	fdc42503          	lw	a0,-36(s0)
     bc4:	7a1100ef          	jal	11b64 <__eqsf2>
     bc8:	00050793          	mv	a5,a0
     bcc:	00078863          	beqz	a5,bdc <my_printflt+0x160>
     bd0:	fec42703          	lw	a4,-20(s0)
     bd4:	00500793          	li	a5,5
     bd8:	f6e7d6e3          	bge	a5,a4,b44 <my_printflt+0xc8>
     bdc:	fe842783          	lw	a5,-24(s0)
     be0:	00078513          	mv	a0,a5
     be4:	02c12083          	lw	ra,44(sp)
     be8:	02812403          	lw	s0,40(sp)
     bec:	03010113          	addi	sp,sp,48
     bf0:	00008067          	ret

00000bf4 <my_vprintf>:
     bf4:	fc010113          	addi	sp,sp,-64
     bf8:	02112e23          	sw	ra,60(sp)
     bfc:	02812c23          	sw	s0,56(sp)
     c00:	04010413          	addi	s0,sp,64
     c04:	fca42623          	sw	a0,-52(s0)
     c08:	fcb42423          	sw	a1,-56(s0)
     c0c:	fe042023          	sw	zero,-32(s0)
     c10:	3000006f          	j	f10 <my_vprintf+0x31c>
     c14:	fe842703          	lw	a4,-24(s0)
     c18:	02500793          	li	a5,37
     c1c:	2cf71063          	bne	a4,a5,edc <my_vprintf+0x2e8>
     c20:	fcc42783          	lw	a5,-52(s0)
     c24:	0007c783          	lbu	a5,0(a5)
     c28:	fef42423          	sw	a5,-24(s0)
     c2c:	fe042623          	sw	zero,-20(s0)
     c30:	0440006f          	j	c74 <my_vprintf+0x80>
     c34:	fec42703          	lw	a4,-20(s0)
     c38:	00070793          	mv	a5,a4
     c3c:	00279793          	slli	a5,a5,0x2
     c40:	00e787b3          	add	a5,a5,a4
     c44:	00179793          	slli	a5,a5,0x1
     c48:	00078713          	mv	a4,a5
     c4c:	fe842783          	lw	a5,-24(s0)
     c50:	00f707b3          	add	a5,a4,a5
     c54:	fd078793          	addi	a5,a5,-48
     c58:	fef42623          	sw	a5,-20(s0)
     c5c:	fcc42783          	lw	a5,-52(s0)
     c60:	00178793          	addi	a5,a5,1
     c64:	fcf42623          	sw	a5,-52(s0)
     c68:	fcc42783          	lw	a5,-52(s0)
     c6c:	0007c783          	lbu	a5,0(a5)
     c70:	fef42423          	sw	a5,-24(s0)
     c74:	fe842703          	lw	a4,-24(s0)
     c78:	02f00793          	li	a5,47
     c7c:	00e7d863          	bge	a5,a4,c8c <my_vprintf+0x98>
     c80:	fe842703          	lw	a4,-24(s0)
     c84:	03900793          	li	a5,57
     c88:	fae7d6e3          	bge	a5,a4,c34 <my_vprintf+0x40>
     c8c:	fcc42783          	lw	a5,-52(s0)
     c90:	00178713          	addi	a4,a5,1
     c94:	fce42623          	sw	a4,-52(s0)
     c98:	0007c783          	lbu	a5,0(a5)
     c9c:	fef42423          	sw	a5,-24(s0)
     ca0:	fe842703          	lw	a4,-24(s0)
     ca4:	02500793          	li	a5,37
     ca8:	1ef70863          	beq	a4,a5,e98 <my_vprintf+0x2a4>
     cac:	fe842703          	lw	a4,-24(s0)
     cb0:	02500793          	li	a5,37
     cb4:	20f74063          	blt	a4,a5,eb4 <my_vprintf+0x2c0>
     cb8:	fe842703          	lw	a4,-24(s0)
     cbc:	07800793          	li	a5,120
     cc0:	1ee7ca63          	blt	a5,a4,eb4 <my_vprintf+0x2c0>
     cc4:	fe842703          	lw	a4,-24(s0)
     cc8:	06300793          	li	a5,99
     ccc:	1ef74463          	blt	a4,a5,eb4 <my_vprintf+0x2c0>
     cd0:	fe842783          	lw	a5,-24(s0)
     cd4:	f9d78793          	addi	a5,a5,-99
     cd8:	01500713          	li	a4,21
     cdc:	1cf76c63          	bltu	a4,a5,eb4 <my_vprintf+0x2c0>
     ce0:	00279713          	slli	a4,a5,0x2
     ce4:	27418793          	addi	a5,gp,628 # 12b84 <__global_pointer$+0x274>
     ce8:	00f707b3          	add	a5,a4,a5
     cec:	0007a783          	lw	a5,0(a5)
     cf0:	00078067          	jr	a5
     cf4:	fc842783          	lw	a5,-56(s0)
     cf8:	00478713          	addi	a4,a5,4
     cfc:	fce42423          	sw	a4,-56(s0)
     d00:	0007a783          	lw	a5,0(a5)
     d04:	fcf40ba3          	sb	a5,-41(s0)
     d08:	fd744783          	lbu	a5,-41(s0)
     d0c:	00078513          	mv	a0,a5
     d10:	550000ef          	jal	1260 <uart_put_char>
     d14:	00050713          	mv	a4,a0
     d18:	fe042783          	lw	a5,-32(s0)
     d1c:	00f707b3          	add	a5,a4,a5
     d20:	fef42023          	sw	a5,-32(s0)
     d24:	1ec0006f          	j	f10 <my_vprintf+0x31c>
     d28:	fc842783          	lw	a5,-56(s0)
     d2c:	00478713          	addi	a4,a5,4
     d30:	fce42423          	sw	a4,-56(s0)
     d34:	0007a783          	lw	a5,0(a5)
     d38:	fcf42e23          	sw	a5,-36(s0)
     d3c:	fdc42783          	lw	a5,-36(s0)
     d40:	fec42603          	lw	a2,-20(s0)
     d44:	00800593          	li	a1,8
     d48:	00078513          	mv	a0,a5
     d4c:	c3dff0ef          	jal	988 <my_printn>
     d50:	00050713          	mv	a4,a0
     d54:	fe042783          	lw	a5,-32(s0)
     d58:	00e787b3          	add	a5,a5,a4
     d5c:	fef42023          	sw	a5,-32(s0)
     d60:	1b00006f          	j	f10 <my_vprintf+0x31c>
     d64:	fc842783          	lw	a5,-56(s0)
     d68:	00478713          	addi	a4,a5,4
     d6c:	fce42423          	sw	a4,-56(s0)
     d70:	0007a783          	lw	a5,0(a5)
     d74:	fcf42e23          	sw	a5,-36(s0)
     d78:	fdc42783          	lw	a5,-36(s0)
     d7c:	fec42603          	lw	a2,-20(s0)
     d80:	00a00593          	li	a1,10
     d84:	00078513          	mv	a0,a5
     d88:	c01ff0ef          	jal	988 <my_printn>
     d8c:	00050713          	mv	a4,a0
     d90:	fe042783          	lw	a5,-32(s0)
     d94:	00e787b3          	add	a5,a5,a4
     d98:	fef42023          	sw	a5,-32(s0)
     d9c:	1740006f          	j	f10 <my_vprintf+0x31c>
     da0:	fc842783          	lw	a5,-56(s0)
     da4:	00478713          	addi	a4,a5,4
     da8:	fce42423          	sw	a4,-56(s0)
     dac:	0007a783          	lw	a5,0(a5)
     db0:	fcf42e23          	sw	a5,-36(s0)
     db4:	fdc42783          	lw	a5,-36(s0)
     db8:	fec42603          	lw	a2,-20(s0)
     dbc:	01000593          	li	a1,16
     dc0:	00078513          	mv	a0,a5
     dc4:	bc5ff0ef          	jal	988 <my_printn>
     dc8:	00050713          	mv	a4,a0
     dcc:	fe042783          	lw	a5,-32(s0)
     dd0:	00e787b3          	add	a5,a5,a4
     dd4:	fef42023          	sw	a5,-32(s0)
     dd8:	1380006f          	j	f10 <my_vprintf+0x31c>
     ddc:	fc842783          	lw	a5,-56(s0)
     de0:	00478713          	addi	a4,a5,4
     de4:	fce42423          	sw	a4,-56(s0)
     de8:	0007a783          	lw	a5,0(a5)
     dec:	fef42223          	sw	a5,-28(s0)
     df0:	0480006f          	j	e38 <my_vprintf+0x244>
     df4:	fe442783          	lw	a5,-28(s0)
     df8:	0007c783          	lbu	a5,0(a5)
     dfc:	00078513          	mv	a0,a5
     e00:	460000ef          	jal	1260 <uart_put_char>
     e04:	00050713          	mv	a4,a0
     e08:	fe042783          	lw	a5,-32(s0)
     e0c:	00f707b3          	add	a5,a4,a5
     e10:	fef42023          	sw	a5,-32(s0)
     e14:	fe442783          	lw	a5,-28(s0)
     e18:	0007c703          	lbu	a4,0(a5)
     e1c:	00a00793          	li	a5,10
     e20:	00f71663          	bne	a4,a5,e2c <my_vprintf+0x238>
     e24:	00d00513          	li	a0,13
     e28:	438000ef          	jal	1260 <uart_put_char>
     e2c:	fe442783          	lw	a5,-28(s0)
     e30:	00178793          	addi	a5,a5,1
     e34:	fef42223          	sw	a5,-28(s0)
     e38:	fe442783          	lw	a5,-28(s0)
     e3c:	0007c783          	lbu	a5,0(a5)
     e40:	fa079ae3          	bnez	a5,df4 <my_vprintf+0x200>
     e44:	0cc0006f          	j	f10 <my_vprintf+0x31c>
     e48:	fc842783          	lw	a5,-56(s0)
     e4c:	00778793          	addi	a5,a5,7
     e50:	ff87f793          	andi	a5,a5,-8
     e54:	00878713          	addi	a4,a5,8
     e58:	fce42423          	sw	a4,-56(s0)
     e5c:	0007a703          	lw	a4,0(a5)
     e60:	0047a783          	lw	a5,4(a5)
     e64:	00070513          	mv	a0,a4
     e68:	00078593          	mv	a1,a5
     e6c:	0dd110ef          	jal	12748 <__truncdfsf2>
     e70:	00050793          	mv	a5,a0
     e74:	fcf42c23          	sw	a5,-40(s0)
     e78:	fec42583          	lw	a1,-20(s0)
     e7c:	fd842503          	lw	a0,-40(s0)
     e80:	bfdff0ef          	jal	a7c <my_printflt>
     e84:	00050713          	mv	a4,a0
     e88:	fe042783          	lw	a5,-32(s0)
     e8c:	00e787b3          	add	a5,a5,a4
     e90:	fef42023          	sw	a5,-32(s0)
     e94:	07c0006f          	j	f10 <my_vprintf+0x31c>
     e98:	02500513          	li	a0,37
     e9c:	3c4000ef          	jal	1260 <uart_put_char>
     ea0:	00050713          	mv	a4,a0
     ea4:	fe042783          	lw	a5,-32(s0)
     ea8:	00f707b3          	add	a5,a4,a5
     eac:	fef42023          	sw	a5,-32(s0)
     eb0:	0600006f          	j	f10 <my_vprintf+0x31c>
     eb4:	02500513          	li	a0,37
     eb8:	3a8000ef          	jal	1260 <uart_put_char>
     ebc:	00050713          	mv	a4,a0
     ec0:	fe042783          	lw	a5,-32(s0)
     ec4:	00f707b3          	add	a5,a4,a5
     ec8:	fef42023          	sw	a5,-32(s0)
     ecc:	fcc42783          	lw	a5,-52(s0)
     ed0:	fff78793          	addi	a5,a5,-1
     ed4:	fcf42623          	sw	a5,-52(s0)
     ed8:	0380006f          	j	f10 <my_vprintf+0x31c>
     edc:	fe842783          	lw	a5,-24(s0)
     ee0:	0ff7f793          	zext.b	a5,a5
     ee4:	00078513          	mv	a0,a5
     ee8:	378000ef          	jal	1260 <uart_put_char>
     eec:	00050713          	mv	a4,a0
     ef0:	fe042783          	lw	a5,-32(s0)
     ef4:	00f707b3          	add	a5,a4,a5
     ef8:	fef42023          	sw	a5,-32(s0)
     efc:	fe842703          	lw	a4,-24(s0)
     f00:	00a00793          	li	a5,10
     f04:	00f71663          	bne	a4,a5,f10 <my_vprintf+0x31c>
     f08:	00d00513          	li	a0,13
     f0c:	354000ef          	jal	1260 <uart_put_char>
     f10:	fcc42783          	lw	a5,-52(s0)
     f14:	00178713          	addi	a4,a5,1
     f18:	fce42623          	sw	a4,-52(s0)
     f1c:	0007c783          	lbu	a5,0(a5)
     f20:	fef42423          	sw	a5,-24(s0)
     f24:	fe842783          	lw	a5,-24(s0)
     f28:	ce0796e3          	bnez	a5,c14 <my_vprintf+0x20>
     f2c:	fe042783          	lw	a5,-32(s0)
     f30:	00078513          	mv	a0,a5
     f34:	03c12083          	lw	ra,60(sp)
     f38:	03812403          	lw	s0,56(sp)
     f3c:	04010113          	addi	sp,sp,64
     f40:	00008067          	ret

00000f44 <uart_init>:
     f44:	fc010113          	addi	sp,sp,-64
     f48:	02112e23          	sw	ra,60(sp)
     f4c:	02812c23          	sw	s0,56(sp)
     f50:	04010413          	addi	s0,sp,64
     f54:	fca42e23          	sw	a0,-36(s0)
     f58:	fcb42c23          	sw	a1,-40(s0)
     f5c:	fcc42a23          	sw	a2,-44(s0)
     f60:	fcd42823          	sw	a3,-48(s0)
     f64:	fce42623          	sw	a4,-52(s0)
     f68:	fdc42783          	lw	a5,-36(s0)
     f6c:	00079663          	bnez	a5,f78 <uart_init+0x34>
     f70:	5ec000ef          	jal	155c <uart_get_clk_freq>
     f74:	fca42e23          	sw	a0,-36(s0)
     f78:	fdc42703          	lw	a4,-36(s0)
     f7c:	fd842783          	lw	a5,-40(s0)
     f80:	02f757b3          	divu	a5,a4,a5
     f84:	00078513          	mv	a0,a5
     f88:	0c40e0ef          	jal	f04c <__floatunsidf>
     f8c:	00050713          	mv	a4,a0
     f90:	00058793          	mv	a5,a1
     f94:	2d01a603          	lw	a2,720(gp) # 12be0 <__global_pointer$+0x2d0>
     f98:	2d41a683          	lw	a3,724(gp) # 12be4 <__global_pointer$+0x2d4>
     f9c:	00070513          	mv	a0,a4
     fa0:	00078593          	mv	a1,a5
     fa4:	1340c0ef          	jal	d0d8 <__adddf3>
     fa8:	00050713          	mv	a4,a0
     fac:	00058793          	mv	a5,a1
     fb0:	00070513          	mv	a0,a4
     fb4:	00078593          	mv	a1,a5
     fb8:	76d0d0ef          	jal	ef24 <__fixdfsi>
     fbc:	00050793          	mv	a5,a0
     fc0:	00078713          	mv	a4,a5
     fc4:	000107b7          	lui	a5,0x10
     fc8:	fff78793          	addi	a5,a5,-1 # ffff <__multf3+0xc07>
     fcc:	00f777b3          	and	a5,a4,a5
     fd0:	fef42623          	sw	a5,-20(s0)
     fd4:	fd442703          	lw	a4,-44(s0)
     fd8:	00800793          	li	a5,8
     fdc:	00f71663          	bne	a4,a5,fe8 <uart_init+0xa4>
     fe0:	00000793          	li	a5,0
     fe4:	0080006f          	j	fec <uart_init+0xa8>
     fe8:	000107b7          	lui	a5,0x10
     fec:	fec42703          	lw	a4,-20(s0)
     ff0:	00e7e7b3          	or	a5,a5,a4
     ff4:	fef42623          	sw	a5,-20(s0)
     ff8:	fd042783          	lw	a5,-48(s0)
     ffc:	00079663          	bnez	a5,1008 <uart_init+0xc4>
    1000:	00000793          	li	a5,0
    1004:	0080006f          	j	100c <uart_init+0xc8>
    1008:	000207b7          	lui	a5,0x20
    100c:	fec42703          	lw	a4,-20(s0)
    1010:	00e7e7b3          	or	a5,a5,a4
    1014:	fef42623          	sw	a5,-20(s0)
    1018:	fd042703          	lw	a4,-48(s0)
    101c:	00100793          	li	a5,1
    1020:	00f71663          	bne	a4,a5,102c <uart_init+0xe8>
    1024:	00000793          	li	a5,0
    1028:	0080006f          	j	1030 <uart_init+0xec>
    102c:	000407b7          	lui	a5,0x40
    1030:	fec42703          	lw	a4,-20(s0)
    1034:	00e7e7b3          	or	a5,a5,a4
    1038:	fef42623          	sw	a5,-20(s0)
    103c:	fcc42703          	lw	a4,-52(s0)
    1040:	00100793          	li	a5,1
    1044:	00f71663          	bne	a4,a5,1050 <uart_init+0x10c>
    1048:	00000793          	li	a5,0
    104c:	0080006f          	j	1054 <uart_init+0x110>
    1050:	000807b7          	lui	a5,0x80
    1054:	fec42703          	lw	a4,-20(s0)
    1058:	00e7e7b3          	or	a5,a5,a4
    105c:	fef42623          	sw	a5,-20(s0)
    1060:	000147b7          	lui	a5,0x14
    1064:	df07a783          	lw	a5,-528(a5) # 13df0 <UART_CONTROL>
    1068:	fef42423          	sw	a5,-24(s0)
    106c:	fe842783          	lw	a5,-24(s0)
    1070:	fec42703          	lw	a4,-20(s0)
    1074:	00e7a023          	sw	a4,0(a5)
    1078:	00000013          	nop
    107c:	03c12083          	lw	ra,60(sp)
    1080:	03812403          	lw	s0,56(sp)
    1084:	04010113          	addi	sp,sp,64
    1088:	00008067          	ret

0000108c <uart_init_ext>:
    108c:	fc010113          	addi	sp,sp,-64
    1090:	02112e23          	sw	ra,60(sp)
    1094:	02812c23          	sw	s0,56(sp)
    1098:	04010413          	addi	s0,sp,64
    109c:	fca42e23          	sw	a0,-36(s0)
    10a0:	fcb42c23          	sw	a1,-40(s0)
    10a4:	fcc42a23          	sw	a2,-44(s0)
    10a8:	fcd42823          	sw	a3,-48(s0)
    10ac:	fce42623          	sw	a4,-52(s0)
    10b0:	fcf42423          	sw	a5,-56(s0)
    10b4:	fd042223          	sw	a6,-60(s0)
    10b8:	fdc42783          	lw	a5,-36(s0)
    10bc:	00079663          	bnez	a5,10c8 <uart_init_ext+0x3c>
    10c0:	49c000ef          	jal	155c <uart_get_clk_freq>
    10c4:	fca42e23          	sw	a0,-36(s0)
    10c8:	fdc42703          	lw	a4,-36(s0)
    10cc:	fd842783          	lw	a5,-40(s0)
    10d0:	02f757b3          	divu	a5,a4,a5
    10d4:	00078513          	mv	a0,a5
    10d8:	7750d0ef          	jal	f04c <__floatunsidf>
    10dc:	00050713          	mv	a4,a0
    10e0:	00058793          	mv	a5,a1
    10e4:	2d01a603          	lw	a2,720(gp) # 12be0 <__global_pointer$+0x2d0>
    10e8:	2d41a683          	lw	a3,724(gp) # 12be4 <__global_pointer$+0x2d4>
    10ec:	00070513          	mv	a0,a4
    10f0:	00078593          	mv	a1,a5
    10f4:	7e50b0ef          	jal	d0d8 <__adddf3>
    10f8:	00050713          	mv	a4,a0
    10fc:	00058793          	mv	a5,a1
    1100:	00070513          	mv	a0,a4
    1104:	00078593          	mv	a1,a5
    1108:	61d0d0ef          	jal	ef24 <__fixdfsi>
    110c:	00050793          	mv	a5,a0
    1110:	00078713          	mv	a4,a5
    1114:	000107b7          	lui	a5,0x10
    1118:	fff78793          	addi	a5,a5,-1 # ffff <__multf3+0xc07>
    111c:	00f777b3          	and	a5,a4,a5
    1120:	fef42623          	sw	a5,-20(s0)
    1124:	fd442703          	lw	a4,-44(s0)
    1128:	00800793          	li	a5,8
    112c:	00f71663          	bne	a4,a5,1138 <uart_init_ext+0xac>
    1130:	00000793          	li	a5,0
    1134:	0080006f          	j	113c <uart_init_ext+0xb0>
    1138:	000107b7          	lui	a5,0x10
    113c:	fec42703          	lw	a4,-20(s0)
    1140:	00e7e7b3          	or	a5,a5,a4
    1144:	fef42623          	sw	a5,-20(s0)
    1148:	fd042783          	lw	a5,-48(s0)
    114c:	00079663          	bnez	a5,1158 <uart_init_ext+0xcc>
    1150:	00000793          	li	a5,0
    1154:	0080006f          	j	115c <uart_init_ext+0xd0>
    1158:	000207b7          	lui	a5,0x20
    115c:	fec42703          	lw	a4,-20(s0)
    1160:	00e7e7b3          	or	a5,a5,a4
    1164:	fef42623          	sw	a5,-20(s0)
    1168:	fd042703          	lw	a4,-48(s0)
    116c:	00100793          	li	a5,1
    1170:	00f71663          	bne	a4,a5,117c <uart_init_ext+0xf0>
    1174:	00000793          	li	a5,0
    1178:	0080006f          	j	1180 <uart_init_ext+0xf4>
    117c:	000407b7          	lui	a5,0x40
    1180:	fec42703          	lw	a4,-20(s0)
    1184:	00e7e7b3          	or	a5,a5,a4
    1188:	fef42623          	sw	a5,-20(s0)
    118c:	fcc42703          	lw	a4,-52(s0)
    1190:	00100793          	li	a5,1
    1194:	00f71663          	bne	a4,a5,11a0 <uart_init_ext+0x114>
    1198:	00000793          	li	a5,0
    119c:	0080006f          	j	11a4 <uart_init_ext+0x118>
    11a0:	000807b7          	lui	a5,0x80
    11a4:	fec42703          	lw	a4,-20(s0)
    11a8:	00e7e7b3          	or	a5,a5,a4
    11ac:	fef42623          	sw	a5,-20(s0)
    11b0:	fc842783          	lw	a5,-56(s0)
    11b4:	00079663          	bnez	a5,11c0 <uart_init_ext+0x134>
    11b8:	00000793          	li	a5,0
    11bc:	0080006f          	j	11c4 <uart_init_ext+0x138>
    11c0:	002007b7          	lui	a5,0x200
    11c4:	fec42703          	lw	a4,-20(s0)
    11c8:	00e7e7b3          	or	a5,a5,a4
    11cc:	fef42623          	sw	a5,-20(s0)
    11d0:	fc442783          	lw	a5,-60(s0)
    11d4:	00079663          	bnez	a5,11e0 <uart_init_ext+0x154>
    11d8:	00000793          	li	a5,0
    11dc:	0080006f          	j	11e4 <uart_init_ext+0x158>
    11e0:	001007b7          	lui	a5,0x100
    11e4:	fec42703          	lw	a4,-20(s0)
    11e8:	00e7e7b3          	or	a5,a5,a4
    11ec:	fef42623          	sw	a5,-20(s0)
    11f0:	000147b7          	lui	a5,0x14
    11f4:	df07a783          	lw	a5,-528(a5) # 13df0 <UART_CONTROL>
    11f8:	fef42423          	sw	a5,-24(s0)
    11fc:	fe842783          	lw	a5,-24(s0)
    1200:	fec42703          	lw	a4,-20(s0)
    1204:	00e7a023          	sw	a4,0(a5)
    1208:	00000013          	nop
    120c:	03c12083          	lw	ra,60(sp)
    1210:	03812403          	lw	s0,56(sp)
    1214:	04010113          	addi	sp,sp,64
    1218:	00008067          	ret

0000121c <uart_get_char>:
    121c:	fe010113          	addi	sp,sp,-32
    1220:	00812e23          	sw	s0,28(sp)
    1224:	02010413          	addi	s0,sp,32
    1228:	000147b7          	lui	a5,0x14
    122c:	dfc7a783          	lw	a5,-516(a5) # 13dfc <UART_RX>
    1230:	fef42423          	sw	a5,-24(s0)
    1234:	fe842783          	lw	a5,-24(s0)
    1238:	0007a783          	lw	a5,0(a5)
    123c:	fef42623          	sw	a5,-20(s0)
    1240:	fec42783          	lw	a5,-20(s0)
    1244:	fe07d2e3          	bgez	a5,1228 <uart_get_char+0xc>
    1248:	fec42783          	lw	a5,-20(s0)
    124c:	0ff7f793          	zext.b	a5,a5
    1250:	00078513          	mv	a0,a5
    1254:	01c12403          	lw	s0,28(sp)
    1258:	02010113          	addi	sp,sp,32
    125c:	00008067          	ret

00001260 <uart_put_char>:
    1260:	fd010113          	addi	sp,sp,-48
    1264:	02812623          	sw	s0,44(sp)
    1268:	03010413          	addi	s0,sp,48
    126c:	00050793          	mv	a5,a0
    1270:	fcf40fa3          	sb	a5,-33(s0)
    1274:	000147b7          	lui	a5,0x14
    1278:	df87a783          	lw	a5,-520(a5) # 13df8 <UART_TX>
    127c:	fef42423          	sw	a5,-24(s0)
    1280:	fe842783          	lw	a5,-24(s0)
    1284:	0007a783          	lw	a5,0(a5)
    1288:	fef42623          	sw	a5,-20(s0)
    128c:	fec42783          	lw	a5,-20(s0)
    1290:	fe07c2e3          	bltz	a5,1274 <uart_put_char+0x14>
    1294:	fdf44783          	lbu	a5,-33(s0)
    1298:	fef42623          	sw	a5,-20(s0)
    129c:	000147b7          	lui	a5,0x14
    12a0:	df87a783          	lw	a5,-520(a5) # 13df8 <UART_TX>
    12a4:	fef42223          	sw	a5,-28(s0)
    12a8:	fe442783          	lw	a5,-28(s0)
    12ac:	fec42703          	lw	a4,-20(s0)
    12b0:	00e7a023          	sw	a4,0(a5)
    12b4:	fdf44783          	lbu	a5,-33(s0)
    12b8:	00078513          	mv	a0,a5
    12bc:	02c12403          	lw	s0,44(sp)
    12c0:	03010113          	addi	sp,sp,48
    12c4:	00008067          	ret

000012c8 <uart_put_string>:
    12c8:	fc010113          	addi	sp,sp,-64
    12cc:	02812e23          	sw	s0,60(sp)
    12d0:	04010413          	addi	s0,sp,64
    12d4:	fca42623          	sw	a0,-52(s0)
    12d8:	fe042623          	sw	zero,-20(s0)
    12dc:	0480006f          	j	1324 <uart_put_string+0x5c>
    12e0:	000147b7          	lui	a5,0x14
    12e4:	df87a783          	lw	a5,-520(a5) # 13df8 <UART_TX>
    12e8:	fef42023          	sw	a5,-32(s0)
    12ec:	fe042783          	lw	a5,-32(s0)
    12f0:	0007a783          	lw	a5,0(a5)
    12f4:	fef42223          	sw	a5,-28(s0)
    12f8:	fe442783          	lw	a5,-28(s0)
    12fc:	fe07c2e3          	bltz	a5,12e0 <uart_put_string+0x18>
    1300:	000147b7          	lui	a5,0x14
    1304:	df87a783          	lw	a5,-520(a5) # 13df8 <UART_TX>
    1308:	fcf42e23          	sw	a5,-36(s0)
    130c:	fdc42783          	lw	a5,-36(s0)
    1310:	feb44703          	lbu	a4,-21(s0)
    1314:	00e7a023          	sw	a4,0(a5)
    1318:	fec42783          	lw	a5,-20(s0)
    131c:	00178793          	addi	a5,a5,1
    1320:	fef42623          	sw	a5,-20(s0)
    1324:	fcc42783          	lw	a5,-52(s0)
    1328:	00178713          	addi	a4,a5,1
    132c:	fce42623          	sw	a4,-52(s0)
    1330:	0007c783          	lbu	a5,0(a5)
    1334:	fef405a3          	sb	a5,-21(s0)
    1338:	feb44783          	lbu	a5,-21(s0)
    133c:	fa0792e3          	bnez	a5,12e0 <uart_put_string+0x18>
    1340:	fec42783          	lw	a5,-20(s0)
    1344:	00078513          	mv	a0,a5
    1348:	03c12403          	lw	s0,60(sp)
    134c:	04010113          	addi	sp,sp,64
    1350:	00008067          	ret

00001354 <uart_put_int>:
    1354:	fc010113          	addi	sp,sp,-64
    1358:	02112e23          	sw	ra,60(sp)
    135c:	02812c23          	sw	s0,56(sp)
    1360:	04010413          	addi	s0,sp,64
    1364:	fca42623          	sw	a0,-52(s0)
    1368:	fcc42703          	lw	a4,-52(s0)
    136c:	00a00793          	li	a5,10
    1370:	02f757b3          	divu	a5,a4,a5
    1374:	fef42623          	sw	a5,-20(s0)
    1378:	fec42783          	lw	a5,-20(s0)
    137c:	00078863          	beqz	a5,138c <uart_put_int+0x38>
    1380:	fec42783          	lw	a5,-20(s0)
    1384:	00078513          	mv	a0,a5
    1388:	fcdff0ef          	jal	1354 <uart_put_int>
    138c:	fcc42703          	lw	a4,-52(s0)
    1390:	00a00793          	li	a5,10
    1394:	02f777b3          	remu	a5,a4,a5
    1398:	0ff7f793          	zext.b	a5,a5
    139c:	03078793          	addi	a5,a5,48
    13a0:	fef405a3          	sb	a5,-21(s0)
    13a4:	000147b7          	lui	a5,0x14
    13a8:	df87a783          	lw	a5,-520(a5) # 13df8 <UART_TX>
    13ac:	fcf42a23          	sw	a5,-44(s0)
    13b0:	fd442783          	lw	a5,-44(s0)
    13b4:	0007a783          	lw	a5,0(a5)
    13b8:	fcf42c23          	sw	a5,-40(s0)
    13bc:	fd842783          	lw	a5,-40(s0)
    13c0:	fe07c2e3          	bltz	a5,13a4 <uart_put_int+0x50>
    13c4:	000147b7          	lui	a5,0x14
    13c8:	df87a783          	lw	a5,-520(a5) # 13df8 <UART_TX>
    13cc:	fcf42823          	sw	a5,-48(s0)
    13d0:	fd042783          	lw	a5,-48(s0)
    13d4:	feb44703          	lbu	a4,-21(s0)
    13d8:	00e7a023          	sw	a4,0(a5)
    13dc:	00000013          	nop
    13e0:	03c12083          	lw	ra,60(sp)
    13e4:	03812403          	lw	s0,56(sp)
    13e8:	04010113          	addi	sp,sp,64
    13ec:	00008067          	ret

000013f0 <uart_put_hex>:
    13f0:	fc010113          	addi	sp,sp,-64
    13f4:	02112e23          	sw	ra,60(sp)
    13f8:	02812c23          	sw	s0,56(sp)
    13fc:	04010413          	addi	s0,sp,64
    1400:	fca42623          	sw	a0,-52(s0)
    1404:	fcc42783          	lw	a5,-52(s0)
    1408:	0047d793          	srli	a5,a5,0x4
    140c:	fef42423          	sw	a5,-24(s0)
    1410:	fe842783          	lw	a5,-24(s0)
    1414:	00078863          	beqz	a5,1424 <uart_put_hex+0x34>
    1418:	fe842783          	lw	a5,-24(s0)
    141c:	00078513          	mv	a0,a5
    1420:	fd1ff0ef          	jal	13f0 <uart_put_hex>
    1424:	fcc42783          	lw	a5,-52(s0)
    1428:	00f7f793          	andi	a5,a5,15
    142c:	fef42423          	sw	a5,-24(s0)
    1430:	fe842703          	lw	a4,-24(s0)
    1434:	00900793          	li	a5,9
    1438:	00e7cc63          	blt	a5,a4,1450 <uart_put_hex+0x60>
    143c:	fe842783          	lw	a5,-24(s0)
    1440:	0ff7f793          	zext.b	a5,a5
    1444:	03078793          	addi	a5,a5,48
    1448:	fef407a3          	sb	a5,-17(s0)
    144c:	0140006f          	j	1460 <uart_put_hex+0x70>
    1450:	fe842783          	lw	a5,-24(s0)
    1454:	0ff7f793          	zext.b	a5,a5
    1458:	03778793          	addi	a5,a5,55
    145c:	fef407a3          	sb	a5,-17(s0)
    1460:	000147b7          	lui	a5,0x14
    1464:	df87a783          	lw	a5,-520(a5) # 13df8 <UART_TX>
    1468:	fef42023          	sw	a5,-32(s0)
    146c:	fe042783          	lw	a5,-32(s0)
    1470:	0007a783          	lw	a5,0(a5)
    1474:	fef42223          	sw	a5,-28(s0)
    1478:	fe442783          	lw	a5,-28(s0)
    147c:	fe07c2e3          	bltz	a5,1460 <uart_put_hex+0x70>
    1480:	000147b7          	lui	a5,0x14
    1484:	df87a783          	lw	a5,-520(a5) # 13df8 <UART_TX>
    1488:	fcf42e23          	sw	a5,-36(s0)
    148c:	fdc42783          	lw	a5,-36(s0)
    1490:	fef44703          	lbu	a4,-17(s0)
    1494:	00e7a023          	sw	a4,0(a5)
    1498:	00000013          	nop
    149c:	03c12083          	lw	ra,60(sp)
    14a0:	03812403          	lw	s0,56(sp)
    14a4:	04010113          	addi	sp,sp,64
    14a8:	00008067          	ret

000014ac <uart_cler_tx_irq>:
    14ac:	fe010113          	addi	sp,sp,-32
    14b0:	00812e23          	sw	s0,28(sp)
    14b4:	02010413          	addi	s0,sp,32
    14b8:	000147b7          	lui	a5,0x14
    14bc:	df47a783          	lw	a5,-524(a5) # 13df4 <UART_STATUS>
    14c0:	fef42423          	sw	a5,-24(s0)
    14c4:	fe842783          	lw	a5,-24(s0)
    14c8:	0007a783          	lw	a5,0(a5)
    14cc:	fef42623          	sw	a5,-20(s0)
    14d0:	fec42783          	lw	a5,-20(s0)
    14d4:	ffe7f793          	andi	a5,a5,-2
    14d8:	fef42623          	sw	a5,-20(s0)
    14dc:	000147b7          	lui	a5,0x14
    14e0:	df47a783          	lw	a5,-524(a5) # 13df4 <UART_STATUS>
    14e4:	fef42223          	sw	a5,-28(s0)
    14e8:	fe442783          	lw	a5,-28(s0)
    14ec:	fec42703          	lw	a4,-20(s0)
    14f0:	00e7a023          	sw	a4,0(a5)
    14f4:	00000013          	nop
    14f8:	01c12403          	lw	s0,28(sp)
    14fc:	02010113          	addi	sp,sp,32
    1500:	00008067          	ret

00001504 <uart_cler_rx_irq>:
    1504:	fe010113          	addi	sp,sp,-32
    1508:	00812e23          	sw	s0,28(sp)
    150c:	02010413          	addi	s0,sp,32
    1510:	000147b7          	lui	a5,0x14
    1514:	df47a783          	lw	a5,-524(a5) # 13df4 <UART_STATUS>
    1518:	fef42423          	sw	a5,-24(s0)
    151c:	fe842783          	lw	a5,-24(s0)
    1520:	0007a783          	lw	a5,0(a5)
    1524:	fef42623          	sw	a5,-20(s0)
    1528:	fec42783          	lw	a5,-20(s0)
    152c:	ffd7f793          	andi	a5,a5,-3
    1530:	fef42623          	sw	a5,-20(s0)
    1534:	000147b7          	lui	a5,0x14
    1538:	df47a783          	lw	a5,-524(a5) # 13df4 <UART_STATUS>
    153c:	fef42223          	sw	a5,-28(s0)
    1540:	fe442783          	lw	a5,-28(s0)
    1544:	fec42703          	lw	a4,-20(s0)
    1548:	00e7a023          	sw	a4,0(a5)
    154c:	00000013          	nop
    1550:	01c12403          	lw	s0,28(sp)
    1554:	02010113          	addi	sp,sp,32
    1558:	00008067          	ret

0000155c <uart_get_clk_freq>:
    155c:	fe010113          	addi	sp,sp,-32
    1560:	00812e23          	sw	s0,28(sp)
    1564:	02010413          	addi	s0,sp,32
    1568:	000147b7          	lui	a5,0x14
    156c:	e007a783          	lw	a5,-512(a5) # 13e00 <UART_CLK_FREQ>
    1570:	fef42423          	sw	a5,-24(s0)
    1574:	fe842783          	lw	a5,-24(s0)
    1578:	0007a783          	lw	a5,0(a5)
    157c:	fef42623          	sw	a5,-20(s0)
    1580:	fec42783          	lw	a5,-20(s0)
    1584:	00078513          	mv	a0,a5
    1588:	01c12403          	lw	s0,28(sp)
    158c:	02010113          	addi	sp,sp,32
    1590:	00008067          	ret

00001594 <uart_set_addr>:
    1594:	fe010113          	addi	sp,sp,-32
    1598:	00812e23          	sw	s0,28(sp)
    159c:	02010413          	addi	s0,sp,32
    15a0:	fea42623          	sw	a0,-20(s0)
    15a4:	000147b7          	lui	a5,0x14
    15a8:	fec42703          	lw	a4,-20(s0)
    15ac:	dee7a223          	sw	a4,-540(a5) # 13de4 <UART_ADDR_BASE>
    15b0:	000147b7          	lui	a5,0x14
    15b4:	fec42703          	lw	a4,-20(s0)
    15b8:	dee7a423          	sw	a4,-536(a5) # 13de8 <UART_VERSION>
    15bc:	fec42783          	lw	a5,-20(s0)
    15c0:	00478713          	addi	a4,a5,4
    15c4:	000147b7          	lui	a5,0x14
    15c8:	dee7a623          	sw	a4,-532(a5) # 13dec <UART_NAME>
    15cc:	fec42783          	lw	a5,-20(s0)
    15d0:	01078713          	addi	a4,a5,16
    15d4:	000147b7          	lui	a5,0x14
    15d8:	dee7a823          	sw	a4,-528(a5) # 13df0 <UART_CONTROL>
    15dc:	fec42783          	lw	a5,-20(s0)
    15e0:	01478713          	addi	a4,a5,20
    15e4:	000147b7          	lui	a5,0x14
    15e8:	dee7aa23          	sw	a4,-524(a5) # 13df4 <UART_STATUS>
    15ec:	fec42783          	lw	a5,-20(s0)
    15f0:	01878713          	addi	a4,a5,24
    15f4:	000147b7          	lui	a5,0x14
    15f8:	dee7ac23          	sw	a4,-520(a5) # 13df8 <UART_TX>
    15fc:	fec42783          	lw	a5,-20(s0)
    1600:	01c78713          	addi	a4,a5,28
    1604:	000147b7          	lui	a5,0x14
    1608:	dee7ae23          	sw	a4,-516(a5) # 13dfc <UART_RX>
    160c:	fec42783          	lw	a5,-20(s0)
    1610:	02078713          	addi	a4,a5,32
    1614:	000147b7          	lui	a5,0x14
    1618:	e0e7a023          	sw	a4,-512(a5) # 13e00 <UART_CLK_FREQ>
    161c:	00000013          	nop
    1620:	01c12403          	lw	s0,28(sp)
    1624:	02010113          	addi	sp,sp,32
    1628:	00008067          	ret

0000162c <uart_get_addr>:
    162c:	ff010113          	addi	sp,sp,-16
    1630:	00812623          	sw	s0,12(sp)
    1634:	01010413          	addi	s0,sp,16
    1638:	000147b7          	lui	a5,0x14
    163c:	de47a783          	lw	a5,-540(a5) # 13de4 <UART_ADDR_BASE>
    1640:	00078513          	mv	a0,a5
    1644:	00c12403          	lw	s0,12(sp)
    1648:	01010113          	addi	sp,sp,16
    164c:	00008067          	ret

00001650 <gpio_read>:
    1650:	fe010113          	addi	sp,sp,-32
    1654:	00812e23          	sw	s0,28(sp)
    1658:	02010413          	addi	s0,sp,32
    165c:	000147b7          	lui	a5,0x14
    1660:	e147a783          	lw	a5,-492(a5) # 13e14 <CSRA_INPUT>
    1664:	0007a783          	lw	a5,0(a5)
    1668:	fef42623          	sw	a5,-20(s0)
    166c:	fec42783          	lw	a5,-20(s0)
    1670:	00078513          	mv	a0,a5
    1674:	01c12403          	lw	s0,28(sp)
    1678:	02010113          	addi	sp,sp,32
    167c:	00008067          	ret

00001680 <gpio_write>:
    1680:	fe010113          	addi	sp,sp,-32
    1684:	00812e23          	sw	s0,28(sp)
    1688:	02010413          	addi	s0,sp,32
    168c:	fea42623          	sw	a0,-20(s0)
    1690:	000147b7          	lui	a5,0x14
    1694:	e187a783          	lw	a5,-488(a5) # 13e18 <CSRA_OUTPUT>
    1698:	00078713          	mv	a4,a5
    169c:	fec42783          	lw	a5,-20(s0)
    16a0:	00f72023          	sw	a5,0(a4)
    16a4:	00000013          	nop
    16a8:	01c12403          	lw	s0,28(sp)
    16ac:	02010113          	addi	sp,sp,32
    16b0:	00008067          	ret

000016b4 <gpio_init>:
    16b4:	fd010113          	addi	sp,sp,-48
    16b8:	02812623          	sw	s0,44(sp)
    16bc:	03010413          	addi	s0,sp,48
    16c0:	fca42e23          	sw	a0,-36(s0)
    16c4:	fcb42c23          	sw	a1,-40(s0)
    16c8:	fcc42a23          	sw	a2,-44(s0)
    16cc:	fcd42823          	sw	a3,-48(s0)
    16d0:	fe042623          	sw	zero,-20(s0)
    16d4:	000147b7          	lui	a5,0x14
    16d8:	e107a783          	lw	a5,-496(a5) # 13e10 <CSRA_DIR>
    16dc:	00078713          	mv	a4,a5
    16e0:	fdc42783          	lw	a5,-36(s0)
    16e4:	00f72023          	sw	a5,0(a4)
    16e8:	000147b7          	lui	a5,0x14
    16ec:	e187a783          	lw	a5,-488(a5) # 13e18 <CSRA_OUTPUT>
    16f0:	00078713          	mv	a4,a5
    16f4:	fec42783          	lw	a5,-20(s0)
    16f8:	00f72023          	sw	a5,0(a4)
    16fc:	000147b7          	lui	a5,0x14
    1700:	e247a783          	lw	a5,-476(a5) # 13e24 <CSRA_EDGE>
    1704:	00078713          	mv	a4,a5
    1708:	fd842783          	lw	a5,-40(s0)
    170c:	00f72023          	sw	a5,0(a4)
    1710:	000147b7          	lui	a5,0x14
    1714:	e287a783          	lw	a5,-472(a5) # 13e28 <CSRA_POL>
    1718:	00078713          	mv	a4,a5
    171c:	fd442783          	lw	a5,-44(s0)
    1720:	00f72023          	sw	a5,0(a4)
    1724:	fd042783          	lw	a5,-48(s0)
    1728:	fff7c793          	not	a5,a5
    172c:	fef42623          	sw	a5,-20(s0)
    1730:	000147b7          	lui	a5,0x14
    1734:	e1c7a783          	lw	a5,-484(a5) # 13e1c <CSRA_MASK>
    1738:	00078713          	mv	a4,a5
    173c:	fec42783          	lw	a5,-20(s0)
    1740:	00f72023          	sw	a5,0(a4)
    1744:	00000013          	nop
    1748:	02c12403          	lw	s0,44(sp)
    174c:	03010113          	addi	sp,sp,48
    1750:	00008067          	ret

00001754 <gpio_irq_enable>:
    1754:	fd010113          	addi	sp,sp,-48
    1758:	02812623          	sw	s0,44(sp)
    175c:	03010413          	addi	s0,sp,48
    1760:	fca42e23          	sw	a0,-36(s0)
    1764:	fdc42783          	lw	a5,-36(s0)
    1768:	fff7c793          	not	a5,a5
    176c:	fef42623          	sw	a5,-20(s0)
    1770:	000147b7          	lui	a5,0x14
    1774:	e1c7a783          	lw	a5,-484(a5) # 13e1c <CSRA_MASK>
    1778:	00078713          	mv	a4,a5
    177c:	fec42783          	lw	a5,-20(s0)
    1780:	00f72023          	sw	a5,0(a4)
    1784:	000147b7          	lui	a5,0x14
    1788:	e1c7a783          	lw	a5,-484(a5) # 13e1c <CSRA_MASK>
    178c:	0007a783          	lw	a5,0(a5)
    1790:	fef42623          	sw	a5,-20(s0)
    1794:	fec42783          	lw	a5,-20(s0)
    1798:	00078513          	mv	a0,a5
    179c:	02c12403          	lw	s0,44(sp)
    17a0:	03010113          	addi	sp,sp,48
    17a4:	00008067          	ret

000017a8 <gpio_irq_edge>:
    17a8:	fe010113          	addi	sp,sp,-32
    17ac:	00812e23          	sw	s0,28(sp)
    17b0:	02010413          	addi	s0,sp,32
    17b4:	fea42623          	sw	a0,-20(s0)
    17b8:	000147b7          	lui	a5,0x14
    17bc:	e247a783          	lw	a5,-476(a5) # 13e24 <CSRA_EDGE>
    17c0:	00078713          	mv	a4,a5
    17c4:	fec42783          	lw	a5,-20(s0)
    17c8:	00f72023          	sw	a5,0(a4)
    17cc:	000147b7          	lui	a5,0x14
    17d0:	e247a783          	lw	a5,-476(a5) # 13e24 <CSRA_EDGE>
    17d4:	0007a783          	lw	a5,0(a5)
    17d8:	fef42623          	sw	a5,-20(s0)
    17dc:	fec42783          	lw	a5,-20(s0)
    17e0:	00078513          	mv	a0,a5
    17e4:	01c12403          	lw	s0,28(sp)
    17e8:	02010113          	addi	sp,sp,32
    17ec:	00008067          	ret

000017f0 <gpio_irq_pol>:
    17f0:	fe010113          	addi	sp,sp,-32
    17f4:	00812e23          	sw	s0,28(sp)
    17f8:	02010413          	addi	s0,sp,32
    17fc:	fea42623          	sw	a0,-20(s0)
    1800:	000147b7          	lui	a5,0x14
    1804:	e287a783          	lw	a5,-472(a5) # 13e28 <CSRA_POL>
    1808:	00078713          	mv	a4,a5
    180c:	fec42783          	lw	a5,-20(s0)
    1810:	00f72023          	sw	a5,0(a4)
    1814:	000147b7          	lui	a5,0x14
    1818:	e287a783          	lw	a5,-472(a5) # 13e28 <CSRA_POL>
    181c:	0007a783          	lw	a5,0(a5)
    1820:	fef42623          	sw	a5,-20(s0)
    1824:	fec42783          	lw	a5,-20(s0)
    1828:	00078513          	mv	a0,a5
    182c:	01c12403          	lw	s0,28(sp)
    1830:	02010113          	addi	sp,sp,32
    1834:	00008067          	ret

00001838 <gpio_irq_read>:
    1838:	fe010113          	addi	sp,sp,-32
    183c:	00812e23          	sw	s0,28(sp)
    1840:	02010413          	addi	s0,sp,32
    1844:	000147b7          	lui	a5,0x14
    1848:	e207a783          	lw	a5,-480(a5) # 13e20 <CSRA_IRQ>
    184c:	0007a783          	lw	a5,0(a5)
    1850:	fef42623          	sw	a5,-20(s0)
    1854:	fec42783          	lw	a5,-20(s0)
    1858:	00078513          	mv	a0,a5
    185c:	01c12403          	lw	s0,28(sp)
    1860:	02010113          	addi	sp,sp,32
    1864:	00008067          	ret

00001868 <gpio_irq_clear>:
    1868:	fd010113          	addi	sp,sp,-48
    186c:	02812623          	sw	s0,44(sp)
    1870:	03010413          	addi	s0,sp,48
    1874:	fca42e23          	sw	a0,-36(s0)
    1878:	000147b7          	lui	a5,0x14
    187c:	e207a783          	lw	a5,-480(a5) # 13e20 <CSRA_IRQ>
    1880:	0007a783          	lw	a5,0(a5)
    1884:	fef42623          	sw	a5,-20(s0)
    1888:	fec42703          	lw	a4,-20(s0)
    188c:	fdc42783          	lw	a5,-36(s0)
    1890:	00f777b3          	and	a5,a4,a5
    1894:	fef42623          	sw	a5,-20(s0)
    1898:	000147b7          	lui	a5,0x14
    189c:	e207a783          	lw	a5,-480(a5) # 13e20 <CSRA_IRQ>
    18a0:	00078713          	mv	a4,a5
    18a4:	fec42783          	lw	a5,-20(s0)
    18a8:	00f72023          	sw	a5,0(a4)
    18ac:	000147b7          	lui	a5,0x14
    18b0:	e207a783          	lw	a5,-480(a5) # 13e20 <CSRA_IRQ>
    18b4:	0007a783          	lw	a5,0(a5)
    18b8:	fcf42e23          	sw	a5,-36(s0)
    18bc:	fdc42783          	lw	a5,-36(s0)
    18c0:	00078513          	mv	a0,a5
    18c4:	02c12403          	lw	s0,44(sp)
    18c8:	03010113          	addi	sp,sp,48
    18cc:	00008067          	ret

000018d0 <gpio_csr>:
    18d0:	fe010113          	addi	sp,sp,-32
    18d4:	00112e23          	sw	ra,28(sp)
    18d8:	00812c23          	sw	s0,24(sp)
    18dc:	02010413          	addi	s0,sp,32
    18e0:	000147b7          	lui	a5,0x14
    18e4:	e087a783          	lw	a5,-504(a5) # 13e08 <CSRA_VERSION>
    18e8:	0007a783          	lw	a5,0(a5)
    18ec:	fef42623          	sw	a5,-20(s0)
    18f0:	fec42583          	lw	a1,-20(s0)
    18f4:	2d818513          	addi	a0,gp,728 # 12be8 <__global_pointer$+0x2d8>
    18f8:	3c9000ef          	jal	24c0 <printf>
    18fc:	000147b7          	lui	a5,0x14
    1900:	e0c7a783          	lw	a5,-500(a5) # 13e0c <CSRA_NAME>
    1904:	0007a783          	lw	a5,0(a5)
    1908:	fef42623          	sw	a5,-20(s0)
    190c:	fec42583          	lw	a1,-20(s0)
    1910:	2f018513          	addi	a0,gp,752 # 12c00 <__global_pointer$+0x2f0>
    1914:	3ad000ef          	jal	24c0 <printf>
    1918:	000147b7          	lui	a5,0x14
    191c:	e107a783          	lw	a5,-496(a5) # 13e10 <CSRA_DIR>
    1920:	0007a783          	lw	a5,0(a5)
    1924:	fef42623          	sw	a5,-20(s0)
    1928:	fec42583          	lw	a1,-20(s0)
    192c:	30818513          	addi	a0,gp,776 # 12c18 <__global_pointer$+0x308>
    1930:	391000ef          	jal	24c0 <printf>
    1934:	000147b7          	lui	a5,0x14
    1938:	e147a783          	lw	a5,-492(a5) # 13e14 <CSRA_INPUT>
    193c:	0007a783          	lw	a5,0(a5)
    1940:	fef42623          	sw	a5,-20(s0)
    1944:	fec42583          	lw	a1,-20(s0)
    1948:	32018513          	addi	a0,gp,800 # 12c30 <__global_pointer$+0x320>
    194c:	375000ef          	jal	24c0 <printf>
    1950:	000147b7          	lui	a5,0x14
    1954:	e187a783          	lw	a5,-488(a5) # 13e18 <CSRA_OUTPUT>
    1958:	0007a783          	lw	a5,0(a5)
    195c:	fef42623          	sw	a5,-20(s0)
    1960:	fec42583          	lw	a1,-20(s0)
    1964:	33818513          	addi	a0,gp,824 # 12c48 <__global_pointer$+0x338>
    1968:	359000ef          	jal	24c0 <printf>
    196c:	000147b7          	lui	a5,0x14
    1970:	e1c7a783          	lw	a5,-484(a5) # 13e1c <CSRA_MASK>
    1974:	0007a783          	lw	a5,0(a5)
    1978:	fef42623          	sw	a5,-20(s0)
    197c:	fec42583          	lw	a1,-20(s0)
    1980:	35018513          	addi	a0,gp,848 # 12c60 <__global_pointer$+0x350>
    1984:	33d000ef          	jal	24c0 <printf>
    1988:	000147b7          	lui	a5,0x14
    198c:	e207a783          	lw	a5,-480(a5) # 13e20 <CSRA_IRQ>
    1990:	0007a783          	lw	a5,0(a5)
    1994:	fef42623          	sw	a5,-20(s0)
    1998:	fec42583          	lw	a1,-20(s0)
    199c:	36818513          	addi	a0,gp,872 # 12c78 <__global_pointer$+0x368>
    19a0:	321000ef          	jal	24c0 <printf>
    19a4:	000147b7          	lui	a5,0x14
    19a8:	e247a783          	lw	a5,-476(a5) # 13e24 <CSRA_EDGE>
    19ac:	0007a783          	lw	a5,0(a5)
    19b0:	fef42623          	sw	a5,-20(s0)
    19b4:	fec42583          	lw	a1,-20(s0)
    19b8:	38018513          	addi	a0,gp,896 # 12c90 <__global_pointer$+0x380>
    19bc:	305000ef          	jal	24c0 <printf>
    19c0:	000147b7          	lui	a5,0x14
    19c4:	e287a783          	lw	a5,-472(a5) # 13e28 <CSRA_POL>
    19c8:	0007a783          	lw	a5,0(a5)
    19cc:	fef42623          	sw	a5,-20(s0)
    19d0:	fec42583          	lw	a1,-20(s0)
    19d4:	39818513          	addi	a0,gp,920 # 12ca8 <__global_pointer$+0x398>
    19d8:	2e9000ef          	jal	24c0 <printf>
    19dc:	00000013          	nop
    19e0:	01c12083          	lw	ra,28(sp)
    19e4:	01812403          	lw	s0,24(sp)
    19e8:	02010113          	addi	sp,sp,32
    19ec:	00008067          	ret

000019f0 <gpio_set_addr>:
    19f0:	fe010113          	addi	sp,sp,-32
    19f4:	00812e23          	sw	s0,28(sp)
    19f8:	02010413          	addi	s0,sp,32
    19fc:	fea42623          	sw	a0,-20(s0)
    1a00:	000147b7          	lui	a5,0x14
    1a04:	fec42703          	lw	a4,-20(s0)
    1a08:	e0e7a223          	sw	a4,-508(a5) # 13e04 <ADDR_GPIO>
    1a0c:	000147b7          	lui	a5,0x14
    1a10:	fec42703          	lw	a4,-20(s0)
    1a14:	e0e7a423          	sw	a4,-504(a5) # 13e08 <CSRA_VERSION>
    1a18:	fec42783          	lw	a5,-20(s0)
    1a1c:	00478713          	addi	a4,a5,4
    1a20:	000147b7          	lui	a5,0x14
    1a24:	e0e7a623          	sw	a4,-500(a5) # 13e0c <CSRA_NAME>
    1a28:	fec42783          	lw	a5,-20(s0)
    1a2c:	01078713          	addi	a4,a5,16
    1a30:	000147b7          	lui	a5,0x14
    1a34:	e0e7a823          	sw	a4,-496(a5) # 13e10 <CSRA_DIR>
    1a38:	fec42783          	lw	a5,-20(s0)
    1a3c:	01478713          	addi	a4,a5,20
    1a40:	000147b7          	lui	a5,0x14
    1a44:	e0e7aa23          	sw	a4,-492(a5) # 13e14 <CSRA_INPUT>
    1a48:	fec42783          	lw	a5,-20(s0)
    1a4c:	01878713          	addi	a4,a5,24
    1a50:	000147b7          	lui	a5,0x14
    1a54:	e0e7ac23          	sw	a4,-488(a5) # 13e18 <CSRA_OUTPUT>
    1a58:	fec42783          	lw	a5,-20(s0)
    1a5c:	01c78713          	addi	a4,a5,28
    1a60:	000147b7          	lui	a5,0x14
    1a64:	e0e7ae23          	sw	a4,-484(a5) # 13e1c <CSRA_MASK>
    1a68:	fec42783          	lw	a5,-20(s0)
    1a6c:	02078713          	addi	a4,a5,32
    1a70:	000147b7          	lui	a5,0x14
    1a74:	e2e7a023          	sw	a4,-480(a5) # 13e20 <CSRA_IRQ>
    1a78:	fec42783          	lw	a5,-20(s0)
    1a7c:	02478713          	addi	a4,a5,36
    1a80:	000147b7          	lui	a5,0x14
    1a84:	e2e7a223          	sw	a4,-476(a5) # 13e24 <CSRA_EDGE>
    1a88:	fec42783          	lw	a5,-20(s0)
    1a8c:	02878713          	addi	a4,a5,40
    1a90:	000147b7          	lui	a5,0x14
    1a94:	e2e7a423          	sw	a4,-472(a5) # 13e28 <CSRA_POL>
    1a98:	00000793          	li	a5,0
    1a9c:	00078513          	mv	a0,a5
    1aa0:	01c12403          	lw	s0,28(sp)
    1aa4:	02010113          	addi	sp,sp,32
    1aa8:	00008067          	ret

00001aac <gpio_get_addr>:
    1aac:	ff010113          	addi	sp,sp,-16
    1ab0:	00812623          	sw	s0,12(sp)
    1ab4:	01010413          	addi	s0,sp,16
    1ab8:	000147b7          	lui	a5,0x14
    1abc:	e047a783          	lw	a5,-508(a5) # 13e04 <ADDR_GPIO>
    1ac0:	00078513          	mv	a0,a5
    1ac4:	00c12403          	lw	s0,12(sp)
    1ac8:	01010113          	addi	sp,sp,16
    1acc:	00008067          	ret

00001ad0 <keypad_init>:
    1ad0:	fd010113          	addi	sp,sp,-48
    1ad4:	02112623          	sw	ra,44(sp)
    1ad8:	02812423          	sw	s0,40(sp)
    1adc:	03010413          	addi	s0,sp,48
    1ae0:	fca42e23          	sw	a0,-36(s0)
    1ae4:	000147b7          	lui	a5,0x14
    1ae8:	fdc42703          	lw	a4,-36(s0)
    1aec:	e2e7a623          	sw	a4,-468(a5) # 13e2c <keypad_gpio_addr>
    1af0:	fdc42503          	lw	a0,-36(s0)
    1af4:	efdff0ef          	jal	19f0 <gpio_set_addr>
    1af8:	00f00793          	li	a5,15
    1afc:	fef42623          	sw	a5,-20(s0)
    1b00:	00f00513          	li	a0,15
    1b04:	b7dff0ef          	jal	1680 <gpio_write>
    1b08:	00000693          	li	a3,0
    1b0c:	00000613          	li	a2,0
    1b10:	00000593          	li	a1,0
    1b14:	fec42503          	lw	a0,-20(s0)
    1b18:	b9dff0ef          	jal	16b4 <gpio_init>
    1b1c:	00000013          	nop
    1b20:	02c12083          	lw	ra,44(sp)
    1b24:	02812403          	lw	s0,40(sp)
    1b28:	03010113          	addi	sp,sp,48
    1b2c:	00008067          	ret

00001b30 <keypad_scan>:
    1b30:	fd010113          	addi	sp,sp,-48
    1b34:	02112623          	sw	ra,44(sp)
    1b38:	02812423          	sw	s0,40(sp)
    1b3c:	03010413          	addi	s0,sp,48
    1b40:	000147b7          	lui	a5,0x14
    1b44:	e2c7a783          	lw	a5,-468(a5) # 13e2c <keypad_gpio_addr>
    1b48:	00078513          	mv	a0,a5
    1b4c:	ea5ff0ef          	jal	19f0 <gpio_set_addr>
    1b50:	fe042623          	sw	zero,-20(s0)
    1b54:	0c80006f          	j	1c1c <keypad_scan+0xec>
    1b58:	fec42783          	lw	a5,-20(s0)
    1b5c:	00100713          	li	a4,1
    1b60:	00f717b3          	sll	a5,a4,a5
    1b64:	fff7c793          	not	a5,a5
    1b68:	00f7f793          	andi	a5,a5,15
    1b6c:	fef42223          	sw	a5,-28(s0)
    1b70:	fe442503          	lw	a0,-28(s0)
    1b74:	b0dff0ef          	jal	1680 <gpio_write>
    1b78:	06400793          	li	a5,100
    1b7c:	fcf42c23          	sw	a5,-40(s0)
    1b80:	00000013          	nop
    1b84:	fd842783          	lw	a5,-40(s0)
    1b88:	fff78713          	addi	a4,a5,-1
    1b8c:	fce42c23          	sw	a4,-40(s0)
    1b90:	fe079ae3          	bnez	a5,1b84 <keypad_scan+0x54>
    1b94:	abdff0ef          	jal	1650 <gpio_read>
    1b98:	fea42023          	sw	a0,-32(s0)
    1b9c:	fe042783          	lw	a5,-32(s0)
    1ba0:	0047d793          	srli	a5,a5,0x4
    1ba4:	00f7f793          	andi	a5,a5,15
    1ba8:	fcf42e23          	sw	a5,-36(s0)
    1bac:	fdc42703          	lw	a4,-36(s0)
    1bb0:	00f00793          	li	a5,15
    1bb4:	04f70e63          	beq	a4,a5,1c10 <keypad_scan+0xe0>
    1bb8:	fe042423          	sw	zero,-24(s0)
    1bbc:	0480006f          	j	1c04 <keypad_scan+0xd4>
    1bc0:	fe842783          	lw	a5,-24(s0)
    1bc4:	00100713          	li	a4,1
    1bc8:	00f717b3          	sll	a5,a4,a5
    1bcc:	00078713          	mv	a4,a5
    1bd0:	fdc42783          	lw	a5,-36(s0)
    1bd4:	00f777b3          	and	a5,a4,a5
    1bd8:	02079063          	bnez	a5,1bf8 <keypad_scan+0xc8>
    1bdc:	00f00513          	li	a0,15
    1be0:	aa1ff0ef          	jal	1680 <gpio_write>
    1be4:	fe842783          	lw	a5,-24(s0)
    1be8:	00279713          	slli	a4,a5,0x2
    1bec:	fec42783          	lw	a5,-20(s0)
    1bf0:	00f707b3          	add	a5,a4,a5
    1bf4:	0400006f          	j	1c34 <keypad_scan+0x104>
    1bf8:	fe842783          	lw	a5,-24(s0)
    1bfc:	00178793          	addi	a5,a5,1
    1c00:	fef42423          	sw	a5,-24(s0)
    1c04:	fe842703          	lw	a4,-24(s0)
    1c08:	00300793          	li	a5,3
    1c0c:	fae7dae3          	bge	a5,a4,1bc0 <keypad_scan+0x90>
    1c10:	fec42783          	lw	a5,-20(s0)
    1c14:	00178793          	addi	a5,a5,1
    1c18:	fef42623          	sw	a5,-20(s0)
    1c1c:	fec42703          	lw	a4,-20(s0)
    1c20:	00300793          	li	a5,3
    1c24:	f2e7dae3          	bge	a5,a4,1b58 <keypad_scan+0x28>
    1c28:	00f00513          	li	a0,15
    1c2c:	a55ff0ef          	jal	1680 <gpio_write>
    1c30:	fff00793          	li	a5,-1
    1c34:	00078513          	mv	a0,a5
    1c38:	02c12083          	lw	ra,44(sp)
    1c3c:	02812403          	lw	s0,40(sp)
    1c40:	03010113          	addi	sp,sp,48
    1c44:	00008067          	ret

00001c48 <keypad_get_char>:
    1c48:	fe010113          	addi	sp,sp,-32
    1c4c:	00112e23          	sw	ra,28(sp)
    1c50:	00812c23          	sw	s0,24(sp)
    1c54:	02010413          	addi	s0,sp,32
    1c58:	ed9ff0ef          	jal	1b30 <keypad_scan>
    1c5c:	fea42623          	sw	a0,-20(s0)
    1c60:	fec42783          	lw	a5,-20(s0)
    1c64:	0607c263          	bltz	a5,1cc8 <keypad_get_char+0x80>
    1c68:	fec42703          	lw	a4,-20(s0)
    1c6c:	00f00793          	li	a5,15
    1c70:	04e7cc63          	blt	a5,a4,1cc8 <keypad_get_char+0x80>
    1c74:	fec42783          	lw	a5,-20(s0)
    1c78:	41f7d713          	srai	a4,a5,0x1f
    1c7c:	00377713          	andi	a4,a4,3
    1c80:	00f707b3          	add	a5,a4,a5
    1c84:	4027d793          	srai	a5,a5,0x2
    1c88:	fef42423          	sw	a5,-24(s0)
    1c8c:	fec42703          	lw	a4,-20(s0)
    1c90:	41f75793          	srai	a5,a4,0x1f
    1c94:	01e7d793          	srli	a5,a5,0x1e
    1c98:	00f70733          	add	a4,a4,a5
    1c9c:	00377713          	andi	a4,a4,3
    1ca0:	40f707b3          	sub	a5,a4,a5
    1ca4:	fef42223          	sw	a5,-28(s0)
    1ca8:	3b018713          	addi	a4,gp,944 # 12cc0 <keypad_map>
    1cac:	fe442783          	lw	a5,-28(s0)
    1cb0:	00279793          	slli	a5,a5,0x2
    1cb4:	00f70733          	add	a4,a4,a5
    1cb8:	fe842783          	lw	a5,-24(s0)
    1cbc:	00f707b3          	add	a5,a4,a5
    1cc0:	0007c783          	lbu	a5,0(a5)
    1cc4:	0080006f          	j	1ccc <keypad_get_char+0x84>
    1cc8:	00000793          	li	a5,0
    1ccc:	00078513          	mv	a0,a5
    1cd0:	01c12083          	lw	ra,28(sp)
    1cd4:	01812403          	lw	s0,24(sp)
    1cd8:	02010113          	addi	sp,sp,32
    1cdc:	00008067          	ret

00001ce0 <io_fence>:
    1ce0:	ff010113          	addi	sp,sp,-16
    1ce4:	00812623          	sw	s0,12(sp)
    1ce8:	01010413          	addi	s0,sp,16
    1cec:	0ff0000f          	fence
    1cf0:	00000013          	nop
    1cf4:	00c12403          	lw	s0,12(sp)
    1cf8:	01010113          	addi	sp,sp,16
    1cfc:	00008067          	ret

00001d00 <mmio_read32_safe>:
    1d00:	fd010113          	addi	sp,sp,-48
    1d04:	02112623          	sw	ra,44(sp)
    1d08:	02812423          	sw	s0,40(sp)
    1d0c:	03010413          	addi	s0,sp,48
    1d10:	fca42e23          	sw	a0,-36(s0)
    1d14:	fdc42583          	lw	a1,-36(s0)
    1d18:	3c018513          	addi	a0,gp,960 # 12cd0 <keypad_map+0x10>
    1d1c:	bfdfe0ef          	jal	918 <my_printf>
    1d20:	fc1ff0ef          	jal	1ce0 <io_fence>
    1d24:	fdc42783          	lw	a5,-36(s0)
    1d28:	fef42623          	sw	a5,-20(s0)
    1d2c:	fec42783          	lw	a5,-20(s0)
    1d30:	0007a783          	lw	a5,0(a5)
    1d34:	fef42423          	sw	a5,-24(s0)
    1d38:	fa9ff0ef          	jal	1ce0 <io_fence>
    1d3c:	fe842583          	lw	a1,-24(s0)
    1d40:	3e818513          	addi	a0,gp,1000 # 12cf8 <keypad_map+0x38>
    1d44:	bd5fe0ef          	jal	918 <my_printf>
    1d48:	fe842783          	lw	a5,-24(s0)
    1d4c:	00078513          	mv	a0,a5
    1d50:	02c12083          	lw	ra,44(sp)
    1d54:	02812403          	lw	s0,40(sp)
    1d58:	03010113          	addi	sp,sp,48
    1d5c:	00008067          	ret

00001d60 <i2c_recalc_map>:
    1d60:	ff010113          	addi	sp,sp,-16
    1d64:	00812623          	sw	s0,12(sp)
    1d68:	01010413          	addi	s0,sp,16
    1d6c:	000147b7          	lui	a5,0x14
    1d70:	e307a703          	lw	a4,-464(a5) # 13e30 <ADDR_I2C>
    1d74:	000147b7          	lui	a5,0x14
    1d78:	e4e7a423          	sw	a4,-440(a5) # 13e48 <CSRA_VERSION>
    1d7c:	000147b7          	lui	a5,0x14
    1d80:	e307a783          	lw	a5,-464(a5) # 13e30 <ADDR_I2C>
    1d84:	00478713          	addi	a4,a5,4
    1d88:	000147b7          	lui	a5,0x14
    1d8c:	e4e7a623          	sw	a4,-436(a5) # 13e4c <CSRA_NAME>
    1d90:	000147b7          	lui	a5,0x14
    1d94:	e307a783          	lw	a5,-464(a5) # 13e30 <ADDR_I2C>
    1d98:	00878713          	addi	a4,a5,8
    1d9c:	000147b7          	lui	a5,0x14
    1da0:	e4e7a823          	sw	a4,-432(a5) # 13e50 <CSRA_DATA0>
    1da4:	000147b7          	lui	a5,0x14
    1da8:	e307a783          	lw	a5,-464(a5) # 13e30 <ADDR_I2C>
    1dac:	00c78713          	addi	a4,a5,12
    1db0:	000147b7          	lui	a5,0x14
    1db4:	e4e7aa23          	sw	a4,-428(a5) # 13e54 <CSRA_DATA1>
    1db8:	000147b7          	lui	a5,0x14
    1dbc:	e307a783          	lw	a5,-464(a5) # 13e30 <ADDR_I2C>
    1dc0:	01078713          	addi	a4,a5,16
    1dc4:	000147b7          	lui	a5,0x14
    1dc8:	e4e7ac23          	sw	a4,-424(a5) # 13e58 <CSRA_STATUS>
    1dcc:	000147b7          	lui	a5,0x14
    1dd0:	e307a783          	lw	a5,-464(a5) # 13e30 <ADDR_I2C>
    1dd4:	01478713          	addi	a4,a5,20
    1dd8:	000147b7          	lui	a5,0x14
    1ddc:	e4e7ae23          	sw	a4,-420(a5) # 13e5c <CSRA_DATA2>
    1de0:	000147b7          	lui	a5,0x14
    1de4:	00100713          	li	a4,1
    1de8:	e6e78023          	sb	a4,-416(a5) # 13e60 <i2c_map_ready>
    1dec:	00000013          	nop
    1df0:	00c12403          	lw	s0,12(sp)
    1df4:	01010113          	addi	sp,sp,16
    1df8:	00008067          	ret

00001dfc <i2c_ensure_mapped>:
    1dfc:	ff010113          	addi	sp,sp,-16
    1e00:	00112623          	sw	ra,12(sp)
    1e04:	00812423          	sw	s0,8(sp)
    1e08:	01010413          	addi	s0,sp,16
    1e0c:	000147b7          	lui	a5,0x14
    1e10:	e607c783          	lbu	a5,-416(a5) # 13e60 <i2c_map_ready>
    1e14:	00079463          	bnez	a5,1e1c <i2c_ensure_mapped+0x20>
    1e18:	f49ff0ef          	jal	1d60 <i2c_recalc_map>
    1e1c:	00000013          	nop
    1e20:	00c12083          	lw	ra,12(sp)
    1e24:	00812403          	lw	s0,8(sp)
    1e28:	01010113          	addi	sp,sp,16
    1e2c:	00008067          	ret

00001e30 <__i2c_api_ctor>:
    1e30:	ff010113          	addi	sp,sp,-16
    1e34:	00112623          	sw	ra,12(sp)
    1e38:	00812423          	sw	s0,8(sp)
    1e3c:	01010413          	addi	s0,sp,16
    1e40:	f21ff0ef          	jal	1d60 <i2c_recalc_map>
    1e44:	00000013          	nop
    1e48:	00c12083          	lw	ra,12(sp)
    1e4c:	00812403          	lw	s0,8(sp)
    1e50:	01010113          	addi	sp,sp,16
    1e54:	00008067          	ret

00001e58 <i2c_read_data>:
    1e58:	ff010113          	addi	sp,sp,-16
    1e5c:	00112623          	sw	ra,12(sp)
    1e60:	00812423          	sw	s0,8(sp)
    1e64:	01010413          	addi	s0,sp,16
    1e68:	f95ff0ef          	jal	1dfc <i2c_ensure_mapped>
    1e6c:	000147b7          	lui	a5,0x14
    1e70:	e5c7a783          	lw	a5,-420(a5) # 13e5c <CSRA_DATA2>
    1e74:	00078513          	mv	a0,a5
    1e78:	e89ff0ef          	jal	1d00 <mmio_read32_safe>
    1e7c:	00050793          	mv	a5,a0
    1e80:	00078513          	mv	a0,a5
    1e84:	00c12083          	lw	ra,12(sp)
    1e88:	00812403          	lw	s0,8(sp)
    1e8c:	01010113          	addi	sp,sp,16
    1e90:	00008067          	ret

00001e94 <i2c_write_data>:
    1e94:	fe010113          	addi	sp,sp,-32
    1e98:	00112e23          	sw	ra,28(sp)
    1e9c:	00812c23          	sw	s0,24(sp)
    1ea0:	02010413          	addi	s0,sp,32
    1ea4:	fea42623          	sw	a0,-20(s0)
    1ea8:	f55ff0ef          	jal	1dfc <i2c_ensure_mapped>
    1eac:	000147b7          	lui	a5,0x14
    1eb0:	e547a783          	lw	a5,-428(a5) # 13e54 <CSRA_DATA1>
    1eb4:	00078713          	mv	a4,a5
    1eb8:	fec42783          	lw	a5,-20(s0)
    1ebc:	00f72023          	sw	a5,0(a4)
    1ec0:	00000013          	nop
    1ec4:	01c12083          	lw	ra,28(sp)
    1ec8:	01812403          	lw	s0,24(sp)
    1ecc:	02010113          	addi	sp,sp,32
    1ed0:	00008067          	ret

00001ed4 <i2c_get_status>:
    1ed4:	fe010113          	addi	sp,sp,-32
    1ed8:	00112e23          	sw	ra,28(sp)
    1edc:	00812c23          	sw	s0,24(sp)
    1ee0:	02010413          	addi	s0,sp,32
    1ee4:	40c18513          	addi	a0,gp,1036 # 12d1c <keypad_map+0x5c>
    1ee8:	a31fe0ef          	jal	918 <my_printf>
    1eec:	f11ff0ef          	jal	1dfc <i2c_ensure_mapped>
    1ef0:	41c18513          	addi	a0,gp,1052 # 12d2c <keypad_map+0x6c>
    1ef4:	a25fe0ef          	jal	918 <my_printf>
    1ef8:	000147b7          	lui	a5,0x14
    1efc:	e587a783          	lw	a5,-424(a5) # 13e58 <CSRA_STATUS>
    1f00:	00078513          	mv	a0,a5
    1f04:	dfdff0ef          	jal	1d00 <mmio_read32_safe>
    1f08:	fea42623          	sw	a0,-20(s0)
    1f0c:	fec42583          	lw	a1,-20(s0)
    1f10:	43018513          	addi	a0,gp,1072 # 12d40 <keypad_map+0x80>
    1f14:	a05fe0ef          	jal	918 <my_printf>
    1f18:	fec42783          	lw	a5,-20(s0)
    1f1c:	00078513          	mv	a0,a5
    1f20:	01c12083          	lw	ra,28(sp)
    1f24:	01812403          	lw	s0,24(sp)
    1f28:	02010113          	addi	sp,sp,32
    1f2c:	00008067          	ret

00001f30 <i2c_start_simple>:
    1f30:	fd010113          	addi	sp,sp,-48
    1f34:	02112623          	sw	ra,44(sp)
    1f38:	02812423          	sw	s0,40(sp)
    1f3c:	03010413          	addi	s0,sp,48
    1f40:	00050793          	mv	a5,a0
    1f44:	fcf40fa3          	sb	a5,-33(s0)
    1f48:	00058793          	mv	a5,a1
    1f4c:	fcf40f23          	sb	a5,-34(s0)
    1f50:	00060793          	mv	a5,a2
    1f54:	fcf40ea3          	sb	a5,-35(s0)
    1f58:	00068793          	mv	a5,a3
    1f5c:	fcf40e23          	sb	a5,-36(s0)
    1f60:	00070793          	mv	a5,a4
    1f64:	fcf40da3          	sb	a5,-37(s0)
    1f68:	e95ff0ef          	jal	1dfc <i2c_ensure_mapped>
    1f6c:	fe042623          	sw	zero,-20(s0)
    1f70:	fdf44783          	lbu	a5,-33(s0)
    1f74:	00179793          	slli	a5,a5,0x1
    1f78:	0ff7f793          	zext.b	a5,a5
    1f7c:	fec42703          	lw	a4,-20(s0)
    1f80:	00f767b3          	or	a5,a4,a5
    1f84:	fef42623          	sw	a5,-20(s0)
    1f88:	fdd44783          	lbu	a5,-35(s0)
    1f8c:	0017f793          	andi	a5,a5,1
    1f90:	fec42703          	lw	a4,-20(s0)
    1f94:	00f767b3          	or	a5,a4,a5
    1f98:	fef42623          	sw	a5,-20(s0)
    1f9c:	fde44783          	lbu	a5,-34(s0)
    1fa0:	00879793          	slli	a5,a5,0x8
    1fa4:	fec42703          	lw	a4,-20(s0)
    1fa8:	00f767b3          	or	a5,a4,a5
    1fac:	fef42623          	sw	a5,-20(s0)
    1fb0:	fdc44783          	lbu	a5,-36(s0)
    1fb4:	01079713          	slli	a4,a5,0x10
    1fb8:	000107b7          	lui	a5,0x10
    1fbc:	00f777b3          	and	a5,a4,a5
    1fc0:	fec42703          	lw	a4,-20(s0)
    1fc4:	00f767b3          	or	a5,a4,a5
    1fc8:	fef42623          	sw	a5,-20(s0)
    1fcc:	fdb44783          	lbu	a5,-37(s0)
    1fd0:	01179713          	slli	a4,a5,0x11
    1fd4:	000207b7          	lui	a5,0x20
    1fd8:	00f777b3          	and	a5,a4,a5
    1fdc:	fec42703          	lw	a4,-20(s0)
    1fe0:	00f767b3          	or	a5,a4,a5
    1fe4:	fef42623          	sw	a5,-20(s0)
    1fe8:	fec42703          	lw	a4,-20(s0)
    1fec:	800007b7          	lui	a5,0x80000
    1ff0:	00f767b3          	or	a5,a4,a5
    1ff4:	fef42623          	sw	a5,-20(s0)
    1ff8:	000147b7          	lui	a5,0x14
    1ffc:	e507a783          	lw	a5,-432(a5) # 13e50 <CSRA_DATA0>
    2000:	00078713          	mv	a4,a5
    2004:	fec42783          	lw	a5,-20(s0)
    2008:	00f72023          	sw	a5,0(a4)
    200c:	00000013          	nop
    2010:	02c12083          	lw	ra,44(sp)
    2014:	02812403          	lw	s0,40(sp)
    2018:	03010113          	addi	sp,sp,48
    201c:	00008067          	ret

00002020 <i2c_csr>:
    2020:	fe010113          	addi	sp,sp,-32
    2024:	00112e23          	sw	ra,28(sp)
    2028:	00812c23          	sw	s0,24(sp)
    202c:	02010413          	addi	s0,sp,32
    2030:	dcdff0ef          	jal	1dfc <i2c_ensure_mapped>
    2034:	44818513          	addi	a0,gp,1096 # 12d58 <keypad_map+0x98>
    2038:	8e1fe0ef          	jal	918 <my_printf>
    203c:	000147b7          	lui	a5,0x14
    2040:	e487a783          	lw	a5,-440(a5) # 13e48 <CSRA_VERSION>
    2044:	00078513          	mv	a0,a5
    2048:	cb9ff0ef          	jal	1d00 <mmio_read32_safe>
    204c:	fea42623          	sw	a0,-20(s0)
    2050:	fec42583          	lw	a1,-20(s0)
    2054:	45018513          	addi	a0,gp,1104 # 12d60 <keypad_map+0xa0>
    2058:	8c1fe0ef          	jal	918 <my_printf>
    205c:	000147b7          	lui	a5,0x14
    2060:	e4c7a783          	lw	a5,-436(a5) # 13e4c <CSRA_NAME>
    2064:	00078513          	mv	a0,a5
    2068:	c99ff0ef          	jal	1d00 <mmio_read32_safe>
    206c:	fea42623          	sw	a0,-20(s0)
    2070:	fec42583          	lw	a1,-20(s0)
    2074:	46818513          	addi	a0,gp,1128 # 12d78 <keypad_map+0xb8>
    2078:	8a1fe0ef          	jal	918 <my_printf>
    207c:	000147b7          	lui	a5,0x14
    2080:	e507a783          	lw	a5,-432(a5) # 13e50 <CSRA_DATA0>
    2084:	00078513          	mv	a0,a5
    2088:	c79ff0ef          	jal	1d00 <mmio_read32_safe>
    208c:	fea42623          	sw	a0,-20(s0)
    2090:	fec42583          	lw	a1,-20(s0)
    2094:	48018513          	addi	a0,gp,1152 # 12d90 <keypad_map+0xd0>
    2098:	881fe0ef          	jal	918 <my_printf>
    209c:	000147b7          	lui	a5,0x14
    20a0:	e547a783          	lw	a5,-428(a5) # 13e54 <CSRA_DATA1>
    20a4:	00078513          	mv	a0,a5
    20a8:	c59ff0ef          	jal	1d00 <mmio_read32_safe>
    20ac:	fea42623          	sw	a0,-20(s0)
    20b0:	fec42583          	lw	a1,-20(s0)
    20b4:	49818513          	addi	a0,gp,1176 # 12da8 <keypad_map+0xe8>
    20b8:	861fe0ef          	jal	918 <my_printf>
    20bc:	000147b7          	lui	a5,0x14
    20c0:	e587a783          	lw	a5,-424(a5) # 13e58 <CSRA_STATUS>
    20c4:	00078513          	mv	a0,a5
    20c8:	c39ff0ef          	jal	1d00 <mmio_read32_safe>
    20cc:	fea42623          	sw	a0,-20(s0)
    20d0:	fec42583          	lw	a1,-20(s0)
    20d4:	4b018513          	addi	a0,gp,1200 # 12dc0 <keypad_map+0x100>
    20d8:	841fe0ef          	jal	918 <my_printf>
    20dc:	000147b7          	lui	a5,0x14
    20e0:	e5c7a783          	lw	a5,-420(a5) # 13e5c <CSRA_DATA2>
    20e4:	00078513          	mv	a0,a5
    20e8:	c19ff0ef          	jal	1d00 <mmio_read32_safe>
    20ec:	fea42623          	sw	a0,-20(s0)
    20f0:	fec42583          	lw	a1,-20(s0)
    20f4:	4c818513          	addi	a0,gp,1224 # 12dd8 <keypad_map+0x118>
    20f8:	821fe0ef          	jal	918 <my_printf>
    20fc:	00000013          	nop
    2100:	01c12083          	lw	ra,28(sp)
    2104:	01812403          	lw	s0,24(sp)
    2108:	02010113          	addi	sp,sp,32
    210c:	00008067          	ret

00002110 <i2c_set_addr>:
    2110:	fe010113          	addi	sp,sp,-32
    2114:	00112e23          	sw	ra,28(sp)
    2118:	00812c23          	sw	s0,24(sp)
    211c:	02010413          	addi	s0,sp,32
    2120:	fea42623          	sw	a0,-20(s0)
    2124:	000147b7          	lui	a5,0x14
    2128:	fec42703          	lw	a4,-20(s0)
    212c:	e2e7a823          	sw	a4,-464(a5) # 13e30 <ADDR_I2C>
    2130:	c31ff0ef          	jal	1d60 <i2c_recalc_map>
    2134:	00000793          	li	a5,0
    2138:	00078513          	mv	a0,a5
    213c:	01c12083          	lw	ra,28(sp)
    2140:	01812403          	lw	s0,24(sp)
    2144:	02010113          	addi	sp,sp,32
    2148:	00008067          	ret

0000214c <i2c_get_addr>:
    214c:	ff010113          	addi	sp,sp,-16
    2150:	00812623          	sw	s0,12(sp)
    2154:	01010413          	addi	s0,sp,16
    2158:	000147b7          	lui	a5,0x14
    215c:	e307a783          	lw	a5,-464(a5) # 13e30 <ADDR_I2C>
    2160:	00078513          	mv	a0,a5
    2164:	00c12403          	lw	s0,12(sp)
    2168:	01010113          	addi	sp,sp,16
    216c:	00008067          	ret

00002170 <i2c_delay_ms>:
    2170:	fd010113          	addi	sp,sp,-48
    2174:	02812623          	sw	s0,44(sp)
    2178:	03010413          	addi	s0,sp,48
    217c:	fca42e23          	sw	a0,-36(s0)
    2180:	fdc42703          	lw	a4,-36(s0)
    2184:	000027b7          	lui	a5,0x2
    2188:	71078793          	addi	a5,a5,1808 # 2710 <_vfprintf_r+0x200>
    218c:	02f707b3          	mul	a5,a4,a5
    2190:	fef42623          	sw	a5,-20(s0)
    2194:	00000013          	nop
    2198:	fec42783          	lw	a5,-20(s0)
    219c:	fff78713          	addi	a4,a5,-1
    21a0:	fee42623          	sw	a4,-20(s0)
    21a4:	fe079ae3          	bnez	a5,2198 <i2c_delay_ms+0x28>
    21a8:	00000013          	nop
    21ac:	00000013          	nop
    21b0:	02c12403          	lw	s0,44(sp)
    21b4:	03010113          	addi	sp,sp,48
    21b8:	00008067          	ret

000021bc <i2c_eeprom_read_bytes>:
    21bc:	fd010113          	addi	sp,sp,-48
    21c0:	02112623          	sw	ra,44(sp)
    21c4:	02812423          	sw	s0,40(sp)
    21c8:	03010413          	addi	s0,sp,48
    21cc:	00050793          	mv	a5,a0
    21d0:	fcb42c23          	sw	a1,-40(s0)
    21d4:	00060713          	mv	a4,a2
    21d8:	fcf40fa3          	sb	a5,-33(s0)
    21dc:	00070793          	mv	a5,a4
    21e0:	fcf40f23          	sb	a5,-34(s0)
    21e4:	fd842783          	lw	a5,-40(s0)
    21e8:	00078663          	beqz	a5,21f4 <i2c_eeprom_read_bytes+0x38>
    21ec:	fde44783          	lbu	a5,-34(s0)
    21f0:	00079663          	bnez	a5,21fc <i2c_eeprom_read_bytes+0x40>
    21f4:	fff00793          	li	a5,-1
    21f8:	0700006f          	j	2268 <i2c_eeprom_read_bytes+0xac>
    21fc:	fdf44783          	lbu	a5,-33(s0)
    2200:	00000713          	li	a4,0
    2204:	00000693          	li	a3,0
    2208:	00000613          	li	a2,0
    220c:	00078593          	mv	a1,a5
    2210:	05000513          	li	a0,80
    2214:	d1dff0ef          	jal	1f30 <i2c_start_simple>
    2218:	00100513          	li	a0,1
    221c:	f55ff0ef          	jal	2170 <i2c_delay_ms>
    2220:	fdf44783          	lbu	a5,-33(s0)
    2224:	00000713          	li	a4,0
    2228:	00100693          	li	a3,1
    222c:	00100613          	li	a2,1
    2230:	00078593          	mv	a1,a5
    2234:	05000513          	li	a0,80
    2238:	cf9ff0ef          	jal	1f30 <i2c_start_simple>
    223c:	00100513          	li	a0,1
    2240:	f31ff0ef          	jal	2170 <i2c_delay_ms>
    2244:	fde44783          	lbu	a5,-34(s0)
    2248:	00078e63          	beqz	a5,2264 <i2c_eeprom_read_bytes+0xa8>
    224c:	c0dff0ef          	jal	1e58 <i2c_read_data>
    2250:	fea42623          	sw	a0,-20(s0)
    2254:	fec42783          	lw	a5,-20(s0)
    2258:	0ff7f713          	zext.b	a4,a5
    225c:	fd842783          	lw	a5,-40(s0)
    2260:	00e78023          	sb	a4,0(a5)
    2264:	00000793          	li	a5,0
    2268:	00078513          	mv	a0,a5
    226c:	02c12083          	lw	ra,44(sp)
    2270:	02812403          	lw	s0,40(sp)
    2274:	03010113          	addi	sp,sp,48
    2278:	00008067          	ret

0000227c <i2c_eeprom_write_bytes>:
    227c:	fe010113          	addi	sp,sp,-32
    2280:	00112e23          	sw	ra,28(sp)
    2284:	00812c23          	sw	s0,24(sp)
    2288:	02010413          	addi	s0,sp,32
    228c:	00050793          	mv	a5,a0
    2290:	feb42423          	sw	a1,-24(s0)
    2294:	00060713          	mv	a4,a2
    2298:	fef407a3          	sb	a5,-17(s0)
    229c:	00070793          	mv	a5,a4
    22a0:	fef40723          	sb	a5,-18(s0)
    22a4:	fe842783          	lw	a5,-24(s0)
    22a8:	00078663          	beqz	a5,22b4 <i2c_eeprom_write_bytes+0x38>
    22ac:	fee44783          	lbu	a5,-18(s0)
    22b0:	00079663          	bnez	a5,22bc <i2c_eeprom_write_bytes+0x40>
    22b4:	fff00793          	li	a5,-1
    22b8:	03c0006f          	j	22f4 <i2c_eeprom_write_bytes+0x78>
    22bc:	fe842783          	lw	a5,-24(s0)
    22c0:	0007c783          	lbu	a5,0(a5)
    22c4:	00078513          	mv	a0,a5
    22c8:	bcdff0ef          	jal	1e94 <i2c_write_data>
    22cc:	fef44783          	lbu	a5,-17(s0)
    22d0:	00000713          	li	a4,0
    22d4:	00000693          	li	a3,0
    22d8:	00000613          	li	a2,0
    22dc:	00078593          	mv	a1,a5
    22e0:	05000513          	li	a0,80
    22e4:	c4dff0ef          	jal	1f30 <i2c_start_simple>
    22e8:	00a00513          	li	a0,10
    22ec:	e85ff0ef          	jal	2170 <i2c_delay_ms>
    22f0:	00000793          	li	a5,0
    22f4:	00078513          	mv	a0,a5
    22f8:	01c12083          	lw	ra,28(sp)
    22fc:	01812403          	lw	s0,24(sp)
    2300:	02010113          	addi	sp,sp,32
    2304:	00008067          	ret

00002308 <_close>:
    2308:	fe010113          	addi	sp,sp,-32
    230c:	00812e23          	sw	s0,28(sp)
    2310:	02010413          	addi	s0,sp,32
    2314:	fea42623          	sw	a0,-20(s0)
    2318:	fff00793          	li	a5,-1
    231c:	00078513          	mv	a0,a5
    2320:	01c12403          	lw	s0,28(sp)
    2324:	02010113          	addi	sp,sp,32
    2328:	00008067          	ret

0000232c <_lseek>:
    232c:	fe010113          	addi	sp,sp,-32
    2330:	00812e23          	sw	s0,28(sp)
    2334:	02010413          	addi	s0,sp,32
    2338:	fea42623          	sw	a0,-20(s0)
    233c:	feb42423          	sw	a1,-24(s0)
    2340:	fec42223          	sw	a2,-28(s0)
    2344:	00000793          	li	a5,0
    2348:	00078513          	mv	a0,a5
    234c:	01c12403          	lw	s0,28(sp)
    2350:	02010113          	addi	sp,sp,32
    2354:	00008067          	ret

00002358 <_read>:
    2358:	fe010113          	addi	sp,sp,-32
    235c:	00812e23          	sw	s0,28(sp)
    2360:	02010413          	addi	s0,sp,32
    2364:	fea42623          	sw	a0,-20(s0)
    2368:	feb42423          	sw	a1,-24(s0)
    236c:	fec42223          	sw	a2,-28(s0)
    2370:	00000793          	li	a5,0
    2374:	00078513          	mv	a0,a5
    2378:	01c12403          	lw	s0,28(sp)
    237c:	02010113          	addi	sp,sp,32
    2380:	00008067          	ret

00002384 <_write>:
    2384:	fe010113          	addi	sp,sp,-32
    2388:	00812e23          	sw	s0,28(sp)
    238c:	02010413          	addi	s0,sp,32
    2390:	fea42623          	sw	a0,-20(s0)
    2394:	feb42423          	sw	a1,-24(s0)
    2398:	fec42223          	sw	a2,-28(s0)
    239c:	fe442783          	lw	a5,-28(s0)
    23a0:	00078513          	mv	a0,a5
    23a4:	01c12403          	lw	s0,28(sp)
    23a8:	02010113          	addi	sp,sp,32
    23ac:	00008067          	ret

000023b0 <_fstat>:
    23b0:	fe010113          	addi	sp,sp,-32
    23b4:	00812e23          	sw	s0,28(sp)
    23b8:	02010413          	addi	s0,sp,32
    23bc:	fea42623          	sw	a0,-20(s0)
    23c0:	feb42423          	sw	a1,-24(s0)
    23c4:	fff00793          	li	a5,-1
    23c8:	00078513          	mv	a0,a5
    23cc:	01c12403          	lw	s0,28(sp)
    23d0:	02010113          	addi	sp,sp,32
    23d4:	00008067          	ret

000023d8 <_isatty>:
    23d8:	fe010113          	addi	sp,sp,-32
    23dc:	00812e23          	sw	s0,28(sp)
    23e0:	02010413          	addi	s0,sp,32
    23e4:	fea42623          	sw	a0,-20(s0)
    23e8:	00000793          	li	a5,0
    23ec:	00078513          	mv	a0,a5
    23f0:	01c12403          	lw	s0,28(sp)
    23f4:	02010113          	addi	sp,sp,32
    23f8:	00008067          	ret

000023fc <_sbrk>:
    23fc:	fe010113          	addi	sp,sp,-32
    2400:	00812e23          	sw	s0,28(sp)
    2404:	02010413          	addi	s0,sp,32
    2408:	fea42623          	sw	a0,-20(s0)
    240c:	fff00793          	li	a5,-1
    2410:	00078513          	mv	a0,a5
    2414:	01c12403          	lw	s0,28(sp)
    2418:	02010113          	addi	sp,sp,32
    241c:	00008067          	ret

00002420 <_exit>:
    2420:	fe010113          	addi	sp,sp,-32
    2424:	00812e23          	sw	s0,28(sp)
    2428:	02010413          	addi	s0,sp,32
    242c:	fea42623          	sw	a0,-20(s0)
    2430:	00000013          	nop
    2434:	ffdff06f          	j	2430 <_exit+0x10>

00002438 <_kill>:
    2438:	fe010113          	addi	sp,sp,-32
    243c:	00812e23          	sw	s0,28(sp)
    2440:	02010413          	addi	s0,sp,32
    2444:	fea42623          	sw	a0,-20(s0)
    2448:	feb42423          	sw	a1,-24(s0)
    244c:	fff00793          	li	a5,-1
    2450:	00078513          	mv	a0,a5
    2454:	01c12403          	lw	s0,28(sp)
    2458:	02010113          	addi	sp,sp,32
    245c:	00008067          	ret

00002460 <_getpid>:
    2460:	ff010113          	addi	sp,sp,-16
    2464:	00812623          	sw	s0,12(sp)
    2468:	01010413          	addi	s0,sp,16
    246c:	00100793          	li	a5,1
    2470:	00078513          	mv	a0,a5
    2474:	00c12403          	lw	s0,12(sp)
    2478:	01010113          	addi	sp,sp,16
    247c:	00008067          	ret

00002480 <_printf_r>:
    2480:	fc010113          	addi	sp,sp,-64
    2484:	02c12423          	sw	a2,40(sp)
    2488:	02d12623          	sw	a3,44(sp)
    248c:	02e12823          	sw	a4,48(sp)
    2490:	02f12a23          	sw	a5,52(sp)
    2494:	03012c23          	sw	a6,56(sp)
    2498:	03112e23          	sw	a7,60(sp)
    249c:	00058613          	mv	a2,a1
    24a0:	00852583          	lw	a1,8(a0) # 90040008 <_memory_end+0x90020008>
    24a4:	02810693          	addi	a3,sp,40
    24a8:	00112e23          	sw	ra,28(sp)
    24ac:	00d12623          	sw	a3,12(sp)
    24b0:	060000ef          	jal	2510 <_vfprintf_r>
    24b4:	01c12083          	lw	ra,28(sp)
    24b8:	04010113          	addi	sp,sp,64
    24bc:	00008067          	ret

000024c0 <printf>:
    24c0:	00014337          	lui	t1,0x14
    24c4:	e3432303          	lw	t1,-460(t1) # 13e34 <_impure_ptr>
    24c8:	fc010113          	addi	sp,sp,-64
    24cc:	02c12423          	sw	a2,40(sp)
    24d0:	02d12623          	sw	a3,44(sp)
    24d4:	02b12223          	sw	a1,36(sp)
    24d8:	02e12823          	sw	a4,48(sp)
    24dc:	02f12a23          	sw	a5,52(sp)
    24e0:	03012c23          	sw	a6,56(sp)
    24e4:	03112e23          	sw	a7,60(sp)
    24e8:	00832583          	lw	a1,8(t1)
    24ec:	02410693          	addi	a3,sp,36
    24f0:	00050613          	mv	a2,a0
    24f4:	00030513          	mv	a0,t1
    24f8:	00112e23          	sw	ra,28(sp)
    24fc:	00d12623          	sw	a3,12(sp)
    2500:	010000ef          	jal	2510 <_vfprintf_r>
    2504:	01c12083          	lw	ra,28(sp)
    2508:	04010113          	addi	sp,sp,64
    250c:	00008067          	ret

00002510 <_vfprintf_r>:
    2510:	e3010113          	addi	sp,sp,-464
    2514:	1c112623          	sw	ra,460(sp)
    2518:	1c812423          	sw	s0,456(sp)
    251c:	1c912223          	sw	s1,452(sp)
    2520:	1b612823          	sw	s6,432(sp)
    2524:	00058493          	mv	s1,a1
    2528:	00060b13          	mv	s6,a2
    252c:	00d12a23          	sw	a3,20(sp)
    2530:	00050413          	mv	s0,a0
    2534:	00a12423          	sw	a0,8(sp)
    2538:	229030ef          	jal	5f60 <_localeconv_r>
    253c:	00052703          	lw	a4,0(a0)
    2540:	00070513          	mv	a0,a4
    2544:	02e12823          	sw	a4,48(sp)
    2548:	048040ef          	jal	6590 <strlen>
    254c:	02a12623          	sw	a0,44(sp)
    2550:	0c012823          	sw	zero,208(sp)
    2554:	0c012a23          	sw	zero,212(sp)
    2558:	0c012c23          	sw	zero,216(sp)
    255c:	0c012e23          	sw	zero,220(sp)
    2560:	00040863          	beqz	s0,2570 <_vfprintf_r+0x60>
    2564:	03442703          	lw	a4,52(s0)
    2568:	00071463          	bnez	a4,2570 <_vfprintf_r+0x60>
    256c:	0fd0106f          	j	3e68 <_vfprintf_r+0x1958>
    2570:	00c49683          	lh	a3,12(s1)
    2574:	0644a703          	lw	a4,100(s1)
    2578:	01269613          	slli	a2,a3,0x12
    257c:	02064063          	bltz	a2,259c <_vfprintf_r+0x8c>
    2580:	ffffe637          	lui	a2,0xffffe
    2584:	fff60613          	addi	a2,a2,-1 # ffffdfff <_memory_end+0xfffddfff>
    2588:	000025b7          	lui	a1,0x2
    258c:	00b6e6b3          	or	a3,a3,a1
    2590:	00c77733          	and	a4,a4,a2
    2594:	00d49623          	sh	a3,12(s1)
    2598:	06e4a223          	sw	a4,100(s1)
    259c:	01271693          	slli	a3,a4,0x12
    25a0:	0006d463          	bgez	a3,25a8 <_vfprintf_r+0x98>
    25a4:	3bc0206f          	j	4960 <_vfprintf_r+0x2450>
    25a8:	00c49703          	lh	a4,12(s1)
    25ac:	00877693          	andi	a3,a4,8
    25b0:	30068063          	beqz	a3,28b0 <_vfprintf_r+0x3a0>
    25b4:	0104a683          	lw	a3,16(s1)
    25b8:	2e068c63          	beqz	a3,28b0 <_vfprintf_r+0x3a0>
    25bc:	01a77713          	andi	a4,a4,26
    25c0:	00a00693          	li	a3,10
    25c4:	30d70863          	beq	a4,a3,28d4 <_vfprintf_r+0x3c4>
    25c8:	1b312e23          	sw	s3,444(sp)
    25cc:	1b412c23          	sw	s4,440(sp)
    25d0:	1ba12023          	sw	s10,416(sp)
    25d4:	1d212023          	sw	s2,448(sp)
    25d8:	1b512a23          	sw	s5,436(sp)
    25dc:	1b712623          	sw	s7,428(sp)
    25e0:	1b812423          	sw	s8,424(sp)
    25e4:	1b912223          	sw	s9,420(sp)
    25e8:	19b12e23          	sw	s11,412(sp)
    25ec:	000b0d13          	mv	s10,s6
    25f0:	69418793          	addi	a5,gp,1684 # 12fa4 <keypad_map+0x2e4>
    25f4:	000d4703          	lbu	a4,0(s10)
    25f8:	0ec10993          	addi	s3,sp,236
    25fc:	00013a37          	lui	s4,0x13
    2600:	0d312223          	sw	s3,196(sp)
    2604:	0c012623          	sw	zero,204(sp)
    2608:	0c012423          	sw	zero,200(sp)
    260c:	02012023          	sw	zero,32(sp)
    2610:	02012a23          	sw	zero,52(sp)
    2614:	04012023          	sw	zero,64(sp)
    2618:	02012e23          	sw	zero,60(sp)
    261c:	04012423          	sw	zero,72(sp)
    2620:	04012223          	sw	zero,68(sp)
    2624:	00012623          	sw	zero,12(sp)
    2628:	00f12c23          	sw	a5,24(sp)
    262c:	00098413          	mv	s0,s3
    2630:	1a8a0a13          	addi	s4,s4,424 # 131a8 <zeroes.0>
    2634:	22070063          	beqz	a4,2854 <_vfprintf_r+0x344>
    2638:	000d0913          	mv	s2,s10
    263c:	02500693          	li	a3,37
    2640:	3ed70a63          	beq	a4,a3,2a34 <_vfprintf_r+0x524>
    2644:	00194703          	lbu	a4,1(s2)
    2648:	00190913          	addi	s2,s2,1
    264c:	fe071ae3          	bnez	a4,2640 <_vfprintf_r+0x130>
    2650:	41a90ab3          	sub	s5,s2,s10
    2654:	21a90063          	beq	s2,s10,2854 <_vfprintf_r+0x344>
    2658:	0cc12683          	lw	a3,204(sp)
    265c:	0c812703          	lw	a4,200(sp)
    2660:	01a42023          	sw	s10,0(s0)
    2664:	015686b3          	add	a3,a3,s5
    2668:	00170713          	addi	a4,a4,1
    266c:	01542223          	sw	s5,4(s0)
    2670:	0cd12623          	sw	a3,204(sp)
    2674:	0ce12423          	sw	a4,200(sp)
    2678:	00700693          	li	a3,7
    267c:	00840413          	addi	s0,s0,8
    2680:	3ce6c263          	blt	a3,a4,2a44 <_vfprintf_r+0x534>
    2684:	00c12783          	lw	a5,12(sp)
    2688:	00094703          	lbu	a4,0(s2)
    268c:	015787b3          	add	a5,a5,s5
    2690:	00f12623          	sw	a5,12(sp)
    2694:	1c070063          	beqz	a4,2854 <_vfprintf_r+0x344>
    2698:	00194883          	lbu	a7,1(s2)
    269c:	0a0103a3          	sb	zero,167(sp)
    26a0:	00190913          	addi	s2,s2,1
    26a4:	fff00a93          	li	s5,-1
    26a8:	00000b93          	li	s7,0
    26ac:	00000c93          	li	s9,0
    26b0:	05a00b13          	li	s6,90
    26b4:	00190913          	addi	s2,s2,1
    26b8:	fe088793          	addi	a5,a7,-32
    26bc:	04fb6663          	bltu	s6,a5,2708 <_vfprintf_r+0x1f8>
    26c0:	01812703          	lw	a4,24(sp)
    26c4:	00279793          	slli	a5,a5,0x2
    26c8:	00e787b3          	add	a5,a5,a4
    26cc:	0007a783          	lw	a5,0(a5)
    26d0:	00078067          	jr	a5
    26d4:	00000b93          	li	s7,0
    26d8:	fd088793          	addi	a5,a7,-48
    26dc:	00900693          	li	a3,9
    26e0:	00094883          	lbu	a7,0(s2)
    26e4:	002b9713          	slli	a4,s7,0x2
    26e8:	01770bb3          	add	s7,a4,s7
    26ec:	001b9b93          	slli	s7,s7,0x1
    26f0:	01778bb3          	add	s7,a5,s7
    26f4:	fd088793          	addi	a5,a7,-48
    26f8:	00190913          	addi	s2,s2,1
    26fc:	fef6f2e3          	bgeu	a3,a5,26e0 <_vfprintf_r+0x1d0>
    2700:	fe088793          	addi	a5,a7,-32
    2704:	fafb7ee3          	bgeu	s6,a5,26c0 <_vfprintf_r+0x1b0>
    2708:	14088663          	beqz	a7,2854 <_vfprintf_r+0x344>
    270c:	13110623          	sb	a7,300(sp)
    2710:	0a0103a3          	sb	zero,167(sp)
    2714:	00100d93          	li	s11,1
    2718:	00100b13          	li	s6,1
    271c:	12c10d13          	addi	s10,sp,300
    2720:	00012823          	sw	zero,16(sp)
    2724:	00000a93          	li	s5,0
    2728:	02012423          	sw	zero,40(sp)
    272c:	02012223          	sw	zero,36(sp)
    2730:	00012e23          	sw	zero,28(sp)
    2734:	002cf293          	andi	t0,s9,2
    2738:	00028463          	beqz	t0,2740 <_vfprintf_r+0x230>
    273c:	002d8d93          	addi	s11,s11,2
    2740:	084cff93          	andi	t6,s9,132
    2744:	0cc12603          	lw	a2,204(sp)
    2748:	000f9663          	bnez	t6,2754 <_vfprintf_r+0x244>
    274c:	41bb8733          	sub	a4,s7,s11
    2750:	46e044e3          	bgtz	a4,33b8 <_vfprintf_r+0xea8>
    2754:	0a714703          	lbu	a4,167(sp)
    2758:	02070a63          	beqz	a4,278c <_vfprintf_r+0x27c>
    275c:	0c812703          	lw	a4,200(sp)
    2760:	0a710593          	addi	a1,sp,167
    2764:	00b42023          	sw	a1,0(s0)
    2768:	00160613          	addi	a2,a2,1
    276c:	00100593          	li	a1,1
    2770:	00170713          	addi	a4,a4,1
    2774:	00b42223          	sw	a1,4(s0)
    2778:	0cc12623          	sw	a2,204(sp)
    277c:	0ce12423          	sw	a4,200(sp)
    2780:	00700593          	li	a1,7
    2784:	00840413          	addi	s0,s0,8
    2788:	3ee5c463          	blt	a1,a4,2b70 <_vfprintf_r+0x660>
    278c:	02028a63          	beqz	t0,27c0 <_vfprintf_r+0x2b0>
    2790:	0c812703          	lw	a4,200(sp)
    2794:	00200593          	li	a1,2
    2798:	00260613          	addi	a2,a2,2
    279c:	00170713          	addi	a4,a4,1
    27a0:	0a810793          	addi	a5,sp,168
    27a4:	00b42223          	sw	a1,4(s0)
    27a8:	00f42023          	sw	a5,0(s0)
    27ac:	0cc12623          	sw	a2,204(sp)
    27b0:	0ce12423          	sw	a4,200(sp)
    27b4:	00700593          	li	a1,7
    27b8:	00840413          	addi	s0,s0,8
    27bc:	50e5cce3          	blt	a1,a4,34d4 <_vfprintf_r+0xfc4>
    27c0:	08000713          	li	a4,128
    27c4:	1eef80e3          	beq	t6,a4,31a4 <_vfprintf_r+0xc94>
    27c8:	416a8ab3          	sub	s5,s5,s6
    27cc:	2d504ee3          	bgtz	s5,32a8 <_vfprintf_r+0xd98>
    27d0:	100cf713          	andi	a4,s9,256
    27d4:	02071ee3          	bnez	a4,3010 <_vfprintf_r+0xb00>
    27d8:	0c812783          	lw	a5,200(sp)
    27dc:	01660633          	add	a2,a2,s6
    27e0:	01a42023          	sw	s10,0(s0)
    27e4:	00178793          	addi	a5,a5,1
    27e8:	01642223          	sw	s6,4(s0)
    27ec:	0cc12623          	sw	a2,204(sp)
    27f0:	0cf12423          	sw	a5,200(sp)
    27f4:	00700713          	li	a4,7
    27f8:	4af74c63          	blt	a4,a5,2cb0 <_vfprintf_r+0x7a0>
    27fc:	00840413          	addi	s0,s0,8
    2800:	004cfe13          	andi	t3,s9,4
    2804:	000e0663          	beqz	t3,2810 <_vfprintf_r+0x300>
    2808:	41bb8ab3          	sub	s5,s7,s11
    280c:	4f504ce3          	bgtz	s5,3504 <_vfprintf_r+0xff4>
    2810:	000b8313          	mv	t1,s7
    2814:	01bbd463          	bge	s7,s11,281c <_vfprintf_r+0x30c>
    2818:	000d8313          	mv	t1,s11
    281c:	00c12783          	lw	a5,12(sp)
    2820:	006787b3          	add	a5,a5,t1
    2824:	00f12623          	sw	a5,12(sp)
    2828:	360610e3          	bnez	a2,3388 <_vfprintf_r+0xe78>
    282c:	01012783          	lw	a5,16(sp)
    2830:	0c012423          	sw	zero,200(sp)
    2834:	00078863          	beqz	a5,2844 <_vfprintf_r+0x334>
    2838:	01012583          	lw	a1,16(sp)
    283c:	00812503          	lw	a0,8(sp)
    2840:	0a4040ef          	jal	68e4 <_free_r>
    2844:	00098413          	mv	s0,s3
    2848:	00090d13          	mv	s10,s2
    284c:	000d4703          	lbu	a4,0(s10)
    2850:	de0714e3          	bnez	a4,2638 <_vfprintf_r+0x128>
    2854:	0cc12783          	lw	a5,204(sp)
    2858:	00078463          	beqz	a5,2860 <_vfprintf_r+0x350>
    285c:	3950106f          	j	43f0 <_vfprintf_r+0x1ee0>
    2860:	00c4d783          	lhu	a5,12(s1)
    2864:	1c012903          	lw	s2,448(sp)
    2868:	1bc12983          	lw	s3,444(sp)
    286c:	0407f793          	andi	a5,a5,64
    2870:	1b812a03          	lw	s4,440(sp)
    2874:	1b412a83          	lw	s5,436(sp)
    2878:	1ac12b83          	lw	s7,428(sp)
    287c:	1a812c03          	lw	s8,424(sp)
    2880:	1a412c83          	lw	s9,420(sp)
    2884:	1a012d03          	lw	s10,416(sp)
    2888:	19c12d83          	lw	s11,412(sp)
    288c:	00078463          	beqz	a5,2894 <_vfprintf_r+0x384>
    2890:	0d00206f          	j	4960 <_vfprintf_r+0x2450>
    2894:	1cc12083          	lw	ra,460(sp)
    2898:	1c812403          	lw	s0,456(sp)
    289c:	00c12503          	lw	a0,12(sp)
    28a0:	1c412483          	lw	s1,452(sp)
    28a4:	1b012b03          	lw	s6,432(sp)
    28a8:	1d010113          	addi	sp,sp,464
    28ac:	00008067          	ret
    28b0:	00812503          	lw	a0,8(sp)
    28b4:	00048593          	mv	a1,s1
    28b8:	3ec030ef          	jal	5ca4 <__swsetup_r>
    28bc:	00050463          	beqz	a0,28c4 <_vfprintf_r+0x3b4>
    28c0:	0a00206f          	j	4960 <_vfprintf_r+0x2450>
    28c4:	00c49703          	lh	a4,12(s1)
    28c8:	00a00693          	li	a3,10
    28cc:	01a77713          	andi	a4,a4,26
    28d0:	ced71ce3          	bne	a4,a3,25c8 <_vfprintf_r+0xb8>
    28d4:	00e49703          	lh	a4,14(s1)
    28d8:	ce0748e3          	bltz	a4,25c8 <_vfprintf_r+0xb8>
    28dc:	01412683          	lw	a3,20(sp)
    28e0:	00812503          	lw	a0,8(sp)
    28e4:	000b0613          	mv	a2,s6
    28e8:	00048593          	mv	a1,s1
    28ec:	4a4020ef          	jal	4d90 <__sbprintf>
    28f0:	00a12623          	sw	a0,12(sp)
    28f4:	fa1ff06f          	j	2894 <_vfprintf_r+0x384>
    28f8:	00812c03          	lw	s8,8(sp)
    28fc:	000c0513          	mv	a0,s8
    2900:	660030ef          	jal	5f60 <_localeconv_r>
    2904:	00452783          	lw	a5,4(a0)
    2908:	00078513          	mv	a0,a5
    290c:	04f12223          	sw	a5,68(sp)
    2910:	481030ef          	jal	6590 <strlen>
    2914:	00050793          	mv	a5,a0
    2918:	000c0513          	mv	a0,s8
    291c:	04f12423          	sw	a5,72(sp)
    2920:	00078c13          	mv	s8,a5
    2924:	63c030ef          	jal	5f60 <_localeconv_r>
    2928:	00852703          	lw	a4,8(a0)
    292c:	02e12e23          	sw	a4,60(sp)
    2930:	720c14e3          	bnez	s8,3858 <_vfprintf_r+0x1348>
    2934:	00094883          	lbu	a7,0(s2)
    2938:	d7dff06f          	j	26b4 <_vfprintf_r+0x1a4>
    293c:	00094883          	lbu	a7,0(s2)
    2940:	020cec93          	ori	s9,s9,32
    2944:	d71ff06f          	j	26b4 <_vfprintf_r+0x1a4>
    2948:	010cec93          	ori	s9,s9,16
    294c:	020cf793          	andi	a5,s9,32
    2950:	38078063          	beqz	a5,2cd0 <_vfprintf_r+0x7c0>
    2954:	01412783          	lw	a5,20(sp)
    2958:	00778c13          	addi	s8,a5,7
    295c:	ff8c7c13          	andi	s8,s8,-8
    2960:	004c2783          	lw	a5,4(s8)
    2964:	000c2b03          	lw	s6,0(s8)
    2968:	008c0713          	addi	a4,s8,8
    296c:	00e12a23          	sw	a4,20(sp)
    2970:	00078d93          	mv	s11,a5
    2974:	3807c863          	bltz	a5,2d04 <_vfprintf_r+0x7f4>
    2978:	000c8e93          	mv	t4,s9
    297c:	4e0ac463          	bltz	s5,2e64 <_vfprintf_r+0x954>
    2980:	01bb67b3          	or	a5,s6,s11
    2984:	f7fcfe93          	andi	t4,s9,-129
    2988:	4c079e63          	bnez	a5,2e64 <_vfprintf_r+0x954>
    298c:	4e0a9263          	bnez	s5,2e70 <_vfprintf_r+0x960>
    2990:	00000b13          	li	s6,0
    2994:	000e8c93          	mv	s9,t4
    2998:	19010d13          	addi	s10,sp,400
    299c:	0a714703          	lbu	a4,167(sp)
    29a0:	000a8d93          	mv	s11,s5
    29a4:	016ad463          	bge	s5,s6,29ac <_vfprintf_r+0x49c>
    29a8:	000b0d93          	mv	s11,s6
    29ac:	00012823          	sw	zero,16(sp)
    29b0:	02012423          	sw	zero,40(sp)
    29b4:	02012223          	sw	zero,36(sp)
    29b8:	00012e23          	sw	zero,28(sp)
    29bc:	d6070ce3          	beqz	a4,2734 <_vfprintf_r+0x224>
    29c0:	001d8d93          	addi	s11,s11,1
    29c4:	d71ff06f          	j	2734 <_vfprintf_r+0x224>
    29c8:	010cec93          	ori	s9,s9,16
    29cc:	020cf793          	andi	a5,s9,32
    29d0:	3c078263          	beqz	a5,2d94 <_vfprintf_r+0x884>
    29d4:	01412783          	lw	a5,20(sp)
    29d8:	00778c13          	addi	s8,a5,7
    29dc:	ff8c7c13          	andi	s8,s8,-8
    29e0:	000c2b03          	lw	s6,0(s8)
    29e4:	004c2d83          	lw	s11,4(s8)
    29e8:	008c0793          	addi	a5,s8,8
    29ec:	00f12a23          	sw	a5,20(sp)
    29f0:	bffcfe93          	andi	t4,s9,-1025
    29f4:	00000793          	li	a5,0
    29f8:	00000713          	li	a4,0
    29fc:	0ae103a3          	sb	a4,167(sp)
    2a00:	320ac463          	bltz	s5,2d28 <_vfprintf_r+0x818>
    2a04:	01bb6733          	or	a4,s6,s11
    2a08:	f7fefc93          	andi	s9,t4,-129
    2a0c:	1a0712e3          	bnez	a4,33b0 <_vfprintf_r+0xea0>
    2a10:	720a9c63          	bnez	s5,3148 <_vfprintf_r+0xc38>
    2a14:	5e0790e3          	bnez	a5,37f4 <_vfprintf_r+0x12e4>
    2a18:	001efb13          	andi	s6,t4,1
    2a1c:	19010d13          	addi	s10,sp,400
    2a20:	f60b0ee3          	beqz	s6,299c <_vfprintf_r+0x48c>
    2a24:	03000793          	li	a5,48
    2a28:	18f107a3          	sb	a5,399(sp)
    2a2c:	18f10d13          	addi	s10,sp,399
    2a30:	f6dff06f          	j	299c <_vfprintf_r+0x48c>
    2a34:	41a90ab3          	sub	s5,s2,s10
    2a38:	c3a910e3          	bne	s2,s10,2658 <_vfprintf_r+0x148>
    2a3c:	00094703          	lbu	a4,0(s2)
    2a40:	c55ff06f          	j	2694 <_vfprintf_r+0x184>
    2a44:	00812503          	lw	a0,8(sp)
    2a48:	0c410613          	addi	a2,sp,196
    2a4c:	00048593          	mv	a1,s1
    2a50:	40c020ef          	jal	4e5c <__sprint_r>
    2a54:	e00516e3          	bnez	a0,2860 <_vfprintf_r+0x350>
    2a58:	00098413          	mv	s0,s3
    2a5c:	c29ff06f          	j	2684 <_vfprintf_r+0x174>
    2a60:	008cf713          	andi	a4,s9,8
    2a64:	640712e3          	bnez	a4,38a8 <_vfprintf_r+0x1398>
    2a68:	01412783          	lw	a5,20(sp)
    2a6c:	09010513          	addi	a0,sp,144
    2a70:	01112823          	sw	a7,16(sp)
    2a74:	00778c13          	addi	s8,a5,7
    2a78:	ff8c7c13          	andi	s8,s8,-8
    2a7c:	000c2583          	lw	a1,0(s8)
    2a80:	004c2603          	lw	a2,4(s8)
    2a84:	008c0793          	addi	a5,s8,8
    2a88:	00f12a23          	sw	a5,20(sp)
    2a8c:	2b10f0ef          	jal	1253c <__extenddftf2>
    2a90:	09012583          	lw	a1,144(sp)
    2a94:	09412603          	lw	a2,148(sp)
    2a98:	09812683          	lw	a3,152(sp)
    2a9c:	09c12703          	lw	a4,156(sp)
    2aa0:	01012883          	lw	a7,16(sp)
    2aa4:	0d010513          	addi	a0,sp,208
    2aa8:	01112823          	sw	a7,16(sp)
    2aac:	0ce12e23          	sw	a4,220(sp)
    2ab0:	0cb12823          	sw	a1,208(sp)
    2ab4:	0cc12a23          	sw	a2,212(sp)
    2ab8:	0cd12c23          	sw	a3,216(sp)
    2abc:	3d8040ef          	jal	6e94 <_ldcheck>
    2ac0:	0aa12623          	sw	a0,172(sp)
    2ac4:	00200713          	li	a4,2
    2ac8:	01012883          	lw	a7,16(sp)
    2acc:	00e51463          	bne	a0,a4,2ad4 <_vfprintf_r+0x5c4>
    2ad0:	3f00106f          	j	3ec0 <_vfprintf_r+0x19b0>
    2ad4:	00100713          	li	a4,1
    2ad8:	00e51463          	bne	a0,a4,2ae0 <_vfprintf_r+0x5d0>
    2adc:	5380106f          	j	4014 <_vfprintf_r+0x1b04>
    2ae0:	06100713          	li	a4,97
    2ae4:	00e89463          	bne	a7,a4,2aec <_vfprintf_r+0x5dc>
    2ae8:	78d0006f          	j	3a74 <_vfprintf_r+0x1564>
    2aec:	04100713          	li	a4,65
    2af0:	05800793          	li	a5,88
    2af4:	78e882e3          	beq	a7,a4,3a78 <_vfprintf_r+0x1568>
    2af8:	fff00713          	li	a4,-1
    2afc:	00ea9463          	bne	s5,a4,2b04 <_vfprintf_r+0x5f4>
    2b00:	0d80206f          	j	4bd8 <_vfprintf_r+0x26c8>
    2b04:	fdf8f713          	andi	a4,a7,-33
    2b08:	04700693          	li	a3,71
    2b0c:	00012823          	sw	zero,16(sp)
    2b10:	00d71663          	bne	a4,a3,2b1c <_vfprintf_r+0x60c>
    2b14:	000a9463          	bnez	s5,2b1c <_vfprintf_r+0x60c>
    2b18:	00100a93          	li	s5,1
    2b1c:	0dc12c03          	lw	s8,220(sp)
    2b20:	100ce793          	ori	a5,s9,256
    2b24:	04f12623          	sw	a5,76(sp)
    2b28:	02012c23          	sw	zero,56(sp)
    2b2c:	0d012f83          	lw	t6,208(sp)
    2b30:	0d412f03          	lw	t5,212(sp)
    2b34:	0d812e83          	lw	t4,216(sp)
    2b38:	000c5a63          	bgez	s8,2b4c <_vfprintf_r+0x63c>
    2b3c:	80000737          	lui	a4,0x80000
    2b40:	02d00793          	li	a5,45
    2b44:	01874c33          	xor	s8,a4,s8
    2b48:	02f12c23          	sw	a5,56(sp)
    2b4c:	fbf88713          	addi	a4,a7,-65
    2b50:	02500693          	li	a3,37
    2b54:	76e6e6e3          	bltu	a3,a4,3ac0 <_vfprintf_r+0x15b0>
    2b58:	000136b7          	lui	a3,0x13
    2b5c:	00271713          	slli	a4,a4,0x2
    2b60:	11068693          	addi	a3,a3,272 # 13110 <keypad_map+0x450>
    2b64:	00d70733          	add	a4,a4,a3
    2b68:	00072703          	lw	a4,0(a4) # 80000000 <_memory_end+0x7ffe0000>
    2b6c:	00070067          	jr	a4
    2b70:	00812503          	lw	a0,8(sp)
    2b74:	0c410613          	addi	a2,sp,196
    2b78:	00048593          	mv	a1,s1
    2b7c:	05112823          	sw	a7,80(sp)
    2b80:	05f12623          	sw	t6,76(sp)
    2b84:	02512c23          	sw	t0,56(sp)
    2b88:	2d4020ef          	jal	4e5c <__sprint_r>
    2b8c:	000518e3          	bnez	a0,339c <_vfprintf_r+0xe8c>
    2b90:	0cc12603          	lw	a2,204(sp)
    2b94:	05012883          	lw	a7,80(sp)
    2b98:	04c12f83          	lw	t6,76(sp)
    2b9c:	03812283          	lw	t0,56(sp)
    2ba0:	00098413          	mv	s0,s3
    2ba4:	be9ff06f          	j	278c <_vfprintf_r+0x27c>
    2ba8:	0c812a83          	lw	s5,200(sp)
    2bac:	02012783          	lw	a5,32(sp)
    2bb0:	00100713          	li	a4,1
    2bb4:	01a42023          	sw	s10,0(s0)
    2bb8:	00160c13          	addi	s8,a2,1
    2bbc:	001a8a93          	addi	s5,s5,1
    2bc0:	00840b13          	addi	s6,s0,8
    2bc4:	32f75ee3          	bge	a4,a5,3700 <_vfprintf_r+0x11f0>
    2bc8:	00100713          	li	a4,1
    2bcc:	00e42223          	sw	a4,4(s0)
    2bd0:	0d812623          	sw	s8,204(sp)
    2bd4:	0d512423          	sw	s5,200(sp)
    2bd8:	00700713          	li	a4,7
    2bdc:	01575463          	bge	a4,s5,2be4 <_vfprintf_r+0x6d4>
    2be0:	0a80106f          	j	3c88 <_vfprintf_r+0x1778>
    2be4:	02c12783          	lw	a5,44(sp)
    2be8:	03012703          	lw	a4,48(sp)
    2bec:	001a8a93          	addi	s5,s5,1
    2bf0:	00fc0c33          	add	s8,s8,a5
    2bf4:	00eb2023          	sw	a4,0(s6)
    2bf8:	00fb2223          	sw	a5,4(s6)
    2bfc:	0d812623          	sw	s8,204(sp)
    2c00:	0d512423          	sw	s5,200(sp)
    2c04:	00700713          	li	a4,7
    2c08:	008b0b13          	addi	s6,s6,8
    2c0c:	01575463          	bge	a4,s5,2c14 <_vfprintf_r+0x704>
    2c10:	09c0106f          	j	3cac <_vfprintf_r+0x179c>
    2c14:	0d012703          	lw	a4,208(sp)
    2c18:	02012783          	lw	a5,32(sp)
    2c1c:	08010593          	addi	a1,sp,128
    2c20:	08e12823          	sw	a4,144(sp)
    2c24:	0d412703          	lw	a4,212(sp)
    2c28:	09010513          	addi	a0,sp,144
    2c2c:	08012023          	sw	zero,128(sp)
    2c30:	08e12a23          	sw	a4,148(sp)
    2c34:	0d812703          	lw	a4,216(sp)
    2c38:	08012223          	sw	zero,132(sp)
    2c3c:	08012423          	sw	zero,136(sp)
    2c40:	08e12c23          	sw	a4,152(sp)
    2c44:	0dc12703          	lw	a4,220(sp)
    2c48:	08012623          	sw	zero,140(sp)
    2c4c:	fff78413          	addi	s0,a5,-1
    2c50:	08e12e23          	sw	a4,156(sp)
    2c54:	4780c0ef          	jal	f0cc <__eqtf2>
    2c58:	2e0504e3          	beqz	a0,3740 <_vfprintf_r+0x1230>
    2c5c:	001d0793          	addi	a5,s10,1
    2c60:	001a8a93          	addi	s5,s5,1
    2c64:	008c0c33          	add	s8,s8,s0
    2c68:	00fb2023          	sw	a5,0(s6)
    2c6c:	008b2223          	sw	s0,4(s6)
    2c70:	0d812623          	sw	s8,204(sp)
    2c74:	0d512423          	sw	s5,200(sp)
    2c78:	00700793          	li	a5,7
    2c7c:	008b0b13          	addi	s6,s6,8
    2c80:	2957cee3          	blt	a5,s5,371c <_vfprintf_r+0x120c>
    2c84:	04012683          	lw	a3,64(sp)
    2c88:	0b410713          	addi	a4,sp,180
    2c8c:	001a8793          	addi	a5,s5,1
    2c90:	01868633          	add	a2,a3,s8
    2c94:	00eb2023          	sw	a4,0(s6)
    2c98:	00db2223          	sw	a3,4(s6)
    2c9c:	0cc12623          	sw	a2,204(sp)
    2ca0:	0cf12423          	sw	a5,200(sp)
    2ca4:	00700713          	li	a4,7
    2ca8:	008b0413          	addi	s0,s6,8
    2cac:	b4f75ae3          	bge	a4,a5,2800 <_vfprintf_r+0x2f0>
    2cb0:	00812503          	lw	a0,8(sp)
    2cb4:	0c410613          	addi	a2,sp,196
    2cb8:	00048593          	mv	a1,s1
    2cbc:	1a0020ef          	jal	4e5c <__sprint_r>
    2cc0:	6c051e63          	bnez	a0,339c <_vfprintf_r+0xe8c>
    2cc4:	0cc12603          	lw	a2,204(sp)
    2cc8:	00098413          	mv	s0,s3
    2ccc:	b35ff06f          	j	2800 <_vfprintf_r+0x2f0>
    2cd0:	01412703          	lw	a4,20(sp)
    2cd4:	010cf793          	andi	a5,s9,16
    2cd8:	00072b03          	lw	s6,0(a4)
    2cdc:	00470713          	addi	a4,a4,4
    2ce0:	00e12a23          	sw	a4,20(sp)
    2ce4:	360794e3          	bnez	a5,384c <_vfprintf_r+0x133c>
    2ce8:	040cf793          	andi	a5,s9,64
    2cec:	34078ce3          	beqz	a5,3844 <_vfprintf_r+0x1334>
    2cf0:	010b1b13          	slli	s6,s6,0x10
    2cf4:	410b5b13          	srai	s6,s6,0x10
    2cf8:	41fb5d93          	srai	s11,s6,0x1f
    2cfc:	000d8793          	mv	a5,s11
    2d00:	c607dce3          	bgez	a5,2978 <_vfprintf_r+0x468>
    2d04:	02d00713          	li	a4,45
    2d08:	016037b3          	snez	a5,s6
    2d0c:	41b00db3          	neg	s11,s11
    2d10:	0ae103a3          	sb	a4,167(sp)
    2d14:	40fd8db3          	sub	s11,s11,a5
    2d18:	41600b33          	neg	s6,s6
    2d1c:	000c8e93          	mv	t4,s9
    2d20:	00100793          	li	a5,1
    2d24:	ce0ad0e3          	bgez	s5,2a04 <_vfprintf_r+0x4f4>
    2d28:	00100713          	li	a4,1
    2d2c:	12e78c63          	beq	a5,a4,2e64 <_vfprintf_r+0x954>
    2d30:	00200713          	li	a4,2
    2d34:	42e78663          	beq	a5,a4,3160 <_vfprintf_r+0xc50>
    2d38:	19010d13          	addi	s10,sp,400
    2d3c:	01dd9793          	slli	a5,s11,0x1d
    2d40:	007b7713          	andi	a4,s6,7
    2d44:	003b5b13          	srli	s6,s6,0x3
    2d48:	03070713          	addi	a4,a4,48
    2d4c:	0167eb33          	or	s6,a5,s6
    2d50:	003ddd93          	srli	s11,s11,0x3
    2d54:	feed0fa3          	sb	a4,-1(s10)
    2d58:	01bb67b3          	or	a5,s6,s11
    2d5c:	000d0613          	mv	a2,s10
    2d60:	fffd0d13          	addi	s10,s10,-1
    2d64:	fc079ce3          	bnez	a5,2d3c <_vfprintf_r+0x82c>
    2d68:	001ef693          	andi	a3,t4,1
    2d6c:	42068463          	beqz	a3,3194 <_vfprintf_r+0xc84>
    2d70:	03000693          	li	a3,48
    2d74:	42d70063          	beq	a4,a3,3194 <_vfprintf_r+0xc84>
    2d78:	ffe60613          	addi	a2,a2,-2
    2d7c:	19010793          	addi	a5,sp,400
    2d80:	fedd0fa3          	sb	a3,-1(s10)
    2d84:	40c78b33          	sub	s6,a5,a2
    2d88:	000e8c93          	mv	s9,t4
    2d8c:	00060d13          	mv	s10,a2
    2d90:	c0dff06f          	j	299c <_vfprintf_r+0x48c>
    2d94:	01412703          	lw	a4,20(sp)
    2d98:	010cf793          	andi	a5,s9,16
    2d9c:	00072b03          	lw	s6,0(a4)
    2da0:	00470713          	addi	a4,a4,4
    2da4:	00e12a23          	sw	a4,20(sp)
    2da8:	28079ae3          	bnez	a5,383c <_vfprintf_r+0x132c>
    2dac:	040cf793          	andi	a5,s9,64
    2db0:	280782e3          	beqz	a5,3834 <_vfprintf_r+0x1324>
    2db4:	010b1b13          	slli	s6,s6,0x10
    2db8:	010b5b13          	srli	s6,s6,0x10
    2dbc:	00000d93          	li	s11,0
    2dc0:	c31ff06f          	j	29f0 <_vfprintf_r+0x4e0>
    2dc4:	01412703          	lw	a4,20(sp)
    2dc8:	0a0103a3          	sb	zero,167(sp)
    2dcc:	00100d93          	li	s11,1
    2dd0:	00072783          	lw	a5,0(a4)
    2dd4:	00470713          	addi	a4,a4,4
    2dd8:	00e12a23          	sw	a4,20(sp)
    2ddc:	12f10623          	sb	a5,300(sp)
    2de0:	00100b13          	li	s6,1
    2de4:	12c10d13          	addi	s10,sp,300
    2de8:	939ff06f          	j	2720 <_vfprintf_r+0x210>
    2dec:	01412783          	lw	a5,20(sp)
    2df0:	0a0103a3          	sb	zero,167(sp)
    2df4:	0007ad03          	lw	s10,0(a5)
    2df8:	00478c13          	addi	s8,a5,4
    2dfc:	380d0ae3          	beqz	s10,3990 <_vfprintf_r+0x1480>
    2e00:	000ad463          	bgez	s5,2e08 <_vfprintf_r+0x8f8>
    2e04:	1b00106f          	j	3fb4 <_vfprintf_r+0x1aa4>
    2e08:	000a8613          	mv	a2,s5
    2e0c:	00000593          	li	a1,0
    2e10:	000d0513          	mv	a0,s10
    2e14:	01112a23          	sw	a7,20(sp)
    2e18:	7d1020ef          	jal	5de8 <memchr>
    2e1c:	00a12823          	sw	a0,16(sp)
    2e20:	01412883          	lw	a7,20(sp)
    2e24:	00051463          	bnez	a0,2e2c <_vfprintf_r+0x91c>
    2e28:	3550106f          	j	497c <_vfprintf_r+0x246c>
    2e2c:	01012783          	lw	a5,16(sp)
    2e30:	0a714703          	lbu	a4,167(sp)
    2e34:	01812a23          	sw	s8,20(sp)
    2e38:	41a78b33          	sub	s6,a5,s10
    2e3c:	fffb4693          	not	a3,s6
    2e40:	41f6d693          	srai	a3,a3,0x1f
    2e44:	00012823          	sw	zero,16(sp)
    2e48:	02012423          	sw	zero,40(sp)
    2e4c:	02012223          	sw	zero,36(sp)
    2e50:	00012e23          	sw	zero,28(sp)
    2e54:	00db7db3          	and	s11,s6,a3
    2e58:	00000a93          	li	s5,0
    2e5c:	b60712e3          	bnez	a4,29c0 <_vfprintf_r+0x4b0>
    2e60:	8d5ff06f          	j	2734 <_vfprintf_r+0x224>
    2e64:	660d9ee3          	bnez	s11,3ce0 <_vfprintf_r+0x17d0>
    2e68:	00900793          	li	a5,9
    2e6c:	6767eae3          	bltu	a5,s6,3ce0 <_vfprintf_r+0x17d0>
    2e70:	030b0b13          	addi	s6,s6,48
    2e74:	196107a3          	sb	s6,399(sp)
    2e78:	000e8c93          	mv	s9,t4
    2e7c:	00100b13          	li	s6,1
    2e80:	18f10d13          	addi	s10,sp,399
    2e84:	b19ff06f          	j	299c <_vfprintf_r+0x48c>
    2e88:	01412783          	lw	a5,20(sp)
    2e8c:	0007ab83          	lw	s7,0(a5)
    2e90:	00478793          	addi	a5,a5,4
    2e94:	160bdee3          	bgez	s7,3810 <_vfprintf_r+0x1300>
    2e98:	41700bb3          	neg	s7,s7
    2e9c:	00f12a23          	sw	a5,20(sp)
    2ea0:	00094883          	lbu	a7,0(s2)
    2ea4:	004cec93          	ori	s9,s9,4
    2ea8:	80dff06f          	j	26b4 <_vfprintf_r+0x1a4>
    2eac:	02b00793          	li	a5,43
    2eb0:	00094883          	lbu	a7,0(s2)
    2eb4:	0af103a3          	sb	a5,167(sp)
    2eb8:	ffcff06f          	j	26b4 <_vfprintf_r+0x1a4>
    2ebc:	00094883          	lbu	a7,0(s2)
    2ec0:	080cec93          	ori	s9,s9,128
    2ec4:	ff0ff06f          	j	26b4 <_vfprintf_r+0x1a4>
    2ec8:	00094883          	lbu	a7,0(s2)
    2ecc:	02a00793          	li	a5,42
    2ed0:	00190693          	addi	a3,s2,1
    2ed4:	00f89463          	bne	a7,a5,2edc <_vfprintf_r+0x9cc>
    2ed8:	6510106f          	j	4d28 <_vfprintf_r+0x2818>
    2edc:	fd088793          	addi	a5,a7,-48
    2ee0:	00900713          	li	a4,9
    2ee4:	00000a93          	li	s5,0
    2ee8:	00900613          	li	a2,9
    2eec:	02f76463          	bltu	a4,a5,2f14 <_vfprintf_r+0xa04>
    2ef0:	0006c883          	lbu	a7,0(a3)
    2ef4:	002a9713          	slli	a4,s5,0x2
    2ef8:	01570ab3          	add	s5,a4,s5
    2efc:	001a9a93          	slli	s5,s5,0x1
    2f00:	00fa8ab3          	add	s5,s5,a5
    2f04:	fd088793          	addi	a5,a7,-48
    2f08:	00168693          	addi	a3,a3,1
    2f0c:	fef672e3          	bgeu	a2,a5,2ef0 <_vfprintf_r+0x9e0>
    2f10:	1c0ac4e3          	bltz	s5,38d8 <_vfprintf_r+0x13c8>
    2f14:	00068913          	mv	s2,a3
    2f18:	fa0ff06f          	j	26b8 <_vfprintf_r+0x1a8>
    2f1c:	00094883          	lbu	a7,0(s2)
    2f20:	001cec93          	ori	s9,s9,1
    2f24:	f90ff06f          	j	26b4 <_vfprintf_r+0x1a4>
    2f28:	0a714783          	lbu	a5,167(sp)
    2f2c:	00094883          	lbu	a7,0(s2)
    2f30:	f8079263          	bnez	a5,26b4 <_vfprintf_r+0x1a4>
    2f34:	02000793          	li	a5,32
    2f38:	0af103a3          	sb	a5,167(sp)
    2f3c:	f78ff06f          	j	26b4 <_vfprintf_r+0x1a4>
    2f40:	010cee93          	ori	t4,s9,16
    2f44:	020ef793          	andi	a5,t4,32
    2f48:	06078ce3          	beqz	a5,37c0 <_vfprintf_r+0x12b0>
    2f4c:	01412783          	lw	a5,20(sp)
    2f50:	00778c13          	addi	s8,a5,7
    2f54:	ff8c7c13          	andi	s8,s8,-8
    2f58:	008c0793          	addi	a5,s8,8
    2f5c:	00f12a23          	sw	a5,20(sp)
    2f60:	000c2b03          	lw	s6,0(s8)
    2f64:	004c2d83          	lw	s11,4(s8)
    2f68:	00100793          	li	a5,1
    2f6c:	a8dff06f          	j	29f8 <_vfprintf_r+0x4e8>
    2f70:	00094883          	lbu	a7,0(s2)
    2f74:	008cec93          	ori	s9,s9,8
    2f78:	f3cff06f          	j	26b4 <_vfprintf_r+0x1a4>
    2f7c:	01412703          	lw	a4,20(sp)
    2f80:	000087b7          	lui	a5,0x8
    2f84:	83078793          	addi	a5,a5,-2000 # 7830 <__gdtoa+0x898>
    2f88:	0af11423          	sh	a5,168(sp)
    2f8c:	00470793          	addi	a5,a4,4
    2f90:	00f12a23          	sw	a5,20(sp)
    2f94:	4f018793          	addi	a5,gp,1264 # 12e00 <keypad_map+0x140>
    2f98:	02f12a23          	sw	a5,52(sp)
    2f9c:	00072b03          	lw	s6,0(a4)
    2fa0:	00000d93          	li	s11,0
    2fa4:	002cee93          	ori	t4,s9,2
    2fa8:	00200793          	li	a5,2
    2fac:	07800893          	li	a7,120
    2fb0:	a49ff06f          	j	29f8 <_vfprintf_r+0x4e8>
    2fb4:	020cf793          	andi	a5,s9,32
    2fb8:	0c0782e3          	beqz	a5,387c <_vfprintf_r+0x136c>
    2fbc:	01412783          	lw	a5,20(sp)
    2fc0:	00c12683          	lw	a3,12(sp)
    2fc4:	0007a783          	lw	a5,0(a5)
    2fc8:	41f6d713          	srai	a4,a3,0x1f
    2fcc:	00d7a023          	sw	a3,0(a5)
    2fd0:	00e7a223          	sw	a4,4(a5)
    2fd4:	01412783          	lw	a5,20(sp)
    2fd8:	00090d13          	mv	s10,s2
    2fdc:	00478793          	addi	a5,a5,4
    2fe0:	00f12a23          	sw	a5,20(sp)
    2fe4:	869ff06f          	j	284c <_vfprintf_r+0x33c>
    2fe8:	00094883          	lbu	a7,0(s2)
    2fec:	06c00793          	li	a5,108
    2ff0:	16f888e3          	beq	a7,a5,3960 <_vfprintf_r+0x1450>
    2ff4:	010cec93          	ori	s9,s9,16
    2ff8:	ebcff06f          	j	26b4 <_vfprintf_r+0x1a4>
    2ffc:	00094883          	lbu	a7,0(s2)
    3000:	06800793          	li	a5,104
    3004:	14f886e3          	beq	a7,a5,3950 <_vfprintf_r+0x1440>
    3008:	040cec93          	ori	s9,s9,64
    300c:	ea8ff06f          	j	26b4 <_vfprintf_r+0x1a4>
    3010:	06500713          	li	a4,101
    3014:	b9175ae3          	bge	a4,a7,2ba8 <_vfprintf_r+0x698>
    3018:	0d012703          	lw	a4,208(sp)
    301c:	08010593          	addi	a1,sp,128
    3020:	09010513          	addi	a0,sp,144
    3024:	08e12823          	sw	a4,144(sp)
    3028:	0d412703          	lw	a4,212(sp)
    302c:	02c12c23          	sw	a2,56(sp)
    3030:	08012023          	sw	zero,128(sp)
    3034:	08e12a23          	sw	a4,148(sp)
    3038:	0d812703          	lw	a4,216(sp)
    303c:	08012223          	sw	zero,132(sp)
    3040:	08012423          	sw	zero,136(sp)
    3044:	08e12c23          	sw	a4,152(sp)
    3048:	0dc12703          	lw	a4,220(sp)
    304c:	08012623          	sw	zero,140(sp)
    3050:	08e12e23          	sw	a4,156(sp)
    3054:	0780c0ef          	jal	f0cc <__eqtf2>
    3058:	03812603          	lw	a2,56(sp)
    305c:	54051c63          	bnez	a0,35b4 <_vfprintf_r+0x10a4>
    3060:	0c812783          	lw	a5,200(sp)
    3064:	52018713          	addi	a4,gp,1312 # 12e30 <keypad_map+0x170>
    3068:	00e42023          	sw	a4,0(s0)
    306c:	00160613          	addi	a2,a2,1
    3070:	00100713          	li	a4,1
    3074:	00178793          	addi	a5,a5,1
    3078:	00e42223          	sw	a4,4(s0)
    307c:	0cc12623          	sw	a2,204(sp)
    3080:	0cf12423          	sw	a5,200(sp)
    3084:	00700713          	li	a4,7
    3088:	00840413          	addi	s0,s0,8
    308c:	5ef744e3          	blt	a4,a5,3e74 <_vfprintf_r+0x1964>
    3090:	0ac12783          	lw	a5,172(sp)
    3094:	02012703          	lw	a4,32(sp)
    3098:	76e7d463          	bge	a5,a4,3800 <_vfprintf_r+0x12f0>
    309c:	03012783          	lw	a5,48(sp)
    30a0:	02c12703          	lw	a4,44(sp)
    30a4:	00840413          	addi	s0,s0,8
    30a8:	fef42c23          	sw	a5,-8(s0)
    30ac:	0c812783          	lw	a5,200(sp)
    30b0:	00e60633          	add	a2,a2,a4
    30b4:	fee42e23          	sw	a4,-4(s0)
    30b8:	00178793          	addi	a5,a5,1
    30bc:	0cc12623          	sw	a2,204(sp)
    30c0:	0cf12423          	sw	a5,200(sp)
    30c4:	00700713          	li	a4,7
    30c8:	0af744e3          	blt	a4,a5,3970 <_vfprintf_r+0x1460>
    30cc:	02012783          	lw	a5,32(sp)
    30d0:	fff78a93          	addi	s5,a5,-1
    30d4:	f3505663          	blez	s5,2800 <_vfprintf_r+0x2f0>
    30d8:	00013837          	lui	a6,0x13
    30dc:	1a880813          	addi	a6,a6,424 # 131a8 <zeroes.0>
    30e0:	01000713          	li	a4,16
    30e4:	0c812783          	lw	a5,200(sp)
    30e8:	01000b13          	li	s6,16
    30ec:	00700c13          	li	s8,7
    30f0:	00080d13          	mv	s10,a6
    30f4:	01574863          	blt	a4,s5,3104 <_vfprintf_r+0xbf4>
    30f8:	5a10006f          	j	3e98 <_vfprintf_r+0x1988>
    30fc:	ff0a8a93          	addi	s5,s5,-16
    3100:	595b5ae3          	bge	s6,s5,3e94 <_vfprintf_r+0x1984>
    3104:	01060613          	addi	a2,a2,16
    3108:	00178793          	addi	a5,a5,1
    310c:	01a42023          	sw	s10,0(s0)
    3110:	01642223          	sw	s6,4(s0)
    3114:	0cc12623          	sw	a2,204(sp)
    3118:	0cf12423          	sw	a5,200(sp)
    311c:	00840413          	addi	s0,s0,8
    3120:	fcfc5ee3          	bge	s8,a5,30fc <_vfprintf_r+0xbec>
    3124:	00812503          	lw	a0,8(sp)
    3128:	0c410613          	addi	a2,sp,196
    312c:	00048593          	mv	a1,s1
    3130:	52d010ef          	jal	4e5c <__sprint_r>
    3134:	26051463          	bnez	a0,339c <_vfprintf_r+0xe8c>
    3138:	0cc12603          	lw	a2,204(sp)
    313c:	0c812783          	lw	a5,200(sp)
    3140:	00098413          	mv	s0,s3
    3144:	fb9ff06f          	j	30fc <_vfprintf_r+0xbec>
    3148:	00100713          	li	a4,1
    314c:	00e79463          	bne	a5,a4,3154 <_vfprintf_r+0xc44>
    3150:	1890106f          	j	4ad8 <_vfprintf_r+0x25c8>
    3154:	00200713          	li	a4,2
    3158:	000c8e93          	mv	t4,s9
    315c:	bce79ee3          	bne	a5,a4,2d38 <_vfprintf_r+0x828>
    3160:	03412683          	lw	a3,52(sp)
    3164:	19010d13          	addi	s10,sp,400
    3168:	00fb7793          	andi	a5,s6,15
    316c:	00f687b3          	add	a5,a3,a5
    3170:	0007c703          	lbu	a4,0(a5)
    3174:	004b5b13          	srli	s6,s6,0x4
    3178:	01cd9793          	slli	a5,s11,0x1c
    317c:	0167eb33          	or	s6,a5,s6
    3180:	004ddd93          	srli	s11,s11,0x4
    3184:	feed0fa3          	sb	a4,-1(s10)
    3188:	01bb67b3          	or	a5,s6,s11
    318c:	fffd0d13          	addi	s10,s10,-1
    3190:	fc079ce3          	bnez	a5,3168 <_vfprintf_r+0xc58>
    3194:	19010793          	addi	a5,sp,400
    3198:	41a78b33          	sub	s6,a5,s10
    319c:	000e8c93          	mv	s9,t4
    31a0:	ffcff06f          	j	299c <_vfprintf_r+0x48c>
    31a4:	41bb8c33          	sub	s8,s7,s11
    31a8:	e3805063          	blez	s8,27c8 <_vfprintf_r+0x2b8>
    31ac:	00013837          	lui	a6,0x13
    31b0:	01000513          	li	a0,16
    31b4:	0c812583          	lw	a1,200(sp)
    31b8:	1a880813          	addi	a6,a6,424 # 131a8 <zeroes.0>
    31bc:	0b855063          	bge	a0,s8,325c <_vfprintf_r+0xd4c>
    31c0:	03212c23          	sw	s2,56(sp)
    31c4:	00040793          	mv	a5,s0
    31c8:	01000e93          	li	t4,16
    31cc:	000c0413          	mv	s0,s8
    31d0:	00700f93          	li	t6,7
    31d4:	000b0c13          	mv	s8,s6
    31d8:	00080913          	mv	s2,a6
    31dc:	000a8b13          	mv	s6,s5
    31e0:	00088a93          	mv	s5,a7
    31e4:	00c0006f          	j	31f0 <_vfprintf_r+0xce0>
    31e8:	ff040413          	addi	s0,s0,-16
    31ec:	048eda63          	bge	t4,s0,3240 <_vfprintf_r+0xd30>
    31f0:	01060613          	addi	a2,a2,16
    31f4:	00158593          	addi	a1,a1,1 # 2001 <i2c_start_simple+0xd1>
    31f8:	0127a023          	sw	s2,0(a5)
    31fc:	01d7a223          	sw	t4,4(a5)
    3200:	0cc12623          	sw	a2,204(sp)
    3204:	0cb12423          	sw	a1,200(sp)
    3208:	00878793          	addi	a5,a5,8
    320c:	fcbfdee3          	bge	t6,a1,31e8 <_vfprintf_r+0xcd8>
    3210:	00812503          	lw	a0,8(sp)
    3214:	0c410613          	addi	a2,sp,196
    3218:	00048593          	mv	a1,s1
    321c:	441010ef          	jal	4e5c <__sprint_r>
    3220:	16051e63          	bnez	a0,339c <_vfprintf_r+0xe8c>
    3224:	01000e93          	li	t4,16
    3228:	ff040413          	addi	s0,s0,-16
    322c:	0cc12603          	lw	a2,204(sp)
    3230:	0c812583          	lw	a1,200(sp)
    3234:	00098793          	mv	a5,s3
    3238:	00700f93          	li	t6,7
    323c:	fa8ecae3          	blt	t4,s0,31f0 <_vfprintf_r+0xce0>
    3240:	00090813          	mv	a6,s2
    3244:	03812903          	lw	s2,56(sp)
    3248:	000a8893          	mv	a7,s5
    324c:	000b0a93          	mv	s5,s6
    3250:	000c0b13          	mv	s6,s8
    3254:	00040c13          	mv	s8,s0
    3258:	00078413          	mv	s0,a5
    325c:	01860633          	add	a2,a2,s8
    3260:	00158593          	addi	a1,a1,1
    3264:	01042023          	sw	a6,0(s0)
    3268:	01842223          	sw	s8,4(s0)
    326c:	0cc12623          	sw	a2,204(sp)
    3270:	0cb12423          	sw	a1,200(sp)
    3274:	00700713          	li	a4,7
    3278:	00840413          	addi	s0,s0,8
    327c:	d4b75663          	bge	a4,a1,27c8 <_vfprintf_r+0x2b8>
    3280:	00812503          	lw	a0,8(sp)
    3284:	0c410613          	addi	a2,sp,196
    3288:	00048593          	mv	a1,s1
    328c:	03112c23          	sw	a7,56(sp)
    3290:	3cd010ef          	jal	4e5c <__sprint_r>
    3294:	10051463          	bnez	a0,339c <_vfprintf_r+0xe8c>
    3298:	0cc12603          	lw	a2,204(sp)
    329c:	03812883          	lw	a7,56(sp)
    32a0:	00098413          	mv	s0,s3
    32a4:	d24ff06f          	j	27c8 <_vfprintf_r+0x2b8>
    32a8:	00013837          	lui	a6,0x13
    32ac:	01000713          	li	a4,16
    32b0:	0c812583          	lw	a1,200(sp)
    32b4:	1a880813          	addi	a6,a6,424 # 131a8 <zeroes.0>
    32b8:	09575263          	bge	a4,s5,333c <_vfprintf_r+0xe2c>
    32bc:	00040793          	mv	a5,s0
    32c0:	01000713          	li	a4,16
    32c4:	000a8413          	mv	s0,s5
    32c8:	00700c13          	li	s8,7
    32cc:	03112c23          	sw	a7,56(sp)
    32d0:	000a0a93          	mv	s5,s4
    32d4:	00c0006f          	j	32e0 <_vfprintf_r+0xdd0>
    32d8:	ff040413          	addi	s0,s0,-16
    32dc:	04875863          	bge	a4,s0,332c <_vfprintf_r+0xe1c>
    32e0:	01060613          	addi	a2,a2,16
    32e4:	00158593          	addi	a1,a1,1
    32e8:	0147a023          	sw	s4,0(a5)
    32ec:	00e7a223          	sw	a4,4(a5)
    32f0:	0cc12623          	sw	a2,204(sp)
    32f4:	0cb12423          	sw	a1,200(sp)
    32f8:	00878793          	addi	a5,a5,8
    32fc:	fcbc5ee3          	bge	s8,a1,32d8 <_vfprintf_r+0xdc8>
    3300:	00812503          	lw	a0,8(sp)
    3304:	0c410613          	addi	a2,sp,196
    3308:	00048593          	mv	a1,s1
    330c:	351010ef          	jal	4e5c <__sprint_r>
    3310:	08051663          	bnez	a0,339c <_vfprintf_r+0xe8c>
    3314:	01000713          	li	a4,16
    3318:	ff040413          	addi	s0,s0,-16
    331c:	0cc12603          	lw	a2,204(sp)
    3320:	0c812583          	lw	a1,200(sp)
    3324:	00098793          	mv	a5,s3
    3328:	fa874ce3          	blt	a4,s0,32e0 <_vfprintf_r+0xdd0>
    332c:	03812883          	lw	a7,56(sp)
    3330:	000a8813          	mv	a6,s5
    3334:	00040a93          	mv	s5,s0
    3338:	00078413          	mv	s0,a5
    333c:	01560633          	add	a2,a2,s5
    3340:	00158593          	addi	a1,a1,1
    3344:	01042023          	sw	a6,0(s0)
    3348:	01542223          	sw	s5,4(s0)
    334c:	0cc12623          	sw	a2,204(sp)
    3350:	0cb12423          	sw	a1,200(sp)
    3354:	00700713          	li	a4,7
    3358:	00840413          	addi	s0,s0,8
    335c:	c6b75a63          	bge	a4,a1,27d0 <_vfprintf_r+0x2c0>
    3360:	00812503          	lw	a0,8(sp)
    3364:	0c410613          	addi	a2,sp,196
    3368:	00048593          	mv	a1,s1
    336c:	03112c23          	sw	a7,56(sp)
    3370:	2ed010ef          	jal	4e5c <__sprint_r>
    3374:	02051463          	bnez	a0,339c <_vfprintf_r+0xe8c>
    3378:	0cc12603          	lw	a2,204(sp)
    337c:	03812883          	lw	a7,56(sp)
    3380:	00098413          	mv	s0,s3
    3384:	c4cff06f          	j	27d0 <_vfprintf_r+0x2c0>
    3388:	00812503          	lw	a0,8(sp)
    338c:	0c410613          	addi	a2,sp,196
    3390:	00048593          	mv	a1,s1
    3394:	2c9010ef          	jal	4e5c <__sprint_r>
    3398:	c8050a63          	beqz	a0,282c <_vfprintf_r+0x31c>
    339c:	01012583          	lw	a1,16(sp)
    33a0:	cc058063          	beqz	a1,2860 <_vfprintf_r+0x350>
    33a4:	00812503          	lw	a0,8(sp)
    33a8:	53c030ef          	jal	68e4 <_free_r>
    33ac:	cb4ff06f          	j	2860 <_vfprintf_r+0x350>
    33b0:	000c8e93          	mv	t4,s9
    33b4:	975ff06f          	j	2d28 <_vfprintf_r+0x818>
    33b8:	00013837          	lui	a6,0x13
    33bc:	01000513          	li	a0,16
    33c0:	0c812583          	lw	a1,200(sp)
    33c4:	1b880c13          	addi	s8,a6,440 # 131b8 <blanks.1>
    33c8:	0ae55863          	bge	a0,a4,3478 <_vfprintf_r+0xf68>
    33cc:	05212823          	sw	s2,80(sp)
    33d0:	00040793          	mv	a5,s0
    33d4:	000c0913          	mv	s2,s8
    33d8:	01000e93          	li	t4,16
    33dc:	000b0c13          	mv	s8,s6
    33e0:	00700393          	li	t2,7
    33e4:	000a8b13          	mv	s6,s5
    33e8:	02512c23          	sw	t0,56(sp)
    33ec:	05f12623          	sw	t6,76(sp)
    33f0:	00070413          	mv	s0,a4
    33f4:	00088a93          	mv	s5,a7
    33f8:	00c0006f          	j	3404 <_vfprintf_r+0xef4>
    33fc:	ff040413          	addi	s0,s0,-16
    3400:	048eda63          	bge	t4,s0,3454 <_vfprintf_r+0xf44>
    3404:	01060613          	addi	a2,a2,16
    3408:	00158593          	addi	a1,a1,1
    340c:	0127a023          	sw	s2,0(a5)
    3410:	01d7a223          	sw	t4,4(a5)
    3414:	0cc12623          	sw	a2,204(sp)
    3418:	0cb12423          	sw	a1,200(sp)
    341c:	00878793          	addi	a5,a5,8
    3420:	fcb3dee3          	bge	t2,a1,33fc <_vfprintf_r+0xeec>
    3424:	00812503          	lw	a0,8(sp)
    3428:	0c410613          	addi	a2,sp,196
    342c:	00048593          	mv	a1,s1
    3430:	22d010ef          	jal	4e5c <__sprint_r>
    3434:	f60514e3          	bnez	a0,339c <_vfprintf_r+0xe8c>
    3438:	01000e93          	li	t4,16
    343c:	ff040413          	addi	s0,s0,-16
    3440:	0cc12603          	lw	a2,204(sp)
    3444:	0c812583          	lw	a1,200(sp)
    3448:	00098793          	mv	a5,s3
    344c:	00700393          	li	t2,7
    3450:	fa8ecae3          	blt	t4,s0,3404 <_vfprintf_r+0xef4>
    3454:	000a8893          	mv	a7,s5
    3458:	03812283          	lw	t0,56(sp)
    345c:	000b0a93          	mv	s5,s6
    3460:	04c12f83          	lw	t6,76(sp)
    3464:	000c0b13          	mv	s6,s8
    3468:	00090c13          	mv	s8,s2
    346c:	05012903          	lw	s2,80(sp)
    3470:	00040713          	mv	a4,s0
    3474:	00078413          	mv	s0,a5
    3478:	00e60633          	add	a2,a2,a4
    347c:	00158593          	addi	a1,a1,1
    3480:	00e42223          	sw	a4,4(s0)
    3484:	01842023          	sw	s8,0(s0)
    3488:	0cc12623          	sw	a2,204(sp)
    348c:	0cb12423          	sw	a1,200(sp)
    3490:	00700713          	li	a4,7
    3494:	00840413          	addi	s0,s0,8
    3498:	aab75e63          	bge	a4,a1,2754 <_vfprintf_r+0x244>
    349c:	00812503          	lw	a0,8(sp)
    34a0:	0c410613          	addi	a2,sp,196
    34a4:	00048593          	mv	a1,s1
    34a8:	05112823          	sw	a7,80(sp)
    34ac:	05f12623          	sw	t6,76(sp)
    34b0:	02512c23          	sw	t0,56(sp)
    34b4:	1a9010ef          	jal	4e5c <__sprint_r>
    34b8:	ee0512e3          	bnez	a0,339c <_vfprintf_r+0xe8c>
    34bc:	0cc12603          	lw	a2,204(sp)
    34c0:	05012883          	lw	a7,80(sp)
    34c4:	04c12f83          	lw	t6,76(sp)
    34c8:	03812283          	lw	t0,56(sp)
    34cc:	00098413          	mv	s0,s3
    34d0:	a84ff06f          	j	2754 <_vfprintf_r+0x244>
    34d4:	00812503          	lw	a0,8(sp)
    34d8:	0c410613          	addi	a2,sp,196
    34dc:	00048593          	mv	a1,s1
    34e0:	05112623          	sw	a7,76(sp)
    34e4:	03f12c23          	sw	t6,56(sp)
    34e8:	175010ef          	jal	4e5c <__sprint_r>
    34ec:	ea0518e3          	bnez	a0,339c <_vfprintf_r+0xe8c>
    34f0:	0cc12603          	lw	a2,204(sp)
    34f4:	04c12883          	lw	a7,76(sp)
    34f8:	03812f83          	lw	t6,56(sp)
    34fc:	00098413          	mv	s0,s3
    3500:	ac0ff06f          	j	27c0 <_vfprintf_r+0x2b0>
    3504:	00013837          	lui	a6,0x13
    3508:	01000713          	li	a4,16
    350c:	0c812783          	lw	a5,200(sp)
    3510:	1b880c13          	addi	s8,a6,440 # 131b8 <blanks.1>
    3514:	07575263          	bge	a4,s5,3578 <_vfprintf_r+0x1068>
    3518:	00812d03          	lw	s10,8(sp)
    351c:	01000b13          	li	s6,16
    3520:	00700c93          	li	s9,7
    3524:	00c0006f          	j	3530 <_vfprintf_r+0x1020>
    3528:	ff0a8a93          	addi	s5,s5,-16
    352c:	055b5663          	bge	s6,s5,3578 <_vfprintf_r+0x1068>
    3530:	01060613          	addi	a2,a2,16
    3534:	00178793          	addi	a5,a5,1
    3538:	01842023          	sw	s8,0(s0)
    353c:	01642223          	sw	s6,4(s0)
    3540:	0cc12623          	sw	a2,204(sp)
    3544:	0cf12423          	sw	a5,200(sp)
    3548:	00840413          	addi	s0,s0,8
    354c:	fcfcdee3          	bge	s9,a5,3528 <_vfprintf_r+0x1018>
    3550:	0c410613          	addi	a2,sp,196
    3554:	00048593          	mv	a1,s1
    3558:	000d0513          	mv	a0,s10
    355c:	101010ef          	jal	4e5c <__sprint_r>
    3560:	e2051ee3          	bnez	a0,339c <_vfprintf_r+0xe8c>
    3564:	ff0a8a93          	addi	s5,s5,-16
    3568:	0cc12603          	lw	a2,204(sp)
    356c:	0c812783          	lw	a5,200(sp)
    3570:	00098413          	mv	s0,s3
    3574:	fb5b4ee3          	blt	s6,s5,3530 <_vfprintf_r+0x1020>
    3578:	01560633          	add	a2,a2,s5
    357c:	00178793          	addi	a5,a5,1
    3580:	01842023          	sw	s8,0(s0)
    3584:	01542223          	sw	s5,4(s0)
    3588:	0cc12623          	sw	a2,204(sp)
    358c:	0cf12423          	sw	a5,200(sp)
    3590:	00700713          	li	a4,7
    3594:	a6f75e63          	bge	a4,a5,2810 <_vfprintf_r+0x300>
    3598:	00812503          	lw	a0,8(sp)
    359c:	0c410613          	addi	a2,sp,196
    35a0:	00048593          	mv	a1,s1
    35a4:	0b9010ef          	jal	4e5c <__sprint_r>
    35a8:	de051ae3          	bnez	a0,339c <_vfprintf_r+0xe8c>
    35ac:	0cc12603          	lw	a2,204(sp)
    35b0:	a60ff06f          	j	2810 <_vfprintf_r+0x300>
    35b4:	0ac12503          	lw	a0,172(sp)
    35b8:	02a05ae3          	blez	a0,3dec <_vfprintf_r+0x18dc>
    35bc:	01c12783          	lw	a5,28(sp)
    35c0:	02012703          	lw	a4,32(sp)
    35c4:	00078a93          	mv	s5,a5
    35c8:	30f74263          	blt	a4,a5,38cc <_vfprintf_r+0x13bc>
    35cc:	03505663          	blez	s5,35f8 <_vfprintf_r+0x10e8>
    35d0:	0c812703          	lw	a4,200(sp)
    35d4:	01560633          	add	a2,a2,s5
    35d8:	01a42023          	sw	s10,0(s0)
    35dc:	00170713          	addi	a4,a4,1
    35e0:	01542223          	sw	s5,4(s0)
    35e4:	0cc12623          	sw	a2,204(sp)
    35e8:	0ce12423          	sw	a4,200(sp)
    35ec:	00700593          	li	a1,7
    35f0:	00840413          	addi	s0,s0,8
    35f4:	58e5c0e3          	blt	a1,a4,4374 <_vfprintf_r+0x1e64>
    35f8:	fffac713          	not	a4,s5
    35fc:	01c12783          	lw	a5,28(sp)
    3600:	41f75713          	srai	a4,a4,0x1f
    3604:	00eafab3          	and	s5,s5,a4
    3608:	41578ab3          	sub	s5,a5,s5
    360c:	3b504063          	bgtz	s5,39ac <_vfprintf_r+0x149c>
    3610:	01c12783          	lw	a5,28(sp)
    3614:	400cf713          	andi	a4,s9,1024
    3618:	00fd0c33          	add	s8,s10,a5
    361c:	30071ae3          	bnez	a4,4130 <_vfprintf_r+0x1c20>
    3620:	0ac12a83          	lw	s5,172(sp)
    3624:	02012783          	lw	a5,32(sp)
    3628:	3efacc63          	blt	s5,a5,3a20 <_vfprintf_r+0x1510>
    362c:	001cf713          	andi	a4,s9,1
    3630:	3e071863          	bnez	a4,3a20 <_vfprintf_r+0x1510>
    3634:	02012703          	lw	a4,32(sp)
    3638:	00ed07b3          	add	a5,s10,a4
    363c:	41570ab3          	sub	s5,a4,s5
    3640:	41878b33          	sub	s6,a5,s8
    3644:	016ad463          	bge	s5,s6,364c <_vfprintf_r+0x113c>
    3648:	000a8b13          	mv	s6,s5
    364c:	03605863          	blez	s6,367c <_vfprintf_r+0x116c>
    3650:	0c812783          	lw	a5,200(sp)
    3654:	01660633          	add	a2,a2,s6
    3658:	01842023          	sw	s8,0(s0)
    365c:	00178793          	addi	a5,a5,1
    3660:	01642223          	sw	s6,4(s0)
    3664:	0cc12623          	sw	a2,204(sp)
    3668:	0cf12423          	sw	a5,200(sp)
    366c:	00700713          	li	a4,7
    3670:	00840413          	addi	s0,s0,8
    3674:	00f75463          	bge	a4,a5,367c <_vfprintf_r+0x116c>
    3678:	3300106f          	j	49a8 <_vfprintf_r+0x2498>
    367c:	fffb4793          	not	a5,s6
    3680:	41f7d793          	srai	a5,a5,0x1f
    3684:	00fb7b33          	and	s6,s6,a5
    3688:	416a8ab3          	sub	s5,s5,s6
    368c:	97505a63          	blez	s5,2800 <_vfprintf_r+0x2f0>
    3690:	00013837          	lui	a6,0x13
    3694:	1a880813          	addi	a6,a6,424 # 131a8 <zeroes.0>
    3698:	01000713          	li	a4,16
    369c:	0c812783          	lw	a5,200(sp)
    36a0:	01000b13          	li	s6,16
    36a4:	00700c13          	li	s8,7
    36a8:	00080d13          	mv	s10,a6
    36ac:	01574863          	blt	a4,s5,36bc <_vfprintf_r+0x11ac>
    36b0:	7e80006f          	j	3e98 <_vfprintf_r+0x1988>
    36b4:	ff0a8a93          	addi	s5,s5,-16
    36b8:	7d5b5e63          	bge	s6,s5,3e94 <_vfprintf_r+0x1984>
    36bc:	01060613          	addi	a2,a2,16
    36c0:	00178793          	addi	a5,a5,1
    36c4:	01a42023          	sw	s10,0(s0)
    36c8:	01642223          	sw	s6,4(s0)
    36cc:	0cc12623          	sw	a2,204(sp)
    36d0:	0cf12423          	sw	a5,200(sp)
    36d4:	00840413          	addi	s0,s0,8
    36d8:	fcfc5ee3          	bge	s8,a5,36b4 <_vfprintf_r+0x11a4>
    36dc:	00812503          	lw	a0,8(sp)
    36e0:	0c410613          	addi	a2,sp,196
    36e4:	00048593          	mv	a1,s1
    36e8:	774010ef          	jal	4e5c <__sprint_r>
    36ec:	ca0518e3          	bnez	a0,339c <_vfprintf_r+0xe8c>
    36f0:	0cc12603          	lw	a2,204(sp)
    36f4:	0c812783          	lw	a5,200(sp)
    36f8:	00098413          	mv	s0,s3
    36fc:	fb9ff06f          	j	36b4 <_vfprintf_r+0x11a4>
    3700:	001cf593          	andi	a1,s9,1
    3704:	cc059263          	bnez	a1,2bc8 <_vfprintf_r+0x6b8>
    3708:	00e42223          	sw	a4,4(s0)
    370c:	0d812623          	sw	s8,204(sp)
    3710:	0d512423          	sw	s5,200(sp)
    3714:	00700793          	li	a5,7
    3718:	d757d663          	bge	a5,s5,2c84 <_vfprintf_r+0x774>
    371c:	00812503          	lw	a0,8(sp)
    3720:	0c410613          	addi	a2,sp,196
    3724:	00048593          	mv	a1,s1
    3728:	734010ef          	jal	4e5c <__sprint_r>
    372c:	c60518e3          	bnez	a0,339c <_vfprintf_r+0xe8c>
    3730:	0cc12c03          	lw	s8,204(sp)
    3734:	0c812a83          	lw	s5,200(sp)
    3738:	00098b13          	mv	s6,s3
    373c:	d48ff06f          	j	2c84 <_vfprintf_r+0x774>
    3740:	02012703          	lw	a4,32(sp)
    3744:	00100793          	li	a5,1
    3748:	d2e7de63          	bge	a5,a4,2c84 <_vfprintf_r+0x774>
    374c:	00013837          	lui	a6,0x13
    3750:	01100793          	li	a5,17
    3754:	1a880813          	addi	a6,a6,424 # 131a8 <zeroes.0>
    3758:	0ae7d6e3          	bge	a5,a4,4004 <_vfprintf_r+0x1af4>
    375c:	01212e23          	sw	s2,28(sp)
    3760:	01000793          	li	a5,16
    3764:	00700d13          	li	s10,7
    3768:	00080913          	mv	s2,a6
    376c:	00c0006f          	j	3778 <_vfprintf_r+0x1268>
    3770:	ff040413          	addi	s0,s0,-16
    3774:	0887d4e3          	bge	a5,s0,3ffc <_vfprintf_r+0x1aec>
    3778:	010c0c13          	addi	s8,s8,16
    377c:	001a8a93          	addi	s5,s5,1
    3780:	012b2023          	sw	s2,0(s6)
    3784:	00fb2223          	sw	a5,4(s6)
    3788:	0d812623          	sw	s8,204(sp)
    378c:	0d512423          	sw	s5,200(sp)
    3790:	008b0b13          	addi	s6,s6,8
    3794:	fd5d5ee3          	bge	s10,s5,3770 <_vfprintf_r+0x1260>
    3798:	00812503          	lw	a0,8(sp)
    379c:	0c410613          	addi	a2,sp,196
    37a0:	00048593          	mv	a1,s1
    37a4:	6b8010ef          	jal	4e5c <__sprint_r>
    37a8:	be051ae3          	bnez	a0,339c <_vfprintf_r+0xe8c>
    37ac:	0cc12c03          	lw	s8,204(sp)
    37b0:	0c812a83          	lw	s5,200(sp)
    37b4:	00098b13          	mv	s6,s3
    37b8:	01000793          	li	a5,16
    37bc:	fb5ff06f          	j	3770 <_vfprintf_r+0x1260>
    37c0:	01412703          	lw	a4,20(sp)
    37c4:	010ef793          	andi	a5,t4,16
    37c8:	00072b03          	lw	s6,0(a4)
    37cc:	00470713          	addi	a4,a4,4
    37d0:	00e12a23          	sw	a4,20(sp)
    37d4:	04079a63          	bnez	a5,3828 <_vfprintf_r+0x1318>
    37d8:	040ef793          	andi	a5,t4,64
    37dc:	04078063          	beqz	a5,381c <_vfprintf_r+0x130c>
    37e0:	010b1b13          	slli	s6,s6,0x10
    37e4:	010b5b13          	srli	s6,s6,0x10
    37e8:	00000d93          	li	s11,0
    37ec:	00100793          	li	a5,1
    37f0:	a08ff06f          	j	29f8 <_vfprintf_r+0x4e8>
    37f4:	00000b13          	li	s6,0
    37f8:	19010d13          	addi	s10,sp,400
    37fc:	9a0ff06f          	j	299c <_vfprintf_r+0x48c>
    3800:	001cf793          	andi	a5,s9,1
    3804:	00079463          	bnez	a5,380c <_vfprintf_r+0x12fc>
    3808:	ff9fe06f          	j	2800 <_vfprintf_r+0x2f0>
    380c:	891ff06f          	j	309c <_vfprintf_r+0xb8c>
    3810:	00094883          	lbu	a7,0(s2)
    3814:	00f12a23          	sw	a5,20(sp)
    3818:	e9dfe06f          	j	26b4 <_vfprintf_r+0x1a4>
    381c:	200ef793          	andi	a5,t4,512
    3820:	00078463          	beqz	a5,3828 <_vfprintf_r+0x1318>
    3824:	0ffb7b13          	zext.b	s6,s6
    3828:	00000d93          	li	s11,0
    382c:	00100793          	li	a5,1
    3830:	9c8ff06f          	j	29f8 <_vfprintf_r+0x4e8>
    3834:	200cf793          	andi	a5,s9,512
    3838:	380798e3          	bnez	a5,43c8 <_vfprintf_r+0x1eb8>
    383c:	00000d93          	li	s11,0
    3840:	9b0ff06f          	j	29f0 <_vfprintf_r+0x4e0>
    3844:	200cf793          	andi	a5,s9,512
    3848:	360796e3          	bnez	a5,43b4 <_vfprintf_r+0x1ea4>
    384c:	41fb5d93          	srai	s11,s6,0x1f
    3850:	000d8793          	mv	a5,s11
    3854:	920ff06f          	j	2974 <_vfprintf_r+0x464>
    3858:	03c12783          	lw	a5,60(sp)
    385c:	00094883          	lbu	a7,0(s2)
    3860:	00079463          	bnez	a5,3868 <_vfprintf_r+0x1358>
    3864:	e51fe06f          	j	26b4 <_vfprintf_r+0x1a4>
    3868:	0007c783          	lbu	a5,0(a5)
    386c:	00079463          	bnez	a5,3874 <_vfprintf_r+0x1364>
    3870:	e45fe06f          	j	26b4 <_vfprintf_r+0x1a4>
    3874:	400cec93          	ori	s9,s9,1024
    3878:	e3dfe06f          	j	26b4 <_vfprintf_r+0x1a4>
    387c:	010cf793          	andi	a5,s9,16
    3880:	6c079063          	bnez	a5,3f40 <_vfprintf_r+0x1a30>
    3884:	040cf793          	andi	a5,s9,64
    3888:	30079ce3          	bnez	a5,43a0 <_vfprintf_r+0x1e90>
    388c:	200cfe13          	andi	t3,s9,512
    3890:	6a0e0863          	beqz	t3,3f40 <_vfprintf_r+0x1a30>
    3894:	01412783          	lw	a5,20(sp)
    3898:	00c12703          	lw	a4,12(sp)
    389c:	0007a783          	lw	a5,0(a5)
    38a0:	00e78023          	sb	a4,0(a5)
    38a4:	f30ff06f          	j	2fd4 <_vfprintf_r+0xac4>
    38a8:	01412783          	lw	a5,20(sp)
    38ac:	0007a703          	lw	a4,0(a5)
    38b0:	00478793          	addi	a5,a5,4
    38b4:	00f12a23          	sw	a5,20(sp)
    38b8:	00072583          	lw	a1,0(a4)
    38bc:	00472603          	lw	a2,4(a4)
    38c0:	00872683          	lw	a3,8(a4)
    38c4:	00c72703          	lw	a4,12(a4)
    38c8:	9dcff06f          	j	2aa4 <_vfprintf_r+0x594>
    38cc:	00070a93          	mv	s5,a4
    38d0:	d15040e3          	bgtz	s5,35d0 <_vfprintf_r+0x10c0>
    38d4:	d25ff06f          	j	35f8 <_vfprintf_r+0x10e8>
    38d8:	fff00a93          	li	s5,-1
    38dc:	00068913          	mv	s2,a3
    38e0:	dd9fe06f          	j	26b8 <_vfprintf_r+0x1a8>
    38e4:	50418793          	addi	a5,gp,1284 # 12e14 <keypad_map+0x154>
    38e8:	02f12a23          	sw	a5,52(sp)
    38ec:	020cf793          	andi	a5,s9,32
    38f0:	36078463          	beqz	a5,3c58 <_vfprintf_r+0x1748>
    38f4:	01412783          	lw	a5,20(sp)
    38f8:	00778c13          	addi	s8,a5,7
    38fc:	ff8c7c13          	andi	s8,s8,-8
    3900:	000c2b03          	lw	s6,0(s8)
    3904:	004c2d83          	lw	s11,4(s8)
    3908:	008c0793          	addi	a5,s8,8
    390c:	00f12a23          	sw	a5,20(sp)
    3910:	001cf793          	andi	a5,s9,1
    3914:	00078e63          	beqz	a5,3930 <_vfprintf_r+0x1420>
    3918:	01bb67b3          	or	a5,s6,s11
    391c:	00078a63          	beqz	a5,3930 <_vfprintf_r+0x1420>
    3920:	03000793          	li	a5,48
    3924:	0af10423          	sb	a5,168(sp)
    3928:	0b1104a3          	sb	a7,169(sp)
    392c:	002cec93          	ori	s9,s9,2
    3930:	bffcfe93          	andi	t4,s9,-1025
    3934:	00200793          	li	a5,2
    3938:	8c0ff06f          	j	29f8 <_vfprintf_r+0x4e8>
    393c:	000c8e93          	mv	t4,s9
    3940:	e04ff06f          	j	2f44 <_vfprintf_r+0xa34>
    3944:	4f018793          	addi	a5,gp,1264 # 12e00 <keypad_map+0x140>
    3948:	02f12a23          	sw	a5,52(sp)
    394c:	fa1ff06f          	j	38ec <_vfprintf_r+0x13dc>
    3950:	00194883          	lbu	a7,1(s2)
    3954:	200cec93          	ori	s9,s9,512
    3958:	00190913          	addi	s2,s2,1
    395c:	d59fe06f          	j	26b4 <_vfprintf_r+0x1a4>
    3960:	00194883          	lbu	a7,1(s2)
    3964:	020cec93          	ori	s9,s9,32
    3968:	00190913          	addi	s2,s2,1
    396c:	d49fe06f          	j	26b4 <_vfprintf_r+0x1a4>
    3970:	00812503          	lw	a0,8(sp)
    3974:	0c410613          	addi	a2,sp,196
    3978:	00048593          	mv	a1,s1
    397c:	4e0010ef          	jal	4e5c <__sprint_r>
    3980:	a0051ee3          	bnez	a0,339c <_vfprintf_r+0xe8c>
    3984:	0cc12603          	lw	a2,204(sp)
    3988:	00098413          	mv	s0,s3
    398c:	f40ff06f          	j	30cc <_vfprintf_r+0xbbc>
    3990:	00600793          	li	a5,6
    3994:	000a8b13          	mv	s6,s5
    3998:	2157e0e3          	bltu	a5,s5,4398 <_vfprintf_r+0x1e88>
    399c:	000b0d93          	mv	s11,s6
    39a0:	01812a23          	sw	s8,20(sp)
    39a4:	51818d13          	addi	s10,gp,1304 # 12e28 <keypad_map+0x168>
    39a8:	d79fe06f          	j	2720 <_vfprintf_r+0x210>
    39ac:	00013837          	lui	a6,0x13
    39b0:	01000593          	li	a1,16
    39b4:	0c812703          	lw	a4,200(sp)
    39b8:	1a880813          	addi	a6,a6,424 # 131a8 <zeroes.0>
    39bc:	6755de63          	bge	a1,s5,4038 <_vfprintf_r+0x1b28>
    39c0:	00040793          	mv	a5,s0
    39c4:	01000c13          	li	s8,16
    39c8:	00700b13          	li	s6,7
    39cc:	00080413          	mv	s0,a6
    39d0:	00c0006f          	j	39dc <_vfprintf_r+0x14cc>
    39d4:	ff0a8a93          	addi	s5,s5,-16
    39d8:	655c5c63          	bge	s8,s5,4030 <_vfprintf_r+0x1b20>
    39dc:	01060613          	addi	a2,a2,16
    39e0:	00170713          	addi	a4,a4,1
    39e4:	0087a023          	sw	s0,0(a5)
    39e8:	0187a223          	sw	s8,4(a5)
    39ec:	0cc12623          	sw	a2,204(sp)
    39f0:	0ce12423          	sw	a4,200(sp)
    39f4:	00878793          	addi	a5,a5,8
    39f8:	fceb5ee3          	bge	s6,a4,39d4 <_vfprintf_r+0x14c4>
    39fc:	00812503          	lw	a0,8(sp)
    3a00:	0c410613          	addi	a2,sp,196
    3a04:	00048593          	mv	a1,s1
    3a08:	454010ef          	jal	4e5c <__sprint_r>
    3a0c:	980518e3          	bnez	a0,339c <_vfprintf_r+0xe8c>
    3a10:	0cc12603          	lw	a2,204(sp)
    3a14:	0c812703          	lw	a4,200(sp)
    3a18:	00098793          	mv	a5,s3
    3a1c:	fb9ff06f          	j	39d4 <_vfprintf_r+0x14c4>
    3a20:	03012703          	lw	a4,48(sp)
    3a24:	02c12783          	lw	a5,44(sp)
    3a28:	00700593          	li	a1,7
    3a2c:	00e42023          	sw	a4,0(s0)
    3a30:	0c812703          	lw	a4,200(sp)
    3a34:	00f60633          	add	a2,a2,a5
    3a38:	00f42223          	sw	a5,4(s0)
    3a3c:	00170713          	addi	a4,a4,1
    3a40:	0cc12623          	sw	a2,204(sp)
    3a44:	0ce12423          	sw	a4,200(sp)
    3a48:	00840413          	addi	s0,s0,8
    3a4c:	bee5d4e3          	bge	a1,a4,3634 <_vfprintf_r+0x1124>
    3a50:	00812503          	lw	a0,8(sp)
    3a54:	0c410613          	addi	a2,sp,196
    3a58:	00048593          	mv	a1,s1
    3a5c:	400010ef          	jal	4e5c <__sprint_r>
    3a60:	92051ee3          	bnez	a0,339c <_vfprintf_r+0xe8c>
    3a64:	0ac12a83          	lw	s5,172(sp)
    3a68:	0cc12603          	lw	a2,204(sp)
    3a6c:	00098413          	mv	s0,s3
    3a70:	bc5ff06f          	j	3634 <_vfprintf_r+0x1124>
    3a74:	07800793          	li	a5,120
    3a78:	03000713          	li	a4,48
    3a7c:	0ae10423          	sb	a4,168(sp)
    3a80:	0af104a3          	sb	a5,169(sp)
    3a84:	06300713          	li	a4,99
    3a88:	00012823          	sw	zero,16(sp)
    3a8c:	002cec93          	ori	s9,s9,2
    3a90:	12c10d13          	addi	s10,sp,300
    3a94:	89575463          	bge	a4,s5,2b1c <_vfprintf_r+0x60c>
    3a98:	00812503          	lw	a0,8(sp)
    3a9c:	001a8593          	addi	a1,s5,1
    3aa0:	01112823          	sw	a7,16(sp)
    3aa4:	558050ef          	jal	8ffc <_malloc_r>
    3aa8:	01012883          	lw	a7,16(sp)
    3aac:	00050d13          	mv	s10,a0
    3ab0:	00051463          	bnez	a0,3ab8 <_vfprintf_r+0x15a8>
    3ab4:	2b00106f          	j	4d64 <_vfprintf_r+0x2854>
    3ab8:	00a12823          	sw	a0,16(sp)
    3abc:	860ff06f          	j	2b1c <_vfprintf_r+0x60c>
    3ac0:	00812503          	lw	a0,8(sp)
    3ac4:	09010b13          	addi	s6,sp,144
    3ac8:	0ac10713          	addi	a4,sp,172
    3acc:	0bc10813          	addi	a6,sp,188
    3ad0:	0b010793          	addi	a5,sp,176
    3ad4:	000a8693          	mv	a3,s5
    3ad8:	00200613          	li	a2,2
    3adc:	000b0593          	mv	a1,s6
    3ae0:	03112423          	sw	a7,40(sp)
    3ae4:	09f12823          	sw	t6,144(sp)
    3ae8:	03f12223          	sw	t6,36(sp)
    3aec:	09e12a23          	sw	t5,148(sp)
    3af0:	03e12023          	sw	t5,32(sp)
    3af4:	09d12c23          	sw	t4,152(sp)
    3af8:	01d12e23          	sw	t4,28(sp)
    3afc:	09812e23          	sw	s8,156(sp)
    3b00:	0f0030ef          	jal	6bf0 <_ldtoa_r>
    3b04:	001cf713          	andi	a4,s9,1
    3b08:	01c12e83          	lw	t4,28(sp)
    3b0c:	02012f03          	lw	t5,32(sp)
    3b10:	02412f83          	lw	t6,36(sp)
    3b14:	02812883          	lw	a7,40(sp)
    3b18:	00050d13          	mv	s10,a0
    3b1c:	10071ae3          	bnez	a4,4430 <_vfprintf_r+0x1f20>
    3b20:	0ac12783          	lw	a5,172(sp)
    3b24:	00f12e23          	sw	a5,28(sp)
    3b28:	0bc12783          	lw	a5,188(sp)
    3b2c:	40a787b3          	sub	a5,a5,a0
    3b30:	02f12023          	sw	a5,32(sp)
    3b34:	01c12783          	lw	a5,28(sp)
    3b38:	ffd00713          	li	a4,-3
    3b3c:	00e7c463          	blt	a5,a4,3b44 <_vfprintf_r+0x1634>
    3b40:	58fad8e3          	bge	s5,a5,48d0 <_vfprintf_r+0x23c0>
    3b44:	01c12783          	lw	a5,28(sp)
    3b48:	ffe88893          	addi	a7,a7,-2
    3b4c:	fff78713          	addi	a4,a5,-1
    3b50:	0ae12623          	sw	a4,172(sp)
    3b54:	0ff8f693          	zext.b	a3,a7
    3b58:	00000613          	li	a2,0
    3b5c:	0ad10a23          	sb	a3,180(sp)
    3b60:	02b00693          	li	a3,43
    3b64:	00075a63          	bgez	a4,3b78 <_vfprintf_r+0x1668>
    3b68:	01c12783          	lw	a5,28(sp)
    3b6c:	00100713          	li	a4,1
    3b70:	02d00693          	li	a3,45
    3b74:	40f70733          	sub	a4,a4,a5
    3b78:	0ad10aa3          	sb	a3,181(sp)
    3b7c:	00900693          	li	a3,9
    3b80:	00e6c463          	blt	a3,a4,3b88 <_vfprintf_r+0x1678>
    3b84:	0240106f          	j	4ba8 <_vfprintf_r+0x2698>
    3b88:	0c310813          	addi	a6,sp,195
    3b8c:	00080593          	mv	a1,a6
    3b90:	00a00513          	li	a0,10
    3b94:	06300f13          	li	t5,99
    3b98:	02a767b3          	rem	a5,a4,a0
    3b9c:	00058613          	mv	a2,a1
    3ba0:	00070693          	mv	a3,a4
    3ba4:	fff58593          	addi	a1,a1,-1
    3ba8:	03078793          	addi	a5,a5,48
    3bac:	fef60fa3          	sb	a5,-1(a2)
    3bb0:	02a74733          	div	a4,a4,a0
    3bb4:	fedf42e3          	blt	t5,a3,3b98 <_vfprintf_r+0x1688>
    3bb8:	03070713          	addi	a4,a4,48
    3bbc:	ffe60693          	addi	a3,a2,-2
    3bc0:	fee58fa3          	sb	a4,-1(a1)
    3bc4:	0106e463          	bltu	a3,a6,3bcc <_vfprintf_r+0x16bc>
    3bc8:	1540106f          	j	4d1c <_vfprintf_r+0x280c>
    3bcc:	0b610713          	addi	a4,sp,182
    3bd0:	0006c783          	lbu	a5,0(a3)
    3bd4:	00168693          	addi	a3,a3,1
    3bd8:	00170713          	addi	a4,a4,1
    3bdc:	fef70fa3          	sb	a5,-1(a4)
    3be0:	ff0698e3          	bne	a3,a6,3bd0 <_vfprintf_r+0x16c0>
    3be4:	19010793          	addi	a5,sp,400
    3be8:	40c78733          	sub	a4,a5,a2
    3bec:	f3770793          	addi	a5,a4,-201
    3bf0:	04f12023          	sw	a5,64(sp)
    3bf4:	02012783          	lw	a5,32(sp)
    3bf8:	04012683          	lw	a3,64(sp)
    3bfc:	00100713          	li	a4,1
    3c00:	00d78b33          	add	s6,a5,a3
    3c04:	00f74463          	blt	a4,a5,3c0c <_vfprintf_r+0x16fc>
    3c08:	7dd0006f          	j	4be4 <_vfprintf_r+0x26d4>
    3c0c:	02c12783          	lw	a5,44(sp)
    3c10:	00fb0b33          	add	s6,s6,a5
    3c14:	fffb4693          	not	a3,s6
    3c18:	bffcfe13          	andi	t3,s9,-1025
    3c1c:	41f6d693          	srai	a3,a3,0x1f
    3c20:	100e6793          	ori	a5,t3,256
    3c24:	04f12623          	sw	a5,76(sp)
    3c28:	00db7db3          	and	s11,s6,a3
    3c2c:	02012423          	sw	zero,40(sp)
    3c30:	02012223          	sw	zero,36(sp)
    3c34:	00012e23          	sw	zero,28(sp)
    3c38:	03812783          	lw	a5,56(sp)
    3c3c:	46078ee3          	beqz	a5,48b8 <_vfprintf_r+0x23a8>
    3c40:	02d00713          	li	a4,45
    3c44:	04c12c83          	lw	s9,76(sp)
    3c48:	0ae103a3          	sb	a4,167(sp)
    3c4c:	00000a93          	li	s5,0
    3c50:	001d8d93          	addi	s11,s11,1
    3c54:	ae1fe06f          	j	2734 <_vfprintf_r+0x224>
    3c58:	01412703          	lw	a4,20(sp)
    3c5c:	010cf793          	andi	a5,s9,16
    3c60:	00072b03          	lw	s6,0(a4)
    3c64:	00470713          	addi	a4,a4,4
    3c68:	00e12a23          	sw	a4,20(sp)
    3c6c:	06079663          	bnez	a5,3cd8 <_vfprintf_r+0x17c8>
    3c70:	040cf793          	andi	a5,s9,64
    3c74:	04078e63          	beqz	a5,3cd0 <_vfprintf_r+0x17c0>
    3c78:	010b1b13          	slli	s6,s6,0x10
    3c7c:	010b5b13          	srli	s6,s6,0x10
    3c80:	00000d93          	li	s11,0
    3c84:	c8dff06f          	j	3910 <_vfprintf_r+0x1400>
    3c88:	00812503          	lw	a0,8(sp)
    3c8c:	0c410613          	addi	a2,sp,196
    3c90:	00048593          	mv	a1,s1
    3c94:	1c8010ef          	jal	4e5c <__sprint_r>
    3c98:	f0051263          	bnez	a0,339c <_vfprintf_r+0xe8c>
    3c9c:	0cc12c03          	lw	s8,204(sp)
    3ca0:	0c812a83          	lw	s5,200(sp)
    3ca4:	00098b13          	mv	s6,s3
    3ca8:	f3dfe06f          	j	2be4 <_vfprintf_r+0x6d4>
    3cac:	00812503          	lw	a0,8(sp)
    3cb0:	0c410613          	addi	a2,sp,196
    3cb4:	00048593          	mv	a1,s1
    3cb8:	1a4010ef          	jal	4e5c <__sprint_r>
    3cbc:	ee051063          	bnez	a0,339c <_vfprintf_r+0xe8c>
    3cc0:	0cc12c03          	lw	s8,204(sp)
    3cc4:	0c812a83          	lw	s5,200(sp)
    3cc8:	00098b13          	mv	s6,s3
    3ccc:	f49fe06f          	j	2c14 <_vfprintf_r+0x704>
    3cd0:	200cf793          	andi	a5,s9,512
    3cd4:	70079063          	bnez	a5,43d4 <_vfprintf_r+0x1ec4>
    3cd8:	00000d93          	li	s11,0
    3cdc:	c35ff06f          	j	3910 <_vfprintf_r+0x1400>
    3ce0:	ccccd837          	lui	a6,0xccccd
    3ce4:	ccccdcb7          	lui	s9,0xccccd
    3ce8:	03c12703          	lw	a4,60(sp)
    3cec:	400eff13          	andi	t5,t4,1024
    3cf0:	00000613          	li	a2,0
    3cf4:	19010593          	addi	a1,sp,400
    3cf8:	00500e13          	li	t3,5
    3cfc:	ccd80813          	addi	a6,a6,-819 # cccccccd <_memory_end+0xcccacccd>
    3d00:	cccc8c93          	addi	s9,s9,-820 # cccccccc <_memory_end+0xcccacccc>
    3d04:	0ff00c13          	li	s8,255
    3d08:	0540006f          	j	3d5c <_vfprintf_r+0x184c>
    3d0c:	016d37b3          	sltu	a5,s10,s6
    3d10:	00fd07b3          	add	a5,s10,a5
    3d14:	03c7f7b3          	remu	a5,a5,t3
    3d18:	40fb07b3          	sub	a5,s6,a5
    3d1c:	00fb35b3          	sltu	a1,s6,a5
    3d20:	40bd85b3          	sub	a1,s11,a1
    3d24:	03978333          	mul	t1,a5,s9
    3d28:	030585b3          	mul	a1,a1,a6
    3d2c:	0307b533          	mulhu	a0,a5,a6
    3d30:	006585b3          	add	a1,a1,t1
    3d34:	030787b3          	mul	a5,a5,a6
    3d38:	00a585b3          	add	a1,a1,a0
    3d3c:	01f59513          	slli	a0,a1,0x1f
    3d40:	0015d593          	srli	a1,a1,0x1
    3d44:	0017d793          	srli	a5,a5,0x1
    3d48:	00f567b3          	or	a5,a0,a5
    3d4c:	400d84e3          	beqz	s11,4954 <_vfprintf_r+0x2444>
    3d50:	00058d93          	mv	s11,a1
    3d54:	00078b13          	mv	s6,a5
    3d58:	00068593          	mv	a1,a3
    3d5c:	01bb0d33          	add	s10,s6,s11
    3d60:	016d37b3          	sltu	a5,s10,s6
    3d64:	00fd07b3          	add	a5,s10,a5
    3d68:	03c7f7b3          	remu	a5,a5,t3
    3d6c:	fff58693          	addi	a3,a1,-1
    3d70:	00160613          	addi	a2,a2,1
    3d74:	40fb07b3          	sub	a5,s6,a5
    3d78:	00fb3533          	sltu	a0,s6,a5
    3d7c:	40ad8533          	sub	a0,s11,a0
    3d80:	0307b333          	mulhu	t1,a5,a6
    3d84:	03050533          	mul	a0,a0,a6
    3d88:	030787b3          	mul	a5,a5,a6
    3d8c:	00650533          	add	a0,a0,t1
    3d90:	01f51513          	slli	a0,a0,0x1f
    3d94:	0017d793          	srli	a5,a5,0x1
    3d98:	00f567b3          	or	a5,a0,a5
    3d9c:	00279513          	slli	a0,a5,0x2
    3da0:	00f507b3          	add	a5,a0,a5
    3da4:	00179793          	slli	a5,a5,0x1
    3da8:	40fb07b3          	sub	a5,s6,a5
    3dac:	03078793          	addi	a5,a5,48
    3db0:	fef58fa3          	sb	a5,-1(a1)
    3db4:	f40f0ce3          	beqz	t5,3d0c <_vfprintf_r+0x17fc>
    3db8:	00074783          	lbu	a5,0(a4)
    3dbc:	f4f618e3          	bne	a2,a5,3d0c <_vfprintf_r+0x17fc>
    3dc0:	f58606e3          	beq	a2,s8,3d0c <_vfprintf_r+0x17fc>
    3dc4:	2a0d9c63          	bnez	s11,407c <_vfprintf_r+0x1b6c>
    3dc8:	00900793          	li	a5,9
    3dcc:	2b67e863          	bltu	a5,s6,407c <_vfprintf_r+0x1b6c>
    3dd0:	00068d13          	mv	s10,a3
    3dd4:	19010793          	addi	a5,sp,400
    3dd8:	02c12023          	sw	a2,32(sp)
    3ddc:	02e12e23          	sw	a4,60(sp)
    3de0:	41a78b33          	sub	s6,a5,s10
    3de4:	000e8c93          	mv	s9,t4
    3de8:	bb5fe06f          	j	299c <_vfprintf_r+0x48c>
    3dec:	0c812703          	lw	a4,200(sp)
    3df0:	52018593          	addi	a1,gp,1312 # 12e30 <keypad_map+0x170>
    3df4:	00b42023          	sw	a1,0(s0)
    3df8:	00160613          	addi	a2,a2,1
    3dfc:	00100593          	li	a1,1
    3e00:	00170713          	addi	a4,a4,1
    3e04:	00b42223          	sw	a1,4(s0)
    3e08:	0cc12623          	sw	a2,204(sp)
    3e0c:	0ce12423          	sw	a4,200(sp)
    3e10:	00700593          	li	a1,7
    3e14:	00840413          	addi	s0,s0,8
    3e18:	52e5c663          	blt	a1,a4,4344 <_vfprintf_r+0x1e34>
    3e1c:	12051c63          	bnez	a0,3f54 <_vfprintf_r+0x1a44>
    3e20:	02012783          	lw	a5,32(sp)
    3e24:	001cf713          	andi	a4,s9,1
    3e28:	00f76733          	or	a4,a4,a5
    3e2c:	00071463          	bnez	a4,3e34 <_vfprintf_r+0x1924>
    3e30:	9d1fe06f          	j	2800 <_vfprintf_r+0x2f0>
    3e34:	03012703          	lw	a4,48(sp)
    3e38:	02c12783          	lw	a5,44(sp)
    3e3c:	00700593          	li	a1,7
    3e40:	00e42023          	sw	a4,0(s0)
    3e44:	0c812703          	lw	a4,200(sp)
    3e48:	00c78633          	add	a2,a5,a2
    3e4c:	00f42223          	sw	a5,4(s0)
    3e50:	00170713          	addi	a4,a4,1
    3e54:	0cc12623          	sw	a2,204(sp)
    3e58:	0ce12423          	sw	a4,200(sp)
    3e5c:	5ae5c463          	blt	a1,a4,4404 <_vfprintf_r+0x1ef4>
    3e60:	00840413          	addi	s0,s0,8
    3e64:	1240006f          	j	3f88 <_vfprintf_r+0x1a78>
    3e68:	00812503          	lw	a0,8(sp)
    3e6c:	6a8010ef          	jal	5514 <__sinit>
    3e70:	f00fe06f          	j	2570 <_vfprintf_r+0x60>
    3e74:	00812503          	lw	a0,8(sp)
    3e78:	0c410613          	addi	a2,sp,196
    3e7c:	00048593          	mv	a1,s1
    3e80:	7dd000ef          	jal	4e5c <__sprint_r>
    3e84:	d0051c63          	bnez	a0,339c <_vfprintf_r+0xe8c>
    3e88:	0cc12603          	lw	a2,204(sp)
    3e8c:	00098413          	mv	s0,s3
    3e90:	a00ff06f          	j	3090 <_vfprintf_r+0xb80>
    3e94:	000d0813          	mv	a6,s10
    3e98:	01042023          	sw	a6,0(s0)
    3e9c:	01542223          	sw	s5,4(s0)
    3ea0:	01560633          	add	a2,a2,s5
    3ea4:	00178793          	addi	a5,a5,1
    3ea8:	0cc12623          	sw	a2,204(sp)
    3eac:	0cf12423          	sw	a5,200(sp)
    3eb0:	00700713          	li	a4,7
    3eb4:	00f74463          	blt	a4,a5,3ebc <_vfprintf_r+0x19ac>
    3eb8:	945fe06f          	j	27fc <_vfprintf_r+0x2ec>
    3ebc:	df5fe06f          	j	2cb0 <_vfprintf_r+0x7a0>
    3ec0:	0d012783          	lw	a5,208(sp)
    3ec4:	08010593          	addi	a1,sp,128
    3ec8:	09010513          	addi	a0,sp,144
    3ecc:	08f12823          	sw	a5,144(sp)
    3ed0:	0d412783          	lw	a5,212(sp)
    3ed4:	08012023          	sw	zero,128(sp)
    3ed8:	08012223          	sw	zero,132(sp)
    3edc:	08f12a23          	sw	a5,148(sp)
    3ee0:	0d812783          	lw	a5,216(sp)
    3ee4:	08012423          	sw	zero,136(sp)
    3ee8:	08012623          	sw	zero,140(sp)
    3eec:	08f12c23          	sw	a5,152(sp)
    3ef0:	0dc12783          	lw	a5,220(sp)
    3ef4:	08f12e23          	sw	a5,156(sp)
    3ef8:	3d00b0ef          	jal	f2c8 <__letf2>
    3efc:	01012883          	lw	a7,16(sp)
    3f00:	260546e3          	bltz	a0,496c <_vfprintf_r+0x245c>
    3f04:	0a714703          	lbu	a4,167(sp)
    3f08:	04700793          	li	a5,71
    3f0c:	4717d063          	bge	a5,a7,436c <_vfprintf_r+0x1e5c>
    3f10:	4e418d13          	addi	s10,gp,1252 # 12df4 <keypad_map+0x134>
    3f14:	00012823          	sw	zero,16(sp)
    3f18:	02012423          	sw	zero,40(sp)
    3f1c:	02012223          	sw	zero,36(sp)
    3f20:	00012e23          	sw	zero,28(sp)
    3f24:	f7fcfc93          	andi	s9,s9,-129
    3f28:	00300d93          	li	s11,3
    3f2c:	00300b13          	li	s6,3
    3f30:	00000a93          	li	s5,0
    3f34:	00070463          	beqz	a4,3f3c <_vfprintf_r+0x1a2c>
    3f38:	a89fe06f          	j	29c0 <_vfprintf_r+0x4b0>
    3f3c:	ff8fe06f          	j	2734 <_vfprintf_r+0x224>
    3f40:	01412783          	lw	a5,20(sp)
    3f44:	00c12703          	lw	a4,12(sp)
    3f48:	0007a783          	lw	a5,0(a5)
    3f4c:	00e7a023          	sw	a4,0(a5)
    3f50:	884ff06f          	j	2fd4 <_vfprintf_r+0xac4>
    3f54:	03012703          	lw	a4,48(sp)
    3f58:	02c12783          	lw	a5,44(sp)
    3f5c:	00700593          	li	a1,7
    3f60:	00e42023          	sw	a4,0(s0)
    3f64:	0c812703          	lw	a4,200(sp)
    3f68:	00c78633          	add	a2,a5,a2
    3f6c:	00f42223          	sw	a5,4(s0)
    3f70:	00170713          	addi	a4,a4,1
    3f74:	0cc12623          	sw	a2,204(sp)
    3f78:	0ce12423          	sw	a4,200(sp)
    3f7c:	00840413          	addi	s0,s0,8
    3f80:	48e5c263          	blt	a1,a4,4404 <_vfprintf_r+0x1ef4>
    3f84:	34054ee3          	bltz	a0,4ae0 <_vfprintf_r+0x25d0>
    3f88:	02012783          	lw	a5,32(sp)
    3f8c:	00170713          	addi	a4,a4,1
    3f90:	01a42023          	sw	s10,0(s0)
    3f94:	00c78633          	add	a2,a5,a2
    3f98:	00f42223          	sw	a5,4(s0)
    3f9c:	0cc12623          	sw	a2,204(sp)
    3fa0:	0ce12423          	sw	a4,200(sp)
    3fa4:	00700793          	li	a5,7
    3fa8:	00e7c463          	blt	a5,a4,3fb0 <_vfprintf_r+0x1aa0>
    3fac:	851fe06f          	j	27fc <_vfprintf_r+0x2ec>
    3fb0:	d01fe06f          	j	2cb0 <_vfprintf_r+0x7a0>
    3fb4:	000d0513          	mv	a0,s10
    3fb8:	03112c23          	sw	a7,56(sp)
    3fbc:	5d4020ef          	jal	6590 <strlen>
    3fc0:	0a714703          	lbu	a4,167(sp)
    3fc4:	fff54693          	not	a3,a0
    3fc8:	41f6d693          	srai	a3,a3,0x1f
    3fcc:	01812a23          	sw	s8,20(sp)
    3fd0:	00012823          	sw	zero,16(sp)
    3fd4:	02012423          	sw	zero,40(sp)
    3fd8:	02012223          	sw	zero,36(sp)
    3fdc:	00012e23          	sw	zero,28(sp)
    3fe0:	03812883          	lw	a7,56(sp)
    3fe4:	00050b13          	mv	s6,a0
    3fe8:	00d57db3          	and	s11,a0,a3
    3fec:	00000a93          	li	s5,0
    3ff0:	00070463          	beqz	a4,3ff8 <_vfprintf_r+0x1ae8>
    3ff4:	9cdfe06f          	j	29c0 <_vfprintf_r+0x4b0>
    3ff8:	f3cfe06f          	j	2734 <_vfprintf_r+0x224>
    3ffc:	00090813          	mv	a6,s2
    4000:	01c12903          	lw	s2,28(sp)
    4004:	008c0c33          	add	s8,s8,s0
    4008:	001a8a93          	addi	s5,s5,1
    400c:	010b2023          	sw	a6,0(s6)
    4010:	c5dfe06f          	j	2c6c <_vfprintf_r+0x75c>
    4014:	0dc12783          	lw	a5,220(sp)
    4018:	3c07c463          	bltz	a5,43e0 <_vfprintf_r+0x1ed0>
    401c:	0a714703          	lbu	a4,167(sp)
    4020:	04700793          	li	a5,71
    4024:	1b17cae3          	blt	a5,a7,49d8 <_vfprintf_r+0x24c8>
    4028:	4e818d13          	addi	s10,gp,1256 # 12df8 <keypad_map+0x138>
    402c:	ee9ff06f          	j	3f14 <_vfprintf_r+0x1a04>
    4030:	00040813          	mv	a6,s0
    4034:	00078413          	mv	s0,a5
    4038:	01560633          	add	a2,a2,s5
    403c:	00170713          	addi	a4,a4,1
    4040:	01042023          	sw	a6,0(s0)
    4044:	01542223          	sw	s5,4(s0)
    4048:	0cc12623          	sw	a2,204(sp)
    404c:	0ce12423          	sw	a4,200(sp)
    4050:	00700593          	li	a1,7
    4054:	00840413          	addi	s0,s0,8
    4058:	dae5dc63          	bge	a1,a4,3610 <_vfprintf_r+0x1100>
    405c:	00812503          	lw	a0,8(sp)
    4060:	0c410613          	addi	a2,sp,196
    4064:	00048593          	mv	a1,s1
    4068:	5f5000ef          	jal	4e5c <__sprint_r>
    406c:	b2051863          	bnez	a0,339c <_vfprintf_r+0xe8c>
    4070:	0cc12603          	lw	a2,204(sp)
    4074:	00098413          	mv	s0,s3
    4078:	d98ff06f          	j	3610 <_vfprintf_r+0x1100>
    407c:	04812783          	lw	a5,72(sp)
    4080:	04412583          	lw	a1,68(sp)
    4084:	03012c23          	sw	a6,56(sp)
    4088:	40f686b3          	sub	a3,a3,a5
    408c:	00078613          	mv	a2,a5
    4090:	00068513          	mv	a0,a3
    4094:	03e12423          	sw	t5,40(sp)
    4098:	03d12223          	sw	t4,36(sp)
    409c:	03112023          	sw	a7,32(sp)
    40a0:	00e12e23          	sw	a4,28(sp)
    40a4:	00d12823          	sw	a3,16(sp)
    40a8:	605010ef          	jal	5eac <strncpy>
    40ac:	016d37b3          	sltu	a5,s10,s6
    40b0:	00500613          	li	a2,5
    40b4:	00fd07b3          	add	a5,s10,a5
    40b8:	02c7f7b3          	remu	a5,a5,a2
    40bc:	01c12703          	lw	a4,28(sp)
    40c0:	ccccd337          	lui	t1,0xccccd
    40c4:	ccccd537          	lui	a0,0xccccd
    40c8:	00174583          	lbu	a1,1(a4)
    40cc:	ccd30313          	addi	t1,t1,-819 # cccccccd <_memory_end+0xcccacccd>
    40d0:	ccc50513          	addi	a0,a0,-820 # cccccccc <_memory_end+0xcccacccc>
    40d4:	00b035b3          	snez	a1,a1
    40d8:	00b70733          	add	a4,a4,a1
    40dc:	01012683          	lw	a3,16(sp)
    40e0:	02012883          	lw	a7,32(sp)
    40e4:	02412e83          	lw	t4,36(sp)
    40e8:	02812f03          	lw	t5,40(sp)
    40ec:	03812803          	lw	a6,56(sp)
    40f0:	00000613          	li	a2,0
    40f4:	00500e13          	li	t3,5
    40f8:	40fb07b3          	sub	a5,s6,a5
    40fc:	00fb35b3          	sltu	a1,s6,a5
    4100:	40bd85b3          	sub	a1,s11,a1
    4104:	02a78533          	mul	a0,a5,a0
    4108:	026585b3          	mul	a1,a1,t1
    410c:	0267bfb3          	mulhu	t6,a5,t1
    4110:	00a585b3          	add	a1,a1,a0
    4114:	02678533          	mul	a0,a5,t1
    4118:	01f585b3          	add	a1,a1,t6
    411c:	01f59793          	slli	a5,a1,0x1f
    4120:	0015d593          	srli	a1,a1,0x1
    4124:	00155513          	srli	a0,a0,0x1
    4128:	00a7e7b3          	or	a5,a5,a0
    412c:	c25ff06f          	j	3d50 <_vfprintf_r+0x1840>
    4130:	02012783          	lw	a5,32(sp)
    4134:	02412b03          	lw	s6,36(sp)
    4138:	000138b7          	lui	a7,0x13
    413c:	00fd07b3          	add	a5,s10,a5
    4140:	03212c23          	sw	s2,56(sp)
    4144:	05912623          	sw	s9,76(sp)
    4148:	05712823          	sw	s7,80(sp)
    414c:	03b12223          	sw	s11,36(sp)
    4150:	02812d83          	lw	s11,40(sp)
    4154:	03a12423          	sw	s10,40(sp)
    4158:	03c12c83          	lw	s9,60(sp)
    415c:	000c0d13          	mv	s10,s8
    4160:	00812903          	lw	s2,8(sp)
    4164:	04812c03          	lw	s8,72(sp)
    4168:	00700813          	li	a6,7
    416c:	01000713          	li	a4,16
    4170:	1a888a93          	addi	s5,a7,424 # 131a8 <zeroes.0>
    4174:	00040593          	mv	a1,s0
    4178:	00078b93          	mv	s7,a5
    417c:	09605663          	blez	s6,4208 <_vfprintf_r+0x1cf8>
    4180:	17b05063          	blez	s11,42e0 <_vfprintf_r+0x1dd0>
    4184:	fffd8d93          	addi	s11,s11,-1
    4188:	04412783          	lw	a5,68(sp)
    418c:	01860633          	add	a2,a2,s8
    4190:	0185a223          	sw	s8,4(a1)
    4194:	00f5a023          	sw	a5,0(a1)
    4198:	0c812783          	lw	a5,200(sp)
    419c:	0cc12623          	sw	a2,204(sp)
    41a0:	00858593          	addi	a1,a1,8
    41a4:	00178793          	addi	a5,a5,1
    41a8:	0cf12423          	sw	a5,200(sp)
    41ac:	14f84063          	blt	a6,a5,42ec <_vfprintf_r+0x1ddc>
    41b0:	000cc683          	lbu	a3,0(s9)
    41b4:	41ab8433          	sub	s0,s7,s10
    41b8:	0086d463          	bge	a3,s0,41c0 <_vfprintf_r+0x1cb0>
    41bc:	00068413          	mv	s0,a3
    41c0:	02805663          	blez	s0,41ec <_vfprintf_r+0x1cdc>
    41c4:	0c812683          	lw	a3,200(sp)
    41c8:	00860633          	add	a2,a2,s0
    41cc:	01a5a023          	sw	s10,0(a1)
    41d0:	00168693          	addi	a3,a3,1
    41d4:	0085a223          	sw	s0,4(a1)
    41d8:	0cc12623          	sw	a2,204(sp)
    41dc:	0cd12423          	sw	a3,200(sp)
    41e0:	12d84a63          	blt	a6,a3,4314 <_vfprintf_r+0x1e04>
    41e4:	000cc683          	lbu	a3,0(s9)
    41e8:	00858593          	addi	a1,a1,8
    41ec:	fff44513          	not	a0,s0
    41f0:	41f55513          	srai	a0,a0,0x1f
    41f4:	00a477b3          	and	a5,s0,a0
    41f8:	40f68433          	sub	s0,a3,a5
    41fc:	04804263          	bgtz	s0,4240 <_vfprintf_r+0x1d30>
    4200:	00dd0d33          	add	s10,s10,a3
    4204:	f7604ee3          	bgtz	s6,4180 <_vfprintf_r+0x1c70>
    4208:	f7b04ee3          	bgtz	s11,4184 <_vfprintf_r+0x1c74>
    420c:	02012783          	lw	a5,32(sp)
    4210:	000d0c13          	mv	s8,s10
    4214:	02812d03          	lw	s10,40(sp)
    4218:	03912e23          	sw	s9,60(sp)
    421c:	03812903          	lw	s2,56(sp)
    4220:	00fd0733          	add	a4,s10,a5
    4224:	04c12c83          	lw	s9,76(sp)
    4228:	05012b83          	lw	s7,80(sp)
    422c:	02412d83          	lw	s11,36(sp)
    4230:	00058413          	mv	s0,a1
    4234:	bf877663          	bgeu	a4,s8,3620 <_vfprintf_r+0x1110>
    4238:	00070c13          	mv	s8,a4
    423c:	be4ff06f          	j	3620 <_vfprintf_r+0x1110>
    4240:	00013f37          	lui	t5,0x13
    4244:	0c812683          	lw	a3,200(sp)
    4248:	1a8f0f13          	addi	t5,t5,424 # 131a8 <zeroes.0>
    424c:	06875463          	bge	a4,s0,42b4 <_vfprintf_r+0x1da4>
    4250:	01512e23          	sw	s5,28(sp)
    4254:	00c0006f          	j	4260 <_vfprintf_r+0x1d50>
    4258:	ff040413          	addi	s0,s0,-16
    425c:	04875a63          	bge	a4,s0,42b0 <_vfprintf_r+0x1da0>
    4260:	01060613          	addi	a2,a2,16
    4264:	00168693          	addi	a3,a3,1
    4268:	0155a023          	sw	s5,0(a1)
    426c:	00e5a223          	sw	a4,4(a1)
    4270:	0cc12623          	sw	a2,204(sp)
    4274:	0cd12423          	sw	a3,200(sp)
    4278:	00858593          	addi	a1,a1,8
    427c:	fcd85ee3          	bge	a6,a3,4258 <_vfprintf_r+0x1d48>
    4280:	0c410613          	addi	a2,sp,196
    4284:	00048593          	mv	a1,s1
    4288:	00090513          	mv	a0,s2
    428c:	3d1000ef          	jal	4e5c <__sprint_r>
    4290:	90051663          	bnez	a0,339c <_vfprintf_r+0xe8c>
    4294:	01000713          	li	a4,16
    4298:	ff040413          	addi	s0,s0,-16
    429c:	0cc12603          	lw	a2,204(sp)
    42a0:	0c812683          	lw	a3,200(sp)
    42a4:	00098593          	mv	a1,s3
    42a8:	00700813          	li	a6,7
    42ac:	fa874ae3          	blt	a4,s0,4260 <_vfprintf_r+0x1d50>
    42b0:	01c12f03          	lw	t5,28(sp)
    42b4:	00860633          	add	a2,a2,s0
    42b8:	00168693          	addi	a3,a3,1
    42bc:	01e5a023          	sw	t5,0(a1)
    42c0:	0085a223          	sw	s0,4(a1)
    42c4:	0cc12623          	sw	a2,204(sp)
    42c8:	0cd12423          	sw	a3,200(sp)
    42cc:	64d84a63          	blt	a6,a3,4920 <_vfprintf_r+0x2410>
    42d0:	000cc683          	lbu	a3,0(s9)
    42d4:	00858593          	addi	a1,a1,8
    42d8:	00dd0d33          	add	s10,s10,a3
    42dc:	f29ff06f          	j	4204 <_vfprintf_r+0x1cf4>
    42e0:	fffc8c93          	addi	s9,s9,-1
    42e4:	fffb0b13          	addi	s6,s6,-1
    42e8:	ea1ff06f          	j	4188 <_vfprintf_r+0x1c78>
    42ec:	0c410613          	addi	a2,sp,196
    42f0:	00048593          	mv	a1,s1
    42f4:	00090513          	mv	a0,s2
    42f8:	365000ef          	jal	4e5c <__sprint_r>
    42fc:	8a051063          	bnez	a0,339c <_vfprintf_r+0xe8c>
    4300:	0cc12603          	lw	a2,204(sp)
    4304:	00098593          	mv	a1,s3
    4308:	01000713          	li	a4,16
    430c:	00700813          	li	a6,7
    4310:	ea1ff06f          	j	41b0 <_vfprintf_r+0x1ca0>
    4314:	0c410613          	addi	a2,sp,196
    4318:	00048593          	mv	a1,s1
    431c:	00090513          	mv	a0,s2
    4320:	33d000ef          	jal	4e5c <__sprint_r>
    4324:	00050463          	beqz	a0,432c <_vfprintf_r+0x1e1c>
    4328:	874ff06f          	j	339c <_vfprintf_r+0xe8c>
    432c:	000cc683          	lbu	a3,0(s9)
    4330:	0cc12603          	lw	a2,204(sp)
    4334:	00098593          	mv	a1,s3
    4338:	01000713          	li	a4,16
    433c:	00700813          	li	a6,7
    4340:	eadff06f          	j	41ec <_vfprintf_r+0x1cdc>
    4344:	00812503          	lw	a0,8(sp)
    4348:	0c410613          	addi	a2,sp,196
    434c:	00048593          	mv	a1,s1
    4350:	30d000ef          	jal	4e5c <__sprint_r>
    4354:	00050463          	beqz	a0,435c <_vfprintf_r+0x1e4c>
    4358:	844ff06f          	j	339c <_vfprintf_r+0xe8c>
    435c:	0ac12503          	lw	a0,172(sp)
    4360:	0cc12603          	lw	a2,204(sp)
    4364:	00098413          	mv	s0,s3
    4368:	ab5ff06f          	j	3e1c <_vfprintf_r+0x190c>
    436c:	4e018d13          	addi	s10,gp,1248 # 12df0 <keypad_map+0x130>
    4370:	ba5ff06f          	j	3f14 <_vfprintf_r+0x1a04>
    4374:	00812503          	lw	a0,8(sp)
    4378:	0c410613          	addi	a2,sp,196
    437c:	00048593          	mv	a1,s1
    4380:	2dd000ef          	jal	4e5c <__sprint_r>
    4384:	00050463          	beqz	a0,438c <_vfprintf_r+0x1e7c>
    4388:	814ff06f          	j	339c <_vfprintf_r+0xe8c>
    438c:	0cc12603          	lw	a2,204(sp)
    4390:	00098413          	mv	s0,s3
    4394:	a64ff06f          	j	35f8 <_vfprintf_r+0x10e8>
    4398:	00600b13          	li	s6,6
    439c:	e00ff06f          	j	399c <_vfprintf_r+0x148c>
    43a0:	01412783          	lw	a5,20(sp)
    43a4:	00c12703          	lw	a4,12(sp)
    43a8:	0007a783          	lw	a5,0(a5)
    43ac:	00e79023          	sh	a4,0(a5)
    43b0:	c25fe06f          	j	2fd4 <_vfprintf_r+0xac4>
    43b4:	018b1b13          	slli	s6,s6,0x18
    43b8:	418b5b13          	srai	s6,s6,0x18
    43bc:	41fb5d93          	srai	s11,s6,0x1f
    43c0:	000d8793          	mv	a5,s11
    43c4:	db0fe06f          	j	2974 <_vfprintf_r+0x464>
    43c8:	0ffb7b13          	zext.b	s6,s6
    43cc:	00000d93          	li	s11,0
    43d0:	e20fe06f          	j	29f0 <_vfprintf_r+0x4e0>
    43d4:	0ffb7b13          	zext.b	s6,s6
    43d8:	00000d93          	li	s11,0
    43dc:	d34ff06f          	j	3910 <_vfprintf_r+0x1400>
    43e0:	02d00793          	li	a5,45
    43e4:	0af103a3          	sb	a5,167(sp)
    43e8:	02d00713          	li	a4,45
    43ec:	c35ff06f          	j	4020 <_vfprintf_r+0x1b10>
    43f0:	00812503          	lw	a0,8(sp)
    43f4:	0c410613          	addi	a2,sp,196
    43f8:	00048593          	mv	a1,s1
    43fc:	261000ef          	jal	4e5c <__sprint_r>
    4400:	c60fe06f          	j	2860 <_vfprintf_r+0x350>
    4404:	00812503          	lw	a0,8(sp)
    4408:	0c410613          	addi	a2,sp,196
    440c:	00048593          	mv	a1,s1
    4410:	24d000ef          	jal	4e5c <__sprint_r>
    4414:	00050463          	beqz	a0,441c <_vfprintf_r+0x1f0c>
    4418:	f85fe06f          	j	339c <_vfprintf_r+0xe8c>
    441c:	0ac12503          	lw	a0,172(sp)
    4420:	0cc12603          	lw	a2,204(sp)
    4424:	0c812703          	lw	a4,200(sp)
    4428:	00098413          	mv	s0,s3
    442c:	b59ff06f          	j	3f84 <_vfprintf_r+0x1a74>
    4430:	01550733          	add	a4,a0,s5
    4434:	04700613          	li	a2,71
    4438:	08010593          	addi	a1,sp,128
    443c:	000b0513          	mv	a0,s6
    4440:	02e12223          	sw	a4,36(sp)
    4444:	02c12023          	sw	a2,32(sp)
    4448:	01112e23          	sw	a7,28(sp)
    444c:	09f12823          	sw	t6,144(sp)
    4450:	09e12a23          	sw	t5,148(sp)
    4454:	09d12c23          	sw	t4,152(sp)
    4458:	09812e23          	sw	s8,156(sp)
    445c:	08012023          	sw	zero,128(sp)
    4460:	08012223          	sw	zero,132(sp)
    4464:	08012423          	sw	zero,136(sp)
    4468:	08012623          	sw	zero,140(sp)
    446c:	4610a0ef          	jal	f0cc <__eqtf2>
    4470:	01c12883          	lw	a7,28(sp)
    4474:	02012603          	lw	a2,32(sp)
    4478:	02412703          	lw	a4,36(sp)
    447c:	56050263          	beqz	a0,49e0 <_vfprintf_r+0x24d0>
    4480:	0bc12783          	lw	a5,188(sp)
    4484:	00e7fe63          	bgeu	a5,a4,44a0 <_vfprintf_r+0x1f90>
    4488:	03000593          	li	a1,48
    448c:	00178693          	addi	a3,a5,1
    4490:	0ad12e23          	sw	a3,188(sp)
    4494:	00b78023          	sb	a1,0(a5)
    4498:	0bc12783          	lw	a5,188(sp)
    449c:	fee7e8e3          	bltu	a5,a4,448c <_vfprintf_r+0x1f7c>
    44a0:	0ac12703          	lw	a4,172(sp)
    44a4:	00e12e23          	sw	a4,28(sp)
    44a8:	41a787b3          	sub	a5,a5,s10
    44ac:	04700713          	li	a4,71
    44b0:	02f12023          	sw	a5,32(sp)
    44b4:	e8e60063          	beq	a2,a4,3b34 <_vfprintf_r+0x1624>
    44b8:	04600713          	li	a4,70
    44bc:	5ae60c63          	beq	a2,a4,4a74 <_vfprintf_r+0x2564>
    44c0:	01c12783          	lw	a5,28(sp)
    44c4:	fff78713          	addi	a4,a5,-1
    44c8:	e88ff06f          	j	3b50 <_vfprintf_r+0x1640>
    44cc:	001a8693          	addi	a3,s5,1
    44d0:	00200613          	li	a2,2
    44d4:	00812503          	lw	a0,8(sp)
    44d8:	09010b13          	addi	s6,sp,144
    44dc:	0ac10713          	addi	a4,sp,172
    44e0:	000b0593          	mv	a1,s6
    44e4:	0bc10813          	addi	a6,sp,188
    44e8:	0b010793          	addi	a5,sp,176
    44ec:	05112823          	sw	a7,80(sp)
    44f0:	02d12423          	sw	a3,40(sp)
    44f4:	09f12823          	sw	t6,144(sp)
    44f8:	03f12223          	sw	t6,36(sp)
    44fc:	09e12a23          	sw	t5,148(sp)
    4500:	03e12023          	sw	t5,32(sp)
    4504:	09d12c23          	sw	t4,152(sp)
    4508:	01d12e23          	sw	t4,28(sp)
    450c:	09812e23          	sw	s8,156(sp)
    4510:	6e0020ef          	jal	6bf0 <_ldtoa_r>
    4514:	05012883          	lw	a7,80(sp)
    4518:	02812683          	lw	a3,40(sp)
    451c:	04600593          	li	a1,70
    4520:	fdf8f613          	andi	a2,a7,-33
    4524:	01c12e83          	lw	t4,28(sp)
    4528:	02012f03          	lw	t5,32(sp)
    452c:	02412f83          	lw	t6,36(sp)
    4530:	00050d13          	mv	s10,a0
    4534:	00d50733          	add	a4,a0,a3
    4538:	02b610e3          	bne	a2,a1,4d58 <_vfprintf_r+0x2848>
    453c:	000d4503          	lbu	a0,0(s10)
    4540:	03000593          	li	a1,48
    4544:	4ab50663          	beq	a0,a1,49f0 <_vfprintf_r+0x24e0>
    4548:	0ac12683          	lw	a3,172(sp)
    454c:	08010593          	addi	a1,sp,128
    4550:	00d70733          	add	a4,a4,a3
    4554:	ee9ff06f          	j	443c <_vfprintf_r+0x1f2c>
    4558:	09010b13          	addi	s6,sp,144
    455c:	08010593          	addi	a1,sp,128
    4560:	0ac10613          	addi	a2,sp,172
    4564:	000b0513          	mv	a0,s6
    4568:	05112023          	sw	a7,64(sp)
    456c:	09f12023          	sw	t6,128(sp)
    4570:	09e12223          	sw	t5,132(sp)
    4574:	09d12423          	sw	t4,136(sp)
    4578:	00b12e23          	sw	a1,28(sp)
    457c:	09812623          	sw	s8,140(sp)
    4580:	09c020ef          	jal	661c <frexpl>
    4584:	09012703          	lw	a4,144(sp)
    4588:	01c12583          	lw	a1,28(sp)
    458c:	07010613          	addi	a2,sp,112
    4590:	08e12023          	sw	a4,128(sp)
    4594:	09412703          	lw	a4,148(sp)
    4598:	000b0513          	mv	a0,s6
    459c:	06012823          	sw	zero,112(sp)
    45a0:	08e12223          	sw	a4,132(sp)
    45a4:	09812703          	lw	a4,152(sp)
    45a8:	06012a23          	sw	zero,116(sp)
    45ac:	06012c23          	sw	zero,120(sp)
    45b0:	08e12423          	sw	a4,136(sp)
    45b4:	09c12703          	lw	a4,156(sp)
    45b8:	08e12623          	sw	a4,140(sp)
    45bc:	3ffc0737          	lui	a4,0x3ffc0
    45c0:	06e12e23          	sw	a4,124(sp)
    45c4:	6350a0ef          	jal	f3f8 <__multf3>
    45c8:	01c12583          	lw	a1,28(sp)
    45cc:	09012f03          	lw	t5,144(sp)
    45d0:	09412e83          	lw	t4,148(sp)
    45d4:	09812803          	lw	a6,152(sp)
    45d8:	000b0513          	mv	a0,s6
    45dc:	02b12423          	sw	a1,40(sp)
    45e0:	03e12223          	sw	t5,36(sp)
    45e4:	03d12023          	sw	t4,32(sp)
    45e8:	01012e23          	sw	a6,28(sp)
    45ec:	08012023          	sw	zero,128(sp)
    45f0:	08012223          	sw	zero,132(sp)
    45f4:	08012423          	sw	zero,136(sp)
    45f8:	08012623          	sw	zero,140(sp)
    45fc:	2d10a0ef          	jal	f0cc <__eqtf2>
    4600:	09c12d83          	lw	s11,156(sp)
    4604:	01c12803          	lw	a6,28(sp)
    4608:	02012e83          	lw	t4,32(sp)
    460c:	02412f03          	lw	t5,36(sp)
    4610:	02812583          	lw	a1,40(sp)
    4614:	04012883          	lw	a7,64(sp)
    4618:	00051663          	bnez	a0,4624 <_vfprintf_r+0x2114>
    461c:	00100713          	li	a4,1
    4620:	0ae12623          	sw	a4,172(sp)
    4624:	06100713          	li	a4,97
    4628:	6ae88063          	beq	a7,a4,4cc8 <_vfprintf_r+0x27b8>
    462c:	50418793          	addi	a5,gp,1284 # 12e14 <keypad_map+0x154>
    4630:	00f12e23          	sw	a5,28(sp)
    4634:	03212023          	sw	s2,32(sp)
    4638:	03912423          	sw	s9,40(sp)
    463c:	05712023          	sw	s7,64(sp)
    4640:	04812623          	sw	s0,76(sp)
    4644:	000d0913          	mv	s2,s10
    4648:	04912823          	sw	s1,80(sp)
    464c:	05a12a23          	sw	s10,84(sp)
    4650:	01c12483          	lw	s1,28(sp)
    4654:	fffa8a93          	addi	s5,s5,-1
    4658:	03112223          	sw	a7,36(sp)
    465c:	000f0b93          	mv	s7,t5
    4660:	000e8c13          	mv	s8,t4
    4664:	00080c93          	mv	s9,a6
    4668:	000d8d13          	mv	s10,s11
    466c:	00058413          	mv	s0,a1
    4670:	03c0006f          	j	46ac <_vfprintf_r+0x219c>
    4674:	00040593          	mv	a1,s0
    4678:	000b0513          	mv	a0,s6
    467c:	09712823          	sw	s7,144(sp)
    4680:	09812a23          	sw	s8,148(sp)
    4684:	09912c23          	sw	s9,152(sp)
    4688:	09a12e23          	sw	s10,156(sp)
    468c:	08012023          	sw	zero,128(sp)
    4690:	08012223          	sw	zero,132(sp)
    4694:	08012423          	sw	zero,136(sp)
    4698:	08012623          	sw	zero,140(sp)
    469c:	fffa8d93          	addi	s11,s5,-1
    46a0:	22d0a0ef          	jal	f0cc <__eqtf2>
    46a4:	5c050863          	beqz	a0,4c74 <_vfprintf_r+0x2764>
    46a8:	000d8a93          	mv	s5,s11
    46ac:	400307b7          	lui	a5,0x40030
    46b0:	07010613          	addi	a2,sp,112
    46b4:	00040593          	mv	a1,s0
    46b8:	000b0513          	mv	a0,s6
    46bc:	06f12e23          	sw	a5,124(sp)
    46c0:	09712023          	sw	s7,128(sp)
    46c4:	09812223          	sw	s8,132(sp)
    46c8:	09912423          	sw	s9,136(sp)
    46cc:	09a12623          	sw	s10,140(sp)
    46d0:	06012823          	sw	zero,112(sp)
    46d4:	06012a23          	sw	zero,116(sp)
    46d8:	06012c23          	sw	zero,120(sp)
    46dc:	51d0a0ef          	jal	f3f8 <__multf3>
    46e0:	000b0513          	mv	a0,s6
    46e4:	2340d0ef          	jal	11918 <__fixtfsi>
    46e8:	00050593          	mv	a1,a0
    46ec:	00050d93          	mv	s11,a0
    46f0:	000b0513          	mv	a0,s6
    46f4:	09012d03          	lw	s10,144(sp)
    46f8:	09412c83          	lw	s9,148(sp)
    46fc:	09812c03          	lw	s8,152(sp)
    4700:	09c12b83          	lw	s7,156(sp)
    4704:	30c0d0ef          	jal	11a10 <__floatsitf>
    4708:	09012683          	lw	a3,144(sp)
    470c:	06010613          	addi	a2,sp,96
    4710:	07010593          	addi	a1,sp,112
    4714:	06d12023          	sw	a3,96(sp)
    4718:	09412683          	lw	a3,148(sp)
    471c:	00040513          	mv	a0,s0
    4720:	07a12823          	sw	s10,112(sp)
    4724:	06d12223          	sw	a3,100(sp)
    4728:	09812683          	lw	a3,152(sp)
    472c:	07912a23          	sw	s9,116(sp)
    4730:	07812c23          	sw	s8,120(sp)
    4734:	06d12423          	sw	a3,104(sp)
    4738:	09c12683          	lw	a3,156(sp)
    473c:	07712e23          	sw	s7,124(sp)
    4740:	06d12623          	sw	a3,108(sp)
    4744:	4b90b0ef          	jal	103fc <__subtf3>
    4748:	01b486b3          	add	a3,s1,s11
    474c:	0006c603          	lbu	a2,0(a3)
    4750:	00090f93          	mv	t6,s2
    4754:	00190913          	addi	s2,s2,1
    4758:	08012b83          	lw	s7,128(sp)
    475c:	08412c03          	lw	s8,132(sp)
    4760:	08812c83          	lw	s9,136(sp)
    4764:	08c12d03          	lw	s10,140(sp)
    4768:	fff00793          	li	a5,-1
    476c:	fec90fa3          	sb	a2,-1(s2)
    4770:	f0fa92e3          	bne	s5,a5,4674 <_vfprintf_r+0x2164>
    4774:	02412883          	lw	a7,36(sp)
    4778:	000b8f13          	mv	t5,s7
    477c:	000c0e93          	mv	t4,s8
    4780:	000c8813          	mv	a6,s9
    4784:	00040593          	mv	a1,s0
    4788:	05b12c23          	sw	s11,88(sp)
    478c:	3ffe0ab7          	lui	s5,0x3ffe0
    4790:	000d0d93          	mv	s11,s10
    4794:	000b0513          	mv	a0,s6
    4798:	05112e23          	sw	a7,92(sp)
    479c:	03f12223          	sw	t6,36(sp)
    47a0:	05012483          	lw	s1,80(sp)
    47a4:	04012b83          	lw	s7,64(sp)
    47a8:	02812c83          	lw	s9,40(sp)
    47ac:	04c12403          	lw	s0,76(sp)
    47b0:	09e12823          	sw	t5,144(sp)
    47b4:	05e12823          	sw	t5,80(sp)
    47b8:	09d12a23          	sw	t4,148(sp)
    47bc:	05d12623          	sw	t4,76(sp)
    47c0:	09012c23          	sw	a6,152(sp)
    47c4:	05012023          	sw	a6,64(sp)
    47c8:	09b12e23          	sw	s11,156(sp)
    47cc:	08012023          	sw	zero,128(sp)
    47d0:	08012223          	sw	zero,132(sp)
    47d4:	08012423          	sw	zero,136(sp)
    47d8:	09512623          	sw	s5,140(sp)
    47dc:	02b12423          	sw	a1,40(sp)
    47e0:	1b90a0ef          	jal	f198 <__getf2>
    47e4:	00090c13          	mv	s8,s2
    47e8:	05412d03          	lw	s10,84(sp)
    47ec:	02012903          	lw	s2,32(sp)
    47f0:	02412f83          	lw	t6,36(sp)
    47f4:	05c12883          	lw	a7,92(sp)
    47f8:	02a04663          	bgtz	a0,4824 <_vfprintf_r+0x2314>
    47fc:	02812583          	lw	a1,40(sp)
    4800:	000b0513          	mv	a0,s6
    4804:	03112023          	sw	a7,32(sp)
    4808:	0c50a0ef          	jal	f0cc <__eqtf2>
    480c:	02012883          	lw	a7,32(sp)
    4810:	04051e63          	bnez	a0,486c <_vfprintf_r+0x235c>
    4814:	05812783          	lw	a5,88(sp)
    4818:	02412f83          	lw	t6,36(sp)
    481c:	0017f693          	andi	a3,a5,1
    4820:	04068663          	beqz	a3,486c <_vfprintf_r+0x235c>
    4824:	01c12783          	lw	a5,28(sp)
    4828:	0bf12e23          	sw	t6,188(sp)
    482c:	fffc4603          	lbu	a2,-1(s8)
    4830:	00f7c583          	lbu	a1,15(a5) # 4003000f <_memory_end+0x4001000f>
    4834:	000c0693          	mv	a3,s8
    4838:	02b61063          	bne	a2,a1,4858 <_vfprintf_r+0x2348>
    483c:	03000513          	li	a0,48
    4840:	fea68fa3          	sb	a0,-1(a3)
    4844:	0bc12683          	lw	a3,188(sp)
    4848:	fff68793          	addi	a5,a3,-1
    484c:	0af12e23          	sw	a5,188(sp)
    4850:	fff6c603          	lbu	a2,-1(a3)
    4854:	fec586e3          	beq	a1,a2,4840 <_vfprintf_r+0x2330>
    4858:	00160593          	addi	a1,a2,1
    485c:	03900513          	li	a0,57
    4860:	0ff5f593          	zext.b	a1,a1
    4864:	04a60463          	beq	a2,a0,48ac <_vfprintf_r+0x239c>
    4868:	feb68fa3          	sb	a1,-1(a3)
    486c:	0ac12783          	lw	a5,172(sp)
    4870:	41ac0733          	sub	a4,s8,s10
    4874:	02e12023          	sw	a4,32(sp)
    4878:	fff78713          	addi	a4,a5,-1
    487c:	00f12e23          	sw	a5,28(sp)
    4880:	06100613          	li	a2,97
    4884:	0ae12623          	sw	a4,172(sp)
    4888:	07000693          	li	a3,112
    488c:	00c88663          	beq	a7,a2,4898 <_vfprintf_r+0x2388>
    4890:	05000693          	li	a3,80
    4894:	04100893          	li	a7,65
    4898:	00100613          	li	a2,1
    489c:	ac0ff06f          	j	3b5c <_vfprintf_r+0x164c>
    48a0:	000a8693          	mv	a3,s5
    48a4:	00300613          	li	a2,3
    48a8:	c2dff06f          	j	44d4 <_vfprintf_r+0x1fc4>
    48ac:	01c12783          	lw	a5,28(sp)
    48b0:	00a7c583          	lbu	a1,10(a5)
    48b4:	fb5ff06f          	j	4868 <_vfprintf_r+0x2358>
    48b8:	0a714703          	lbu	a4,167(sp)
    48bc:	04c12c83          	lw	s9,76(sp)
    48c0:	00000a93          	li	s5,0
    48c4:	00070463          	beqz	a4,48cc <_vfprintf_r+0x23bc>
    48c8:	8f8fe06f          	j	29c0 <_vfprintf_r+0x4b0>
    48cc:	e69fd06f          	j	2734 <_vfprintf_r+0x224>
    48d0:	02012783          	lw	a5,32(sp)
    48d4:	01c12703          	lw	a4,28(sp)
    48d8:	1cf74863          	blt	a4,a5,4aa8 <_vfprintf_r+0x2598>
    48dc:	01c12783          	lw	a5,28(sp)
    48e0:	001cf713          	andi	a4,s9,1
    48e4:	00078b13          	mv	s6,a5
    48e8:	00070663          	beqz	a4,48f4 <_vfprintf_r+0x23e4>
    48ec:	02c12703          	lw	a4,44(sp)
    48f0:	00e78b33          	add	s6,a5,a4
    48f4:	400cfe13          	andi	t3,s9,1024
    48f8:	000e0663          	beqz	t3,4904 <_vfprintf_r+0x23f4>
    48fc:	01c12783          	lw	a5,28(sp)
    4900:	2ef04a63          	bgtz	a5,4bf4 <_vfprintf_r+0x26e4>
    4904:	fffb4693          	not	a3,s6
    4908:	41f6d693          	srai	a3,a3,0x1f
    490c:	00db7db3          	and	s11,s6,a3
    4910:	06700893          	li	a7,103
    4914:	02012423          	sw	zero,40(sp)
    4918:	02012223          	sw	zero,36(sp)
    491c:	b1cff06f          	j	3c38 <_vfprintf_r+0x1728>
    4920:	0c410613          	addi	a2,sp,196
    4924:	00048593          	mv	a1,s1
    4928:	00090513          	mv	a0,s2
    492c:	530000ef          	jal	4e5c <__sprint_r>
    4930:	00050463          	beqz	a0,4938 <_vfprintf_r+0x2428>
    4934:	a69fe06f          	j	339c <_vfprintf_r+0xe8c>
    4938:	000cc683          	lbu	a3,0(s9)
    493c:	0cc12603          	lw	a2,204(sp)
    4940:	00098593          	mv	a1,s3
    4944:	01000713          	li	a4,16
    4948:	00700813          	li	a6,7
    494c:	00dd0d33          	add	s10,s10,a3
    4950:	8b5ff06f          	j	4204 <_vfprintf_r+0x1cf4>
    4954:	00900513          	li	a0,9
    4958:	bf656c63          	bltu	a0,s6,3d50 <_vfprintf_r+0x1840>
    495c:	c74ff06f          	j	3dd0 <_vfprintf_r+0x18c0>
    4960:	fff00793          	li	a5,-1
    4964:	00f12623          	sw	a5,12(sp)
    4968:	f2dfd06f          	j	2894 <_vfprintf_r+0x384>
    496c:	02d00793          	li	a5,45
    4970:	0af103a3          	sb	a5,167(sp)
    4974:	02d00713          	li	a4,45
    4978:	d90ff06f          	j	3f08 <_vfprintf_r+0x19f8>
    497c:	0a714703          	lbu	a4,167(sp)
    4980:	01812a23          	sw	s8,20(sp)
    4984:	02012423          	sw	zero,40(sp)
    4988:	02012223          	sw	zero,36(sp)
    498c:	00012e23          	sw	zero,28(sp)
    4990:	000a8d93          	mv	s11,s5
    4994:	000a8b13          	mv	s6,s5
    4998:	00000a93          	li	s5,0
    499c:	00070463          	beqz	a4,49a4 <_vfprintf_r+0x2494>
    49a0:	820fe06f          	j	29c0 <_vfprintf_r+0x4b0>
    49a4:	d91fd06f          	j	2734 <_vfprintf_r+0x224>
    49a8:	00812503          	lw	a0,8(sp)
    49ac:	0c410613          	addi	a2,sp,196
    49b0:	00048593          	mv	a1,s1
    49b4:	4a8000ef          	jal	4e5c <__sprint_r>
    49b8:	00050463          	beqz	a0,49c0 <_vfprintf_r+0x24b0>
    49bc:	9e1fe06f          	j	339c <_vfprintf_r+0xe8c>
    49c0:	0ac12a83          	lw	s5,172(sp)
    49c4:	02012783          	lw	a5,32(sp)
    49c8:	0cc12603          	lw	a2,204(sp)
    49cc:	00098413          	mv	s0,s3
    49d0:	41578ab3          	sub	s5,a5,s5
    49d4:	ca9fe06f          	j	367c <_vfprintf_r+0x116c>
    49d8:	4ec18d13          	addi	s10,gp,1260 # 12dfc <keypad_map+0x13c>
    49dc:	d38ff06f          	j	3f14 <_vfprintf_r+0x1a04>
    49e0:	0ac12783          	lw	a5,172(sp)
    49e4:	00f12e23          	sw	a5,28(sp)
    49e8:	00070793          	mv	a5,a4
    49ec:	abdff06f          	j	44a8 <_vfprintf_r+0x1f98>
    49f0:	08010593          	addi	a1,sp,128
    49f4:	000b0513          	mv	a0,s6
    49f8:	04e12e23          	sw	a4,92(sp)
    49fc:	04c12c23          	sw	a2,88(sp)
    4a00:	05112a23          	sw	a7,84(sp)
    4a04:	04d12823          	sw	a3,80(sp)
    4a08:	09f12823          	sw	t6,144(sp)
    4a0c:	03f12423          	sw	t6,40(sp)
    4a10:	09e12a23          	sw	t5,148(sp)
    4a14:	03e12223          	sw	t5,36(sp)
    4a18:	09d12c23          	sw	t4,152(sp)
    4a1c:	03d12023          	sw	t4,32(sp)
    4a20:	00b12e23          	sw	a1,28(sp)
    4a24:	09812e23          	sw	s8,156(sp)
    4a28:	08012023          	sw	zero,128(sp)
    4a2c:	08012223          	sw	zero,132(sp)
    4a30:	08012423          	sw	zero,136(sp)
    4a34:	08012623          	sw	zero,140(sp)
    4a38:	6940a0ef          	jal	f0cc <__eqtf2>
    4a3c:	01c12583          	lw	a1,28(sp)
    4a40:	02012e83          	lw	t4,32(sp)
    4a44:	02412f03          	lw	t5,36(sp)
    4a48:	02812f83          	lw	t6,40(sp)
    4a4c:	05012683          	lw	a3,80(sp)
    4a50:	05412883          	lw	a7,84(sp)
    4a54:	05812603          	lw	a2,88(sp)
    4a58:	05c12703          	lw	a4,92(sp)
    4a5c:	26051c63          	bnez	a0,4cd4 <_vfprintf_r+0x27c4>
    4a60:	0ac12783          	lw	a5,172(sp)
    4a64:	00f70733          	add	a4,a4,a5
    4a68:	00f12e23          	sw	a5,28(sp)
    4a6c:	41a707b3          	sub	a5,a4,s10
    4a70:	02f12023          	sw	a5,32(sp)
    4a74:	01c12783          	lw	a5,28(sp)
    4a78:	001cf713          	andi	a4,s9,1
    4a7c:	01576733          	or	a4,a4,s5
    4a80:	26f05463          	blez	a5,4ce8 <_vfprintf_r+0x27d8>
    4a84:	22071863          	bnez	a4,4cb4 <_vfprintf_r+0x27a4>
    4a88:	01c12b03          	lw	s6,28(sp)
    4a8c:	06600893          	li	a7,102
    4a90:	400cfe13          	andi	t3,s9,1024
    4a94:	160e1263          	bnez	t3,4bf8 <_vfprintf_r+0x26e8>
    4a98:	fffb4693          	not	a3,s6
    4a9c:	41f6d693          	srai	a3,a3,0x1f
    4aa0:	00db7db3          	and	s11,s6,a3
    4aa4:	e71ff06f          	j	4914 <_vfprintf_r+0x2404>
    4aa8:	02012783          	lw	a5,32(sp)
    4aac:	02c12703          	lw	a4,44(sp)
    4ab0:	06700893          	li	a7,103
    4ab4:	00e78b33          	add	s6,a5,a4
    4ab8:	01c12783          	lw	a5,28(sp)
    4abc:	fcf04ae3          	bgtz	a5,4a90 <_vfprintf_r+0x2580>
    4ac0:	40fb0f33          	sub	t5,s6,a5
    4ac4:	001f0b13          	addi	s6,t5,1
    4ac8:	fffb4693          	not	a3,s6
    4acc:	41f6d693          	srai	a3,a3,0x1f
    4ad0:	00db7db3          	and	s11,s6,a3
    4ad4:	e41ff06f          	j	4914 <_vfprintf_r+0x2404>
    4ad8:	000c8e93          	mv	t4,s9
    4adc:	b94fe06f          	j	2e70 <_vfprintf_r+0x960>
    4ae0:	00013837          	lui	a6,0x13
    4ae4:	ff000593          	li	a1,-16
    4ae8:	40a00ab3          	neg	s5,a0
    4aec:	1a880813          	addi	a6,a6,424 # 131a8 <zeroes.0>
    4af0:	06b55863          	bge	a0,a1,4b60 <_vfprintf_r+0x2650>
    4af4:	01212e23          	sw	s2,28(sp)
    4af8:	01000b13          	li	s6,16
    4afc:	00700c13          	li	s8,7
    4b00:	00080913          	mv	s2,a6
    4b04:	00c0006f          	j	4b10 <_vfprintf_r+0x2600>
    4b08:	ff0a8a93          	addi	s5,s5,-16 # 3ffdfff0 <_memory_end+0x3ffbfff0>
    4b0c:	055b5663          	bge	s6,s5,4b58 <_vfprintf_r+0x2648>
    4b10:	01060613          	addi	a2,a2,16
    4b14:	00170713          	addi	a4,a4,1 # 3ffc0001 <_memory_end+0x3ffa0001>
    4b18:	01242023          	sw	s2,0(s0)
    4b1c:	01642223          	sw	s6,4(s0)
    4b20:	0cc12623          	sw	a2,204(sp)
    4b24:	0ce12423          	sw	a4,200(sp)
    4b28:	00840413          	addi	s0,s0,8
    4b2c:	fcec5ee3          	bge	s8,a4,4b08 <_vfprintf_r+0x25f8>
    4b30:	00812503          	lw	a0,8(sp)
    4b34:	0c410613          	addi	a2,sp,196
    4b38:	00048593          	mv	a1,s1
    4b3c:	320000ef          	jal	4e5c <__sprint_r>
    4b40:	00050463          	beqz	a0,4b48 <_vfprintf_r+0x2638>
    4b44:	859fe06f          	j	339c <_vfprintf_r+0xe8c>
    4b48:	0cc12603          	lw	a2,204(sp)
    4b4c:	0c812703          	lw	a4,200(sp)
    4b50:	00098413          	mv	s0,s3
    4b54:	fb5ff06f          	j	4b08 <_vfprintf_r+0x25f8>
    4b58:	00090813          	mv	a6,s2
    4b5c:	01c12903          	lw	s2,28(sp)
    4b60:	01560633          	add	a2,a2,s5
    4b64:	00170713          	addi	a4,a4,1
    4b68:	01042023          	sw	a6,0(s0)
    4b6c:	01542223          	sw	s5,4(s0)
    4b70:	0cc12623          	sw	a2,204(sp)
    4b74:	0ce12423          	sw	a4,200(sp)
    4b78:	00700593          	li	a1,7
    4b7c:	aee5d263          	bge	a1,a4,3e60 <_vfprintf_r+0x1950>
    4b80:	00812503          	lw	a0,8(sp)
    4b84:	0c410613          	addi	a2,sp,196
    4b88:	00048593          	mv	a1,s1
    4b8c:	2d0000ef          	jal	4e5c <__sprint_r>
    4b90:	00050463          	beqz	a0,4b98 <_vfprintf_r+0x2688>
    4b94:	809fe06f          	j	339c <_vfprintf_r+0xe8c>
    4b98:	0cc12603          	lw	a2,204(sp)
    4b9c:	0c812703          	lw	a4,200(sp)
    4ba0:	00098413          	mv	s0,s3
    4ba4:	be4ff06f          	j	3f88 <_vfprintf_r+0x1a78>
    4ba8:	0b610693          	addi	a3,sp,182
    4bac:	00061863          	bnez	a2,4bbc <_vfprintf_r+0x26ac>
    4bb0:	03000693          	li	a3,48
    4bb4:	0ad10b23          	sb	a3,182(sp)
    4bb8:	0b710693          	addi	a3,sp,183
    4bbc:	19010793          	addi	a5,sp,400
    4bc0:	40f68633          	sub	a2,a3,a5
    4bc4:	03070713          	addi	a4,a4,48
    4bc8:	0dd60793          	addi	a5,a2,221
    4bcc:	00e68023          	sb	a4,0(a3)
    4bd0:	04f12023          	sw	a5,64(sp)
    4bd4:	820ff06f          	j	3bf4 <_vfprintf_r+0x16e4>
    4bd8:	00012823          	sw	zero,16(sp)
    4bdc:	00600a93          	li	s5,6
    4be0:	f3dfd06f          	j	2b1c <_vfprintf_r+0x60c>
    4be4:	001cf713          	andi	a4,s9,1
    4be8:	00071463          	bnez	a4,4bf0 <_vfprintf_r+0x26e0>
    4bec:	828ff06f          	j	3c14 <_vfprintf_r+0x1704>
    4bf0:	81cff06f          	j	3c0c <_vfprintf_r+0x16fc>
    4bf4:	06700893          	li	a7,103
    4bf8:	03c12603          	lw	a2,60(sp)
    4bfc:	0ff00693          	li	a3,255
    4c00:	00064703          	lbu	a4,0(a2)
    4c04:	14d70463          	beq	a4,a3,4d4c <_vfprintf_r+0x283c>
    4c08:	01c12783          	lw	a5,28(sp)
    4c0c:	00000513          	li	a0,0
    4c10:	00000593          	li	a1,0
    4c14:	00f75e63          	bge	a4,a5,4c30 <_vfprintf_r+0x2720>
    4c18:	40e787b3          	sub	a5,a5,a4
    4c1c:	00164703          	lbu	a4,1(a2)
    4c20:	04070463          	beqz	a4,4c68 <_vfprintf_r+0x2758>
    4c24:	00158593          	addi	a1,a1,1
    4c28:	00160613          	addi	a2,a2,1
    4c2c:	fed714e3          	bne	a4,a3,4c14 <_vfprintf_r+0x2704>
    4c30:	02c12e23          	sw	a2,60(sp)
    4c34:	02b12223          	sw	a1,36(sp)
    4c38:	02a12423          	sw	a0,40(sp)
    4c3c:	00f12e23          	sw	a5,28(sp)
    4c40:	02812783          	lw	a5,40(sp)
    4c44:	02412703          	lw	a4,36(sp)
    4c48:	00e78733          	add	a4,a5,a4
    4c4c:	04812783          	lw	a5,72(sp)
    4c50:	02f70733          	mul	a4,a4,a5
    4c54:	01670b33          	add	s6,a4,s6
    4c58:	fffb4693          	not	a3,s6
    4c5c:	41f6d693          	srai	a3,a3,0x1f
    4c60:	00db7db3          	and	s11,s6,a3
    4c64:	fd5fe06f          	j	3c38 <_vfprintf_r+0x1728>
    4c68:	00064703          	lbu	a4,0(a2)
    4c6c:	00150513          	addi	a0,a0,1
    4c70:	fbdff06f          	j	4c2c <_vfprintf_r+0x271c>
    4c74:	00090c13          	mv	s8,s2
    4c78:	001a8693          	addi	a3,s5,1
    4c7c:	02412883          	lw	a7,36(sp)
    4c80:	02812c83          	lw	s9,40(sp)
    4c84:	04012b83          	lw	s7,64(sp)
    4c88:	04c12403          	lw	s0,76(sp)
    4c8c:	02012903          	lw	s2,32(sp)
    4c90:	05012483          	lw	s1,80(sp)
    4c94:	05412d03          	lw	s10,84(sp)
    4c98:	00dc06b3          	add	a3,s8,a3
    4c9c:	03000613          	li	a2,48
    4ca0:	bc0ac6e3          	bltz	s5,486c <_vfprintf_r+0x235c>
    4ca4:	001c0c13          	addi	s8,s8,1
    4ca8:	fecc0fa3          	sb	a2,-1(s8)
    4cac:	fedc1ce3          	bne	s8,a3,4ca4 <_vfprintf_r+0x2794>
    4cb0:	bbdff06f          	j	486c <_vfprintf_r+0x235c>
    4cb4:	02c12703          	lw	a4,44(sp)
    4cb8:	06600893          	li	a7,102
    4cbc:	00ea8f33          	add	t5,s5,a4
    4cc0:	00ff0b33          	add	s6,t5,a5
    4cc4:	dcdff06f          	j	4a90 <_vfprintf_r+0x2580>
    4cc8:	4f018793          	addi	a5,gp,1264 # 12e00 <keypad_map+0x140>
    4ccc:	00f12e23          	sw	a5,28(sp)
    4cd0:	965ff06f          	j	4634 <_vfprintf_r+0x2124>
    4cd4:	00100513          	li	a0,1
    4cd8:	40d506b3          	sub	a3,a0,a3
    4cdc:	0ad12623          	sw	a3,172(sp)
    4ce0:	00d70733          	add	a4,a4,a3
    4ce4:	f58ff06f          	j	443c <_vfprintf_r+0x1f2c>
    4ce8:	00071a63          	bnez	a4,4cfc <_vfprintf_r+0x27ec>
    4cec:	00100d93          	li	s11,1
    4cf0:	06600893          	li	a7,102
    4cf4:	00100b13          	li	s6,1
    4cf8:	c1dff06f          	j	4914 <_vfprintf_r+0x2404>
    4cfc:	02c12783          	lw	a5,44(sp)
    4d00:	06600893          	li	a7,102
    4d04:	00178f13          	addi	t5,a5,1
    4d08:	015f0b33          	add	s6,t5,s5
    4d0c:	fffb4693          	not	a3,s6
    4d10:	41f6d693          	srai	a3,a3,0x1f
    4d14:	00db7db3          	and	s11,s6,a3
    4d18:	bfdff06f          	j	4914 <_vfprintf_r+0x2404>
    4d1c:	00200793          	li	a5,2
    4d20:	04f12023          	sw	a5,64(sp)
    4d24:	ed1fe06f          	j	3bf4 <_vfprintf_r+0x16e4>
    4d28:	01412783          	lw	a5,20(sp)
    4d2c:	0007aa83          	lw	s5,0(a5)
    4d30:	00478793          	addi	a5,a5,4
    4d34:	000ad463          	bgez	s5,4d3c <_vfprintf_r+0x282c>
    4d38:	fff00a93          	li	s5,-1
    4d3c:	00194883          	lbu	a7,1(s2)
    4d40:	00f12a23          	sw	a5,20(sp)
    4d44:	00068913          	mv	s2,a3
    4d48:	96dfd06f          	j	26b4 <_vfprintf_r+0x1a4>
    4d4c:	02012423          	sw	zero,40(sp)
    4d50:	02012223          	sw	zero,36(sp)
    4d54:	eedff06f          	j	4c40 <_vfprintf_r+0x2730>
    4d58:	04500613          	li	a2,69
    4d5c:	08010593          	addi	a1,sp,128
    4d60:	edcff06f          	j	443c <_vfprintf_r+0x1f2c>
    4d64:	00c4d783          	lhu	a5,12(s1)
    4d68:	0407e793          	ori	a5,a5,64
    4d6c:	00f49623          	sh	a5,12(s1)
    4d70:	af1fd06f          	j	2860 <_vfprintf_r+0x350>

00004d74 <vfprintf>:
    4d74:	00014737          	lui	a4,0x14
    4d78:	00050793          	mv	a5,a0
    4d7c:	e3472503          	lw	a0,-460(a4) # 13e34 <_impure_ptr>
    4d80:	00060693          	mv	a3,a2
    4d84:	00058613          	mv	a2,a1
    4d88:	00078593          	mv	a1,a5
    4d8c:	f84fd06f          	j	2510 <_vfprintf_r>

00004d90 <__sbprintf>:
    4d90:	b8010113          	addi	sp,sp,-1152
    4d94:	00c59783          	lh	a5,12(a1)
    4d98:	00e5d703          	lhu	a4,14(a1)
    4d9c:	46812c23          	sw	s0,1144(sp)
    4da0:	00058413          	mv	s0,a1
    4da4:	000105b7          	lui	a1,0x10
    4da8:	ffd58593          	addi	a1,a1,-3 # fffd <__multf3+0xc05>
    4dac:	06442e03          	lw	t3,100(s0)
    4db0:	01c42303          	lw	t1,28(s0)
    4db4:	02442883          	lw	a7,36(s0)
    4db8:	01071713          	slli	a4,a4,0x10
    4dbc:	00b7f7b3          	and	a5,a5,a1
    4dc0:	00e7e7b3          	or	a5,a5,a4
    4dc4:	40000813          	li	a6,1024
    4dc8:	00f12a23          	sw	a5,20(sp)
    4dcc:	00810593          	addi	a1,sp,8
    4dd0:	07010793          	addi	a5,sp,112
    4dd4:	46912a23          	sw	s1,1140(sp)
    4dd8:	47212823          	sw	s2,1136(sp)
    4ddc:	46112e23          	sw	ra,1148(sp)
    4de0:	00050913          	mv	s2,a0
    4de4:	07c12623          	sw	t3,108(sp)
    4de8:	02612223          	sw	t1,36(sp)
    4dec:	03112623          	sw	a7,44(sp)
    4df0:	00f12423          	sw	a5,8(sp)
    4df4:	00f12c23          	sw	a5,24(sp)
    4df8:	01012823          	sw	a6,16(sp)
    4dfc:	01012e23          	sw	a6,28(sp)
    4e00:	02012023          	sw	zero,32(sp)
    4e04:	f0cfd0ef          	jal	2510 <_vfprintf_r>
    4e08:	00050493          	mv	s1,a0
    4e0c:	02055c63          	bgez	a0,4e44 <__sbprintf+0xb4>
    4e10:	01415783          	lhu	a5,20(sp)
    4e14:	0407f793          	andi	a5,a5,64
    4e18:	00078863          	beqz	a5,4e28 <__sbprintf+0x98>
    4e1c:	00c45783          	lhu	a5,12(s0)
    4e20:	0407e793          	ori	a5,a5,64
    4e24:	00f41623          	sh	a5,12(s0)
    4e28:	47c12083          	lw	ra,1148(sp)
    4e2c:	47812403          	lw	s0,1144(sp)
    4e30:	47012903          	lw	s2,1136(sp)
    4e34:	00048513          	mv	a0,s1
    4e38:	47412483          	lw	s1,1140(sp)
    4e3c:	48010113          	addi	sp,sp,1152
    4e40:	00008067          	ret
    4e44:	00810593          	addi	a1,sp,8
    4e48:	00090513          	mv	a0,s2
    4e4c:	2a8000ef          	jal	50f4 <_fflush_r>
    4e50:	fc0500e3          	beqz	a0,4e10 <__sbprintf+0x80>
    4e54:	fff00493          	li	s1,-1
    4e58:	fb9ff06f          	j	4e10 <__sbprintf+0x80>

00004e5c <__sprint_r>:
    4e5c:	00862783          	lw	a5,8(a2)
    4e60:	ff010113          	addi	sp,sp,-16
    4e64:	00812423          	sw	s0,8(sp)
    4e68:	00112623          	sw	ra,12(sp)
    4e6c:	00060413          	mv	s0,a2
    4e70:	00079e63          	bnez	a5,4e8c <__sprint_r+0x30>
    4e74:	00c12083          	lw	ra,12(sp)
    4e78:	00042223          	sw	zero,4(s0)
    4e7c:	00812403          	lw	s0,8(sp)
    4e80:	00000513          	li	a0,0
    4e84:	01010113          	addi	sp,sp,16
    4e88:	00008067          	ret
    4e8c:	6e8000ef          	jal	5574 <__sfvwrite_r>
    4e90:	00c12083          	lw	ra,12(sp)
    4e94:	00042423          	sw	zero,8(s0)
    4e98:	00042223          	sw	zero,4(s0)
    4e9c:	00812403          	lw	s0,8(sp)
    4ea0:	01010113          	addi	sp,sp,16
    4ea4:	00008067          	ret

00004ea8 <__sflush_r>:
    4ea8:	00c59703          	lh	a4,12(a1)
    4eac:	fe010113          	addi	sp,sp,-32
    4eb0:	00812c23          	sw	s0,24(sp)
    4eb4:	01312623          	sw	s3,12(sp)
    4eb8:	00112e23          	sw	ra,28(sp)
    4ebc:	00877793          	andi	a5,a4,8
    4ec0:	00058413          	mv	s0,a1
    4ec4:	00050993          	mv	s3,a0
    4ec8:	12079063          	bnez	a5,4fe8 <__sflush_r+0x140>
    4ecc:	000017b7          	lui	a5,0x1
    4ed0:	80078793          	addi	a5,a5,-2048 # 800 <main+0x514>
    4ed4:	0045a683          	lw	a3,4(a1)
    4ed8:	00f767b3          	or	a5,a4,a5
    4edc:	00f59623          	sh	a5,12(a1)
    4ee0:	18d05263          	blez	a3,5064 <__sflush_r+0x1bc>
    4ee4:	02842803          	lw	a6,40(s0)
    4ee8:	0e080463          	beqz	a6,4fd0 <__sflush_r+0x128>
    4eec:	00912a23          	sw	s1,20(sp)
    4ef0:	01371693          	slli	a3,a4,0x13
    4ef4:	0009a483          	lw	s1,0(s3)
    4ef8:	0009a023          	sw	zero,0(s3)
    4efc:	01c42583          	lw	a1,28(s0)
    4f00:	1606ce63          	bltz	a3,507c <__sflush_r+0x1d4>
    4f04:	00000613          	li	a2,0
    4f08:	00100693          	li	a3,1
    4f0c:	00098513          	mv	a0,s3
    4f10:	000800e7          	jalr	a6
    4f14:	fff00793          	li	a5,-1
    4f18:	00050613          	mv	a2,a0
    4f1c:	1af50463          	beq	a0,a5,50c4 <__sflush_r+0x21c>
    4f20:	00c41783          	lh	a5,12(s0)
    4f24:	02842803          	lw	a6,40(s0)
    4f28:	01c42583          	lw	a1,28(s0)
    4f2c:	0047f793          	andi	a5,a5,4
    4f30:	00078e63          	beqz	a5,4f4c <__sflush_r+0xa4>
    4f34:	00442703          	lw	a4,4(s0)
    4f38:	03042783          	lw	a5,48(s0)
    4f3c:	40e60633          	sub	a2,a2,a4
    4f40:	00078663          	beqz	a5,4f4c <__sflush_r+0xa4>
    4f44:	03c42783          	lw	a5,60(s0)
    4f48:	40f60633          	sub	a2,a2,a5
    4f4c:	00000693          	li	a3,0
    4f50:	00098513          	mv	a0,s3
    4f54:	000800e7          	jalr	a6
    4f58:	fff00793          	li	a5,-1
    4f5c:	12f51463          	bne	a0,a5,5084 <__sflush_r+0x1dc>
    4f60:	0009a683          	lw	a3,0(s3)
    4f64:	01d00793          	li	a5,29
    4f68:	00c41703          	lh	a4,12(s0)
    4f6c:	16d7ea63          	bltu	a5,a3,50e0 <__sflush_r+0x238>
    4f70:	204007b7          	lui	a5,0x20400
    4f74:	00178793          	addi	a5,a5,1 # 20400001 <_memory_end+0x203e0001>
    4f78:	00d7d7b3          	srl	a5,a5,a3
    4f7c:	0017f793          	andi	a5,a5,1
    4f80:	16078063          	beqz	a5,50e0 <__sflush_r+0x238>
    4f84:	01042603          	lw	a2,16(s0)
    4f88:	fffff7b7          	lui	a5,0xfffff
    4f8c:	7ff78793          	addi	a5,a5,2047 # fffff7ff <_memory_end+0xfffdf7ff>
    4f90:	00f777b3          	and	a5,a4,a5
    4f94:	00f41623          	sh	a5,12(s0)
    4f98:	00042223          	sw	zero,4(s0)
    4f9c:	00c42023          	sw	a2,0(s0)
    4fa0:	01371793          	slli	a5,a4,0x13
    4fa4:	0007d463          	bgez	a5,4fac <__sflush_r+0x104>
    4fa8:	10068263          	beqz	a3,50ac <__sflush_r+0x204>
    4fac:	03042583          	lw	a1,48(s0)
    4fb0:	0099a023          	sw	s1,0(s3)
    4fb4:	10058463          	beqz	a1,50bc <__sflush_r+0x214>
    4fb8:	04040793          	addi	a5,s0,64
    4fbc:	00f58663          	beq	a1,a5,4fc8 <__sflush_r+0x120>
    4fc0:	00098513          	mv	a0,s3
    4fc4:	121010ef          	jal	68e4 <_free_r>
    4fc8:	01412483          	lw	s1,20(sp)
    4fcc:	02042823          	sw	zero,48(s0)
    4fd0:	00000513          	li	a0,0
    4fd4:	01c12083          	lw	ra,28(sp)
    4fd8:	01812403          	lw	s0,24(sp)
    4fdc:	00c12983          	lw	s3,12(sp)
    4fe0:	02010113          	addi	sp,sp,32
    4fe4:	00008067          	ret
    4fe8:	01212823          	sw	s2,16(sp)
    4fec:	0105a903          	lw	s2,16(a1)
    4ff0:	08090263          	beqz	s2,5074 <__sflush_r+0x1cc>
    4ff4:	00912a23          	sw	s1,20(sp)
    4ff8:	0005a483          	lw	s1,0(a1)
    4ffc:	00377713          	andi	a4,a4,3
    5000:	0125a023          	sw	s2,0(a1)
    5004:	412484b3          	sub	s1,s1,s2
    5008:	00000793          	li	a5,0
    500c:	00071463          	bnez	a4,5014 <__sflush_r+0x16c>
    5010:	0145a783          	lw	a5,20(a1)
    5014:	00f42423          	sw	a5,8(s0)
    5018:	00904863          	bgtz	s1,5028 <__sflush_r+0x180>
    501c:	0540006f          	j	5070 <__sflush_r+0x1c8>
    5020:	00a90933          	add	s2,s2,a0
    5024:	04905663          	blez	s1,5070 <__sflush_r+0x1c8>
    5028:	02442783          	lw	a5,36(s0)
    502c:	01c42583          	lw	a1,28(s0)
    5030:	00048693          	mv	a3,s1
    5034:	00090613          	mv	a2,s2
    5038:	00098513          	mv	a0,s3
    503c:	000780e7          	jalr	a5
    5040:	40a484b3          	sub	s1,s1,a0
    5044:	fca04ee3          	bgtz	a0,5020 <__sflush_r+0x178>
    5048:	00c41703          	lh	a4,12(s0)
    504c:	01012903          	lw	s2,16(sp)
    5050:	04076713          	ori	a4,a4,64
    5054:	01412483          	lw	s1,20(sp)
    5058:	00e41623          	sh	a4,12(s0)
    505c:	fff00513          	li	a0,-1
    5060:	f75ff06f          	j	4fd4 <__sflush_r+0x12c>
    5064:	03c5a683          	lw	a3,60(a1)
    5068:	e6d04ee3          	bgtz	a3,4ee4 <__sflush_r+0x3c>
    506c:	f65ff06f          	j	4fd0 <__sflush_r+0x128>
    5070:	01412483          	lw	s1,20(sp)
    5074:	01012903          	lw	s2,16(sp)
    5078:	f59ff06f          	j	4fd0 <__sflush_r+0x128>
    507c:	05042603          	lw	a2,80(s0)
    5080:	eadff06f          	j	4f2c <__sflush_r+0x84>
    5084:	00c41703          	lh	a4,12(s0)
    5088:	01042683          	lw	a3,16(s0)
    508c:	fffff7b7          	lui	a5,0xfffff
    5090:	7ff78793          	addi	a5,a5,2047 # fffff7ff <_memory_end+0xfffdf7ff>
    5094:	00f777b3          	and	a5,a4,a5
    5098:	00f41623          	sh	a5,12(s0)
    509c:	00042223          	sw	zero,4(s0)
    50a0:	00d42023          	sw	a3,0(s0)
    50a4:	01371793          	slli	a5,a4,0x13
    50a8:	f007d2e3          	bgez	a5,4fac <__sflush_r+0x104>
    50ac:	03042583          	lw	a1,48(s0)
    50b0:	04a42823          	sw	a0,80(s0)
    50b4:	0099a023          	sw	s1,0(s3)
    50b8:	f00590e3          	bnez	a1,4fb8 <__sflush_r+0x110>
    50bc:	01412483          	lw	s1,20(sp)
    50c0:	f11ff06f          	j	4fd0 <__sflush_r+0x128>
    50c4:	0009a783          	lw	a5,0(s3)
    50c8:	e4078ce3          	beqz	a5,4f20 <__sflush_r+0x78>
    50cc:	01d00713          	li	a4,29
    50d0:	00e78c63          	beq	a5,a4,50e8 <__sflush_r+0x240>
    50d4:	01600713          	li	a4,22
    50d8:	00e78863          	beq	a5,a4,50e8 <__sflush_r+0x240>
    50dc:	00c41703          	lh	a4,12(s0)
    50e0:	04076713          	ori	a4,a4,64
    50e4:	f71ff06f          	j	5054 <__sflush_r+0x1ac>
    50e8:	0099a023          	sw	s1,0(s3)
    50ec:	01412483          	lw	s1,20(sp)
    50f0:	ee1ff06f          	j	4fd0 <__sflush_r+0x128>

000050f4 <_fflush_r>:
    50f4:	fe010113          	addi	sp,sp,-32
    50f8:	00812c23          	sw	s0,24(sp)
    50fc:	00112e23          	sw	ra,28(sp)
    5100:	00050413          	mv	s0,a0
    5104:	00050663          	beqz	a0,5110 <_fflush_r+0x1c>
    5108:	03452783          	lw	a5,52(a0)
    510c:	02078a63          	beqz	a5,5140 <_fflush_r+0x4c>
    5110:	00c59783          	lh	a5,12(a1)
    5114:	00079c63          	bnez	a5,512c <_fflush_r+0x38>
    5118:	01c12083          	lw	ra,28(sp)
    511c:	01812403          	lw	s0,24(sp)
    5120:	00000513          	li	a0,0
    5124:	02010113          	addi	sp,sp,32
    5128:	00008067          	ret
    512c:	00040513          	mv	a0,s0
    5130:	01812403          	lw	s0,24(sp)
    5134:	01c12083          	lw	ra,28(sp)
    5138:	02010113          	addi	sp,sp,32
    513c:	d6dff06f          	j	4ea8 <__sflush_r>
    5140:	00b12623          	sw	a1,12(sp)
    5144:	3d0000ef          	jal	5514 <__sinit>
    5148:	00c12583          	lw	a1,12(sp)
    514c:	fc5ff06f          	j	5110 <_fflush_r+0x1c>

00005150 <fflush>:
    5150:	06050263          	beqz	a0,51b4 <fflush+0x64>
    5154:	000147b7          	lui	a5,0x14
    5158:	00050593          	mv	a1,a0
    515c:	e347a503          	lw	a0,-460(a5) # 13e34 <_impure_ptr>
    5160:	00050663          	beqz	a0,516c <fflush+0x1c>
    5164:	03452783          	lw	a5,52(a0)
    5168:	00078c63          	beqz	a5,5180 <fflush+0x30>
    516c:	00c59783          	lh	a5,12(a1)
    5170:	00079663          	bnez	a5,517c <fflush+0x2c>
    5174:	00000513          	li	a0,0
    5178:	00008067          	ret
    517c:	d2dff06f          	j	4ea8 <__sflush_r>
    5180:	fe010113          	addi	sp,sp,-32
    5184:	00b12623          	sw	a1,12(sp)
    5188:	00a12423          	sw	a0,8(sp)
    518c:	00112e23          	sw	ra,28(sp)
    5190:	384000ef          	jal	5514 <__sinit>
    5194:	00c12583          	lw	a1,12(sp)
    5198:	00812503          	lw	a0,8(sp)
    519c:	00c59783          	lh	a5,12(a1)
    51a0:	02079863          	bnez	a5,51d0 <fflush+0x80>
    51a4:	01c12083          	lw	ra,28(sp)
    51a8:	00000513          	li	a0,0
    51ac:	02010113          	addi	sp,sp,32
    51b0:	00008067          	ret
    51b4:	00014637          	lui	a2,0x14
    51b8:	000055b7          	lui	a1,0x5
    51bc:	00013537          	lui	a0,0x13
    51c0:	86060613          	addi	a2,a2,-1952 # 13860 <__sglue>
    51c4:	0f458593          	addi	a1,a1,244 # 50f4 <_fflush_r>
    51c8:	74050513          	addi	a0,a0,1856 # 13740 <_impure_data>
    51cc:	0b90006f          	j	5a84 <_fwalk_sglue>
    51d0:	01c12083          	lw	ra,28(sp)
    51d4:	02010113          	addi	sp,sp,32
    51d8:	cd1ff06f          	j	4ea8 <__sflush_r>

000051dc <__fp_lock>:
    51dc:	00000513          	li	a0,0
    51e0:	00008067          	ret

000051e4 <stdio_exit_handler>:
    51e4:	00014637          	lui	a2,0x14
    51e8:	0000b5b7          	lui	a1,0xb
    51ec:	00013537          	lui	a0,0x13
    51f0:	86060613          	addi	a2,a2,-1952 # 13860 <__sglue>
    51f4:	f1c58593          	addi	a1,a1,-228 # af1c <_fclose_r>
    51f8:	74050513          	addi	a0,a0,1856 # 13740 <_impure_data>
    51fc:	0890006f          	j	5a84 <_fwalk_sglue>

00005200 <cleanup_stdio>:
    5200:	00452583          	lw	a1,4(a0)
    5204:	ff010113          	addi	sp,sp,-16
    5208:	000147b7          	lui	a5,0x14
    520c:	00812423          	sw	s0,8(sp)
    5210:	00112623          	sw	ra,12(sp)
    5214:	e6478793          	addi	a5,a5,-412 # 13e64 <__sf>
    5218:	00050413          	mv	s0,a0
    521c:	00f58463          	beq	a1,a5,5224 <cleanup_stdio+0x24>
    5220:	4fd050ef          	jal	af1c <_fclose_r>
    5224:	00842583          	lw	a1,8(s0)
    5228:	000147b7          	lui	a5,0x14
    522c:	ecc78793          	addi	a5,a5,-308 # 13ecc <__sf+0x68>
    5230:	00f58663          	beq	a1,a5,523c <cleanup_stdio+0x3c>
    5234:	00040513          	mv	a0,s0
    5238:	4e5050ef          	jal	af1c <_fclose_r>
    523c:	00c42583          	lw	a1,12(s0)
    5240:	000147b7          	lui	a5,0x14
    5244:	f3478793          	addi	a5,a5,-204 # 13f34 <__sf+0xd0>
    5248:	00f58c63          	beq	a1,a5,5260 <cleanup_stdio+0x60>
    524c:	00040513          	mv	a0,s0
    5250:	00812403          	lw	s0,8(sp)
    5254:	00c12083          	lw	ra,12(sp)
    5258:	01010113          	addi	sp,sp,16
    525c:	4c10506f          	j	af1c <_fclose_r>
    5260:	00c12083          	lw	ra,12(sp)
    5264:	00812403          	lw	s0,8(sp)
    5268:	01010113          	addi	sp,sp,16
    526c:	00008067          	ret

00005270 <__fp_unlock>:
    5270:	00000513          	li	a0,0
    5274:	00008067          	ret

00005278 <global_stdio_init.part.0>:
    5278:	fe010113          	addi	sp,sp,-32
    527c:	000057b7          	lui	a5,0x5
    5280:	00812c23          	sw	s0,24(sp)
    5284:	00014737          	lui	a4,0x14
    5288:	1e478793          	addi	a5,a5,484 # 51e4 <stdio_exit_handler>
    528c:	00014437          	lui	s0,0x14
    5290:	00014537          	lui	a0,0x14
    5294:	e6440413          	addi	s0,s0,-412 # 13e64 <__sf>
    5298:	00112e23          	sw	ra,28(sp)
    529c:	00912a23          	sw	s1,20(sp)
    52a0:	01212823          	sw	s2,16(sp)
    52a4:	01312623          	sw	s3,12(sp)
    52a8:	01412423          	sw	s4,8(sp)
    52ac:	fcf72223          	sw	a5,-60(a4) # 13fc4 <__stdio_exit_handler>
    52b0:	00800613          	li	a2,8
    52b4:	00400793          	li	a5,4
    52b8:	00000593          	li	a1,0
    52bc:	ec050513          	addi	a0,a0,-320 # 13ec0 <__sf+0x5c>
    52c0:	00f42623          	sw	a5,12(s0)
    52c4:	00042023          	sw	zero,0(s0)
    52c8:	00042223          	sw	zero,4(s0)
    52cc:	00042423          	sw	zero,8(s0)
    52d0:	06042223          	sw	zero,100(s0)
    52d4:	00042823          	sw	zero,16(s0)
    52d8:	00042a23          	sw	zero,20(s0)
    52dc:	00042c23          	sw	zero,24(s0)
    52e0:	030010ef          	jal	6310 <memset>
    52e4:	000107b7          	lui	a5,0x10
    52e8:	00006a37          	lui	s4,0x6
    52ec:	000069b7          	lui	s3,0x6
    52f0:	00006937          	lui	s2,0x6
    52f4:	000064b7          	lui	s1,0x6
    52f8:	00014537          	lui	a0,0x14
    52fc:	b38a0a13          	addi	s4,s4,-1224 # 5b38 <__sread>
    5300:	b9c98993          	addi	s3,s3,-1124 # 5b9c <__swrite>
    5304:	c2490913          	addi	s2,s2,-988 # 5c24 <__sseek>
    5308:	c9c48493          	addi	s1,s1,-868 # 5c9c <__sclose>
    530c:	00978793          	addi	a5,a5,9 # 10009 <__multf3+0xc11>
    5310:	00800613          	li	a2,8
    5314:	00000593          	li	a1,0
    5318:	f2850513          	addi	a0,a0,-216 # 13f28 <__sf+0xc4>
    531c:	03442023          	sw	s4,32(s0)
    5320:	03342223          	sw	s3,36(s0)
    5324:	03242423          	sw	s2,40(s0)
    5328:	02942623          	sw	s1,44(s0)
    532c:	06f42a23          	sw	a5,116(s0)
    5330:	00842e23          	sw	s0,28(s0)
    5334:	06042423          	sw	zero,104(s0)
    5338:	06042623          	sw	zero,108(s0)
    533c:	06042823          	sw	zero,112(s0)
    5340:	0c042623          	sw	zero,204(s0)
    5344:	06042c23          	sw	zero,120(s0)
    5348:	06042e23          	sw	zero,124(s0)
    534c:	08042023          	sw	zero,128(s0)
    5350:	7c1000ef          	jal	6310 <memset>
    5354:	000207b7          	lui	a5,0x20
    5358:	00014537          	lui	a0,0x14
    535c:	00014737          	lui	a4,0x14
    5360:	01278793          	addi	a5,a5,18 # 20012 <_memory_end+0x12>
    5364:	ecc70713          	addi	a4,a4,-308 # 13ecc <__sf+0x68>
    5368:	00800613          	li	a2,8
    536c:	00000593          	li	a1,0
    5370:	f9050513          	addi	a0,a0,-112 # 13f90 <__sf+0x12c>
    5374:	09442423          	sw	s4,136(s0)
    5378:	09342623          	sw	s3,140(s0)
    537c:	09242823          	sw	s2,144(s0)
    5380:	08942a23          	sw	s1,148(s0)
    5384:	0cf42e23          	sw	a5,220(s0)
    5388:	08e42223          	sw	a4,132(s0)
    538c:	0c042823          	sw	zero,208(s0)
    5390:	0c042a23          	sw	zero,212(s0)
    5394:	0c042c23          	sw	zero,216(s0)
    5398:	12042a23          	sw	zero,308(s0)
    539c:	0e042023          	sw	zero,224(s0)
    53a0:	0e042223          	sw	zero,228(s0)
    53a4:	0e042423          	sw	zero,232(s0)
    53a8:	769000ef          	jal	6310 <memset>
    53ac:	000147b7          	lui	a5,0x14
    53b0:	f3478793          	addi	a5,a5,-204 # 13f34 <__sf+0xd0>
    53b4:	0f442823          	sw	s4,240(s0)
    53b8:	0f342a23          	sw	s3,244(s0)
    53bc:	0f242c23          	sw	s2,248(s0)
    53c0:	0e942e23          	sw	s1,252(s0)
    53c4:	01c12083          	lw	ra,28(sp)
    53c8:	0ef42623          	sw	a5,236(s0)
    53cc:	01812403          	lw	s0,24(sp)
    53d0:	01412483          	lw	s1,20(sp)
    53d4:	01012903          	lw	s2,16(sp)
    53d8:	00c12983          	lw	s3,12(sp)
    53dc:	00812a03          	lw	s4,8(sp)
    53e0:	02010113          	addi	sp,sp,32
    53e4:	00008067          	ret

000053e8 <__sfp>:
    53e8:	000147b7          	lui	a5,0x14
    53ec:	fc47a783          	lw	a5,-60(a5) # 13fc4 <__stdio_exit_handler>
    53f0:	fe010113          	addi	sp,sp,-32
    53f4:	01312623          	sw	s3,12(sp)
    53f8:	00112e23          	sw	ra,28(sp)
    53fc:	00812c23          	sw	s0,24(sp)
    5400:	00912a23          	sw	s1,20(sp)
    5404:	01212823          	sw	s2,16(sp)
    5408:	00050993          	mv	s3,a0
    540c:	0e078863          	beqz	a5,54fc <__sfp+0x114>
    5410:	00014937          	lui	s2,0x14
    5414:	86090913          	addi	s2,s2,-1952 # 13860 <__sglue>
    5418:	fff00493          	li	s1,-1
    541c:	00492783          	lw	a5,4(s2)
    5420:	00892403          	lw	s0,8(s2)
    5424:	fff78793          	addi	a5,a5,-1
    5428:	0007d863          	bgez	a5,5438 <__sfp+0x50>
    542c:	0800006f          	j	54ac <__sfp+0xc4>
    5430:	06840413          	addi	s0,s0,104
    5434:	06978c63          	beq	a5,s1,54ac <__sfp+0xc4>
    5438:	00c41703          	lh	a4,12(s0)
    543c:	fff78793          	addi	a5,a5,-1
    5440:	fe0718e3          	bnez	a4,5430 <__sfp+0x48>
    5444:	ffff07b7          	lui	a5,0xffff0
    5448:	00178793          	addi	a5,a5,1 # ffff0001 <_memory_end+0xfffd0001>
    544c:	00f42623          	sw	a5,12(s0)
    5450:	06042223          	sw	zero,100(s0)
    5454:	00042023          	sw	zero,0(s0)
    5458:	00042423          	sw	zero,8(s0)
    545c:	00042223          	sw	zero,4(s0)
    5460:	00042823          	sw	zero,16(s0)
    5464:	00042a23          	sw	zero,20(s0)
    5468:	00042c23          	sw	zero,24(s0)
    546c:	00800613          	li	a2,8
    5470:	00000593          	li	a1,0
    5474:	05c40513          	addi	a0,s0,92
    5478:	699000ef          	jal	6310 <memset>
    547c:	02042823          	sw	zero,48(s0)
    5480:	02042a23          	sw	zero,52(s0)
    5484:	04042223          	sw	zero,68(s0)
    5488:	04042423          	sw	zero,72(s0)
    548c:	01c12083          	lw	ra,28(sp)
    5490:	00040513          	mv	a0,s0
    5494:	01812403          	lw	s0,24(sp)
    5498:	01412483          	lw	s1,20(sp)
    549c:	01012903          	lw	s2,16(sp)
    54a0:	00c12983          	lw	s3,12(sp)
    54a4:	02010113          	addi	sp,sp,32
    54a8:	00008067          	ret
    54ac:	00092403          	lw	s0,0(s2)
    54b0:	00040663          	beqz	s0,54bc <__sfp+0xd4>
    54b4:	00040913          	mv	s2,s0
    54b8:	f65ff06f          	j	541c <__sfp+0x34>
    54bc:	1ac00593          	li	a1,428
    54c0:	00098513          	mv	a0,s3
    54c4:	339030ef          	jal	8ffc <_malloc_r>
    54c8:	00050413          	mv	s0,a0
    54cc:	02050c63          	beqz	a0,5504 <__sfp+0x11c>
    54d0:	00c50513          	addi	a0,a0,12
    54d4:	00400793          	li	a5,4
    54d8:	00042023          	sw	zero,0(s0)
    54dc:	00f42223          	sw	a5,4(s0)
    54e0:	00a42423          	sw	a0,8(s0)
    54e4:	1a000613          	li	a2,416
    54e8:	00000593          	li	a1,0
    54ec:	625000ef          	jal	6310 <memset>
    54f0:	00892023          	sw	s0,0(s2)
    54f4:	00040913          	mv	s2,s0
    54f8:	f25ff06f          	j	541c <__sfp+0x34>
    54fc:	d7dff0ef          	jal	5278 <global_stdio_init.part.0>
    5500:	f11ff06f          	j	5410 <__sfp+0x28>
    5504:	00092023          	sw	zero,0(s2)
    5508:	00c00793          	li	a5,12
    550c:	00f9a023          	sw	a5,0(s3)
    5510:	f7dff06f          	j	548c <__sfp+0xa4>

00005514 <__sinit>:
    5514:	03452783          	lw	a5,52(a0)
    5518:	00078463          	beqz	a5,5520 <__sinit+0xc>
    551c:	00008067          	ret
    5520:	000147b7          	lui	a5,0x14
    5524:	fc47a703          	lw	a4,-60(a5) # 13fc4 <__stdio_exit_handler>
    5528:	000057b7          	lui	a5,0x5
    552c:	20078793          	addi	a5,a5,512 # 5200 <cleanup_stdio>
    5530:	02f52a23          	sw	a5,52(a0)
    5534:	fe0714e3          	bnez	a4,551c <__sinit+0x8>
    5538:	d41ff06f          	j	5278 <global_stdio_init.part.0>

0000553c <__sfp_lock_acquire>:
    553c:	00008067          	ret

00005540 <__sfp_lock_release>:
    5540:	00008067          	ret

00005544 <__fp_lock_all>:
    5544:	00014637          	lui	a2,0x14
    5548:	000055b7          	lui	a1,0x5
    554c:	86060613          	addi	a2,a2,-1952 # 13860 <__sglue>
    5550:	1dc58593          	addi	a1,a1,476 # 51dc <__fp_lock>
    5554:	00000513          	li	a0,0
    5558:	52c0006f          	j	5a84 <_fwalk_sglue>

0000555c <__fp_unlock_all>:
    555c:	00014637          	lui	a2,0x14
    5560:	000055b7          	lui	a1,0x5
    5564:	86060613          	addi	a2,a2,-1952 # 13860 <__sglue>
    5568:	27058593          	addi	a1,a1,624 # 5270 <__fp_unlock>
    556c:	00000513          	li	a0,0
    5570:	5140006f          	j	5a84 <_fwalk_sglue>

00005574 <__sfvwrite_r>:
    5574:	00862783          	lw	a5,8(a2)
    5578:	2c078463          	beqz	a5,5840 <__sfvwrite_r+0x2cc>
    557c:	00c59683          	lh	a3,12(a1)
    5580:	fd010113          	addi	sp,sp,-48
    5584:	02812423          	sw	s0,40(sp)
    5588:	01412c23          	sw	s4,24(sp)
    558c:	01612823          	sw	s6,16(sp)
    5590:	02112623          	sw	ra,44(sp)
    5594:	0086f793          	andi	a5,a3,8
    5598:	00060b13          	mv	s6,a2
    559c:	00050a13          	mv	s4,a0
    55a0:	00058413          	mv	s0,a1
    55a4:	08078e63          	beqz	a5,5640 <__sfvwrite_r+0xcc>
    55a8:	0105a783          	lw	a5,16(a1)
    55ac:	08078a63          	beqz	a5,5640 <__sfvwrite_r+0xcc>
    55b0:	02912223          	sw	s1,36(sp)
    55b4:	03212023          	sw	s2,32(sp)
    55b8:	01312e23          	sw	s3,28(sp)
    55bc:	01512a23          	sw	s5,20(sp)
    55c0:	0026f793          	andi	a5,a3,2
    55c4:	000b2483          	lw	s1,0(s6)
    55c8:	0a078463          	beqz	a5,5670 <__sfvwrite_r+0xfc>
    55cc:	02442783          	lw	a5,36(s0)
    55d0:	01c42583          	lw	a1,28(s0)
    55d4:	80000ab7          	lui	s5,0x80000
    55d8:	00000993          	li	s3,0
    55dc:	00000913          	li	s2,0
    55e0:	c00a8a93          	addi	s5,s5,-1024 # 7ffffc00 <_memory_end+0x7ffdfc00>
    55e4:	00098613          	mv	a2,s3
    55e8:	000a0513          	mv	a0,s4
    55ec:	04090263          	beqz	s2,5630 <__sfvwrite_r+0xbc>
    55f0:	00090693          	mv	a3,s2
    55f4:	012af463          	bgeu	s5,s2,55fc <__sfvwrite_r+0x88>
    55f8:	000a8693          	mv	a3,s5
    55fc:	000780e7          	jalr	a5
    5600:	46a05063          	blez	a0,5a60 <__sfvwrite_r+0x4ec>
    5604:	008b2783          	lw	a5,8(s6)
    5608:	00a989b3          	add	s3,s3,a0
    560c:	40a90933          	sub	s2,s2,a0
    5610:	40a787b3          	sub	a5,a5,a0
    5614:	00fb2423          	sw	a5,8(s6)
    5618:	1a078663          	beqz	a5,57c4 <__sfvwrite_r+0x250>
    561c:	02442783          	lw	a5,36(s0)
    5620:	01c42583          	lw	a1,28(s0)
    5624:	00098613          	mv	a2,s3
    5628:	000a0513          	mv	a0,s4
    562c:	fc0912e3          	bnez	s2,55f0 <__sfvwrite_r+0x7c>
    5630:	0004a983          	lw	s3,0(s1)
    5634:	0044a903          	lw	s2,4(s1)
    5638:	00848493          	addi	s1,s1,8
    563c:	fa9ff06f          	j	55e4 <__sfvwrite_r+0x70>
    5640:	00040593          	mv	a1,s0
    5644:	000a0513          	mv	a0,s4
    5648:	65c000ef          	jal	5ca4 <__swsetup_r>
    564c:	1c051c63          	bnez	a0,5824 <__sfvwrite_r+0x2b0>
    5650:	00c41683          	lh	a3,12(s0)
    5654:	02912223          	sw	s1,36(sp)
    5658:	03212023          	sw	s2,32(sp)
    565c:	01312e23          	sw	s3,28(sp)
    5660:	01512a23          	sw	s5,20(sp)
    5664:	0026f793          	andi	a5,a3,2
    5668:	000b2483          	lw	s1,0(s6)
    566c:	f60790e3          	bnez	a5,55cc <__sfvwrite_r+0x58>
    5670:	01712623          	sw	s7,12(sp)
    5674:	01812423          	sw	s8,8(sp)
    5678:	0016f793          	andi	a5,a3,1
    567c:	1c079663          	bnez	a5,5848 <__sfvwrite_r+0x2d4>
    5680:	00042783          	lw	a5,0(s0)
    5684:	00842703          	lw	a4,8(s0)
    5688:	80000ab7          	lui	s5,0x80000
    568c:	01912223          	sw	s9,4(sp)
    5690:	00000b93          	li	s7,0
    5694:	00000993          	li	s3,0
    5698:	fffa8a93          	addi	s5,s5,-1 # 7fffffff <_memory_end+0x7ffdffff>
    569c:	00078513          	mv	a0,a5
    56a0:	00070c13          	mv	s8,a4
    56a4:	10098263          	beqz	s3,57a8 <__sfvwrite_r+0x234>
    56a8:	2006f613          	andi	a2,a3,512
    56ac:	28060863          	beqz	a2,593c <__sfvwrite_r+0x3c8>
    56b0:	00070c93          	mv	s9,a4
    56b4:	32e9e663          	bltu	s3,a4,59e0 <__sfvwrite_r+0x46c>
    56b8:	4806f713          	andi	a4,a3,1152
    56bc:	08070a63          	beqz	a4,5750 <__sfvwrite_r+0x1dc>
    56c0:	01442603          	lw	a2,20(s0)
    56c4:	01042583          	lw	a1,16(s0)
    56c8:	00161713          	slli	a4,a2,0x1
    56cc:	00c70733          	add	a4,a4,a2
    56d0:	40b78933          	sub	s2,a5,a1
    56d4:	01f75c13          	srli	s8,a4,0x1f
    56d8:	00ec0c33          	add	s8,s8,a4
    56dc:	00190793          	addi	a5,s2,1
    56e0:	401c5c13          	srai	s8,s8,0x1
    56e4:	013787b3          	add	a5,a5,s3
    56e8:	000c0613          	mv	a2,s8
    56ec:	00fc7663          	bgeu	s8,a5,56f8 <__sfvwrite_r+0x184>
    56f0:	00078c13          	mv	s8,a5
    56f4:	00078613          	mv	a2,a5
    56f8:	4006f693          	andi	a3,a3,1024
    56fc:	30068e63          	beqz	a3,5a18 <__sfvwrite_r+0x4a4>
    5700:	00060593          	mv	a1,a2
    5704:	000a0513          	mv	a0,s4
    5708:	0f5030ef          	jal	8ffc <_malloc_r>
    570c:	00050c93          	mv	s9,a0
    5710:	34050c63          	beqz	a0,5a68 <__sfvwrite_r+0x4f4>
    5714:	01042583          	lw	a1,16(s0)
    5718:	00090613          	mv	a2,s2
    571c:	4d1000ef          	jal	63ec <memcpy>
    5720:	00c45783          	lhu	a5,12(s0)
    5724:	b7f7f793          	andi	a5,a5,-1153
    5728:	0807e793          	ori	a5,a5,128
    572c:	00f41623          	sh	a5,12(s0)
    5730:	012c8533          	add	a0,s9,s2
    5734:	412c07b3          	sub	a5,s8,s2
    5738:	01942823          	sw	s9,16(s0)
    573c:	01842a23          	sw	s8,20(s0)
    5740:	00a42023          	sw	a0,0(s0)
    5744:	00098c13          	mv	s8,s3
    5748:	00f42423          	sw	a5,8(s0)
    574c:	00098c93          	mv	s9,s3
    5750:	000c8613          	mv	a2,s9
    5754:	000b8593          	mv	a1,s7
    5758:	2ad000ef          	jal	6204 <memmove>
    575c:	00842703          	lw	a4,8(s0)
    5760:	00042783          	lw	a5,0(s0)
    5764:	00098913          	mv	s2,s3
    5768:	41870733          	sub	a4,a4,s8
    576c:	019787b3          	add	a5,a5,s9
    5770:	00e42423          	sw	a4,8(s0)
    5774:	00f42023          	sw	a5,0(s0)
    5778:	00000993          	li	s3,0
    577c:	008b2783          	lw	a5,8(s6)
    5780:	012b8bb3          	add	s7,s7,s2
    5784:	412787b3          	sub	a5,a5,s2
    5788:	00fb2423          	sw	a5,8(s6)
    578c:	02078663          	beqz	a5,57b8 <__sfvwrite_r+0x244>
    5790:	00042783          	lw	a5,0(s0)
    5794:	00842703          	lw	a4,8(s0)
    5798:	00c41683          	lh	a3,12(s0)
    579c:	00078513          	mv	a0,a5
    57a0:	00070c13          	mv	s8,a4
    57a4:	f00992e3          	bnez	s3,56a8 <__sfvwrite_r+0x134>
    57a8:	0004ab83          	lw	s7,0(s1)
    57ac:	0044a983          	lw	s3,4(s1)
    57b0:	00848493          	addi	s1,s1,8
    57b4:	ee9ff06f          	j	569c <__sfvwrite_r+0x128>
    57b8:	00c12b83          	lw	s7,12(sp)
    57bc:	00812c03          	lw	s8,8(sp)
    57c0:	00412c83          	lw	s9,4(sp)
    57c4:	02c12083          	lw	ra,44(sp)
    57c8:	02812403          	lw	s0,40(sp)
    57cc:	02412483          	lw	s1,36(sp)
    57d0:	02012903          	lw	s2,32(sp)
    57d4:	01c12983          	lw	s3,28(sp)
    57d8:	01412a83          	lw	s5,20(sp)
    57dc:	01812a03          	lw	s4,24(sp)
    57e0:	01012b03          	lw	s6,16(sp)
    57e4:	00000513          	li	a0,0
    57e8:	03010113          	addi	sp,sp,48
    57ec:	00008067          	ret
    57f0:	00040593          	mv	a1,s0
    57f4:	000a0513          	mv	a0,s4
    57f8:	8fdff0ef          	jal	50f4 <_fflush_r>
    57fc:	0a050e63          	beqz	a0,58b8 <__sfvwrite_r+0x344>
    5800:	00c41783          	lh	a5,12(s0)
    5804:	00c12b83          	lw	s7,12(sp)
    5808:	00812c03          	lw	s8,8(sp)
    580c:	02412483          	lw	s1,36(sp)
    5810:	02012903          	lw	s2,32(sp)
    5814:	01c12983          	lw	s3,28(sp)
    5818:	01412a83          	lw	s5,20(sp)
    581c:	0407e793          	ori	a5,a5,64
    5820:	00f41623          	sh	a5,12(s0)
    5824:	02c12083          	lw	ra,44(sp)
    5828:	02812403          	lw	s0,40(sp)
    582c:	01812a03          	lw	s4,24(sp)
    5830:	01012b03          	lw	s6,16(sp)
    5834:	fff00513          	li	a0,-1
    5838:	03010113          	addi	sp,sp,48
    583c:	00008067          	ret
    5840:	00000513          	li	a0,0
    5844:	00008067          	ret
    5848:	00000a93          	li	s5,0
    584c:	00000513          	li	a0,0
    5850:	00000c13          	li	s8,0
    5854:	00000993          	li	s3,0
    5858:	08098263          	beqz	s3,58dc <__sfvwrite_r+0x368>
    585c:	08050a63          	beqz	a0,58f0 <__sfvwrite_r+0x37c>
    5860:	000a8793          	mv	a5,s5
    5864:	00098b93          	mv	s7,s3
    5868:	0137f463          	bgeu	a5,s3,5870 <__sfvwrite_r+0x2fc>
    586c:	00078b93          	mv	s7,a5
    5870:	00042503          	lw	a0,0(s0)
    5874:	01042783          	lw	a5,16(s0)
    5878:	00842903          	lw	s2,8(s0)
    587c:	01442683          	lw	a3,20(s0)
    5880:	00a7f663          	bgeu	a5,a0,588c <__sfvwrite_r+0x318>
    5884:	00d90933          	add	s2,s2,a3
    5888:	09794463          	blt	s2,s7,5910 <__sfvwrite_r+0x39c>
    588c:	16dbc063          	blt	s7,a3,59ec <__sfvwrite_r+0x478>
    5890:	02442783          	lw	a5,36(s0)
    5894:	01c42583          	lw	a1,28(s0)
    5898:	000c0613          	mv	a2,s8
    589c:	000a0513          	mv	a0,s4
    58a0:	000780e7          	jalr	a5
    58a4:	00050913          	mv	s2,a0
    58a8:	f4a05ce3          	blez	a0,5800 <__sfvwrite_r+0x28c>
    58ac:	412a8ab3          	sub	s5,s5,s2
    58b0:	00100513          	li	a0,1
    58b4:	f20a8ee3          	beqz	s5,57f0 <__sfvwrite_r+0x27c>
    58b8:	008b2783          	lw	a5,8(s6)
    58bc:	012c0c33          	add	s8,s8,s2
    58c0:	412989b3          	sub	s3,s3,s2
    58c4:	412787b3          	sub	a5,a5,s2
    58c8:	00fb2423          	sw	a5,8(s6)
    58cc:	f80796e3          	bnez	a5,5858 <__sfvwrite_r+0x2e4>
    58d0:	00c12b83          	lw	s7,12(sp)
    58d4:	00812c03          	lw	s8,8(sp)
    58d8:	eedff06f          	j	57c4 <__sfvwrite_r+0x250>
    58dc:	0044a983          	lw	s3,4(s1)
    58e0:	00048793          	mv	a5,s1
    58e4:	00848493          	addi	s1,s1,8
    58e8:	fe098ae3          	beqz	s3,58dc <__sfvwrite_r+0x368>
    58ec:	0007ac03          	lw	s8,0(a5)
    58f0:	00098613          	mv	a2,s3
    58f4:	00a00593          	li	a1,10
    58f8:	000c0513          	mv	a0,s8
    58fc:	4ec000ef          	jal	5de8 <memchr>
    5900:	14050a63          	beqz	a0,5a54 <__sfvwrite_r+0x4e0>
    5904:	00150513          	addi	a0,a0,1
    5908:	41850ab3          	sub	s5,a0,s8
    590c:	f55ff06f          	j	5860 <__sfvwrite_r+0x2ec>
    5910:	000c0593          	mv	a1,s8
    5914:	00090613          	mv	a2,s2
    5918:	0ed000ef          	jal	6204 <memmove>
    591c:	00042783          	lw	a5,0(s0)
    5920:	00040593          	mv	a1,s0
    5924:	000a0513          	mv	a0,s4
    5928:	012787b3          	add	a5,a5,s2
    592c:	00f42023          	sw	a5,0(s0)
    5930:	fc4ff0ef          	jal	50f4 <_fflush_r>
    5934:	f6050ce3          	beqz	a0,58ac <__sfvwrite_r+0x338>
    5938:	ec9ff06f          	j	5800 <__sfvwrite_r+0x28c>
    593c:	01042683          	lw	a3,16(s0)
    5940:	04f6e263          	bltu	a3,a5,5984 <__sfvwrite_r+0x410>
    5944:	01442603          	lw	a2,20(s0)
    5948:	02c9ee63          	bltu	s3,a2,5984 <__sfvwrite_r+0x410>
    594c:	00098793          	mv	a5,s3
    5950:	013af463          	bgeu	s5,s3,5958 <__sfvwrite_r+0x3e4>
    5954:	000a8793          	mv	a5,s5
    5958:	02c7e6b3          	rem	a3,a5,a2
    595c:	02442703          	lw	a4,36(s0)
    5960:	01c42583          	lw	a1,28(s0)
    5964:	000b8613          	mv	a2,s7
    5968:	000a0513          	mv	a0,s4
    596c:	40d786b3          	sub	a3,a5,a3
    5970:	000700e7          	jalr	a4
    5974:	00050913          	mv	s2,a0
    5978:	04a05a63          	blez	a0,59cc <__sfvwrite_r+0x458>
    597c:	412989b3          	sub	s3,s3,s2
    5980:	dfdff06f          	j	577c <__sfvwrite_r+0x208>
    5984:	00070913          	mv	s2,a4
    5988:	00e9f463          	bgeu	s3,a4,5990 <__sfvwrite_r+0x41c>
    598c:	00098913          	mv	s2,s3
    5990:	00078513          	mv	a0,a5
    5994:	00090613          	mv	a2,s2
    5998:	000b8593          	mv	a1,s7
    599c:	069000ef          	jal	6204 <memmove>
    59a0:	00842703          	lw	a4,8(s0)
    59a4:	00042783          	lw	a5,0(s0)
    59a8:	41270733          	sub	a4,a4,s2
    59ac:	012787b3          	add	a5,a5,s2
    59b0:	00e42423          	sw	a4,8(s0)
    59b4:	00f42023          	sw	a5,0(s0)
    59b8:	fc0712e3          	bnez	a4,597c <__sfvwrite_r+0x408>
    59bc:	00040593          	mv	a1,s0
    59c0:	000a0513          	mv	a0,s4
    59c4:	f30ff0ef          	jal	50f4 <_fflush_r>
    59c8:	fa050ae3          	beqz	a0,597c <__sfvwrite_r+0x408>
    59cc:	00c41783          	lh	a5,12(s0)
    59d0:	00c12b83          	lw	s7,12(sp)
    59d4:	00812c03          	lw	s8,8(sp)
    59d8:	00412c83          	lw	s9,4(sp)
    59dc:	e31ff06f          	j	580c <__sfvwrite_r+0x298>
    59e0:	00098c13          	mv	s8,s3
    59e4:	00098c93          	mv	s9,s3
    59e8:	d69ff06f          	j	5750 <__sfvwrite_r+0x1dc>
    59ec:	000b8613          	mv	a2,s7
    59f0:	000c0593          	mv	a1,s8
    59f4:	011000ef          	jal	6204 <memmove>
    59f8:	00842703          	lw	a4,8(s0)
    59fc:	00042783          	lw	a5,0(s0)
    5a00:	000b8913          	mv	s2,s7
    5a04:	41770733          	sub	a4,a4,s7
    5a08:	017787b3          	add	a5,a5,s7
    5a0c:	00e42423          	sw	a4,8(s0)
    5a10:	00f42023          	sw	a5,0(s0)
    5a14:	e99ff06f          	j	58ac <__sfvwrite_r+0x338>
    5a18:	000a0513          	mv	a0,s4
    5a1c:	791040ef          	jal	a9ac <_realloc_r>
    5a20:	00050c93          	mv	s9,a0
    5a24:	d00516e3          	bnez	a0,5730 <__sfvwrite_r+0x1bc>
    5a28:	01042583          	lw	a1,16(s0)
    5a2c:	000a0513          	mv	a0,s4
    5a30:	6b5000ef          	jal	68e4 <_free_r>
    5a34:	00c41783          	lh	a5,12(s0)
    5a38:	00c00713          	li	a4,12
    5a3c:	00c12b83          	lw	s7,12(sp)
    5a40:	00812c03          	lw	s8,8(sp)
    5a44:	00412c83          	lw	s9,4(sp)
    5a48:	00ea2023          	sw	a4,0(s4)
    5a4c:	f7f7f793          	andi	a5,a5,-129
    5a50:	dbdff06f          	j	580c <__sfvwrite_r+0x298>
    5a54:	00198793          	addi	a5,s3,1
    5a58:	00078a93          	mv	s5,a5
    5a5c:	e09ff06f          	j	5864 <__sfvwrite_r+0x2f0>
    5a60:	00c41783          	lh	a5,12(s0)
    5a64:	da9ff06f          	j	580c <__sfvwrite_r+0x298>
    5a68:	00c00713          	li	a4,12
    5a6c:	00c41783          	lh	a5,12(s0)
    5a70:	00c12b83          	lw	s7,12(sp)
    5a74:	00812c03          	lw	s8,8(sp)
    5a78:	00412c83          	lw	s9,4(sp)
    5a7c:	00ea2023          	sw	a4,0(s4)
    5a80:	d8dff06f          	j	580c <__sfvwrite_r+0x298>

00005a84 <_fwalk_sglue>:
    5a84:	fd010113          	addi	sp,sp,-48
    5a88:	03212023          	sw	s2,32(sp)
    5a8c:	01312e23          	sw	s3,28(sp)
    5a90:	01412c23          	sw	s4,24(sp)
    5a94:	01512a23          	sw	s5,20(sp)
    5a98:	01612823          	sw	s6,16(sp)
    5a9c:	01712623          	sw	s7,12(sp)
    5aa0:	02112623          	sw	ra,44(sp)
    5aa4:	02812423          	sw	s0,40(sp)
    5aa8:	02912223          	sw	s1,36(sp)
    5aac:	00050b13          	mv	s6,a0
    5ab0:	00058b93          	mv	s7,a1
    5ab4:	00060a93          	mv	s5,a2
    5ab8:	00000a13          	li	s4,0
    5abc:	00100993          	li	s3,1
    5ac0:	fff00913          	li	s2,-1
    5ac4:	004aa483          	lw	s1,4(s5)
    5ac8:	008aa403          	lw	s0,8(s5)
    5acc:	fff48493          	addi	s1,s1,-1
    5ad0:	0204c863          	bltz	s1,5b00 <_fwalk_sglue+0x7c>
    5ad4:	00c45783          	lhu	a5,12(s0)
    5ad8:	00f9fe63          	bgeu	s3,a5,5af4 <_fwalk_sglue+0x70>
    5adc:	00e41783          	lh	a5,14(s0)
    5ae0:	00040593          	mv	a1,s0
    5ae4:	000b0513          	mv	a0,s6
    5ae8:	01278663          	beq	a5,s2,5af4 <_fwalk_sglue+0x70>
    5aec:	000b80e7          	jalr	s7
    5af0:	00aa6a33          	or	s4,s4,a0
    5af4:	fff48493          	addi	s1,s1,-1
    5af8:	06840413          	addi	s0,s0,104
    5afc:	fd249ce3          	bne	s1,s2,5ad4 <_fwalk_sglue+0x50>
    5b00:	000aaa83          	lw	s5,0(s5)
    5b04:	fc0a90e3          	bnez	s5,5ac4 <_fwalk_sglue+0x40>
    5b08:	02c12083          	lw	ra,44(sp)
    5b0c:	02812403          	lw	s0,40(sp)
    5b10:	02412483          	lw	s1,36(sp)
    5b14:	02012903          	lw	s2,32(sp)
    5b18:	01c12983          	lw	s3,28(sp)
    5b1c:	01412a83          	lw	s5,20(sp)
    5b20:	01012b03          	lw	s6,16(sp)
    5b24:	00c12b83          	lw	s7,12(sp)
    5b28:	000a0513          	mv	a0,s4
    5b2c:	01812a03          	lw	s4,24(sp)
    5b30:	03010113          	addi	sp,sp,48
    5b34:	00008067          	ret

00005b38 <__sread>:
    5b38:	ff010113          	addi	sp,sp,-16
    5b3c:	00812423          	sw	s0,8(sp)
    5b40:	00058413          	mv	s0,a1
    5b44:	00e59583          	lh	a1,14(a1)
    5b48:	00112623          	sw	ra,12(sp)
    5b4c:	5e0000ef          	jal	612c <_read_r>
    5b50:	02054063          	bltz	a0,5b70 <__sread+0x38>
    5b54:	05042783          	lw	a5,80(s0)
    5b58:	00c12083          	lw	ra,12(sp)
    5b5c:	00a787b3          	add	a5,a5,a0
    5b60:	04f42823          	sw	a5,80(s0)
    5b64:	00812403          	lw	s0,8(sp)
    5b68:	01010113          	addi	sp,sp,16
    5b6c:	00008067          	ret
    5b70:	00c45783          	lhu	a5,12(s0)
    5b74:	fffff737          	lui	a4,0xfffff
    5b78:	fff70713          	addi	a4,a4,-1 # ffffefff <_memory_end+0xfffdefff>
    5b7c:	00e7f7b3          	and	a5,a5,a4
    5b80:	00c12083          	lw	ra,12(sp)
    5b84:	00f41623          	sh	a5,12(s0)
    5b88:	00812403          	lw	s0,8(sp)
    5b8c:	01010113          	addi	sp,sp,16
    5b90:	00008067          	ret

00005b94 <__seofread>:
    5b94:	00000513          	li	a0,0
    5b98:	00008067          	ret

00005b9c <__swrite>:
    5b9c:	00c59783          	lh	a5,12(a1)
    5ba0:	fe010113          	addi	sp,sp,-32
    5ba4:	00812c23          	sw	s0,24(sp)
    5ba8:	00912a23          	sw	s1,20(sp)
    5bac:	01212823          	sw	s2,16(sp)
    5bb0:	01312623          	sw	s3,12(sp)
    5bb4:	00112e23          	sw	ra,28(sp)
    5bb8:	1007f713          	andi	a4,a5,256
    5bbc:	00058413          	mv	s0,a1
    5bc0:	00050493          	mv	s1,a0
    5bc4:	00060913          	mv	s2,a2
    5bc8:	00068993          	mv	s3,a3
    5bcc:	04071063          	bnez	a4,5c0c <__swrite+0x70>
    5bd0:	fffff737          	lui	a4,0xfffff
    5bd4:	fff70713          	addi	a4,a4,-1 # ffffefff <_memory_end+0xfffdefff>
    5bd8:	00e7f7b3          	and	a5,a5,a4
    5bdc:	00e41583          	lh	a1,14(s0)
    5be0:	00f41623          	sh	a5,12(s0)
    5be4:	01812403          	lw	s0,24(sp)
    5be8:	01c12083          	lw	ra,28(sp)
    5bec:	00098693          	mv	a3,s3
    5bf0:	00090613          	mv	a2,s2
    5bf4:	00c12983          	lw	s3,12(sp)
    5bf8:	01012903          	lw	s2,16(sp)
    5bfc:	00048513          	mv	a0,s1
    5c00:	01412483          	lw	s1,20(sp)
    5c04:	02010113          	addi	sp,sp,32
    5c08:	5900006f          	j	6198 <_write_r>
    5c0c:	00e59583          	lh	a1,14(a1)
    5c10:	00200693          	li	a3,2
    5c14:	00000613          	li	a2,0
    5c18:	4a8000ef          	jal	60c0 <_lseek_r>
    5c1c:	00c41783          	lh	a5,12(s0)
    5c20:	fb1ff06f          	j	5bd0 <__swrite+0x34>

00005c24 <__sseek>:
    5c24:	ff010113          	addi	sp,sp,-16
    5c28:	00812423          	sw	s0,8(sp)
    5c2c:	00058413          	mv	s0,a1
    5c30:	00e59583          	lh	a1,14(a1)
    5c34:	00112623          	sw	ra,12(sp)
    5c38:	488000ef          	jal	60c0 <_lseek_r>
    5c3c:	fff00793          	li	a5,-1
    5c40:	02f50863          	beq	a0,a5,5c70 <__sseek+0x4c>
    5c44:	00c45783          	lhu	a5,12(s0)
    5c48:	00001737          	lui	a4,0x1
    5c4c:	00c12083          	lw	ra,12(sp)
    5c50:	00e7e7b3          	or	a5,a5,a4
    5c54:	01079793          	slli	a5,a5,0x10
    5c58:	4107d793          	srai	a5,a5,0x10
    5c5c:	04a42823          	sw	a0,80(s0)
    5c60:	00f41623          	sh	a5,12(s0)
    5c64:	00812403          	lw	s0,8(sp)
    5c68:	01010113          	addi	sp,sp,16
    5c6c:	00008067          	ret
    5c70:	00c45783          	lhu	a5,12(s0)
    5c74:	fffff737          	lui	a4,0xfffff
    5c78:	fff70713          	addi	a4,a4,-1 # ffffefff <_memory_end+0xfffdefff>
    5c7c:	00e7f7b3          	and	a5,a5,a4
    5c80:	01079793          	slli	a5,a5,0x10
    5c84:	4107d793          	srai	a5,a5,0x10
    5c88:	00c12083          	lw	ra,12(sp)
    5c8c:	00f41623          	sh	a5,12(s0)
    5c90:	00812403          	lw	s0,8(sp)
    5c94:	01010113          	addi	sp,sp,16
    5c98:	00008067          	ret

00005c9c <__sclose>:
    5c9c:	00e59583          	lh	a1,14(a1)
    5ca0:	2d80006f          	j	5f78 <_close_r>

00005ca4 <__swsetup_r>:
    5ca4:	000147b7          	lui	a5,0x14
    5ca8:	e347a783          	lw	a5,-460(a5) # 13e34 <_impure_ptr>
    5cac:	ff010113          	addi	sp,sp,-16
    5cb0:	00812423          	sw	s0,8(sp)
    5cb4:	00912223          	sw	s1,4(sp)
    5cb8:	00112623          	sw	ra,12(sp)
    5cbc:	00050493          	mv	s1,a0
    5cc0:	00058413          	mv	s0,a1
    5cc4:	00078663          	beqz	a5,5cd0 <__swsetup_r+0x2c>
    5cc8:	0347a703          	lw	a4,52(a5)
    5ccc:	0e070c63          	beqz	a4,5dc4 <__swsetup_r+0x120>
    5cd0:	00c41783          	lh	a5,12(s0)
    5cd4:	0087f713          	andi	a4,a5,8
    5cd8:	06070a63          	beqz	a4,5d4c <__swsetup_r+0xa8>
    5cdc:	01042703          	lw	a4,16(s0)
    5ce0:	08070663          	beqz	a4,5d6c <__swsetup_r+0xc8>
    5ce4:	0017f693          	andi	a3,a5,1
    5ce8:	02068863          	beqz	a3,5d18 <__swsetup_r+0x74>
    5cec:	01442683          	lw	a3,20(s0)
    5cf0:	00042423          	sw	zero,8(s0)
    5cf4:	00000513          	li	a0,0
    5cf8:	40d006b3          	neg	a3,a3
    5cfc:	00d42c23          	sw	a3,24(s0)
    5d00:	02070a63          	beqz	a4,5d34 <__swsetup_r+0x90>
    5d04:	00c12083          	lw	ra,12(sp)
    5d08:	00812403          	lw	s0,8(sp)
    5d0c:	00412483          	lw	s1,4(sp)
    5d10:	01010113          	addi	sp,sp,16
    5d14:	00008067          	ret
    5d18:	0027f693          	andi	a3,a5,2
    5d1c:	00000613          	li	a2,0
    5d20:	00069463          	bnez	a3,5d28 <__swsetup_r+0x84>
    5d24:	01442603          	lw	a2,20(s0)
    5d28:	00c42423          	sw	a2,8(s0)
    5d2c:	00000513          	li	a0,0
    5d30:	fc071ae3          	bnez	a4,5d04 <__swsetup_r+0x60>
    5d34:	0807f713          	andi	a4,a5,128
    5d38:	fc0706e3          	beqz	a4,5d04 <__swsetup_r+0x60>
    5d3c:	0407e793          	ori	a5,a5,64
    5d40:	00f41623          	sh	a5,12(s0)
    5d44:	fff00513          	li	a0,-1
    5d48:	fbdff06f          	j	5d04 <__swsetup_r+0x60>
    5d4c:	0107f713          	andi	a4,a5,16
    5d50:	08070063          	beqz	a4,5dd0 <__swsetup_r+0x12c>
    5d54:	0047f713          	andi	a4,a5,4
    5d58:	02071c63          	bnez	a4,5d90 <__swsetup_r+0xec>
    5d5c:	01042703          	lw	a4,16(s0)
    5d60:	0087e793          	ori	a5,a5,8
    5d64:	00f41623          	sh	a5,12(s0)
    5d68:	f6071ee3          	bnez	a4,5ce4 <__swsetup_r+0x40>
    5d6c:	2807f693          	andi	a3,a5,640
    5d70:	20000613          	li	a2,512
    5d74:	f6c688e3          	beq	a3,a2,5ce4 <__swsetup_r+0x40>
    5d78:	00040593          	mv	a1,s0
    5d7c:	00048513          	mv	a0,s1
    5d80:	2b4050ef          	jal	b034 <__smakebuf_r>
    5d84:	00c41783          	lh	a5,12(s0)
    5d88:	01042703          	lw	a4,16(s0)
    5d8c:	f59ff06f          	j	5ce4 <__swsetup_r+0x40>
    5d90:	03042583          	lw	a1,48(s0)
    5d94:	00058e63          	beqz	a1,5db0 <__swsetup_r+0x10c>
    5d98:	04040713          	addi	a4,s0,64
    5d9c:	00e58863          	beq	a1,a4,5dac <__swsetup_r+0x108>
    5da0:	00048513          	mv	a0,s1
    5da4:	341000ef          	jal	68e4 <_free_r>
    5da8:	00c41783          	lh	a5,12(s0)
    5dac:	02042823          	sw	zero,48(s0)
    5db0:	01042703          	lw	a4,16(s0)
    5db4:	fdb7f793          	andi	a5,a5,-37
    5db8:	00042223          	sw	zero,4(s0)
    5dbc:	00e42023          	sw	a4,0(s0)
    5dc0:	fa1ff06f          	j	5d60 <__swsetup_r+0xbc>
    5dc4:	00078513          	mv	a0,a5
    5dc8:	f4cff0ef          	jal	5514 <__sinit>
    5dcc:	f05ff06f          	j	5cd0 <__swsetup_r+0x2c>
    5dd0:	00900713          	li	a4,9
    5dd4:	00e4a023          	sw	a4,0(s1)
    5dd8:	0407e793          	ori	a5,a5,64
    5ddc:	00f41623          	sh	a5,12(s0)
    5de0:	fff00513          	li	a0,-1
    5de4:	f21ff06f          	j	5d04 <__swsetup_r+0x60>

00005de8 <memchr>:
    5de8:	00357793          	andi	a5,a0,3
    5dec:	0ff5f693          	zext.b	a3,a1
    5df0:	02078a63          	beqz	a5,5e24 <memchr+0x3c>
    5df4:	fff60793          	addi	a5,a2,-1
    5df8:	02060e63          	beqz	a2,5e34 <memchr+0x4c>
    5dfc:	fff00613          	li	a2,-1
    5e00:	0180006f          	j	5e18 <memchr+0x30>
    5e04:	00150513          	addi	a0,a0,1
    5e08:	00357713          	andi	a4,a0,3
    5e0c:	00070e63          	beqz	a4,5e28 <memchr+0x40>
    5e10:	fff78793          	addi	a5,a5,-1
    5e14:	02c78063          	beq	a5,a2,5e34 <memchr+0x4c>
    5e18:	00054703          	lbu	a4,0(a0)
    5e1c:	fed714e3          	bne	a4,a3,5e04 <memchr+0x1c>
    5e20:	00008067          	ret
    5e24:	00060793          	mv	a5,a2
    5e28:	00300713          	li	a4,3
    5e2c:	00f76863          	bltu	a4,a5,5e3c <memchr+0x54>
    5e30:	06079063          	bnez	a5,5e90 <memchr+0xa8>
    5e34:	00000513          	li	a0,0
    5e38:	00008067          	ret
    5e3c:	0ff5f593          	zext.b	a1,a1
    5e40:	00859713          	slli	a4,a1,0x8
    5e44:	00b705b3          	add	a1,a4,a1
    5e48:	01059713          	slli	a4,a1,0x10
    5e4c:	feff08b7          	lui	a7,0xfeff0
    5e50:	80808837          	lui	a6,0x80808
    5e54:	00e585b3          	add	a1,a1,a4
    5e58:	eff88893          	addi	a7,a7,-257 # fefefeff <_memory_end+0xfefcfeff>
    5e5c:	08080813          	addi	a6,a6,128 # 80808080 <_memory_end+0x807e8080>
    5e60:	00300313          	li	t1,3
    5e64:	0100006f          	j	5e74 <memchr+0x8c>
    5e68:	ffc78793          	addi	a5,a5,-4
    5e6c:	00450513          	addi	a0,a0,4
    5e70:	fcf370e3          	bgeu	t1,a5,5e30 <memchr+0x48>
    5e74:	00052703          	lw	a4,0(a0)
    5e78:	00e5c733          	xor	a4,a1,a4
    5e7c:	01170633          	add	a2,a4,a7
    5e80:	fff74713          	not	a4,a4
    5e84:	00e67733          	and	a4,a2,a4
    5e88:	01077733          	and	a4,a4,a6
    5e8c:	fc070ee3          	beqz	a4,5e68 <memchr+0x80>
    5e90:	00f507b3          	add	a5,a0,a5
    5e94:	00c0006f          	j	5ea0 <memchr+0xb8>
    5e98:	00150513          	addi	a0,a0,1
    5e9c:	f8a78ce3          	beq	a5,a0,5e34 <memchr+0x4c>
    5ea0:	00054703          	lbu	a4,0(a0)
    5ea4:	fed71ae3          	bne	a4,a3,5e98 <memchr+0xb0>
    5ea8:	00008067          	ret

00005eac <strncpy>:
    5eac:	00a5e7b3          	or	a5,a1,a0
    5eb0:	0037f793          	andi	a5,a5,3
    5eb4:	00079663          	bnez	a5,5ec0 <strncpy+0x14>
    5eb8:	00300793          	li	a5,3
    5ebc:	04c7e663          	bltu	a5,a2,5f08 <strncpy+0x5c>
    5ec0:	00050713          	mv	a4,a0
    5ec4:	01c0006f          	j	5ee0 <strncpy+0x34>
    5ec8:	fff5c683          	lbu	a3,-1(a1)
    5ecc:	fff60813          	addi	a6,a2,-1
    5ed0:	fed78fa3          	sb	a3,-1(a5)
    5ed4:	00068e63          	beqz	a3,5ef0 <strncpy+0x44>
    5ed8:	00078713          	mv	a4,a5
    5edc:	00080613          	mv	a2,a6
    5ee0:	00158593          	addi	a1,a1,1
    5ee4:	00170793          	addi	a5,a4,1
    5ee8:	fe0610e3          	bnez	a2,5ec8 <strncpy+0x1c>
    5eec:	00008067          	ret
    5ef0:	00c70733          	add	a4,a4,a2
    5ef4:	06080063          	beqz	a6,5f54 <strncpy+0xa8>
    5ef8:	00178793          	addi	a5,a5,1
    5efc:	fe078fa3          	sb	zero,-1(a5)
    5f00:	fee79ce3          	bne	a5,a4,5ef8 <strncpy+0x4c>
    5f04:	00008067          	ret
    5f08:	feff0337          	lui	t1,0xfeff0
    5f0c:	808088b7          	lui	a7,0x80808
    5f10:	00050713          	mv	a4,a0
    5f14:	eff30313          	addi	t1,t1,-257 # fefefeff <_memory_end+0xfefcfeff>
    5f18:	08088893          	addi	a7,a7,128 # 80808080 <_memory_end+0x807e8080>
    5f1c:	00300e13          	li	t3,3
    5f20:	0180006f          	j	5f38 <strncpy+0x8c>
    5f24:	00d72023          	sw	a3,0(a4)
    5f28:	ffc60613          	addi	a2,a2,-4
    5f2c:	00470713          	addi	a4,a4,4
    5f30:	00458593          	addi	a1,a1,4
    5f34:	face76e3          	bgeu	t3,a2,5ee0 <strncpy+0x34>
    5f38:	0005a683          	lw	a3,0(a1)
    5f3c:	006687b3          	add	a5,a3,t1
    5f40:	fff6c813          	not	a6,a3
    5f44:	0107f7b3          	and	a5,a5,a6
    5f48:	0117f7b3          	and	a5,a5,a7
    5f4c:	fc078ce3          	beqz	a5,5f24 <strncpy+0x78>
    5f50:	f91ff06f          	j	5ee0 <strncpy+0x34>
    5f54:	00008067          	ret

00005f58 <__localeconv_l>:
    5f58:	0f050513          	addi	a0,a0,240
    5f5c:	00008067          	ret

00005f60 <_localeconv_r>:
    5f60:	00014537          	lui	a0,0x14
    5f64:	d6450513          	addi	a0,a0,-668 # 13d64 <__global_locale+0xf0>
    5f68:	00008067          	ret

00005f6c <localeconv>:
    5f6c:	00014537          	lui	a0,0x14
    5f70:	d6450513          	addi	a0,a0,-668 # 13d64 <__global_locale+0xf0>
    5f74:	00008067          	ret

00005f78 <_close_r>:
    5f78:	ff010113          	addi	sp,sp,-16
    5f7c:	00812423          	sw	s0,8(sp)
    5f80:	00912223          	sw	s1,4(sp)
    5f84:	00050413          	mv	s0,a0
    5f88:	000144b7          	lui	s1,0x14
    5f8c:	00058513          	mv	a0,a1
    5f90:	00112623          	sw	ra,12(sp)
    5f94:	fc04a423          	sw	zero,-56(s1) # 13fc8 <errno>
    5f98:	b70fc0ef          	jal	2308 <_close>
    5f9c:	fff00793          	li	a5,-1
    5fa0:	00f50c63          	beq	a0,a5,5fb8 <_close_r+0x40>
    5fa4:	00c12083          	lw	ra,12(sp)
    5fa8:	00812403          	lw	s0,8(sp)
    5fac:	00412483          	lw	s1,4(sp)
    5fb0:	01010113          	addi	sp,sp,16
    5fb4:	00008067          	ret
    5fb8:	fc84a783          	lw	a5,-56(s1)
    5fbc:	fe0784e3          	beqz	a5,5fa4 <_close_r+0x2c>
    5fc0:	00c12083          	lw	ra,12(sp)
    5fc4:	00f42023          	sw	a5,0(s0)
    5fc8:	00812403          	lw	s0,8(sp)
    5fcc:	00412483          	lw	s1,4(sp)
    5fd0:	01010113          	addi	sp,sp,16
    5fd4:	00008067          	ret

00005fd8 <_reclaim_reent>:
    5fd8:	000147b7          	lui	a5,0x14
    5fdc:	e347a783          	lw	a5,-460(a5) # 13e34 <_impure_ptr>
    5fe0:	0ca78e63          	beq	a5,a0,60bc <_reclaim_reent+0xe4>
    5fe4:	04452583          	lw	a1,68(a0)
    5fe8:	fe010113          	addi	sp,sp,-32
    5fec:	00912a23          	sw	s1,20(sp)
    5ff0:	00112e23          	sw	ra,28(sp)
    5ff4:	00812c23          	sw	s0,24(sp)
    5ff8:	00050493          	mv	s1,a0
    5ffc:	04058863          	beqz	a1,604c <_reclaim_reent+0x74>
    6000:	01212823          	sw	s2,16(sp)
    6004:	01312623          	sw	s3,12(sp)
    6008:	00000913          	li	s2,0
    600c:	08000993          	li	s3,128
    6010:	012587b3          	add	a5,a1,s2
    6014:	0007a403          	lw	s0,0(a5)
    6018:	00040e63          	beqz	s0,6034 <_reclaim_reent+0x5c>
    601c:	00040593          	mv	a1,s0
    6020:	00042403          	lw	s0,0(s0)
    6024:	00048513          	mv	a0,s1
    6028:	0bd000ef          	jal	68e4 <_free_r>
    602c:	fe0418e3          	bnez	s0,601c <_reclaim_reent+0x44>
    6030:	0444a583          	lw	a1,68(s1)
    6034:	00490913          	addi	s2,s2,4
    6038:	fd391ce3          	bne	s2,s3,6010 <_reclaim_reent+0x38>
    603c:	00048513          	mv	a0,s1
    6040:	0a5000ef          	jal	68e4 <_free_r>
    6044:	01012903          	lw	s2,16(sp)
    6048:	00c12983          	lw	s3,12(sp)
    604c:	0384a583          	lw	a1,56(s1)
    6050:	00058663          	beqz	a1,605c <_reclaim_reent+0x84>
    6054:	00048513          	mv	a0,s1
    6058:	08d000ef          	jal	68e4 <_free_r>
    605c:	0404a403          	lw	s0,64(s1)
    6060:	00040c63          	beqz	s0,6078 <_reclaim_reent+0xa0>
    6064:	00040593          	mv	a1,s0
    6068:	00042403          	lw	s0,0(s0)
    606c:	00048513          	mv	a0,s1
    6070:	075000ef          	jal	68e4 <_free_r>
    6074:	fe0418e3          	bnez	s0,6064 <_reclaim_reent+0x8c>
    6078:	04c4a583          	lw	a1,76(s1)
    607c:	00058663          	beqz	a1,6088 <_reclaim_reent+0xb0>
    6080:	00048513          	mv	a0,s1
    6084:	061000ef          	jal	68e4 <_free_r>
    6088:	0344a783          	lw	a5,52(s1)
    608c:	00078e63          	beqz	a5,60a8 <_reclaim_reent+0xd0>
    6090:	01812403          	lw	s0,24(sp)
    6094:	01c12083          	lw	ra,28(sp)
    6098:	00048513          	mv	a0,s1
    609c:	01412483          	lw	s1,20(sp)
    60a0:	02010113          	addi	sp,sp,32
    60a4:	00078067          	jr	a5
    60a8:	01c12083          	lw	ra,28(sp)
    60ac:	01812403          	lw	s0,24(sp)
    60b0:	01412483          	lw	s1,20(sp)
    60b4:	02010113          	addi	sp,sp,32
    60b8:	00008067          	ret
    60bc:	00008067          	ret

000060c0 <_lseek_r>:
    60c0:	ff010113          	addi	sp,sp,-16
    60c4:	00058713          	mv	a4,a1
    60c8:	00812423          	sw	s0,8(sp)
    60cc:	00912223          	sw	s1,4(sp)
    60d0:	00060593          	mv	a1,a2
    60d4:	00050413          	mv	s0,a0
    60d8:	000144b7          	lui	s1,0x14
    60dc:	00068613          	mv	a2,a3
    60e0:	00070513          	mv	a0,a4
    60e4:	00112623          	sw	ra,12(sp)
    60e8:	fc04a423          	sw	zero,-56(s1) # 13fc8 <errno>
    60ec:	a40fc0ef          	jal	232c <_lseek>
    60f0:	fff00793          	li	a5,-1
    60f4:	00f50c63          	beq	a0,a5,610c <_lseek_r+0x4c>
    60f8:	00c12083          	lw	ra,12(sp)
    60fc:	00812403          	lw	s0,8(sp)
    6100:	00412483          	lw	s1,4(sp)
    6104:	01010113          	addi	sp,sp,16
    6108:	00008067          	ret
    610c:	fc84a783          	lw	a5,-56(s1)
    6110:	fe0784e3          	beqz	a5,60f8 <_lseek_r+0x38>
    6114:	00c12083          	lw	ra,12(sp)
    6118:	00f42023          	sw	a5,0(s0)
    611c:	00812403          	lw	s0,8(sp)
    6120:	00412483          	lw	s1,4(sp)
    6124:	01010113          	addi	sp,sp,16
    6128:	00008067          	ret

0000612c <_read_r>:
    612c:	ff010113          	addi	sp,sp,-16
    6130:	00058713          	mv	a4,a1
    6134:	00812423          	sw	s0,8(sp)
    6138:	00912223          	sw	s1,4(sp)
    613c:	00060593          	mv	a1,a2
    6140:	00050413          	mv	s0,a0
    6144:	000144b7          	lui	s1,0x14
    6148:	00068613          	mv	a2,a3
    614c:	00070513          	mv	a0,a4
    6150:	00112623          	sw	ra,12(sp)
    6154:	fc04a423          	sw	zero,-56(s1) # 13fc8 <errno>
    6158:	a00fc0ef          	jal	2358 <_read>
    615c:	fff00793          	li	a5,-1
    6160:	00f50c63          	beq	a0,a5,6178 <_read_r+0x4c>
    6164:	00c12083          	lw	ra,12(sp)
    6168:	00812403          	lw	s0,8(sp)
    616c:	00412483          	lw	s1,4(sp)
    6170:	01010113          	addi	sp,sp,16
    6174:	00008067          	ret
    6178:	fc84a783          	lw	a5,-56(s1)
    617c:	fe0784e3          	beqz	a5,6164 <_read_r+0x38>
    6180:	00c12083          	lw	ra,12(sp)
    6184:	00f42023          	sw	a5,0(s0)
    6188:	00812403          	lw	s0,8(sp)
    618c:	00412483          	lw	s1,4(sp)
    6190:	01010113          	addi	sp,sp,16
    6194:	00008067          	ret

00006198 <_write_r>:
    6198:	ff010113          	addi	sp,sp,-16
    619c:	00058713          	mv	a4,a1
    61a0:	00812423          	sw	s0,8(sp)
    61a4:	00912223          	sw	s1,4(sp)
    61a8:	00060593          	mv	a1,a2
    61ac:	00050413          	mv	s0,a0
    61b0:	000144b7          	lui	s1,0x14
    61b4:	00068613          	mv	a2,a3
    61b8:	00070513          	mv	a0,a4
    61bc:	00112623          	sw	ra,12(sp)
    61c0:	fc04a423          	sw	zero,-56(s1) # 13fc8 <errno>
    61c4:	9c0fc0ef          	jal	2384 <_write>
    61c8:	fff00793          	li	a5,-1
    61cc:	00f50c63          	beq	a0,a5,61e4 <_write_r+0x4c>
    61d0:	00c12083          	lw	ra,12(sp)
    61d4:	00812403          	lw	s0,8(sp)
    61d8:	00412483          	lw	s1,4(sp)
    61dc:	01010113          	addi	sp,sp,16
    61e0:	00008067          	ret
    61e4:	fc84a783          	lw	a5,-56(s1)
    61e8:	fe0784e3          	beqz	a5,61d0 <_write_r+0x38>
    61ec:	00c12083          	lw	ra,12(sp)
    61f0:	00f42023          	sw	a5,0(s0)
    61f4:	00812403          	lw	s0,8(sp)
    61f8:	00412483          	lw	s1,4(sp)
    61fc:	01010113          	addi	sp,sp,16
    6200:	00008067          	ret

00006204 <memmove>:
    6204:	02a5f663          	bgeu	a1,a0,6230 <memmove+0x2c>
    6208:	00c58733          	add	a4,a1,a2
    620c:	02e57263          	bgeu	a0,a4,6230 <memmove+0x2c>
    6210:	00c507b3          	add	a5,a0,a2
    6214:	04060663          	beqz	a2,6260 <memmove+0x5c>
    6218:	fff74683          	lbu	a3,-1(a4)
    621c:	fff78793          	addi	a5,a5,-1
    6220:	fff70713          	addi	a4,a4,-1
    6224:	00d78023          	sb	a3,0(a5)
    6228:	fef518e3          	bne	a0,a5,6218 <memmove+0x14>
    622c:	00008067          	ret
    6230:	00f00793          	li	a5,15
    6234:	02c7e863          	bltu	a5,a2,6264 <memmove+0x60>
    6238:	00050793          	mv	a5,a0
    623c:	fff60693          	addi	a3,a2,-1
    6240:	0c060263          	beqz	a2,6304 <memmove+0x100>
    6244:	00168693          	addi	a3,a3,1
    6248:	00d786b3          	add	a3,a5,a3
    624c:	0005c703          	lbu	a4,0(a1)
    6250:	00178793          	addi	a5,a5,1
    6254:	00158593          	addi	a1,a1,1
    6258:	fee78fa3          	sb	a4,-1(a5)
    625c:	fed798e3          	bne	a5,a3,624c <memmove+0x48>
    6260:	00008067          	ret
    6264:	00b567b3          	or	a5,a0,a1
    6268:	0037f793          	andi	a5,a5,3
    626c:	08079663          	bnez	a5,62f8 <memmove+0xf4>
    6270:	ff060893          	addi	a7,a2,-16
    6274:	ff08f893          	andi	a7,a7,-16
    6278:	01088893          	addi	a7,a7,16
    627c:	011506b3          	add	a3,a0,a7
    6280:	00058713          	mv	a4,a1
    6284:	00050793          	mv	a5,a0
    6288:	00072803          	lw	a6,0(a4)
    628c:	01070713          	addi	a4,a4,16
    6290:	01078793          	addi	a5,a5,16
    6294:	ff07a823          	sw	a6,-16(a5)
    6298:	ff472803          	lw	a6,-12(a4)
    629c:	ff07aa23          	sw	a6,-12(a5)
    62a0:	ff872803          	lw	a6,-8(a4)
    62a4:	ff07ac23          	sw	a6,-8(a5)
    62a8:	ffc72803          	lw	a6,-4(a4)
    62ac:	ff07ae23          	sw	a6,-4(a5)
    62b0:	fcd79ce3          	bne	a5,a3,6288 <memmove+0x84>
    62b4:	00c67813          	andi	a6,a2,12
    62b8:	011585b3          	add	a1,a1,a7
    62bc:	00f67713          	andi	a4,a2,15
    62c0:	04080463          	beqz	a6,6308 <memmove+0x104>
    62c4:	ffc70813          	addi	a6,a4,-4
    62c8:	ffc87813          	andi	a6,a6,-4
    62cc:	00480813          	addi	a6,a6,4
    62d0:	010687b3          	add	a5,a3,a6
    62d4:	00058713          	mv	a4,a1
    62d8:	00072883          	lw	a7,0(a4)
    62dc:	00468693          	addi	a3,a3,4
    62e0:	00470713          	addi	a4,a4,4
    62e4:	ff16ae23          	sw	a7,-4(a3)
    62e8:	fef698e3          	bne	a3,a5,62d8 <memmove+0xd4>
    62ec:	00367613          	andi	a2,a2,3
    62f0:	010585b3          	add	a1,a1,a6
    62f4:	f49ff06f          	j	623c <memmove+0x38>
    62f8:	fff60693          	addi	a3,a2,-1
    62fc:	00050793          	mv	a5,a0
    6300:	f45ff06f          	j	6244 <memmove+0x40>
    6304:	00008067          	ret
    6308:	00070613          	mv	a2,a4
    630c:	f31ff06f          	j	623c <memmove+0x38>

00006310 <memset>:
    6310:	00f00313          	li	t1,15
    6314:	00050713          	mv	a4,a0
    6318:	02c37e63          	bgeu	t1,a2,6354 <memset+0x44>
    631c:	00f77793          	andi	a5,a4,15
    6320:	0a079063          	bnez	a5,63c0 <memset+0xb0>
    6324:	08059263          	bnez	a1,63a8 <memset+0x98>
    6328:	ff067693          	andi	a3,a2,-16
    632c:	00f67613          	andi	a2,a2,15
    6330:	00e686b3          	add	a3,a3,a4
    6334:	00b72023          	sw	a1,0(a4)
    6338:	00b72223          	sw	a1,4(a4)
    633c:	00b72423          	sw	a1,8(a4)
    6340:	00b72623          	sw	a1,12(a4)
    6344:	01070713          	addi	a4,a4,16
    6348:	fed766e3          	bltu	a4,a3,6334 <memset+0x24>
    634c:	00061463          	bnez	a2,6354 <memset+0x44>
    6350:	00008067          	ret
    6354:	40c306b3          	sub	a3,t1,a2
    6358:	00269693          	slli	a3,a3,0x2
    635c:	00000297          	auipc	t0,0x0
    6360:	005686b3          	add	a3,a3,t0
    6364:	00c68067          	jr	12(a3)
    6368:	00b70723          	sb	a1,14(a4)
    636c:	00b706a3          	sb	a1,13(a4)
    6370:	00b70623          	sb	a1,12(a4)
    6374:	00b705a3          	sb	a1,11(a4)
    6378:	00b70523          	sb	a1,10(a4)
    637c:	00b704a3          	sb	a1,9(a4)
    6380:	00b70423          	sb	a1,8(a4)
    6384:	00b703a3          	sb	a1,7(a4)
    6388:	00b70323          	sb	a1,6(a4)
    638c:	00b702a3          	sb	a1,5(a4)
    6390:	00b70223          	sb	a1,4(a4)
    6394:	00b701a3          	sb	a1,3(a4)
    6398:	00b70123          	sb	a1,2(a4)
    639c:	00b700a3          	sb	a1,1(a4)
    63a0:	00b70023          	sb	a1,0(a4)
    63a4:	00008067          	ret
    63a8:	0ff5f593          	zext.b	a1,a1
    63ac:	00859693          	slli	a3,a1,0x8
    63b0:	00d5e5b3          	or	a1,a1,a3
    63b4:	01059693          	slli	a3,a1,0x10
    63b8:	00d5e5b3          	or	a1,a1,a3
    63bc:	f6dff06f          	j	6328 <memset+0x18>
    63c0:	00279693          	slli	a3,a5,0x2
    63c4:	00000297          	auipc	t0,0x0
    63c8:	005686b3          	add	a3,a3,t0
    63cc:	00008293          	mv	t0,ra
    63d0:	fa0680e7          	jalr	-96(a3)
    63d4:	00028093          	mv	ra,t0
    63d8:	ff078793          	addi	a5,a5,-16
    63dc:	40f70733          	sub	a4,a4,a5
    63e0:	00f60633          	add	a2,a2,a5
    63e4:	f6c378e3          	bgeu	t1,a2,6354 <memset+0x44>
    63e8:	f3dff06f          	j	6324 <memset+0x14>

000063ec <memcpy>:
    63ec:	00a5c7b3          	xor	a5,a1,a0
    63f0:	0037f793          	andi	a5,a5,3
    63f4:	00c508b3          	add	a7,a0,a2
    63f8:	06079463          	bnez	a5,6460 <memcpy+0x74>
    63fc:	00300793          	li	a5,3
    6400:	06c7f063          	bgeu	a5,a2,6460 <memcpy+0x74>
    6404:	00357793          	andi	a5,a0,3
    6408:	00050713          	mv	a4,a0
    640c:	06079a63          	bnez	a5,6480 <memcpy+0x94>
    6410:	ffc8f613          	andi	a2,a7,-4
    6414:	40e606b3          	sub	a3,a2,a4
    6418:	02000793          	li	a5,32
    641c:	08d7ce63          	blt	a5,a3,64b8 <memcpy+0xcc>
    6420:	00058693          	mv	a3,a1
    6424:	00070793          	mv	a5,a4
    6428:	02c77863          	bgeu	a4,a2,6458 <memcpy+0x6c>
    642c:	0006a803          	lw	a6,0(a3)
    6430:	00478793          	addi	a5,a5,4
    6434:	00468693          	addi	a3,a3,4
    6438:	ff07ae23          	sw	a6,-4(a5)
    643c:	fec7e8e3          	bltu	a5,a2,642c <memcpy+0x40>
    6440:	fff60793          	addi	a5,a2,-1
    6444:	40e787b3          	sub	a5,a5,a4
    6448:	ffc7f793          	andi	a5,a5,-4
    644c:	00478793          	addi	a5,a5,4
    6450:	00f70733          	add	a4,a4,a5
    6454:	00f585b3          	add	a1,a1,a5
    6458:	01176863          	bltu	a4,a7,6468 <memcpy+0x7c>
    645c:	00008067          	ret
    6460:	00050713          	mv	a4,a0
    6464:	05157863          	bgeu	a0,a7,64b4 <memcpy+0xc8>
    6468:	0005c783          	lbu	a5,0(a1)
    646c:	00170713          	addi	a4,a4,1
    6470:	00158593          	addi	a1,a1,1
    6474:	fef70fa3          	sb	a5,-1(a4)
    6478:	fee898e3          	bne	a7,a4,6468 <memcpy+0x7c>
    647c:	00008067          	ret
    6480:	0005c683          	lbu	a3,0(a1)
    6484:	00170713          	addi	a4,a4,1
    6488:	00377793          	andi	a5,a4,3
    648c:	fed70fa3          	sb	a3,-1(a4)
    6490:	00158593          	addi	a1,a1,1
    6494:	f6078ee3          	beqz	a5,6410 <memcpy+0x24>
    6498:	0005c683          	lbu	a3,0(a1)
    649c:	00170713          	addi	a4,a4,1
    64a0:	00377793          	andi	a5,a4,3
    64a4:	fed70fa3          	sb	a3,-1(a4)
    64a8:	00158593          	addi	a1,a1,1
    64ac:	fc079ae3          	bnez	a5,6480 <memcpy+0x94>
    64b0:	f61ff06f          	j	6410 <memcpy+0x24>
    64b4:	00008067          	ret
    64b8:	ff010113          	addi	sp,sp,-16
    64bc:	00812623          	sw	s0,12(sp)
    64c0:	02000413          	li	s0,32
    64c4:	0005a383          	lw	t2,0(a1)
    64c8:	0045a283          	lw	t0,4(a1)
    64cc:	0085af83          	lw	t6,8(a1)
    64d0:	00c5af03          	lw	t5,12(a1)
    64d4:	0105ae83          	lw	t4,16(a1)
    64d8:	0145ae03          	lw	t3,20(a1)
    64dc:	0185a303          	lw	t1,24(a1)
    64e0:	01c5a803          	lw	a6,28(a1)
    64e4:	0205a683          	lw	a3,32(a1)
    64e8:	02470713          	addi	a4,a4,36
    64ec:	40e607b3          	sub	a5,a2,a4
    64f0:	fc772e23          	sw	t2,-36(a4)
    64f4:	fe572023          	sw	t0,-32(a4)
    64f8:	fff72223          	sw	t6,-28(a4)
    64fc:	ffe72423          	sw	t5,-24(a4)
    6500:	ffd72623          	sw	t4,-20(a4)
    6504:	ffc72823          	sw	t3,-16(a4)
    6508:	fe672a23          	sw	t1,-12(a4)
    650c:	ff072c23          	sw	a6,-8(a4)
    6510:	fed72e23          	sw	a3,-4(a4)
    6514:	02458593          	addi	a1,a1,36
    6518:	faf446e3          	blt	s0,a5,64c4 <memcpy+0xd8>
    651c:	00058693          	mv	a3,a1
    6520:	00070793          	mv	a5,a4
    6524:	02c77863          	bgeu	a4,a2,6554 <memcpy+0x168>
    6528:	0006a803          	lw	a6,0(a3)
    652c:	00478793          	addi	a5,a5,4
    6530:	00468693          	addi	a3,a3,4
    6534:	ff07ae23          	sw	a6,-4(a5)
    6538:	fec7e8e3          	bltu	a5,a2,6528 <memcpy+0x13c>
    653c:	fff60793          	addi	a5,a2,-1
    6540:	40e787b3          	sub	a5,a5,a4
    6544:	ffc7f793          	andi	a5,a5,-4
    6548:	00478793          	addi	a5,a5,4
    654c:	00f70733          	add	a4,a4,a5
    6550:	00f585b3          	add	a1,a1,a5
    6554:	01176863          	bltu	a4,a7,6564 <memcpy+0x178>
    6558:	00c12403          	lw	s0,12(sp)
    655c:	01010113          	addi	sp,sp,16
    6560:	00008067          	ret
    6564:	0005c783          	lbu	a5,0(a1)
    6568:	00170713          	addi	a4,a4,1
    656c:	00158593          	addi	a1,a1,1
    6570:	fef70fa3          	sb	a5,-1(a4)
    6574:	fee882e3          	beq	a7,a4,6558 <memcpy+0x16c>
    6578:	0005c783          	lbu	a5,0(a1)
    657c:	00170713          	addi	a4,a4,1
    6580:	00158593          	addi	a1,a1,1
    6584:	fef70fa3          	sb	a5,-1(a4)
    6588:	fce89ee3          	bne	a7,a4,6564 <memcpy+0x178>
    658c:	fcdff06f          	j	6558 <memcpy+0x16c>

00006590 <strlen>:
    6590:	00357793          	andi	a5,a0,3
    6594:	00050713          	mv	a4,a0
    6598:	04079c63          	bnez	a5,65f0 <strlen+0x60>
    659c:	7f7f86b7          	lui	a3,0x7f7f8
    65a0:	f7f68693          	addi	a3,a3,-129 # 7f7f7f7f <_memory_end+0x7f7d7f7f>
    65a4:	fff00593          	li	a1,-1
    65a8:	00072603          	lw	a2,0(a4)
    65ac:	00470713          	addi	a4,a4,4
    65b0:	00d677b3          	and	a5,a2,a3
    65b4:	00d787b3          	add	a5,a5,a3
    65b8:	00c7e7b3          	or	a5,a5,a2
    65bc:	00d7e7b3          	or	a5,a5,a3
    65c0:	feb784e3          	beq	a5,a1,65a8 <strlen+0x18>
    65c4:	ffc74683          	lbu	a3,-4(a4)
    65c8:	40a707b3          	sub	a5,a4,a0
    65cc:	04068463          	beqz	a3,6614 <strlen+0x84>
    65d0:	ffd74683          	lbu	a3,-3(a4)
    65d4:	02068c63          	beqz	a3,660c <strlen+0x7c>
    65d8:	ffe74503          	lbu	a0,-2(a4)
    65dc:	00a03533          	snez	a0,a0
    65e0:	00f50533          	add	a0,a0,a5
    65e4:	ffe50513          	addi	a0,a0,-2
    65e8:	00008067          	ret
    65ec:	fa0688e3          	beqz	a3,659c <strlen+0xc>
    65f0:	00074783          	lbu	a5,0(a4)
    65f4:	00170713          	addi	a4,a4,1
    65f8:	00377693          	andi	a3,a4,3
    65fc:	fe0798e3          	bnez	a5,65ec <strlen+0x5c>
    6600:	40a70733          	sub	a4,a4,a0
    6604:	fff70513          	addi	a0,a4,-1
    6608:	00008067          	ret
    660c:	ffd78513          	addi	a0,a5,-3
    6610:	00008067          	ret
    6614:	ffc78513          	addi	a0,a5,-4
    6618:	00008067          	ret

0000661c <frexpl>:
    661c:	f9010113          	addi	sp,sp,-112
    6620:	07212023          	sw	s2,96(sp)
    6624:	00c5a903          	lw	s2,12(a1)
    6628:	05412c23          	sw	s4,88(sp)
    662c:	05512a23          	sw	s5,84(sp)
    6630:	05612823          	sw	s6,80(sp)
    6634:	0045aa83          	lw	s5,4(a1)
    6638:	0005ab03          	lw	s6,0(a1)
    663c:	0085aa03          	lw	s4,8(a1)
    6640:	05312e23          	sw	s3,92(sp)
    6644:	000089b7          	lui	s3,0x8
    6648:	06812423          	sw	s0,104(sp)
    664c:	06912223          	sw	s1,100(sp)
    6650:	06112623          	sw	ra,108(sp)
    6654:	01095493          	srli	s1,s2,0x10
    6658:	fff98993          	addi	s3,s3,-1 # 7fff <__gdtoa+0x1067>
    665c:	03612823          	sw	s6,48(sp)
    6660:	03512a23          	sw	s5,52(sp)
    6664:	03412c23          	sw	s4,56(sp)
    6668:	03212e23          	sw	s2,60(sp)
    666c:	0134f4b3          	and	s1,s1,s3
    6670:	00062023          	sw	zero,0(a2)
    6674:	00050413          	mv	s0,a0
    6678:	09348063          	beq	s1,s3,66f8 <frexpl+0xdc>
    667c:	01010593          	addi	a1,sp,16
    6680:	02010513          	addi	a0,sp,32
    6684:	05712623          	sw	s7,76(sp)
    6688:	03612023          	sw	s6,32(sp)
    668c:	00060b93          	mv	s7,a2
    6690:	03512223          	sw	s5,36(sp)
    6694:	03412423          	sw	s4,40(sp)
    6698:	03212623          	sw	s2,44(sp)
    669c:	00012823          	sw	zero,16(sp)
    66a0:	00012a23          	sw	zero,20(sp)
    66a4:	00012c23          	sw	zero,24(sp)
    66a8:	00012e23          	sw	zero,28(sp)
    66ac:	221080ef          	jal	f0cc <__eqtf2>
    66b0:	0e050463          	beqz	a0,6798 <frexpl+0x17c>
    66b4:	00000693          	li	a3,0
    66b8:	06048e63          	beqz	s1,6734 <frexpl+0x118>
    66bc:	ffffc737          	lui	a4,0xffffc
    66c0:	00270713          	addi	a4,a4,2 # ffffc002 <_memory_end+0xfffdc002>
    66c4:	03c12903          	lw	s2,60(sp)
    66c8:	00e484b3          	add	s1,s1,a4
    66cc:	800107b7          	lui	a5,0x80010
    66d0:	00d484b3          	add	s1,s1,a3
    66d4:	fff78793          	addi	a5,a5,-1 # 8000ffff <_memory_end+0x7ffeffff>
    66d8:	009ba023          	sw	s1,0(s7)
    66dc:	03012b03          	lw	s6,48(sp)
    66e0:	03412a83          	lw	s5,52(sp)
    66e4:	03812a03          	lw	s4,56(sp)
    66e8:	04c12b83          	lw	s7,76(sp)
    66ec:	00f97933          	and	s2,s2,a5
    66f0:	3ffe07b7          	lui	a5,0x3ffe0
    66f4:	00f96933          	or	s2,s2,a5
    66f8:	01642023          	sw	s6,0(s0)
    66fc:	01542223          	sw	s5,4(s0)
    6700:	01442423          	sw	s4,8(s0)
    6704:	01242623          	sw	s2,12(s0)
    6708:	06c12083          	lw	ra,108(sp)
    670c:	00040513          	mv	a0,s0
    6710:	06812403          	lw	s0,104(sp)
    6714:	06412483          	lw	s1,100(sp)
    6718:	06012903          	lw	s2,96(sp)
    671c:	05c12983          	lw	s3,92(sp)
    6720:	05812a03          	lw	s4,88(sp)
    6724:	05412a83          	lw	s5,84(sp)
    6728:	05012b03          	lw	s6,80(sp)
    672c:	07010113          	addi	sp,sp,112
    6730:	00008067          	ret
    6734:	407107b7          	lui	a5,0x40710
    6738:	00010613          	mv	a2,sp
    673c:	01010593          	addi	a1,sp,16
    6740:	02010513          	addi	a0,sp,32
    6744:	00f12623          	sw	a5,12(sp)
    6748:	01612823          	sw	s6,16(sp)
    674c:	01512a23          	sw	s5,20(sp)
    6750:	01412c23          	sw	s4,24(sp)
    6754:	01212e23          	sw	s2,28(sp)
    6758:	00012023          	sw	zero,0(sp)
    675c:	00012223          	sw	zero,4(sp)
    6760:	00012423          	sw	zero,8(sp)
    6764:	495080ef          	jal	f3f8 <__multf3>
    6768:	02012703          	lw	a4,32(sp)
    676c:	02c12783          	lw	a5,44(sp)
    6770:	f8e00693          	li	a3,-114
    6774:	02e12823          	sw	a4,48(sp)
    6778:	02412703          	lw	a4,36(sp)
    677c:	0107d493          	srli	s1,a5,0x10
    6780:	02f12e23          	sw	a5,60(sp)
    6784:	02e12a23          	sw	a4,52(sp)
    6788:	02812703          	lw	a4,40(sp)
    678c:	0134f4b3          	and	s1,s1,s3
    6790:	02e12c23          	sw	a4,56(sp)
    6794:	f29ff06f          	j	66bc <frexpl+0xa0>
    6798:	04c12b83          	lw	s7,76(sp)
    679c:	f5dff06f          	j	66f8 <frexpl+0xdc>

000067a0 <_malloc_trim_r>:
    67a0:	fe010113          	addi	sp,sp,-32
    67a4:	01312623          	sw	s3,12(sp)
    67a8:	000149b7          	lui	s3,0x14
    67ac:	00812c23          	sw	s0,24(sp)
    67b0:	00912a23          	sw	s1,20(sp)
    67b4:	01212823          	sw	s2,16(sp)
    67b8:	01412423          	sw	s4,8(sp)
    67bc:	00112e23          	sw	ra,28(sp)
    67c0:	00058a13          	mv	s4,a1
    67c4:	00050913          	mv	s2,a0
    67c8:	86c98993          	addi	s3,s3,-1940 # 1386c <__malloc_av_>
    67cc:	004030ef          	jal	97d0 <__malloc_lock>
    67d0:	0089a703          	lw	a4,8(s3)
    67d4:	000017b7          	lui	a5,0x1
    67d8:	fef78793          	addi	a5,a5,-17 # fef <uart_init+0xab>
    67dc:	00472483          	lw	s1,4(a4)
    67e0:	00001737          	lui	a4,0x1
    67e4:	ffc4f493          	andi	s1,s1,-4
    67e8:	00f48433          	add	s0,s1,a5
    67ec:	41440433          	sub	s0,s0,s4
    67f0:	00c45413          	srli	s0,s0,0xc
    67f4:	fff40413          	addi	s0,s0,-1
    67f8:	00c41413          	slli	s0,s0,0xc
    67fc:	00e44e63          	blt	s0,a4,6818 <_malloc_trim_r+0x78>
    6800:	00000593          	li	a1,0
    6804:	00090513          	mv	a0,s2
    6808:	451040ef          	jal	b458 <_sbrk_r>
    680c:	0089a783          	lw	a5,8(s3)
    6810:	009787b3          	add	a5,a5,s1
    6814:	02f50863          	beq	a0,a5,6844 <_malloc_trim_r+0xa4>
    6818:	00090513          	mv	a0,s2
    681c:	7b9020ef          	jal	97d4 <__malloc_unlock>
    6820:	01c12083          	lw	ra,28(sp)
    6824:	01812403          	lw	s0,24(sp)
    6828:	01412483          	lw	s1,20(sp)
    682c:	01012903          	lw	s2,16(sp)
    6830:	00c12983          	lw	s3,12(sp)
    6834:	00812a03          	lw	s4,8(sp)
    6838:	00000513          	li	a0,0
    683c:	02010113          	addi	sp,sp,32
    6840:	00008067          	ret
    6844:	408005b3          	neg	a1,s0
    6848:	00090513          	mv	a0,s2
    684c:	40d040ef          	jal	b458 <_sbrk_r>
    6850:	fff00793          	li	a5,-1
    6854:	04f50a63          	beq	a0,a5,68a8 <_malloc_trim_r+0x108>
    6858:	000147b7          	lui	a5,0x14
    685c:	f9c78793          	addi	a5,a5,-100 # 13f9c <__malloc_current_mallinfo>
    6860:	0007a703          	lw	a4,0(a5)
    6864:	0089a683          	lw	a3,8(s3)
    6868:	408484b3          	sub	s1,s1,s0
    686c:	0014e493          	ori	s1,s1,1
    6870:	40870733          	sub	a4,a4,s0
    6874:	00090513          	mv	a0,s2
    6878:	0096a223          	sw	s1,4(a3)
    687c:	00e7a023          	sw	a4,0(a5)
    6880:	755020ef          	jal	97d4 <__malloc_unlock>
    6884:	01c12083          	lw	ra,28(sp)
    6888:	01812403          	lw	s0,24(sp)
    688c:	01412483          	lw	s1,20(sp)
    6890:	01012903          	lw	s2,16(sp)
    6894:	00c12983          	lw	s3,12(sp)
    6898:	00812a03          	lw	s4,8(sp)
    689c:	00100513          	li	a0,1
    68a0:	02010113          	addi	sp,sp,32
    68a4:	00008067          	ret
    68a8:	00000593          	li	a1,0
    68ac:	00090513          	mv	a0,s2
    68b0:	3a9040ef          	jal	b458 <_sbrk_r>
    68b4:	0089a703          	lw	a4,8(s3)
    68b8:	00f00693          	li	a3,15
    68bc:	40e507b3          	sub	a5,a0,a4
    68c0:	f4f6dce3          	bge	a3,a5,6818 <_malloc_trim_r+0x78>
    68c4:	000146b7          	lui	a3,0x14
    68c8:	e386a683          	lw	a3,-456(a3) # 13e38 <__malloc_sbrk_base>
    68cc:	0017e793          	ori	a5,a5,1
    68d0:	00f72223          	sw	a5,4(a4) # 1004 <uart_init+0xc0>
    68d4:	40d50533          	sub	a0,a0,a3
    68d8:	000146b7          	lui	a3,0x14
    68dc:	f8a6ae23          	sw	a0,-100(a3) # 13f9c <__malloc_current_mallinfo>
    68e0:	f39ff06f          	j	6818 <_malloc_trim_r+0x78>

000068e4 <_free_r>:
    68e4:	18058263          	beqz	a1,6a68 <_free_r+0x184>
    68e8:	ff010113          	addi	sp,sp,-16
    68ec:	00812423          	sw	s0,8(sp)
    68f0:	00912223          	sw	s1,4(sp)
    68f4:	00058413          	mv	s0,a1
    68f8:	00050493          	mv	s1,a0
    68fc:	00112623          	sw	ra,12(sp)
    6900:	6d1020ef          	jal	97d0 <__malloc_lock>
    6904:	ffc42503          	lw	a0,-4(s0)
    6908:	ff840713          	addi	a4,s0,-8
    690c:	000145b7          	lui	a1,0x14
    6910:	ffe57793          	andi	a5,a0,-2
    6914:	00f70633          	add	a2,a4,a5
    6918:	86c58593          	addi	a1,a1,-1940 # 1386c <__malloc_av_>
    691c:	00462683          	lw	a3,4(a2)
    6920:	0085a803          	lw	a6,8(a1)
    6924:	ffc6f693          	andi	a3,a3,-4
    6928:	1ac80263          	beq	a6,a2,6acc <_free_r+0x1e8>
    692c:	00d62223          	sw	a3,4(a2)
    6930:	00157513          	andi	a0,a0,1
    6934:	00d60833          	add	a6,a2,a3
    6938:	0a051063          	bnez	a0,69d8 <_free_r+0xf4>
    693c:	ff842303          	lw	t1,-8(s0)
    6940:	00482803          	lw	a6,4(a6)
    6944:	00014537          	lui	a0,0x14
    6948:	40670733          	sub	a4,a4,t1
    694c:	00872883          	lw	a7,8(a4)
    6950:	87450513          	addi	a0,a0,-1932 # 13874 <__malloc_av_+0x8>
    6954:	006787b3          	add	a5,a5,t1
    6958:	00187813          	andi	a6,a6,1
    695c:	14a88263          	beq	a7,a0,6aa0 <_free_r+0x1bc>
    6960:	00c72303          	lw	t1,12(a4)
    6964:	0068a623          	sw	t1,12(a7)
    6968:	01132423          	sw	a7,8(t1)
    696c:	1a080a63          	beqz	a6,6b20 <_free_r+0x23c>
    6970:	0017e693          	ori	a3,a5,1
    6974:	00d72223          	sw	a3,4(a4)
    6978:	00f62023          	sw	a5,0(a2)
    697c:	1ff00693          	li	a3,511
    6980:	06f6ec63          	bltu	a3,a5,69f8 <_free_r+0x114>
    6984:	ff87f693          	andi	a3,a5,-8
    6988:	00868693          	addi	a3,a3,8
    698c:	0045a503          	lw	a0,4(a1)
    6990:	00d586b3          	add	a3,a1,a3
    6994:	0006a603          	lw	a2,0(a3)
    6998:	0057d813          	srli	a6,a5,0x5
    699c:	00100793          	li	a5,1
    69a0:	010797b3          	sll	a5,a5,a6
    69a4:	00a7e7b3          	or	a5,a5,a0
    69a8:	ff868513          	addi	a0,a3,-8
    69ac:	00a72623          	sw	a0,12(a4)
    69b0:	00c72423          	sw	a2,8(a4)
    69b4:	00f5a223          	sw	a5,4(a1)
    69b8:	00e6a023          	sw	a4,0(a3)
    69bc:	00e62623          	sw	a4,12(a2)
    69c0:	00812403          	lw	s0,8(sp)
    69c4:	00c12083          	lw	ra,12(sp)
    69c8:	00048513          	mv	a0,s1
    69cc:	00412483          	lw	s1,4(sp)
    69d0:	01010113          	addi	sp,sp,16
    69d4:	6010206f          	j	97d4 <__malloc_unlock>
    69d8:	00482503          	lw	a0,4(a6)
    69dc:	00157513          	andi	a0,a0,1
    69e0:	08050663          	beqz	a0,6a6c <_free_r+0x188>
    69e4:	0017e693          	ori	a3,a5,1
    69e8:	fed42e23          	sw	a3,-4(s0)
    69ec:	00f62023          	sw	a5,0(a2)
    69f0:	1ff00693          	li	a3,511
    69f4:	f8f6f8e3          	bgeu	a3,a5,6984 <_free_r+0xa0>
    69f8:	0097d693          	srli	a3,a5,0x9
    69fc:	00400613          	li	a2,4
    6a00:	12d66463          	bltu	a2,a3,6b28 <_free_r+0x244>
    6a04:	0067d693          	srli	a3,a5,0x6
    6a08:	03968513          	addi	a0,a3,57
    6a0c:	03868613          	addi	a2,a3,56
    6a10:	00351513          	slli	a0,a0,0x3
    6a14:	00a58533          	add	a0,a1,a0
    6a18:	00052683          	lw	a3,0(a0)
    6a1c:	ff850513          	addi	a0,a0,-8
    6a20:	00d51863          	bne	a0,a3,6a30 <_free_r+0x14c>
    6a24:	15c0006f          	j	6b80 <_free_r+0x29c>
    6a28:	0086a683          	lw	a3,8(a3)
    6a2c:	00d50863          	beq	a0,a3,6a3c <_free_r+0x158>
    6a30:	0046a603          	lw	a2,4(a3)
    6a34:	ffc67613          	andi	a2,a2,-4
    6a38:	fec7e8e3          	bltu	a5,a2,6a28 <_free_r+0x144>
    6a3c:	00c6a503          	lw	a0,12(a3)
    6a40:	00a72623          	sw	a0,12(a4)
    6a44:	00d72423          	sw	a3,8(a4)
    6a48:	00812403          	lw	s0,8(sp)
    6a4c:	00e52423          	sw	a4,8(a0)
    6a50:	00c12083          	lw	ra,12(sp)
    6a54:	00048513          	mv	a0,s1
    6a58:	00412483          	lw	s1,4(sp)
    6a5c:	00e6a623          	sw	a4,12(a3)
    6a60:	01010113          	addi	sp,sp,16
    6a64:	5710206f          	j	97d4 <__malloc_unlock>
    6a68:	00008067          	ret
    6a6c:	00014537          	lui	a0,0x14
    6a70:	00d787b3          	add	a5,a5,a3
    6a74:	87450513          	addi	a0,a0,-1932 # 13874 <__malloc_av_+0x8>
    6a78:	00862683          	lw	a3,8(a2)
    6a7c:	0ea68063          	beq	a3,a0,6b5c <_free_r+0x278>
    6a80:	00c62803          	lw	a6,12(a2)
    6a84:	0017e513          	ori	a0,a5,1
    6a88:	00f70633          	add	a2,a4,a5
    6a8c:	0106a623          	sw	a6,12(a3)
    6a90:	00d82423          	sw	a3,8(a6)
    6a94:	00a72223          	sw	a0,4(a4)
    6a98:	00f62023          	sw	a5,0(a2)
    6a9c:	ee1ff06f          	j	697c <_free_r+0x98>
    6aa0:	14081063          	bnez	a6,6be0 <_free_r+0x2fc>
    6aa4:	00862583          	lw	a1,8(a2)
    6aa8:	00c62603          	lw	a2,12(a2)
    6aac:	00f686b3          	add	a3,a3,a5
    6ab0:	0016e793          	ori	a5,a3,1
    6ab4:	00c5a623          	sw	a2,12(a1)
    6ab8:	00b62423          	sw	a1,8(a2)
    6abc:	00f72223          	sw	a5,4(a4)
    6ac0:	00d70733          	add	a4,a4,a3
    6ac4:	00d72023          	sw	a3,0(a4)
    6ac8:	ef9ff06f          	j	69c0 <_free_r+0xdc>
    6acc:	00157513          	andi	a0,a0,1
    6ad0:	00d786b3          	add	a3,a5,a3
    6ad4:	02051063          	bnez	a0,6af4 <_free_r+0x210>
    6ad8:	ff842503          	lw	a0,-8(s0)
    6adc:	40a70733          	sub	a4,a4,a0
    6ae0:	00c72783          	lw	a5,12(a4)
    6ae4:	00872603          	lw	a2,8(a4)
    6ae8:	00a686b3          	add	a3,a3,a0
    6aec:	00f62623          	sw	a5,12(a2)
    6af0:	00c7a423          	sw	a2,8(a5)
    6af4:	000147b7          	lui	a5,0x14
    6af8:	0016e613          	ori	a2,a3,1
    6afc:	e3c7a783          	lw	a5,-452(a5) # 13e3c <__malloc_trim_threshold>
    6b00:	00c72223          	sw	a2,4(a4)
    6b04:	00e5a423          	sw	a4,8(a1)
    6b08:	eaf6ece3          	bltu	a3,a5,69c0 <_free_r+0xdc>
    6b0c:	000147b7          	lui	a5,0x14
    6b10:	fd47a583          	lw	a1,-44(a5) # 13fd4 <__malloc_top_pad>
    6b14:	00048513          	mv	a0,s1
    6b18:	c89ff0ef          	jal	67a0 <_malloc_trim_r>
    6b1c:	ea5ff06f          	j	69c0 <_free_r+0xdc>
    6b20:	00d787b3          	add	a5,a5,a3
    6b24:	f55ff06f          	j	6a78 <_free_r+0x194>
    6b28:	01400613          	li	a2,20
    6b2c:	02d67063          	bgeu	a2,a3,6b4c <_free_r+0x268>
    6b30:	05400613          	li	a2,84
    6b34:	06d66463          	bltu	a2,a3,6b9c <_free_r+0x2b8>
    6b38:	00c7d693          	srli	a3,a5,0xc
    6b3c:	06f68513          	addi	a0,a3,111
    6b40:	06e68613          	addi	a2,a3,110
    6b44:	00351513          	slli	a0,a0,0x3
    6b48:	ecdff06f          	j	6a14 <_free_r+0x130>
    6b4c:	05c68513          	addi	a0,a3,92
    6b50:	05b68613          	addi	a2,a3,91
    6b54:	00351513          	slli	a0,a0,0x3
    6b58:	ebdff06f          	j	6a14 <_free_r+0x130>
    6b5c:	00e5aa23          	sw	a4,20(a1)
    6b60:	00e5a823          	sw	a4,16(a1)
    6b64:	0017e693          	ori	a3,a5,1
    6b68:	00a72623          	sw	a0,12(a4)
    6b6c:	00a72423          	sw	a0,8(a4)
    6b70:	00d72223          	sw	a3,4(a4)
    6b74:	00f70733          	add	a4,a4,a5
    6b78:	00f72023          	sw	a5,0(a4)
    6b7c:	e45ff06f          	j	69c0 <_free_r+0xdc>
    6b80:	0045a803          	lw	a6,4(a1)
    6b84:	40265613          	srai	a2,a2,0x2
    6b88:	00100793          	li	a5,1
    6b8c:	00c797b3          	sll	a5,a5,a2
    6b90:	0107e7b3          	or	a5,a5,a6
    6b94:	00f5a223          	sw	a5,4(a1)
    6b98:	ea9ff06f          	j	6a40 <_free_r+0x15c>
    6b9c:	15400613          	li	a2,340
    6ba0:	00d66c63          	bltu	a2,a3,6bb8 <_free_r+0x2d4>
    6ba4:	00f7d693          	srli	a3,a5,0xf
    6ba8:	07868513          	addi	a0,a3,120
    6bac:	07768613          	addi	a2,a3,119
    6bb0:	00351513          	slli	a0,a0,0x3
    6bb4:	e61ff06f          	j	6a14 <_free_r+0x130>
    6bb8:	55400613          	li	a2,1364
    6bbc:	00d66c63          	bltu	a2,a3,6bd4 <_free_r+0x2f0>
    6bc0:	0127d693          	srli	a3,a5,0x12
    6bc4:	07d68513          	addi	a0,a3,125
    6bc8:	07c68613          	addi	a2,a3,124
    6bcc:	00351513          	slli	a0,a0,0x3
    6bd0:	e45ff06f          	j	6a14 <_free_r+0x130>
    6bd4:	3f800513          	li	a0,1016
    6bd8:	07e00613          	li	a2,126
    6bdc:	e39ff06f          	j	6a14 <_free_r+0x130>
    6be0:	0017e693          	ori	a3,a5,1
    6be4:	00d72223          	sw	a3,4(a4)
    6be8:	00f62023          	sw	a5,0(a2)
    6bec:	dd5ff06f          	j	69c0 <_free_r+0xdc>

00006bf0 <_ldtoa_r>:
    6bf0:	000138b7          	lui	a7,0x13
    6bf4:	1c888893          	addi	a7,a7,456 # 131c8 <blanks.1+0x10>
    6bf8:	0008af83          	lw	t6,0(a7)
    6bfc:	0048af03          	lw	t5,4(a7)
    6c00:	0088ae83          	lw	t4,8(a7)
    6c04:	00c8ae03          	lw	t3,12(a7)
    6c08:	0108a303          	lw	t1,16(a7)
    6c0c:	03852883          	lw	a7,56(a0)
    6c10:	f5010113          	addi	sp,sp,-176
    6c14:	0b212023          	sw	s2,160(sp)
    6c18:	09312e23          	sw	s3,156(sp)
    6c1c:	09412c23          	sw	s4,152(sp)
    6c20:	09612823          	sw	s6,144(sp)
    6c24:	09712623          	sw	s7,140(sp)
    6c28:	09812423          	sw	s8,136(sp)
    6c2c:	09912223          	sw	s9,132(sp)
    6c30:	09a12023          	sw	s10,128(sp)
    6c34:	0a112623          	sw	ra,172(sp)
    6c38:	0a812423          	sw	s0,168(sp)
    6c3c:	0a912223          	sw	s1,164(sp)
    6c40:	09512a23          	sw	s5,148(sp)
    6c44:	07b12e23          	sw	s11,124(sp)
    6c48:	05f12e23          	sw	t6,92(sp)
    6c4c:	07e12023          	sw	t5,96(sp)
    6c50:	07d12223          	sw	t4,100(sp)
    6c54:	07c12423          	sw	t3,104(sp)
    6c58:	06612623          	sw	t1,108(sp)
    6c5c:	00c12c23          	sw	a2,24(sp)
    6c60:	00d12e23          	sw	a3,28(sp)
    6c64:	0005aa03          	lw	s4,0(a1)
    6c68:	0045a983          	lw	s3,4(a1)
    6c6c:	0085a903          	lw	s2,8(a1)
    6c70:	00c5ac03          	lw	s8,12(a1)
    6c74:	00050b13          	mv	s6,a0
    6c78:	00070b93          	mv	s7,a4
    6c7c:	00078c93          	mv	s9,a5
    6c80:	00080d13          	mv	s10,a6
    6c84:	00088863          	beqz	a7,6c94 <_ldtoa_r+0xa4>
    6c88:	00088593          	mv	a1,a7
    6c8c:	018020ef          	jal	8ca4 <__freedtoa>
    6c90:	020b2c23          	sw	zero,56(s6)
    6c94:	06812603          	lw	a2,104(sp)
    6c98:	01fc5693          	srli	a3,s8,0x1f
    6c9c:	001c1a93          	slli	s5,s8,0x1
    6ca0:	40165713          	srai	a4,a2,0x1
    6ca4:	ffffc4b7          	lui	s1,0xffffc
    6ca8:	001c1413          	slli	s0,s8,0x1
    6cac:	00d77733          	and	a4,a4,a3
    6cb0:	011ada93          	srli	s5,s5,0x11
    6cb4:	f9148493          	addi	s1,s1,-111 # ffffbf91 <_memory_end+0xfffdbf91>
    6cb8:	010c1d93          	slli	s11,s8,0x10
    6cbc:	00dca023          	sw	a3,0(s9)
    6cc0:	00145413          	srli	s0,s0,0x1
    6cc4:	00c74733          	xor	a4,a4,a2
    6cc8:	010ddd93          	srli	s11,s11,0x10
    6ccc:	009a87b3          	add	a5,s5,s1
    6cd0:	02010593          	addi	a1,sp,32
    6cd4:	03010513          	addi	a0,sp,48
    6cd8:	03412823          	sw	s4,48(sp)
    6cdc:	03312a23          	sw	s3,52(sp)
    6ce0:	03212c23          	sw	s2,56(sp)
    6ce4:	02812e23          	sw	s0,60(sp)
    6ce8:	03412023          	sw	s4,32(sp)
    6cec:	03312223          	sw	s3,36(sp)
    6cf0:	03212423          	sw	s2,40(sp)
    6cf4:	02812623          	sw	s0,44(sp)
    6cf8:	06e12423          	sw	a4,104(sp)
    6cfc:	00f12a23          	sw	a5,20(sp)
    6d00:	05412623          	sw	s4,76(sp)
    6d04:	05312823          	sw	s3,80(sp)
    6d08:	05212a23          	sw	s2,84(sp)
    6d0c:	05b12c23          	sw	s11,88(sp)
    6d10:	37d0a0ef          	jal	1188c <__unordtf2>
    6d14:	16051a63          	bnez	a0,6e88 <_ldtoa_r+0x298>
    6d18:	7fff0cb7          	lui	s9,0x7fff0
    6d1c:	fff00493          	li	s1,-1
    6d20:	fffc8c93          	addi	s9,s9,-1 # 7ffeffff <_memory_end+0x7ffcffff>
    6d24:	02010593          	addi	a1,sp,32
    6d28:	03010513          	addi	a0,sp,48
    6d2c:	03412823          	sw	s4,48(sp)
    6d30:	03312a23          	sw	s3,52(sp)
    6d34:	03212c23          	sw	s2,56(sp)
    6d38:	02812e23          	sw	s0,60(sp)
    6d3c:	02912023          	sw	s1,32(sp)
    6d40:	02912223          	sw	s1,36(sp)
    6d44:	02912423          	sw	s1,40(sp)
    6d48:	03912623          	sw	s9,44(sp)
    6d4c:	3410a0ef          	jal	1188c <__unordtf2>
    6d50:	08051c63          	bnez	a0,6de8 <_ldtoa_r+0x1f8>
    6d54:	02010593          	addi	a1,sp,32
    6d58:	03010513          	addi	a0,sp,48
    6d5c:	56c080ef          	jal	f2c8 <__letf2>
    6d60:	08a05463          	blez	a0,6de8 <_ldtoa_r+0x1f8>
    6d64:	00300793          	li	a5,3
    6d68:	04f12423          	sw	a5,72(sp)
    6d6c:	01812783          	lw	a5,24(sp)
    6d70:	01c12803          	lw	a6,28(sp)
    6d74:	01412603          	lw	a2,20(sp)
    6d78:	04810713          	addi	a4,sp,72
    6d7c:	01a12023          	sw	s10,0(sp)
    6d80:	000b8893          	mv	a7,s7
    6d84:	04c10693          	addi	a3,sp,76
    6d88:	05c10593          	addi	a1,sp,92
    6d8c:	000b0513          	mv	a0,s6
    6d90:	208000ef          	jal	6f98 <__gdtoa>
    6d94:	000ba703          	lw	a4,0(s7)
    6d98:	ffff87b7          	lui	a5,0xffff8
    6d9c:	00f71863          	bne	a4,a5,6dac <_ldtoa_r+0x1bc>
    6da0:	800007b7          	lui	a5,0x80000
    6da4:	fff78793          	addi	a5,a5,-1 # 7fffffff <_memory_end+0x7ffdffff>
    6da8:	00fba023          	sw	a5,0(s7)
    6dac:	0ac12083          	lw	ra,172(sp)
    6db0:	0a812403          	lw	s0,168(sp)
    6db4:	0a412483          	lw	s1,164(sp)
    6db8:	0a012903          	lw	s2,160(sp)
    6dbc:	09c12983          	lw	s3,156(sp)
    6dc0:	09812a03          	lw	s4,152(sp)
    6dc4:	09412a83          	lw	s5,148(sp)
    6dc8:	09012b03          	lw	s6,144(sp)
    6dcc:	08c12b83          	lw	s7,140(sp)
    6dd0:	08812c03          	lw	s8,136(sp)
    6dd4:	08412c83          	lw	s9,132(sp)
    6dd8:	08012d03          	lw	s10,128(sp)
    6ddc:	07c12d83          	lw	s11,124(sp)
    6de0:	0b010113          	addi	sp,sp,176
    6de4:	00008067          	ret
    6de8:	000107b7          	lui	a5,0x10
    6dec:	02010593          	addi	a1,sp,32
    6df0:	03010513          	addi	a0,sp,48
    6df4:	03412823          	sw	s4,48(sp)
    6df8:	03312a23          	sw	s3,52(sp)
    6dfc:	03212c23          	sw	s2,56(sp)
    6e00:	02812e23          	sw	s0,60(sp)
    6e04:	02012023          	sw	zero,32(sp)
    6e08:	02012223          	sw	zero,36(sp)
    6e0c:	02012423          	sw	zero,40(sp)
    6e10:	02f12623          	sw	a5,44(sp)
    6e14:	384080ef          	jal	f198 <__getf2>
    6e18:	00054e63          	bltz	a0,6e34 <_ldtoa_r+0x244>
    6e1c:	000107b7          	lui	a5,0x10
    6e20:	00fdedb3          	or	s11,s11,a5
    6e24:	00100793          	li	a5,1
    6e28:	04f12423          	sw	a5,72(sp)
    6e2c:	05b12c23          	sw	s11,88(sp)
    6e30:	f3dff06f          	j	6d6c <_ldtoa_r+0x17c>
    6e34:	02010593          	addi	a1,sp,32
    6e38:	03010513          	addi	a0,sp,48
    6e3c:	03412823          	sw	s4,48(sp)
    6e40:	03312a23          	sw	s3,52(sp)
    6e44:	03212c23          	sw	s2,56(sp)
    6e48:	03812e23          	sw	s8,60(sp)
    6e4c:	02012023          	sw	zero,32(sp)
    6e50:	02012223          	sw	zero,36(sp)
    6e54:	02012423          	sw	zero,40(sp)
    6e58:	02012623          	sw	zero,44(sp)
    6e5c:	270080ef          	jal	f0cc <__eqtf2>
    6e60:	00051663          	bnez	a0,6e6c <_ldtoa_r+0x27c>
    6e64:	04012423          	sw	zero,72(sp)
    6e68:	f05ff06f          	j	6d6c <_ldtoa_r+0x17c>
    6e6c:	ffffc4b7          	lui	s1,0xffffc
    6e70:	00200793          	li	a5,2
    6e74:	f9248493          	addi	s1,s1,-110 # ffffbf92 <_memory_end+0xfffdbf92>
    6e78:	04f12423          	sw	a5,72(sp)
    6e7c:	009a87b3          	add	a5,s5,s1
    6e80:	00f12a23          	sw	a5,20(sp)
    6e84:	ee9ff06f          	j	6d6c <_ldtoa_r+0x17c>
    6e88:	00400793          	li	a5,4
    6e8c:	04f12423          	sw	a5,72(sp)
    6e90:	eddff06f          	j	6d6c <_ldtoa_r+0x17c>

00006e94 <_ldcheck>:
    6e94:	fc010113          	addi	sp,sp,-64
    6e98:	02912a23          	sw	s1,52(sp)
    6e9c:	00c52483          	lw	s1,12(a0)
    6ea0:	03312623          	sw	s3,44(sp)
    6ea4:	03412423          	sw	s4,40(sp)
    6ea8:	00852983          	lw	s3,8(a0)
    6eac:	00452a03          	lw	s4,4(a0)
    6eb0:	03512223          	sw	s5,36(sp)
    6eb4:	00052a83          	lw	s5,0(a0)
    6eb8:	00149493          	slli	s1,s1,0x1
    6ebc:	0014d493          	srli	s1,s1,0x1
    6ec0:	00010593          	mv	a1,sp
    6ec4:	01010513          	addi	a0,sp,16
    6ec8:	02112e23          	sw	ra,60(sp)
    6ecc:	01512823          	sw	s5,16(sp)
    6ed0:	01412a23          	sw	s4,20(sp)
    6ed4:	01312c23          	sw	s3,24(sp)
    6ed8:	00912e23          	sw	s1,28(sp)
    6edc:	01512023          	sw	s5,0(sp)
    6ee0:	01412223          	sw	s4,4(sp)
    6ee4:	01312423          	sw	s3,8(sp)
    6ee8:	00912623          	sw	s1,12(sp)
    6eec:	1a10a0ef          	jal	1188c <__unordtf2>
    6ef0:	08051463          	bnez	a0,6f78 <_ldcheck+0xe4>
    6ef4:	03612023          	sw	s6,32(sp)
    6ef8:	7fff0b37          	lui	s6,0x7fff0
    6efc:	03212823          	sw	s2,48(sp)
    6f00:	fffb0b13          	addi	s6,s6,-1 # 7ffeffff <_memory_end+0x7ffcffff>
    6f04:	fff00913          	li	s2,-1
    6f08:	00010593          	mv	a1,sp
    6f0c:	01010513          	addi	a0,sp,16
    6f10:	02812c23          	sw	s0,56(sp)
    6f14:	01212023          	sw	s2,0(sp)
    6f18:	01212223          	sw	s2,4(sp)
    6f1c:	01212423          	sw	s2,8(sp)
    6f20:	01612623          	sw	s6,12(sp)
    6f24:	00100413          	li	s0,1
    6f28:	1650a0ef          	jal	1188c <__unordtf2>
    6f2c:	02050c63          	beqz	a0,6f64 <_ldcheck+0xd0>
    6f30:	03c12083          	lw	ra,60(sp)
    6f34:	00144513          	xori	a0,s0,1
    6f38:	03812403          	lw	s0,56(sp)
    6f3c:	0ff57513          	zext.b	a0,a0
    6f40:	03012903          	lw	s2,48(sp)
    6f44:	02012b03          	lw	s6,32(sp)
    6f48:	03412483          	lw	s1,52(sp)
    6f4c:	02c12983          	lw	s3,44(sp)
    6f50:	02812a03          	lw	s4,40(sp)
    6f54:	02412a83          	lw	s5,36(sp)
    6f58:	00151513          	slli	a0,a0,0x1
    6f5c:	04010113          	addi	sp,sp,64
    6f60:	00008067          	ret
    6f64:	00010593          	mv	a1,sp
    6f68:	01010513          	addi	a0,sp,16
    6f6c:	35c080ef          	jal	f2c8 <__letf2>
    6f70:	00152413          	slti	s0,a0,1
    6f74:	fbdff06f          	j	6f30 <_ldcheck+0x9c>
    6f78:	03c12083          	lw	ra,60(sp)
    6f7c:	03412483          	lw	s1,52(sp)
    6f80:	02c12983          	lw	s3,44(sp)
    6f84:	02812a03          	lw	s4,40(sp)
    6f88:	02412a83          	lw	s5,36(sp)
    6f8c:	00100513          	li	a0,1
    6f90:	04010113          	addi	sp,sp,64
    6f94:	00008067          	ret

00006f98 <__gdtoa>:
    6f98:	f3010113          	addi	sp,sp,-208
    6f9c:	0b612823          	sw	s6,176(sp)
    6fa0:	00072b03          	lw	s6,0(a4)
    6fa4:	0ba12023          	sw	s10,160(sp)
    6fa8:	0c112623          	sw	ra,204(sp)
    6fac:	fcfb7313          	andi	t1,s6,-49
    6fb0:	00672023          	sw	t1,0(a4)
    6fb4:	00070d13          	mv	s10,a4
    6fb8:	0d012703          	lw	a4,208(sp)
    6fbc:	00fb7313          	andi	t1,s6,15
    6fc0:	00300e93          	li	t4,3
    6fc4:	00e12623          	sw	a4,12(sp)
    6fc8:	00f12823          	sw	a5,16(sp)
    6fcc:	01012c23          	sw	a6,24(sp)
    6fd0:	01112423          	sw	a7,8(sp)
    6fd4:	7fd30263          	beq	t1,t4,77b8 <__gdtoa+0x820>
    6fd8:	0b912223          	sw	s9,164(sp)
    6fdc:	00cb7c93          	andi	s9,s6,12
    6fe0:	720c9a63          	bnez	s9,7714 <__gdtoa+0x77c>
    6fe4:	0c812423          	sw	s0,200(sp)
    6fe8:	00050413          	mv	s0,a0
    6fec:	78030463          	beqz	t1,7774 <__gdtoa+0x7dc>
    6ff0:	0b712623          	sw	s7,172(sp)
    6ff4:	0005ab83          	lw	s7,0(a1)
    6ff8:	0d212023          	sw	s2,192(sp)
    6ffc:	0b512a23          	sw	s5,180(sp)
    7000:	09b12e23          	sw	s11,156(sp)
    7004:	00068913          	mv	s2,a3
    7008:	0c912223          	sw	s1,196(sp)
    700c:	02000693          	li	a3,32
    7010:	00058d93          	mv	s11,a1
    7014:	00060a93          	mv	s5,a2
    7018:	00000593          	li	a1,0
    701c:	02000793          	li	a5,32
    7020:	0176d863          	bge	a3,s7,7030 <__gdtoa+0x98>
    7024:	00179793          	slli	a5,a5,0x1
    7028:	00158593          	addi	a1,a1,1
    702c:	ff77cce3          	blt	a5,s7,7024 <__gdtoa+0x8c>
    7030:	00040513          	mv	a0,s0
    7034:	7a4020ef          	jal	97d8 <_Balloc>
    7038:	00050493          	mv	s1,a0
    703c:	3a0504e3          	beqz	a0,7be4 <__gdtoa+0xc4c>
    7040:	fffb8513          	addi	a0,s7,-1
    7044:	40555513          	srai	a0,a0,0x5
    7048:	00251593          	slli	a1,a0,0x2
    704c:	0b312e23          	sw	s3,188(sp)
    7050:	0b812423          	sw	s8,168(sp)
    7054:	00b905b3          	add	a1,s2,a1
    7058:	01448693          	addi	a3,s1,20
    705c:	00090793          	mv	a5,s2
    7060:	0007a703          	lw	a4,0(a5) # 10000 <__multf3+0xc08>
    7064:	00478793          	addi	a5,a5,4
    7068:	00468693          	addi	a3,a3,4
    706c:	fee6ae23          	sw	a4,-4(a3)
    7070:	fef5f8e3          	bgeu	a1,a5,7060 <__gdtoa+0xc8>
    7074:	00158593          	addi	a1,a1,1
    7078:	00190793          	addi	a5,s2,1
    707c:	00400693          	li	a3,4
    7080:	00f5e663          	bltu	a1,a5,708c <__gdtoa+0xf4>
    7084:	00251513          	slli	a0,a0,0x2
    7088:	00450693          	addi	a3,a0,4
    708c:	4026dc13          	srai	s8,a3,0x2
    7090:	00d486b3          	add	a3,s1,a3
    7094:	00c0006f          	j	70a0 <__gdtoa+0x108>
    7098:	ffc68693          	addi	a3,a3,-4
    709c:	780c0863          	beqz	s8,782c <__gdtoa+0x894>
    70a0:	0106a783          	lw	a5,16(a3)
    70a4:	000c0993          	mv	s3,s8
    70a8:	fffc0c13          	addi	s8,s8,-1
    70ac:	fe0786e3          	beqz	a5,7098 <__gdtoa+0x100>
    70b0:	004c0793          	addi	a5,s8,4
    70b4:	00279793          	slli	a5,a5,0x2
    70b8:	00f487b3          	add	a5,s1,a5
    70bc:	0047a503          	lw	a0,4(a5)
    70c0:	0134a823          	sw	s3,16(s1)
    70c4:	00599993          	slli	s3,s3,0x5
    70c8:	25d020ef          	jal	9b24 <__hi0bits>
    70cc:	40a98c33          	sub	s8,s3,a0
    70d0:	00048513          	mv	a0,s1
    70d4:	6c5010ef          	jal	8f98 <__trailz_D2A>
    70d8:	08a12623          	sw	a0,140(sp)
    70dc:	03512223          	sw	s5,36(sp)
    70e0:	78051a63          	bnez	a0,7874 <__gdtoa+0x8dc>
    70e4:	0104a683          	lw	a3,16(s1)
    70e8:	66068263          	beqz	a3,774c <__gdtoa+0x7b4>
    70ec:	08c10593          	addi	a1,sp,140
    70f0:	00048513          	mv	a0,s1
    70f4:	0b412c23          	sw	s4,184(sp)
    70f8:	438030ef          	jal	a530 <__b2d>
    70fc:	00c59993          	slli	s3,a1,0xc
    7100:	00c9d993          	srli	s3,s3,0xc
    7104:	3ff006b7          	lui	a3,0x3ff00
    7108:	00d9e833          	or	a6,s3,a3
    710c:	02412703          	lw	a4,36(sp)
    7110:	000136b7          	lui	a3,0x13
    7114:	6d06a603          	lw	a2,1744(a3) # 136d0 <__clz_tab+0x104>
    7118:	6d46a683          	lw	a3,1748(a3)
    711c:	01870733          	add	a4,a4,s8
    7120:	00080593          	mv	a1,a6
    7124:	00050793          	mv	a5,a0
    7128:	fff70a13          	addi	s4,a4,-1
    712c:	03012823          	sw	a6,48(sp)
    7130:	02e12423          	sw	a4,40(sp)
    7134:	04f12423          	sw	a5,72(sp)
    7138:	04a12223          	sw	a0,68(sp)
    713c:	640070ef          	jal	e77c <__subdf3>
    7140:	000136b7          	lui	a3,0x13
    7144:	6d86a603          	lw	a2,1752(a3) # 136d8 <__clz_tab+0x10c>
    7148:	6dc6a683          	lw	a3,1756(a3)
    714c:	040070ef          	jal	e18c <__muldf3>
    7150:	000136b7          	lui	a3,0x13
    7154:	6e06a603          	lw	a2,1760(a3) # 136e0 <__clz_tab+0x114>
    7158:	6e46a683          	lw	a3,1764(a3)
    715c:	77d050ef          	jal	d0d8 <__adddf3>
    7160:	00050793          	mv	a5,a0
    7164:	000a0513          	mv	a0,s4
    7168:	00f12e23          	sw	a5,28(sp)
    716c:	00058993          	mv	s3,a1
    7170:	635070ef          	jal	efa4 <__floatsidf>
    7174:	000136b7          	lui	a3,0x13
    7178:	6e86a603          	lw	a2,1768(a3) # 136e8 <__clz_tab+0x11c>
    717c:	6ec6a683          	lw	a3,1772(a3)
    7180:	00c070ef          	jal	e18c <__muldf3>
    7184:	01c12783          	lw	a5,28(sp)
    7188:	00050613          	mv	a2,a0
    718c:	00058693          	mv	a3,a1
    7190:	00078513          	mv	a0,a5
    7194:	00098593          	mv	a1,s3
    7198:	741050ef          	jal	d0d8 <__adddf3>
    719c:	02a12023          	sw	a0,32(sp)
    71a0:	00058993          	mv	s3,a1
    71a4:	000a0513          	mv	a0,s4
    71a8:	000a5863          	bgez	s4,71b8 <__gdtoa+0x220>
    71ac:	02812703          	lw	a4,40(sp)
    71b0:	00100513          	li	a0,1
    71b4:	40e50533          	sub	a0,a0,a4
    71b8:	bcb50513          	addi	a0,a0,-1077
    71bc:	02a05a63          	blez	a0,71f0 <__gdtoa+0x258>
    71c0:	5e5070ef          	jal	efa4 <__floatsidf>
    71c4:	000136b7          	lui	a3,0x13
    71c8:	6f06a603          	lw	a2,1776(a3) # 136f0 <__clz_tab+0x124>
    71cc:	6f46a683          	lw	a3,1780(a3)
    71d0:	7bd060ef          	jal	e18c <__muldf3>
    71d4:	00050613          	mv	a2,a0
    71d8:	02012503          	lw	a0,32(sp)
    71dc:	00058693          	mv	a3,a1
    71e0:	00098593          	mv	a1,s3
    71e4:	6f5050ef          	jal	d0d8 <__adddf3>
    71e8:	02a12023          	sw	a0,32(sp)
    71ec:	00058993          	mv	s3,a1
    71f0:	02012503          	lw	a0,32(sp)
    71f4:	00098593          	mv	a1,s3
    71f8:	52d070ef          	jal	ef24 <__fixdfsi>
    71fc:	00050813          	mv	a6,a0
    7200:	02012503          	lw	a0,32(sp)
    7204:	00098593          	mv	a1,s3
    7208:	00000613          	li	a2,0
    720c:	00000693          	li	a3,0
    7210:	01012e23          	sw	a6,28(sp)
    7214:	69d060ef          	jal	e0b0 <__ledf2>
    7218:	02055463          	bgez	a0,7240 <__gdtoa+0x2a8>
    721c:	01c12503          	lw	a0,28(sp)
    7220:	585070ef          	jal	efa4 <__floatsidf>
    7224:	02012603          	lw	a2,32(sp)
    7228:	00098693          	mv	a3,s3
    722c:	51d060ef          	jal	df48 <__eqdf2>
    7230:	01c12783          	lw	a5,28(sp)
    7234:	00a03533          	snez	a0,a0
    7238:	40a787b3          	sub	a5,a5,a0
    723c:	00f12e23          	sw	a5,28(sp)
    7240:	03012783          	lw	a5,48(sp)
    7244:	014a1613          	slli	a2,s4,0x14
    7248:	01c12703          	lw	a4,28(sp)
    724c:	414c0a33          	sub	s4,s8,s4
    7250:	00f609b3          	add	s3,a2,a5
    7254:	fffa0793          	addi	a5,s4,-1
    7258:	01600693          	li	a3,22
    725c:	02f12023          	sw	a5,32(sp)
    7260:	5ce6ea63          	bltu	a3,a4,7834 <__gdtoa+0x89c>
    7264:	000137b7          	lui	a5,0x13
    7268:	23878613          	addi	a2,a5,568 # 13238 <__mprec_tens>
    726c:	00371693          	slli	a3,a4,0x3
    7270:	00c686b3          	add	a3,a3,a2
    7274:	04412883          	lw	a7,68(sp)
    7278:	0006a503          	lw	a0,0(a3)
    727c:	0046a583          	lw	a1,4(a3)
    7280:	00088613          	mv	a2,a7
    7284:	00098693          	mv	a3,s3
    7288:	54d060ef          	jal	dfd4 <__gedf2>
    728c:	1aa044e3          	bgtz	a0,7c34 <__gdtoa+0xc9c>
    7290:	04012823          	sw	zero,80(sp)
    7294:	02012823          	sw	zero,48(sp)
    7298:	01404a63          	bgtz	s4,72ac <__gdtoa+0x314>
    729c:	00100693          	li	a3,1
    72a0:	414687b3          	sub	a5,a3,s4
    72a4:	02f12823          	sw	a5,48(sp)
    72a8:	02012023          	sw	zero,32(sp)
    72ac:	02012703          	lw	a4,32(sp)
    72b0:	01c12783          	lw	a5,28(sp)
    72b4:	02012c23          	sw	zero,56(sp)
    72b8:	00f70733          	add	a4,a4,a5
    72bc:	02e12023          	sw	a4,32(sp)
    72c0:	02f12e23          	sw	a5,60(sp)
    72c4:	01012783          	lw	a5,16(sp)
    72c8:	00900693          	li	a3,9
    72cc:	5cf6e463          	bltu	a3,a5,7894 <__gdtoa+0x8fc>
    72d0:	00500693          	li	a3,5
    72d4:	16f6cae3          	blt	a3,a5,7c48 <__gdtoa+0xcb0>
    72d8:	02812783          	lw	a5,40(sp)
    72dc:	00400613          	li	a2,4
    72e0:	3fd78793          	addi	a5,a5,1021
    72e4:	7f87ba13          	sltiu	s4,a5,2040
    72e8:	01012783          	lw	a5,16(sp)
    72ec:	00c79463          	bne	a5,a2,72f4 <__gdtoa+0x35c>
    72f0:	06c0106f          	j	835c <__gdtoa+0x13c4>
    72f4:	00d79463          	bne	a5,a3,72fc <__gdtoa+0x364>
    72f8:	0580106f          	j	8350 <__gdtoa+0x13b8>
    72fc:	00200693          	li	a3,2
    7300:	00d79463          	bne	a5,a3,7308 <__gdtoa+0x370>
    7304:	0640106f          	j	8368 <__gdtoa+0x13d0>
    7308:	00300693          	li	a3,3
    730c:	04012023          	sw	zero,64(sp)
    7310:	58d79a63          	bne	a5,a3,78a4 <__gdtoa+0x90c>
    7314:	03c12783          	lw	a5,60(sp)
    7318:	01812703          	lw	a4,24(sp)
    731c:	00e787b3          	add	a5,a5,a4
    7320:	04f12a23          	sw	a5,84(sp)
    7324:	00178793          	addi	a5,a5,1
    7328:	02f12a23          	sw	a5,52(sp)
    732c:	5ef05ee3          	blez	a5,8128 <__gdtoa+0x1190>
    7330:	00078693          	mv	a3,a5
    7334:	00078593          	mv	a1,a5
    7338:	00040513          	mv	a0,s0
    733c:	08d12623          	sw	a3,140(sp)
    7340:	041010ef          	jal	8b80 <__rv_alloc_D2A>
    7344:	00050f13          	mv	t5,a0
    7348:	4a050c63          	beqz	a0,7800 <__gdtoa+0x868>
    734c:	00cda783          	lw	a5,12(s11)
    7350:	fff78793          	addi	a5,a5,-1
    7354:	02f12423          	sw	a5,40(sp)
    7358:	58078e63          	beqz	a5,78f4 <__gdtoa+0x95c>
    735c:	0c07c6e3          	bltz	a5,7c28 <__gdtoa+0xc90>
    7360:	100b7e13          	andi	t3,s6,256
    7364:	580e1063          	bnez	t3,78e4 <__gdtoa+0x94c>
    7368:	02412783          	lw	a5,36(sp)
    736c:	0007c863          	bltz	a5,737c <__gdtoa+0x3e4>
    7370:	03c12783          	lw	a5,60(sp)
    7374:	00e00693          	li	a3,14
    7378:	10f6d0e3          	bge	a3,a5,7c78 <__gdtoa+0xce0>
    737c:	04012783          	lw	a5,64(sp)
    7380:	08078ce3          	beqz	a5,7c18 <__gdtoa+0xc80>
    7384:	02412783          	lw	a5,36(sp)
    7388:	418b8333          	sub	t1,s7,s8
    738c:	004da683          	lw	a3,4(s11)
    7390:	00130613          	addi	a2,t1,1
    7394:	08c12623          	sw	a2,140(sp)
    7398:	40678333          	sub	t1,a5,t1
    739c:	5ed356e3          	bge	t1,a3,8188 <__gdtoa+0x11f0>
    73a0:	01012703          	lw	a4,16(sp)
    73a4:	ffd70613          	addi	a2,a4,-3
    73a8:	ffd67613          	andi	a2,a2,-3
    73ac:	4c0606e3          	beqz	a2,8078 <__gdtoa+0x10e0>
    73b0:	40d786b3          	sub	a3,a5,a3
    73b4:	00168693          	addi	a3,a3,1
    73b8:	08d12623          	sw	a3,140(sp)
    73bc:	00100613          	li	a2,1
    73c0:	00e65c63          	bge	a2,a4,73d8 <__gdtoa+0x440>
    73c4:	03412783          	lw	a5,52(sp)
    73c8:	00f05863          	blez	a5,73d8 <__gdtoa+0x440>
    73cc:	03412783          	lw	a5,52(sp)
    73d0:	00d7d463          	bge	a5,a3,73d8 <__gdtoa+0x440>
    73d4:	5a40106f          	j	8978 <__gdtoa+0x19e0>
    73d8:	03012783          	lw	a5,48(sp)
    73dc:	02012703          	lw	a4,32(sp)
    73e0:	03812b03          	lw	s6,56(sp)
    73e4:	00078a13          	mv	s4,a5
    73e8:	00d70733          	add	a4,a4,a3
    73ec:	00f687b3          	add	a5,a3,a5
    73f0:	02e12023          	sw	a4,32(sp)
    73f4:	02f12823          	sw	a5,48(sp)
    73f8:	00100593          	li	a1,1
    73fc:	00040513          	mv	a0,s0
    7400:	03e12223          	sw	t5,36(sp)
    7404:	079020ef          	jal	9c7c <__i2b>
    7408:	02412f03          	lw	t5,36(sp)
    740c:	00050993          	mv	s3,a0
    7410:	3e050863          	beqz	a0,7800 <__gdtoa+0x868>
    7414:	020a0c63          	beqz	s4,744c <__gdtoa+0x4b4>
    7418:	02012783          	lw	a5,32(sp)
    741c:	02f05863          	blez	a5,744c <__gdtoa+0x4b4>
    7420:	000a0693          	mv	a3,s4
    7424:	0147d463          	bge	a5,s4,742c <__gdtoa+0x494>
    7428:	00078693          	mv	a3,a5
    742c:	03012783          	lw	a5,48(sp)
    7430:	08d12623          	sw	a3,140(sp)
    7434:	40da0a33          	sub	s4,s4,a3
    7438:	40d787b3          	sub	a5,a5,a3
    743c:	02f12823          	sw	a5,48(sp)
    7440:	02012783          	lw	a5,32(sp)
    7444:	40d787b3          	sub	a5,a5,a3
    7448:	02f12023          	sw	a5,32(sp)
    744c:	03812783          	lw	a5,56(sp)
    7450:	02078863          	beqz	a5,7480 <__gdtoa+0x4e8>
    7454:	04012783          	lw	a5,64(sp)
    7458:	00078463          	beqz	a5,7460 <__gdtoa+0x4c8>
    745c:	620b10e3          	bnez	s6,827c <__gdtoa+0x12e4>
    7460:	03812603          	lw	a2,56(sp)
    7464:	00048593          	mv	a1,s1
    7468:	00040513          	mv	a0,s0
    746c:	03e12223          	sw	t5,36(sp)
    7470:	2e1020ef          	jal	9f50 <__pow5mult>
    7474:	02412f03          	lw	t5,36(sp)
    7478:	00050493          	mv	s1,a0
    747c:	38050263          	beqz	a0,7800 <__gdtoa+0x868>
    7480:	00100593          	li	a1,1
    7484:	00040513          	mv	a0,s0
    7488:	03e12223          	sw	t5,36(sp)
    748c:	7f0020ef          	jal	9c7c <__i2b>
    7490:	00050b93          	mv	s7,a0
    7494:	36050663          	beqz	a0,7800 <__gdtoa+0x868>
    7498:	01c12783          	lw	a5,28(sp)
    749c:	02412f03          	lw	t5,36(sp)
    74a0:	48079ae3          	bnez	a5,8134 <__gdtoa+0x119c>
    74a4:	01012783          	lw	a5,16(sp)
    74a8:	00100693          	li	a3,1
    74ac:	1af6d4e3          	bge	a3,a5,7e54 <__gdtoa+0xebc>
    74b0:	01f00a93          	li	s5,31
    74b4:	02012783          	lw	a5,32(sp)
    74b8:	40fa8ab3          	sub	s5,s5,a5
    74bc:	03012783          	lw	a5,48(sp)
    74c0:	ffca8a93          	addi	s5,s5,-4
    74c4:	01fafa93          	andi	s5,s5,31
    74c8:	00fa8633          	add	a2,s5,a5
    74cc:	09512623          	sw	s5,140(sp)
    74d0:	000a8793          	mv	a5,s5
    74d4:	28c040e3          	bgtz	a2,7f54 <__gdtoa+0xfbc>
    74d8:	02012703          	lw	a4,32(sp)
    74dc:	00f70633          	add	a2,a4,a5
    74e0:	30c04263          	bgtz	a2,77e4 <__gdtoa+0x84c>
    74e4:	05012783          	lw	a5,80(sp)
    74e8:	280798e3          	bnez	a5,7f78 <__gdtoa+0xfe0>
    74ec:	03412783          	lw	a5,52(sp)
    74f0:	3af05ae3          	blez	a5,80a4 <__gdtoa+0x110c>
    74f4:	04012783          	lw	a5,64(sp)
    74f8:	2c078ce3          	beqz	a5,7fd0 <__gdtoa+0x1038>
    74fc:	014a8633          	add	a2,s5,s4
    7500:	62c040e3          	bgtz	a2,8320 <__gdtoa+0x1388>
    7504:	01c12783          	lw	a5,28(sp)
    7508:	00098a13          	mv	s4,s3
    750c:	68079ae3          	bnez	a5,83a0 <__gdtoa+0x1408>
    7510:	01a12e23          	sw	s10,28(sp)
    7514:	01012c83          	lw	s9,16(sp)
    7518:	03412d03          	lw	s10,52(sp)
    751c:	000f0c13          	mv	s8,t5
    7520:	00100793          	li	a5,1
    7524:	01e12c23          	sw	t5,24(sp)
    7528:	0b00006f          	j	75d8 <__gdtoa+0x640>
    752c:	00040513          	mv	a0,s0
    7530:	35c020ef          	jal	988c <_Bfree>
    7534:	000ad463          	bgez	s5,753c <__gdtoa+0x5a4>
    7538:	0000106f          	j	8538 <__gdtoa+0x15a0>
    753c:	015ceab3          	or	s5,s9,s5
    7540:	000a9a63          	bnez	s5,7554 <__gdtoa+0x5bc>
    7544:	00092783          	lw	a5,0(s2)
    7548:	0017f793          	andi	a5,a5,1
    754c:	00079463          	bnez	a5,7554 <__gdtoa+0x5bc>
    7550:	7e90006f          	j	8538 <__gdtoa+0x15a0>
    7554:	02812783          	lw	a5,40(sp)
    7558:	00200713          	li	a4,2
    755c:	00e78463          	beq	a5,a4,7564 <__gdtoa+0x5cc>
    7560:	3440106f          	j	88a4 <__gdtoa+0x190c>
    7564:	01bc0023          	sb	s11,0(s8)
    7568:	08c12783          	lw	a5,140(sp)
    756c:	001c0c13          	addi	s8,s8,1
    7570:	00fd1463          	bne	s10,a5,7578 <__gdtoa+0x5e0>
    7574:	2580106f          	j	87cc <__gdtoa+0x1834>
    7578:	00048593          	mv	a1,s1
    757c:	00000693          	li	a3,0
    7580:	00a00613          	li	a2,10
    7584:	00040513          	mv	a0,s0
    7588:	328020ef          	jal	98b0 <__multadd>
    758c:	00050493          	mv	s1,a0
    7590:	26050863          	beqz	a0,7800 <__gdtoa+0x868>
    7594:	00000693          	li	a3,0
    7598:	00a00613          	li	a2,10
    759c:	00098593          	mv	a1,s3
    75a0:	00040513          	mv	a0,s0
    75a4:	114988e3          	beq	s3,s4,7eb4 <__gdtoa+0xf1c>
    75a8:	308020ef          	jal	98b0 <__multadd>
    75ac:	00050993          	mv	s3,a0
    75b0:	24050863          	beqz	a0,7800 <__gdtoa+0x868>
    75b4:	000a0593          	mv	a1,s4
    75b8:	00000693          	li	a3,0
    75bc:	00a00613          	li	a2,10
    75c0:	00040513          	mv	a0,s0
    75c4:	2ec020ef          	jal	98b0 <__multadd>
    75c8:	00050a13          	mv	s4,a0
    75cc:	22050a63          	beqz	a0,7800 <__gdtoa+0x868>
    75d0:	08c12783          	lw	a5,140(sp)
    75d4:	00178793          	addi	a5,a5,1
    75d8:	000b8593          	mv	a1,s7
    75dc:	00048513          	mv	a0,s1
    75e0:	08f12623          	sw	a5,140(sp)
    75e4:	6d8010ef          	jal	8cbc <__quorem_D2A>
    75e8:	00050b13          	mv	s6,a0
    75ec:	00098593          	mv	a1,s3
    75f0:	00048513          	mv	a0,s1
    75f4:	42d020ef          	jal	a220 <__mcmp>
    75f8:	000b8593          	mv	a1,s7
    75fc:	00050a93          	mv	s5,a0
    7600:	000a0613          	mv	a2,s4
    7604:	00040513          	mv	a0,s0
    7608:	471020ef          	jal	a278 <__mdiff>
    760c:	030b0d93          	addi	s11,s6,48
    7610:	00050593          	mv	a1,a0
    7614:	1e050663          	beqz	a0,7800 <__gdtoa+0x868>
    7618:	00c52783          	lw	a5,12(a0)
    761c:	f00798e3          	bnez	a5,752c <__gdtoa+0x594>
    7620:	00a12823          	sw	a0,16(sp)
    7624:	00048513          	mv	a0,s1
    7628:	3f9020ef          	jal	a220 <__mcmp>
    762c:	01012583          	lw	a1,16(sp)
    7630:	00050793          	mv	a5,a0
    7634:	00040513          	mv	a0,s0
    7638:	00f12823          	sw	a5,16(sp)
    763c:	250020ef          	jal	988c <_Bfree>
    7640:	01012783          	lw	a5,16(sp)
    7644:	00fce733          	or	a4,s9,a5
    7648:	00070463          	beqz	a4,7650 <__gdtoa+0x6b8>
    764c:	4b00106f          	j	8afc <__gdtoa+0x1b64>
    7650:	00092783          	lw	a5,0(s2)
    7654:	0017f793          	andi	a5,a5,1
    7658:	060798e3          	bnez	a5,7ec8 <__gdtoa+0xf30>
    765c:	02812783          	lw	a5,40(sp)
    7660:	00079463          	bnez	a5,7668 <__gdtoa+0x6d0>
    7664:	3880106f          	j	89ec <__gdtoa+0x1a54>
    7668:	ef504ee3          	bgtz	s5,7564 <__gdtoa+0x5cc>
    766c:	0104a683          	lw	a3,16(s1)
    7670:	00100793          	li	a5,1
    7674:	01812f03          	lw	t5,24(sp)
    7678:	01c12d03          	lw	s10,28(sp)
    767c:	00070c93          	mv	s9,a4
    7680:	00d7c463          	blt	a5,a3,7688 <__gdtoa+0x6f0>
    7684:	4440106f          	j	8ac8 <__gdtoa+0x1b30>
    7688:	02812703          	lw	a4,40(sp)
    768c:	00200793          	li	a5,2
    7690:	000f0b13          	mv	s6,t5
    7694:	02f71463          	bne	a4,a5,76bc <__gdtoa+0x724>
    7698:	4040106f          	j	8a9c <__gdtoa+0x1b04>
    769c:	214020ef          	jal	98b0 <__multadd>
    76a0:	000b8593          	mv	a1,s7
    76a4:	00050493          	mv	s1,a0
    76a8:	14050c63          	beqz	a0,7800 <__gdtoa+0x868>
    76ac:	610010ef          	jal	8cbc <__quorem_D2A>
    76b0:	03050d93          	addi	s11,a0,48
    76b4:	00090c13          	mv	s8,s2
    76b8:	000a8a13          	mv	s4,s5
    76bc:	000a0593          	mv	a1,s4
    76c0:	000b8513          	mv	a0,s7
    76c4:	35d020ef          	jal	a220 <__mcmp>
    76c8:	00050793          	mv	a5,a0
    76cc:	00000693          	li	a3,0
    76d0:	00a00613          	li	a2,10
    76d4:	000a0593          	mv	a1,s4
    76d8:	00040513          	mv	a0,s0
    76dc:	001c0913          	addi	s2,s8,1
    76e0:	00f04463          	bgtz	a5,76e8 <__gdtoa+0x750>
    76e4:	3a00106f          	j	8a84 <__gdtoa+0x1aec>
    76e8:	ffb90fa3          	sb	s11,-1(s2)
    76ec:	1c4020ef          	jal	98b0 <__multadd>
    76f0:	00050a93          	mv	s5,a0
    76f4:	00000693          	li	a3,0
    76f8:	00a00613          	li	a2,10
    76fc:	00048593          	mv	a1,s1
    7700:	00040513          	mv	a0,s0
    7704:	0e0a8e63          	beqz	s5,7800 <__gdtoa+0x868>
    7708:	f9499ae3          	bne	s3,s4,769c <__gdtoa+0x704>
    770c:	000a8993          	mv	s3,s5
    7710:	f8dff06f          	j	769c <__gdtoa+0x704>
    7714:	00400793          	li	a5,4
    7718:	10f31663          	bne	t1,a5,7824 <__gdtoa+0x88c>
    771c:	00812703          	lw	a4,8(sp)
    7720:	00c12603          	lw	a2,12(sp)
    7724:	0a412c83          	lw	s9,164(sp)
    7728:	0cc12083          	lw	ra,204(sp)
    772c:	0b012b03          	lw	s6,176(sp)
    7730:	0a012d03          	lw	s10,160(sp)
    7734:	ffff87b7          	lui	a5,0xffff8
    7738:	00f72023          	sw	a5,0(a4)
    773c:	00300693          	li	a3,3
    7740:	53018593          	addi	a1,gp,1328 # 12e40 <keypad_map+0x180>
    7744:	0d010113          	addi	sp,sp,208
    7748:	4a40106f          	j	8bec <__nrv_alloc_D2A>
    774c:	00048593          	mv	a1,s1
    7750:	00040513          	mv	a0,s0
    7754:	138020ef          	jal	988c <_Bfree>
    7758:	0c412483          	lw	s1,196(sp)
    775c:	0c012903          	lw	s2,192(sp)
    7760:	0bc12983          	lw	s3,188(sp)
    7764:	0b412a83          	lw	s5,180(sp)
    7768:	0ac12b83          	lw	s7,172(sp)
    776c:	0a812c03          	lw	s8,168(sp)
    7770:	09c12d83          	lw	s11,156(sp)
    7774:	00812703          	lw	a4,8(sp)
    7778:	00c12603          	lw	a2,12(sp)
    777c:	00100793          	li	a5,1
    7780:	00040513          	mv	a0,s0
    7784:	00f72023          	sw	a5,0(a4)
    7788:	00100693          	li	a3,1
    778c:	52018593          	addi	a1,gp,1312 # 12e30 <keypad_map+0x170>
    7790:	45c010ef          	jal	8bec <__nrv_alloc_D2A>
    7794:	0c812403          	lw	s0,200(sp)
    7798:	00050f13          	mv	t5,a0
    779c:	0cc12083          	lw	ra,204(sp)
    77a0:	0a412c83          	lw	s9,164(sp)
    77a4:	0b012b03          	lw	s6,176(sp)
    77a8:	0a012d03          	lw	s10,160(sp)
    77ac:	000f0513          	mv	a0,t5
    77b0:	0d010113          	addi	sp,sp,208
    77b4:	00008067          	ret
    77b8:	00812703          	lw	a4,8(sp)
    77bc:	00c12603          	lw	a2,12(sp)
    77c0:	0cc12083          	lw	ra,204(sp)
    77c4:	0b012b03          	lw	s6,176(sp)
    77c8:	0a012d03          	lw	s10,160(sp)
    77cc:	ffff87b7          	lui	a5,0xffff8
    77d0:	00f72023          	sw	a5,0(a4)
    77d4:	00800693          	li	a3,8
    77d8:	52418593          	addi	a1,gp,1316 # 12e34 <keypad_map+0x174>
    77dc:	0d010113          	addi	sp,sp,208
    77e0:	40c0106f          	j	8bec <__nrv_alloc_D2A>
    77e4:	000b8593          	mv	a1,s7
    77e8:	00040513          	mv	a0,s0
    77ec:	03e12023          	sw	t5,32(sp)
    77f0:	0a9020ef          	jal	a098 <__lshift>
    77f4:	02012f03          	lw	t5,32(sp)
    77f8:	00050b93          	mv	s7,a0
    77fc:	ce0514e3          	bnez	a0,74e4 <__gdtoa+0x54c>
    7800:	0c812403          	lw	s0,200(sp)
    7804:	0c412483          	lw	s1,196(sp)
    7808:	0c012903          	lw	s2,192(sp)
    780c:	0bc12983          	lw	s3,188(sp)
    7810:	0b812a03          	lw	s4,184(sp)
    7814:	0b412a83          	lw	s5,180(sp)
    7818:	0ac12b83          	lw	s7,172(sp)
    781c:	0a812c03          	lw	s8,168(sp)
    7820:	09c12d83          	lw	s11,156(sp)
    7824:	00000f13          	li	t5,0
    7828:	f75ff06f          	j	779c <__gdtoa+0x804>
    782c:	0004a823          	sw	zero,16(s1)
    7830:	8a1ff06f          	j	70d0 <__gdtoa+0x138>
    7834:	00100793          	li	a5,1
    7838:	04f12823          	sw	a5,80(sp)
    783c:	02012823          	sw	zero,48(sp)
    7840:	fffa0793          	addi	a5,s4,-1
    7844:	3c07c063          	bltz	a5,7c04 <__gdtoa+0xc6c>
    7848:	01c12783          	lw	a5,28(sp)
    784c:	a607d0e3          	bgez	a5,72ac <__gdtoa+0x314>
    7850:	01c12783          	lw	a5,28(sp)
    7854:	03012703          	lw	a4,48(sp)
    7858:	00012e23          	sw	zero,28(sp)
    785c:	02f12e23          	sw	a5,60(sp)
    7860:	40f70733          	sub	a4,a4,a5
    7864:	02e12823          	sw	a4,48(sp)
    7868:	40f00733          	neg	a4,a5
    786c:	02e12c23          	sw	a4,56(sp)
    7870:	a55ff06f          	j	72c4 <__gdtoa+0x32c>
    7874:	00050593          	mv	a1,a0
    7878:	00048513          	mv	a0,s1
    787c:	638010ef          	jal	8eb4 <__rshift_D2A>
    7880:	08c12683          	lw	a3,140(sp)
    7884:	015687b3          	add	a5,a3,s5
    7888:	02f12223          	sw	a5,36(sp)
    788c:	40dc0c33          	sub	s8,s8,a3
    7890:	855ff06f          	j	70e4 <__gdtoa+0x14c>
    7894:	02812783          	lw	a5,40(sp)
    7898:	00012823          	sw	zero,16(sp)
    789c:	3fd78793          	addi	a5,a5,1021 # ffff83fd <_memory_end+0xfffd83fd>
    78a0:	7f87ba13          	sltiu	s4,a5,2040
    78a4:	000b8513          	mv	a0,s7
    78a8:	6fc070ef          	jal	efa4 <__floatsidf>
    78ac:	000136b7          	lui	a3,0x13
    78b0:	6f86a603          	lw	a2,1784(a3) # 136f8 <__clz_tab+0x12c>
    78b4:	6fc6a683          	lw	a3,1788(a3)
    78b8:	0d5060ef          	jal	e18c <__muldf3>
    78bc:	668070ef          	jal	ef24 <__fixdfsi>
    78c0:	00100793          	li	a5,1
    78c4:	00350593          	addi	a1,a0,3
    78c8:	04f12023          	sw	a5,64(sp)
    78cc:	fff00793          	li	a5,-1
    78d0:	00058693          	mv	a3,a1
    78d4:	00012c23          	sw	zero,24(sp)
    78d8:	04f12a23          	sw	a5,84(sp)
    78dc:	02f12a23          	sw	a5,52(sp)
    78e0:	a59ff06f          	j	7338 <__gdtoa+0x3a0>
    78e4:	02812783          	lw	a5,40(sp)
    78e8:	00300693          	li	a3,3
    78ec:	40f687b3          	sub	a5,a3,a5
    78f0:	02f12423          	sw	a5,40(sp)
    78f4:	03412783          	lw	a5,52(sp)
    78f8:	00e00693          	li	a3,14
    78fc:	a6f6e6e3          	bltu	a3,a5,7368 <__gdtoa+0x3d0>
    7900:	a60a04e3          	beqz	s4,7368 <__gdtoa+0x3d0>
    7904:	03c12703          	lw	a4,60(sp)
    7908:	02812683          	lw	a3,40(sp)
    790c:	00d766b3          	or	a3,a4,a3
    7910:	a4069ce3          	bnez	a3,7368 <__gdtoa+0x3d0>
    7914:	05012703          	lw	a4,80(sp)
    7918:	08012623          	sw	zero,140(sp)
    791c:	05312c23          	sw	s3,88(sp)
    7920:	04412b03          	lw	s6,68(sp)
    7924:	02070463          	beqz	a4,794c <__gdtoa+0x9b4>
    7928:	000136b7          	lui	a3,0x13
    792c:	7006a603          	lw	a2,1792(a3) # 13700 <__clz_tab+0x134>
    7930:	7046a683          	lw	a3,1796(a3)
    7934:	000b0513          	mv	a0,s6
    7938:	00098593          	mv	a1,s3
    793c:	03e12423          	sw	t5,40(sp)
    7940:	770060ef          	jal	e0b0 <__ledf2>
    7944:	02812f03          	lw	t5,40(sp)
    7948:	6a0540e3          	bltz	a0,87e8 <__gdtoa+0x1850>
    794c:	04412783          	lw	a5,68(sp)
    7950:	03e12423          	sw	t5,40(sp)
    7954:	00078613          	mv	a2,a5
    7958:	00078513          	mv	a0,a5
    795c:	05812783          	lw	a5,88(sp)
    7960:	00078693          	mv	a3,a5
    7964:	00078593          	mv	a1,a5
    7968:	770050ef          	jal	d0d8 <__adddf3>
    796c:	000136b7          	lui	a3,0x13
    7970:	7186a603          	lw	a2,1816(a3) # 13718 <__clz_tab+0x14c>
    7974:	71c6a683          	lw	a3,1820(a3)
    7978:	760050ef          	jal	d0d8 <__adddf3>
    797c:	fcc007b7          	lui	a5,0xfcc00
    7980:	00b78a33          	add	s4,a5,a1
    7984:	03412783          	lw	a5,52(sp)
    7988:	02812f03          	lw	t5,40(sp)
    798c:	00050713          	mv	a4,a0
    7990:	28078ee3          	beqz	a5,842c <__gdtoa+0x1494>
    7994:	03412783          	lw	a5,52(sp)
    7998:	04412e83          	lw	t4,68(sp)
    799c:	05812803          	lw	a6,88(sp)
    79a0:	06012023          	sw	zero,96(sp)
    79a4:	04f12e23          	sw	a5,92(sp)
    79a8:	05c12683          	lw	a3,92(sp)
    79ac:	000137b7          	lui	a5,0x13
    79b0:	04012583          	lw	a1,64(sp)
    79b4:	fff68693          	addi	a3,a3,-1
    79b8:	23878613          	addi	a2,a5,568 # 13238 <__mprec_tens>
    79bc:	00369693          	slli	a3,a3,0x3
    79c0:	00c686b3          	add	a3,a3,a2
    79c4:	07012223          	sw	a6,100(sp)
    79c8:	03d12423          	sw	t4,40(sp)
    79cc:	0006a603          	lw	a2,0(a3)
    79d0:	0046a683          	lw	a3,4(a3)
    79d4:	44058ae3          	beqz	a1,8628 <__gdtoa+0x1690>
    79d8:	000135b7          	lui	a1,0x13
    79dc:	7285a503          	lw	a0,1832(a1) # 13728 <__clz_tab+0x15c>
    79e0:	72c5a583          	lw	a1,1836(a1)
    79e4:	06f12e23          	sw	a5,124(sp)
    79e8:	001f0b13          	addi	s6,t5,1
    79ec:	07e12a23          	sw	t5,116(sp)
    79f0:	04e12423          	sw	a4,72(sp)
    79f4:	679050ef          	jal	d86c <__divdf3>
    79f8:	04812703          	lw	a4,72(sp)
    79fc:	000a0693          	mv	a3,s4
    7a00:	00070613          	mv	a2,a4
    7a04:	579060ef          	jal	e77c <__subdf3>
    7a08:	02812e83          	lw	t4,40(sp)
    7a0c:	06412803          	lw	a6,100(sp)
    7a10:	00050613          	mv	a2,a0
    7a14:	00058693          	mv	a3,a1
    7a18:	000e8513          	mv	a0,t4
    7a1c:	00080593          	mv	a1,a6
    7a20:	07d12423          	sw	t4,104(sp)
    7a24:	05012423          	sw	a6,72(sp)
    7a28:	06c12623          	sw	a2,108(sp)
    7a2c:	06d12823          	sw	a3,112(sp)
    7a30:	4f4070ef          	jal	ef24 <__fixdfsi>
    7a34:	02a12423          	sw	a0,40(sp)
    7a38:	56c070ef          	jal	efa4 <__floatsidf>
    7a3c:	06812e83          	lw	t4,104(sp)
    7a40:	04812803          	lw	a6,72(sp)
    7a44:	00050613          	mv	a2,a0
    7a48:	00058693          	mv	a3,a1
    7a4c:	000e8513          	mv	a0,t4
    7a50:	00080593          	mv	a1,a6
    7a54:	529060ef          	jal	e77c <__subdf3>
    7a58:	02812e03          	lw	t3,40(sp)
    7a5c:	07412f03          	lw	t5,116(sp)
    7a60:	00050613          	mv	a2,a0
    7a64:	00058693          	mv	a3,a1
    7a68:	00050a13          	mv	s4,a0
    7a6c:	00058993          	mv	s3,a1
    7a70:	06c12503          	lw	a0,108(sp)
    7a74:	07012583          	lw	a1,112(sp)
    7a78:	030e0e13          	addi	t3,t3,48
    7a7c:	01cf0023          	sb	t3,0(t5)
    7a80:	03e12423          	sw	t5,40(sp)
    7a84:	550060ef          	jal	dfd4 <__gedf2>
    7a88:	02812f03          	lw	t5,40(sp)
    7a8c:	6aa048e3          	bgtz	a0,893c <__gdtoa+0x19a4>
    7a90:	000136b7          	lui	a3,0x13
    7a94:	7006a783          	lw	a5,1792(a3) # 13700 <__clz_tab+0x134>
    7a98:	7046a803          	lw	a6,1796(a3)
    7a9c:	000136b7          	lui	a3,0x13
    7aa0:	04f12423          	sw	a5,72(sp)
    7aa4:	05012623          	sw	a6,76(sp)
    7aa8:	7086a783          	lw	a5,1800(a3) # 13708 <__clz_tab+0x13c>
    7aac:	70c6a803          	lw	a6,1804(a3)
    7ab0:	06912223          	sw	s1,100(sp)
    7ab4:	07712a23          	sw	s7,116(sp)
    7ab8:	07812c23          	sw	s8,120(sp)
    7abc:	06c12483          	lw	s1,108(sp)
    7ac0:	05c12c03          	lw	s8,92(sp)
    7ac4:	07012b83          	lw	s7,112(sp)
    7ac8:	02f12423          	sw	a5,40(sp)
    7acc:	03012623          	sw	a6,44(sp)
    7ad0:	05e12e23          	sw	t5,92(sp)
    7ad4:	06812423          	sw	s0,104(sp)
    7ad8:	0800006f          	j	7b58 <__gdtoa+0xbc0>
    7adc:	08c12783          	lw	a5,140(sp)
    7ae0:	00178793          	addi	a5,a5,1
    7ae4:	08f12623          	sw	a5,140(sp)
    7ae8:	6d87d8e3          	bge	a5,s8,89b8 <__gdtoa+0x1a20>
    7aec:	6a0060ef          	jal	e18c <__muldf3>
    7af0:	02812603          	lw	a2,40(sp)
    7af4:	02c12683          	lw	a3,44(sp)
    7af8:	00050493          	mv	s1,a0
    7afc:	00058b93          	mv	s7,a1
    7b00:	000a0513          	mv	a0,s4
    7b04:	00098593          	mv	a1,s3
    7b08:	684060ef          	jal	e18c <__muldf3>
    7b0c:	00058a13          	mv	s4,a1
    7b10:	00050413          	mv	s0,a0
    7b14:	410070ef          	jal	ef24 <__fixdfsi>
    7b18:	00050993          	mv	s3,a0
    7b1c:	488070ef          	jal	efa4 <__floatsidf>
    7b20:	00050613          	mv	a2,a0
    7b24:	00058693          	mv	a3,a1
    7b28:	00040513          	mv	a0,s0
    7b2c:	000a0593          	mv	a1,s4
    7b30:	44d060ef          	jal	e77c <__subdf3>
    7b34:	03098793          	addi	a5,s3,48
    7b38:	00048613          	mv	a2,s1
    7b3c:	000b8693          	mv	a3,s7
    7b40:	00fb0023          	sb	a5,0(s6)
    7b44:	001b0b13          	addi	s6,s6,1
    7b48:	00050a13          	mv	s4,a0
    7b4c:	00058993          	mv	s3,a1
    7b50:	560060ef          	jal	e0b0 <__ledf2>
    7b54:	5c054ee3          	bltz	a0,8930 <__gdtoa+0x1998>
    7b58:	04812503          	lw	a0,72(sp)
    7b5c:	04c12583          	lw	a1,76(sp)
    7b60:	000a0613          	mv	a2,s4
    7b64:	00098693          	mv	a3,s3
    7b68:	415060ef          	jal	e77c <__subdf3>
    7b6c:	00050613          	mv	a2,a0
    7b70:	00058693          	mv	a3,a1
    7b74:	00048513          	mv	a0,s1
    7b78:	000b8593          	mv	a1,s7
    7b7c:	458060ef          	jal	dfd4 <__gedf2>
    7b80:	00050793          	mv	a5,a0
    7b84:	02812603          	lw	a2,40(sp)
    7b88:	02c12683          	lw	a3,44(sp)
    7b8c:	00048513          	mv	a0,s1
    7b90:	000b8593          	mv	a1,s7
    7b94:	f4f054e3          	blez	a5,7adc <__gdtoa+0xb44>
    7b98:	06012783          	lw	a5,96(sp)
    7b9c:	06412483          	lw	s1,100(sp)
    7ba0:	05c12f03          	lw	t5,92(sp)
    7ba4:	06812403          	lw	s0,104(sp)
    7ba8:	fffb4b83          	lbu	s7,-1(s6)
    7bac:	00178d93          	addi	s11,a5,1
    7bb0:	03900693          	li	a3,57
    7bb4:	0100006f          	j	7bc4 <__gdtoa+0xc2c>
    7bb8:	26ff02e3          	beq	t5,a5,861c <__gdtoa+0x1684>
    7bbc:	fff7cb83          	lbu	s7,-1(a5)
    7bc0:	00078b13          	mv	s6,a5
    7bc4:	fffb0793          	addi	a5,s6,-1
    7bc8:	fedb88e3          	beq	s7,a3,7bb8 <__gdtoa+0xc20>
    7bcc:	001b8693          	addi	a3,s7,1
    7bd0:	0ff6f693          	zext.b	a3,a3
    7bd4:	00d78023          	sb	a3,0(a5)
    7bd8:	000d8b93          	mv	s7,s11
    7bdc:	02000c93          	li	s9,32
    7be0:	2140006f          	j	7df4 <__gdtoa+0xe5c>
    7be4:	0c812403          	lw	s0,200(sp)
    7be8:	0c412483          	lw	s1,196(sp)
    7bec:	0c012903          	lw	s2,192(sp)
    7bf0:	0b412a83          	lw	s5,180(sp)
    7bf4:	0ac12b83          	lw	s7,172(sp)
    7bf8:	09c12d83          	lw	s11,156(sp)
    7bfc:	00000f13          	li	t5,0
    7c00:	b9dff06f          	j	779c <__gdtoa+0x804>
    7c04:	00100693          	li	a3,1
    7c08:	414687b3          	sub	a5,a3,s4
    7c0c:	02f12823          	sw	a5,48(sp)
    7c10:	02012023          	sw	zero,32(sp)
    7c14:	c35ff06f          	j	7848 <__gdtoa+0x8b0>
    7c18:	03812b03          	lw	s6,56(sp)
    7c1c:	03012a03          	lw	s4,48(sp)
    7c20:	00000993          	li	s3,0
    7c24:	ff0ff06f          	j	7414 <__gdtoa+0x47c>
    7c28:	00200793          	li	a5,2
    7c2c:	02f12423          	sw	a5,40(sp)
    7c30:	f30ff06f          	j	7360 <__gdtoa+0x3c8>
    7c34:	01c12783          	lw	a5,28(sp)
    7c38:	04012823          	sw	zero,80(sp)
    7c3c:	fff78793          	addi	a5,a5,-1
    7c40:	00f12e23          	sw	a5,28(sp)
    7c44:	bf9ff06f          	j	783c <__gdtoa+0x8a4>
    7c48:	ffc78793          	addi	a5,a5,-4
    7c4c:	00f12823          	sw	a5,16(sp)
    7c50:	00400613          	li	a2,4
    7c54:	22c78a63          	beq	a5,a2,7e88 <__gdtoa+0xef0>
    7c58:	6ed78463          	beq	a5,a3,8340 <__gdtoa+0x13a8>
    7c5c:	00200693          	li	a3,2
    7c60:	04012023          	sw	zero,64(sp)
    7c64:	00000a13          	li	s4,0
    7c68:	22d78663          	beq	a5,a3,7e94 <__gdtoa+0xefc>
    7c6c:	00300793          	li	a5,3
    7c70:	00f12823          	sw	a5,16(sp)
    7c74:	ea0ff06f          	j	7314 <__gdtoa+0x37c>
    7c78:	000136b7          	lui	a3,0x13
    7c7c:	00379793          	slli	a5,a5,0x3
    7c80:	23868693          	addi	a3,a3,568 # 13238 <__mprec_tens>
    7c84:	00d787b3          	add	a5,a5,a3
    7c88:	0007aa03          	lw	s4,0(a5)
    7c8c:	0047aa83          	lw	s5,4(a5)
    7c90:	01812783          	lw	a5,24(sp)
    7c94:	5407c463          	bltz	a5,81dc <__gdtoa+0x1244>
    7c98:	04812b03          	lw	s6,72(sp)
    7c9c:	00100793          	li	a5,1
    7ca0:	000a0613          	mv	a2,s4
    7ca4:	000a8693          	mv	a3,s5
    7ca8:	000b0513          	mv	a0,s6
    7cac:	00098593          	mv	a1,s3
    7cb0:	01e12823          	sw	t5,16(sp)
    7cb4:	08f12623          	sw	a5,140(sp)
    7cb8:	3b5050ef          	jal	d86c <__divdf3>
    7cbc:	268070ef          	jal	ef24 <__fixdfsi>
    7cc0:	00050913          	mv	s2,a0
    7cc4:	2e0070ef          	jal	efa4 <__floatsidf>
    7cc8:	000a0613          	mv	a2,s4
    7ccc:	000a8693          	mv	a3,s5
    7cd0:	4bc060ef          	jal	e18c <__muldf3>
    7cd4:	00050613          	mv	a2,a0
    7cd8:	00058693          	mv	a3,a1
    7cdc:	000b0513          	mv	a0,s6
    7ce0:	00098593          	mv	a1,s3
    7ce4:	299060ef          	jal	e77c <__subdf3>
    7ce8:	01012f03          	lw	t5,16(sp)
    7cec:	03c12703          	lw	a4,60(sp)
    7cf0:	03090793          	addi	a5,s2,48
    7cf4:	00ff0023          	sb	a5,0(t5)
    7cf8:	00000613          	li	a2,0
    7cfc:	00000693          	li	a3,0
    7d00:	00170d93          	addi	s11,a4,1
    7d04:	001f0b13          	addi	s6,t5,1
    7d08:	00050c13          	mv	s8,a0
    7d0c:	00058993          	mv	s3,a1
    7d10:	238060ef          	jal	df48 <__eqdf2>
    7d14:	01012f03          	lw	t5,16(sp)
    7d18:	000d8b93          	mv	s7,s11
    7d1c:	0c050c63          	beqz	a0,7df4 <__gdtoa+0xe5c>
    7d20:	000137b7          	lui	a5,0x13
    7d24:	70c7a803          	lw	a6,1804(a5) # 1370c <__clz_tab+0x140>
    7d28:	7087a783          	lw	a5,1800(a5)
    7d2c:	01912e23          	sw	s9,28(sp)
    7d30:	01b12c23          	sw	s11,24(sp)
    7d34:	03412c83          	lw	s9,52(sp)
    7d38:	000c0d93          	mv	s11,s8
    7d3c:	00f12823          	sw	a5,16(sp)
    7d40:	00098c13          	mv	s8,s3
    7d44:	01012a23          	sw	a6,20(sp)
    7d48:	000f0993          	mv	s3,t5
    7d4c:	0700006f          	j	7dbc <__gdtoa+0xe24>
    7d50:	09112623          	sw	a7,140(sp)
    7d54:	438060ef          	jal	e18c <__muldf3>
    7d58:	000a0613          	mv	a2,s4
    7d5c:	000a8693          	mv	a3,s5
    7d60:	00050d93          	mv	s11,a0
    7d64:	00058c13          	mv	s8,a1
    7d68:	305050ef          	jal	d86c <__divdf3>
    7d6c:	1b8070ef          	jal	ef24 <__fixdfsi>
    7d70:	00050913          	mv	s2,a0
    7d74:	230070ef          	jal	efa4 <__floatsidf>
    7d78:	000a0613          	mv	a2,s4
    7d7c:	000a8693          	mv	a3,s5
    7d80:	40c060ef          	jal	e18c <__muldf3>
    7d84:	00050613          	mv	a2,a0
    7d88:	00058693          	mv	a3,a1
    7d8c:	000d8513          	mv	a0,s11
    7d90:	000c0593          	mv	a1,s8
    7d94:	1e9060ef          	jal	e77c <__subdf3>
    7d98:	001b0b13          	addi	s6,s6,1
    7d9c:	03090793          	addi	a5,s2,48
    7da0:	fefb0fa3          	sb	a5,-1(s6)
    7da4:	00000613          	li	a2,0
    7da8:	00000693          	li	a3,0
    7dac:	00050d93          	mv	s11,a0
    7db0:	00058c13          	mv	s8,a1
    7db4:	194060ef          	jal	df48 <__eqdf2>
    7db8:	40050c63          	beqz	a0,81d0 <__gdtoa+0x1238>
    7dbc:	08c12803          	lw	a6,140(sp)
    7dc0:	01012603          	lw	a2,16(sp)
    7dc4:	01412683          	lw	a3,20(sp)
    7dc8:	000d8513          	mv	a0,s11
    7dcc:	000c0593          	mv	a1,s8
    7dd0:	00180893          	addi	a7,a6,1
    7dd4:	f7981ee3          	bne	a6,s9,7d50 <__gdtoa+0xdb8>
    7dd8:	02812703          	lw	a4,40(sp)
    7ddc:	01812d83          	lw	s11,24(sp)
    7de0:	00098f13          	mv	t5,s3
    7de4:	7c070063          	beqz	a4,85a4 <__gdtoa+0x160c>
    7de8:	00100793          	li	a5,1
    7dec:	01000c93          	li	s9,16
    7df0:	1ef708e3          	beq	a4,a5,87e0 <__gdtoa+0x1848>
    7df4:	00048593          	mv	a1,s1
    7df8:	00040513          	mv	a0,s0
    7dfc:	01e12823          	sw	t5,16(sp)
    7e00:	28d010ef          	jal	988c <_Bfree>
    7e04:	00812783          	lw	a5,8(sp)
    7e08:	000b0023          	sb	zero,0(s6)
    7e0c:	01012f03          	lw	t5,16(sp)
    7e10:	0177a023          	sw	s7,0(a5)
    7e14:	00c12783          	lw	a5,12(sp)
    7e18:	00078463          	beqz	a5,7e20 <__gdtoa+0xe88>
    7e1c:	0167a023          	sw	s6,0(a5)
    7e20:	000d2783          	lw	a5,0(s10)
    7e24:	0c812403          	lw	s0,200(sp)
    7e28:	0c412483          	lw	s1,196(sp)
    7e2c:	0197e7b3          	or	a5,a5,s9
    7e30:	0c012903          	lw	s2,192(sp)
    7e34:	0bc12983          	lw	s3,188(sp)
    7e38:	0b812a03          	lw	s4,184(sp)
    7e3c:	0b412a83          	lw	s5,180(sp)
    7e40:	0ac12b83          	lw	s7,172(sp)
    7e44:	0a812c03          	lw	s8,168(sp)
    7e48:	09c12d83          	lw	s11,156(sp)
    7e4c:	00fd2023          	sw	a5,0(s10)
    7e50:	94dff06f          	j	779c <__gdtoa+0x804>
    7e54:	e4dc1e63          	bne	s8,a3,74b0 <__gdtoa+0x518>
    7e58:	004da783          	lw	a5,4(s11)
    7e5c:	00178793          	addi	a5,a5,1
    7e60:	e557d863          	bge	a5,s5,74b0 <__gdtoa+0x518>
    7e64:	03012783          	lw	a5,48(sp)
    7e68:	00178793          	addi	a5,a5,1
    7e6c:	02f12823          	sw	a5,48(sp)
    7e70:	02012783          	lw	a5,32(sp)
    7e74:	00178793          	addi	a5,a5,1
    7e78:	02f12023          	sw	a5,32(sp)
    7e7c:	00100793          	li	a5,1
    7e80:	00f12e23          	sw	a5,28(sp)
    7e84:	e2cff06f          	j	74b0 <__gdtoa+0x518>
    7e88:	00100793          	li	a5,1
    7e8c:	00000a13          	li	s4,0
    7e90:	04f12023          	sw	a5,64(sp)
    7e94:	01812583          	lw	a1,24(sp)
    7e98:	00b04463          	bgtz	a1,7ea0 <__gdtoa+0xf08>
    7e9c:	00100593          	li	a1,1
    7ea0:	00058693          	mv	a3,a1
    7ea4:	04b12a23          	sw	a1,84(sp)
    7ea8:	02b12a23          	sw	a1,52(sp)
    7eac:	00b12c23          	sw	a1,24(sp)
    7eb0:	c88ff06f          	j	7338 <__gdtoa+0x3a0>
    7eb4:	1fd010ef          	jal	98b0 <__multadd>
    7eb8:	00050993          	mv	s3,a0
    7ebc:	940502e3          	beqz	a0,7800 <__gdtoa+0x868>
    7ec0:	00050a13          	mv	s4,a0
    7ec4:	f0cff06f          	j	75d0 <__gdtoa+0x638>
    7ec8:	e80ade63          	bgez	s5,7564 <__gdtoa+0x5cc>
    7ecc:	02812783          	lw	a5,40(sp)
    7ed0:	01812f03          	lw	t5,24(sp)
    7ed4:	01c12d03          	lw	s10,28(sp)
    7ed8:	00070c93          	mv	s9,a4
    7edc:	3c079ee3          	bnez	a5,8ab8 <__gdtoa+0x1b20>
    7ee0:	0104a683          	lw	a3,16(s1)
    7ee4:	00100793          	li	a5,1
    7ee8:	01000c93          	li	s9,16
    7eec:	001c0913          	addi	s2,s8,1
    7ef0:	36d7d0e3          	bge	a5,a3,8a50 <__gdtoa+0x1ab8>
    7ef4:	00098a93          	mv	s5,s3
    7ef8:	00090b13          	mv	s6,s2
    7efc:	01bc0023          	sb	s11,0(s8)
    7f00:	000a0993          	mv	s3,s4
    7f04:	000b8593          	mv	a1,s7
    7f08:	00040513          	mv	a0,s0
    7f0c:	01e12823          	sw	t5,16(sp)
    7f10:	17d010ef          	jal	988c <_Bfree>
    7f14:	03c12783          	lw	a5,60(sp)
    7f18:	01012f03          	lw	t5,16(sp)
    7f1c:	00178b93          	addi	s7,a5,1
    7f20:	ec098ae3          	beqz	s3,7df4 <__gdtoa+0xe5c>
    7f24:	000a8c63          	beqz	s5,7f3c <__gdtoa+0xfa4>
    7f28:	013a8a63          	beq	s5,s3,7f3c <__gdtoa+0xfa4>
    7f2c:	000a8593          	mv	a1,s5
    7f30:	00040513          	mv	a0,s0
    7f34:	159010ef          	jal	988c <_Bfree>
    7f38:	01012f03          	lw	t5,16(sp)
    7f3c:	00098593          	mv	a1,s3
    7f40:	00040513          	mv	a0,s0
    7f44:	01e12823          	sw	t5,16(sp)
    7f48:	145010ef          	jal	988c <_Bfree>
    7f4c:	01012f03          	lw	t5,16(sp)
    7f50:	ea5ff06f          	j	7df4 <__gdtoa+0xe5c>
    7f54:	00048593          	mv	a1,s1
    7f58:	00040513          	mv	a0,s0
    7f5c:	03e12223          	sw	t5,36(sp)
    7f60:	138020ef          	jal	a098 <__lshift>
    7f64:	00050493          	mv	s1,a0
    7f68:	88050ce3          	beqz	a0,7800 <__gdtoa+0x868>
    7f6c:	08c12783          	lw	a5,140(sp)
    7f70:	02412f03          	lw	t5,36(sp)
    7f74:	d64ff06f          	j	74d8 <__gdtoa+0x540>
    7f78:	000b8593          	mv	a1,s7
    7f7c:	00048513          	mv	a0,s1
    7f80:	03e12023          	sw	t5,32(sp)
    7f84:	29c020ef          	jal	a220 <__mcmp>
    7f88:	02012f03          	lw	t5,32(sp)
    7f8c:	d6055063          	bgez	a0,74ec <__gdtoa+0x554>
    7f90:	03c12783          	lw	a5,60(sp)
    7f94:	00048593          	mv	a1,s1
    7f98:	00000693          	li	a3,0
    7f9c:	fff78793          	addi	a5,a5,-1
    7fa0:	00a00613          	li	a2,10
    7fa4:	00040513          	mv	a0,s0
    7fa8:	02f12e23          	sw	a5,60(sp)
    7fac:	105010ef          	jal	98b0 <__multadd>
    7fb0:	00050493          	mv	s1,a0
    7fb4:	840506e3          	beqz	a0,7800 <__gdtoa+0x868>
    7fb8:	04012783          	lw	a5,64(sp)
    7fbc:	02012f03          	lw	t5,32(sp)
    7fc0:	120792e3          	bnez	a5,88e4 <__gdtoa+0x194c>
    7fc4:	05412783          	lw	a5,84(sp)
    7fc8:	1ef05863          	blez	a5,81b8 <__gdtoa+0x1220>
    7fcc:	02f12a23          	sw	a5,52(sp)
    7fd0:	03412903          	lw	s2,52(sp)
    7fd4:	000f0c13          	mv	s8,t5
    7fd8:	00100793          	li	a5,1
    7fdc:	000f0a13          	mv	s4,t5
    7fe0:	0180006f          	j	7ff8 <__gdtoa+0x1060>
    7fe4:	0cd010ef          	jal	98b0 <__multadd>
    7fe8:	00050493          	mv	s1,a0
    7fec:	80050ae3          	beqz	a0,7800 <__gdtoa+0x868>
    7ff0:	08c12783          	lw	a5,140(sp)
    7ff4:	00178793          	addi	a5,a5,1
    7ff8:	000b8593          	mv	a1,s7
    7ffc:	00048513          	mv	a0,s1
    8000:	08f12623          	sw	a5,140(sp)
    8004:	4b9000ef          	jal	8cbc <__quorem_D2A>
    8008:	03050d93          	addi	s11,a0,48
    800c:	01bc0023          	sb	s11,0(s8)
    8010:	08c12783          	lw	a5,140(sp)
    8014:	00000693          	li	a3,0
    8018:	00a00613          	li	a2,10
    801c:	00048593          	mv	a1,s1
    8020:	00040513          	mv	a0,s0
    8024:	001c0c13          	addi	s8,s8,1
    8028:	fb27cee3          	blt	a5,s2,7fe4 <__gdtoa+0x104c>
    802c:	000a0f13          	mv	t5,s4
    8030:	00000a93          	li	s5,0
    8034:	02812703          	lw	a4,40(sp)
    8038:	48070a63          	beqz	a4,84cc <__gdtoa+0x1534>
    803c:	00200793          	li	a5,2
    8040:	0104a683          	lw	a3,16(s1)
    8044:	4cf70063          	beq	a4,a5,8504 <__gdtoa+0x156c>
    8048:	00100793          	li	a5,1
    804c:	2ad7c463          	blt	a5,a3,82f4 <__gdtoa+0x135c>
    8050:	0144a783          	lw	a5,20(s1)
    8054:	2a079063          	bnez	a5,82f4 <__gdtoa+0x135c>
    8058:	00f037b3          	snez	a5,a5
    805c:	00479c93          	slli	s9,a5,0x4
    8060:	03000693          	li	a3,48
    8064:	fffc4783          	lbu	a5,-1(s8)
    8068:	000c0b13          	mv	s6,s8
    806c:	fffc0c13          	addi	s8,s8,-1
    8070:	fed78ae3          	beq	a5,a3,8064 <__gdtoa+0x10cc>
    8074:	e91ff06f          	j	7f04 <__gdtoa+0xf6c>
    8078:	03412783          	lw	a5,52(sp)
    807c:	03812703          	lw	a4,56(sp)
    8080:	fff78693          	addi	a3,a5,-1
    8084:	1ad74a63          	blt	a4,a3,8238 <__gdtoa+0x12a0>
    8088:	40d70b33          	sub	s6,a4,a3
    808c:	7e07d263          	bgez	a5,8870 <__gdtoa+0x18d8>
    8090:	03012783          	lw	a5,48(sp)
    8094:	03412703          	lw	a4,52(sp)
    8098:	08012623          	sw	zero,140(sp)
    809c:	40e78a33          	sub	s4,a5,a4
    80a0:	b58ff06f          	j	73f8 <__gdtoa+0x460>
    80a4:	01012703          	lw	a4,16(sp)
    80a8:	00200793          	li	a5,2
    80ac:	c4e7d463          	bge	a5,a4,74f4 <__gdtoa+0x55c>
    80b0:	000b8593          	mv	a1,s7
    80b4:	00000693          	li	a3,0
    80b8:	00500613          	li	a2,5
    80bc:	00040513          	mv	a0,s0
    80c0:	01e12823          	sw	t5,16(sp)
    80c4:	7ec010ef          	jal	98b0 <__multadd>
    80c8:	00050593          	mv	a1,a0
    80cc:	f2050a63          	beqz	a0,7800 <__gdtoa+0x868>
    80d0:	03412783          	lw	a5,52(sp)
    80d4:	01012f03          	lw	t5,16(sp)
    80d8:	14079663          	bnez	a5,8224 <__gdtoa+0x128c>
    80dc:	00a12823          	sw	a0,16(sp)
    80e0:	00048513          	mv	a0,s1
    80e4:	01e12e23          	sw	t5,28(sp)
    80e8:	138020ef          	jal	a220 <__mcmp>
    80ec:	01012583          	lw	a1,16(sp)
    80f0:	01c12f03          	lw	t5,28(sp)
    80f4:	12a05863          	blez	a0,8224 <__gdtoa+0x128c>
    80f8:	03c12783          	lw	a5,60(sp)
    80fc:	00278b93          	addi	s7,a5,2
    8100:	03100793          	li	a5,49
    8104:	001f0b13          	addi	s6,t5,1
    8108:	00ff0023          	sb	a5,0(t5)
    810c:	02000c93          	li	s9,32
    8110:	00040513          	mv	a0,s0
    8114:	01e12823          	sw	t5,16(sp)
    8118:	774010ef          	jal	988c <_Bfree>
    811c:	01012f03          	lw	t5,16(sp)
    8120:	cc098ae3          	beqz	s3,7df4 <__gdtoa+0xe5c>
    8124:	e19ff06f          	j	7f3c <__gdtoa+0xfa4>
    8128:	00100693          	li	a3,1
    812c:	00100593          	li	a1,1
    8130:	a08ff06f          	j	7338 <__gdtoa+0x3a0>
    8134:	00050593          	mv	a1,a0
    8138:	00078613          	mv	a2,a5
    813c:	00040513          	mv	a0,s0
    8140:	611010ef          	jal	9f50 <__pow5mult>
    8144:	00050b93          	mv	s7,a0
    8148:	ea050c63          	beqz	a0,7800 <__gdtoa+0x868>
    814c:	01012783          	lw	a5,16(sp)
    8150:	00100693          	li	a3,1
    8154:	02412f03          	lw	t5,36(sp)
    8158:	20f6dc63          	bge	a3,a5,8370 <__gdtoa+0x13d8>
    815c:	010ba783          	lw	a5,16(s7)
    8160:	03e12223          	sw	t5,36(sp)
    8164:	00378793          	addi	a5,a5,3
    8168:	00279793          	slli	a5,a5,0x2
    816c:	00fb87b3          	add	a5,s7,a5
    8170:	0047a503          	lw	a0,4(a5)
    8174:	1b1010ef          	jal	9b24 <__hi0bits>
    8178:	02412f03          	lw	t5,36(sp)
    817c:	00050a93          	mv	s5,a0
    8180:	01912e23          	sw	s9,28(sp)
    8184:	b30ff06f          	j	74b4 <__gdtoa+0x51c>
    8188:	01012783          	lw	a5,16(sp)
    818c:	00100693          	li	a3,1
    8190:	eef6c4e3          	blt	a3,a5,8078 <__gdtoa+0x10e0>
    8194:	03012783          	lw	a5,48(sp)
    8198:	02012703          	lw	a4,32(sp)
    819c:	03812b03          	lw	s6,56(sp)
    81a0:	00078a13          	mv	s4,a5
    81a4:	00c70733          	add	a4,a4,a2
    81a8:	00f607b3          	add	a5,a2,a5
    81ac:	02e12023          	sw	a4,32(sp)
    81b0:	02f12823          	sw	a5,48(sp)
    81b4:	a44ff06f          	j	73f8 <__gdtoa+0x460>
    81b8:	01012703          	lw	a4,16(sp)
    81bc:	00200793          	li	a5,2
    81c0:	0ae7cce3          	blt	a5,a4,8a78 <__gdtoa+0x1ae0>
    81c4:	05412783          	lw	a5,84(sp)
    81c8:	02f12a23          	sw	a5,52(sp)
    81cc:	e05ff06f          	j	7fd0 <__gdtoa+0x1038>
    81d0:	01c12c83          	lw	s9,28(sp)
    81d4:	00098f13          	mv	t5,s3
    81d8:	c1dff06f          	j	7df4 <__gdtoa+0xe5c>
    81dc:	03412783          	lw	a5,52(sp)
    81e0:	aaf04ce3          	bgtz	a5,7c98 <__gdtoa+0xd00>
    81e4:	02079c63          	bnez	a5,821c <__gdtoa+0x1284>
    81e8:	000137b7          	lui	a5,0x13
    81ec:	7207a603          	lw	a2,1824(a5) # 13720 <__clz_tab+0x154>
    81f0:	7247a683          	lw	a3,1828(a5)
    81f4:	000a0513          	mv	a0,s4
    81f8:	000a8593          	mv	a1,s5
    81fc:	01e12823          	sw	t5,16(sp)
    8200:	78d050ef          	jal	e18c <__muldf3>
    8204:	04812883          	lw	a7,72(sp)
    8208:	00098693          	mv	a3,s3
    820c:	00088613          	mv	a2,a7
    8210:	5c5050ef          	jal	dfd4 <__gedf2>
    8214:	01012f03          	lw	t5,16(sp)
    8218:	6a054c63          	bltz	a0,88d0 <__gdtoa+0x1938>
    821c:	00000593          	li	a1,0
    8220:	00000993          	li	s3,0
    8224:	01812783          	lw	a5,24(sp)
    8228:	000f0b13          	mv	s6,t5
    822c:	01000c93          	li	s9,16
    8230:	40f00bb3          	neg	s7,a5
    8234:	eddff06f          	j	8110 <__gdtoa+0x1178>
    8238:	03812783          	lw	a5,56(sp)
    823c:	03012703          	lw	a4,48(sp)
    8240:	00000b13          	li	s6,0
    8244:	40f68633          	sub	a2,a3,a5
    8248:	01c12783          	lw	a5,28(sp)
    824c:	00070a13          	mv	s4,a4
    8250:	02d12c23          	sw	a3,56(sp)
    8254:	00c787b3          	add	a5,a5,a2
    8258:	00f12e23          	sw	a5,28(sp)
    825c:	02012603          	lw	a2,32(sp)
    8260:	03412783          	lw	a5,52(sp)
    8264:	00f60633          	add	a2,a2,a5
    8268:	08f12623          	sw	a5,140(sp)
    826c:	00f707b3          	add	a5,a4,a5
    8270:	02c12023          	sw	a2,32(sp)
    8274:	02f12823          	sw	a5,48(sp)
    8278:	980ff06f          	j	73f8 <__gdtoa+0x460>
    827c:	00098593          	mv	a1,s3
    8280:	000b0613          	mv	a2,s6
    8284:	00040513          	mv	a0,s0
    8288:	03e12223          	sw	t5,36(sp)
    828c:	4c5010ef          	jal	9f50 <__pow5mult>
    8290:	00050993          	mv	s3,a0
    8294:	d6050663          	beqz	a0,7800 <__gdtoa+0x868>
    8298:	00050593          	mv	a1,a0
    829c:	00048613          	mv	a2,s1
    82a0:	00040513          	mv	a0,s0
    82a4:	281010ef          	jal	9d24 <__multiply>
    82a8:	00050b93          	mv	s7,a0
    82ac:	d4050a63          	beqz	a0,7800 <__gdtoa+0x868>
    82b0:	00048593          	mv	a1,s1
    82b4:	00040513          	mv	a0,s0
    82b8:	5d4010ef          	jal	988c <_Bfree>
    82bc:	03812783          	lw	a5,56(sp)
    82c0:	02412f03          	lw	t5,36(sp)
    82c4:	000b8493          	mv	s1,s7
    82c8:	416787b3          	sub	a5,a5,s6
    82cc:	02f12c23          	sw	a5,56(sp)
    82d0:	9a078863          	beqz	a5,7480 <__gdtoa+0x4e8>
    82d4:	98cff06f          	j	7460 <__gdtoa+0x4c8>
    82d8:	00098a93          	mv	s5,s3
    82dc:	000c0793          	mv	a5,s8
    82e0:	001c0913          	addi	s2,s8,1
    82e4:	000a0993          	mv	s3,s4
    82e8:	03900693          	li	a3,57
    82ec:	00090c13          	mv	s8,s2
    82f0:	00d78023          	sb	a3,0(a5)
    82f4:	03900693          	li	a3,57
    82f8:	0080006f          	j	8300 <__gdtoa+0x1368>
    82fc:	238f0063          	beq	t5,s8,851c <__gdtoa+0x1584>
    8300:	fffc4783          	lbu	a5,-1(s8)
    8304:	000c0b13          	mv	s6,s8
    8308:	fffc0c13          	addi	s8,s8,-1
    830c:	fed788e3          	beq	a5,a3,82fc <__gdtoa+0x1364>
    8310:	00178793          	addi	a5,a5,1
    8314:	00fc0023          	sb	a5,0(s8)
    8318:	02000c93          	li	s9,32
    831c:	be9ff06f          	j	7f04 <__gdtoa+0xf6c>
    8320:	00098593          	mv	a1,s3
    8324:	00040513          	mv	a0,s0
    8328:	01e12c23          	sw	t5,24(sp)
    832c:	56d010ef          	jal	a098 <__lshift>
    8330:	01812f03          	lw	t5,24(sp)
    8334:	00050993          	mv	s3,a0
    8338:	9c051663          	bnez	a0,7504 <__gdtoa+0x56c>
    833c:	cc4ff06f          	j	7800 <__gdtoa+0x868>
    8340:	00100793          	li	a5,1
    8344:	00000a13          	li	s4,0
    8348:	04f12023          	sw	a5,64(sp)
    834c:	fc9fe06f          	j	7314 <__gdtoa+0x37c>
    8350:	00100793          	li	a5,1
    8354:	04f12023          	sw	a5,64(sp)
    8358:	fbdfe06f          	j	7314 <__gdtoa+0x37c>
    835c:	00100793          	li	a5,1
    8360:	04f12023          	sw	a5,64(sp)
    8364:	b31ff06f          	j	7e94 <__gdtoa+0xefc>
    8368:	04012023          	sw	zero,64(sp)
    836c:	b29ff06f          	j	7e94 <__gdtoa+0xefc>
    8370:	dedc16e3          	bne	s8,a3,815c <__gdtoa+0x11c4>
    8374:	004da783          	lw	a5,4(s11)
    8378:	00178793          	addi	a5,a5,1
    837c:	df57d0e3          	bge	a5,s5,815c <__gdtoa+0x11c4>
    8380:	03012783          	lw	a5,48(sp)
    8384:	00100c93          	li	s9,1
    8388:	00178793          	addi	a5,a5,1
    838c:	02f12823          	sw	a5,48(sp)
    8390:	02012783          	lw	a5,32(sp)
    8394:	00178793          	addi	a5,a5,1
    8398:	02f12023          	sw	a5,32(sp)
    839c:	dc1ff06f          	j	815c <__gdtoa+0x11c4>
    83a0:	0049a583          	lw	a1,4(s3)
    83a4:	00040513          	mv	a0,s0
    83a8:	01e12c23          	sw	t5,24(sp)
    83ac:	42c010ef          	jal	97d8 <_Balloc>
    83b0:	00050a13          	mv	s4,a0
    83b4:	c4050663          	beqz	a0,7800 <__gdtoa+0x868>
    83b8:	0109a603          	lw	a2,16(s3)
    83bc:	00c98593          	addi	a1,s3,12
    83c0:	00c50513          	addi	a0,a0,12
    83c4:	00260613          	addi	a2,a2,2
    83c8:	00261613          	slli	a2,a2,0x2
    83cc:	820fe0ef          	jal	63ec <memcpy>
    83d0:	000a0593          	mv	a1,s4
    83d4:	00100613          	li	a2,1
    83d8:	00040513          	mv	a0,s0
    83dc:	4bd010ef          	jal	a098 <__lshift>
    83e0:	01812f03          	lw	t5,24(sp)
    83e4:	00050a13          	mv	s4,a0
    83e8:	00050463          	beqz	a0,83f0 <__gdtoa+0x1458>
    83ec:	924ff06f          	j	7510 <__gdtoa+0x578>
    83f0:	c10ff06f          	j	7800 <__gdtoa+0x868>
    83f4:	000b0613          	mv	a2,s6
    83f8:	00098693          	mv	a3,s3
    83fc:	000b0513          	mv	a0,s6
    8400:	00098593          	mv	a1,s3
    8404:	03e12423          	sw	t5,40(sp)
    8408:	4d1040ef          	jal	d0d8 <__adddf3>
    840c:	000136b7          	lui	a3,0x13
    8410:	7186a603          	lw	a2,1816(a3) # 13718 <__clz_tab+0x14c>
    8414:	71c6a683          	lw	a3,1820(a3)
    8418:	4c1040ef          	jal	d0d8 <__adddf3>
    841c:	02812f03          	lw	t5,40(sp)
    8420:	fcc007b7          	lui	a5,0xfcc00
    8424:	00050713          	mv	a4,a0
    8428:	00b78a33          	add	s4,a5,a1
    842c:	000136b7          	lui	a3,0x13
    8430:	7206a603          	lw	a2,1824(a3) # 13720 <__clz_tab+0x154>
    8434:	04412503          	lw	a0,68(sp)
    8438:	7246a683          	lw	a3,1828(a3)
    843c:	05812583          	lw	a1,88(sp)
    8440:	03e12423          	sw	t5,40(sp)
    8444:	04e12423          	sw	a4,72(sp)
    8448:	334060ef          	jal	e77c <__subdf3>
    844c:	04812703          	lw	a4,72(sp)
    8450:	000a0693          	mv	a3,s4
    8454:	00050993          	mv	s3,a0
    8458:	00070613          	mv	a2,a4
    845c:	00058b13          	mv	s6,a1
    8460:	375050ef          	jal	dfd4 <__gedf2>
    8464:	02812f03          	lw	t5,40(sp)
    8468:	42a04663          	bgtz	a0,8894 <__gdtoa+0x18fc>
    846c:	04812703          	lw	a4,72(sp)
    8470:	800008b7          	lui	a7,0x80000
    8474:	0148c8b3          	xor	a7,a7,s4
    8478:	00070613          	mv	a2,a4
    847c:	00098513          	mv	a0,s3
    8480:	00088693          	mv	a3,a7
    8484:	000b0593          	mv	a1,s6
    8488:	429050ef          	jal	e0b0 <__ledf2>
    848c:	02812f03          	lw	t5,40(sp)
    8490:	d80546e3          	bltz	a0,821c <__gdtoa+0x1284>
    8494:	04412783          	lw	a5,68(sp)
    8498:	02412703          	lw	a4,36(sp)
    849c:	05812983          	lw	s3,88(sp)
    84a0:	04f12423          	sw	a5,72(sp)
    84a4:	000137b7          	lui	a5,0x13
    84a8:	50074463          	bltz	a4,89b0 <__gdtoa+0x1a18>
    84ac:	2387aa03          	lw	s4,568(a5) # 13238 <__mprec_tens>
    84b0:	23c7aa83          	lw	s5,572(a5)
    84b4:	01812783          	lw	a5,24(sp)
    84b8:	02012423          	sw	zero,40(sp)
    84bc:	fc07de63          	bgez	a5,7c98 <__gdtoa+0xd00>
    84c0:	03412783          	lw	a5,52(sp)
    84c4:	fc079a63          	bnez	a5,7c98 <__gdtoa+0xd00>
    84c8:	d21ff06f          	j	81e8 <__gdtoa+0x1250>
    84cc:	00048593          	mv	a1,s1
    84d0:	00100613          	li	a2,1
    84d4:	00040513          	mv	a0,s0
    84d8:	01e12823          	sw	t5,16(sp)
    84dc:	3bd010ef          	jal	a098 <__lshift>
    84e0:	00050493          	mv	s1,a0
    84e4:	b0050e63          	beqz	a0,7800 <__gdtoa+0x868>
    84e8:	000b8593          	mv	a1,s7
    84ec:	535010ef          	jal	a220 <__mcmp>
    84f0:	01012f03          	lw	t5,16(sp)
    84f4:	e0a040e3          	bgtz	a0,82f4 <__gdtoa+0x135c>
    84f8:	00051663          	bnez	a0,8504 <__gdtoa+0x156c>
    84fc:	001dfd93          	andi	s11,s11,1
    8500:	de0d9ae3          	bnez	s11,82f4 <__gdtoa+0x135c>
    8504:	0104a683          	lw	a3,16(s1)
    8508:	00100793          	li	a5,1
    850c:	01000c93          	li	s9,16
    8510:	b4d7c8e3          	blt	a5,a3,8060 <__gdtoa+0x10c8>
    8514:	0144a783          	lw	a5,20(s1)
    8518:	b41ff06f          	j	8058 <__gdtoa+0x10c0>
    851c:	03c12783          	lw	a5,60(sp)
    8520:	02000c93          	li	s9,32
    8524:	00178793          	addi	a5,a5,1
    8528:	02f12e23          	sw	a5,60(sp)
    852c:	03100793          	li	a5,49
    8530:	00ff0023          	sb	a5,0(t5)
    8534:	9d1ff06f          	j	7f04 <__gdtoa+0xf6c>
    8538:	02812783          	lw	a5,40(sp)
    853c:	01812f03          	lw	t5,24(sp)
    8540:	01c12d03          	lw	s10,28(sp)
    8544:	00078e63          	beqz	a5,8560 <__gdtoa+0x15c8>
    8548:	0104a683          	lw	a3,16(s1)
    854c:	00100793          	li	a5,1
    8550:	92d7cc63          	blt	a5,a3,7688 <__gdtoa+0x6f0>
    8554:	0144a783          	lw	a5,20(s1)
    8558:	00078463          	beqz	a5,8560 <__gdtoa+0x15c8>
    855c:	92cff06f          	j	7688 <__gdtoa+0x6f0>
    8560:	00048593          	mv	a1,s1
    8564:	00100613          	li	a2,1
    8568:	00040513          	mv	a0,s0
    856c:	01e12823          	sw	t5,16(sp)
    8570:	329010ef          	jal	a098 <__lshift>
    8574:	00050493          	mv	s1,a0
    8578:	a8050463          	beqz	a0,7800 <__gdtoa+0x868>
    857c:	000b8593          	mv	a1,s7
    8580:	4a1010ef          	jal	a220 <__mcmp>
    8584:	01012f03          	lw	t5,16(sp)
    8588:	4ca05c63          	blez	a0,8a60 <__gdtoa+0x1ac8>
    858c:	03900793          	li	a5,57
    8590:	d4fd84e3          	beq	s11,a5,82d8 <__gdtoa+0x1340>
    8594:	02000793          	li	a5,32
    8598:	031b0d93          	addi	s11,s6,49
    859c:	02f12423          	sw	a5,40(sp)
    85a0:	941ff06f          	j	7ee0 <__gdtoa+0xf48>
    85a4:	00050613          	mv	a2,a0
    85a8:	00058693          	mv	a3,a1
    85ac:	01e12823          	sw	t5,16(sp)
    85b0:	329040ef          	jal	d0d8 <__adddf3>
    85b4:	000a0613          	mv	a2,s4
    85b8:	000a8693          	mv	a3,s5
    85bc:	00050c13          	mv	s8,a0
    85c0:	00058993          	mv	s3,a1
    85c4:	211050ef          	jal	dfd4 <__gedf2>
    85c8:	fffb4b83          	lbu	s7,-1(s6)
    85cc:	01012f03          	lw	t5,16(sp)
    85d0:	dea04063          	bgtz	a0,7bb0 <__gdtoa+0xc18>
    85d4:	000c0513          	mv	a0,s8
    85d8:	00098593          	mv	a1,s3
    85dc:	000a0613          	mv	a2,s4
    85e0:	000a8693          	mv	a3,s5
    85e4:	165050ef          	jal	df48 <__eqdf2>
    85e8:	01012f03          	lw	t5,16(sp)
    85ec:	00051663          	bnez	a0,85f8 <__gdtoa+0x1660>
    85f0:	00197913          	andi	s2,s2,1
    85f4:	da091e63          	bnez	s2,7bb0 <__gdtoa+0xc18>
    85f8:	000b0793          	mv	a5,s6
    85fc:	01000c93          	li	s9,16
    8600:	03000613          	li	a2,48
    8604:	fff7c703          	lbu	a4,-1(a5)
    8608:	00078b13          	mv	s6,a5
    860c:	fff78793          	addi	a5,a5,-1
    8610:	fec70ae3          	beq	a4,a2,8604 <__gdtoa+0x166c>
    8614:	000d8b93          	mv	s7,s11
    8618:	fdcff06f          	j	7df4 <__gdtoa+0xe5c>
    861c:	03100693          	li	a3,49
    8620:	001d8d93          	addi	s11,s11,1
    8624:	db0ff06f          	j	7bd4 <__gdtoa+0xc3c>
    8628:	00070513          	mv	a0,a4
    862c:	000a0593          	mv	a1,s4
    8630:	06f12e23          	sw	a5,124(sp)
    8634:	07e12823          	sw	t5,112(sp)
    8638:	355050ef          	jal	e18c <__muldf3>
    863c:	000136b7          	lui	a3,0x13
    8640:	7086a783          	lw	a5,1800(a3) # 13708 <__clz_tab+0x13c>
    8644:	07012f03          	lw	t5,112(sp)
    8648:	70c6a803          	lw	a6,1804(a3)
    864c:	04812603          	lw	a2,72(sp)
    8650:	02f12423          	sw	a5,40(sp)
    8654:	07c12783          	lw	a5,124(sp)
    8658:	06b12623          	sw	a1,108(sp)
    865c:	00000693          	li	a3,0
    8660:	00100593          	li	a1,1
    8664:	06912823          	sw	s1,112(sp)
    8668:	06812a23          	sw	s0,116(sp)
    866c:	05c12483          	lw	s1,92(sp)
    8670:	07212c23          	sw	s2,120(sp)
    8674:	03012623          	sw	a6,44(sp)
    8678:	06a12423          	sw	a0,104(sp)
    867c:	08b12623          	sw	a1,140(sp)
    8680:	07312223          	sw	s3,100(sp)
    8684:	000f0b13          	mv	s6,t5
    8688:	05e12e23          	sw	t5,92(sp)
    868c:	00068413          	mv	s0,a3
    8690:	00078b93          	mv	s7,a5
    8694:	00060913          	mv	s2,a2
    8698:	0180006f          	j	86b0 <__gdtoa+0x1718>
    869c:	08612623          	sw	t1,140(sp)
    86a0:	2ed050ef          	jal	e18c <__muldf3>
    86a4:	00050913          	mv	s2,a0
    86a8:	00058993          	mv	s3,a1
    86ac:	00100413          	li	s0,1
    86b0:	00090513          	mv	a0,s2
    86b4:	00098593          	mv	a1,s3
    86b8:	06d060ef          	jal	ef24 <__fixdfsi>
    86bc:	00050a13          	mv	s4,a0
    86c0:	02050463          	beqz	a0,86e8 <__gdtoa+0x1750>
    86c4:	0e1060ef          	jal	efa4 <__floatsidf>
    86c8:	00050613          	mv	a2,a0
    86cc:	00058693          	mv	a3,a1
    86d0:	00090513          	mv	a0,s2
    86d4:	00098593          	mv	a1,s3
    86d8:	0a4060ef          	jal	e77c <__subdf3>
    86dc:	00050913          	mv	s2,a0
    86e0:	00058993          	mv	s3,a1
    86e4:	00100413          	li	s0,1
    86e8:	030a0793          	addi	a5,s4,48
    86ec:	001b0b13          	addi	s6,s6,1
    86f0:	0ff7f793          	zext.b	a5,a5
    86f4:	fefb0fa3          	sb	a5,-1(s6)
    86f8:	08c12883          	lw	a7,140(sp)
    86fc:	02812603          	lw	a2,40(sp)
    8700:	02c12683          	lw	a3,44(sp)
    8704:	00090513          	mv	a0,s2
    8708:	00098593          	mv	a1,s3
    870c:	00188313          	addi	t1,a7,1 # 80000001 <_memory_end+0x7ffe0001>
    8710:	f89896e3          	bne	a7,s1,869c <__gdtoa+0x1704>
    8714:	000b8713          	mv	a4,s7
    8718:	00040693          	mv	a3,s0
    871c:	00078b93          	mv	s7,a5
    8720:	07012483          	lw	s1,112(sp)
    8724:	05c12f03          	lw	t5,92(sp)
    8728:	07412403          	lw	s0,116(sp)
    872c:	07812903          	lw	s2,120(sp)
    8730:	00070793          	mv	a5,a4
    8734:	00068663          	beqz	a3,8740 <__gdtoa+0x17a8>
    8738:	04a12423          	sw	a0,72(sp)
    873c:	07312223          	sw	s3,100(sp)
    8740:	000139b7          	lui	s3,0x13
    8744:	7289a603          	lw	a2,1832(s3) # 13728 <__clz_tab+0x15c>
    8748:	72c9a683          	lw	a3,1836(s3)
    874c:	06812503          	lw	a0,104(sp)
    8750:	06c12583          	lw	a1,108(sp)
    8754:	03e12423          	sw	t5,40(sp)
    8758:	04f12e23          	sw	a5,92(sp)
    875c:	17d040ef          	jal	d0d8 <__adddf3>
    8760:	06412a03          	lw	s4,100(sp)
    8764:	04812603          	lw	a2,72(sp)
    8768:	000a0693          	mv	a3,s4
    876c:	145050ef          	jal	e0b0 <__ledf2>
    8770:	02812f03          	lw	t5,40(sp)
    8774:	1e054c63          	bltz	a0,896c <__gdtoa+0x19d4>
    8778:	06812603          	lw	a2,104(sp)
    877c:	06c12683          	lw	a3,108(sp)
    8780:	7289a503          	lw	a0,1832(s3)
    8784:	72c9a583          	lw	a1,1836(s3)
    8788:	7f5050ef          	jal	e77c <__subdf3>
    878c:	04812603          	lw	a2,72(sp)
    8790:	000a0693          	mv	a3,s4
    8794:	041050ef          	jal	dfd4 <__gedf2>
    8798:	02812f03          	lw	t5,40(sp)
    879c:	05c12783          	lw	a5,92(sp)
    87a0:	26a04e63          	bgtz	a0,8a1c <__gdtoa+0x1a84>
    87a4:	04412703          	lw	a4,68(sp)
    87a8:	05812983          	lw	s3,88(sp)
    87ac:	04e12423          	sw	a4,72(sp)
    87b0:	02412703          	lw	a4,36(sp)
    87b4:	ce075ce3          	bgez	a4,84ac <__gdtoa+0x1514>
    87b8:	03812b03          	lw	s6,56(sp)
    87bc:	03012a03          	lw	s4,48(sp)
    87c0:	02012423          	sw	zero,40(sp)
    87c4:	00000993          	li	s3,0
    87c8:	c4dfe06f          	j	7414 <__gdtoa+0x47c>
    87cc:	00098a93          	mv	s5,s3
    87d0:	01812f03          	lw	t5,24(sp)
    87d4:	01c12d03          	lw	s10,28(sp)
    87d8:	000a0993          	mv	s3,s4
    87dc:	859ff06f          	j	8034 <__gdtoa+0x109c>
    87e0:	fffb4b83          	lbu	s7,-1(s6)
    87e4:	bccff06f          	j	7bb0 <__gdtoa+0xc18>
    87e8:	03412783          	lw	a5,52(sp)
    87ec:	c00784e3          	beqz	a5,83f4 <__gdtoa+0x145c>
    87f0:	05412783          	lw	a5,84(sp)
    87f4:	caf050e3          	blez	a5,8494 <__gdtoa+0x14fc>
    87f8:	000136b7          	lui	a3,0x13
    87fc:	7086a603          	lw	a2,1800(a3) # 13708 <__clz_tab+0x13c>
    8800:	70c6a683          	lw	a3,1804(a3)
    8804:	00098593          	mv	a1,s3
    8808:	000b0513          	mv	a0,s6
    880c:	07e12423          	sw	t5,104(sp)
    8810:	17d050ef          	jal	e18c <__muldf3>
    8814:	000136b7          	lui	a3,0x13
    8818:	7106a603          	lw	a2,1808(a3) # 13710 <__clz_tab+0x144>
    881c:	7146a683          	lw	a3,1812(a3)
    8820:	00058993          	mv	s3,a1
    8824:	04a12423          	sw	a0,72(sp)
    8828:	06a12223          	sw	a0,100(sp)
    882c:	02b12423          	sw	a1,40(sp)
    8830:	15d050ef          	jal	e18c <__muldf3>
    8834:	000136b7          	lui	a3,0x13
    8838:	7186a603          	lw	a2,1816(a3) # 13718 <__clz_tab+0x14c>
    883c:	71c6a683          	lw	a3,1820(a3)
    8840:	099040ef          	jal	d0d8 <__adddf3>
    8844:	fcc007b7          	lui	a5,0xfcc00
    8848:	00b78a33          	add	s4,a5,a1
    884c:	05412783          	lw	a5,84(sp)
    8850:	06412e83          	lw	t4,100(sp)
    8854:	06812f03          	lw	t5,104(sp)
    8858:	04f12e23          	sw	a5,92(sp)
    885c:	fff00793          	li	a5,-1
    8860:	00050713          	mv	a4,a0
    8864:	06f12023          	sw	a5,96(sp)
    8868:	00098813          	mv	a6,s3
    886c:	93cff06f          	j	79a8 <__gdtoa+0xa10>
    8870:	03012703          	lw	a4,48(sp)
    8874:	02012683          	lw	a3,32(sp)
    8878:	08f12623          	sw	a5,140(sp)
    887c:	00070a13          	mv	s4,a4
    8880:	00f686b3          	add	a3,a3,a5
    8884:	00f707b3          	add	a5,a4,a5
    8888:	02d12023          	sw	a3,32(sp)
    888c:	02f12823          	sw	a5,48(sp)
    8890:	b69fe06f          	j	73f8 <__gdtoa+0x460>
    8894:	00200b93          	li	s7,2
    8898:	00000593          	li	a1,0
    889c:	00000993          	li	s3,0
    88a0:	861ff06f          	j	8100 <__gdtoa+0x1168>
    88a4:	03900793          	li	a5,57
    88a8:	01812f03          	lw	t5,24(sp)
    88ac:	01c12d03          	lw	s10,28(sp)
    88b0:	a2fd84e3          	beq	s11,a5,82d8 <__gdtoa+0x1340>
    88b4:	001d8d93          	addi	s11,s11,1
    88b8:	00098a93          	mv	s5,s3
    88bc:	001c0b13          	addi	s6,s8,1
    88c0:	01bc0023          	sb	s11,0(s8)
    88c4:	000a0993          	mv	s3,s4
    88c8:	02000c93          	li	s9,32
    88cc:	e38ff06f          	j	7f04 <__gdtoa+0xf6c>
    88d0:	03c12783          	lw	a5,60(sp)
    88d4:	00000593          	li	a1,0
    88d8:	00000993          	li	s3,0
    88dc:	00278b93          	addi	s7,a5,2 # fcc00002 <_memory_end+0xfcbe0002>
    88e0:	821ff06f          	j	8100 <__gdtoa+0x1168>
    88e4:	00098593          	mv	a1,s3
    88e8:	00000693          	li	a3,0
    88ec:	00a00613          	li	a2,10
    88f0:	00040513          	mv	a0,s0
    88f4:	7bd000ef          	jal	98b0 <__multadd>
    88f8:	00050993          	mv	s3,a0
    88fc:	00051463          	bnez	a0,8904 <__gdtoa+0x196c>
    8900:	f01fe06f          	j	7800 <__gdtoa+0x868>
    8904:	05412783          	lw	a5,84(sp)
    8908:	02012f03          	lw	t5,32(sp)
    890c:	00f05663          	blez	a5,8918 <__gdtoa+0x1980>
    8910:	02f12a23          	sw	a5,52(sp)
    8914:	be9fe06f          	j	74fc <__gdtoa+0x564>
    8918:	01012703          	lw	a4,16(sp)
    891c:	00200793          	li	a5,2
    8920:	14e7cc63          	blt	a5,a4,8a78 <__gdtoa+0x1ae0>
    8924:	05412783          	lw	a5,84(sp)
    8928:	02f12a23          	sw	a5,52(sp)
    892c:	bd1fe06f          	j	74fc <__gdtoa+0x564>
    8930:	06412483          	lw	s1,100(sp)
    8934:	05c12f03          	lw	t5,92(sp)
    8938:	06812403          	lw	s0,104(sp)
    893c:	000a0513          	mv	a0,s4
    8940:	00098593          	mv	a1,s3
    8944:	00000613          	li	a2,0
    8948:	00000693          	li	a3,0
    894c:	01e12823          	sw	t5,16(sp)
    8950:	5f8050ef          	jal	df48 <__eqdf2>
    8954:	00a037b3          	snez	a5,a0
    8958:	00479c93          	slli	s9,a5,0x4
    895c:	06012783          	lw	a5,96(sp)
    8960:	01012f03          	lw	t5,16(sp)
    8964:	00178b93          	addi	s7,a5,1
    8968:	c8cff06f          	j	7df4 <__gdtoa+0xe5c>
    896c:	06012783          	lw	a5,96(sp)
    8970:	00178d93          	addi	s11,a5,1
    8974:	a3cff06f          	j	7bb0 <__gdtoa+0xc18>
    8978:	03412783          	lw	a5,52(sp)
    897c:	03812703          	lw	a4,56(sp)
    8980:	fff78693          	addi	a3,a5,-1
    8984:	8ad74ae3          	blt	a4,a3,8238 <__gdtoa+0x12a0>
    8988:	03012583          	lw	a1,48(sp)
    898c:	02012603          	lw	a2,32(sp)
    8990:	08f12623          	sw	a5,140(sp)
    8994:	00058a13          	mv	s4,a1
    8998:	00f60633          	add	a2,a2,a5
    899c:	00f587b3          	add	a5,a1,a5
    89a0:	02c12023          	sw	a2,32(sp)
    89a4:	40d70b33          	sub	s6,a4,a3
    89a8:	02f12823          	sw	a5,48(sp)
    89ac:	a4dfe06f          	j	73f8 <__gdtoa+0x460>
    89b0:	02012423          	sw	zero,40(sp)
    89b4:	9c9fe06f          	j	737c <__gdtoa+0x3e4>
    89b8:	04412703          	lw	a4,68(sp)
    89bc:	06412483          	lw	s1,100(sp)
    89c0:	07412b83          	lw	s7,116(sp)
    89c4:	04e12423          	sw	a4,72(sp)
    89c8:	02412703          	lw	a4,36(sp)
    89cc:	07812c03          	lw	s8,120(sp)
    89d0:	05c12f03          	lw	t5,92(sp)
    89d4:	06812403          	lw	s0,104(sp)
    89d8:	07c12783          	lw	a5,124(sp)
    89dc:	05812983          	lw	s3,88(sp)
    89e0:	ac0756e3          	bgez	a4,84ac <__gdtoa+0x1514>
    89e4:	02012423          	sw	zero,40(sp)
    89e8:	99dfe06f          	j	7384 <__gdtoa+0x3ec>
    89ec:	03900793          	li	a5,57
    89f0:	01812f03          	lw	t5,24(sp)
    89f4:	01c12d03          	lw	s10,28(sp)
    89f8:	8efd80e3          	beq	s11,a5,82d8 <__gdtoa+0x1340>
    89fc:	0f505063          	blez	s5,8adc <__gdtoa+0x1b44>
    8a00:	031b0d93          	addi	s11,s6,49
    8a04:	02000c93          	li	s9,32
    8a08:	00098a93          	mv	s5,s3
    8a0c:	001c0b13          	addi	s6,s8,1
    8a10:	01bc0023          	sb	s11,0(s8)
    8a14:	000a0993          	mv	s3,s4
    8a18:	cecff06f          	j	7f04 <__gdtoa+0xf6c>
    8a1c:	04812503          	lw	a0,72(sp)
    8a20:	000a0593          	mv	a1,s4
    8a24:	00000613          	li	a2,0
    8a28:	00000693          	li	a3,0
    8a2c:	01e12823          	sw	t5,16(sp)
    8a30:	518050ef          	jal	df48 <__eqdf2>
    8a34:	06012703          	lw	a4,96(sp)
    8a38:	00a037b3          	snez	a5,a0
    8a3c:	00479c93          	slli	s9,a5,0x4
    8a40:	01012f03          	lw	t5,16(sp)
    8a44:	000b0793          	mv	a5,s6
    8a48:	00170d93          	addi	s11,a4,1
    8a4c:	bb5ff06f          	j	8600 <__gdtoa+0x1668>
    8a50:	0144a783          	lw	a5,20(s1)
    8a54:	ca079063          	bnez	a5,7ef4 <__gdtoa+0xf5c>
    8a58:	02812c83          	lw	s9,40(sp)
    8a5c:	c98ff06f          	j	7ef4 <__gdtoa+0xf5c>
    8a60:	00051663          	bnez	a0,8a6c <__gdtoa+0x1ad4>
    8a64:	001df793          	andi	a5,s11,1
    8a68:	b20792e3          	bnez	a5,858c <__gdtoa+0x15f4>
    8a6c:	02000793          	li	a5,32
    8a70:	02f12423          	sw	a5,40(sp)
    8a74:	c6cff06f          	j	7ee0 <__gdtoa+0xf48>
    8a78:	05412783          	lw	a5,84(sp)
    8a7c:	02f12a23          	sw	a5,52(sp)
    8a80:	e30ff06f          	j	80b0 <__gdtoa+0x1118>
    8a84:	03900793          	li	a5,57
    8a88:	000b0f13          	mv	t5,s6
    8a8c:	00fd8e63          	beq	s11,a5,8aa8 <__gdtoa+0x1b10>
    8a90:	001d8d93          	addi	s11,s11,1
    8a94:	02000c93          	li	s9,32
    8a98:	c5cff06f          	j	7ef4 <__gdtoa+0xf5c>
    8a9c:	01000c93          	li	s9,16
    8aa0:	001c0913          	addi	s2,s8,1
    8aa4:	c50ff06f          	j	7ef4 <__gdtoa+0xf5c>
    8aa8:	00098a93          	mv	s5,s3
    8aac:	000c0793          	mv	a5,s8
    8ab0:	000a0993          	mv	s3,s4
    8ab4:	835ff06f          	j	82e8 <__gdtoa+0x1350>
    8ab8:	0104a683          	lw	a3,16(s1)
    8abc:	00100793          	li	a5,1
    8ac0:	00d7d463          	bge	a5,a3,8ac8 <__gdtoa+0x1b30>
    8ac4:	bc5fe06f          	j	7688 <__gdtoa+0x6f0>
    8ac8:	0144a783          	lw	a5,20(s1)
    8acc:	00078463          	beqz	a5,8ad4 <__gdtoa+0x1b3c>
    8ad0:	bb9fe06f          	j	7688 <__gdtoa+0x6f0>
    8ad4:	001c0913          	addi	s2,s8,1
    8ad8:	c1cff06f          	j	7ef4 <__gdtoa+0xf5c>
    8adc:	0104a683          	lw	a3,16(s1)
    8ae0:	00100793          	li	a5,1
    8ae4:	01000c93          	li	s9,16
    8ae8:	f2d7c0e3          	blt	a5,a3,8a08 <__gdtoa+0x1a70>
    8aec:	0144a783          	lw	a5,20(s1)
    8af0:	00f037b3          	snez	a5,a5
    8af4:	00479c93          	slli	s9,a5,0x4
    8af8:	f11ff06f          	j	8a08 <__gdtoa+0x1a70>
    8afc:	020ac263          	bltz	s5,8b20 <__gdtoa+0x1b88>
    8b00:	015ceab3          	or	s5,s9,s5
    8b04:	000a9863          	bnez	s5,8b14 <__gdtoa+0x1b7c>
    8b08:	00092703          	lw	a4,0(s2)
    8b0c:	00177713          	andi	a4,a4,1
    8b10:	00070863          	beqz	a4,8b20 <__gdtoa+0x1b88>
    8b14:	00f04463          	bgtz	a5,8b1c <__gdtoa+0x1b84>
    8b18:	a4dfe06f          	j	7564 <__gdtoa+0x5cc>
    8b1c:	a39fe06f          	j	7554 <__gdtoa+0x5bc>
    8b20:	02812703          	lw	a4,40(sp)
    8b24:	01812f03          	lw	t5,24(sp)
    8b28:	01c12d03          	lw	s10,28(sp)
    8b2c:	02070863          	beqz	a4,8b5c <__gdtoa+0x1bc4>
    8b30:	0104a603          	lw	a2,16(s1)
    8b34:	00100693          	li	a3,1
    8b38:	00c6d463          	bge	a3,a2,8b40 <__gdtoa+0x1ba8>
    8b3c:	b4dfe06f          	j	7688 <__gdtoa+0x6f0>
    8b40:	0144a683          	lw	a3,20(s1)
    8b44:	00068463          	beqz	a3,8b4c <__gdtoa+0x1bb4>
    8b48:	b41fe06f          	j	7688 <__gdtoa+0x6f0>
    8b4c:	a0f04ae3          	bgtz	a5,8560 <__gdtoa+0x15c8>
    8b50:	00000c93          	li	s9,0
    8b54:	001c0913          	addi	s2,s8,1
    8b58:	b9cff06f          	j	7ef4 <__gdtoa+0xf5c>
    8b5c:	b8f05263          	blez	a5,7ee0 <__gdtoa+0xf48>
    8b60:	a01ff06f          	j	8560 <__gdtoa+0x15c8>

00008b64 <__rv_alloc_D2A.part.0>:
    8b64:	ff010113          	addi	sp,sp,-16
    8b68:	53418693          	addi	a3,gp,1332 # 12e44 <keypad_map+0x184>
    8b6c:	00000613          	li	a2,0
    8b70:	03900593          	li	a1,57
    8b74:	54818513          	addi	a0,gp,1352 # 12e58 <keypad_map+0x198>
    8b78:	00112623          	sw	ra,12(sp)
    8b7c:	2b9020ef          	jal	b634 <__assert_func>

00008b80 <__rv_alloc_D2A>:
    8b80:	ff010113          	addi	sp,sp,-16
    8b84:	00812423          	sw	s0,8(sp)
    8b88:	00112623          	sw	ra,12(sp)
    8b8c:	01700693          	li	a3,23
    8b90:	00050413          	mv	s0,a0
    8b94:	00100713          	li	a4,1
    8b98:	00400793          	li	a5,4
    8b9c:	04b6f063          	bgeu	a3,a1,8bdc <__rv_alloc_D2A+0x5c>
    8ba0:	00179793          	slli	a5,a5,0x1
    8ba4:	01478693          	addi	a3,a5,20
    8ba8:	00070613          	mv	a2,a4
    8bac:	00170713          	addi	a4,a4,1
    8bb0:	fed5f8e3          	bgeu	a1,a3,8ba0 <__rv_alloc_D2A+0x20>
    8bb4:	00060593          	mv	a1,a2
    8bb8:	02c42e23          	sw	a2,60(s0)
    8bbc:	00040513          	mv	a0,s0
    8bc0:	419000ef          	jal	97d8 <_Balloc>
    8bc4:	02050263          	beqz	a0,8be8 <__rv_alloc_D2A+0x68>
    8bc8:	00c12083          	lw	ra,12(sp)
    8bcc:	02a42c23          	sw	a0,56(s0)
    8bd0:	00812403          	lw	s0,8(sp)
    8bd4:	01010113          	addi	sp,sp,16
    8bd8:	00008067          	ret
    8bdc:	02052e23          	sw	zero,60(a0)
    8be0:	00000593          	li	a1,0
    8be4:	fd9ff06f          	j	8bbc <__rv_alloc_D2A+0x3c>
    8be8:	f7dff0ef          	jal	8b64 <__rv_alloc_D2A.part.0>

00008bec <__nrv_alloc_D2A>:
    8bec:	ff010113          	addi	sp,sp,-16
    8bf0:	00812423          	sw	s0,8(sp)
    8bf4:	00912223          	sw	s1,4(sp)
    8bf8:	01212023          	sw	s2,0(sp)
    8bfc:	00112623          	sw	ra,12(sp)
    8c00:	01700813          	li	a6,23
    8c04:	00050493          	mv	s1,a0
    8c08:	00058413          	mv	s0,a1
    8c0c:	00060913          	mv	s2,a2
    8c10:	00100713          	li	a4,1
    8c14:	00400793          	li	a5,4
    8c18:	06d87a63          	bgeu	a6,a3,8c8c <__nrv_alloc_D2A+0xa0>
    8c1c:	00179793          	slli	a5,a5,0x1
    8c20:	01478813          	addi	a6,a5,20
    8c24:	00070593          	mv	a1,a4
    8c28:	00170713          	addi	a4,a4,1
    8c2c:	ff06f8e3          	bgeu	a3,a6,8c1c <__nrv_alloc_D2A+0x30>
    8c30:	02b4ae23          	sw	a1,60(s1)
    8c34:	00048513          	mv	a0,s1
    8c38:	3a1000ef          	jal	97d8 <_Balloc>
    8c3c:	06050263          	beqz	a0,8ca0 <__nrv_alloc_D2A+0xb4>
    8c40:	02a4ac23          	sw	a0,56(s1)
    8c44:	00044783          	lbu	a5,0(s0)
    8c48:	00140593          	addi	a1,s0,1
    8c4c:	00f50023          	sb	a5,0(a0)
    8c50:	04078463          	beqz	a5,8c98 <__nrv_alloc_D2A+0xac>
    8c54:	00050793          	mv	a5,a0
    8c58:	0005c703          	lbu	a4,0(a1)
    8c5c:	00178793          	addi	a5,a5,1
    8c60:	00158593          	addi	a1,a1,1
    8c64:	00e78023          	sb	a4,0(a5)
    8c68:	fe0718e3          	bnez	a4,8c58 <__nrv_alloc_D2A+0x6c>
    8c6c:	00090463          	beqz	s2,8c74 <__nrv_alloc_D2A+0x88>
    8c70:	00f92023          	sw	a5,0(s2)
    8c74:	00c12083          	lw	ra,12(sp)
    8c78:	00812403          	lw	s0,8(sp)
    8c7c:	00412483          	lw	s1,4(sp)
    8c80:	00012903          	lw	s2,0(sp)
    8c84:	01010113          	addi	sp,sp,16
    8c88:	00008067          	ret
    8c8c:	02052e23          	sw	zero,60(a0)
    8c90:	00000593          	li	a1,0
    8c94:	fa1ff06f          	j	8c34 <__nrv_alloc_D2A+0x48>
    8c98:	00050793          	mv	a5,a0
    8c9c:	fd1ff06f          	j	8c6c <__nrv_alloc_D2A+0x80>
    8ca0:	ec5ff0ef          	jal	8b64 <__rv_alloc_D2A.part.0>

00008ca4 <__freedtoa>:
    8ca4:	03c52683          	lw	a3,60(a0)
    8ca8:	00100713          	li	a4,1
    8cac:	00d71733          	sll	a4,a4,a3
    8cb0:	00d5a223          	sw	a3,4(a1)
    8cb4:	00e5a423          	sw	a4,8(a1)
    8cb8:	3d50006f          	j	988c <_Bfree>

00008cbc <__quorem_D2A>:
    8cbc:	fe010113          	addi	sp,sp,-32
    8cc0:	00912a23          	sw	s1,20(sp)
    8cc4:	01052783          	lw	a5,16(a0)
    8cc8:	0105a483          	lw	s1,16(a1)
    8ccc:	00112e23          	sw	ra,28(sp)
    8cd0:	1c97c863          	blt	a5,s1,8ea0 <__quorem_D2A+0x1e4>
    8cd4:	fff48493          	addi	s1,s1,-1
    8cd8:	00249313          	slli	t1,s1,0x2
    8cdc:	00812c23          	sw	s0,24(sp)
    8ce0:	01458413          	addi	s0,a1,20
    8ce4:	01312623          	sw	s3,12(sp)
    8ce8:	01412423          	sw	s4,8(sp)
    8cec:	006409b3          	add	s3,s0,t1
    8cf0:	01450a13          	addi	s4,a0,20
    8cf4:	0009a783          	lw	a5,0(s3)
    8cf8:	006a0333          	add	t1,s4,t1
    8cfc:	00032703          	lw	a4,0(t1)
    8d00:	01212823          	sw	s2,16(sp)
    8d04:	01512223          	sw	s5,4(sp)
    8d08:	00178793          	addi	a5,a5,1
    8d0c:	02f75933          	divu	s2,a4,a5
    8d10:	00050a93          	mv	s5,a0
    8d14:	0af76e63          	bltu	a4,a5,8dd0 <__quorem_D2A+0x114>
    8d18:	00010537          	lui	a0,0x10
    8d1c:	00040893          	mv	a7,s0
    8d20:	000a0813          	mv	a6,s4
    8d24:	00000f13          	li	t5,0
    8d28:	00000e93          	li	t4,0
    8d2c:	fff50513          	addi	a0,a0,-1 # ffff <__multf3+0xc07>
    8d30:	0008a783          	lw	a5,0(a7)
    8d34:	00082603          	lw	a2,0(a6)
    8d38:	00480813          	addi	a6,a6,4
    8d3c:	00a7f6b3          	and	a3,a5,a0
    8d40:	0107d793          	srli	a5,a5,0x10
    8d44:	00a67733          	and	a4,a2,a0
    8d48:	01065e13          	srli	t3,a2,0x10
    8d4c:	00488893          	addi	a7,a7,4
    8d50:	032686b3          	mul	a3,a3,s2
    8d54:	032787b3          	mul	a5,a5,s2
    8d58:	01e686b3          	add	a3,a3,t5
    8d5c:	00a6f633          	and	a2,a3,a0
    8d60:	40c70733          	sub	a4,a4,a2
    8d64:	41d70733          	sub	a4,a4,t4
    8d68:	0106d693          	srli	a3,a3,0x10
    8d6c:	01075613          	srli	a2,a4,0x10
    8d70:	00167613          	andi	a2,a2,1
    8d74:	00a77733          	and	a4,a4,a0
    8d78:	00d787b3          	add	a5,a5,a3
    8d7c:	00a7f6b3          	and	a3,a5,a0
    8d80:	00d60633          	add	a2,a2,a3
    8d84:	40ce06b3          	sub	a3,t3,a2
    8d88:	01069613          	slli	a2,a3,0x10
    8d8c:	00e66733          	or	a4,a2,a4
    8d90:	0106d693          	srli	a3,a3,0x10
    8d94:	fee82e23          	sw	a4,-4(a6)
    8d98:	0107df13          	srli	t5,a5,0x10
    8d9c:	0016fe93          	andi	t4,a3,1
    8da0:	f919f8e3          	bgeu	s3,a7,8d30 <__quorem_D2A+0x74>
    8da4:	00032783          	lw	a5,0(t1)
    8da8:	02079463          	bnez	a5,8dd0 <__quorem_D2A+0x114>
    8dac:	ffc30313          	addi	t1,t1,-4
    8db0:	006a6863          	bltu	s4,t1,8dc0 <__quorem_D2A+0x104>
    8db4:	0180006f          	j	8dcc <__quorem_D2A+0x110>
    8db8:	fff48493          	addi	s1,s1,-1
    8dbc:	006a7863          	bgeu	s4,t1,8dcc <__quorem_D2A+0x110>
    8dc0:	00032783          	lw	a5,0(t1)
    8dc4:	ffc30313          	addi	t1,t1,-4
    8dc8:	fe0788e3          	beqz	a5,8db8 <__quorem_D2A+0xfc>
    8dcc:	009aa823          	sw	s1,16(s5)
    8dd0:	000a8513          	mv	a0,s5
    8dd4:	44c010ef          	jal	a220 <__mcmp>
    8dd8:	0a054063          	bltz	a0,8e78 <__quorem_D2A+0x1bc>
    8ddc:	00010537          	lui	a0,0x10
    8de0:	000a0593          	mv	a1,s4
    8de4:	00000693          	li	a3,0
    8de8:	fff50513          	addi	a0,a0,-1 # ffff <__multf3+0xc07>
    8dec:	0005a783          	lw	a5,0(a1)
    8df0:	00042603          	lw	a2,0(s0)
    8df4:	00458593          	addi	a1,a1,4
    8df8:	00a7f733          	and	a4,a5,a0
    8dfc:	00a67833          	and	a6,a2,a0
    8e00:	41070733          	sub	a4,a4,a6
    8e04:	40d70733          	sub	a4,a4,a3
    8e08:	01075693          	srli	a3,a4,0x10
    8e0c:	0016f693          	andi	a3,a3,1
    8e10:	01065613          	srli	a2,a2,0x10
    8e14:	00c686b3          	add	a3,a3,a2
    8e18:	0107d793          	srli	a5,a5,0x10
    8e1c:	40d787b3          	sub	a5,a5,a3
    8e20:	01079693          	slli	a3,a5,0x10
    8e24:	00a77733          	and	a4,a4,a0
    8e28:	00e6e733          	or	a4,a3,a4
    8e2c:	0107d793          	srli	a5,a5,0x10
    8e30:	00440413          	addi	s0,s0,4
    8e34:	fee5ae23          	sw	a4,-4(a1)
    8e38:	0017f693          	andi	a3,a5,1
    8e3c:	fa89f8e3          	bgeu	s3,s0,8dec <__quorem_D2A+0x130>
    8e40:	00249793          	slli	a5,s1,0x2
    8e44:	00fa07b3          	add	a5,s4,a5
    8e48:	0007a703          	lw	a4,0(a5)
    8e4c:	02071463          	bnez	a4,8e74 <__quorem_D2A+0x1b8>
    8e50:	ffc78793          	addi	a5,a5,-4
    8e54:	00fa6863          	bltu	s4,a5,8e64 <__quorem_D2A+0x1a8>
    8e58:	0180006f          	j	8e70 <__quorem_D2A+0x1b4>
    8e5c:	fff48493          	addi	s1,s1,-1
    8e60:	00fa7863          	bgeu	s4,a5,8e70 <__quorem_D2A+0x1b4>
    8e64:	0007a703          	lw	a4,0(a5)
    8e68:	ffc78793          	addi	a5,a5,-4
    8e6c:	fe0708e3          	beqz	a4,8e5c <__quorem_D2A+0x1a0>
    8e70:	009aa823          	sw	s1,16(s5)
    8e74:	00190913          	addi	s2,s2,1
    8e78:	01812403          	lw	s0,24(sp)
    8e7c:	01c12083          	lw	ra,28(sp)
    8e80:	00c12983          	lw	s3,12(sp)
    8e84:	00812a03          	lw	s4,8(sp)
    8e88:	00412a83          	lw	s5,4(sp)
    8e8c:	01412483          	lw	s1,20(sp)
    8e90:	00090513          	mv	a0,s2
    8e94:	01012903          	lw	s2,16(sp)
    8e98:	02010113          	addi	sp,sp,32
    8e9c:	00008067          	ret
    8ea0:	01c12083          	lw	ra,28(sp)
    8ea4:	01412483          	lw	s1,20(sp)
    8ea8:	00000513          	li	a0,0
    8eac:	02010113          	addi	sp,sp,32
    8eb0:	00008067          	ret

00008eb4 <__rshift_D2A>:
    8eb4:	01052803          	lw	a6,16(a0)
    8eb8:	4055de13          	srai	t3,a1,0x5
    8ebc:	010e4863          	blt	t3,a6,8ecc <__rshift_D2A+0x18>
    8ec0:	00052823          	sw	zero,16(a0)
    8ec4:	00052a23          	sw	zero,20(a0)
    8ec8:	00008067          	ret
    8ecc:	01450313          	addi	t1,a0,20
    8ed0:	00281613          	slli	a2,a6,0x2
    8ed4:	002e1793          	slli	a5,t3,0x2
    8ed8:	01f5f593          	andi	a1,a1,31
    8edc:	00c30633          	add	a2,t1,a2
    8ee0:	00f307b3          	add	a5,t1,a5
    8ee4:	06058263          	beqz	a1,8f48 <__rshift_D2A+0x94>
    8ee8:	0007a683          	lw	a3,0(a5)
    8eec:	02000e93          	li	t4,32
    8ef0:	00478793          	addi	a5,a5,4
    8ef4:	40be8eb3          	sub	t4,t4,a1
    8ef8:	00b6d6b3          	srl	a3,a3,a1
    8efc:	08c7f463          	bgeu	a5,a2,8f84 <__rshift_D2A+0xd0>
    8f00:	00030893          	mv	a7,t1
    8f04:	0007a703          	lw	a4,0(a5)
    8f08:	00488893          	addi	a7,a7,4
    8f0c:	00478793          	addi	a5,a5,4
    8f10:	01d71733          	sll	a4,a4,t4
    8f14:	00d76733          	or	a4,a4,a3
    8f18:	fee8ae23          	sw	a4,-4(a7)
    8f1c:	ffc7a683          	lw	a3,-4(a5)
    8f20:	00b6d6b3          	srl	a3,a3,a1
    8f24:	fec7e0e3          	bltu	a5,a2,8f04 <__rshift_D2A+0x50>
    8f28:	41c80833          	sub	a6,a6,t3
    8f2c:	00281813          	slli	a6,a6,0x2
    8f30:	ffc80813          	addi	a6,a6,-4
    8f34:	01030833          	add	a6,t1,a6
    8f38:	00d82023          	sw	a3,0(a6)
    8f3c:	02068a63          	beqz	a3,8f70 <__rshift_D2A+0xbc>
    8f40:	00480813          	addi	a6,a6,4
    8f44:	02c0006f          	j	8f70 <__rshift_D2A+0xbc>
    8f48:	00030713          	mv	a4,t1
    8f4c:	f6c7fae3          	bgeu	a5,a2,8ec0 <__rshift_D2A+0xc>
    8f50:	0007a683          	lw	a3,0(a5)
    8f54:	00478793          	addi	a5,a5,4
    8f58:	00470713          	addi	a4,a4,4
    8f5c:	fed72e23          	sw	a3,-4(a4)
    8f60:	fec7e8e3          	bltu	a5,a2,8f50 <__rshift_D2A+0x9c>
    8f64:	41c80833          	sub	a6,a6,t3
    8f68:	00281813          	slli	a6,a6,0x2
    8f6c:	01030833          	add	a6,t1,a6
    8f70:	406807b3          	sub	a5,a6,t1
    8f74:	4027d793          	srai	a5,a5,0x2
    8f78:	00f52823          	sw	a5,16(a0)
    8f7c:	f46804e3          	beq	a6,t1,8ec4 <__rshift_D2A+0x10>
    8f80:	00008067          	ret
    8f84:	00d52a23          	sw	a3,20(a0)
    8f88:	f2068ce3          	beqz	a3,8ec0 <__rshift_D2A+0xc>
    8f8c:	00030813          	mv	a6,t1
    8f90:	00480813          	addi	a6,a6,4
    8f94:	fddff06f          	j	8f70 <__rshift_D2A+0xbc>

00008f98 <__trailz_D2A>:
    8f98:	01052703          	lw	a4,16(a0)
    8f9c:	fe010113          	addi	sp,sp,-32
    8fa0:	01450513          	addi	a0,a0,20
    8fa4:	00271713          	slli	a4,a4,0x2
    8fa8:	00812c23          	sw	s0,24(sp)
    8fac:	00112e23          	sw	ra,28(sp)
    8fb0:	00e50733          	add	a4,a0,a4
    8fb4:	00000413          	li	s0,0
    8fb8:	00e56a63          	bltu	a0,a4,8fcc <__trailz_D2A+0x34>
    8fbc:	02c0006f          	j	8fe8 <__trailz_D2A+0x50>
    8fc0:	00450513          	addi	a0,a0,4
    8fc4:	02040413          	addi	s0,s0,32
    8fc8:	02e57063          	bgeu	a0,a4,8fe8 <__trailz_D2A+0x50>
    8fcc:	00052783          	lw	a5,0(a0)
    8fd0:	fe0788e3          	beqz	a5,8fc0 <__trailz_D2A+0x28>
    8fd4:	00e57a63          	bgeu	a0,a4,8fe8 <__trailz_D2A+0x50>
    8fd8:	00c10513          	addi	a0,sp,12
    8fdc:	00f12623          	sw	a5,12(sp)
    8fe0:	3bd000ef          	jal	9b9c <__lo0bits>
    8fe4:	00a40433          	add	s0,s0,a0
    8fe8:	01c12083          	lw	ra,28(sp)
    8fec:	00040513          	mv	a0,s0
    8ff0:	01812403          	lw	s0,24(sp)
    8ff4:	02010113          	addi	sp,sp,32
    8ff8:	00008067          	ret

00008ffc <_malloc_r>:
    8ffc:	fd010113          	addi	sp,sp,-48
    9000:	01312e23          	sw	s3,28(sp)
    9004:	02112623          	sw	ra,44(sp)
    9008:	02812423          	sw	s0,40(sp)
    900c:	02912223          	sw	s1,36(sp)
    9010:	03212023          	sw	s2,32(sp)
    9014:	00b58793          	addi	a5,a1,11
    9018:	01600713          	li	a4,22
    901c:	00050993          	mv	s3,a0
    9020:	08f76263          	bltu	a4,a5,90a4 <_malloc_r+0xa8>
    9024:	01000793          	li	a5,16
    9028:	20b7e663          	bltu	a5,a1,9234 <_malloc_r+0x238>
    902c:	7a4000ef          	jal	97d0 <__malloc_lock>
    9030:	01800793          	li	a5,24
    9034:	00200593          	li	a1,2
    9038:	01000493          	li	s1,16
    903c:	00014937          	lui	s2,0x14
    9040:	86c90913          	addi	s2,s2,-1940 # 1386c <__malloc_av_>
    9044:	00f907b3          	add	a5,s2,a5
    9048:	0047a403          	lw	s0,4(a5)
    904c:	ff878713          	addi	a4,a5,-8
    9050:	34e40e63          	beq	s0,a4,93ac <_malloc_r+0x3b0>
    9054:	00442783          	lw	a5,4(s0)
    9058:	00c42683          	lw	a3,12(s0)
    905c:	00842603          	lw	a2,8(s0)
    9060:	ffc7f793          	andi	a5,a5,-4
    9064:	00f407b3          	add	a5,s0,a5
    9068:	0047a703          	lw	a4,4(a5)
    906c:	00d62623          	sw	a3,12(a2)
    9070:	00c6a423          	sw	a2,8(a3)
    9074:	00176713          	ori	a4,a4,1
    9078:	00098513          	mv	a0,s3
    907c:	00e7a223          	sw	a4,4(a5)
    9080:	754000ef          	jal	97d4 <__malloc_unlock>
    9084:	00840513          	addi	a0,s0,8
    9088:	02c12083          	lw	ra,44(sp)
    908c:	02812403          	lw	s0,40(sp)
    9090:	02412483          	lw	s1,36(sp)
    9094:	02012903          	lw	s2,32(sp)
    9098:	01c12983          	lw	s3,28(sp)
    909c:	03010113          	addi	sp,sp,48
    90a0:	00008067          	ret
    90a4:	ff87f493          	andi	s1,a5,-8
    90a8:	1807c663          	bltz	a5,9234 <_malloc_r+0x238>
    90ac:	18b4e463          	bltu	s1,a1,9234 <_malloc_r+0x238>
    90b0:	720000ef          	jal	97d0 <__malloc_lock>
    90b4:	1f700793          	li	a5,503
    90b8:	4097f463          	bgeu	a5,s1,94c0 <_malloc_r+0x4c4>
    90bc:	0094d793          	srli	a5,s1,0x9
    90c0:	18078263          	beqz	a5,9244 <_malloc_r+0x248>
    90c4:	00400713          	li	a4,4
    90c8:	34f76a63          	bltu	a4,a5,941c <_malloc_r+0x420>
    90cc:	0064d793          	srli	a5,s1,0x6
    90d0:	03978593          	addi	a1,a5,57
    90d4:	03878813          	addi	a6,a5,56
    90d8:	00359613          	slli	a2,a1,0x3
    90dc:	00014937          	lui	s2,0x14
    90e0:	86c90913          	addi	s2,s2,-1940 # 1386c <__malloc_av_>
    90e4:	00c90633          	add	a2,s2,a2
    90e8:	00462403          	lw	s0,4(a2)
    90ec:	ff860613          	addi	a2,a2,-8
    90f0:	02860863          	beq	a2,s0,9120 <_malloc_r+0x124>
    90f4:	00f00513          	li	a0,15
    90f8:	0140006f          	j	910c <_malloc_r+0x110>
    90fc:	00c42683          	lw	a3,12(s0)
    9100:	2a075263          	bgez	a4,93a4 <_malloc_r+0x3a8>
    9104:	00d60e63          	beq	a2,a3,9120 <_malloc_r+0x124>
    9108:	00068413          	mv	s0,a3
    910c:	00442783          	lw	a5,4(s0)
    9110:	ffc7f793          	andi	a5,a5,-4
    9114:	40978733          	sub	a4,a5,s1
    9118:	fee552e3          	bge	a0,a4,90fc <_malloc_r+0x100>
    911c:	00080593          	mv	a1,a6
    9120:	01092403          	lw	s0,16(s2)
    9124:	00014837          	lui	a6,0x14
    9128:	87480813          	addi	a6,a6,-1932 # 13874 <__malloc_av_+0x8>
    912c:	27040863          	beq	s0,a6,939c <_malloc_r+0x3a0>
    9130:	00442783          	lw	a5,4(s0)
    9134:	00f00693          	li	a3,15
    9138:	ffc7f793          	andi	a5,a5,-4
    913c:	40978733          	sub	a4,a5,s1
    9140:	38e6c663          	blt	a3,a4,94cc <_malloc_r+0x4d0>
    9144:	01092a23          	sw	a6,20(s2)
    9148:	01092823          	sw	a6,16(s2)
    914c:	34075a63          	bgez	a4,94a0 <_malloc_r+0x4a4>
    9150:	1ff00713          	li	a4,511
    9154:	00492503          	lw	a0,4(s2)
    9158:	26f76263          	bltu	a4,a5,93bc <_malloc_r+0x3c0>
    915c:	ff87f713          	andi	a4,a5,-8
    9160:	00870713          	addi	a4,a4,8
    9164:	00e90733          	add	a4,s2,a4
    9168:	00072683          	lw	a3,0(a4)
    916c:	0057d613          	srli	a2,a5,0x5
    9170:	00100793          	li	a5,1
    9174:	00c797b3          	sll	a5,a5,a2
    9178:	00f56533          	or	a0,a0,a5
    917c:	ff870793          	addi	a5,a4,-8
    9180:	00f42623          	sw	a5,12(s0)
    9184:	00d42423          	sw	a3,8(s0)
    9188:	00a92223          	sw	a0,4(s2)
    918c:	00872023          	sw	s0,0(a4)
    9190:	0086a623          	sw	s0,12(a3)
    9194:	4025d793          	srai	a5,a1,0x2
    9198:	00100613          	li	a2,1
    919c:	00f61633          	sll	a2,a2,a5
    91a0:	0ac56a63          	bltu	a0,a2,9254 <_malloc_r+0x258>
    91a4:	00a677b3          	and	a5,a2,a0
    91a8:	02079463          	bnez	a5,91d0 <_malloc_r+0x1d4>
    91ac:	00161613          	slli	a2,a2,0x1
    91b0:	ffc5f593          	andi	a1,a1,-4
    91b4:	00a677b3          	and	a5,a2,a0
    91b8:	00458593          	addi	a1,a1,4
    91bc:	00079a63          	bnez	a5,91d0 <_malloc_r+0x1d4>
    91c0:	00161613          	slli	a2,a2,0x1
    91c4:	00a677b3          	and	a5,a2,a0
    91c8:	00458593          	addi	a1,a1,4
    91cc:	fe078ae3          	beqz	a5,91c0 <_malloc_r+0x1c4>
    91d0:	00f00893          	li	a7,15
    91d4:	00359313          	slli	t1,a1,0x3
    91d8:	00690333          	add	t1,s2,t1
    91dc:	00030513          	mv	a0,t1
    91e0:	00c52783          	lw	a5,12(a0)
    91e4:	00058e13          	mv	t3,a1
    91e8:	24f50c63          	beq	a0,a5,9440 <_malloc_r+0x444>
    91ec:	0047a703          	lw	a4,4(a5)
    91f0:	00078413          	mv	s0,a5
    91f4:	00c7a783          	lw	a5,12(a5)
    91f8:	ffc77713          	andi	a4,a4,-4
    91fc:	409706b3          	sub	a3,a4,s1
    9200:	24d8cc63          	blt	a7,a3,9458 <_malloc_r+0x45c>
    9204:	fe06c2e3          	bltz	a3,91e8 <_malloc_r+0x1ec>
    9208:	00e40733          	add	a4,s0,a4
    920c:	00472683          	lw	a3,4(a4)
    9210:	00842603          	lw	a2,8(s0)
    9214:	00098513          	mv	a0,s3
    9218:	0016e693          	ori	a3,a3,1
    921c:	00d72223          	sw	a3,4(a4)
    9220:	00f62623          	sw	a5,12(a2)
    9224:	00c7a423          	sw	a2,8(a5)
    9228:	5ac000ef          	jal	97d4 <__malloc_unlock>
    922c:	00840513          	addi	a0,s0,8
    9230:	e59ff06f          	j	9088 <_malloc_r+0x8c>
    9234:	00c00793          	li	a5,12
    9238:	00f9a023          	sw	a5,0(s3)
    923c:	00000513          	li	a0,0
    9240:	e49ff06f          	j	9088 <_malloc_r+0x8c>
    9244:	20000613          	li	a2,512
    9248:	04000593          	li	a1,64
    924c:	03f00813          	li	a6,63
    9250:	e8dff06f          	j	90dc <_malloc_r+0xe0>
    9254:	00892403          	lw	s0,8(s2)
    9258:	01612823          	sw	s6,16(sp)
    925c:	00442783          	lw	a5,4(s0)
    9260:	ffc7fb13          	andi	s6,a5,-4
    9264:	009b6863          	bltu	s6,s1,9274 <_malloc_r+0x278>
    9268:	409b0733          	sub	a4,s6,s1
    926c:	00f00793          	li	a5,15
    9270:	0ee7c463          	blt	a5,a4,9358 <_malloc_r+0x35c>
    9274:	000147b7          	lui	a5,0x14
    9278:	01912223          	sw	s9,4(sp)
    927c:	00014cb7          	lui	s9,0x14
    9280:	01512a23          	sw	s5,20(sp)
    9284:	e38ca703          	lw	a4,-456(s9) # 13e38 <__malloc_sbrk_base>
    9288:	fd47aa83          	lw	s5,-44(a5) # 13fd4 <__malloc_top_pad>
    928c:	01412c23          	sw	s4,24(sp)
    9290:	01712623          	sw	s7,12(sp)
    9294:	fff00793          	li	a5,-1
    9298:	01640a33          	add	s4,s0,s6
    929c:	01548ab3          	add	s5,s1,s5
    92a0:	3cf70e63          	beq	a4,a5,967c <_malloc_r+0x680>
    92a4:	000017b7          	lui	a5,0x1
    92a8:	00f78793          	addi	a5,a5,15 # 100f <uart_init+0xcb>
    92ac:	00fa8ab3          	add	s5,s5,a5
    92b0:	fffff7b7          	lui	a5,0xfffff
    92b4:	00fafab3          	and	s5,s5,a5
    92b8:	000a8593          	mv	a1,s5
    92bc:	00098513          	mv	a0,s3
    92c0:	198020ef          	jal	b458 <_sbrk_r>
    92c4:	fff00793          	li	a5,-1
    92c8:	00050b93          	mv	s7,a0
    92cc:	46f50263          	beq	a0,a5,9730 <_malloc_r+0x734>
    92d0:	01812423          	sw	s8,8(sp)
    92d4:	25456463          	bltu	a0,s4,951c <_malloc_r+0x520>
    92d8:	00014c37          	lui	s8,0x14
    92dc:	f9cc0c13          	addi	s8,s8,-100 # 13f9c <__malloc_current_mallinfo>
    92e0:	000c2583          	lw	a1,0(s8)
    92e4:	00ba85b3          	add	a1,s5,a1
    92e8:	00bc2023          	sw	a1,0(s8)
    92ec:	00058713          	mv	a4,a1
    92f0:	2aaa1c63          	bne	s4,a0,95a8 <_malloc_r+0x5ac>
    92f4:	01451793          	slli	a5,a0,0x14
    92f8:	2a079863          	bnez	a5,95a8 <_malloc_r+0x5ac>
    92fc:	00892b83          	lw	s7,8(s2)
    9300:	015b07b3          	add	a5,s6,s5
    9304:	0017e793          	ori	a5,a5,1
    9308:	00fba223          	sw	a5,4(s7)
    930c:	00014737          	lui	a4,0x14
    9310:	fd072683          	lw	a3,-48(a4) # 13fd0 <__malloc_max_sbrked_mem>
    9314:	00b6f463          	bgeu	a3,a1,931c <_malloc_r+0x320>
    9318:	fcb72823          	sw	a1,-48(a4)
    931c:	00014737          	lui	a4,0x14
    9320:	fcc72683          	lw	a3,-52(a4) # 13fcc <__malloc_max_total_mem>
    9324:	00b6f463          	bgeu	a3,a1,932c <_malloc_r+0x330>
    9328:	fcb72623          	sw	a1,-52(a4)
    932c:	00812c03          	lw	s8,8(sp)
    9330:	000b8413          	mv	s0,s7
    9334:	ffc7f793          	andi	a5,a5,-4
    9338:	40978733          	sub	a4,a5,s1
    933c:	3897ec63          	bltu	a5,s1,96d4 <_malloc_r+0x6d8>
    9340:	00f00793          	li	a5,15
    9344:	38e7d863          	bge	a5,a4,96d4 <_malloc_r+0x6d8>
    9348:	01812a03          	lw	s4,24(sp)
    934c:	01412a83          	lw	s5,20(sp)
    9350:	00c12b83          	lw	s7,12(sp)
    9354:	00412c83          	lw	s9,4(sp)
    9358:	0014e793          	ori	a5,s1,1
    935c:	00f42223          	sw	a5,4(s0)
    9360:	009404b3          	add	s1,s0,s1
    9364:	00992423          	sw	s1,8(s2)
    9368:	00176713          	ori	a4,a4,1
    936c:	00098513          	mv	a0,s3
    9370:	00e4a223          	sw	a4,4(s1)
    9374:	460000ef          	jal	97d4 <__malloc_unlock>
    9378:	02c12083          	lw	ra,44(sp)
    937c:	00840513          	addi	a0,s0,8
    9380:	02812403          	lw	s0,40(sp)
    9384:	01012b03          	lw	s6,16(sp)
    9388:	02412483          	lw	s1,36(sp)
    938c:	02012903          	lw	s2,32(sp)
    9390:	01c12983          	lw	s3,28(sp)
    9394:	03010113          	addi	sp,sp,48
    9398:	00008067          	ret
    939c:	00492503          	lw	a0,4(s2)
    93a0:	df5ff06f          	j	9194 <_malloc_r+0x198>
    93a4:	00842603          	lw	a2,8(s0)
    93a8:	cbdff06f          	j	9064 <_malloc_r+0x68>
    93ac:	00c7a403          	lw	s0,12(a5) # fffff00c <_memory_end+0xfffdf00c>
    93b0:	00258593          	addi	a1,a1,2
    93b4:	d68786e3          	beq	a5,s0,9120 <_malloc_r+0x124>
    93b8:	c9dff06f          	j	9054 <_malloc_r+0x58>
    93bc:	0097d713          	srli	a4,a5,0x9
    93c0:	00400693          	li	a3,4
    93c4:	14e6f263          	bgeu	a3,a4,9508 <_malloc_r+0x50c>
    93c8:	01400693          	li	a3,20
    93cc:	32e6e663          	bltu	a3,a4,96f8 <_malloc_r+0x6fc>
    93d0:	05c70613          	addi	a2,a4,92
    93d4:	05b70693          	addi	a3,a4,91
    93d8:	00361613          	slli	a2,a2,0x3
    93dc:	00c90633          	add	a2,s2,a2
    93e0:	00062703          	lw	a4,0(a2)
    93e4:	ff860613          	addi	a2,a2,-8
    93e8:	00e61863          	bne	a2,a4,93f8 <_malloc_r+0x3fc>
    93ec:	2980006f          	j	9684 <_malloc_r+0x688>
    93f0:	00872703          	lw	a4,8(a4)
    93f4:	00e60863          	beq	a2,a4,9404 <_malloc_r+0x408>
    93f8:	00472683          	lw	a3,4(a4)
    93fc:	ffc6f693          	andi	a3,a3,-4
    9400:	fed7e8e3          	bltu	a5,a3,93f0 <_malloc_r+0x3f4>
    9404:	00c72603          	lw	a2,12(a4)
    9408:	00c42623          	sw	a2,12(s0)
    940c:	00e42423          	sw	a4,8(s0)
    9410:	00862423          	sw	s0,8(a2)
    9414:	00872623          	sw	s0,12(a4)
    9418:	d7dff06f          	j	9194 <_malloc_r+0x198>
    941c:	01400713          	li	a4,20
    9420:	10f77863          	bgeu	a4,a5,9530 <_malloc_r+0x534>
    9424:	05400713          	li	a4,84
    9428:	2ef76663          	bltu	a4,a5,9714 <_malloc_r+0x718>
    942c:	00c4d793          	srli	a5,s1,0xc
    9430:	06f78593          	addi	a1,a5,111
    9434:	06e78813          	addi	a6,a5,110
    9438:	00359613          	slli	a2,a1,0x3
    943c:	ca1ff06f          	j	90dc <_malloc_r+0xe0>
    9440:	001e0e13          	addi	t3,t3,1
    9444:	003e7793          	andi	a5,t3,3
    9448:	00850513          	addi	a0,a0,8
    944c:	10078063          	beqz	a5,954c <_malloc_r+0x550>
    9450:	00c52783          	lw	a5,12(a0)
    9454:	d95ff06f          	j	91e8 <_malloc_r+0x1ec>
    9458:	00842603          	lw	a2,8(s0)
    945c:	0014e593          	ori	a1,s1,1
    9460:	00b42223          	sw	a1,4(s0)
    9464:	00f62623          	sw	a5,12(a2)
    9468:	00c7a423          	sw	a2,8(a5)
    946c:	009404b3          	add	s1,s0,s1
    9470:	00992a23          	sw	s1,20(s2)
    9474:	00992823          	sw	s1,16(s2)
    9478:	0016e793          	ori	a5,a3,1
    947c:	0104a623          	sw	a6,12(s1)
    9480:	0104a423          	sw	a6,8(s1)
    9484:	00f4a223          	sw	a5,4(s1)
    9488:	00e40733          	add	a4,s0,a4
    948c:	00098513          	mv	a0,s3
    9490:	00d72023          	sw	a3,0(a4)
    9494:	340000ef          	jal	97d4 <__malloc_unlock>
    9498:	00840513          	addi	a0,s0,8
    949c:	bedff06f          	j	9088 <_malloc_r+0x8c>
    94a0:	00f407b3          	add	a5,s0,a5
    94a4:	0047a703          	lw	a4,4(a5)
    94a8:	00098513          	mv	a0,s3
    94ac:	00176713          	ori	a4,a4,1
    94b0:	00e7a223          	sw	a4,4(a5)
    94b4:	320000ef          	jal	97d4 <__malloc_unlock>
    94b8:	00840513          	addi	a0,s0,8
    94bc:	bcdff06f          	j	9088 <_malloc_r+0x8c>
    94c0:	0034d593          	srli	a1,s1,0x3
    94c4:	00848793          	addi	a5,s1,8
    94c8:	b75ff06f          	j	903c <_malloc_r+0x40>
    94cc:	0014e693          	ori	a3,s1,1
    94d0:	00d42223          	sw	a3,4(s0)
    94d4:	009404b3          	add	s1,s0,s1
    94d8:	00992a23          	sw	s1,20(s2)
    94dc:	00992823          	sw	s1,16(s2)
    94e0:	00176693          	ori	a3,a4,1
    94e4:	0104a623          	sw	a6,12(s1)
    94e8:	0104a423          	sw	a6,8(s1)
    94ec:	00d4a223          	sw	a3,4(s1)
    94f0:	00f407b3          	add	a5,s0,a5
    94f4:	00098513          	mv	a0,s3
    94f8:	00e7a023          	sw	a4,0(a5)
    94fc:	2d8000ef          	jal	97d4 <__malloc_unlock>
    9500:	00840513          	addi	a0,s0,8
    9504:	b85ff06f          	j	9088 <_malloc_r+0x8c>
    9508:	0067d713          	srli	a4,a5,0x6
    950c:	03970613          	addi	a2,a4,57
    9510:	03870693          	addi	a3,a4,56
    9514:	00361613          	slli	a2,a2,0x3
    9518:	ec5ff06f          	j	93dc <_malloc_r+0x3e0>
    951c:	07240c63          	beq	s0,s2,9594 <_malloc_r+0x598>
    9520:	00892403          	lw	s0,8(s2)
    9524:	00812c03          	lw	s8,8(sp)
    9528:	00442783          	lw	a5,4(s0)
    952c:	e09ff06f          	j	9334 <_malloc_r+0x338>
    9530:	05c78593          	addi	a1,a5,92
    9534:	05b78813          	addi	a6,a5,91
    9538:	00359613          	slli	a2,a1,0x3
    953c:	ba1ff06f          	j	90dc <_malloc_r+0xe0>
    9540:	00832783          	lw	a5,8(t1)
    9544:	fff58593          	addi	a1,a1,-1
    9548:	28679063          	bne	a5,t1,97c8 <_malloc_r+0x7cc>
    954c:	0035f793          	andi	a5,a1,3
    9550:	ff830313          	addi	t1,t1,-8
    9554:	fe0796e3          	bnez	a5,9540 <_malloc_r+0x544>
    9558:	00492703          	lw	a4,4(s2)
    955c:	fff64793          	not	a5,a2
    9560:	00e7f7b3          	and	a5,a5,a4
    9564:	00f92223          	sw	a5,4(s2)
    9568:	00161613          	slli	a2,a2,0x1
    956c:	cec7e4e3          	bltu	a5,a2,9254 <_malloc_r+0x258>
    9570:	ce0602e3          	beqz	a2,9254 <_malloc_r+0x258>
    9574:	00f67733          	and	a4,a2,a5
    9578:	00071a63          	bnez	a4,958c <_malloc_r+0x590>
    957c:	00161613          	slli	a2,a2,0x1
    9580:	00f67733          	and	a4,a2,a5
    9584:	004e0e13          	addi	t3,t3,4
    9588:	fe070ae3          	beqz	a4,957c <_malloc_r+0x580>
    958c:	000e0593          	mv	a1,t3
    9590:	c45ff06f          	j	91d4 <_malloc_r+0x1d8>
    9594:	00014c37          	lui	s8,0x14
    9598:	f9cc0c13          	addi	s8,s8,-100 # 13f9c <__malloc_current_mallinfo>
    959c:	000c2703          	lw	a4,0(s8)
    95a0:	00ea8733          	add	a4,s5,a4
    95a4:	00ec2023          	sw	a4,0(s8)
    95a8:	e38ca683          	lw	a3,-456(s9)
    95ac:	fff00793          	li	a5,-1
    95b0:	18f68663          	beq	a3,a5,973c <_malloc_r+0x740>
    95b4:	414b87b3          	sub	a5,s7,s4
    95b8:	00e787b3          	add	a5,a5,a4
    95bc:	00fc2023          	sw	a5,0(s8)
    95c0:	007bfc93          	andi	s9,s7,7
    95c4:	0c0c8c63          	beqz	s9,969c <_malloc_r+0x6a0>
    95c8:	419b8bb3          	sub	s7,s7,s9
    95cc:	000017b7          	lui	a5,0x1
    95d0:	00878793          	addi	a5,a5,8 # 1008 <uart_init+0xc4>
    95d4:	008b8b93          	addi	s7,s7,8
    95d8:	419785b3          	sub	a1,a5,s9
    95dc:	015b8ab3          	add	s5,s7,s5
    95e0:	415585b3          	sub	a1,a1,s5
    95e4:	01459593          	slli	a1,a1,0x14
    95e8:	0145da13          	srli	s4,a1,0x14
    95ec:	000a0593          	mv	a1,s4
    95f0:	00098513          	mv	a0,s3
    95f4:	665010ef          	jal	b458 <_sbrk_r>
    95f8:	fff00793          	li	a5,-1
    95fc:	18f50063          	beq	a0,a5,977c <_malloc_r+0x780>
    9600:	41750533          	sub	a0,a0,s7
    9604:	01450ab3          	add	s5,a0,s4
    9608:	000c2703          	lw	a4,0(s8)
    960c:	01792423          	sw	s7,8(s2)
    9610:	001ae793          	ori	a5,s5,1
    9614:	00ea05b3          	add	a1,s4,a4
    9618:	00bc2023          	sw	a1,0(s8)
    961c:	00fba223          	sw	a5,4(s7)
    9620:	cf2406e3          	beq	s0,s2,930c <_malloc_r+0x310>
    9624:	00f00693          	li	a3,15
    9628:	0b66f063          	bgeu	a3,s6,96c8 <_malloc_r+0x6cc>
    962c:	00442703          	lw	a4,4(s0)
    9630:	ff4b0793          	addi	a5,s6,-12
    9634:	ff87f793          	andi	a5,a5,-8
    9638:	00177713          	andi	a4,a4,1
    963c:	00f76733          	or	a4,a4,a5
    9640:	00e42223          	sw	a4,4(s0)
    9644:	00500613          	li	a2,5
    9648:	00f40733          	add	a4,s0,a5
    964c:	00c72223          	sw	a2,4(a4)
    9650:	00c72423          	sw	a2,8(a4)
    9654:	00f6e663          	bltu	a3,a5,9660 <_malloc_r+0x664>
    9658:	004ba783          	lw	a5,4(s7)
    965c:	cb1ff06f          	j	930c <_malloc_r+0x310>
    9660:	00840593          	addi	a1,s0,8
    9664:	00098513          	mv	a0,s3
    9668:	a7cfd0ef          	jal	68e4 <_free_r>
    966c:	00892b83          	lw	s7,8(s2)
    9670:	000c2583          	lw	a1,0(s8)
    9674:	004ba783          	lw	a5,4(s7)
    9678:	c95ff06f          	j	930c <_malloc_r+0x310>
    967c:	010a8a93          	addi	s5,s5,16
    9680:	c39ff06f          	j	92b8 <_malloc_r+0x2bc>
    9684:	4026d693          	srai	a3,a3,0x2
    9688:	00100793          	li	a5,1
    968c:	00d797b3          	sll	a5,a5,a3
    9690:	00f56533          	or	a0,a0,a5
    9694:	00a92223          	sw	a0,4(s2)
    9698:	d71ff06f          	j	9408 <_malloc_r+0x40c>
    969c:	015b85b3          	add	a1,s7,s5
    96a0:	40b005b3          	neg	a1,a1
    96a4:	01459593          	slli	a1,a1,0x14
    96a8:	0145da13          	srli	s4,a1,0x14
    96ac:	000a0593          	mv	a1,s4
    96b0:	00098513          	mv	a0,s3
    96b4:	5a5010ef          	jal	b458 <_sbrk_r>
    96b8:	fff00793          	li	a5,-1
    96bc:	f4f512e3          	bne	a0,a5,9600 <_malloc_r+0x604>
    96c0:	00000a13          	li	s4,0
    96c4:	f45ff06f          	j	9608 <_malloc_r+0x60c>
    96c8:	00812c03          	lw	s8,8(sp)
    96cc:	00100793          	li	a5,1
    96d0:	00fba223          	sw	a5,4(s7)
    96d4:	00098513          	mv	a0,s3
    96d8:	0fc000ef          	jal	97d4 <__malloc_unlock>
    96dc:	00000513          	li	a0,0
    96e0:	01812a03          	lw	s4,24(sp)
    96e4:	01412a83          	lw	s5,20(sp)
    96e8:	01012b03          	lw	s6,16(sp)
    96ec:	00c12b83          	lw	s7,12(sp)
    96f0:	00412c83          	lw	s9,4(sp)
    96f4:	995ff06f          	j	9088 <_malloc_r+0x8c>
    96f8:	05400693          	li	a3,84
    96fc:	04e6e463          	bltu	a3,a4,9744 <_malloc_r+0x748>
    9700:	00c7d713          	srli	a4,a5,0xc
    9704:	06f70613          	addi	a2,a4,111
    9708:	06e70693          	addi	a3,a4,110
    970c:	00361613          	slli	a2,a2,0x3
    9710:	ccdff06f          	j	93dc <_malloc_r+0x3e0>
    9714:	15400713          	li	a4,340
    9718:	04f76463          	bltu	a4,a5,9760 <_malloc_r+0x764>
    971c:	00f4d793          	srli	a5,s1,0xf
    9720:	07878593          	addi	a1,a5,120
    9724:	07778813          	addi	a6,a5,119
    9728:	00359613          	slli	a2,a1,0x3
    972c:	9b1ff06f          	j	90dc <_malloc_r+0xe0>
    9730:	00892403          	lw	s0,8(s2)
    9734:	00442783          	lw	a5,4(s0)
    9738:	bfdff06f          	j	9334 <_malloc_r+0x338>
    973c:	e37cac23          	sw	s7,-456(s9)
    9740:	e81ff06f          	j	95c0 <_malloc_r+0x5c4>
    9744:	15400693          	li	a3,340
    9748:	04e6e463          	bltu	a3,a4,9790 <_malloc_r+0x794>
    974c:	00f7d713          	srli	a4,a5,0xf
    9750:	07870613          	addi	a2,a4,120
    9754:	07770693          	addi	a3,a4,119
    9758:	00361613          	slli	a2,a2,0x3
    975c:	c81ff06f          	j	93dc <_malloc_r+0x3e0>
    9760:	55400713          	li	a4,1364
    9764:	04f76463          	bltu	a4,a5,97ac <_malloc_r+0x7b0>
    9768:	0124d793          	srli	a5,s1,0x12
    976c:	07d78593          	addi	a1,a5,125
    9770:	07c78813          	addi	a6,a5,124
    9774:	00359613          	slli	a2,a1,0x3
    9778:	965ff06f          	j	90dc <_malloc_r+0xe0>
    977c:	ff8c8c93          	addi	s9,s9,-8
    9780:	019a8ab3          	add	s5,s5,s9
    9784:	417a8ab3          	sub	s5,s5,s7
    9788:	00000a13          	li	s4,0
    978c:	e7dff06f          	j	9608 <_malloc_r+0x60c>
    9790:	55400693          	li	a3,1364
    9794:	02e6e463          	bltu	a3,a4,97bc <_malloc_r+0x7c0>
    9798:	0127d713          	srli	a4,a5,0x12
    979c:	07d70613          	addi	a2,a4,125
    97a0:	07c70693          	addi	a3,a4,124
    97a4:	00361613          	slli	a2,a2,0x3
    97a8:	c35ff06f          	j	93dc <_malloc_r+0x3e0>
    97ac:	3f800613          	li	a2,1016
    97b0:	07f00593          	li	a1,127
    97b4:	07e00813          	li	a6,126
    97b8:	925ff06f          	j	90dc <_malloc_r+0xe0>
    97bc:	3f800613          	li	a2,1016
    97c0:	07e00693          	li	a3,126
    97c4:	c19ff06f          	j	93dc <_malloc_r+0x3e0>
    97c8:	00492783          	lw	a5,4(s2)
    97cc:	d9dff06f          	j	9568 <_malloc_r+0x56c>

000097d0 <__malloc_lock>:
    97d0:	00008067          	ret

000097d4 <__malloc_unlock>:
    97d4:	00008067          	ret

000097d8 <_Balloc>:
    97d8:	04452783          	lw	a5,68(a0)
    97dc:	ff010113          	addi	sp,sp,-16
    97e0:	00812423          	sw	s0,8(sp)
    97e4:	00912223          	sw	s1,4(sp)
    97e8:	00112623          	sw	ra,12(sp)
    97ec:	00050413          	mv	s0,a0
    97f0:	00058493          	mv	s1,a1
    97f4:	02078c63          	beqz	a5,982c <_Balloc+0x54>
    97f8:	00249713          	slli	a4,s1,0x2
    97fc:	00e787b3          	add	a5,a5,a4
    9800:	0007a503          	lw	a0,0(a5)
    9804:	04050463          	beqz	a0,984c <_Balloc+0x74>
    9808:	00052703          	lw	a4,0(a0)
    980c:	00e7a023          	sw	a4,0(a5)
    9810:	00052823          	sw	zero,16(a0)
    9814:	00052623          	sw	zero,12(a0)
    9818:	00c12083          	lw	ra,12(sp)
    981c:	00812403          	lw	s0,8(sp)
    9820:	00412483          	lw	s1,4(sp)
    9824:	01010113          	addi	sp,sp,16
    9828:	00008067          	ret
    982c:	02100613          	li	a2,33
    9830:	00400593          	li	a1,4
    9834:	661010ef          	jal	b694 <_calloc_r>
    9838:	04a42223          	sw	a0,68(s0)
    983c:	00050793          	mv	a5,a0
    9840:	fa051ce3          	bnez	a0,97f8 <_Balloc+0x20>
    9844:	00000513          	li	a0,0
    9848:	fd1ff06f          	j	9818 <_Balloc+0x40>
    984c:	01212023          	sw	s2,0(sp)
    9850:	00100913          	li	s2,1
    9854:	00991933          	sll	s2,s2,s1
    9858:	00590613          	addi	a2,s2,5
    985c:	00261613          	slli	a2,a2,0x2
    9860:	00100593          	li	a1,1
    9864:	00040513          	mv	a0,s0
    9868:	62d010ef          	jal	b694 <_calloc_r>
    986c:	00050a63          	beqz	a0,9880 <_Balloc+0xa8>
    9870:	01252423          	sw	s2,8(a0)
    9874:	00952223          	sw	s1,4(a0)
    9878:	00012903          	lw	s2,0(sp)
    987c:	f95ff06f          	j	9810 <_Balloc+0x38>
    9880:	00012903          	lw	s2,0(sp)
    9884:	00000513          	li	a0,0
    9888:	f91ff06f          	j	9818 <_Balloc+0x40>

0000988c <_Bfree>:
    988c:	02058063          	beqz	a1,98ac <_Bfree+0x20>
    9890:	0045a703          	lw	a4,4(a1)
    9894:	04452783          	lw	a5,68(a0)
    9898:	00271713          	slli	a4,a4,0x2
    989c:	00e787b3          	add	a5,a5,a4
    98a0:	0007a703          	lw	a4,0(a5)
    98a4:	00e5a023          	sw	a4,0(a1)
    98a8:	00b7a023          	sw	a1,0(a5)
    98ac:	00008067          	ret

000098b0 <__multadd>:
    98b0:	fe010113          	addi	sp,sp,-32
    98b4:	00912a23          	sw	s1,20(sp)
    98b8:	0105a483          	lw	s1,16(a1)
    98bc:	00010337          	lui	t1,0x10
    98c0:	00812c23          	sw	s0,24(sp)
    98c4:	01212823          	sw	s2,16(sp)
    98c8:	01312623          	sw	s3,12(sp)
    98cc:	00112e23          	sw	ra,28(sp)
    98d0:	00058913          	mv	s2,a1
    98d4:	00050993          	mv	s3,a0
    98d8:	00068413          	mv	s0,a3
    98dc:	01458813          	addi	a6,a1,20
    98e0:	00000893          	li	a7,0
    98e4:	fff30313          	addi	t1,t1,-1 # ffff <__multf3+0xc07>
    98e8:	00082783          	lw	a5,0(a6)
    98ec:	00480813          	addi	a6,a6,4
    98f0:	00188893          	addi	a7,a7,1
    98f4:	0067f733          	and	a4,a5,t1
    98f8:	02c70733          	mul	a4,a4,a2
    98fc:	0107d693          	srli	a3,a5,0x10
    9900:	02c686b3          	mul	a3,a3,a2
    9904:	008707b3          	add	a5,a4,s0
    9908:	0107d713          	srli	a4,a5,0x10
    990c:	0067f7b3          	and	a5,a5,t1
    9910:	00e686b3          	add	a3,a3,a4
    9914:	01069713          	slli	a4,a3,0x10
    9918:	00f707b3          	add	a5,a4,a5
    991c:	fef82e23          	sw	a5,-4(a6)
    9920:	0106d413          	srli	s0,a3,0x10
    9924:	fc98c2e3          	blt	a7,s1,98e8 <__multadd+0x38>
    9928:	02040263          	beqz	s0,994c <__multadd+0x9c>
    992c:	00892783          	lw	a5,8(s2)
    9930:	02f4de63          	bge	s1,a5,996c <__multadd+0xbc>
    9934:	00448793          	addi	a5,s1,4
    9938:	00279793          	slli	a5,a5,0x2
    993c:	00f907b3          	add	a5,s2,a5
    9940:	0087a223          	sw	s0,4(a5)
    9944:	00148493          	addi	s1,s1,1
    9948:	00992823          	sw	s1,16(s2)
    994c:	01c12083          	lw	ra,28(sp)
    9950:	01812403          	lw	s0,24(sp)
    9954:	01412483          	lw	s1,20(sp)
    9958:	00c12983          	lw	s3,12(sp)
    995c:	00090513          	mv	a0,s2
    9960:	01012903          	lw	s2,16(sp)
    9964:	02010113          	addi	sp,sp,32
    9968:	00008067          	ret
    996c:	00492583          	lw	a1,4(s2)
    9970:	00098513          	mv	a0,s3
    9974:	01412423          	sw	s4,8(sp)
    9978:	00158593          	addi	a1,a1,1
    997c:	e5dff0ef          	jal	97d8 <_Balloc>
    9980:	00050a13          	mv	s4,a0
    9984:	04050e63          	beqz	a0,99e0 <__multadd+0x130>
    9988:	01092603          	lw	a2,16(s2)
    998c:	00c90593          	addi	a1,s2,12
    9990:	00c50513          	addi	a0,a0,12
    9994:	00260613          	addi	a2,a2,2
    9998:	00261613          	slli	a2,a2,0x2
    999c:	a51fc0ef          	jal	63ec <memcpy>
    99a0:	00492703          	lw	a4,4(s2)
    99a4:	0449a783          	lw	a5,68(s3)
    99a8:	00271713          	slli	a4,a4,0x2
    99ac:	00e787b3          	add	a5,a5,a4
    99b0:	0007a703          	lw	a4,0(a5)
    99b4:	00e92023          	sw	a4,0(s2)
    99b8:	0127a023          	sw	s2,0(a5)
    99bc:	00448793          	addi	a5,s1,4
    99c0:	000a0913          	mv	s2,s4
    99c4:	00279793          	slli	a5,a5,0x2
    99c8:	00f907b3          	add	a5,s2,a5
    99cc:	00812a03          	lw	s4,8(sp)
    99d0:	00148493          	addi	s1,s1,1
    99d4:	0087a223          	sw	s0,4(a5)
    99d8:	00992823          	sw	s1,16(s2)
    99dc:	f71ff06f          	j	994c <__multadd+0x9c>
    99e0:	53418693          	addi	a3,gp,1332 # 12e44 <keypad_map+0x184>
    99e4:	00000613          	li	a2,0
    99e8:	0ba00593          	li	a1,186
    99ec:	5c818513          	addi	a0,gp,1480 # 12ed8 <keypad_map+0x218>
    99f0:	445010ef          	jal	b634 <__assert_func>

000099f4 <__s2b>:
    99f4:	fe010113          	addi	sp,sp,-32
    99f8:	00812c23          	sw	s0,24(sp)
    99fc:	00912a23          	sw	s1,20(sp)
    9a00:	01212823          	sw	s2,16(sp)
    9a04:	01312623          	sw	s3,12(sp)
    9a08:	01412423          	sw	s4,8(sp)
    9a0c:	00068993          	mv	s3,a3
    9a10:	00900793          	li	a5,9
    9a14:	00868693          	addi	a3,a3,8
    9a18:	00112e23          	sw	ra,28(sp)
    9a1c:	02f6c6b3          	div	a3,a3,a5
    9a20:	00050913          	mv	s2,a0
    9a24:	00058413          	mv	s0,a1
    9a28:	00060a13          	mv	s4,a2
    9a2c:	00070493          	mv	s1,a4
    9a30:	0d37da63          	bge	a5,s3,9b04 <__s2b+0x110>
    9a34:	00100793          	li	a5,1
    9a38:	00000593          	li	a1,0
    9a3c:	00179793          	slli	a5,a5,0x1
    9a40:	00158593          	addi	a1,a1,1
    9a44:	fed7cce3          	blt	a5,a3,9a3c <__s2b+0x48>
    9a48:	00090513          	mv	a0,s2
    9a4c:	d8dff0ef          	jal	97d8 <_Balloc>
    9a50:	00050593          	mv	a1,a0
    9a54:	0a050c63          	beqz	a0,9b0c <__s2b+0x118>
    9a58:	00100793          	li	a5,1
    9a5c:	00f52823          	sw	a5,16(a0)
    9a60:	00952a23          	sw	s1,20(a0)
    9a64:	00900793          	li	a5,9
    9a68:	0947d863          	bge	a5,s4,9af8 <__s2b+0x104>
    9a6c:	01512223          	sw	s5,4(sp)
    9a70:	00940a93          	addi	s5,s0,9
    9a74:	000a8493          	mv	s1,s5
    9a78:	01440433          	add	s0,s0,s4
    9a7c:	0004c683          	lbu	a3,0(s1)
    9a80:	00a00613          	li	a2,10
    9a84:	00090513          	mv	a0,s2
    9a88:	fd068693          	addi	a3,a3,-48
    9a8c:	e25ff0ef          	jal	98b0 <__multadd>
    9a90:	00148493          	addi	s1,s1,1
    9a94:	00050593          	mv	a1,a0
    9a98:	fe8492e3          	bne	s1,s0,9a7c <__s2b+0x88>
    9a9c:	ff8a0413          	addi	s0,s4,-8
    9aa0:	008a8433          	add	s0,s5,s0
    9aa4:	00412a83          	lw	s5,4(sp)
    9aa8:	033a5663          	bge	s4,s3,9ad4 <__s2b+0xe0>
    9aac:	414989b3          	sub	s3,s3,s4
    9ab0:	013409b3          	add	s3,s0,s3
    9ab4:	00044683          	lbu	a3,0(s0)
    9ab8:	00a00613          	li	a2,10
    9abc:	00090513          	mv	a0,s2
    9ac0:	fd068693          	addi	a3,a3,-48
    9ac4:	dedff0ef          	jal	98b0 <__multadd>
    9ac8:	00140413          	addi	s0,s0,1
    9acc:	00050593          	mv	a1,a0
    9ad0:	ff3412e3          	bne	s0,s3,9ab4 <__s2b+0xc0>
    9ad4:	01c12083          	lw	ra,28(sp)
    9ad8:	01812403          	lw	s0,24(sp)
    9adc:	01412483          	lw	s1,20(sp)
    9ae0:	01012903          	lw	s2,16(sp)
    9ae4:	00c12983          	lw	s3,12(sp)
    9ae8:	00812a03          	lw	s4,8(sp)
    9aec:	00058513          	mv	a0,a1
    9af0:	02010113          	addi	sp,sp,32
    9af4:	00008067          	ret
    9af8:	00a40413          	addi	s0,s0,10
    9afc:	00900a13          	li	s4,9
    9b00:	fa9ff06f          	j	9aa8 <__s2b+0xb4>
    9b04:	00000593          	li	a1,0
    9b08:	f41ff06f          	j	9a48 <__s2b+0x54>
    9b0c:	53418693          	addi	a3,gp,1332 # 12e44 <keypad_map+0x184>
    9b10:	00000613          	li	a2,0
    9b14:	0d300593          	li	a1,211
    9b18:	5c818513          	addi	a0,gp,1480 # 12ed8 <keypad_map+0x218>
    9b1c:	01512223          	sw	s5,4(sp)
    9b20:	315010ef          	jal	b634 <__assert_func>

00009b24 <__hi0bits>:
    9b24:	00050793          	mv	a5,a0
    9b28:	00010737          	lui	a4,0x10
    9b2c:	00000513          	li	a0,0
    9b30:	00e7f663          	bgeu	a5,a4,9b3c <__hi0bits+0x18>
    9b34:	01079793          	slli	a5,a5,0x10
    9b38:	01000513          	li	a0,16
    9b3c:	01000737          	lui	a4,0x1000
    9b40:	00e7f663          	bgeu	a5,a4,9b4c <__hi0bits+0x28>
    9b44:	00850513          	addi	a0,a0,8
    9b48:	00879793          	slli	a5,a5,0x8
    9b4c:	10000737          	lui	a4,0x10000
    9b50:	00e7f663          	bgeu	a5,a4,9b5c <__hi0bits+0x38>
    9b54:	00450513          	addi	a0,a0,4
    9b58:	00479793          	slli	a5,a5,0x4
    9b5c:	40000737          	lui	a4,0x40000
    9b60:	00e7ea63          	bltu	a5,a4,9b74 <__hi0bits+0x50>
    9b64:	fff7c793          	not	a5,a5
    9b68:	01f7d793          	srli	a5,a5,0x1f
    9b6c:	00f50533          	add	a0,a0,a5
    9b70:	00008067          	ret
    9b74:	00279793          	slli	a5,a5,0x2
    9b78:	0007ca63          	bltz	a5,9b8c <__hi0bits+0x68>
    9b7c:	00179713          	slli	a4,a5,0x1
    9b80:	00074a63          	bltz	a4,9b94 <__hi0bits+0x70>
    9b84:	02000513          	li	a0,32
    9b88:	00008067          	ret
    9b8c:	00250513          	addi	a0,a0,2
    9b90:	00008067          	ret
    9b94:	00350513          	addi	a0,a0,3
    9b98:	00008067          	ret

00009b9c <__lo0bits>:
    9b9c:	00052783          	lw	a5,0(a0)
    9ba0:	00050713          	mv	a4,a0
    9ba4:	0077f693          	andi	a3,a5,7
    9ba8:	02068463          	beqz	a3,9bd0 <__lo0bits+0x34>
    9bac:	0017f693          	andi	a3,a5,1
    9bb0:	00000513          	li	a0,0
    9bb4:	04069e63          	bnez	a3,9c10 <__lo0bits+0x74>
    9bb8:	0027f693          	andi	a3,a5,2
    9bbc:	0a068863          	beqz	a3,9c6c <__lo0bits+0xd0>
    9bc0:	0017d793          	srli	a5,a5,0x1
    9bc4:	00f72023          	sw	a5,0(a4) # 40000000 <_memory_end+0x3ffe0000>
    9bc8:	00100513          	li	a0,1
    9bcc:	00008067          	ret
    9bd0:	01079693          	slli	a3,a5,0x10
    9bd4:	0106d693          	srli	a3,a3,0x10
    9bd8:	00000513          	li	a0,0
    9bdc:	06068e63          	beqz	a3,9c58 <__lo0bits+0xbc>
    9be0:	0ff7f693          	zext.b	a3,a5
    9be4:	06068063          	beqz	a3,9c44 <__lo0bits+0xa8>
    9be8:	00f7f693          	andi	a3,a5,15
    9bec:	04068263          	beqz	a3,9c30 <__lo0bits+0x94>
    9bf0:	0037f693          	andi	a3,a5,3
    9bf4:	02068463          	beqz	a3,9c1c <__lo0bits+0x80>
    9bf8:	0017f693          	andi	a3,a5,1
    9bfc:	00069c63          	bnez	a3,9c14 <__lo0bits+0x78>
    9c00:	0017d793          	srli	a5,a5,0x1
    9c04:	00150513          	addi	a0,a0,1
    9c08:	00079663          	bnez	a5,9c14 <__lo0bits+0x78>
    9c0c:	02000513          	li	a0,32
    9c10:	00008067          	ret
    9c14:	00f72023          	sw	a5,0(a4)
    9c18:	00008067          	ret
    9c1c:	0027d793          	srli	a5,a5,0x2
    9c20:	0017f693          	andi	a3,a5,1
    9c24:	00250513          	addi	a0,a0,2
    9c28:	fe0696e3          	bnez	a3,9c14 <__lo0bits+0x78>
    9c2c:	fd5ff06f          	j	9c00 <__lo0bits+0x64>
    9c30:	0047d793          	srli	a5,a5,0x4
    9c34:	0037f693          	andi	a3,a5,3
    9c38:	00450513          	addi	a0,a0,4
    9c3c:	fa069ee3          	bnez	a3,9bf8 <__lo0bits+0x5c>
    9c40:	fddff06f          	j	9c1c <__lo0bits+0x80>
    9c44:	0087d793          	srli	a5,a5,0x8
    9c48:	00f7f693          	andi	a3,a5,15
    9c4c:	00850513          	addi	a0,a0,8
    9c50:	fa0690e3          	bnez	a3,9bf0 <__lo0bits+0x54>
    9c54:	fddff06f          	j	9c30 <__lo0bits+0x94>
    9c58:	0107d793          	srli	a5,a5,0x10
    9c5c:	0ff7f693          	zext.b	a3,a5
    9c60:	01000513          	li	a0,16
    9c64:	f80692e3          	bnez	a3,9be8 <__lo0bits+0x4c>
    9c68:	fddff06f          	j	9c44 <__lo0bits+0xa8>
    9c6c:	0027d793          	srli	a5,a5,0x2
    9c70:	00f72023          	sw	a5,0(a4)
    9c74:	00200513          	li	a0,2
    9c78:	00008067          	ret

00009c7c <__i2b>:
    9c7c:	04452783          	lw	a5,68(a0)
    9c80:	ff010113          	addi	sp,sp,-16
    9c84:	00812423          	sw	s0,8(sp)
    9c88:	00912223          	sw	s1,4(sp)
    9c8c:	00112623          	sw	ra,12(sp)
    9c90:	00050413          	mv	s0,a0
    9c94:	00058493          	mv	s1,a1
    9c98:	02078c63          	beqz	a5,9cd0 <__i2b+0x54>
    9c9c:	0047a503          	lw	a0,4(a5)
    9ca0:	04050e63          	beqz	a0,9cfc <__i2b+0x80>
    9ca4:	00052703          	lw	a4,0(a0)
    9ca8:	00e7a223          	sw	a4,4(a5)
    9cac:	00c12083          	lw	ra,12(sp)
    9cb0:	00812403          	lw	s0,8(sp)
    9cb4:	00100793          	li	a5,1
    9cb8:	00952a23          	sw	s1,20(a0)
    9cbc:	00052623          	sw	zero,12(a0)
    9cc0:	00f52823          	sw	a5,16(a0)
    9cc4:	00412483          	lw	s1,4(sp)
    9cc8:	01010113          	addi	sp,sp,16
    9ccc:	00008067          	ret
    9cd0:	02100613          	li	a2,33
    9cd4:	00400593          	li	a1,4
    9cd8:	1bd010ef          	jal	b694 <_calloc_r>
    9cdc:	04a42223          	sw	a0,68(s0)
    9ce0:	00050793          	mv	a5,a0
    9ce4:	fa051ce3          	bnez	a0,9c9c <__i2b+0x20>
    9ce8:	53418693          	addi	a3,gp,1332 # 12e44 <keypad_map+0x184>
    9cec:	00000613          	li	a2,0
    9cf0:	14500593          	li	a1,325
    9cf4:	5c818513          	addi	a0,gp,1480 # 12ed8 <keypad_map+0x218>
    9cf8:	13d010ef          	jal	b634 <__assert_func>
    9cfc:	01c00613          	li	a2,28
    9d00:	00100593          	li	a1,1
    9d04:	00040513          	mv	a0,s0
    9d08:	18d010ef          	jal	b694 <_calloc_r>
    9d0c:	fc050ee3          	beqz	a0,9ce8 <__i2b+0x6c>
    9d10:	00100793          	li	a5,1
    9d14:	00f52223          	sw	a5,4(a0)
    9d18:	00200793          	li	a5,2
    9d1c:	00f52423          	sw	a5,8(a0)
    9d20:	f8dff06f          	j	9cac <__i2b+0x30>

00009d24 <__multiply>:
    9d24:	fe010113          	addi	sp,sp,-32
    9d28:	01212823          	sw	s2,16(sp)
    9d2c:	01312623          	sw	s3,12(sp)
    9d30:	0105a903          	lw	s2,16(a1)
    9d34:	01062983          	lw	s3,16(a2)
    9d38:	00912a23          	sw	s1,20(sp)
    9d3c:	01412423          	sw	s4,8(sp)
    9d40:	00112e23          	sw	ra,28(sp)
    9d44:	00812c23          	sw	s0,24(sp)
    9d48:	00058a13          	mv	s4,a1
    9d4c:	00060493          	mv	s1,a2
    9d50:	01394c63          	blt	s2,s3,9d68 <__multiply+0x44>
    9d54:	00098713          	mv	a4,s3
    9d58:	00058493          	mv	s1,a1
    9d5c:	00090993          	mv	s3,s2
    9d60:	00060a13          	mv	s4,a2
    9d64:	00070913          	mv	s2,a4
    9d68:	0084a783          	lw	a5,8(s1)
    9d6c:	0044a583          	lw	a1,4(s1)
    9d70:	01298433          	add	s0,s3,s2
    9d74:	0087a7b3          	slt	a5,a5,s0
    9d78:	00f585b3          	add	a1,a1,a5
    9d7c:	a5dff0ef          	jal	97d8 <_Balloc>
    9d80:	1a050e63          	beqz	a0,9f3c <__multiply+0x218>
    9d84:	01450313          	addi	t1,a0,20
    9d88:	00241893          	slli	a7,s0,0x2
    9d8c:	011308b3          	add	a7,t1,a7
    9d90:	00030793          	mv	a5,t1
    9d94:	01137863          	bgeu	t1,a7,9da4 <__multiply+0x80>
    9d98:	0007a023          	sw	zero,0(a5)
    9d9c:	00478793          	addi	a5,a5,4
    9da0:	ff17ece3          	bltu	a5,a7,9d98 <__multiply+0x74>
    9da4:	014a0813          	addi	a6,s4,20
    9da8:	00291e13          	slli	t3,s2,0x2
    9dac:	01448e93          	addi	t4,s1,20
    9db0:	00299593          	slli	a1,s3,0x2
    9db4:	01c80e33          	add	t3,a6,t3
    9db8:	00be85b3          	add	a1,t4,a1
    9dbc:	13c87663          	bgeu	a6,t3,9ee8 <__multiply+0x1c4>
    9dc0:	01548793          	addi	a5,s1,21
    9dc4:	00400f13          	li	t5,4
    9dc8:	16f5f063          	bgeu	a1,a5,9f28 <__multiply+0x204>
    9dcc:	000106b7          	lui	a3,0x10
    9dd0:	fff68693          	addi	a3,a3,-1 # ffff <__multf3+0xc07>
    9dd4:	0180006f          	j	9dec <__multiply+0xc8>
    9dd8:	010fdf93          	srli	t6,t6,0x10
    9ddc:	080f9863          	bnez	t6,9e6c <__multiply+0x148>
    9de0:	00480813          	addi	a6,a6,4
    9de4:	00430313          	addi	t1,t1,4
    9de8:	11c87063          	bgeu	a6,t3,9ee8 <__multiply+0x1c4>
    9dec:	00082f83          	lw	t6,0(a6)
    9df0:	00dff3b3          	and	t2,t6,a3
    9df4:	fe0382e3          	beqz	t2,9dd8 <__multiply+0xb4>
    9df8:	00030293          	mv	t0,t1
    9dfc:	000e8f93          	mv	t6,t4
    9e00:	00000493          	li	s1,0
    9e04:	000fa783          	lw	a5,0(t6)
    9e08:	0002a603          	lw	a2,0(t0) # 63c4 <memset+0xb4>
    9e0c:	00428293          	addi	t0,t0,4
    9e10:	00d7f733          	and	a4,a5,a3
    9e14:	02770733          	mul	a4,a4,t2
    9e18:	0107d793          	srli	a5,a5,0x10
    9e1c:	00d67933          	and	s2,a2,a3
    9e20:	01065613          	srli	a2,a2,0x10
    9e24:	004f8f93          	addi	t6,t6,4
    9e28:	027787b3          	mul	a5,a5,t2
    9e2c:	01270733          	add	a4,a4,s2
    9e30:	00970733          	add	a4,a4,s1
    9e34:	01075493          	srli	s1,a4,0x10
    9e38:	00d77733          	and	a4,a4,a3
    9e3c:	00c787b3          	add	a5,a5,a2
    9e40:	009787b3          	add	a5,a5,s1
    9e44:	01079613          	slli	a2,a5,0x10
    9e48:	00e66733          	or	a4,a2,a4
    9e4c:	fee2ae23          	sw	a4,-4(t0)
    9e50:	0107d493          	srli	s1,a5,0x10
    9e54:	fabfe8e3          	bltu	t6,a1,9e04 <__multiply+0xe0>
    9e58:	01e307b3          	add	a5,t1,t5
    9e5c:	0097a023          	sw	s1,0(a5)
    9e60:	00082f83          	lw	t6,0(a6)
    9e64:	010fdf93          	srli	t6,t6,0x10
    9e68:	f60f8ce3          	beqz	t6,9de0 <__multiply+0xbc>
    9e6c:	00032703          	lw	a4,0(t1)
    9e70:	00030293          	mv	t0,t1
    9e74:	000e8613          	mv	a2,t4
    9e78:	00070493          	mv	s1,a4
    9e7c:	00000393          	li	t2,0
    9e80:	00062783          	lw	a5,0(a2)
    9e84:	0104d993          	srli	s3,s1,0x10
    9e88:	00d77733          	and	a4,a4,a3
    9e8c:	00d7f7b3          	and	a5,a5,a3
    9e90:	03f787b3          	mul	a5,a5,t6
    9e94:	0042a483          	lw	s1,4(t0)
    9e98:	00428293          	addi	t0,t0,4
    9e9c:	00460613          	addi	a2,a2,4
    9ea0:	00d4f933          	and	s2,s1,a3
    9ea4:	007787b3          	add	a5,a5,t2
    9ea8:	013787b3          	add	a5,a5,s3
    9eac:	01079393          	slli	t2,a5,0x10
    9eb0:	00e3e733          	or	a4,t2,a4
    9eb4:	fee2ae23          	sw	a4,-4(t0)
    9eb8:	ffe65703          	lhu	a4,-2(a2)
    9ebc:	0107d793          	srli	a5,a5,0x10
    9ec0:	03f70733          	mul	a4,a4,t6
    9ec4:	01270733          	add	a4,a4,s2
    9ec8:	00f70733          	add	a4,a4,a5
    9ecc:	01075393          	srli	t2,a4,0x10
    9ed0:	fab668e3          	bltu	a2,a1,9e80 <__multiply+0x15c>
    9ed4:	01e307b3          	add	a5,t1,t5
    9ed8:	00e7a023          	sw	a4,0(a5)
    9edc:	00480813          	addi	a6,a6,4
    9ee0:	00430313          	addi	t1,t1,4
    9ee4:	f1c864e3          	bltu	a6,t3,9dec <__multiply+0xc8>
    9ee8:	00804863          	bgtz	s0,9ef8 <__multiply+0x1d4>
    9eec:	0180006f          	j	9f04 <__multiply+0x1e0>
    9ef0:	fff40413          	addi	s0,s0,-1
    9ef4:	00040863          	beqz	s0,9f04 <__multiply+0x1e0>
    9ef8:	ffc8a783          	lw	a5,-4(a7)
    9efc:	ffc88893          	addi	a7,a7,-4
    9f00:	fe0788e3          	beqz	a5,9ef0 <__multiply+0x1cc>
    9f04:	01c12083          	lw	ra,28(sp)
    9f08:	00852823          	sw	s0,16(a0)
    9f0c:	01812403          	lw	s0,24(sp)
    9f10:	01412483          	lw	s1,20(sp)
    9f14:	01012903          	lw	s2,16(sp)
    9f18:	00c12983          	lw	s3,12(sp)
    9f1c:	00812a03          	lw	s4,8(sp)
    9f20:	02010113          	addi	sp,sp,32
    9f24:	00008067          	ret
    9f28:	409587b3          	sub	a5,a1,s1
    9f2c:	feb78793          	addi	a5,a5,-21
    9f30:	ffc7f793          	andi	a5,a5,-4
    9f34:	00478f13          	addi	t5,a5,4
    9f38:	e95ff06f          	j	9dcc <__multiply+0xa8>
    9f3c:	53418693          	addi	a3,gp,1332 # 12e44 <keypad_map+0x184>
    9f40:	00000613          	li	a2,0
    9f44:	16200593          	li	a1,354
    9f48:	5c818513          	addi	a0,gp,1480 # 12ed8 <keypad_map+0x218>
    9f4c:	6e8010ef          	jal	b634 <__assert_func>

00009f50 <__pow5mult>:
    9f50:	fe010113          	addi	sp,sp,-32
    9f54:	00812c23          	sw	s0,24(sp)
    9f58:	01212823          	sw	s2,16(sp)
    9f5c:	01312623          	sw	s3,12(sp)
    9f60:	00112e23          	sw	ra,28(sp)
    9f64:	00367793          	andi	a5,a2,3
    9f68:	00060413          	mv	s0,a2
    9f6c:	00050993          	mv	s3,a0
    9f70:	00058913          	mv	s2,a1
    9f74:	0a079c63          	bnez	a5,a02c <__pow5mult+0xdc>
    9f78:	40245413          	srai	s0,s0,0x2
    9f7c:	06040a63          	beqz	s0,9ff0 <__pow5mult+0xa0>
    9f80:	00912a23          	sw	s1,20(sp)
    9f84:	0409a483          	lw	s1,64(s3)
    9f88:	0c048663          	beqz	s1,a054 <__pow5mult+0x104>
    9f8c:	00147793          	andi	a5,s0,1
    9f90:	02079063          	bnez	a5,9fb0 <__pow5mult+0x60>
    9f94:	40145413          	srai	s0,s0,0x1
    9f98:	04040a63          	beqz	s0,9fec <__pow5mult+0x9c>
    9f9c:	0004a503          	lw	a0,0(s1)
    9fa0:	06050663          	beqz	a0,a00c <__pow5mult+0xbc>
    9fa4:	00050493          	mv	s1,a0
    9fa8:	00147793          	andi	a5,s0,1
    9fac:	fe0784e3          	beqz	a5,9f94 <__pow5mult+0x44>
    9fb0:	00048613          	mv	a2,s1
    9fb4:	00090593          	mv	a1,s2
    9fb8:	00098513          	mv	a0,s3
    9fbc:	d69ff0ef          	jal	9d24 <__multiply>
    9fc0:	02090063          	beqz	s2,9fe0 <__pow5mult+0x90>
    9fc4:	00492703          	lw	a4,4(s2)
    9fc8:	0449a783          	lw	a5,68(s3)
    9fcc:	00271713          	slli	a4,a4,0x2
    9fd0:	00e787b3          	add	a5,a5,a4
    9fd4:	0007a703          	lw	a4,0(a5)
    9fd8:	00e92023          	sw	a4,0(s2)
    9fdc:	0127a023          	sw	s2,0(a5)
    9fe0:	40145413          	srai	s0,s0,0x1
    9fe4:	00050913          	mv	s2,a0
    9fe8:	fa041ae3          	bnez	s0,9f9c <__pow5mult+0x4c>
    9fec:	01412483          	lw	s1,20(sp)
    9ff0:	01c12083          	lw	ra,28(sp)
    9ff4:	01812403          	lw	s0,24(sp)
    9ff8:	00c12983          	lw	s3,12(sp)
    9ffc:	00090513          	mv	a0,s2
    a000:	01012903          	lw	s2,16(sp)
    a004:	02010113          	addi	sp,sp,32
    a008:	00008067          	ret
    a00c:	00048613          	mv	a2,s1
    a010:	00048593          	mv	a1,s1
    a014:	00098513          	mv	a0,s3
    a018:	d0dff0ef          	jal	9d24 <__multiply>
    a01c:	00a4a023          	sw	a0,0(s1)
    a020:	00052023          	sw	zero,0(a0)
    a024:	00050493          	mv	s1,a0
    a028:	f81ff06f          	j	9fa8 <__pow5mult+0x58>
    a02c:	fff78793          	addi	a5,a5,-1
    a030:	00013737          	lui	a4,0x13
    a034:	1dc70713          	addi	a4,a4,476 # 131dc <p05.0>
    a038:	00279793          	slli	a5,a5,0x2
    a03c:	00f707b3          	add	a5,a4,a5
    a040:	0007a603          	lw	a2,0(a5)
    a044:	00000693          	li	a3,0
    a048:	869ff0ef          	jal	98b0 <__multadd>
    a04c:	00050913          	mv	s2,a0
    a050:	f29ff06f          	j	9f78 <__pow5mult+0x28>
    a054:	00100593          	li	a1,1
    a058:	00098513          	mv	a0,s3
    a05c:	f7cff0ef          	jal	97d8 <_Balloc>
    a060:	00050493          	mv	s1,a0
    a064:	02050063          	beqz	a0,a084 <__pow5mult+0x134>
    a068:	27100793          	li	a5,625
    a06c:	00f52a23          	sw	a5,20(a0)
    a070:	00100793          	li	a5,1
    a074:	00f52823          	sw	a5,16(a0)
    a078:	04a9a023          	sw	a0,64(s3)
    a07c:	00052023          	sw	zero,0(a0)
    a080:	f0dff06f          	j	9f8c <__pow5mult+0x3c>
    a084:	53418693          	addi	a3,gp,1332 # 12e44 <keypad_map+0x184>
    a088:	00000613          	li	a2,0
    a08c:	14500593          	li	a1,325
    a090:	5c818513          	addi	a0,gp,1480 # 12ed8 <keypad_map+0x218>
    a094:	5a0010ef          	jal	b634 <__assert_func>

0000a098 <__lshift>:
    a098:	fe010113          	addi	sp,sp,-32
    a09c:	01512223          	sw	s5,4(sp)
    a0a0:	0105aa83          	lw	s5,16(a1)
    a0a4:	0085a783          	lw	a5,8(a1)
    a0a8:	01312623          	sw	s3,12(sp)
    a0ac:	40565993          	srai	s3,a2,0x5
    a0b0:	01598ab3          	add	s5,s3,s5
    a0b4:	00812c23          	sw	s0,24(sp)
    a0b8:	00912a23          	sw	s1,20(sp)
    a0bc:	01212823          	sw	s2,16(sp)
    a0c0:	01412423          	sw	s4,8(sp)
    a0c4:	00112e23          	sw	ra,28(sp)
    a0c8:	001a8913          	addi	s2,s5,1
    a0cc:	00058493          	mv	s1,a1
    a0d0:	00060413          	mv	s0,a2
    a0d4:	0045a583          	lw	a1,4(a1)
    a0d8:	00050a13          	mv	s4,a0
    a0dc:	0127d863          	bge	a5,s2,a0ec <__lshift+0x54>
    a0e0:	00179793          	slli	a5,a5,0x1
    a0e4:	00158593          	addi	a1,a1,1
    a0e8:	ff27cce3          	blt	a5,s2,a0e0 <__lshift+0x48>
    a0ec:	000a0513          	mv	a0,s4
    a0f0:	ee8ff0ef          	jal	97d8 <_Balloc>
    a0f4:	10050c63          	beqz	a0,a20c <__lshift+0x174>
    a0f8:	01450813          	addi	a6,a0,20
    a0fc:	03305463          	blez	s3,a124 <__lshift+0x8c>
    a100:	00598993          	addi	s3,s3,5
    a104:	00299993          	slli	s3,s3,0x2
    a108:	01350733          	add	a4,a0,s3
    a10c:	00080793          	mv	a5,a6
    a110:	00478793          	addi	a5,a5,4
    a114:	fe07ae23          	sw	zero,-4(a5)
    a118:	fee79ce3          	bne	a5,a4,a110 <__lshift+0x78>
    a11c:	fec98993          	addi	s3,s3,-20
    a120:	01380833          	add	a6,a6,s3
    a124:	0104a883          	lw	a7,16(s1)
    a128:	01448793          	addi	a5,s1,20
    a12c:	01f47613          	andi	a2,s0,31
    a130:	00289893          	slli	a7,a7,0x2
    a134:	011788b3          	add	a7,a5,a7
    a138:	0a060463          	beqz	a2,a1e0 <__lshift+0x148>
    a13c:	02000593          	li	a1,32
    a140:	40c585b3          	sub	a1,a1,a2
    a144:	00080313          	mv	t1,a6
    a148:	00000693          	li	a3,0
    a14c:	0007a703          	lw	a4,0(a5)
    a150:	00430313          	addi	t1,t1,4
    a154:	00478793          	addi	a5,a5,4
    a158:	00c71733          	sll	a4,a4,a2
    a15c:	00d76733          	or	a4,a4,a3
    a160:	fee32e23          	sw	a4,-4(t1)
    a164:	ffc7a683          	lw	a3,-4(a5)
    a168:	00b6d6b3          	srl	a3,a3,a1
    a16c:	ff17e0e3          	bltu	a5,a7,a14c <__lshift+0xb4>
    a170:	01548793          	addi	a5,s1,21
    a174:	00400713          	li	a4,4
    a178:	00f8ea63          	bltu	a7,a5,a18c <__lshift+0xf4>
    a17c:	409887b3          	sub	a5,a7,s1
    a180:	feb78793          	addi	a5,a5,-21
    a184:	ffc7f793          	andi	a5,a5,-4
    a188:	00478713          	addi	a4,a5,4
    a18c:	00e80833          	add	a6,a6,a4
    a190:	00d82023          	sw	a3,0(a6)
    a194:	00069463          	bnez	a3,a19c <__lshift+0x104>
    a198:	000a8913          	mv	s2,s5
    a19c:	0044a703          	lw	a4,4(s1)
    a1a0:	044a2783          	lw	a5,68(s4)
    a1a4:	01c12083          	lw	ra,28(sp)
    a1a8:	00271713          	slli	a4,a4,0x2
    a1ac:	00e787b3          	add	a5,a5,a4
    a1b0:	0007a703          	lw	a4,0(a5)
    a1b4:	01252823          	sw	s2,16(a0)
    a1b8:	01812403          	lw	s0,24(sp)
    a1bc:	00e4a023          	sw	a4,0(s1)
    a1c0:	0097a023          	sw	s1,0(a5)
    a1c4:	01012903          	lw	s2,16(sp)
    a1c8:	01412483          	lw	s1,20(sp)
    a1cc:	00c12983          	lw	s3,12(sp)
    a1d0:	00812a03          	lw	s4,8(sp)
    a1d4:	00412a83          	lw	s5,4(sp)
    a1d8:	02010113          	addi	sp,sp,32
    a1dc:	00008067          	ret
    a1e0:	0007a703          	lw	a4,0(a5)
    a1e4:	00478793          	addi	a5,a5,4
    a1e8:	00480813          	addi	a6,a6,4
    a1ec:	fee82e23          	sw	a4,-4(a6)
    a1f0:	fb17f4e3          	bgeu	a5,a7,a198 <__lshift+0x100>
    a1f4:	0007a703          	lw	a4,0(a5)
    a1f8:	00478793          	addi	a5,a5,4
    a1fc:	00480813          	addi	a6,a6,4
    a200:	fee82e23          	sw	a4,-4(a6)
    a204:	fd17eee3          	bltu	a5,a7,a1e0 <__lshift+0x148>
    a208:	f91ff06f          	j	a198 <__lshift+0x100>
    a20c:	53418693          	addi	a3,gp,1332 # 12e44 <keypad_map+0x184>
    a210:	00000613          	li	a2,0
    a214:	1de00593          	li	a1,478
    a218:	5c818513          	addi	a0,gp,1480 # 12ed8 <keypad_map+0x218>
    a21c:	418010ef          	jal	b634 <__assert_func>

0000a220 <__mcmp>:
    a220:	01052703          	lw	a4,16(a0)
    a224:	0105a783          	lw	a5,16(a1)
    a228:	00050813          	mv	a6,a0
    a22c:	40f70533          	sub	a0,a4,a5
    a230:	04f71263          	bne	a4,a5,a274 <__mcmp+0x54>
    a234:	00279793          	slli	a5,a5,0x2
    a238:	01480813          	addi	a6,a6,20
    a23c:	01458593          	addi	a1,a1,20
    a240:	00f80733          	add	a4,a6,a5
    a244:	00f587b3          	add	a5,a1,a5
    a248:	0080006f          	j	a250 <__mcmp+0x30>
    a24c:	02e87463          	bgeu	a6,a4,a274 <__mcmp+0x54>
    a250:	ffc72603          	lw	a2,-4(a4)
    a254:	ffc7a683          	lw	a3,-4(a5)
    a258:	ffc70713          	addi	a4,a4,-4
    a25c:	ffc78793          	addi	a5,a5,-4
    a260:	fed606e3          	beq	a2,a3,a24c <__mcmp+0x2c>
    a264:	00100513          	li	a0,1
    a268:	00d67663          	bgeu	a2,a3,a274 <__mcmp+0x54>
    a26c:	fff00513          	li	a0,-1
    a270:	00008067          	ret
    a274:	00008067          	ret

0000a278 <__mdiff>:
    a278:	0105a703          	lw	a4,16(a1)
    a27c:	01062783          	lw	a5,16(a2)
    a280:	ff010113          	addi	sp,sp,-16
    a284:	00812423          	sw	s0,8(sp)
    a288:	00912223          	sw	s1,4(sp)
    a28c:	00112623          	sw	ra,12(sp)
    a290:	01212023          	sw	s2,0(sp)
    a294:	00058413          	mv	s0,a1
    a298:	00060493          	mv	s1,a2
    a29c:	40f706b3          	sub	a3,a4,a5
    a2a0:	18f71e63          	bne	a4,a5,a43c <__mdiff+0x1c4>
    a2a4:	00279693          	slli	a3,a5,0x2
    a2a8:	01458613          	addi	a2,a1,20
    a2ac:	01448713          	addi	a4,s1,20
    a2b0:	00d607b3          	add	a5,a2,a3
    a2b4:	00d70733          	add	a4,a4,a3
    a2b8:	0080006f          	j	a2c0 <__mdiff+0x48>
    a2bc:	18f67c63          	bgeu	a2,a5,a454 <__mdiff+0x1dc>
    a2c0:	ffc7a583          	lw	a1,-4(a5)
    a2c4:	ffc72683          	lw	a3,-4(a4)
    a2c8:	ffc78793          	addi	a5,a5,-4
    a2cc:	ffc70713          	addi	a4,a4,-4
    a2d0:	fed586e3          	beq	a1,a3,a2bc <__mdiff+0x44>
    a2d4:	00100913          	li	s2,1
    a2d8:	00d5ea63          	bltu	a1,a3,a2ec <__mdiff+0x74>
    a2dc:	00048793          	mv	a5,s1
    a2e0:	00000913          	li	s2,0
    a2e4:	00040493          	mv	s1,s0
    a2e8:	00078413          	mv	s0,a5
    a2ec:	0044a583          	lw	a1,4(s1)
    a2f0:	ce8ff0ef          	jal	97d8 <_Balloc>
    a2f4:	1a050663          	beqz	a0,a4a0 <__mdiff+0x228>
    a2f8:	0104a883          	lw	a7,16(s1)
    a2fc:	01042283          	lw	t0,16(s0)
    a300:	01448f93          	addi	t6,s1,20
    a304:	00289313          	slli	t1,a7,0x2
    a308:	01440813          	addi	a6,s0,20
    a30c:	00229293          	slli	t0,t0,0x2
    a310:	01450593          	addi	a1,a0,20
    a314:	00010e37          	lui	t3,0x10
    a318:	01252623          	sw	s2,12(a0)
    a31c:	006f8333          	add	t1,t6,t1
    a320:	005802b3          	add	t0,a6,t0
    a324:	00058f13          	mv	t5,a1
    a328:	000f8e93          	mv	t4,t6
    a32c:	00000693          	li	a3,0
    a330:	fffe0e13          	addi	t3,t3,-1 # ffff <__multf3+0xc07>
    a334:	000ea703          	lw	a4,0(t4)
    a338:	00082603          	lw	a2,0(a6)
    a33c:	004f0f13          	addi	t5,t5,4
    a340:	01c777b3          	and	a5,a4,t3
    a344:	01c673b3          	and	t2,a2,t3
    a348:	407787b3          	sub	a5,a5,t2
    a34c:	00d787b3          	add	a5,a5,a3
    a350:	01075713          	srli	a4,a4,0x10
    a354:	01065613          	srli	a2,a2,0x10
    a358:	4107d693          	srai	a3,a5,0x10
    a35c:	40c70733          	sub	a4,a4,a2
    a360:	00d70733          	add	a4,a4,a3
    a364:	01071693          	slli	a3,a4,0x10
    a368:	01c7f7b3          	and	a5,a5,t3
    a36c:	00d7e7b3          	or	a5,a5,a3
    a370:	00480813          	addi	a6,a6,4
    a374:	feff2e23          	sw	a5,-4(t5)
    a378:	004e8e93          	addi	t4,t4,4
    a37c:	41075693          	srai	a3,a4,0x10
    a380:	fa586ae3          	bltu	a6,t0,a334 <__mdiff+0xbc>
    a384:	01540713          	addi	a4,s0,21
    a388:	40828433          	sub	s0,t0,s0
    a38c:	feb40413          	addi	s0,s0,-21
    a390:	00e2b2b3          	sltu	t0,t0,a4
    a394:	0012cf13          	xori	t5,t0,1
    a398:	00245413          	srli	s0,s0,0x2
    a39c:	00400713          	li	a4,4
    a3a0:	0a028463          	beqz	t0,a448 <__mdiff+0x1d0>
    a3a4:	00ef8fb3          	add	t6,t6,a4
    a3a8:	00e58833          	add	a6,a1,a4
    a3ac:	00010eb7          	lui	t4,0x10
    a3b0:	00080e13          	mv	t3,a6
    a3b4:	000f8613          	mv	a2,t6
    a3b8:	fffe8e93          	addi	t4,t4,-1 # ffff <__multf3+0xc07>
    a3bc:	0c6ff463          	bgeu	t6,t1,a484 <__mdiff+0x20c>
    a3c0:	00062783          	lw	a5,0(a2)
    a3c4:	004e0e13          	addi	t3,t3,4
    a3c8:	00460613          	addi	a2,a2,4
    a3cc:	01d7f733          	and	a4,a5,t4
    a3d0:	00d70733          	add	a4,a4,a3
    a3d4:	0107d593          	srli	a1,a5,0x10
    a3d8:	41075713          	srai	a4,a4,0x10
    a3dc:	00b70733          	add	a4,a4,a1
    a3e0:	00d787b3          	add	a5,a5,a3
    a3e4:	01d7f7b3          	and	a5,a5,t4
    a3e8:	01071693          	slli	a3,a4,0x10
    a3ec:	00d7e7b3          	or	a5,a5,a3
    a3f0:	fefe2e23          	sw	a5,-4(t3)
    a3f4:	41075693          	srai	a3,a4,0x10
    a3f8:	fc6664e3          	bltu	a2,t1,a3c0 <__mdiff+0x148>
    a3fc:	fff30313          	addi	t1,t1,-1
    a400:	41f30333          	sub	t1,t1,t6
    a404:	ffc37313          	andi	t1,t1,-4
    a408:	00680733          	add	a4,a6,t1
    a40c:	00079a63          	bnez	a5,a420 <__mdiff+0x1a8>
    a410:	ffc72783          	lw	a5,-4(a4)
    a414:	fff88893          	addi	a7,a7,-1
    a418:	ffc70713          	addi	a4,a4,-4
    a41c:	fe078ae3          	beqz	a5,a410 <__mdiff+0x198>
    a420:	00c12083          	lw	ra,12(sp)
    a424:	00812403          	lw	s0,8(sp)
    a428:	01152823          	sw	a7,16(a0)
    a42c:	00412483          	lw	s1,4(sp)
    a430:	00012903          	lw	s2,0(sp)
    a434:	01010113          	addi	sp,sp,16
    a438:	00008067          	ret
    a43c:	00100913          	li	s2,1
    a440:	e806dee3          	bgez	a3,a2dc <__mdiff+0x64>
    a444:	ea9ff06f          	j	a2ec <__mdiff+0x74>
    a448:	00140713          	addi	a4,s0,1
    a44c:	00271713          	slli	a4,a4,0x2
    a450:	f55ff06f          	j	a3a4 <__mdiff+0x12c>
    a454:	00000593          	li	a1,0
    a458:	b80ff0ef          	jal	97d8 <_Balloc>
    a45c:	04050c63          	beqz	a0,a4b4 <__mdiff+0x23c>
    a460:	00c12083          	lw	ra,12(sp)
    a464:	00812403          	lw	s0,8(sp)
    a468:	00100793          	li	a5,1
    a46c:	00f52823          	sw	a5,16(a0)
    a470:	00052a23          	sw	zero,20(a0)
    a474:	00412483          	lw	s1,4(sp)
    a478:	00012903          	lw	s2,0(sp)
    a47c:	01010113          	addi	sp,sp,16
    a480:	00008067          	ret
    a484:	00000713          	li	a4,0
    a488:	000f1663          	bnez	t5,a494 <__mdiff+0x21c>
    a48c:	00e58733          	add	a4,a1,a4
    a490:	f7dff06f          	j	a40c <__mdiff+0x194>
    a494:	00241713          	slli	a4,s0,0x2
    a498:	00e58733          	add	a4,a1,a4
    a49c:	f71ff06f          	j	a40c <__mdiff+0x194>
    a4a0:	53418693          	addi	a3,gp,1332 # 12e44 <keypad_map+0x184>
    a4a4:	00000613          	li	a2,0
    a4a8:	24500593          	li	a1,581
    a4ac:	5c818513          	addi	a0,gp,1480 # 12ed8 <keypad_map+0x218>
    a4b0:	184010ef          	jal	b634 <__assert_func>
    a4b4:	53418693          	addi	a3,gp,1332 # 12e44 <keypad_map+0x184>
    a4b8:	00000613          	li	a2,0
    a4bc:	23700593          	li	a1,567
    a4c0:	5c818513          	addi	a0,gp,1480 # 12ed8 <keypad_map+0x218>
    a4c4:	170010ef          	jal	b634 <__assert_func>

0000a4c8 <__ulp>:
    a4c8:	7ff007b7          	lui	a5,0x7ff00
    a4cc:	00b7f5b3          	and	a1,a5,a1
    a4d0:	fcc007b7          	lui	a5,0xfcc00
    a4d4:	00f585b3          	add	a1,a1,a5
    a4d8:	00000793          	li	a5,0
    a4dc:	00b05663          	blez	a1,a4e8 <__ulp+0x20>
    a4e0:	00078513          	mv	a0,a5
    a4e4:	00008067          	ret
    a4e8:	40b005b3          	neg	a1,a1
    a4ec:	4145d593          	srai	a1,a1,0x14
    a4f0:	01300793          	li	a5,19
    a4f4:	00b7cc63          	blt	a5,a1,a50c <__ulp+0x44>
    a4f8:	000807b7          	lui	a5,0x80
    a4fc:	40b7d5b3          	sra	a1,a5,a1
    a500:	00000793          	li	a5,0
    a504:	00078513          	mv	a0,a5
    a508:	00008067          	ret
    a50c:	fec58593          	addi	a1,a1,-20
    a510:	01e00713          	li	a4,30
    a514:	00100793          	li	a5,1
    a518:	00b74663          	blt	a4,a1,a524 <__ulp+0x5c>
    a51c:	800007b7          	lui	a5,0x80000
    a520:	00b7d7b3          	srl	a5,a5,a1
    a524:	00000593          	li	a1,0
    a528:	00078513          	mv	a0,a5
    a52c:	00008067          	ret

0000a530 <__b2d>:
    a530:	fe010113          	addi	sp,sp,-32
    a534:	00912a23          	sw	s1,20(sp)
    a538:	01052483          	lw	s1,16(a0)
    a53c:	00812c23          	sw	s0,24(sp)
    a540:	01450413          	addi	s0,a0,20
    a544:	00249493          	slli	s1,s1,0x2
    a548:	009404b3          	add	s1,s0,s1
    a54c:	01212823          	sw	s2,16(sp)
    a550:	ffc4a903          	lw	s2,-4(s1)
    a554:	01312623          	sw	s3,12(sp)
    a558:	01412423          	sw	s4,8(sp)
    a55c:	00090513          	mv	a0,s2
    a560:	00058993          	mv	s3,a1
    a564:	00112e23          	sw	ra,28(sp)
    a568:	dbcff0ef          	jal	9b24 <__hi0bits>
    a56c:	02000713          	li	a4,32
    a570:	40a707b3          	sub	a5,a4,a0
    a574:	00f9a023          	sw	a5,0(s3)
    a578:	00a00793          	li	a5,10
    a57c:	ffc48a13          	addi	s4,s1,-4
    a580:	08a7dc63          	bge	a5,a0,a618 <__b2d+0xe8>
    a584:	ff550613          	addi	a2,a0,-11
    a588:	05447063          	bgeu	s0,s4,a5c8 <__b2d+0x98>
    a58c:	ff84a783          	lw	a5,-8(s1)
    a590:	04060c63          	beqz	a2,a5e8 <__b2d+0xb8>
    a594:	40c706b3          	sub	a3,a4,a2
    a598:	00d7d733          	srl	a4,a5,a3
    a59c:	00c91933          	sll	s2,s2,a2
    a5a0:	00e96933          	or	s2,s2,a4
    a5a4:	ff848593          	addi	a1,s1,-8
    a5a8:	3ff00737          	lui	a4,0x3ff00
    a5ac:	00e96733          	or	a4,s2,a4
    a5b0:	00c797b3          	sll	a5,a5,a2
    a5b4:	02b47e63          	bgeu	s0,a1,a5f0 <__b2d+0xc0>
    a5b8:	ff44a603          	lw	a2,-12(s1)
    a5bc:	00d656b3          	srl	a3,a2,a3
    a5c0:	00d7e7b3          	or	a5,a5,a3
    a5c4:	02c0006f          	j	a5f0 <__b2d+0xc0>
    a5c8:	00b00793          	li	a5,11
    a5cc:	00f50c63          	beq	a0,a5,a5e4 <__b2d+0xb4>
    a5d0:	00c91933          	sll	s2,s2,a2
    a5d4:	3ff00737          	lui	a4,0x3ff00
    a5d8:	00e96733          	or	a4,s2,a4
    a5dc:	00000793          	li	a5,0
    a5e0:	0100006f          	j	a5f0 <__b2d+0xc0>
    a5e4:	00000793          	li	a5,0
    a5e8:	3ff00737          	lui	a4,0x3ff00
    a5ec:	00e96733          	or	a4,s2,a4
    a5f0:	01c12083          	lw	ra,28(sp)
    a5f4:	01812403          	lw	s0,24(sp)
    a5f8:	01412483          	lw	s1,20(sp)
    a5fc:	01012903          	lw	s2,16(sp)
    a600:	00c12983          	lw	s3,12(sp)
    a604:	00812a03          	lw	s4,8(sp)
    a608:	00078513          	mv	a0,a5
    a60c:	00070593          	mv	a1,a4
    a610:	02010113          	addi	sp,sp,32
    a614:	00008067          	ret
    a618:	00b00693          	li	a3,11
    a61c:	40a686b3          	sub	a3,a3,a0
    a620:	3ff007b7          	lui	a5,0x3ff00
    a624:	00d95733          	srl	a4,s2,a3
    a628:	00f76733          	or	a4,a4,a5
    a62c:	00000793          	li	a5,0
    a630:	01447663          	bgeu	s0,s4,a63c <__b2d+0x10c>
    a634:	ff84a783          	lw	a5,-8(s1)
    a638:	00d7d7b3          	srl	a5,a5,a3
    a63c:	01550513          	addi	a0,a0,21
    a640:	00a91933          	sll	s2,s2,a0
    a644:	00f967b3          	or	a5,s2,a5
    a648:	fa9ff06f          	j	a5f0 <__b2d+0xc0>

0000a64c <__d2b>:
    a64c:	fd010113          	addi	sp,sp,-48
    a650:	01512a23          	sw	s5,20(sp)
    a654:	00058a93          	mv	s5,a1
    a658:	00100593          	li	a1,1
    a65c:	02912223          	sw	s1,36(sp)
    a660:	01312e23          	sw	s3,28(sp)
    a664:	01412c23          	sw	s4,24(sp)
    a668:	02112623          	sw	ra,44(sp)
    a66c:	02812423          	sw	s0,40(sp)
    a670:	03212023          	sw	s2,32(sp)
    a674:	00060493          	mv	s1,a2
    a678:	00068a13          	mv	s4,a3
    a67c:	00070993          	mv	s3,a4
    a680:	958ff0ef          	jal	97d8 <_Balloc>
    a684:	10050263          	beqz	a0,a788 <__d2b+0x13c>
    a688:	00100737          	lui	a4,0x100
    a68c:	0144d913          	srli	s2,s1,0x14
    a690:	fff70793          	addi	a5,a4,-1 # fffff <_memory_end+0xdffff>
    a694:	7ff97913          	andi	s2,s2,2047
    a698:	00050413          	mv	s0,a0
    a69c:	0097f7b3          	and	a5,a5,s1
    a6a0:	00090463          	beqz	s2,a6a8 <__d2b+0x5c>
    a6a4:	00e7e7b3          	or	a5,a5,a4
    a6a8:	00f12623          	sw	a5,12(sp)
    a6ac:	060a9263          	bnez	s5,a710 <__d2b+0xc4>
    a6b0:	00c10513          	addi	a0,sp,12
    a6b4:	ce8ff0ef          	jal	9b9c <__lo0bits>
    a6b8:	00c12703          	lw	a4,12(sp)
    a6bc:	00100493          	li	s1,1
    a6c0:	00942823          	sw	s1,16(s0)
    a6c4:	00e42a23          	sw	a4,20(s0)
    a6c8:	02050793          	addi	a5,a0,32
    a6cc:	08090863          	beqz	s2,a75c <__d2b+0x110>
    a6d0:	bcd90913          	addi	s2,s2,-1075
    a6d4:	00f90933          	add	s2,s2,a5
    a6d8:	03500493          	li	s1,53
    a6dc:	012a2023          	sw	s2,0(s4)
    a6e0:	40f48533          	sub	a0,s1,a5
    a6e4:	00a9a023          	sw	a0,0(s3)
    a6e8:	02c12083          	lw	ra,44(sp)
    a6ec:	00040513          	mv	a0,s0
    a6f0:	02812403          	lw	s0,40(sp)
    a6f4:	02412483          	lw	s1,36(sp)
    a6f8:	02012903          	lw	s2,32(sp)
    a6fc:	01c12983          	lw	s3,28(sp)
    a700:	01812a03          	lw	s4,24(sp)
    a704:	01412a83          	lw	s5,20(sp)
    a708:	03010113          	addi	sp,sp,48
    a70c:	00008067          	ret
    a710:	00810513          	addi	a0,sp,8
    a714:	01512423          	sw	s5,8(sp)
    a718:	c84ff0ef          	jal	9b9c <__lo0bits>
    a71c:	00c12703          	lw	a4,12(sp)
    a720:	00050793          	mv	a5,a0
    a724:	04050e63          	beqz	a0,a780 <__d2b+0x134>
    a728:	00812603          	lw	a2,8(sp)
    a72c:	02000693          	li	a3,32
    a730:	40a686b3          	sub	a3,a3,a0
    a734:	00d716b3          	sll	a3,a4,a3
    a738:	00a75733          	srl	a4,a4,a0
    a73c:	00c6e6b3          	or	a3,a3,a2
    a740:	00e12623          	sw	a4,12(sp)
    a744:	00e034b3          	snez	s1,a4
    a748:	00148493          	addi	s1,s1,1
    a74c:	00d42a23          	sw	a3,20(s0)
    a750:	00e42c23          	sw	a4,24(s0)
    a754:	00942823          	sw	s1,16(s0)
    a758:	f6091ce3          	bnez	s2,a6d0 <__d2b+0x84>
    a75c:	00249713          	slli	a4,s1,0x2
    a760:	00e40733          	add	a4,s0,a4
    a764:	01072503          	lw	a0,16(a4)
    a768:	bce78793          	addi	a5,a5,-1074 # 3feffbce <_memory_end+0x3fedfbce>
    a76c:	00fa2023          	sw	a5,0(s4)
    a770:	bb4ff0ef          	jal	9b24 <__hi0bits>
    a774:	00549493          	slli	s1,s1,0x5
    a778:	40a48533          	sub	a0,s1,a0
    a77c:	f69ff06f          	j	a6e4 <__d2b+0x98>
    a780:	00812683          	lw	a3,8(sp)
    a784:	fc1ff06f          	j	a744 <__d2b+0xf8>
    a788:	53418693          	addi	a3,gp,1332 # 12e44 <keypad_map+0x184>
    a78c:	00000613          	li	a2,0
    a790:	30f00593          	li	a1,783
    a794:	5c818513          	addi	a0,gp,1480 # 12ed8 <keypad_map+0x218>
    a798:	69d000ef          	jal	b634 <__assert_func>

0000a79c <__ratio>:
    a79c:	fd010113          	addi	sp,sp,-48
    a7a0:	03212023          	sw	s2,32(sp)
    a7a4:	00058913          	mv	s2,a1
    a7a8:	00810593          	addi	a1,sp,8
    a7ac:	02112623          	sw	ra,44(sp)
    a7b0:	02812423          	sw	s0,40(sp)
    a7b4:	02912223          	sw	s1,36(sp)
    a7b8:	01312e23          	sw	s3,28(sp)
    a7bc:	00050993          	mv	s3,a0
    a7c0:	d71ff0ef          	jal	a530 <__b2d>
    a7c4:	00050493          	mv	s1,a0
    a7c8:	00058413          	mv	s0,a1
    a7cc:	00090513          	mv	a0,s2
    a7d0:	00c10593          	addi	a1,sp,12
    a7d4:	d5dff0ef          	jal	a530 <__b2d>
    a7d8:	01092703          	lw	a4,16(s2)
    a7dc:	0109a783          	lw	a5,16(s3)
    a7e0:	00c12683          	lw	a3,12(sp)
    a7e4:	40e787b3          	sub	a5,a5,a4
    a7e8:	00812703          	lw	a4,8(sp)
    a7ec:	00579793          	slli	a5,a5,0x5
    a7f0:	40d70733          	sub	a4,a4,a3
    a7f4:	00e787b3          	add	a5,a5,a4
    a7f8:	00050713          	mv	a4,a0
    a7fc:	02f05e63          	blez	a5,a838 <__ratio+0x9c>
    a800:	01479793          	slli	a5,a5,0x14
    a804:	00878433          	add	s0,a5,s0
    a808:	00058693          	mv	a3,a1
    a80c:	00048513          	mv	a0,s1
    a810:	00040593          	mv	a1,s0
    a814:	00070613          	mv	a2,a4
    a818:	054030ef          	jal	d86c <__divdf3>
    a81c:	02c12083          	lw	ra,44(sp)
    a820:	02812403          	lw	s0,40(sp)
    a824:	02412483          	lw	s1,36(sp)
    a828:	02012903          	lw	s2,32(sp)
    a82c:	01c12983          	lw	s3,28(sp)
    a830:	03010113          	addi	sp,sp,48
    a834:	00008067          	ret
    a838:	01479793          	slli	a5,a5,0x14
    a83c:	40f585b3          	sub	a1,a1,a5
    a840:	fc9ff06f          	j	a808 <__ratio+0x6c>

0000a844 <_mprec_log10>:
    a844:	ff010113          	addi	sp,sp,-16
    a848:	01212023          	sw	s2,0(sp)
    a84c:	00112623          	sw	ra,12(sp)
    a850:	01700793          	li	a5,23
    a854:	00050913          	mv	s2,a0
    a858:	04a7de63          	bge	a5,a0,a8b4 <_mprec_log10+0x70>
    a85c:	00013737          	lui	a4,0x13
    a860:	70072783          	lw	a5,1792(a4) # 13700 <__clz_tab+0x134>
    a864:	70472583          	lw	a1,1796(a4)
    a868:	00013737          	lui	a4,0x13
    a86c:	00812423          	sw	s0,8(sp)
    a870:	00912223          	sw	s1,4(sp)
    a874:	70872403          	lw	s0,1800(a4) # 13708 <__clz_tab+0x13c>
    a878:	70c72483          	lw	s1,1804(a4)
    a87c:	00078513          	mv	a0,a5
    a880:	00040613          	mv	a2,s0
    a884:	00048693          	mv	a3,s1
    a888:	105030ef          	jal	e18c <__muldf3>
    a88c:	fff90913          	addi	s2,s2,-1
    a890:	00050793          	mv	a5,a0
    a894:	fe0914e3          	bnez	s2,a87c <_mprec_log10+0x38>
    a898:	00812403          	lw	s0,8(sp)
    a89c:	00c12083          	lw	ra,12(sp)
    a8a0:	00412483          	lw	s1,4(sp)
    a8a4:	00012903          	lw	s2,0(sp)
    a8a8:	00078513          	mv	a0,a5
    a8ac:	01010113          	addi	sp,sp,16
    a8b0:	00008067          	ret
    a8b4:	00013737          	lui	a4,0x13
    a8b8:	00351913          	slli	s2,a0,0x3
    a8bc:	23870713          	addi	a4,a4,568 # 13238 <__mprec_tens>
    a8c0:	01270733          	add	a4,a4,s2
    a8c4:	00072783          	lw	a5,0(a4)
    a8c8:	00c12083          	lw	ra,12(sp)
    a8cc:	00472583          	lw	a1,4(a4)
    a8d0:	00012903          	lw	s2,0(sp)
    a8d4:	00078513          	mv	a0,a5
    a8d8:	01010113          	addi	sp,sp,16
    a8dc:	00008067          	ret

0000a8e0 <__copybits>:
    a8e0:	01062683          	lw	a3,16(a2)
    a8e4:	fff58593          	addi	a1,a1,-1
    a8e8:	4055d593          	srai	a1,a1,0x5
    a8ec:	00158593          	addi	a1,a1,1
    a8f0:	01460793          	addi	a5,a2,20
    a8f4:	00269693          	slli	a3,a3,0x2
    a8f8:	00259593          	slli	a1,a1,0x2
    a8fc:	00d786b3          	add	a3,a5,a3
    a900:	00b505b3          	add	a1,a0,a1
    a904:	02d7f863          	bgeu	a5,a3,a934 <__copybits+0x54>
    a908:	00050713          	mv	a4,a0
    a90c:	0007a803          	lw	a6,0(a5)
    a910:	00478793          	addi	a5,a5,4
    a914:	00470713          	addi	a4,a4,4
    a918:	ff072e23          	sw	a6,-4(a4)
    a91c:	fed7e8e3          	bltu	a5,a3,a90c <__copybits+0x2c>
    a920:	40c687b3          	sub	a5,a3,a2
    a924:	feb78793          	addi	a5,a5,-21
    a928:	ffc7f793          	andi	a5,a5,-4
    a92c:	00478793          	addi	a5,a5,4
    a930:	00f50533          	add	a0,a0,a5
    a934:	00b57863          	bgeu	a0,a1,a944 <__copybits+0x64>
    a938:	00450513          	addi	a0,a0,4
    a93c:	fe052e23          	sw	zero,-4(a0)
    a940:	feb56ce3          	bltu	a0,a1,a938 <__copybits+0x58>
    a944:	00008067          	ret

0000a948 <__any_on>:
    a948:	01052703          	lw	a4,16(a0)
    a94c:	4055d613          	srai	a2,a1,0x5
    a950:	01450693          	addi	a3,a0,20
    a954:	02c75263          	bge	a4,a2,a978 <__any_on+0x30>
    a958:	00271713          	slli	a4,a4,0x2
    a95c:	00e687b3          	add	a5,a3,a4
    a960:	04f6f263          	bgeu	a3,a5,a9a4 <__any_on+0x5c>
    a964:	ffc7a703          	lw	a4,-4(a5)
    a968:	ffc78793          	addi	a5,a5,-4
    a96c:	fe070ae3          	beqz	a4,a960 <__any_on+0x18>
    a970:	00100513          	li	a0,1
    a974:	00008067          	ret
    a978:	00261793          	slli	a5,a2,0x2
    a97c:	00f687b3          	add	a5,a3,a5
    a980:	fee650e3          	bge	a2,a4,a960 <__any_on+0x18>
    a984:	01f5f593          	andi	a1,a1,31
    a988:	fc058ce3          	beqz	a1,a960 <__any_on+0x18>
    a98c:	0007a603          	lw	a2,0(a5)
    a990:	00100513          	li	a0,1
    a994:	00b65733          	srl	a4,a2,a1
    a998:	00b71733          	sll	a4,a4,a1
    a99c:	fce602e3          	beq	a2,a4,a960 <__any_on+0x18>
    a9a0:	00008067          	ret
    a9a4:	00000513          	li	a0,0
    a9a8:	00008067          	ret

0000a9ac <_realloc_r>:
    a9ac:	fd010113          	addi	sp,sp,-48
    a9b0:	02912223          	sw	s1,36(sp)
    a9b4:	02112623          	sw	ra,44(sp)
    a9b8:	00060493          	mv	s1,a2
    a9bc:	1e058863          	beqz	a1,abac <_realloc_r+0x200>
    a9c0:	02812423          	sw	s0,40(sp)
    a9c4:	03212023          	sw	s2,32(sp)
    a9c8:	00058413          	mv	s0,a1
    a9cc:	01312e23          	sw	s3,28(sp)
    a9d0:	01512a23          	sw	s5,20(sp)
    a9d4:	01412c23          	sw	s4,24(sp)
    a9d8:	00050913          	mv	s2,a0
    a9dc:	df5fe0ef          	jal	97d0 <__malloc_lock>
    a9e0:	ffc42703          	lw	a4,-4(s0)
    a9e4:	00b48793          	addi	a5,s1,11
    a9e8:	01600693          	li	a3,22
    a9ec:	ff840a93          	addi	s5,s0,-8
    a9f0:	ffc77993          	andi	s3,a4,-4
    a9f4:	10f6f263          	bgeu	a3,a5,aaf8 <_realloc_r+0x14c>
    a9f8:	ff87fa13          	andi	s4,a5,-8
    a9fc:	1007c263          	bltz	a5,ab00 <_realloc_r+0x154>
    aa00:	109a6063          	bltu	s4,s1,ab00 <_realloc_r+0x154>
    aa04:	1349d263          	bge	s3,s4,ab28 <_realloc_r+0x17c>
    aa08:	000147b7          	lui	a5,0x14
    aa0c:	01812423          	sw	s8,8(sp)
    aa10:	86c78c13          	addi	s8,a5,-1940 # 1386c <__malloc_av_>
    aa14:	008c2603          	lw	a2,8(s8)
    aa18:	013a86b3          	add	a3,s5,s3
    aa1c:	0046a783          	lw	a5,4(a3)
    aa20:	1cd60863          	beq	a2,a3,abf0 <_realloc_r+0x244>
    aa24:	ffe7f613          	andi	a2,a5,-2
    aa28:	00c68633          	add	a2,a3,a2
    aa2c:	00462603          	lw	a2,4(a2)
    aa30:	00167613          	andi	a2,a2,1
    aa34:	14061a63          	bnez	a2,ab88 <_realloc_r+0x1dc>
    aa38:	ffc7f793          	andi	a5,a5,-4
    aa3c:	00f98633          	add	a2,s3,a5
    aa40:	0d465863          	bge	a2,s4,ab10 <_realloc_r+0x164>
    aa44:	00177713          	andi	a4,a4,1
    aa48:	02071c63          	bnez	a4,aa80 <_realloc_r+0xd4>
    aa4c:	01712623          	sw	s7,12(sp)
    aa50:	ff842b83          	lw	s7,-8(s0)
    aa54:	01612823          	sw	s6,16(sp)
    aa58:	417a8bb3          	sub	s7,s5,s7
    aa5c:	004ba703          	lw	a4,4(s7)
    aa60:	ffc77713          	andi	a4,a4,-4
    aa64:	00e787b3          	add	a5,a5,a4
    aa68:	01378b33          	add	s6,a5,s3
    aa6c:	334b5c63          	bge	s6,s4,ada4 <_realloc_r+0x3f8>
    aa70:	00e98b33          	add	s6,s3,a4
    aa74:	294b5863          	bge	s6,s4,ad04 <_realloc_r+0x358>
    aa78:	01012b03          	lw	s6,16(sp)
    aa7c:	00c12b83          	lw	s7,12(sp)
    aa80:	00048593          	mv	a1,s1
    aa84:	00090513          	mv	a0,s2
    aa88:	d74fe0ef          	jal	8ffc <_malloc_r>
    aa8c:	00050493          	mv	s1,a0
    aa90:	40050863          	beqz	a0,aea0 <_realloc_r+0x4f4>
    aa94:	ffc42783          	lw	a5,-4(s0)
    aa98:	ff850713          	addi	a4,a0,-8
    aa9c:	ffe7f793          	andi	a5,a5,-2
    aaa0:	00fa87b3          	add	a5,s5,a5
    aaa4:	24e78663          	beq	a5,a4,acf0 <_realloc_r+0x344>
    aaa8:	ffc98613          	addi	a2,s3,-4
    aaac:	02400793          	li	a5,36
    aab0:	2ec7e463          	bltu	a5,a2,ad98 <_realloc_r+0x3ec>
    aab4:	01300713          	li	a4,19
    aab8:	20c76a63          	bltu	a4,a2,accc <_realloc_r+0x320>
    aabc:	00050793          	mv	a5,a0
    aac0:	00040713          	mv	a4,s0
    aac4:	00072683          	lw	a3,0(a4)
    aac8:	00d7a023          	sw	a3,0(a5)
    aacc:	00472683          	lw	a3,4(a4)
    aad0:	00d7a223          	sw	a3,4(a5)
    aad4:	00872703          	lw	a4,8(a4)
    aad8:	00e7a423          	sw	a4,8(a5)
    aadc:	00040593          	mv	a1,s0
    aae0:	00090513          	mv	a0,s2
    aae4:	e01fb0ef          	jal	68e4 <_free_r>
    aae8:	00090513          	mv	a0,s2
    aaec:	ce9fe0ef          	jal	97d4 <__malloc_unlock>
    aaf0:	00812c03          	lw	s8,8(sp)
    aaf4:	06c0006f          	j	ab60 <_realloc_r+0x1b4>
    aaf8:	01000a13          	li	s4,16
    aafc:	f09a74e3          	bgeu	s4,s1,aa04 <_realloc_r+0x58>
    ab00:	00c00793          	li	a5,12
    ab04:	00f92023          	sw	a5,0(s2)
    ab08:	00000493          	li	s1,0
    ab0c:	0540006f          	j	ab60 <_realloc_r+0x1b4>
    ab10:	00c6a783          	lw	a5,12(a3)
    ab14:	0086a703          	lw	a4,8(a3)
    ab18:	00812c03          	lw	s8,8(sp)
    ab1c:	00060993          	mv	s3,a2
    ab20:	00f72623          	sw	a5,12(a4)
    ab24:	00e7a423          	sw	a4,8(a5)
    ab28:	004aa783          	lw	a5,4(s5)
    ab2c:	414986b3          	sub	a3,s3,s4
    ab30:	00f00613          	li	a2,15
    ab34:	0017f793          	andi	a5,a5,1
    ab38:	013a8733          	add	a4,s5,s3
    ab3c:	08d66263          	bltu	a2,a3,abc0 <_realloc_r+0x214>
    ab40:	0137e7b3          	or	a5,a5,s3
    ab44:	00faa223          	sw	a5,4(s5)
    ab48:	00472783          	lw	a5,4(a4)
    ab4c:	0017e793          	ori	a5,a5,1
    ab50:	00f72223          	sw	a5,4(a4)
    ab54:	00090513          	mv	a0,s2
    ab58:	c7dfe0ef          	jal	97d4 <__malloc_unlock>
    ab5c:	00040493          	mv	s1,s0
    ab60:	02812403          	lw	s0,40(sp)
    ab64:	02c12083          	lw	ra,44(sp)
    ab68:	02012903          	lw	s2,32(sp)
    ab6c:	01c12983          	lw	s3,28(sp)
    ab70:	01812a03          	lw	s4,24(sp)
    ab74:	01412a83          	lw	s5,20(sp)
    ab78:	00048513          	mv	a0,s1
    ab7c:	02412483          	lw	s1,36(sp)
    ab80:	03010113          	addi	sp,sp,48
    ab84:	00008067          	ret
    ab88:	00177713          	andi	a4,a4,1
    ab8c:	ee071ae3          	bnez	a4,aa80 <_realloc_r+0xd4>
    ab90:	01712623          	sw	s7,12(sp)
    ab94:	ff842b83          	lw	s7,-8(s0)
    ab98:	01612823          	sw	s6,16(sp)
    ab9c:	417a8bb3          	sub	s7,s5,s7
    aba0:	004ba703          	lw	a4,4(s7)
    aba4:	ffc77713          	andi	a4,a4,-4
    aba8:	ec9ff06f          	j	aa70 <_realloc_r+0xc4>
    abac:	02c12083          	lw	ra,44(sp)
    abb0:	02412483          	lw	s1,36(sp)
    abb4:	00060593          	mv	a1,a2
    abb8:	03010113          	addi	sp,sp,48
    abbc:	c40fe06f          	j	8ffc <_malloc_r>
    abc0:	0147e7b3          	or	a5,a5,s4
    abc4:	00faa223          	sw	a5,4(s5)
    abc8:	014a85b3          	add	a1,s5,s4
    abcc:	0016e693          	ori	a3,a3,1
    abd0:	00d5a223          	sw	a3,4(a1)
    abd4:	00472783          	lw	a5,4(a4)
    abd8:	00858593          	addi	a1,a1,8
    abdc:	00090513          	mv	a0,s2
    abe0:	0017e793          	ori	a5,a5,1
    abe4:	00f72223          	sw	a5,4(a4)
    abe8:	cfdfb0ef          	jal	68e4 <_free_r>
    abec:	f69ff06f          	j	ab54 <_realloc_r+0x1a8>
    abf0:	ffc7f793          	andi	a5,a5,-4
    abf4:	013786b3          	add	a3,a5,s3
    abf8:	010a0613          	addi	a2,s4,16
    abfc:	26c6d063          	bge	a3,a2,ae5c <_realloc_r+0x4b0>
    ac00:	00177713          	andi	a4,a4,1
    ac04:	e6071ee3          	bnez	a4,aa80 <_realloc_r+0xd4>
    ac08:	01712623          	sw	s7,12(sp)
    ac0c:	ff842b83          	lw	s7,-8(s0)
    ac10:	01612823          	sw	s6,16(sp)
    ac14:	417a8bb3          	sub	s7,s5,s7
    ac18:	004ba703          	lw	a4,4(s7)
    ac1c:	ffc77713          	andi	a4,a4,-4
    ac20:	00e787b3          	add	a5,a5,a4
    ac24:	01378b33          	add	s6,a5,s3
    ac28:	e4cb44e3          	blt	s6,a2,aa70 <_realloc_r+0xc4>
    ac2c:	00cba783          	lw	a5,12(s7)
    ac30:	008ba703          	lw	a4,8(s7)
    ac34:	ffc98613          	addi	a2,s3,-4
    ac38:	02400693          	li	a3,36
    ac3c:	00f72623          	sw	a5,12(a4)
    ac40:	00e7a423          	sw	a4,8(a5)
    ac44:	008b8493          	addi	s1,s7,8
    ac48:	28c6e463          	bltu	a3,a2,aed0 <_realloc_r+0x524>
    ac4c:	01300713          	li	a4,19
    ac50:	00048793          	mv	a5,s1
    ac54:	02c77263          	bgeu	a4,a2,ac78 <_realloc_r+0x2cc>
    ac58:	00042703          	lw	a4,0(s0)
    ac5c:	01b00793          	li	a5,27
    ac60:	00eba423          	sw	a4,8(s7)
    ac64:	00442703          	lw	a4,4(s0)
    ac68:	00eba623          	sw	a4,12(s7)
    ac6c:	26c7ea63          	bltu	a5,a2,aee0 <_realloc_r+0x534>
    ac70:	00840413          	addi	s0,s0,8
    ac74:	010b8793          	addi	a5,s7,16
    ac78:	00042703          	lw	a4,0(s0)
    ac7c:	00e7a023          	sw	a4,0(a5)
    ac80:	00442703          	lw	a4,4(s0)
    ac84:	00e7a223          	sw	a4,4(a5)
    ac88:	00842703          	lw	a4,8(s0)
    ac8c:	00e7a423          	sw	a4,8(a5)
    ac90:	014b8733          	add	a4,s7,s4
    ac94:	414b0b33          	sub	s6,s6,s4
    ac98:	00ec2423          	sw	a4,8(s8)
    ac9c:	001b6793          	ori	a5,s6,1
    aca0:	00f72223          	sw	a5,4(a4)
    aca4:	004ba783          	lw	a5,4(s7)
    aca8:	00090513          	mv	a0,s2
    acac:	0017f793          	andi	a5,a5,1
    acb0:	0147e7b3          	or	a5,a5,s4
    acb4:	00fba223          	sw	a5,4(s7)
    acb8:	b1dfe0ef          	jal	97d4 <__malloc_unlock>
    acbc:	01012b03          	lw	s6,16(sp)
    acc0:	00c12b83          	lw	s7,12(sp)
    acc4:	00812c03          	lw	s8,8(sp)
    acc8:	e99ff06f          	j	ab60 <_realloc_r+0x1b4>
    accc:	00042683          	lw	a3,0(s0)
    acd0:	01b00713          	li	a4,27
    acd4:	00d52023          	sw	a3,0(a0)
    acd8:	00442683          	lw	a3,4(s0)
    acdc:	00d52223          	sw	a3,4(a0)
    ace0:	14c76e63          	bltu	a4,a2,ae3c <_realloc_r+0x490>
    ace4:	00840713          	addi	a4,s0,8
    ace8:	00850793          	addi	a5,a0,8
    acec:	dd9ff06f          	j	aac4 <_realloc_r+0x118>
    acf0:	ffc52783          	lw	a5,-4(a0)
    acf4:	00812c03          	lw	s8,8(sp)
    acf8:	ffc7f793          	andi	a5,a5,-4
    acfc:	00f989b3          	add	s3,s3,a5
    ad00:	e29ff06f          	j	ab28 <_realloc_r+0x17c>
    ad04:	00cba783          	lw	a5,12(s7)
    ad08:	008ba703          	lw	a4,8(s7)
    ad0c:	ffc98613          	addi	a2,s3,-4
    ad10:	02400693          	li	a3,36
    ad14:	00f72623          	sw	a5,12(a4)
    ad18:	00e7a423          	sw	a4,8(a5)
    ad1c:	008b8493          	addi	s1,s7,8
    ad20:	10c6e663          	bltu	a3,a2,ae2c <_realloc_r+0x480>
    ad24:	01300713          	li	a4,19
    ad28:	00048793          	mv	a5,s1
    ad2c:	02c77c63          	bgeu	a4,a2,ad64 <_realloc_r+0x3b8>
    ad30:	00042703          	lw	a4,0(s0)
    ad34:	01b00793          	li	a5,27
    ad38:	00eba423          	sw	a4,8(s7)
    ad3c:	00442703          	lw	a4,4(s0)
    ad40:	00eba623          	sw	a4,12(s7)
    ad44:	14c7f863          	bgeu	a5,a2,ae94 <_realloc_r+0x4e8>
    ad48:	00842783          	lw	a5,8(s0)
    ad4c:	00fba823          	sw	a5,16(s7)
    ad50:	00c42783          	lw	a5,12(s0)
    ad54:	00fbaa23          	sw	a5,20(s7)
    ad58:	0ad60c63          	beq	a2,a3,ae10 <_realloc_r+0x464>
    ad5c:	01040413          	addi	s0,s0,16
    ad60:	018b8793          	addi	a5,s7,24
    ad64:	00042703          	lw	a4,0(s0)
    ad68:	00e7a023          	sw	a4,0(a5)
    ad6c:	00442703          	lw	a4,4(s0)
    ad70:	00e7a223          	sw	a4,4(a5)
    ad74:	00842703          	lw	a4,8(s0)
    ad78:	00e7a423          	sw	a4,8(a5)
    ad7c:	000b0993          	mv	s3,s6
    ad80:	000b8a93          	mv	s5,s7
    ad84:	01012b03          	lw	s6,16(sp)
    ad88:	00c12b83          	lw	s7,12(sp)
    ad8c:	00812c03          	lw	s8,8(sp)
    ad90:	00048413          	mv	s0,s1
    ad94:	d95ff06f          	j	ab28 <_realloc_r+0x17c>
    ad98:	00040593          	mv	a1,s0
    ad9c:	c68fb0ef          	jal	6204 <memmove>
    ada0:	d3dff06f          	j	aadc <_realloc_r+0x130>
    ada4:	00c6a783          	lw	a5,12(a3)
    ada8:	0086a703          	lw	a4,8(a3)
    adac:	ffc98613          	addi	a2,s3,-4
    adb0:	02400693          	li	a3,36
    adb4:	00f72623          	sw	a5,12(a4)
    adb8:	00e7a423          	sw	a4,8(a5)
    adbc:	008ba703          	lw	a4,8(s7)
    adc0:	00cba783          	lw	a5,12(s7)
    adc4:	008b8493          	addi	s1,s7,8
    adc8:	00f72623          	sw	a5,12(a4)
    adcc:	00e7a423          	sw	a4,8(a5)
    add0:	04c6ee63          	bltu	a3,a2,ae2c <_realloc_r+0x480>
    add4:	01300713          	li	a4,19
    add8:	00048793          	mv	a5,s1
    addc:	f8c774e3          	bgeu	a4,a2,ad64 <_realloc_r+0x3b8>
    ade0:	00042703          	lw	a4,0(s0)
    ade4:	01b00793          	li	a5,27
    ade8:	00eba423          	sw	a4,8(s7)
    adec:	00442703          	lw	a4,4(s0)
    adf0:	00eba623          	sw	a4,12(s7)
    adf4:	0ac7f063          	bgeu	a5,a2,ae94 <_realloc_r+0x4e8>
    adf8:	00842703          	lw	a4,8(s0)
    adfc:	02400793          	li	a5,36
    ae00:	00eba823          	sw	a4,16(s7)
    ae04:	00c42703          	lw	a4,12(s0)
    ae08:	00ebaa23          	sw	a4,20(s7)
    ae0c:	f4f618e3          	bne	a2,a5,ad5c <_realloc_r+0x3b0>
    ae10:	01042703          	lw	a4,16(s0)
    ae14:	020b8793          	addi	a5,s7,32
    ae18:	01840413          	addi	s0,s0,24
    ae1c:	00ebac23          	sw	a4,24(s7)
    ae20:	ffc42703          	lw	a4,-4(s0)
    ae24:	00ebae23          	sw	a4,28(s7)
    ae28:	f3dff06f          	j	ad64 <_realloc_r+0x3b8>
    ae2c:	00040593          	mv	a1,s0
    ae30:	00048513          	mv	a0,s1
    ae34:	bd0fb0ef          	jal	6204 <memmove>
    ae38:	f45ff06f          	j	ad7c <_realloc_r+0x3d0>
    ae3c:	00842703          	lw	a4,8(s0)
    ae40:	00e52423          	sw	a4,8(a0)
    ae44:	00c42703          	lw	a4,12(s0)
    ae48:	00e52623          	sw	a4,12(a0)
    ae4c:	06f60463          	beq	a2,a5,aeb4 <_realloc_r+0x508>
    ae50:	01040713          	addi	a4,s0,16
    ae54:	01050793          	addi	a5,a0,16
    ae58:	c6dff06f          	j	aac4 <_realloc_r+0x118>
    ae5c:	014a8ab3          	add	s5,s5,s4
    ae60:	414686b3          	sub	a3,a3,s4
    ae64:	015c2423          	sw	s5,8(s8)
    ae68:	0016e793          	ori	a5,a3,1
    ae6c:	00faa223          	sw	a5,4(s5)
    ae70:	ffc42783          	lw	a5,-4(s0)
    ae74:	00090513          	mv	a0,s2
    ae78:	00040493          	mv	s1,s0
    ae7c:	0017f793          	andi	a5,a5,1
    ae80:	0147e7b3          	or	a5,a5,s4
    ae84:	fef42e23          	sw	a5,-4(s0)
    ae88:	94dfe0ef          	jal	97d4 <__malloc_unlock>
    ae8c:	00812c03          	lw	s8,8(sp)
    ae90:	cd1ff06f          	j	ab60 <_realloc_r+0x1b4>
    ae94:	00840413          	addi	s0,s0,8
    ae98:	010b8793          	addi	a5,s7,16
    ae9c:	ec9ff06f          	j	ad64 <_realloc_r+0x3b8>
    aea0:	00090513          	mv	a0,s2
    aea4:	931fe0ef          	jal	97d4 <__malloc_unlock>
    aea8:	00000493          	li	s1,0
    aeac:	00812c03          	lw	s8,8(sp)
    aeb0:	cb1ff06f          	j	ab60 <_realloc_r+0x1b4>
    aeb4:	01042683          	lw	a3,16(s0)
    aeb8:	01840713          	addi	a4,s0,24
    aebc:	01850793          	addi	a5,a0,24
    aec0:	00d52823          	sw	a3,16(a0)
    aec4:	01442683          	lw	a3,20(s0)
    aec8:	00d52a23          	sw	a3,20(a0)
    aecc:	bf9ff06f          	j	aac4 <_realloc_r+0x118>
    aed0:	00040593          	mv	a1,s0
    aed4:	00048513          	mv	a0,s1
    aed8:	b2cfb0ef          	jal	6204 <memmove>
    aedc:	db5ff06f          	j	ac90 <_realloc_r+0x2e4>
    aee0:	00842783          	lw	a5,8(s0)
    aee4:	00fba823          	sw	a5,16(s7)
    aee8:	00c42783          	lw	a5,12(s0)
    aeec:	00fbaa23          	sw	a5,20(s7)
    aef0:	00d60863          	beq	a2,a3,af00 <_realloc_r+0x554>
    aef4:	01040413          	addi	s0,s0,16
    aef8:	018b8793          	addi	a5,s7,24
    aefc:	d7dff06f          	j	ac78 <_realloc_r+0x2cc>
    af00:	01042703          	lw	a4,16(s0)
    af04:	020b8793          	addi	a5,s7,32
    af08:	01840413          	addi	s0,s0,24
    af0c:	00ebac23          	sw	a4,24(s7)
    af10:	ffc42703          	lw	a4,-4(s0)
    af14:	00ebae23          	sw	a4,28(s7)
    af18:	d61ff06f          	j	ac78 <_realloc_r+0x2cc>

0000af1c <_fclose_r>:
    af1c:	ff010113          	addi	sp,sp,-16
    af20:	00112623          	sw	ra,12(sp)
    af24:	01212023          	sw	s2,0(sp)
    af28:	02058863          	beqz	a1,af58 <_fclose_r+0x3c>
    af2c:	00812423          	sw	s0,8(sp)
    af30:	00912223          	sw	s1,4(sp)
    af34:	00058413          	mv	s0,a1
    af38:	00050493          	mv	s1,a0
    af3c:	00050663          	beqz	a0,af48 <_fclose_r+0x2c>
    af40:	03452783          	lw	a5,52(a0)
    af44:	0c078c63          	beqz	a5,b01c <_fclose_r+0x100>
    af48:	00c41783          	lh	a5,12(s0)
    af4c:	02079263          	bnez	a5,af70 <_fclose_r+0x54>
    af50:	00812403          	lw	s0,8(sp)
    af54:	00412483          	lw	s1,4(sp)
    af58:	00c12083          	lw	ra,12(sp)
    af5c:	00000913          	li	s2,0
    af60:	00090513          	mv	a0,s2
    af64:	00012903          	lw	s2,0(sp)
    af68:	01010113          	addi	sp,sp,16
    af6c:	00008067          	ret
    af70:	00040593          	mv	a1,s0
    af74:	00048513          	mv	a0,s1
    af78:	f31f90ef          	jal	4ea8 <__sflush_r>
    af7c:	02c42783          	lw	a5,44(s0)
    af80:	00050913          	mv	s2,a0
    af84:	00078a63          	beqz	a5,af98 <_fclose_r+0x7c>
    af88:	01c42583          	lw	a1,28(s0)
    af8c:	00048513          	mv	a0,s1
    af90:	000780e7          	jalr	a5
    af94:	06054463          	bltz	a0,affc <_fclose_r+0xe0>
    af98:	00c45783          	lhu	a5,12(s0)
    af9c:	0807f793          	andi	a5,a5,128
    afa0:	06079663          	bnez	a5,b00c <_fclose_r+0xf0>
    afa4:	03042583          	lw	a1,48(s0)
    afa8:	00058c63          	beqz	a1,afc0 <_fclose_r+0xa4>
    afac:	04040793          	addi	a5,s0,64
    afb0:	00f58663          	beq	a1,a5,afbc <_fclose_r+0xa0>
    afb4:	00048513          	mv	a0,s1
    afb8:	92dfb0ef          	jal	68e4 <_free_r>
    afbc:	02042823          	sw	zero,48(s0)
    afc0:	04442583          	lw	a1,68(s0)
    afc4:	00058863          	beqz	a1,afd4 <_fclose_r+0xb8>
    afc8:	00048513          	mv	a0,s1
    afcc:	919fb0ef          	jal	68e4 <_free_r>
    afd0:	04042223          	sw	zero,68(s0)
    afd4:	d68fa0ef          	jal	553c <__sfp_lock_acquire>
    afd8:	00041623          	sh	zero,12(s0)
    afdc:	d64fa0ef          	jal	5540 <__sfp_lock_release>
    afe0:	00c12083          	lw	ra,12(sp)
    afe4:	00812403          	lw	s0,8(sp)
    afe8:	00412483          	lw	s1,4(sp)
    afec:	00090513          	mv	a0,s2
    aff0:	00012903          	lw	s2,0(sp)
    aff4:	01010113          	addi	sp,sp,16
    aff8:	00008067          	ret
    affc:	00c45783          	lhu	a5,12(s0)
    b000:	fff00913          	li	s2,-1
    b004:	0807f793          	andi	a5,a5,128
    b008:	f8078ee3          	beqz	a5,afa4 <_fclose_r+0x88>
    b00c:	01042583          	lw	a1,16(s0)
    b010:	00048513          	mv	a0,s1
    b014:	8d1fb0ef          	jal	68e4 <_free_r>
    b018:	f8dff06f          	j	afa4 <_fclose_r+0x88>
    b01c:	cf8fa0ef          	jal	5514 <__sinit>
    b020:	f29ff06f          	j	af48 <_fclose_r+0x2c>

0000b024 <fclose>:
    b024:	000147b7          	lui	a5,0x14
    b028:	00050593          	mv	a1,a0
    b02c:	e347a503          	lw	a0,-460(a5) # 13e34 <_impure_ptr>
    b030:	eedff06f          	j	af1c <_fclose_r>

0000b034 <__smakebuf_r>:
    b034:	00c59783          	lh	a5,12(a1)
    b038:	f8010113          	addi	sp,sp,-128
    b03c:	06812c23          	sw	s0,120(sp)
    b040:	06112e23          	sw	ra,124(sp)
    b044:	0027f713          	andi	a4,a5,2
    b048:	00058413          	mv	s0,a1
    b04c:	02070463          	beqz	a4,b074 <__smakebuf_r+0x40>
    b050:	04358793          	addi	a5,a1,67
    b054:	00f5a023          	sw	a5,0(a1)
    b058:	00f5a823          	sw	a5,16(a1)
    b05c:	00100793          	li	a5,1
    b060:	00f5aa23          	sw	a5,20(a1)
    b064:	07c12083          	lw	ra,124(sp)
    b068:	07812403          	lw	s0,120(sp)
    b06c:	08010113          	addi	sp,sp,128
    b070:	00008067          	ret
    b074:	00e59583          	lh	a1,14(a1)
    b078:	06912a23          	sw	s1,116(sp)
    b07c:	07212823          	sw	s2,112(sp)
    b080:	07312623          	sw	s3,108(sp)
    b084:	07412423          	sw	s4,104(sp)
    b088:	00050493          	mv	s1,a0
    b08c:	0805c663          	bltz	a1,b118 <__smakebuf_r+0xe4>
    b090:	00810613          	addi	a2,sp,8
    b094:	2fc000ef          	jal	b390 <_fstat_r>
    b098:	06054e63          	bltz	a0,b114 <__smakebuf_r+0xe0>
    b09c:	00c12783          	lw	a5,12(sp)
    b0a0:	0000f937          	lui	s2,0xf
    b0a4:	000019b7          	lui	s3,0x1
    b0a8:	00f97933          	and	s2,s2,a5
    b0ac:	ffffe7b7          	lui	a5,0xffffe
    b0b0:	00f90933          	add	s2,s2,a5
    b0b4:	00193913          	seqz	s2,s2
    b0b8:	40000a13          	li	s4,1024
    b0bc:	80098993          	addi	s3,s3,-2048 # 800 <main+0x514>
    b0c0:	000a0593          	mv	a1,s4
    b0c4:	00048513          	mv	a0,s1
    b0c8:	f35fd0ef          	jal	8ffc <_malloc_r>
    b0cc:	00c41783          	lh	a5,12(s0)
    b0d0:	06050863          	beqz	a0,b140 <__smakebuf_r+0x10c>
    b0d4:	0807e793          	ori	a5,a5,128
    b0d8:	00a42023          	sw	a0,0(s0)
    b0dc:	00a42823          	sw	a0,16(s0)
    b0e0:	00f41623          	sh	a5,12(s0)
    b0e4:	01442a23          	sw	s4,20(s0)
    b0e8:	0a091063          	bnez	s2,b188 <__smakebuf_r+0x154>
    b0ec:	0137e7b3          	or	a5,a5,s3
    b0f0:	07c12083          	lw	ra,124(sp)
    b0f4:	00f41623          	sh	a5,12(s0)
    b0f8:	07812403          	lw	s0,120(sp)
    b0fc:	07412483          	lw	s1,116(sp)
    b100:	07012903          	lw	s2,112(sp)
    b104:	06c12983          	lw	s3,108(sp)
    b108:	06812a03          	lw	s4,104(sp)
    b10c:	08010113          	addi	sp,sp,128
    b110:	00008067          	ret
    b114:	00c41783          	lh	a5,12(s0)
    b118:	0807f793          	andi	a5,a5,128
    b11c:	00000913          	li	s2,0
    b120:	04078e63          	beqz	a5,b17c <__smakebuf_r+0x148>
    b124:	04000a13          	li	s4,64
    b128:	000a0593          	mv	a1,s4
    b12c:	00048513          	mv	a0,s1
    b130:	ecdfd0ef          	jal	8ffc <_malloc_r>
    b134:	00c41783          	lh	a5,12(s0)
    b138:	00000993          	li	s3,0
    b13c:	f8051ce3          	bnez	a0,b0d4 <__smakebuf_r+0xa0>
    b140:	2007f713          	andi	a4,a5,512
    b144:	04071e63          	bnez	a4,b1a0 <__smakebuf_r+0x16c>
    b148:	ffc7f793          	andi	a5,a5,-4
    b14c:	0027e793          	ori	a5,a5,2
    b150:	04340713          	addi	a4,s0,67
    b154:	00f41623          	sh	a5,12(s0)
    b158:	00100793          	li	a5,1
    b15c:	07412483          	lw	s1,116(sp)
    b160:	07012903          	lw	s2,112(sp)
    b164:	06c12983          	lw	s3,108(sp)
    b168:	06812a03          	lw	s4,104(sp)
    b16c:	00e42023          	sw	a4,0(s0)
    b170:	00e42823          	sw	a4,16(s0)
    b174:	00f42a23          	sw	a5,20(s0)
    b178:	eedff06f          	j	b064 <__smakebuf_r+0x30>
    b17c:	40000a13          	li	s4,1024
    b180:	00000993          	li	s3,0
    b184:	f3dff06f          	j	b0c0 <__smakebuf_r+0x8c>
    b188:	00e41583          	lh	a1,14(s0)
    b18c:	00048513          	mv	a0,s1
    b190:	268000ef          	jal	b3f8 <_isatty_r>
    b194:	02051063          	bnez	a0,b1b4 <__smakebuf_r+0x180>
    b198:	00c41783          	lh	a5,12(s0)
    b19c:	f51ff06f          	j	b0ec <__smakebuf_r+0xb8>
    b1a0:	07412483          	lw	s1,116(sp)
    b1a4:	07012903          	lw	s2,112(sp)
    b1a8:	06c12983          	lw	s3,108(sp)
    b1ac:	06812a03          	lw	s4,104(sp)
    b1b0:	eb5ff06f          	j	b064 <__smakebuf_r+0x30>
    b1b4:	00c45783          	lhu	a5,12(s0)
    b1b8:	ffc7f793          	andi	a5,a5,-4
    b1bc:	0017e793          	ori	a5,a5,1
    b1c0:	01079793          	slli	a5,a5,0x10
    b1c4:	4107d793          	srai	a5,a5,0x10
    b1c8:	f25ff06f          	j	b0ec <__smakebuf_r+0xb8>

0000b1cc <__swhatbuf_r>:
    b1cc:	f9010113          	addi	sp,sp,-112
    b1d0:	06812423          	sw	s0,104(sp)
    b1d4:	00058413          	mv	s0,a1
    b1d8:	00e59583          	lh	a1,14(a1)
    b1dc:	06912223          	sw	s1,100(sp)
    b1e0:	07212023          	sw	s2,96(sp)
    b1e4:	06112623          	sw	ra,108(sp)
    b1e8:	00060493          	mv	s1,a2
    b1ec:	00068913          	mv	s2,a3
    b1f0:	0405ca63          	bltz	a1,b244 <__swhatbuf_r+0x78>
    b1f4:	00810613          	addi	a2,sp,8
    b1f8:	198000ef          	jal	b390 <_fstat_r>
    b1fc:	04054463          	bltz	a0,b244 <__swhatbuf_r+0x78>
    b200:	00c12703          	lw	a4,12(sp)
    b204:	0000f7b7          	lui	a5,0xf
    b208:	06c12083          	lw	ra,108(sp)
    b20c:	00e7f7b3          	and	a5,a5,a4
    b210:	ffffe737          	lui	a4,0xffffe
    b214:	00e787b3          	add	a5,a5,a4
    b218:	06812403          	lw	s0,104(sp)
    b21c:	0017b793          	seqz	a5,a5
    b220:	00f92023          	sw	a5,0(s2) # f000 <__floatsidf+0x5c>
    b224:	40000713          	li	a4,1024
    b228:	00e4a023          	sw	a4,0(s1)
    b22c:	00001537          	lui	a0,0x1
    b230:	06412483          	lw	s1,100(sp)
    b234:	06012903          	lw	s2,96(sp)
    b238:	80050513          	addi	a0,a0,-2048 # 800 <main+0x514>
    b23c:	07010113          	addi	sp,sp,112
    b240:	00008067          	ret
    b244:	00c45783          	lhu	a5,12(s0)
    b248:	0807f793          	andi	a5,a5,128
    b24c:	02078863          	beqz	a5,b27c <__swhatbuf_r+0xb0>
    b250:	06c12083          	lw	ra,108(sp)
    b254:	06812403          	lw	s0,104(sp)
    b258:	00000793          	li	a5,0
    b25c:	00f92023          	sw	a5,0(s2)
    b260:	04000713          	li	a4,64
    b264:	00e4a023          	sw	a4,0(s1)
    b268:	06012903          	lw	s2,96(sp)
    b26c:	06412483          	lw	s1,100(sp)
    b270:	00000513          	li	a0,0
    b274:	07010113          	addi	sp,sp,112
    b278:	00008067          	ret
    b27c:	06c12083          	lw	ra,108(sp)
    b280:	06812403          	lw	s0,104(sp)
    b284:	00f92023          	sw	a5,0(s2)
    b288:	40000713          	li	a4,1024
    b28c:	00e4a023          	sw	a4,0(s1)
    b290:	06012903          	lw	s2,96(sp)
    b294:	06412483          	lw	s1,100(sp)
    b298:	00000513          	li	a0,0
    b29c:	07010113          	addi	sp,sp,112
    b2a0:	00008067          	ret

0000b2a4 <_setlocale_r>:
    b2a4:	ff010113          	addi	sp,sp,-16
    b2a8:	00112623          	sw	ra,12(sp)
    b2ac:	00912223          	sw	s1,4(sp)
    b2b0:	02060a63          	beqz	a2,b2e4 <_setlocale_r+0x40>
    b2b4:	64818593          	addi	a1,gp,1608 # 12f58 <keypad_map+0x298>
    b2b8:	00060513          	mv	a0,a2
    b2bc:	00812423          	sw	s0,8(sp)
    b2c0:	00060413          	mv	s0,a2
    b2c4:	1f4000ef          	jal	b4b8 <strcmp>
    b2c8:	02051063          	bnez	a0,b2e8 <_setlocale_r+0x44>
    b2cc:	00812403          	lw	s0,8(sp)
    b2d0:	64418513          	addi	a0,gp,1604 # 12f54 <keypad_map+0x294>
    b2d4:	00c12083          	lw	ra,12(sp)
    b2d8:	00412483          	lw	s1,4(sp)
    b2dc:	01010113          	addi	sp,sp,16
    b2e0:	00008067          	ret
    b2e4:	fedff06f          	j	b2d0 <_setlocale_r+0x2c>
    b2e8:	64418593          	addi	a1,gp,1604 # 12f54 <keypad_map+0x294>
    b2ec:	00040513          	mv	a0,s0
    b2f0:	1c8000ef          	jal	b4b8 <strcmp>
    b2f4:	fc050ce3          	beqz	a0,b2cc <_setlocale_r+0x28>
    b2f8:	66018593          	addi	a1,gp,1632 # 12f70 <keypad_map+0x2b0>
    b2fc:	00040513          	mv	a0,s0
    b300:	1b8000ef          	jal	b4b8 <strcmp>
    b304:	fc0504e3          	beqz	a0,b2cc <_setlocale_r+0x28>
    b308:	00812403          	lw	s0,8(sp)
    b30c:	00000513          	li	a0,0
    b310:	fc5ff06f          	j	b2d4 <_setlocale_r+0x30>

0000b314 <__locale_mb_cur_max>:
    b314:	000147b7          	lui	a5,0x14
    b318:	d9c7c503          	lbu	a0,-612(a5) # 13d9c <__global_locale+0x128>
    b31c:	00008067          	ret

0000b320 <setlocale>:
    b320:	ff010113          	addi	sp,sp,-16
    b324:	00112623          	sw	ra,12(sp)
    b328:	00912223          	sw	s1,4(sp)
    b32c:	02058a63          	beqz	a1,b360 <setlocale+0x40>
    b330:	00812423          	sw	s0,8(sp)
    b334:	00058413          	mv	s0,a1
    b338:	64818593          	addi	a1,gp,1608 # 12f58 <keypad_map+0x298>
    b33c:	00040513          	mv	a0,s0
    b340:	178000ef          	jal	b4b8 <strcmp>
    b344:	02051063          	bnez	a0,b364 <setlocale+0x44>
    b348:	00812403          	lw	s0,8(sp)
    b34c:	64418513          	addi	a0,gp,1604 # 12f54 <keypad_map+0x294>
    b350:	00c12083          	lw	ra,12(sp)
    b354:	00412483          	lw	s1,4(sp)
    b358:	01010113          	addi	sp,sp,16
    b35c:	00008067          	ret
    b360:	fedff06f          	j	b34c <setlocale+0x2c>
    b364:	64418593          	addi	a1,gp,1604 # 12f54 <keypad_map+0x294>
    b368:	00040513          	mv	a0,s0
    b36c:	14c000ef          	jal	b4b8 <strcmp>
    b370:	fc050ce3          	beqz	a0,b348 <setlocale+0x28>
    b374:	66018593          	addi	a1,gp,1632 # 12f70 <keypad_map+0x2b0>
    b378:	00040513          	mv	a0,s0
    b37c:	13c000ef          	jal	b4b8 <strcmp>
    b380:	fc0504e3          	beqz	a0,b348 <setlocale+0x28>
    b384:	00812403          	lw	s0,8(sp)
    b388:	00000513          	li	a0,0
    b38c:	fc5ff06f          	j	b350 <setlocale+0x30>

0000b390 <_fstat_r>:
    b390:	ff010113          	addi	sp,sp,-16
    b394:	00058713          	mv	a4,a1
    b398:	00812423          	sw	s0,8(sp)
    b39c:	00912223          	sw	s1,4(sp)
    b3a0:	00050413          	mv	s0,a0
    b3a4:	000144b7          	lui	s1,0x14
    b3a8:	00060593          	mv	a1,a2
    b3ac:	00070513          	mv	a0,a4
    b3b0:	00112623          	sw	ra,12(sp)
    b3b4:	fc04a423          	sw	zero,-56(s1) # 13fc8 <errno>
    b3b8:	ff9f60ef          	jal	23b0 <_fstat>
    b3bc:	fff00793          	li	a5,-1
    b3c0:	00f50c63          	beq	a0,a5,b3d8 <_fstat_r+0x48>
    b3c4:	00c12083          	lw	ra,12(sp)
    b3c8:	00812403          	lw	s0,8(sp)
    b3cc:	00412483          	lw	s1,4(sp)
    b3d0:	01010113          	addi	sp,sp,16
    b3d4:	00008067          	ret
    b3d8:	fc84a783          	lw	a5,-56(s1)
    b3dc:	fe0784e3          	beqz	a5,b3c4 <_fstat_r+0x34>
    b3e0:	00c12083          	lw	ra,12(sp)
    b3e4:	00f42023          	sw	a5,0(s0)
    b3e8:	00812403          	lw	s0,8(sp)
    b3ec:	00412483          	lw	s1,4(sp)
    b3f0:	01010113          	addi	sp,sp,16
    b3f4:	00008067          	ret

0000b3f8 <_isatty_r>:
    b3f8:	ff010113          	addi	sp,sp,-16
    b3fc:	00812423          	sw	s0,8(sp)
    b400:	00912223          	sw	s1,4(sp)
    b404:	00050413          	mv	s0,a0
    b408:	000144b7          	lui	s1,0x14
    b40c:	00058513          	mv	a0,a1
    b410:	00112623          	sw	ra,12(sp)
    b414:	fc04a423          	sw	zero,-56(s1) # 13fc8 <errno>
    b418:	fc1f60ef          	jal	23d8 <_isatty>
    b41c:	fff00793          	li	a5,-1
    b420:	00f50c63          	beq	a0,a5,b438 <_isatty_r+0x40>
    b424:	00c12083          	lw	ra,12(sp)
    b428:	00812403          	lw	s0,8(sp)
    b42c:	00412483          	lw	s1,4(sp)
    b430:	01010113          	addi	sp,sp,16
    b434:	00008067          	ret
    b438:	fc84a783          	lw	a5,-56(s1)
    b43c:	fe0784e3          	beqz	a5,b424 <_isatty_r+0x2c>
    b440:	00c12083          	lw	ra,12(sp)
    b444:	00f42023          	sw	a5,0(s0)
    b448:	00812403          	lw	s0,8(sp)
    b44c:	00412483          	lw	s1,4(sp)
    b450:	01010113          	addi	sp,sp,16
    b454:	00008067          	ret

0000b458 <_sbrk_r>:
    b458:	ff010113          	addi	sp,sp,-16
    b45c:	00812423          	sw	s0,8(sp)
    b460:	00912223          	sw	s1,4(sp)
    b464:	00050413          	mv	s0,a0
    b468:	000144b7          	lui	s1,0x14
    b46c:	00058513          	mv	a0,a1
    b470:	00112623          	sw	ra,12(sp)
    b474:	fc04a423          	sw	zero,-56(s1) # 13fc8 <errno>
    b478:	f85f60ef          	jal	23fc <_sbrk>
    b47c:	fff00793          	li	a5,-1
    b480:	00f50c63          	beq	a0,a5,b498 <_sbrk_r+0x40>
    b484:	00c12083          	lw	ra,12(sp)
    b488:	00812403          	lw	s0,8(sp)
    b48c:	00412483          	lw	s1,4(sp)
    b490:	01010113          	addi	sp,sp,16
    b494:	00008067          	ret
    b498:	fc84a783          	lw	a5,-56(s1)
    b49c:	fe0784e3          	beqz	a5,b484 <_sbrk_r+0x2c>
    b4a0:	00c12083          	lw	ra,12(sp)
    b4a4:	00f42023          	sw	a5,0(s0)
    b4a8:	00812403          	lw	s0,8(sp)
    b4ac:	00412483          	lw	s1,4(sp)
    b4b0:	01010113          	addi	sp,sp,16
    b4b4:	00008067          	ret

0000b4b8 <strcmp>:
    b4b8:	00b56733          	or	a4,a0,a1
    b4bc:	fff00393          	li	t2,-1
    b4c0:	00377713          	andi	a4,a4,3
    b4c4:	10071063          	bnez	a4,b5c4 <strcmp+0x10c>
    b4c8:	7f7f87b7          	lui	a5,0x7f7f8
    b4cc:	f7f78793          	addi	a5,a5,-129 # 7f7f7f7f <_memory_end+0x7f7d7f7f>
    b4d0:	00052603          	lw	a2,0(a0)
    b4d4:	0005a683          	lw	a3,0(a1)
    b4d8:	00f672b3          	and	t0,a2,a5
    b4dc:	00f66333          	or	t1,a2,a5
    b4e0:	00f282b3          	add	t0,t0,a5
    b4e4:	0062e2b3          	or	t0,t0,t1
    b4e8:	10729263          	bne	t0,t2,b5ec <strcmp+0x134>
    b4ec:	08d61663          	bne	a2,a3,b578 <strcmp+0xc0>
    b4f0:	00452603          	lw	a2,4(a0)
    b4f4:	0045a683          	lw	a3,4(a1)
    b4f8:	00f672b3          	and	t0,a2,a5
    b4fc:	00f66333          	or	t1,a2,a5
    b500:	00f282b3          	add	t0,t0,a5
    b504:	0062e2b3          	or	t0,t0,t1
    b508:	0c729e63          	bne	t0,t2,b5e4 <strcmp+0x12c>
    b50c:	06d61663          	bne	a2,a3,b578 <strcmp+0xc0>
    b510:	00852603          	lw	a2,8(a0)
    b514:	0085a683          	lw	a3,8(a1)
    b518:	00f672b3          	and	t0,a2,a5
    b51c:	00f66333          	or	t1,a2,a5
    b520:	00f282b3          	add	t0,t0,a5
    b524:	0062e2b3          	or	t0,t0,t1
    b528:	0c729863          	bne	t0,t2,b5f8 <strcmp+0x140>
    b52c:	04d61663          	bne	a2,a3,b578 <strcmp+0xc0>
    b530:	00c52603          	lw	a2,12(a0)
    b534:	00c5a683          	lw	a3,12(a1)
    b538:	00f672b3          	and	t0,a2,a5
    b53c:	00f66333          	or	t1,a2,a5
    b540:	00f282b3          	add	t0,t0,a5
    b544:	0062e2b3          	or	t0,t0,t1
    b548:	0c729263          	bne	t0,t2,b60c <strcmp+0x154>
    b54c:	02d61663          	bne	a2,a3,b578 <strcmp+0xc0>
    b550:	01052603          	lw	a2,16(a0)
    b554:	0105a683          	lw	a3,16(a1)
    b558:	00f672b3          	and	t0,a2,a5
    b55c:	00f66333          	or	t1,a2,a5
    b560:	00f282b3          	add	t0,t0,a5
    b564:	0062e2b3          	or	t0,t0,t1
    b568:	0a729c63          	bne	t0,t2,b620 <strcmp+0x168>
    b56c:	01450513          	addi	a0,a0,20
    b570:	01458593          	addi	a1,a1,20
    b574:	f4d60ee3          	beq	a2,a3,b4d0 <strcmp+0x18>
    b578:	01061713          	slli	a4,a2,0x10
    b57c:	01069793          	slli	a5,a3,0x10
    b580:	00f71e63          	bne	a4,a5,b59c <strcmp+0xe4>
    b584:	01065713          	srli	a4,a2,0x10
    b588:	0106d793          	srli	a5,a3,0x10
    b58c:	40f70533          	sub	a0,a4,a5
    b590:	0ff57593          	zext.b	a1,a0
    b594:	02059063          	bnez	a1,b5b4 <strcmp+0xfc>
    b598:	00008067          	ret
    b59c:	01075713          	srli	a4,a4,0x10
    b5a0:	0107d793          	srli	a5,a5,0x10
    b5a4:	40f70533          	sub	a0,a4,a5
    b5a8:	0ff57593          	zext.b	a1,a0
    b5ac:	00059463          	bnez	a1,b5b4 <strcmp+0xfc>
    b5b0:	00008067          	ret
    b5b4:	0ff77713          	zext.b	a4,a4
    b5b8:	0ff7f793          	zext.b	a5,a5
    b5bc:	40f70533          	sub	a0,a4,a5
    b5c0:	00008067          	ret
    b5c4:	00054603          	lbu	a2,0(a0)
    b5c8:	0005c683          	lbu	a3,0(a1)
    b5cc:	00150513          	addi	a0,a0,1
    b5d0:	00158593          	addi	a1,a1,1
    b5d4:	00d61463          	bne	a2,a3,b5dc <strcmp+0x124>
    b5d8:	fe0616e3          	bnez	a2,b5c4 <strcmp+0x10c>
    b5dc:	40d60533          	sub	a0,a2,a3
    b5e0:	00008067          	ret
    b5e4:	00450513          	addi	a0,a0,4
    b5e8:	00458593          	addi	a1,a1,4
    b5ec:	fcd61ce3          	bne	a2,a3,b5c4 <strcmp+0x10c>
    b5f0:	00000513          	li	a0,0
    b5f4:	00008067          	ret
    b5f8:	00850513          	addi	a0,a0,8
    b5fc:	00858593          	addi	a1,a1,8
    b600:	fcd612e3          	bne	a2,a3,b5c4 <strcmp+0x10c>
    b604:	00000513          	li	a0,0
    b608:	00008067          	ret
    b60c:	00c50513          	addi	a0,a0,12
    b610:	00c58593          	addi	a1,a1,12
    b614:	fad618e3          	bne	a2,a3,b5c4 <strcmp+0x10c>
    b618:	00000513          	li	a0,0
    b61c:	00008067          	ret
    b620:	01050513          	addi	a0,a0,16
    b624:	01058593          	addi	a1,a1,16
    b628:	f8d61ee3          	bne	a2,a3,b5c4 <strcmp+0x10c>
    b62c:	00000513          	li	a0,0
    b630:	00008067          	ret

0000b634 <__assert_func>:
    b634:	000147b7          	lui	a5,0x14
    b638:	e347a703          	lw	a4,-460(a5) # 13e34 <_impure_ptr>
    b63c:	ff010113          	addi	sp,sp,-16
    b640:	00068793          	mv	a5,a3
    b644:	00060813          	mv	a6,a2
    b648:	00112623          	sw	ra,12(sp)
    b64c:	00c72883          	lw	a7,12(a4) # ffffe00c <_memory_end+0xfffde00c>
    b650:	00050693          	mv	a3,a0
    b654:	00058713          	mv	a4,a1
    b658:	00078613          	mv	a2,a5
    b65c:	00080c63          	beqz	a6,b674 <__assert_func+0x40>
    b660:	65418793          	addi	a5,gp,1620 # 12f64 <keypad_map+0x2a4>
    b664:	66418593          	addi	a1,gp,1636 # 12f74 <keypad_map+0x2b4>
    b668:	00088513          	mv	a0,a7
    b66c:	1f8000ef          	jal	b864 <fiprintf>
    b670:	494010ef          	jal	cb04 <abort>
    b674:	66018793          	addi	a5,gp,1632 # 12f70 <keypad_map+0x2b0>
    b678:	66018813          	addi	a6,gp,1632 # 12f70 <keypad_map+0x2b0>
    b67c:	fe9ff06f          	j	b664 <__assert_func+0x30>

0000b680 <__assert>:
    b680:	ff010113          	addi	sp,sp,-16
    b684:	00060693          	mv	a3,a2
    b688:	00000613          	li	a2,0
    b68c:	00112623          	sw	ra,12(sp)
    b690:	fa5ff0ef          	jal	b634 <__assert_func>

0000b694 <_calloc_r>:
    b694:	02c5b7b3          	mulhu	a5,a1,a2
    b698:	ff010113          	addi	sp,sp,-16
    b69c:	00112623          	sw	ra,12(sp)
    b6a0:	00812423          	sw	s0,8(sp)
    b6a4:	02c585b3          	mul	a1,a1,a2
    b6a8:	0a079063          	bnez	a5,b748 <_calloc_r+0xb4>
    b6ac:	951fd0ef          	jal	8ffc <_malloc_r>
    b6b0:	00050413          	mv	s0,a0
    b6b4:	0a050063          	beqz	a0,b754 <_calloc_r+0xc0>
    b6b8:	ffc52603          	lw	a2,-4(a0)
    b6bc:	02400713          	li	a4,36
    b6c0:	ffc67613          	andi	a2,a2,-4
    b6c4:	ffc60613          	addi	a2,a2,-4
    b6c8:	04c76863          	bltu	a4,a2,b718 <_calloc_r+0x84>
    b6cc:	01300693          	li	a3,19
    b6d0:	00050793          	mv	a5,a0
    b6d4:	02c6f263          	bgeu	a3,a2,b6f8 <_calloc_r+0x64>
    b6d8:	00052023          	sw	zero,0(a0)
    b6dc:	00052223          	sw	zero,4(a0)
    b6e0:	01b00793          	li	a5,27
    b6e4:	04c7f863          	bgeu	a5,a2,b734 <_calloc_r+0xa0>
    b6e8:	00052423          	sw	zero,8(a0)
    b6ec:	00052623          	sw	zero,12(a0)
    b6f0:	01050793          	addi	a5,a0,16
    b6f4:	06e60c63          	beq	a2,a4,b76c <_calloc_r+0xd8>
    b6f8:	0007a023          	sw	zero,0(a5)
    b6fc:	0007a223          	sw	zero,4(a5)
    b700:	0007a423          	sw	zero,8(a5)
    b704:	00c12083          	lw	ra,12(sp)
    b708:	00040513          	mv	a0,s0
    b70c:	00812403          	lw	s0,8(sp)
    b710:	01010113          	addi	sp,sp,16
    b714:	00008067          	ret
    b718:	00000593          	li	a1,0
    b71c:	bf5fa0ef          	jal	6310 <memset>
    b720:	00c12083          	lw	ra,12(sp)
    b724:	00040513          	mv	a0,s0
    b728:	00812403          	lw	s0,8(sp)
    b72c:	01010113          	addi	sp,sp,16
    b730:	00008067          	ret
    b734:	00850793          	addi	a5,a0,8
    b738:	0007a023          	sw	zero,0(a5)
    b73c:	0007a223          	sw	zero,4(a5)
    b740:	0007a423          	sw	zero,8(a5)
    b744:	fc1ff06f          	j	b704 <_calloc_r+0x70>
    b748:	3b0010ef          	jal	caf8 <__errno>
    b74c:	00c00793          	li	a5,12
    b750:	00f52023          	sw	a5,0(a0)
    b754:	00000413          	li	s0,0
    b758:	00c12083          	lw	ra,12(sp)
    b75c:	00040513          	mv	a0,s0
    b760:	00812403          	lw	s0,8(sp)
    b764:	01010113          	addi	sp,sp,16
    b768:	00008067          	ret
    b76c:	00052823          	sw	zero,16(a0)
    b770:	01850793          	addi	a5,a0,24
    b774:	00052a23          	sw	zero,20(a0)
    b778:	f81ff06f          	j	b6f8 <_calloc_r+0x64>

0000b77c <_mbtowc_r>:
    b77c:	000147b7          	lui	a5,0x14
    b780:	d587a783          	lw	a5,-680(a5) # 13d58 <__global_locale+0xe4>
    b784:	00078067          	jr	a5

0000b788 <__ascii_mbtowc>:
    b788:	02058063          	beqz	a1,b7a8 <__ascii_mbtowc+0x20>
    b78c:	04060263          	beqz	a2,b7d0 <__ascii_mbtowc+0x48>
    b790:	04068863          	beqz	a3,b7e0 <__ascii_mbtowc+0x58>
    b794:	00064783          	lbu	a5,0(a2)
    b798:	00f5a023          	sw	a5,0(a1)
    b79c:	00064503          	lbu	a0,0(a2)
    b7a0:	00a03533          	snez	a0,a0
    b7a4:	00008067          	ret
    b7a8:	ff010113          	addi	sp,sp,-16
    b7ac:	00c10593          	addi	a1,sp,12
    b7b0:	02060463          	beqz	a2,b7d8 <__ascii_mbtowc+0x50>
    b7b4:	02068a63          	beqz	a3,b7e8 <__ascii_mbtowc+0x60>
    b7b8:	00064783          	lbu	a5,0(a2)
    b7bc:	00f5a023          	sw	a5,0(a1)
    b7c0:	00064503          	lbu	a0,0(a2)
    b7c4:	00a03533          	snez	a0,a0
    b7c8:	01010113          	addi	sp,sp,16
    b7cc:	00008067          	ret
    b7d0:	00000513          	li	a0,0
    b7d4:	00008067          	ret
    b7d8:	00000513          	li	a0,0
    b7dc:	fedff06f          	j	b7c8 <__ascii_mbtowc+0x40>
    b7e0:	ffe00513          	li	a0,-2
    b7e4:	00008067          	ret
    b7e8:	ffe00513          	li	a0,-2
    b7ec:	fddff06f          	j	b7c8 <__ascii_mbtowc+0x40>

0000b7f0 <_wctomb_r>:
    b7f0:	000147b7          	lui	a5,0x14
    b7f4:	d547a783          	lw	a5,-684(a5) # 13d54 <__global_locale+0xe0>
    b7f8:	00078067          	jr	a5

0000b7fc <__ascii_wctomb>:
    b7fc:	02058463          	beqz	a1,b824 <__ascii_wctomb+0x28>
    b800:	0ff00793          	li	a5,255
    b804:	00c7e863          	bltu	a5,a2,b814 <__ascii_wctomb+0x18>
    b808:	00c58023          	sb	a2,0(a1)
    b80c:	00100513          	li	a0,1
    b810:	00008067          	ret
    b814:	08a00793          	li	a5,138
    b818:	00f52023          	sw	a5,0(a0)
    b81c:	fff00513          	li	a0,-1
    b820:	00008067          	ret
    b824:	00000513          	li	a0,0
    b828:	00008067          	ret

0000b82c <_fiprintf_r>:
    b82c:	fc010113          	addi	sp,sp,-64
    b830:	02c10313          	addi	t1,sp,44
    b834:	02d12623          	sw	a3,44(sp)
    b838:	00030693          	mv	a3,t1
    b83c:	00112e23          	sw	ra,28(sp)
    b840:	02e12823          	sw	a4,48(sp)
    b844:	02f12a23          	sw	a5,52(sp)
    b848:	03012c23          	sw	a6,56(sp)
    b84c:	03112e23          	sw	a7,60(sp)
    b850:	00612623          	sw	t1,12(sp)
    b854:	060000ef          	jal	b8b4 <_vfiprintf_r>
    b858:	01c12083          	lw	ra,28(sp)
    b85c:	04010113          	addi	sp,sp,64
    b860:	00008067          	ret

0000b864 <fiprintf>:
    b864:	00050e13          	mv	t3,a0
    b868:	00014537          	lui	a0,0x14
    b86c:	fc010113          	addi	sp,sp,-64
    b870:	e3452503          	lw	a0,-460(a0) # 13e34 <_impure_ptr>
    b874:	02810313          	addi	t1,sp,40
    b878:	02c12423          	sw	a2,40(sp)
    b87c:	02d12623          	sw	a3,44(sp)
    b880:	00058613          	mv	a2,a1
    b884:	00030693          	mv	a3,t1
    b888:	000e0593          	mv	a1,t3
    b88c:	00112e23          	sw	ra,28(sp)
    b890:	02e12823          	sw	a4,48(sp)
    b894:	02f12a23          	sw	a5,52(sp)
    b898:	03012c23          	sw	a6,56(sp)
    b89c:	03112e23          	sw	a7,60(sp)
    b8a0:	00612623          	sw	t1,12(sp)
    b8a4:	010000ef          	jal	b8b4 <_vfiprintf_r>
    b8a8:	01c12083          	lw	ra,28(sp)
    b8ac:	04010113          	addi	sp,sp,64
    b8b0:	00008067          	ret

0000b8b4 <_vfiprintf_r>:
    b8b4:	ed010113          	addi	sp,sp,-304
    b8b8:	11312e23          	sw	s3,284(sp)
    b8bc:	11512a23          	sw	s5,276(sp)
    b8c0:	11612823          	sw	s6,272(sp)
    b8c4:	11712623          	sw	s7,268(sp)
    b8c8:	12112623          	sw	ra,300(sp)
    b8cc:	11a12023          	sw	s10,256(sp)
    b8d0:	00050b93          	mv	s7,a0
    b8d4:	00058a93          	mv	s5,a1
    b8d8:	00060993          	mv	s3,a2
    b8dc:	00068b13          	mv	s6,a3
    b8e0:	00050663          	beqz	a0,b8ec <_vfiprintf_r+0x38>
    b8e4:	03452783          	lw	a5,52(a0)
    b8e8:	76078ae3          	beqz	a5,c85c <_vfiprintf_r+0xfa8>
    b8ec:	00ca9703          	lh	a4,12(s5)
    b8f0:	064aa783          	lw	a5,100(s5)
    b8f4:	01271693          	slli	a3,a4,0x12
    b8f8:	0206c063          	bltz	a3,b918 <_vfiprintf_r+0x64>
    b8fc:	ffffe6b7          	lui	a3,0xffffe
    b900:	fff68693          	addi	a3,a3,-1 # ffffdfff <_memory_end+0xfffddfff>
    b904:	00002637          	lui	a2,0x2
    b908:	00c76733          	or	a4,a4,a2
    b90c:	00d7f7b3          	and	a5,a5,a3
    b910:	00ea9623          	sh	a4,12(s5)
    b914:	06faa223          	sw	a5,100(s5)
    b918:	01279713          	slli	a4,a5,0x12
    b91c:	00075463          	bgez	a4,b924 <_vfiprintf_r+0x70>
    b920:	0cc0106f          	j	c9ec <_vfiprintf_r+0x1138>
    b924:	00ca9783          	lh	a5,12(s5)
    b928:	0087f713          	andi	a4,a5,8
    b92c:	2e070c63          	beqz	a4,bc24 <_vfiprintf_r+0x370>
    b930:	010aa703          	lw	a4,16(s5)
    b934:	2e070863          	beqz	a4,bc24 <_vfiprintf_r+0x370>
    b938:	01a7f793          	andi	a5,a5,26
    b93c:	00a00713          	li	a4,10
    b940:	30e78263          	beq	a5,a4,bc44 <_vfiprintf_r+0x390>
    b944:	000137b7          	lui	a5,0x13
    b948:	00000d13          	li	s10,0
    b94c:	11812423          	sw	s8,264(sp)
    b950:	11912223          	sw	s9,260(sp)
    b954:	04c10c13          	addi	s8,sp,76
    b958:	40478793          	addi	a5,a5,1028 # 13404 <_ctype_+0x104>
    b95c:	00013cb7          	lui	s9,0x13
    b960:	12812423          	sw	s0,296(sp)
    b964:	13212023          	sw	s2,288(sp)
    b968:	11412c23          	sw	s4,280(sp)
    b96c:	000d0913          	mv	s2,s10
    b970:	12912223          	sw	s1,292(sp)
    b974:	0fb12e23          	sw	s11,252(sp)
    b978:	05812023          	sw	s8,64(sp)
    b97c:	04012423          	sw	zero,72(sp)
    b980:	04012223          	sw	zero,68(sp)
    b984:	000c0413          	mv	s0,s8
    b988:	00012223          	sw	zero,4(sp)
    b98c:	00012a23          	sw	zero,20(sp)
    b990:	00012c23          	sw	zero,24(sp)
    b994:	00012e23          	sw	zero,28(sp)
    b998:	00f12023          	sw	a5,0(sp)
    b99c:	01000a13          	li	s4,16
    b9a0:	570c8c93          	addi	s9,s9,1392 # 13570 <zeroes.0>
    b9a4:	000b0d13          	mv	s10,s6
    b9a8:	0009c783          	lbu	a5,0(s3)
    b9ac:	1c078863          	beqz	a5,bb7c <_vfiprintf_r+0x2c8>
    b9b0:	00098493          	mv	s1,s3
    b9b4:	02500713          	li	a4,37
    b9b8:	2ce78263          	beq	a5,a4,bc7c <_vfiprintf_r+0x3c8>
    b9bc:	0014c783          	lbu	a5,1(s1)
    b9c0:	00148493          	addi	s1,s1,1
    b9c4:	fe079ae3          	bnez	a5,b9b8 <_vfiprintf_r+0x104>
    b9c8:	41348b33          	sub	s6,s1,s3
    b9cc:	1b348863          	beq	s1,s3,bb7c <_vfiprintf_r+0x2c8>
    b9d0:	04812703          	lw	a4,72(sp)
    b9d4:	04412783          	lw	a5,68(sp)
    b9d8:	01342023          	sw	s3,0(s0)
    b9dc:	01670733          	add	a4,a4,s6
    b9e0:	00178793          	addi	a5,a5,1
    b9e4:	01642223          	sw	s6,4(s0)
    b9e8:	04e12423          	sw	a4,72(sp)
    b9ec:	04f12223          	sw	a5,68(sp)
    b9f0:	00700713          	li	a4,7
    b9f4:	00840413          	addi	s0,s0,8
    b9f8:	28f74a63          	blt	a4,a5,bc8c <_vfiprintf_r+0x3d8>
    b9fc:	0004c783          	lbu	a5,0(s1)
    ba00:	01690933          	add	s2,s2,s6
    ba04:	16078c63          	beqz	a5,bb7c <_vfiprintf_r+0x2c8>
    ba08:	0014c783          	lbu	a5,1(s1)
    ba0c:	00148993          	addi	s3,s1,1
    ba10:	02010da3          	sb	zero,59(sp)
    ba14:	fff00d93          	li	s11,-1
    ba18:	00000b13          	li	s6,0
    ba1c:	00000813          	li	a6,0
    ba20:	05a00493          	li	s1,90
    ba24:	00198993          	addi	s3,s3,1
    ba28:	00078613          	mv	a2,a5
    ba2c:	fe060713          	addi	a4,a2,-32 # 1fe0 <i2c_start_simple+0xb0>
    ba30:	04e4e663          	bltu	s1,a4,ba7c <_vfiprintf_r+0x1c8>
    ba34:	00012783          	lw	a5,0(sp)
    ba38:	00271713          	slli	a4,a4,0x2
    ba3c:	00f70733          	add	a4,a4,a5
    ba40:	00072783          	lw	a5,0(a4)
    ba44:	00078067          	jr	a5
    ba48:	00000b13          	li	s6,0
    ba4c:	fd060793          	addi	a5,a2,-48
    ba50:	00900693          	li	a3,9
    ba54:	0009c603          	lbu	a2,0(s3)
    ba58:	002b1713          	slli	a4,s6,0x2
    ba5c:	01670b33          	add	s6,a4,s6
    ba60:	001b1b13          	slli	s6,s6,0x1
    ba64:	01678b33          	add	s6,a5,s6
    ba68:	fd060793          	addi	a5,a2,-48
    ba6c:	00198993          	addi	s3,s3,1
    ba70:	fef6f2e3          	bgeu	a3,a5,ba54 <_vfiprintf_r+0x1a0>
    ba74:	fe060713          	addi	a4,a2,-32
    ba78:	fae4fee3          	bgeu	s1,a4,ba34 <_vfiprintf_r+0x180>
    ba7c:	10060063          	beqz	a2,bb7c <_vfiprintf_r+0x2c8>
    ba80:	08c10623          	sb	a2,140(sp)
    ba84:	02010da3          	sb	zero,59(sp)
    ba88:	00100893          	li	a7,1
    ba8c:	00100e13          	li	t3,1
    ba90:	08c10493          	addi	s1,sp,140
    ba94:	00000d93          	li	s11,0
    ba98:	00000293          	li	t0,0
    ba9c:	08487f93          	andi	t6,a6,132
    baa0:	04812703          	lw	a4,72(sp)
    baa4:	04412783          	lw	a5,68(sp)
    baa8:	000f9663          	bnez	t6,bab4 <_vfiprintf_r+0x200>
    baac:	411b0eb3          	sub	t4,s6,a7
    bab0:	1dd04ee3          	bgtz	t4,c48c <_vfiprintf_r+0xbd8>
    bab4:	03b14603          	lbu	a2,59(sp)
    bab8:	02060863          	beqz	a2,bae8 <_vfiprintf_r+0x234>
    babc:	03b10613          	addi	a2,sp,59
    bac0:	00c42023          	sw	a2,0(s0)
    bac4:	00178793          	addi	a5,a5,1
    bac8:	00100613          	li	a2,1
    bacc:	00170713          	addi	a4,a4,1
    bad0:	00c42223          	sw	a2,4(s0)
    bad4:	04e12423          	sw	a4,72(sp)
    bad8:	04f12223          	sw	a5,68(sp)
    badc:	00700613          	li	a2,7
    bae0:	00840413          	addi	s0,s0,8
    bae4:	22f64463          	blt	a2,a5,bd0c <_vfiprintf_r+0x458>
    bae8:	02028863          	beqz	t0,bb18 <_vfiprintf_r+0x264>
    baec:	03c10613          	addi	a2,sp,60
    baf0:	00c42023          	sw	a2,0(s0)
    baf4:	00178793          	addi	a5,a5,1
    baf8:	00200613          	li	a2,2
    bafc:	00270713          	addi	a4,a4,2
    bb00:	00c42223          	sw	a2,4(s0)
    bb04:	04e12423          	sw	a4,72(sp)
    bb08:	04f12223          	sw	a5,68(sp)
    bb0c:	00700613          	li	a2,7
    bb10:	00840413          	addi	s0,s0,8
    bb14:	2af642e3          	blt	a2,a5,c5b8 <_vfiprintf_r+0xd04>
    bb18:	08000613          	li	a2,128
    bb1c:	6ccf8c63          	beq	t6,a2,c1f4 <_vfiprintf_r+0x940>
    bb20:	41cd8db3          	sub	s11,s11,t3
    bb24:	7fb04463          	bgtz	s11,c30c <_vfiprintf_r+0xa58>
    bb28:	00ee0733          	add	a4,t3,a4
    bb2c:	00178793          	addi	a5,a5,1
    bb30:	00942023          	sw	s1,0(s0)
    bb34:	01c42223          	sw	t3,4(s0)
    bb38:	04e12423          	sw	a4,72(sp)
    bb3c:	04f12223          	sw	a5,68(sp)
    bb40:	00700613          	li	a2,7
    bb44:	00840413          	addi	s0,s0,8
    bb48:	0af64ee3          	blt	a2,a5,c404 <_vfiprintf_r+0xb50>
    bb4c:	00487813          	andi	a6,a6,4
    bb50:	00080663          	beqz	a6,bb5c <_vfiprintf_r+0x2a8>
    bb54:	411b04b3          	sub	s1,s6,a7
    bb58:	20904063          	bgtz	s1,bd58 <_vfiprintf_r+0x4a4>
    bb5c:	011b5463          	bge	s6,a7,bb64 <_vfiprintf_r+0x2b0>
    bb60:	00088b13          	mv	s6,a7
    bb64:	01690933          	add	s2,s2,s6
    bb68:	14071063          	bnez	a4,bca8 <_vfiprintf_r+0x3f4>
    bb6c:	0009c783          	lbu	a5,0(s3)
    bb70:	04012223          	sw	zero,68(sp)
    bb74:	000c0413          	mv	s0,s8
    bb78:	e2079ce3          	bnez	a5,b9b0 <_vfiprintf_r+0xfc>
    bb7c:	04812783          	lw	a5,72(sp)
    bb80:	00090d13          	mv	s10,s2
    bb84:	12078e63          	beqz	a5,bcc0 <_vfiprintf_r+0x40c>
    bb88:	04010613          	addi	a2,sp,64
    bb8c:	000a8593          	mv	a1,s5
    bb90:	000b8513          	mv	a0,s7
    bb94:	ac8f90ef          	jal	4e5c <__sprint_r>
    bb98:	1280006f          	j	bcc0 <_vfiprintf_r+0x40c>
    bb9c:	000d2b03          	lw	s6,0(s10)
    bba0:	004d0d13          	addi	s10,s10,4
    bba4:	380b4a63          	bltz	s6,bf38 <_vfiprintf_r+0x684>
    bba8:	0009c783          	lbu	a5,0(s3)
    bbac:	e79ff06f          	j	ba24 <_vfiprintf_r+0x170>
    bbb0:	0009c783          	lbu	a5,0(s3)
    bbb4:	02086813          	ori	a6,a6,32
    bbb8:	e6dff06f          	j	ba24 <_vfiprintf_r+0x170>
    bbbc:	01086813          	ori	a6,a6,16
    bbc0:	02087793          	andi	a5,a6,32
    bbc4:	26078263          	beqz	a5,be28 <_vfiprintf_r+0x574>
    bbc8:	007d0d13          	addi	s10,s10,7
    bbcc:	ff8d7d13          	andi	s10,s10,-8
    bbd0:	004d2703          	lw	a4,4(s10)
    bbd4:	000d2783          	lw	a5,0(s10)
    bbd8:	008d0d13          	addi	s10,s10,8
    bbdc:	00070893          	mv	a7,a4
    bbe0:	26074a63          	bltz	a4,be54 <_vfiprintf_r+0x5a0>
    bbe4:	280dc863          	bltz	s11,be74 <_vfiprintf_r+0x5c0>
    bbe8:	0117e733          	or	a4,a5,a7
    bbec:	f7f87813          	andi	a6,a6,-129
    bbf0:	28071263          	bnez	a4,be74 <_vfiprintf_r+0x5c0>
    bbf4:	5e0d98e3          	bnez	s11,c9e4 <_vfiprintf_r+0x1130>
    bbf8:	03b14783          	lbu	a5,59(sp)
    bbfc:	00000893          	li	a7,0
    bc00:	00000e13          	li	t3,0
    bc04:	0f010493          	addi	s1,sp,240
    bc08:	00078463          	beqz	a5,bc10 <_vfiprintf_r+0x35c>
    bc0c:	00188893          	addi	a7,a7,1
    bc10:	00287293          	andi	t0,a6,2
    bc14:	e80284e3          	beqz	t0,ba9c <_vfiprintf_r+0x1e8>
    bc18:	00288893          	addi	a7,a7,2
    bc1c:	00200293          	li	t0,2
    bc20:	e7dff06f          	j	ba9c <_vfiprintf_r+0x1e8>
    bc24:	000a8593          	mv	a1,s5
    bc28:	000b8513          	mv	a0,s7
    bc2c:	878fa0ef          	jal	5ca4 <__swsetup_r>
    bc30:	5a051ee3          	bnez	a0,c9ec <_vfiprintf_r+0x1138>
    bc34:	00ca9783          	lh	a5,12(s5)
    bc38:	00a00713          	li	a4,10
    bc3c:	01a7f793          	andi	a5,a5,26
    bc40:	d0e792e3          	bne	a5,a4,b944 <_vfiprintf_r+0x90>
    bc44:	00ea9783          	lh	a5,14(s5)
    bc48:	ce07cee3          	bltz	a5,b944 <_vfiprintf_r+0x90>
    bc4c:	12c12083          	lw	ra,300(sp)
    bc50:	10012d03          	lw	s10,256(sp)
    bc54:	000b0693          	mv	a3,s6
    bc58:	00098613          	mv	a2,s3
    bc5c:	11012b03          	lw	s6,272(sp)
    bc60:	11c12983          	lw	s3,284(sp)
    bc64:	000a8593          	mv	a1,s5
    bc68:	000b8513          	mv	a0,s7
    bc6c:	11412a83          	lw	s5,276(sp)
    bc70:	10c12b83          	lw	s7,268(sp)
    bc74:	13010113          	addi	sp,sp,304
    bc78:	5b50006f          	j	ca2c <__sbprintf>
    bc7c:	41348b33          	sub	s6,s1,s3
    bc80:	d53498e3          	bne	s1,s3,b9d0 <_vfiprintf_r+0x11c>
    bc84:	0004c783          	lbu	a5,0(s1)
    bc88:	d7dff06f          	j	ba04 <_vfiprintf_r+0x150>
    bc8c:	04010613          	addi	a2,sp,64
    bc90:	000a8593          	mv	a1,s5
    bc94:	000b8513          	mv	a0,s7
    bc98:	9c4f90ef          	jal	4e5c <__sprint_r>
    bc9c:	02051063          	bnez	a0,bcbc <_vfiprintf_r+0x408>
    bca0:	000c0413          	mv	s0,s8
    bca4:	d59ff06f          	j	b9fc <_vfiprintf_r+0x148>
    bca8:	04010613          	addi	a2,sp,64
    bcac:	000a8593          	mv	a1,s5
    bcb0:	000b8513          	mv	a0,s7
    bcb4:	9a8f90ef          	jal	4e5c <__sprint_r>
    bcb8:	ea050ae3          	beqz	a0,bb6c <_vfiprintf_r+0x2b8>
    bcbc:	00090d13          	mv	s10,s2
    bcc0:	00cad783          	lhu	a5,12(s5)
    bcc4:	12812403          	lw	s0,296(sp)
    bcc8:	12412483          	lw	s1,292(sp)
    bccc:	0407f793          	andi	a5,a5,64
    bcd0:	12012903          	lw	s2,288(sp)
    bcd4:	11812a03          	lw	s4,280(sp)
    bcd8:	10812c03          	lw	s8,264(sp)
    bcdc:	10412c83          	lw	s9,260(sp)
    bce0:	0fc12d83          	lw	s11,252(sp)
    bce4:	500794e3          	bnez	a5,c9ec <_vfiprintf_r+0x1138>
    bce8:	12c12083          	lw	ra,300(sp)
    bcec:	11c12983          	lw	s3,284(sp)
    bcf0:	11412a83          	lw	s5,276(sp)
    bcf4:	11012b03          	lw	s6,272(sp)
    bcf8:	10c12b83          	lw	s7,268(sp)
    bcfc:	000d0513          	mv	a0,s10
    bd00:	10012d03          	lw	s10,256(sp)
    bd04:	13010113          	addi	sp,sp,304
    bd08:	00008067          	ret
    bd0c:	04010613          	addi	a2,sp,64
    bd10:	000a8593          	mv	a1,s5
    bd14:	000b8513          	mv	a0,s7
    bd18:	03112223          	sw	a7,36(sp)
    bd1c:	03c12023          	sw	t3,32(sp)
    bd20:	01012823          	sw	a6,16(sp)
    bd24:	01f12623          	sw	t6,12(sp)
    bd28:	00512423          	sw	t0,8(sp)
    bd2c:	930f90ef          	jal	4e5c <__sprint_r>
    bd30:	f80516e3          	bnez	a0,bcbc <_vfiprintf_r+0x408>
    bd34:	04812703          	lw	a4,72(sp)
    bd38:	04412783          	lw	a5,68(sp)
    bd3c:	02412883          	lw	a7,36(sp)
    bd40:	02012e03          	lw	t3,32(sp)
    bd44:	01012803          	lw	a6,16(sp)
    bd48:	00c12f83          	lw	t6,12(sp)
    bd4c:	00812283          	lw	t0,8(sp)
    bd50:	000c0413          	mv	s0,s8
    bd54:	d95ff06f          	j	bae8 <_vfiprintf_r+0x234>
    bd58:	00013337          	lui	t1,0x13
    bd5c:	01000613          	li	a2,16
    bd60:	04412783          	lw	a5,68(sp)
    bd64:	58030313          	addi	t1,t1,1408 # 13580 <blanks.1>
    bd68:	06965e63          	bge	a2,s1,bde4 <_vfiprintf_r+0x530>
    bd6c:	00040693          	mv	a3,s0
    bd70:	01000d93          	li	s11,16
    bd74:	00700813          	li	a6,7
    bd78:	01112423          	sw	a7,8(sp)
    bd7c:	00030413          	mv	s0,t1
    bd80:	00c0006f          	j	bd8c <_vfiprintf_r+0x4d8>
    bd84:	ff048493          	addi	s1,s1,-16
    bd88:	049dd863          	bge	s11,s1,bdd8 <_vfiprintf_r+0x524>
    bd8c:	01070713          	addi	a4,a4,16
    bd90:	00178793          	addi	a5,a5,1
    bd94:	0086a023          	sw	s0,0(a3)
    bd98:	01b6a223          	sw	s11,4(a3)
    bd9c:	04e12423          	sw	a4,72(sp)
    bda0:	04f12223          	sw	a5,68(sp)
    bda4:	00868693          	addi	a3,a3,8
    bda8:	fcf85ee3          	bge	a6,a5,bd84 <_vfiprintf_r+0x4d0>
    bdac:	04010613          	addi	a2,sp,64
    bdb0:	000a8593          	mv	a1,s5
    bdb4:	000b8513          	mv	a0,s7
    bdb8:	8a4f90ef          	jal	4e5c <__sprint_r>
    bdbc:	f00510e3          	bnez	a0,bcbc <_vfiprintf_r+0x408>
    bdc0:	ff048493          	addi	s1,s1,-16
    bdc4:	04812703          	lw	a4,72(sp)
    bdc8:	04412783          	lw	a5,68(sp)
    bdcc:	000c0693          	mv	a3,s8
    bdd0:	00700813          	li	a6,7
    bdd4:	fa9dcce3          	blt	s11,s1,bd8c <_vfiprintf_r+0x4d8>
    bdd8:	00812883          	lw	a7,8(sp)
    bddc:	00040313          	mv	t1,s0
    bde0:	00068413          	mv	s0,a3
    bde4:	00970733          	add	a4,a4,s1
    bde8:	00178793          	addi	a5,a5,1
    bdec:	00642023          	sw	t1,0(s0)
    bdf0:	00942223          	sw	s1,4(s0)
    bdf4:	04e12423          	sw	a4,72(sp)
    bdf8:	04f12223          	sw	a5,68(sp)
    bdfc:	00700613          	li	a2,7
    be00:	d4f65ee3          	bge	a2,a5,bb5c <_vfiprintf_r+0x2a8>
    be04:	04010613          	addi	a2,sp,64
    be08:	000a8593          	mv	a1,s5
    be0c:	000b8513          	mv	a0,s7
    be10:	01112423          	sw	a7,8(sp)
    be14:	848f90ef          	jal	4e5c <__sprint_r>
    be18:	ea0512e3          	bnez	a0,bcbc <_vfiprintf_r+0x408>
    be1c:	04812703          	lw	a4,72(sp)
    be20:	00812883          	lw	a7,8(sp)
    be24:	d39ff06f          	j	bb5c <_vfiprintf_r+0x2a8>
    be28:	01087713          	andi	a4,a6,16
    be2c:	000d2783          	lw	a5,0(s10)
    be30:	004d0d13          	addi	s10,s10,4
    be34:	0e071c63          	bnez	a4,bf2c <_vfiprintf_r+0x678>
    be38:	04087713          	andi	a4,a6,64
    be3c:	0e070463          	beqz	a4,bf24 <_vfiprintf_r+0x670>
    be40:	01079793          	slli	a5,a5,0x10
    be44:	4107d793          	srai	a5,a5,0x10
    be48:	41f7d893          	srai	a7,a5,0x1f
    be4c:	00088713          	mv	a4,a7
    be50:	d8075ae3          	bgez	a4,bbe4 <_vfiprintf_r+0x330>
    be54:	02d00613          	li	a2,45
    be58:	00f03733          	snez	a4,a5
    be5c:	411008b3          	neg	a7,a7
    be60:	02c10da3          	sb	a2,59(sp)
    be64:	40e888b3          	sub	a7,a7,a4
    be68:	40f007b3          	neg	a5,a5
    be6c:	000dc463          	bltz	s11,be74 <_vfiprintf_r+0x5c0>
    be70:	f7f87813          	andi	a6,a6,-129
    be74:	0c089ee3          	bnez	a7,c750 <_vfiprintf_r+0xe9c>
    be78:	00900713          	li	a4,9
    be7c:	0cf76ae3          	bltu	a4,a5,c750 <_vfiprintf_r+0xe9c>
    be80:	03078793          	addi	a5,a5,48
    be84:	0ff7f793          	zext.b	a5,a5
    be88:	0ef107a3          	sb	a5,239(sp)
    be8c:	000d8893          	mv	a7,s11
    be90:	01b04463          	bgtz	s11,be98 <_vfiprintf_r+0x5e4>
    be94:	00100893          	li	a7,1
    be98:	00100e13          	li	t3,1
    be9c:	0ef10493          	addi	s1,sp,239
    bea0:	03b14783          	lbu	a5,59(sp)
    bea4:	d60794e3          	bnez	a5,bc0c <_vfiprintf_r+0x358>
    bea8:	d69ff06f          	j	bc10 <_vfiprintf_r+0x35c>
    beac:	000d2483          	lw	s1,0(s10)
    beb0:	02010da3          	sb	zero,59(sp)
    beb4:	004d0d13          	addi	s10,s10,4
    beb8:	1c048ee3          	beqz	s1,c894 <_vfiprintf_r+0xfe0>
    bebc:	01012423          	sw	a6,8(sp)
    bec0:	060dc6e3          	bltz	s11,c72c <_vfiprintf_r+0xe78>
    bec4:	000d8613          	mv	a2,s11
    bec8:	00000593          	li	a1,0
    becc:	00048513          	mv	a0,s1
    bed0:	f19f90ef          	jal	5de8 <memchr>
    bed4:	00812803          	lw	a6,8(sp)
    bed8:	000d8e13          	mv	t3,s11
    bedc:	00050463          	beqz	a0,bee4 <_vfiprintf_r+0x630>
    bee0:	40950e33          	sub	t3,a0,s1
    bee4:	03b14783          	lbu	a5,59(sp)
    bee8:	fffe4893          	not	a7,t3
    beec:	41f8d893          	srai	a7,a7,0x1f
    bef0:	011e78b3          	and	a7,t3,a7
    bef4:	00000d93          	li	s11,0
    bef8:	00000293          	li	t0,0
    befc:	d00798e3          	bnez	a5,bc0c <_vfiprintf_r+0x358>
    bf00:	b9dff06f          	j	ba9c <_vfiprintf_r+0x1e8>
    bf04:	000d2783          	lw	a5,0(s10)
    bf08:	02010da3          	sb	zero,59(sp)
    bf0c:	004d0d13          	addi	s10,s10,4
    bf10:	08f10623          	sb	a5,140(sp)
    bf14:	00100893          	li	a7,1
    bf18:	00100e13          	li	t3,1
    bf1c:	08c10493          	addi	s1,sp,140
    bf20:	b75ff06f          	j	ba94 <_vfiprintf_r+0x1e0>
    bf24:	20087713          	andi	a4,a6,512
    bf28:	280716e3          	bnez	a4,c9b4 <_vfiprintf_r+0x1100>
    bf2c:	41f7d893          	srai	a7,a5,0x1f
    bf30:	00088713          	mv	a4,a7
    bf34:	cadff06f          	j	bbe0 <_vfiprintf_r+0x32c>
    bf38:	41600b33          	neg	s6,s6
    bf3c:	0009c783          	lbu	a5,0(s3)
    bf40:	00486813          	ori	a6,a6,4
    bf44:	ae1ff06f          	j	ba24 <_vfiprintf_r+0x170>
    bf48:	02b00713          	li	a4,43
    bf4c:	0009c783          	lbu	a5,0(s3)
    bf50:	02e10da3          	sb	a4,59(sp)
    bf54:	ad1ff06f          	j	ba24 <_vfiprintf_r+0x170>
    bf58:	0009c783          	lbu	a5,0(s3)
    bf5c:	08086813          	ori	a6,a6,128
    bf60:	ac5ff06f          	j	ba24 <_vfiprintf_r+0x170>
    bf64:	0009c603          	lbu	a2,0(s3)
    bf68:	02a00793          	li	a5,42
    bf6c:	00198693          	addi	a3,s3,1
    bf70:	28f602e3          	beq	a2,a5,c9f4 <_vfiprintf_r+0x1140>
    bf74:	fd060793          	addi	a5,a2,-48
    bf78:	00900713          	li	a4,9
    bf7c:	00000d93          	li	s11,0
    bf80:	00900593          	li	a1,9
    bf84:	02f76463          	bltu	a4,a5,bfac <_vfiprintf_r+0x6f8>
    bf88:	0006c603          	lbu	a2,0(a3)
    bf8c:	002d9713          	slli	a4,s11,0x2
    bf90:	01b70db3          	add	s11,a4,s11
    bf94:	001d9d93          	slli	s11,s11,0x1
    bf98:	00fd8db3          	add	s11,s11,a5
    bf9c:	fd060793          	addi	a5,a2,-48
    bfa0:	00168693          	addi	a3,a3,1
    bfa4:	fef5f2e3          	bgeu	a1,a5,bf88 <_vfiprintf_r+0x6d4>
    bfa8:	6e0dc263          	bltz	s11,c68c <_vfiprintf_r+0xdd8>
    bfac:	00068993          	mv	s3,a3
    bfb0:	a7dff06f          	j	ba2c <_vfiprintf_r+0x178>
    bfb4:	000b8513          	mv	a0,s7
    bfb8:	01012423          	sw	a6,8(sp)
    bfbc:	fa5f90ef          	jal	5f60 <_localeconv_r>
    bfc0:	00452783          	lw	a5,4(a0)
    bfc4:	00078513          	mv	a0,a5
    bfc8:	00f12e23          	sw	a5,28(sp)
    bfcc:	dc4fa0ef          	jal	6590 <strlen>
    bfd0:	00050793          	mv	a5,a0
    bfd4:	000b8513          	mv	a0,s7
    bfd8:	00f12c23          	sw	a5,24(sp)
    bfdc:	f85f90ef          	jal	5f60 <_localeconv_r>
    bfe0:	00852703          	lw	a4,8(a0)
    bfe4:	01812783          	lw	a5,24(sp)
    bfe8:	00812803          	lw	a6,8(sp)
    bfec:	00e12a23          	sw	a4,20(sp)
    bff0:	ba078ce3          	beqz	a5,bba8 <_vfiprintf_r+0x2f4>
    bff4:	01412703          	lw	a4,20(sp)
    bff8:	0009c783          	lbu	a5,0(s3)
    bffc:	a20704e3          	beqz	a4,ba24 <_vfiprintf_r+0x170>
    c000:	00074703          	lbu	a4,0(a4)
    c004:	a20700e3          	beqz	a4,ba24 <_vfiprintf_r+0x170>
    c008:	40086813          	ori	a6,a6,1024
    c00c:	a19ff06f          	j	ba24 <_vfiprintf_r+0x170>
    c010:	0009c783          	lbu	a5,0(s3)
    c014:	00186813          	ori	a6,a6,1
    c018:	a0dff06f          	j	ba24 <_vfiprintf_r+0x170>
    c01c:	03b14703          	lbu	a4,59(sp)
    c020:	0009c783          	lbu	a5,0(s3)
    c024:	a00710e3          	bnez	a4,ba24 <_vfiprintf_r+0x170>
    c028:	02000713          	li	a4,32
    c02c:	02e10da3          	sb	a4,59(sp)
    c030:	9f5ff06f          	j	ba24 <_vfiprintf_r+0x170>
    c034:	01086713          	ori	a4,a6,16
    c038:	02077793          	andi	a5,a4,32
    c03c:	5e078463          	beqz	a5,c624 <_vfiprintf_r+0xd70>
    c040:	007d0d13          	addi	s10,s10,7
    c044:	ff8d7d13          	andi	s10,s10,-8
    c048:	000d2783          	lw	a5,0(s10)
    c04c:	004d2583          	lw	a1,4(s10)
    c050:	008d0d13          	addi	s10,s10,8
    c054:	02010da3          	sb	zero,59(sp)
    c058:	bff77813          	andi	a6,a4,-1025
    c05c:	0c0dc063          	bltz	s11,c11c <_vfiprintf_r+0x868>
    c060:	00b7e633          	or	a2,a5,a1
    c064:	b7f77713          	andi	a4,a4,-1153
    c068:	7e061263          	bnez	a2,c84c <_vfiprintf_r+0xf98>
    c06c:	00080e13          	mv	t3,a6
    c070:	00000793          	li	a5,0
    c074:	00070813          	mv	a6,a4
    c078:	080d9663          	bnez	s11,c104 <_vfiprintf_r+0x850>
    c07c:	b6079ee3          	bnez	a5,bbf8 <_vfiprintf_r+0x344>
    c080:	001e7e13          	andi	t3,t3,1
    c084:	5c0e0c63          	beqz	t3,c65c <_vfiprintf_r+0xda8>
    c088:	03000793          	li	a5,48
    c08c:	0ef107a3          	sb	a5,239(sp)
    c090:	000e0893          	mv	a7,t3
    c094:	0ef10493          	addi	s1,sp,239
    c098:	e09ff06f          	j	bea0 <_vfiprintf_r+0x5ec>
    c09c:	0009c783          	lbu	a5,0(s3)
    c0a0:	06c00713          	li	a4,108
    c0a4:	7ce78863          	beq	a5,a4,c874 <_vfiprintf_r+0xfc0>
    c0a8:	01086813          	ori	a6,a6,16
    c0ac:	979ff06f          	j	ba24 <_vfiprintf_r+0x170>
    c0b0:	0009c783          	lbu	a5,0(s3)
    c0b4:	06800713          	li	a4,104
    c0b8:	7ae78663          	beq	a5,a4,c864 <_vfiprintf_r+0xfb0>
    c0bc:	04086813          	ori	a6,a6,64
    c0c0:	965ff06f          	j	ba24 <_vfiprintf_r+0x170>
    c0c4:	01086e13          	ori	t3,a6,16
    c0c8:	020e7793          	andi	a5,t3,32
    c0cc:	52078863          	beqz	a5,c5fc <_vfiprintf_r+0xd48>
    c0d0:	007d0d13          	addi	s10,s10,7
    c0d4:	ff8d7d13          	andi	s10,s10,-8
    c0d8:	000d2783          	lw	a5,0(s10)
    c0dc:	004d2883          	lw	a7,4(s10)
    c0e0:	008d0d13          	addi	s10,s10,8
    c0e4:	02010da3          	sb	zero,59(sp)
    c0e8:	000e0813          	mv	a6,t3
    c0ec:	d80dc4e3          	bltz	s11,be74 <_vfiprintf_r+0x5c0>
    c0f0:	0117e733          	or	a4,a5,a7
    c0f4:	f7fe7813          	andi	a6,t3,-129
    c0f8:	d6071ee3          	bnez	a4,be74 <_vfiprintf_r+0x5c0>
    c0fc:	00100793          	li	a5,1
    c100:	f60d8ee3          	beqz	s11,c07c <_vfiprintf_r+0x7c8>
    c104:	00100713          	li	a4,1
    c108:	0ce78ee3          	beq	a5,a4,c9e4 <_vfiprintf_r+0x1130>
    c10c:	00200713          	li	a4,2
    c110:	7ae78863          	beq	a5,a4,c8c0 <_vfiprintf_r+0x100c>
    c114:	00000793          	li	a5,0
    c118:	00000593          	li	a1,0
    c11c:	0f010493          	addi	s1,sp,240
    c120:	01d59693          	slli	a3,a1,0x1d
    c124:	0077f713          	andi	a4,a5,7
    c128:	0037d793          	srli	a5,a5,0x3
    c12c:	03070713          	addi	a4,a4,48
    c130:	00f6e7b3          	or	a5,a3,a5
    c134:	0035d593          	srli	a1,a1,0x3
    c138:	fee48fa3          	sb	a4,-1(s1)
    c13c:	00b7e6b3          	or	a3,a5,a1
    c140:	00048513          	mv	a0,s1
    c144:	fff48493          	addi	s1,s1,-1
    c148:	fc069ce3          	bnez	a3,c120 <_vfiprintf_r+0x86c>
    c14c:	00187793          	andi	a5,a6,1
    c150:	32078263          	beqz	a5,c474 <_vfiprintf_r+0xbc0>
    c154:	03000793          	li	a5,48
    c158:	30f70e63          	beq	a4,a5,c474 <_vfiprintf_r+0xbc0>
    c15c:	ffe50513          	addi	a0,a0,-2
    c160:	fef48fa3          	sb	a5,-1(s1)
    c164:	0f010793          	addi	a5,sp,240
    c168:	40a78e33          	sub	t3,a5,a0
    c16c:	000d8893          	mv	a7,s11
    c170:	51cdc863          	blt	s11,t3,c680 <_vfiprintf_r+0xdcc>
    c174:	00050493          	mv	s1,a0
    c178:	d29ff06f          	j	bea0 <_vfiprintf_r+0x5ec>
    c17c:	00008737          	lui	a4,0x8
    c180:	83070713          	addi	a4,a4,-2000 # 7830 <__gdtoa+0x898>
    c184:	02e11e23          	sh	a4,60(sp)
    c188:	4f018713          	addi	a4,gp,1264 # 12e00 <keypad_map+0x140>
    c18c:	000d2783          	lw	a5,0(s10)
    c190:	00000593          	li	a1,0
    c194:	00286813          	ori	a6,a6,2
    c198:	004d0d13          	addi	s10,s10,4
    c19c:	00e12223          	sw	a4,4(sp)
    c1a0:	02010da3          	sb	zero,59(sp)
    c1a4:	280dce63          	bltz	s11,c440 <_vfiprintf_r+0xb8c>
    c1a8:	00b7e733          	or	a4,a5,a1
    c1ac:	f7f87613          	andi	a2,a6,-129
    c1b0:	28071263          	bnez	a4,c434 <_vfiprintf_r+0xb80>
    c1b4:	00080e13          	mv	t3,a6
    c1b8:	00200793          	li	a5,2
    c1bc:	00060813          	mv	a6,a2
    c1c0:	eb9ff06f          	j	c078 <_vfiprintf_r+0x7c4>
    c1c4:	02087793          	andi	a5,a6,32
    c1c8:	4a079063          	bnez	a5,c668 <_vfiprintf_r+0xdb4>
    c1cc:	01087793          	andi	a5,a6,16
    c1d0:	6a079a63          	bnez	a5,c884 <_vfiprintf_r+0xfd0>
    c1d4:	04087793          	andi	a5,a6,64
    c1d8:	7e079863          	bnez	a5,c9c8 <_vfiprintf_r+0x1114>
    c1dc:	20087813          	andi	a6,a6,512
    c1e0:	6a080263          	beqz	a6,c884 <_vfiprintf_r+0xfd0>
    c1e4:	000d2783          	lw	a5,0(s10)
    c1e8:	004d0d13          	addi	s10,s10,4
    c1ec:	01278023          	sb	s2,0(a5)
    c1f0:	fb8ff06f          	j	b9a8 <_vfiprintf_r+0xf4>
    c1f4:	411b0333          	sub	t1,s6,a7
    c1f8:	926054e3          	blez	t1,bb20 <_vfiprintf_r+0x26c>
    c1fc:	00013f37          	lui	t5,0x13
    c200:	01000613          	li	a2,16
    c204:	570f0f13          	addi	t5,t5,1392 # 13570 <zeroes.0>
    c208:	0a665063          	bge	a2,t1,c2a8 <_vfiprintf_r+0x9f4>
    c20c:	00912423          	sw	s1,8(sp)
    c210:	00040693          	mv	a3,s0
    c214:	01000e93          	li	t4,16
    c218:	00700f93          	li	t6,7
    c21c:	01012623          	sw	a6,12(sp)
    c220:	01c12823          	sw	t3,16(sp)
    c224:	00030413          	mv	s0,t1
    c228:	03112023          	sw	a7,32(sp)
    c22c:	000f0493          	mv	s1,t5
    c230:	00c0006f          	j	c23c <_vfiprintf_r+0x988>
    c234:	ff040413          	addi	s0,s0,-16
    c238:	048eda63          	bge	t4,s0,c28c <_vfiprintf_r+0x9d8>
    c23c:	01070713          	addi	a4,a4,16
    c240:	00178793          	addi	a5,a5,1
    c244:	0096a023          	sw	s1,0(a3)
    c248:	01d6a223          	sw	t4,4(a3)
    c24c:	04e12423          	sw	a4,72(sp)
    c250:	04f12223          	sw	a5,68(sp)
    c254:	00868693          	addi	a3,a3,8
    c258:	fcffdee3          	bge	t6,a5,c234 <_vfiprintf_r+0x980>
    c25c:	04010613          	addi	a2,sp,64
    c260:	000a8593          	mv	a1,s5
    c264:	000b8513          	mv	a0,s7
    c268:	bf5f80ef          	jal	4e5c <__sprint_r>
    c26c:	a40518e3          	bnez	a0,bcbc <_vfiprintf_r+0x408>
    c270:	01000e93          	li	t4,16
    c274:	ff040413          	addi	s0,s0,-16
    c278:	04812703          	lw	a4,72(sp)
    c27c:	04412783          	lw	a5,68(sp)
    c280:	000c0693          	mv	a3,s8
    c284:	00700f93          	li	t6,7
    c288:	fa8ecae3          	blt	t4,s0,c23c <_vfiprintf_r+0x988>
    c28c:	00048f13          	mv	t5,s1
    c290:	00c12803          	lw	a6,12(sp)
    c294:	01012e03          	lw	t3,16(sp)
    c298:	02012883          	lw	a7,32(sp)
    c29c:	00812483          	lw	s1,8(sp)
    c2a0:	00040313          	mv	t1,s0
    c2a4:	00068413          	mv	s0,a3
    c2a8:	00670733          	add	a4,a4,t1
    c2ac:	00178793          	addi	a5,a5,1
    c2b0:	01e42023          	sw	t5,0(s0)
    c2b4:	00642223          	sw	t1,4(s0)
    c2b8:	04e12423          	sw	a4,72(sp)
    c2bc:	04f12223          	sw	a5,68(sp)
    c2c0:	00700613          	li	a2,7
    c2c4:	00840413          	addi	s0,s0,8
    c2c8:	84f65ce3          	bge	a2,a5,bb20 <_vfiprintf_r+0x26c>
    c2cc:	04010613          	addi	a2,sp,64
    c2d0:	000a8593          	mv	a1,s5
    c2d4:	000b8513          	mv	a0,s7
    c2d8:	01112823          	sw	a7,16(sp)
    c2dc:	01c12623          	sw	t3,12(sp)
    c2e0:	01012423          	sw	a6,8(sp)
    c2e4:	b79f80ef          	jal	4e5c <__sprint_r>
    c2e8:	9c051ae3          	bnez	a0,bcbc <_vfiprintf_r+0x408>
    c2ec:	00c12e03          	lw	t3,12(sp)
    c2f0:	04812703          	lw	a4,72(sp)
    c2f4:	04412783          	lw	a5,68(sp)
    c2f8:	41cd8db3          	sub	s11,s11,t3
    c2fc:	01012883          	lw	a7,16(sp)
    c300:	00812803          	lw	a6,8(sp)
    c304:	000c0413          	mv	s0,s8
    c308:	83b050e3          	blez	s11,bb28 <_vfiprintf_r+0x274>
    c30c:	00013f37          	lui	t5,0x13
    c310:	570f0f13          	addi	t5,t5,1392 # 13570 <zeroes.0>
    c314:	09ba5863          	bge	s4,s11,c3a4 <_vfiprintf_r+0xaf0>
    c318:	00040693          	mv	a3,s0
    c31c:	00700313          	li	t1,7
    c320:	000d8413          	mv	s0,s11
    c324:	01012423          	sw	a6,8(sp)
    c328:	01c12623          	sw	t3,12(sp)
    c32c:	01112823          	sw	a7,16(sp)
    c330:	000c8d93          	mv	s11,s9
    c334:	00c0006f          	j	c340 <_vfiprintf_r+0xa8c>
    c338:	ff040413          	addi	s0,s0,-16
    c33c:	048a5863          	bge	s4,s0,c38c <_vfiprintf_r+0xad8>
    c340:	01070713          	addi	a4,a4,16
    c344:	00178793          	addi	a5,a5,1
    c348:	0196a023          	sw	s9,0(a3)
    c34c:	0146a223          	sw	s4,4(a3)
    c350:	04e12423          	sw	a4,72(sp)
    c354:	04f12223          	sw	a5,68(sp)
    c358:	00868693          	addi	a3,a3,8
    c35c:	fcf35ee3          	bge	t1,a5,c338 <_vfiprintf_r+0xa84>
    c360:	04010613          	addi	a2,sp,64
    c364:	000a8593          	mv	a1,s5
    c368:	000b8513          	mv	a0,s7
    c36c:	af1f80ef          	jal	4e5c <__sprint_r>
    c370:	940516e3          	bnez	a0,bcbc <_vfiprintf_r+0x408>
    c374:	ff040413          	addi	s0,s0,-16
    c378:	04812703          	lw	a4,72(sp)
    c37c:	04412783          	lw	a5,68(sp)
    c380:	000c0693          	mv	a3,s8
    c384:	00700313          	li	t1,7
    c388:	fa8a4ce3          	blt	s4,s0,c340 <_vfiprintf_r+0xa8c>
    c38c:	00812803          	lw	a6,8(sp)
    c390:	00c12e03          	lw	t3,12(sp)
    c394:	01012883          	lw	a7,16(sp)
    c398:	000d8f13          	mv	t5,s11
    c39c:	00040d93          	mv	s11,s0
    c3a0:	00068413          	mv	s0,a3
    c3a4:	01b70733          	add	a4,a4,s11
    c3a8:	00178793          	addi	a5,a5,1
    c3ac:	01e42023          	sw	t5,0(s0)
    c3b0:	01b42223          	sw	s11,4(s0)
    c3b4:	04e12423          	sw	a4,72(sp)
    c3b8:	04f12223          	sw	a5,68(sp)
    c3bc:	00700613          	li	a2,7
    c3c0:	00840413          	addi	s0,s0,8
    c3c4:	f6f65263          	bge	a2,a5,bb28 <_vfiprintf_r+0x274>
    c3c8:	04010613          	addi	a2,sp,64
    c3cc:	000a8593          	mv	a1,s5
    c3d0:	000b8513          	mv	a0,s7
    c3d4:	01112823          	sw	a7,16(sp)
    c3d8:	01c12623          	sw	t3,12(sp)
    c3dc:	01012423          	sw	a6,8(sp)
    c3e0:	a7df80ef          	jal	4e5c <__sprint_r>
    c3e4:	8c051ce3          	bnez	a0,bcbc <_vfiprintf_r+0x408>
    c3e8:	04812703          	lw	a4,72(sp)
    c3ec:	04412783          	lw	a5,68(sp)
    c3f0:	01012883          	lw	a7,16(sp)
    c3f4:	00c12e03          	lw	t3,12(sp)
    c3f8:	00812803          	lw	a6,8(sp)
    c3fc:	000c0413          	mv	s0,s8
    c400:	f28ff06f          	j	bb28 <_vfiprintf_r+0x274>
    c404:	04010613          	addi	a2,sp,64
    c408:	000a8593          	mv	a1,s5
    c40c:	000b8513          	mv	a0,s7
    c410:	01112623          	sw	a7,12(sp)
    c414:	01012423          	sw	a6,8(sp)
    c418:	a45f80ef          	jal	4e5c <__sprint_r>
    c41c:	8a0510e3          	bnez	a0,bcbc <_vfiprintf_r+0x408>
    c420:	04812703          	lw	a4,72(sp)
    c424:	00c12883          	lw	a7,12(sp)
    c428:	00812803          	lw	a6,8(sp)
    c42c:	000c0413          	mv	s0,s8
    c430:	f1cff06f          	j	bb4c <_vfiprintf_r+0x298>
    c434:	00200713          	li	a4,2
    c438:	00060813          	mv	a6,a2
    c43c:	ce0700e3          	beqz	a4,c11c <_vfiprintf_r+0x868>
    c440:	00412603          	lw	a2,4(sp)
    c444:	0f010493          	addi	s1,sp,240
    c448:	00f7f713          	andi	a4,a5,15
    c44c:	00e60733          	add	a4,a2,a4
    c450:	00074683          	lbu	a3,0(a4)
    c454:	0047d793          	srli	a5,a5,0x4
    c458:	01c59713          	slli	a4,a1,0x1c
    c45c:	00f767b3          	or	a5,a4,a5
    c460:	0045d593          	srli	a1,a1,0x4
    c464:	fed48fa3          	sb	a3,-1(s1)
    c468:	00b7e733          	or	a4,a5,a1
    c46c:	fff48493          	addi	s1,s1,-1
    c470:	fc071ce3          	bnez	a4,c448 <_vfiprintf_r+0xb94>
    c474:	0f010793          	addi	a5,sp,240
    c478:	40978e33          	sub	t3,a5,s1
    c47c:	000d8893          	mv	a7,s11
    c480:	a3cdd0e3          	bge	s11,t3,bea0 <_vfiprintf_r+0x5ec>
    c484:	000e0893          	mv	a7,t3
    c488:	a19ff06f          	j	bea0 <_vfiprintf_r+0x5ec>
    c48c:	00013337          	lui	t1,0x13
    c490:	01000613          	li	a2,16
    c494:	58030313          	addi	t1,t1,1408 # 13580 <blanks.1>
    c498:	0bd65863          	bge	a2,t4,c548 <_vfiprintf_r+0xc94>
    c49c:	00912823          	sw	s1,16(sp)
    c4a0:	00040693          	mv	a3,s0
    c4a4:	01000f13          	li	t5,16
    c4a8:	00700393          	li	t2,7
    c4ac:	00512423          	sw	t0,8(sp)
    c4b0:	01f12623          	sw	t6,12(sp)
    c4b4:	03012023          	sw	a6,32(sp)
    c4b8:	03c12223          	sw	t3,36(sp)
    c4bc:	000e8413          	mv	s0,t4
    c4c0:	03112423          	sw	a7,40(sp)
    c4c4:	00030493          	mv	s1,t1
    c4c8:	00c0006f          	j	c4d4 <_vfiprintf_r+0xc20>
    c4cc:	ff040413          	addi	s0,s0,-16
    c4d0:	048f5a63          	bge	t5,s0,c524 <_vfiprintf_r+0xc70>
    c4d4:	01070713          	addi	a4,a4,16
    c4d8:	00178793          	addi	a5,a5,1
    c4dc:	0096a023          	sw	s1,0(a3)
    c4e0:	01e6a223          	sw	t5,4(a3)
    c4e4:	04e12423          	sw	a4,72(sp)
    c4e8:	04f12223          	sw	a5,68(sp)
    c4ec:	00868693          	addi	a3,a3,8
    c4f0:	fcf3dee3          	bge	t2,a5,c4cc <_vfiprintf_r+0xc18>
    c4f4:	04010613          	addi	a2,sp,64
    c4f8:	000a8593          	mv	a1,s5
    c4fc:	000b8513          	mv	a0,s7
    c500:	95df80ef          	jal	4e5c <__sprint_r>
    c504:	fa051c63          	bnez	a0,bcbc <_vfiprintf_r+0x408>
    c508:	01000f13          	li	t5,16
    c50c:	ff040413          	addi	s0,s0,-16
    c510:	04812703          	lw	a4,72(sp)
    c514:	04412783          	lw	a5,68(sp)
    c518:	000c0693          	mv	a3,s8
    c51c:	00700393          	li	t2,7
    c520:	fa8f4ae3          	blt	t5,s0,c4d4 <_vfiprintf_r+0xc20>
    c524:	00048313          	mv	t1,s1
    c528:	00812283          	lw	t0,8(sp)
    c52c:	00c12f83          	lw	t6,12(sp)
    c530:	02012803          	lw	a6,32(sp)
    c534:	02412e03          	lw	t3,36(sp)
    c538:	02812883          	lw	a7,40(sp)
    c53c:	01012483          	lw	s1,16(sp)
    c540:	00040e93          	mv	t4,s0
    c544:	00068413          	mv	s0,a3
    c548:	01d70733          	add	a4,a4,t4
    c54c:	00178793          	addi	a5,a5,1
    c550:	00642023          	sw	t1,0(s0)
    c554:	01d42223          	sw	t4,4(s0)
    c558:	04e12423          	sw	a4,72(sp)
    c55c:	04f12223          	sw	a5,68(sp)
    c560:	00700613          	li	a2,7
    c564:	00840413          	addi	s0,s0,8
    c568:	d4f65663          	bge	a2,a5,bab4 <_vfiprintf_r+0x200>
    c56c:	04010613          	addi	a2,sp,64
    c570:	000a8593          	mv	a1,s5
    c574:	000b8513          	mv	a0,s7
    c578:	03112223          	sw	a7,36(sp)
    c57c:	03c12023          	sw	t3,32(sp)
    c580:	01012823          	sw	a6,16(sp)
    c584:	01f12623          	sw	t6,12(sp)
    c588:	00512423          	sw	t0,8(sp)
    c58c:	8d1f80ef          	jal	4e5c <__sprint_r>
    c590:	f2051663          	bnez	a0,bcbc <_vfiprintf_r+0x408>
    c594:	04812703          	lw	a4,72(sp)
    c598:	04412783          	lw	a5,68(sp)
    c59c:	02412883          	lw	a7,36(sp)
    c5a0:	02012e03          	lw	t3,32(sp)
    c5a4:	01012803          	lw	a6,16(sp)
    c5a8:	00c12f83          	lw	t6,12(sp)
    c5ac:	00812283          	lw	t0,8(sp)
    c5b0:	000c0413          	mv	s0,s8
    c5b4:	d00ff06f          	j	bab4 <_vfiprintf_r+0x200>
    c5b8:	04010613          	addi	a2,sp,64
    c5bc:	000a8593          	mv	a1,s5
    c5c0:	000b8513          	mv	a0,s7
    c5c4:	03112023          	sw	a7,32(sp)
    c5c8:	01c12823          	sw	t3,16(sp)
    c5cc:	01012623          	sw	a6,12(sp)
    c5d0:	01f12423          	sw	t6,8(sp)
    c5d4:	889f80ef          	jal	4e5c <__sprint_r>
    c5d8:	ee051263          	bnez	a0,bcbc <_vfiprintf_r+0x408>
    c5dc:	04812703          	lw	a4,72(sp)
    c5e0:	04412783          	lw	a5,68(sp)
    c5e4:	02012883          	lw	a7,32(sp)
    c5e8:	01012e03          	lw	t3,16(sp)
    c5ec:	00c12803          	lw	a6,12(sp)
    c5f0:	00812f83          	lw	t6,8(sp)
    c5f4:	000c0413          	mv	s0,s8
    c5f8:	d20ff06f          	j	bb18 <_vfiprintf_r+0x264>
    c5fc:	010e7713          	andi	a4,t3,16
    c600:	000d2783          	lw	a5,0(s10)
    c604:	004d0d13          	addi	s10,s10,4
    c608:	00071a63          	bnez	a4,c61c <_vfiprintf_r+0xd68>
    c60c:	040e7713          	andi	a4,t3,64
    c610:	28070e63          	beqz	a4,c8ac <_vfiprintf_r+0xff8>
    c614:	01079793          	slli	a5,a5,0x10
    c618:	0107d793          	srli	a5,a5,0x10
    c61c:	00000893          	li	a7,0
    c620:	ac5ff06f          	j	c0e4 <_vfiprintf_r+0x830>
    c624:	01077613          	andi	a2,a4,16
    c628:	000d2783          	lw	a5,0(s10)
    c62c:	004d0d13          	addi	s10,s10,4
    c630:	02061263          	bnez	a2,c654 <_vfiprintf_r+0xda0>
    c634:	04077613          	andi	a2,a4,64
    c638:	00060a63          	beqz	a2,c64c <_vfiprintf_r+0xd98>
    c63c:	01079793          	slli	a5,a5,0x10
    c640:	0107d793          	srli	a5,a5,0x10
    c644:	00000593          	li	a1,0
    c648:	a0dff06f          	j	c054 <_vfiprintf_r+0x7a0>
    c64c:	20077613          	andi	a2,a4,512
    c650:	38061463          	bnez	a2,c9d8 <_vfiprintf_r+0x1124>
    c654:	00000593          	li	a1,0
    c658:	9fdff06f          	j	c054 <_vfiprintf_r+0x7a0>
    c65c:	00000893          	li	a7,0
    c660:	0f010493          	addi	s1,sp,240
    c664:	83dff06f          	j	bea0 <_vfiprintf_r+0x5ec>
    c668:	000d2783          	lw	a5,0(s10)
    c66c:	41f95713          	srai	a4,s2,0x1f
    c670:	004d0d13          	addi	s10,s10,4
    c674:	0127a023          	sw	s2,0(a5)
    c678:	00e7a223          	sw	a4,4(a5)
    c67c:	b2cff06f          	j	b9a8 <_vfiprintf_r+0xf4>
    c680:	000e0893          	mv	a7,t3
    c684:	00050493          	mv	s1,a0
    c688:	819ff06f          	j	bea0 <_vfiprintf_r+0x5ec>
    c68c:	fff00d93          	li	s11,-1
    c690:	00068993          	mv	s3,a3
    c694:	b98ff06f          	j	ba2c <_vfiprintf_r+0x178>
    c698:	00080e13          	mv	t3,a6
    c69c:	a2dff06f          	j	c0c8 <_vfiprintf_r+0x814>
    c6a0:	00080713          	mv	a4,a6
    c6a4:	995ff06f          	j	c038 <_vfiprintf_r+0x784>
    c6a8:	50418793          	addi	a5,gp,1284 # 12e14 <keypad_map+0x154>
    c6ac:	00f12223          	sw	a5,4(sp)
    c6b0:	02087793          	andi	a5,a6,32
    c6b4:	04078863          	beqz	a5,c704 <_vfiprintf_r+0xe50>
    c6b8:	007d0d13          	addi	s10,s10,7
    c6bc:	ff8d7d13          	andi	s10,s10,-8
    c6c0:	000d2783          	lw	a5,0(s10)
    c6c4:	004d2583          	lw	a1,4(s10)
    c6c8:	008d0d13          	addi	s10,s10,8
    c6cc:	00187713          	andi	a4,a6,1
    c6d0:	00070e63          	beqz	a4,c6ec <_vfiprintf_r+0xe38>
    c6d4:	00b7e733          	or	a4,a5,a1
    c6d8:	00070a63          	beqz	a4,c6ec <_vfiprintf_r+0xe38>
    c6dc:	03000713          	li	a4,48
    c6e0:	02e10e23          	sb	a4,60(sp)
    c6e4:	02c10ea3          	sb	a2,61(sp)
    c6e8:	00286813          	ori	a6,a6,2
    c6ec:	bff87813          	andi	a6,a6,-1025
    c6f0:	ab1ff06f          	j	c1a0 <_vfiprintf_r+0x8ec>
    c6f4:	4f018793          	addi	a5,gp,1264 # 12e00 <keypad_map+0x140>
    c6f8:	00f12223          	sw	a5,4(sp)
    c6fc:	02087793          	andi	a5,a6,32
    c700:	fa079ce3          	bnez	a5,c6b8 <_vfiprintf_r+0xe04>
    c704:	01087713          	andi	a4,a6,16
    c708:	000d2783          	lw	a5,0(s10)
    c70c:	004d0d13          	addi	s10,s10,4
    c710:	02071c63          	bnez	a4,c748 <_vfiprintf_r+0xe94>
    c714:	04087713          	andi	a4,a6,64
    c718:	02070463          	beqz	a4,c740 <_vfiprintf_r+0xe8c>
    c71c:	01079793          	slli	a5,a5,0x10
    c720:	0107d793          	srli	a5,a5,0x10
    c724:	00000593          	li	a1,0
    c728:	fa5ff06f          	j	c6cc <_vfiprintf_r+0xe18>
    c72c:	00048513          	mv	a0,s1
    c730:	e61f90ef          	jal	6590 <strlen>
    c734:	00812803          	lw	a6,8(sp)
    c738:	00050e13          	mv	t3,a0
    c73c:	fa8ff06f          	j	bee4 <_vfiprintf_r+0x630>
    c740:	20087713          	andi	a4,a6,512
    c744:	26071263          	bnez	a4,c9a8 <_vfiprintf_r+0x10f4>
    c748:	00000593          	li	a1,0
    c74c:	f81ff06f          	j	c6cc <_vfiprintf_r+0xe18>
    c750:	ccccdf37          	lui	t5,0xccccd
    c754:	ccccdfb7          	lui	t6,0xccccd
    c758:	01412283          	lw	t0,20(sp)
    c75c:	40087e13          	andi	t3,a6,1024
    c760:	00000593          	li	a1,0
    c764:	0f010513          	addi	a0,sp,240
    c768:	00500313          	li	t1,5
    c76c:	ccdf0f13          	addi	t5,t5,-819 # cccccccd <_memory_end+0xcccacccd>
    c770:	cccf8f93          	addi	t6,t6,-820 # cccccccc <_memory_end+0xcccacccc>
    c774:	0ff00e93          	li	t4,255
    c778:	0540006f          	j	c7cc <_vfiprintf_r+0xf18>
    c77c:	00f4b733          	sltu	a4,s1,a5
    c780:	00e48733          	add	a4,s1,a4
    c784:	02677733          	remu	a4,a4,t1
    c788:	40e78733          	sub	a4,a5,a4
    c78c:	00e7b633          	sltu	a2,a5,a4
    c790:	40c88633          	sub	a2,a7,a2
    c794:	03f703b3          	mul	t2,a4,t6
    c798:	03e60633          	mul	a2,a2,t5
    c79c:	03e73533          	mulhu	a0,a4,t5
    c7a0:	00760633          	add	a2,a2,t2
    c7a4:	03e70733          	mul	a4,a4,t5
    c7a8:	00a60633          	add	a2,a2,a0
    c7ac:	01f61513          	slli	a0,a2,0x1f
    c7b0:	00165613          	srli	a2,a2,0x1
    c7b4:	00175713          	srli	a4,a4,0x1
    c7b8:	00e56733          	or	a4,a0,a4
    c7bc:	1c088c63          	beqz	a7,c994 <_vfiprintf_r+0x10e0>
    c7c0:	00070793          	mv	a5,a4
    c7c4:	00060893          	mv	a7,a2
    c7c8:	00068513          	mv	a0,a3
    c7cc:	011784b3          	add	s1,a5,a7
    c7d0:	00f4b733          	sltu	a4,s1,a5
    c7d4:	00e48733          	add	a4,s1,a4
    c7d8:	02677733          	remu	a4,a4,t1
    c7dc:	fff50693          	addi	a3,a0,-1
    c7e0:	00158593          	addi	a1,a1,1
    c7e4:	40e78733          	sub	a4,a5,a4
    c7e8:	00e7b3b3          	sltu	t2,a5,a4
    c7ec:	407883b3          	sub	t2,a7,t2
    c7f0:	03e73633          	mulhu	a2,a4,t5
    c7f4:	03e383b3          	mul	t2,t2,t5
    c7f8:	03e70733          	mul	a4,a4,t5
    c7fc:	00c383b3          	add	t2,t2,a2
    c800:	01f39393          	slli	t2,t2,0x1f
    c804:	00175613          	srli	a2,a4,0x1
    c808:	00c3e633          	or	a2,t2,a2
    c80c:	00261713          	slli	a4,a2,0x2
    c810:	00c70733          	add	a4,a4,a2
    c814:	00171713          	slli	a4,a4,0x1
    c818:	40e78733          	sub	a4,a5,a4
    c81c:	03070713          	addi	a4,a4,48
    c820:	fee50fa3          	sb	a4,-1(a0)
    c824:	f40e0ce3          	beqz	t3,c77c <_vfiprintf_r+0xec8>
    c828:	0002c703          	lbu	a4,0(t0)
    c82c:	f4b718e3          	bne	a4,a1,c77c <_vfiprintf_r+0xec8>
    c830:	f5d586e3          	beq	a1,t4,c77c <_vfiprintf_r+0xec8>
    c834:	08089c63          	bnez	a7,c8cc <_vfiprintf_r+0x1018>
    c838:	00900713          	li	a4,9
    c83c:	08f76863          	bltu	a4,a5,c8cc <_vfiprintf_r+0x1018>
    c840:	00068493          	mv	s1,a3
    c844:	00512a23          	sw	t0,20(sp)
    c848:	c2dff06f          	j	c474 <_vfiprintf_r+0xbc0>
    c84c:	00070813          	mv	a6,a4
    c850:	00000713          	li	a4,0
    c854:	8c0704e3          	beqz	a4,c11c <_vfiprintf_r+0x868>
    c858:	be9ff06f          	j	c440 <_vfiprintf_r+0xb8c>
    c85c:	cb9f80ef          	jal	5514 <__sinit>
    c860:	88cff06f          	j	b8ec <_vfiprintf_r+0x38>
    c864:	0019c783          	lbu	a5,1(s3)
    c868:	20086813          	ori	a6,a6,512
    c86c:	00198993          	addi	s3,s3,1
    c870:	9b4ff06f          	j	ba24 <_vfiprintf_r+0x170>
    c874:	0019c783          	lbu	a5,1(s3)
    c878:	02086813          	ori	a6,a6,32
    c87c:	00198993          	addi	s3,s3,1
    c880:	9a4ff06f          	j	ba24 <_vfiprintf_r+0x170>
    c884:	000d2783          	lw	a5,0(s10)
    c888:	004d0d13          	addi	s10,s10,4
    c88c:	0127a023          	sw	s2,0(a5)
    c890:	918ff06f          	j	b9a8 <_vfiprintf_r+0xf4>
    c894:	00600793          	li	a5,6
    c898:	000d8e13          	mv	t3,s11
    c89c:	11b7e263          	bltu	a5,s11,c9a0 <_vfiprintf_r+0x10ec>
    c8a0:	000e0893          	mv	a7,t3
    c8a4:	51818493          	addi	s1,gp,1304 # 12e28 <keypad_map+0x168>
    c8a8:	9ecff06f          	j	ba94 <_vfiprintf_r+0x1e0>
    c8ac:	200e7713          	andi	a4,t3,512
    c8b0:	d60706e3          	beqz	a4,c61c <_vfiprintf_r+0xd68>
    c8b4:	0ff7f793          	zext.b	a5,a5
    c8b8:	00000893          	li	a7,0
    c8bc:	829ff06f          	j	c0e4 <_vfiprintf_r+0x830>
    c8c0:	00000793          	li	a5,0
    c8c4:	00000593          	li	a1,0
    c8c8:	b79ff06f          	j	c440 <_vfiprintf_r+0xb8c>
    c8cc:	02f12423          	sw	a5,40(sp)
    c8d0:	01812783          	lw	a5,24(sp)
    c8d4:	01c12583          	lw	a1,28(sp)
    c8d8:	03112623          	sw	a7,44(sp)
    c8dc:	40f686b3          	sub	a3,a3,a5
    c8e0:	00078613          	mv	a2,a5
    c8e4:	00068513          	mv	a0,a3
    c8e8:	03f12223          	sw	t6,36(sp)
    c8ec:	03e12023          	sw	t5,32(sp)
    c8f0:	01c12a23          	sw	t3,20(sp)
    c8f4:	01012823          	sw	a6,16(sp)
    c8f8:	00512623          	sw	t0,12(sp)
    c8fc:	00d12423          	sw	a3,8(sp)
    c900:	dacf90ef          	jal	5eac <strncpy>
    c904:	02812783          	lw	a5,40(sp)
    c908:	00500613          	li	a2,5
    c90c:	00c12283          	lw	t0,12(sp)
    c910:	00f4b733          	sltu	a4,s1,a5
    c914:	00e48733          	add	a4,s1,a4
    c918:	02c77733          	remu	a4,a4,a2
    c91c:	0012c603          	lbu	a2,1(t0)
    c920:	02c12883          	lw	a7,44(sp)
    c924:	ccccd537          	lui	a0,0xccccd
    c928:	00c03633          	snez	a2,a2
    c92c:	ccccd3b7          	lui	t2,0xccccd
    c930:	00c282b3          	add	t0,t0,a2
    c934:	ccd50513          	addi	a0,a0,-819 # cccccccd <_memory_end+0xcccacccd>
    c938:	ccc38393          	addi	t2,t2,-820 # cccccccc <_memory_end+0xcccacccc>
    c93c:	00812683          	lw	a3,8(sp)
    c940:	01012803          	lw	a6,16(sp)
    c944:	01412e03          	lw	t3,20(sp)
    c948:	02012f03          	lw	t5,32(sp)
    c94c:	02412f83          	lw	t6,36(sp)
    c950:	00000593          	li	a1,0
    c954:	00500313          	li	t1,5
    c958:	0ff00e93          	li	t4,255
    c95c:	40e78733          	sub	a4,a5,a4
    c960:	00e7b633          	sltu	a2,a5,a4
    c964:	40c88633          	sub	a2,a7,a2
    c968:	027703b3          	mul	t2,a4,t2
    c96c:	02a60633          	mul	a2,a2,a0
    c970:	02a738b3          	mulhu	a7,a4,a0
    c974:	00760633          	add	a2,a2,t2
    c978:	02a707b3          	mul	a5,a4,a0
    c97c:	01160633          	add	a2,a2,a7
    c980:	01f61713          	slli	a4,a2,0x1f
    c984:	00165613          	srli	a2,a2,0x1
    c988:	0017d793          	srli	a5,a5,0x1
    c98c:	00f76733          	or	a4,a4,a5
    c990:	e31ff06f          	j	c7c0 <_vfiprintf_r+0xf0c>
    c994:	00900513          	li	a0,9
    c998:	e2f564e3          	bltu	a0,a5,c7c0 <_vfiprintf_r+0xf0c>
    c99c:	ea5ff06f          	j	c840 <_vfiprintf_r+0xf8c>
    c9a0:	00600e13          	li	t3,6
    c9a4:	efdff06f          	j	c8a0 <_vfiprintf_r+0xfec>
    c9a8:	0ff7f793          	zext.b	a5,a5
    c9ac:	00000593          	li	a1,0
    c9b0:	d1dff06f          	j	c6cc <_vfiprintf_r+0xe18>
    c9b4:	01879793          	slli	a5,a5,0x18
    c9b8:	4187d793          	srai	a5,a5,0x18
    c9bc:	41f7d893          	srai	a7,a5,0x1f
    c9c0:	00088713          	mv	a4,a7
    c9c4:	a1cff06f          	j	bbe0 <_vfiprintf_r+0x32c>
    c9c8:	000d2783          	lw	a5,0(s10)
    c9cc:	004d0d13          	addi	s10,s10,4
    c9d0:	01279023          	sh	s2,0(a5)
    c9d4:	fd5fe06f          	j	b9a8 <_vfiprintf_r+0xf4>
    c9d8:	0ff7f793          	zext.b	a5,a5
    c9dc:	00000593          	li	a1,0
    c9e0:	e74ff06f          	j	c054 <_vfiprintf_r+0x7a0>
    c9e4:	03000793          	li	a5,48
    c9e8:	ca0ff06f          	j	be88 <_vfiprintf_r+0x5d4>
    c9ec:	fff00d13          	li	s10,-1
    c9f0:	af8ff06f          	j	bce8 <_vfiprintf_r+0x434>
    c9f4:	000d2d83          	lw	s11,0(s10)
    c9f8:	004d0d13          	addi	s10,s10,4
    c9fc:	000dd463          	bgez	s11,ca04 <_vfiprintf_r+0x1150>
    ca00:	fff00d93          	li	s11,-1
    ca04:	0019c783          	lbu	a5,1(s3)
    ca08:	00068993          	mv	s3,a3
    ca0c:	818ff06f          	j	ba24 <_vfiprintf_r+0x170>

0000ca10 <vfiprintf>:
    ca10:	00014737          	lui	a4,0x14
    ca14:	00050793          	mv	a5,a0
    ca18:	e3472503          	lw	a0,-460(a4) # 13e34 <_impure_ptr>
    ca1c:	00060693          	mv	a3,a2
    ca20:	00058613          	mv	a2,a1
    ca24:	00078593          	mv	a1,a5
    ca28:	e8dfe06f          	j	b8b4 <_vfiprintf_r>

0000ca2c <__sbprintf>:
    ca2c:	b8010113          	addi	sp,sp,-1152
    ca30:	00c59783          	lh	a5,12(a1)
    ca34:	00e5d703          	lhu	a4,14(a1)
    ca38:	46812c23          	sw	s0,1144(sp)
    ca3c:	00058413          	mv	s0,a1
    ca40:	000105b7          	lui	a1,0x10
    ca44:	ffd58593          	addi	a1,a1,-3 # fffd <__multf3+0xc05>
    ca48:	06442e03          	lw	t3,100(s0)
    ca4c:	01c42303          	lw	t1,28(s0)
    ca50:	02442883          	lw	a7,36(s0)
    ca54:	01071713          	slli	a4,a4,0x10
    ca58:	00b7f7b3          	and	a5,a5,a1
    ca5c:	00e7e7b3          	or	a5,a5,a4
    ca60:	40000813          	li	a6,1024
    ca64:	00f12a23          	sw	a5,20(sp)
    ca68:	00810593          	addi	a1,sp,8
    ca6c:	07010793          	addi	a5,sp,112
    ca70:	46912a23          	sw	s1,1140(sp)
    ca74:	47212823          	sw	s2,1136(sp)
    ca78:	46112e23          	sw	ra,1148(sp)
    ca7c:	00050913          	mv	s2,a0
    ca80:	07c12623          	sw	t3,108(sp)
    ca84:	02612223          	sw	t1,36(sp)
    ca88:	03112623          	sw	a7,44(sp)
    ca8c:	00f12423          	sw	a5,8(sp)
    ca90:	00f12c23          	sw	a5,24(sp)
    ca94:	01012823          	sw	a6,16(sp)
    ca98:	01012e23          	sw	a6,28(sp)
    ca9c:	02012023          	sw	zero,32(sp)
    caa0:	e15fe0ef          	jal	b8b4 <_vfiprintf_r>
    caa4:	00050493          	mv	s1,a0
    caa8:	02055c63          	bgez	a0,cae0 <__sbprintf+0xb4>
    caac:	01415783          	lhu	a5,20(sp)
    cab0:	0407f793          	andi	a5,a5,64
    cab4:	00078863          	beqz	a5,cac4 <__sbprintf+0x98>
    cab8:	00c45783          	lhu	a5,12(s0)
    cabc:	0407e793          	ori	a5,a5,64
    cac0:	00f41623          	sh	a5,12(s0)
    cac4:	47c12083          	lw	ra,1148(sp)
    cac8:	47812403          	lw	s0,1144(sp)
    cacc:	47012903          	lw	s2,1136(sp)
    cad0:	00048513          	mv	a0,s1
    cad4:	47412483          	lw	s1,1140(sp)
    cad8:	48010113          	addi	sp,sp,1152
    cadc:	00008067          	ret
    cae0:	00810593          	addi	a1,sp,8
    cae4:	00090513          	mv	a0,s2
    cae8:	e0cf80ef          	jal	50f4 <_fflush_r>
    caec:	fc0500e3          	beqz	a0,caac <__sbprintf+0x80>
    caf0:	fff00493          	li	s1,-1
    caf4:	fb9ff06f          	j	caac <__sbprintf+0x80>

0000caf8 <__errno>:
    caf8:	000147b7          	lui	a5,0x14
    cafc:	e347a503          	lw	a0,-460(a5) # 13e34 <_impure_ptr>
    cb00:	00008067          	ret

0000cb04 <abort>:
    cb04:	ff010113          	addi	sp,sp,-16
    cb08:	00600513          	li	a0,6
    cb0c:	00112623          	sw	ra,12(sp)
    cb10:	2a8000ef          	jal	cdb8 <raise>
    cb14:	00100513          	li	a0,1
    cb18:	909f50ef          	jal	2420 <_exit>

0000cb1c <_init_signal_r>:
    cb1c:	11852783          	lw	a5,280(a0)
    cb20:	00078663          	beqz	a5,cb2c <_init_signal_r+0x10>
    cb24:	00000513          	li	a0,0
    cb28:	00008067          	ret
    cb2c:	ff010113          	addi	sp,sp,-16
    cb30:	08000593          	li	a1,128
    cb34:	00812423          	sw	s0,8(sp)
    cb38:	00112623          	sw	ra,12(sp)
    cb3c:	00050413          	mv	s0,a0
    cb40:	cbcfc0ef          	jal	8ffc <_malloc_r>
    cb44:	10a42c23          	sw	a0,280(s0)
    cb48:	02050463          	beqz	a0,cb70 <_init_signal_r+0x54>
    cb4c:	08050793          	addi	a5,a0,128
    cb50:	00052023          	sw	zero,0(a0)
    cb54:	00450513          	addi	a0,a0,4
    cb58:	fef51ce3          	bne	a0,a5,cb50 <_init_signal_r+0x34>
    cb5c:	00000513          	li	a0,0
    cb60:	00c12083          	lw	ra,12(sp)
    cb64:	00812403          	lw	s0,8(sp)
    cb68:	01010113          	addi	sp,sp,16
    cb6c:	00008067          	ret
    cb70:	fff00513          	li	a0,-1
    cb74:	fedff06f          	j	cb60 <_init_signal_r+0x44>

0000cb78 <_signal_r>:
    cb78:	fe010113          	addi	sp,sp,-32
    cb7c:	00912a23          	sw	s1,20(sp)
    cb80:	00112e23          	sw	ra,28(sp)
    cb84:	01f00793          	li	a5,31
    cb88:	00050493          	mv	s1,a0
    cb8c:	02b7ec63          	bltu	a5,a1,cbc4 <_signal_r+0x4c>
    cb90:	11852783          	lw	a5,280(a0)
    cb94:	00812c23          	sw	s0,24(sp)
    cb98:	00058413          	mv	s0,a1
    cb9c:	02078c63          	beqz	a5,cbd4 <_signal_r+0x5c>
    cba0:	00241413          	slli	s0,s0,0x2
    cba4:	008787b3          	add	a5,a5,s0
    cba8:	01812403          	lw	s0,24(sp)
    cbac:	0007a503          	lw	a0,0(a5)
    cbb0:	00c7a023          	sw	a2,0(a5)
    cbb4:	01c12083          	lw	ra,28(sp)
    cbb8:	01412483          	lw	s1,20(sp)
    cbbc:	02010113          	addi	sp,sp,32
    cbc0:	00008067          	ret
    cbc4:	01600793          	li	a5,22
    cbc8:	00f52023          	sw	a5,0(a0)
    cbcc:	fff00513          	li	a0,-1
    cbd0:	fe5ff06f          	j	cbb4 <_signal_r+0x3c>
    cbd4:	08000593          	li	a1,128
    cbd8:	00c12623          	sw	a2,12(sp)
    cbdc:	c20fc0ef          	jal	8ffc <_malloc_r>
    cbe0:	10a4ac23          	sw	a0,280(s1)
    cbe4:	00c12603          	lw	a2,12(sp)
    cbe8:	00050793          	mv	a5,a0
    cbec:	00050713          	mv	a4,a0
    cbf0:	08050693          	addi	a3,a0,128
    cbf4:	00050a63          	beqz	a0,cc08 <_signal_r+0x90>
    cbf8:	00072023          	sw	zero,0(a4)
    cbfc:	00470713          	addi	a4,a4,4
    cc00:	fed71ce3          	bne	a4,a3,cbf8 <_signal_r+0x80>
    cc04:	f9dff06f          	j	cba0 <_signal_r+0x28>
    cc08:	01812403          	lw	s0,24(sp)
    cc0c:	fff00513          	li	a0,-1
    cc10:	fa5ff06f          	j	cbb4 <_signal_r+0x3c>

0000cc14 <_raise_r>:
    cc14:	ff010113          	addi	sp,sp,-16
    cc18:	00912223          	sw	s1,4(sp)
    cc1c:	00112623          	sw	ra,12(sp)
    cc20:	01f00793          	li	a5,31
    cc24:	00050493          	mv	s1,a0
    cc28:	0ab7e063          	bltu	a5,a1,ccc8 <_raise_r+0xb4>
    cc2c:	11852783          	lw	a5,280(a0)
    cc30:	00812423          	sw	s0,8(sp)
    cc34:	00058413          	mv	s0,a1
    cc38:	04078463          	beqz	a5,cc80 <_raise_r+0x6c>
    cc3c:	00259713          	slli	a4,a1,0x2
    cc40:	00e787b3          	add	a5,a5,a4
    cc44:	0007a703          	lw	a4,0(a5)
    cc48:	02070c63          	beqz	a4,cc80 <_raise_r+0x6c>
    cc4c:	00100693          	li	a3,1
    cc50:	00d70c63          	beq	a4,a3,cc68 <_raise_r+0x54>
    cc54:	fff00693          	li	a3,-1
    cc58:	04d70863          	beq	a4,a3,cca8 <_raise_r+0x94>
    cc5c:	0007a023          	sw	zero,0(a5)
    cc60:	00058513          	mv	a0,a1
    cc64:	000700e7          	jalr	a4
    cc68:	00812403          	lw	s0,8(sp)
    cc6c:	00000513          	li	a0,0
    cc70:	00c12083          	lw	ra,12(sp)
    cc74:	00412483          	lw	s1,4(sp)
    cc78:	01010113          	addi	sp,sp,16
    cc7c:	00008067          	ret
    cc80:	00048513          	mv	a0,s1
    cc84:	450000ef          	jal	d0d4 <_getpid_r>
    cc88:	00040613          	mv	a2,s0
    cc8c:	00812403          	lw	s0,8(sp)
    cc90:	00c12083          	lw	ra,12(sp)
    cc94:	00050593          	mv	a1,a0
    cc98:	00048513          	mv	a0,s1
    cc9c:	00412483          	lw	s1,4(sp)
    cca0:	01010113          	addi	sp,sp,16
    cca4:	3c80006f          	j	d06c <_kill_r>
    cca8:	00812403          	lw	s0,8(sp)
    ccac:	00c12083          	lw	ra,12(sp)
    ccb0:	01600793          	li	a5,22
    ccb4:	00f52023          	sw	a5,0(a0)
    ccb8:	00412483          	lw	s1,4(sp)
    ccbc:	00100513          	li	a0,1
    ccc0:	01010113          	addi	sp,sp,16
    ccc4:	00008067          	ret
    ccc8:	01600793          	li	a5,22
    cccc:	00f52023          	sw	a5,0(a0)
    ccd0:	fff00513          	li	a0,-1
    ccd4:	f9dff06f          	j	cc70 <_raise_r+0x5c>

0000ccd8 <__sigtramp_r>:
    ccd8:	01f00793          	li	a5,31
    ccdc:	0cb7ea63          	bltu	a5,a1,cdb0 <__sigtramp_r+0xd8>
    cce0:	11852783          	lw	a5,280(a0)
    cce4:	ff010113          	addi	sp,sp,-16
    cce8:	00812423          	sw	s0,8(sp)
    ccec:	00912223          	sw	s1,4(sp)
    ccf0:	00112623          	sw	ra,12(sp)
    ccf4:	00058413          	mv	s0,a1
    ccf8:	00050493          	mv	s1,a0
    ccfc:	08078063          	beqz	a5,cd7c <__sigtramp_r+0xa4>
    cd00:	00241713          	slli	a4,s0,0x2
    cd04:	00e787b3          	add	a5,a5,a4
    cd08:	0007a703          	lw	a4,0(a5)
    cd0c:	02070c63          	beqz	a4,cd44 <__sigtramp_r+0x6c>
    cd10:	fff00693          	li	a3,-1
    cd14:	06d70063          	beq	a4,a3,cd74 <__sigtramp_r+0x9c>
    cd18:	00100693          	li	a3,1
    cd1c:	04d70063          	beq	a4,a3,cd5c <__sigtramp_r+0x84>
    cd20:	00040513          	mv	a0,s0
    cd24:	0007a023          	sw	zero,0(a5)
    cd28:	000700e7          	jalr	a4
    cd2c:	00000513          	li	a0,0
    cd30:	00c12083          	lw	ra,12(sp)
    cd34:	00812403          	lw	s0,8(sp)
    cd38:	00412483          	lw	s1,4(sp)
    cd3c:	01010113          	addi	sp,sp,16
    cd40:	00008067          	ret
    cd44:	00c12083          	lw	ra,12(sp)
    cd48:	00812403          	lw	s0,8(sp)
    cd4c:	00412483          	lw	s1,4(sp)
    cd50:	00100513          	li	a0,1
    cd54:	01010113          	addi	sp,sp,16
    cd58:	00008067          	ret
    cd5c:	00c12083          	lw	ra,12(sp)
    cd60:	00812403          	lw	s0,8(sp)
    cd64:	00412483          	lw	s1,4(sp)
    cd68:	00300513          	li	a0,3
    cd6c:	01010113          	addi	sp,sp,16
    cd70:	00008067          	ret
    cd74:	00200513          	li	a0,2
    cd78:	fb9ff06f          	j	cd30 <__sigtramp_r+0x58>
    cd7c:	08000593          	li	a1,128
    cd80:	a7cfc0ef          	jal	8ffc <_malloc_r>
    cd84:	10a4ac23          	sw	a0,280(s1)
    cd88:	00050793          	mv	a5,a0
    cd8c:	00050e63          	beqz	a0,cda8 <__sigtramp_r+0xd0>
    cd90:	00050713          	mv	a4,a0
    cd94:	08050693          	addi	a3,a0,128
    cd98:	00072023          	sw	zero,0(a4)
    cd9c:	00470713          	addi	a4,a4,4
    cda0:	fed71ce3          	bne	a4,a3,cd98 <__sigtramp_r+0xc0>
    cda4:	f5dff06f          	j	cd00 <__sigtramp_r+0x28>
    cda8:	fff00513          	li	a0,-1
    cdac:	f85ff06f          	j	cd30 <__sigtramp_r+0x58>
    cdb0:	fff00513          	li	a0,-1
    cdb4:	00008067          	ret

0000cdb8 <raise>:
    cdb8:	ff010113          	addi	sp,sp,-16
    cdbc:	00912223          	sw	s1,4(sp)
    cdc0:	00014737          	lui	a4,0x14
    cdc4:	00112623          	sw	ra,12(sp)
    cdc8:	01f00793          	li	a5,31
    cdcc:	e3472483          	lw	s1,-460(a4) # 13e34 <_impure_ptr>
    cdd0:	08a7ee63          	bltu	a5,a0,ce6c <raise+0xb4>
    cdd4:	1184a783          	lw	a5,280(s1)
    cdd8:	00812423          	sw	s0,8(sp)
    cddc:	00050413          	mv	s0,a0
    cde0:	04078263          	beqz	a5,ce24 <raise+0x6c>
    cde4:	00251713          	slli	a4,a0,0x2
    cde8:	00e787b3          	add	a5,a5,a4
    cdec:	0007a703          	lw	a4,0(a5)
    cdf0:	02070a63          	beqz	a4,ce24 <raise+0x6c>
    cdf4:	00100693          	li	a3,1
    cdf8:	00d70a63          	beq	a4,a3,ce0c <raise+0x54>
    cdfc:	fff00693          	li	a3,-1
    ce00:	04d70663          	beq	a4,a3,ce4c <raise+0x94>
    ce04:	0007a023          	sw	zero,0(a5)
    ce08:	000700e7          	jalr	a4
    ce0c:	00812403          	lw	s0,8(sp)
    ce10:	00000513          	li	a0,0
    ce14:	00c12083          	lw	ra,12(sp)
    ce18:	00412483          	lw	s1,4(sp)
    ce1c:	01010113          	addi	sp,sp,16
    ce20:	00008067          	ret
    ce24:	00048513          	mv	a0,s1
    ce28:	2ac000ef          	jal	d0d4 <_getpid_r>
    ce2c:	00040613          	mv	a2,s0
    ce30:	00812403          	lw	s0,8(sp)
    ce34:	00c12083          	lw	ra,12(sp)
    ce38:	00050593          	mv	a1,a0
    ce3c:	00048513          	mv	a0,s1
    ce40:	00412483          	lw	s1,4(sp)
    ce44:	01010113          	addi	sp,sp,16
    ce48:	2240006f          	j	d06c <_kill_r>
    ce4c:	00812403          	lw	s0,8(sp)
    ce50:	00c12083          	lw	ra,12(sp)
    ce54:	01600793          	li	a5,22
    ce58:	00f4a023          	sw	a5,0(s1)
    ce5c:	00100513          	li	a0,1
    ce60:	00412483          	lw	s1,4(sp)
    ce64:	01010113          	addi	sp,sp,16
    ce68:	00008067          	ret
    ce6c:	01600793          	li	a5,22
    ce70:	00f4a023          	sw	a5,0(s1)
    ce74:	fff00513          	li	a0,-1
    ce78:	f9dff06f          	j	ce14 <raise+0x5c>

0000ce7c <signal>:
    ce7c:	ff010113          	addi	sp,sp,-16
    ce80:	01212023          	sw	s2,0(sp)
    ce84:	00014737          	lui	a4,0x14
    ce88:	00112623          	sw	ra,12(sp)
    ce8c:	01f00793          	li	a5,31
    ce90:	e3472903          	lw	s2,-460(a4) # 13e34 <_impure_ptr>
    ce94:	04a7e263          	bltu	a5,a0,ced8 <signal+0x5c>
    ce98:	00812423          	sw	s0,8(sp)
    ce9c:	00050413          	mv	s0,a0
    cea0:	11892503          	lw	a0,280(s2)
    cea4:	00912223          	sw	s1,4(sp)
    cea8:	00058493          	mv	s1,a1
    ceac:	02050e63          	beqz	a0,cee8 <signal+0x6c>
    ceb0:	00241413          	slli	s0,s0,0x2
    ceb4:	008507b3          	add	a5,a0,s0
    ceb8:	0007a503          	lw	a0,0(a5)
    cebc:	00812403          	lw	s0,8(sp)
    cec0:	0097a023          	sw	s1,0(a5)
    cec4:	00412483          	lw	s1,4(sp)
    cec8:	00c12083          	lw	ra,12(sp)
    cecc:	00012903          	lw	s2,0(sp)
    ced0:	01010113          	addi	sp,sp,16
    ced4:	00008067          	ret
    ced8:	01600793          	li	a5,22
    cedc:	00f92023          	sw	a5,0(s2)
    cee0:	fff00513          	li	a0,-1
    cee4:	fe5ff06f          	j	cec8 <signal+0x4c>
    cee8:	08000593          	li	a1,128
    ceec:	00090513          	mv	a0,s2
    cef0:	90cfc0ef          	jal	8ffc <_malloc_r>
    cef4:	10a92c23          	sw	a0,280(s2)
    cef8:	00050793          	mv	a5,a0
    cefc:	08050713          	addi	a4,a0,128
    cf00:	00050a63          	beqz	a0,cf14 <signal+0x98>
    cf04:	0007a023          	sw	zero,0(a5)
    cf08:	00478793          	addi	a5,a5,4
    cf0c:	fef71ce3          	bne	a4,a5,cf04 <signal+0x88>
    cf10:	fa1ff06f          	j	ceb0 <signal+0x34>
    cf14:	00812403          	lw	s0,8(sp)
    cf18:	00412483          	lw	s1,4(sp)
    cf1c:	fff00513          	li	a0,-1
    cf20:	fa9ff06f          	j	cec8 <signal+0x4c>

0000cf24 <_init_signal>:
    cf24:	ff010113          	addi	sp,sp,-16
    cf28:	000147b7          	lui	a5,0x14
    cf2c:	00812423          	sw	s0,8(sp)
    cf30:	e347a403          	lw	s0,-460(a5) # 13e34 <_impure_ptr>
    cf34:	00112623          	sw	ra,12(sp)
    cf38:	11842783          	lw	a5,280(s0)
    cf3c:	00078c63          	beqz	a5,cf54 <_init_signal+0x30>
    cf40:	00000513          	li	a0,0
    cf44:	00c12083          	lw	ra,12(sp)
    cf48:	00812403          	lw	s0,8(sp)
    cf4c:	01010113          	addi	sp,sp,16
    cf50:	00008067          	ret
    cf54:	08000593          	li	a1,128
    cf58:	00040513          	mv	a0,s0
    cf5c:	8a0fc0ef          	jal	8ffc <_malloc_r>
    cf60:	10a42c23          	sw	a0,280(s0)
    cf64:	00050c63          	beqz	a0,cf7c <_init_signal+0x58>
    cf68:	08050793          	addi	a5,a0,128
    cf6c:	00052023          	sw	zero,0(a0)
    cf70:	00450513          	addi	a0,a0,4
    cf74:	fef51ce3          	bne	a0,a5,cf6c <_init_signal+0x48>
    cf78:	fc9ff06f          	j	cf40 <_init_signal+0x1c>
    cf7c:	fff00513          	li	a0,-1
    cf80:	fc5ff06f          	j	cf44 <_init_signal+0x20>

0000cf84 <__sigtramp>:
    cf84:	ff010113          	addi	sp,sp,-16
    cf88:	00912223          	sw	s1,4(sp)
    cf8c:	00014737          	lui	a4,0x14
    cf90:	00112623          	sw	ra,12(sp)
    cf94:	01f00793          	li	a5,31
    cf98:	e3472483          	lw	s1,-460(a4) # 13e34 <_impure_ptr>
    cf9c:	0ca7e463          	bltu	a5,a0,d064 <__sigtramp+0xe0>
    cfa0:	1184a783          	lw	a5,280(s1)
    cfa4:	00812423          	sw	s0,8(sp)
    cfa8:	00050413          	mv	s0,a0
    cfac:	08078263          	beqz	a5,d030 <__sigtramp+0xac>
    cfb0:	00241713          	slli	a4,s0,0x2
    cfb4:	00e787b3          	add	a5,a5,a4
    cfb8:	0007a703          	lw	a4,0(a5)
    cfbc:	02070c63          	beqz	a4,cff4 <__sigtramp+0x70>
    cfc0:	fff00693          	li	a3,-1
    cfc4:	06d70063          	beq	a4,a3,d024 <__sigtramp+0xa0>
    cfc8:	00100693          	li	a3,1
    cfcc:	04d70063          	beq	a4,a3,d00c <__sigtramp+0x88>
    cfd0:	00040513          	mv	a0,s0
    cfd4:	0007a023          	sw	zero,0(a5)
    cfd8:	000700e7          	jalr	a4
    cfdc:	00812403          	lw	s0,8(sp)
    cfe0:	00000513          	li	a0,0
    cfe4:	00c12083          	lw	ra,12(sp)
    cfe8:	00412483          	lw	s1,4(sp)
    cfec:	01010113          	addi	sp,sp,16
    cff0:	00008067          	ret
    cff4:	00812403          	lw	s0,8(sp)
    cff8:	00c12083          	lw	ra,12(sp)
    cffc:	00412483          	lw	s1,4(sp)
    d000:	00100513          	li	a0,1
    d004:	01010113          	addi	sp,sp,16
    d008:	00008067          	ret
    d00c:	00812403          	lw	s0,8(sp)
    d010:	00c12083          	lw	ra,12(sp)
    d014:	00412483          	lw	s1,4(sp)
    d018:	00300513          	li	a0,3
    d01c:	01010113          	addi	sp,sp,16
    d020:	00008067          	ret
    d024:	00812403          	lw	s0,8(sp)
    d028:	00200513          	li	a0,2
    d02c:	fb9ff06f          	j	cfe4 <__sigtramp+0x60>
    d030:	08000593          	li	a1,128
    d034:	00048513          	mv	a0,s1
    d038:	fc5fb0ef          	jal	8ffc <_malloc_r>
    d03c:	10a4ac23          	sw	a0,280(s1)
    d040:	00050793          	mv	a5,a0
    d044:	00050e63          	beqz	a0,d060 <__sigtramp+0xdc>
    d048:	00050713          	mv	a4,a0
    d04c:	08050693          	addi	a3,a0,128
    d050:	00072023          	sw	zero,0(a4)
    d054:	00470713          	addi	a4,a4,4
    d058:	fee69ce3          	bne	a3,a4,d050 <__sigtramp+0xcc>
    d05c:	f55ff06f          	j	cfb0 <__sigtramp+0x2c>
    d060:	00812403          	lw	s0,8(sp)
    d064:	fff00513          	li	a0,-1
    d068:	f7dff06f          	j	cfe4 <__sigtramp+0x60>

0000d06c <_kill_r>:
    d06c:	ff010113          	addi	sp,sp,-16
    d070:	00058713          	mv	a4,a1
    d074:	00812423          	sw	s0,8(sp)
    d078:	00912223          	sw	s1,4(sp)
    d07c:	00050413          	mv	s0,a0
    d080:	000144b7          	lui	s1,0x14
    d084:	00060593          	mv	a1,a2
    d088:	00070513          	mv	a0,a4
    d08c:	00112623          	sw	ra,12(sp)
    d090:	fc04a423          	sw	zero,-56(s1) # 13fc8 <errno>
    d094:	ba4f50ef          	jal	2438 <_kill>
    d098:	fff00793          	li	a5,-1
    d09c:	00f50c63          	beq	a0,a5,d0b4 <_kill_r+0x48>
    d0a0:	00c12083          	lw	ra,12(sp)
    d0a4:	00812403          	lw	s0,8(sp)
    d0a8:	00412483          	lw	s1,4(sp)
    d0ac:	01010113          	addi	sp,sp,16
    d0b0:	00008067          	ret
    d0b4:	fc84a783          	lw	a5,-56(s1)
    d0b8:	fe0784e3          	beqz	a5,d0a0 <_kill_r+0x34>
    d0bc:	00c12083          	lw	ra,12(sp)
    d0c0:	00f42023          	sw	a5,0(s0)
    d0c4:	00812403          	lw	s0,8(sp)
    d0c8:	00412483          	lw	s1,4(sp)
    d0cc:	01010113          	addi	sp,sp,16
    d0d0:	00008067          	ret

0000d0d4 <_getpid_r>:
    d0d4:	b8cf506f          	j	2460 <_getpid>

0000d0d8 <__adddf3>:
    d0d8:	00100837          	lui	a6,0x100
    d0dc:	fff80813          	addi	a6,a6,-1 # fffff <_memory_end+0xdffff>
    d0e0:	fe010113          	addi	sp,sp,-32
    d0e4:	00b878b3          	and	a7,a6,a1
    d0e8:	0145d713          	srli	a4,a1,0x14
    d0ec:	01d55793          	srli	a5,a0,0x1d
    d0f0:	00d87833          	and	a6,a6,a3
    d0f4:	00912a23          	sw	s1,20(sp)
    d0f8:	7ff77493          	andi	s1,a4,2047
    d0fc:	00389713          	slli	a4,a7,0x3
    d100:	0146d893          	srli	a7,a3,0x14
    d104:	00381813          	slli	a6,a6,0x3
    d108:	01212823          	sw	s2,16(sp)
    d10c:	00e7e7b3          	or	a5,a5,a4
    d110:	7ff8f893          	andi	a7,a7,2047
    d114:	01d65713          	srli	a4,a2,0x1d
    d118:	00112e23          	sw	ra,28(sp)
    d11c:	00812c23          	sw	s0,24(sp)
    d120:	01312623          	sw	s3,12(sp)
    d124:	01f5d913          	srli	s2,a1,0x1f
    d128:	01f6d693          	srli	a3,a3,0x1f
    d12c:	01076733          	or	a4,a4,a6
    d130:	00351513          	slli	a0,a0,0x3
    d134:	00361613          	slli	a2,a2,0x3
    d138:	41148833          	sub	a6,s1,a7
    d13c:	2ad91a63          	bne	s2,a3,d3f0 <__adddf3+0x318>
    d140:	11005c63          	blez	a6,d258 <__adddf3+0x180>
    d144:	04089063          	bnez	a7,d184 <__adddf3+0xac>
    d148:	00c766b3          	or	a3,a4,a2
    d14c:	66068063          	beqz	a3,d7ac <__adddf3+0x6d4>
    d150:	fff80593          	addi	a1,a6,-1
    d154:	02059063          	bnez	a1,d174 <__adddf3+0x9c>
    d158:	00c50633          	add	a2,a0,a2
    d15c:	00a636b3          	sltu	a3,a2,a0
    d160:	00e78733          	add	a4,a5,a4
    d164:	00060513          	mv	a0,a2
    d168:	00d707b3          	add	a5,a4,a3
    d16c:	00100493          	li	s1,1
    d170:	06c0006f          	j	d1dc <__adddf3+0x104>
    d174:	7ff00693          	li	a3,2047
    d178:	02d81063          	bne	a6,a3,d198 <__adddf3+0xc0>
    d17c:	7ff00493          	li	s1,2047
    d180:	1f80006f          	j	d378 <__adddf3+0x2a0>
    d184:	7ff00693          	li	a3,2047
    d188:	1ed48863          	beq	s1,a3,d378 <__adddf3+0x2a0>
    d18c:	008006b7          	lui	a3,0x800
    d190:	00d76733          	or	a4,a4,a3
    d194:	00080593          	mv	a1,a6
    d198:	03800693          	li	a3,56
    d19c:	0ab6c863          	blt	a3,a1,d24c <__adddf3+0x174>
    d1a0:	01f00693          	li	a3,31
    d1a4:	06b6ca63          	blt	a3,a1,d218 <__adddf3+0x140>
    d1a8:	02000813          	li	a6,32
    d1ac:	40b80833          	sub	a6,a6,a1
    d1b0:	010716b3          	sll	a3,a4,a6
    d1b4:	00b658b3          	srl	a7,a2,a1
    d1b8:	01061833          	sll	a6,a2,a6
    d1bc:	0116e6b3          	or	a3,a3,a7
    d1c0:	01003833          	snez	a6,a6
    d1c4:	0106e6b3          	or	a3,a3,a6
    d1c8:	00b755b3          	srl	a1,a4,a1
    d1cc:	00a68533          	add	a0,a3,a0
    d1d0:	00f585b3          	add	a1,a1,a5
    d1d4:	00d536b3          	sltu	a3,a0,a3
    d1d8:	00d587b3          	add	a5,a1,a3
    d1dc:	00879713          	slli	a4,a5,0x8
    d1e0:	18075c63          	bgez	a4,d378 <__adddf3+0x2a0>
    d1e4:	00148493          	addi	s1,s1,1
    d1e8:	7ff00713          	li	a4,2047
    d1ec:	5ae48a63          	beq	s1,a4,d7a0 <__adddf3+0x6c8>
    d1f0:	ff800737          	lui	a4,0xff800
    d1f4:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    d1f8:	00e7f733          	and	a4,a5,a4
    d1fc:	00155793          	srli	a5,a0,0x1
    d200:	00157513          	andi	a0,a0,1
    d204:	00a7e7b3          	or	a5,a5,a0
    d208:	01f71513          	slli	a0,a4,0x1f
    d20c:	00f56533          	or	a0,a0,a5
    d210:	00175793          	srli	a5,a4,0x1
    d214:	1640006f          	j	d378 <__adddf3+0x2a0>
    d218:	fe058693          	addi	a3,a1,-32
    d21c:	02000893          	li	a7,32
    d220:	00d756b3          	srl	a3,a4,a3
    d224:	00000813          	li	a6,0
    d228:	01158863          	beq	a1,a7,d238 <__adddf3+0x160>
    d22c:	04000813          	li	a6,64
    d230:	40b80833          	sub	a6,a6,a1
    d234:	01071833          	sll	a6,a4,a6
    d238:	00c86833          	or	a6,a6,a2
    d23c:	01003833          	snez	a6,a6
    d240:	0106e6b3          	or	a3,a3,a6
    d244:	00000593          	li	a1,0
    d248:	f85ff06f          	j	d1cc <__adddf3+0xf4>
    d24c:	00c766b3          	or	a3,a4,a2
    d250:	00d036b3          	snez	a3,a3
    d254:	ff1ff06f          	j	d244 <__adddf3+0x16c>
    d258:	0c080a63          	beqz	a6,d32c <__adddf3+0x254>
    d25c:	409886b3          	sub	a3,a7,s1
    d260:	02049463          	bnez	s1,d288 <__adddf3+0x1b0>
    d264:	00a7e5b3          	or	a1,a5,a0
    d268:	50058e63          	beqz	a1,d784 <__adddf3+0x6ac>
    d26c:	fff68593          	addi	a1,a3,-1 # 7fffff <_memory_end+0x7dffff>
    d270:	ee0584e3          	beqz	a1,d158 <__adddf3+0x80>
    d274:	7ff00813          	li	a6,2047
    d278:	03069263          	bne	a3,a6,d29c <__adddf3+0x1c4>
    d27c:	00070793          	mv	a5,a4
    d280:	00060513          	mv	a0,a2
    d284:	ef9ff06f          	j	d17c <__adddf3+0xa4>
    d288:	7ff00593          	li	a1,2047
    d28c:	feb888e3          	beq	a7,a1,d27c <__adddf3+0x1a4>
    d290:	008005b7          	lui	a1,0x800
    d294:	00b7e7b3          	or	a5,a5,a1
    d298:	00068593          	mv	a1,a3
    d29c:	03800693          	li	a3,56
    d2a0:	08b6c063          	blt	a3,a1,d320 <__adddf3+0x248>
    d2a4:	01f00693          	li	a3,31
    d2a8:	04b6c263          	blt	a3,a1,d2ec <__adddf3+0x214>
    d2ac:	02000813          	li	a6,32
    d2b0:	40b80833          	sub	a6,a6,a1
    d2b4:	010796b3          	sll	a3,a5,a6
    d2b8:	00b55333          	srl	t1,a0,a1
    d2bc:	01051833          	sll	a6,a0,a6
    d2c0:	0066e6b3          	or	a3,a3,t1
    d2c4:	01003833          	snez	a6,a6
    d2c8:	0106e6b3          	or	a3,a3,a6
    d2cc:	00b7d5b3          	srl	a1,a5,a1
    d2d0:	00c68633          	add	a2,a3,a2
    d2d4:	00e585b3          	add	a1,a1,a4
    d2d8:	00d636b3          	sltu	a3,a2,a3
    d2dc:	00060513          	mv	a0,a2
    d2e0:	00d587b3          	add	a5,a1,a3
    d2e4:	00088493          	mv	s1,a7
    d2e8:	ef5ff06f          	j	d1dc <__adddf3+0x104>
    d2ec:	fe058693          	addi	a3,a1,-32 # 7fffe0 <_memory_end+0x7dffe0>
    d2f0:	02000313          	li	t1,32
    d2f4:	00d7d6b3          	srl	a3,a5,a3
    d2f8:	00000813          	li	a6,0
    d2fc:	00658863          	beq	a1,t1,d30c <__adddf3+0x234>
    d300:	04000813          	li	a6,64
    d304:	40b80833          	sub	a6,a6,a1
    d308:	01079833          	sll	a6,a5,a6
    d30c:	00a86833          	or	a6,a6,a0
    d310:	01003833          	snez	a6,a6
    d314:	0106e6b3          	or	a3,a3,a6
    d318:	00000593          	li	a1,0
    d31c:	fb5ff06f          	j	d2d0 <__adddf3+0x1f8>
    d320:	00a7e6b3          	or	a3,a5,a0
    d324:	00d036b3          	snez	a3,a3
    d328:	ff1ff06f          	j	d318 <__adddf3+0x240>
    d32c:	00148693          	addi	a3,s1,1
    d330:	7fe6f593          	andi	a1,a3,2046
    d334:	08059663          	bnez	a1,d3c0 <__adddf3+0x2e8>
    d338:	00a7e6b3          	or	a3,a5,a0
    d33c:	06049263          	bnez	s1,d3a0 <__adddf3+0x2c8>
    d340:	44068863          	beqz	a3,d790 <__adddf3+0x6b8>
    d344:	00c766b3          	or	a3,a4,a2
    d348:	02068863          	beqz	a3,d378 <__adddf3+0x2a0>
    d34c:	00c50633          	add	a2,a0,a2
    d350:	00a636b3          	sltu	a3,a2,a0
    d354:	00e78733          	add	a4,a5,a4
    d358:	00d707b3          	add	a5,a4,a3
    d35c:	00879713          	slli	a4,a5,0x8
    d360:	00060513          	mv	a0,a2
    d364:	00075a63          	bgez	a4,d378 <__adddf3+0x2a0>
    d368:	ff800737          	lui	a4,0xff800
    d36c:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    d370:	00e7f7b3          	and	a5,a5,a4
    d374:	00100493          	li	s1,1
    d378:	00757713          	andi	a4,a0,7
    d37c:	44070863          	beqz	a4,d7cc <__adddf3+0x6f4>
    d380:	00f57713          	andi	a4,a0,15
    d384:	00400693          	li	a3,4
    d388:	44d70263          	beq	a4,a3,d7cc <__adddf3+0x6f4>
    d38c:	00450713          	addi	a4,a0,4
    d390:	00a736b3          	sltu	a3,a4,a0
    d394:	00d787b3          	add	a5,a5,a3
    d398:	00070513          	mv	a0,a4
    d39c:	4300006f          	j	d7cc <__adddf3+0x6f4>
    d3a0:	ec068ee3          	beqz	a3,d27c <__adddf3+0x1a4>
    d3a4:	00c76633          	or	a2,a4,a2
    d3a8:	dc060ae3          	beqz	a2,d17c <__adddf3+0xa4>
    d3ac:	00000913          	li	s2,0
    d3b0:	004007b7          	lui	a5,0x400
    d3b4:	00000513          	li	a0,0
    d3b8:	7ff00493          	li	s1,2047
    d3bc:	4100006f          	j	d7cc <__adddf3+0x6f4>
    d3c0:	7ff00593          	li	a1,2047
    d3c4:	3cb68c63          	beq	a3,a1,d79c <__adddf3+0x6c4>
    d3c8:	00c50633          	add	a2,a0,a2
    d3cc:	00a63533          	sltu	a0,a2,a0
    d3d0:	00e78733          	add	a4,a5,a4
    d3d4:	00a70733          	add	a4,a4,a0
    d3d8:	01f71513          	slli	a0,a4,0x1f
    d3dc:	00165613          	srli	a2,a2,0x1
    d3e0:	00c56533          	or	a0,a0,a2
    d3e4:	00175793          	srli	a5,a4,0x1
    d3e8:	00068493          	mv	s1,a3
    d3ec:	f8dff06f          	j	d378 <__adddf3+0x2a0>
    d3f0:	0f005c63          	blez	a6,d4e8 <__adddf3+0x410>
    d3f4:	08089e63          	bnez	a7,d490 <__adddf3+0x3b8>
    d3f8:	00c766b3          	or	a3,a4,a2
    d3fc:	3a068863          	beqz	a3,d7ac <__adddf3+0x6d4>
    d400:	fff80693          	addi	a3,a6,-1
    d404:	02069063          	bnez	a3,d424 <__adddf3+0x34c>
    d408:	40c50633          	sub	a2,a0,a2
    d40c:	00c536b3          	sltu	a3,a0,a2
    d410:	40e78733          	sub	a4,a5,a4
    d414:	00060513          	mv	a0,a2
    d418:	40d707b3          	sub	a5,a4,a3
    d41c:	00100493          	li	s1,1
    d420:	0540006f          	j	d474 <__adddf3+0x39c>
    d424:	7ff00593          	li	a1,2047
    d428:	d4b80ae3          	beq	a6,a1,d17c <__adddf3+0xa4>
    d42c:	03800593          	li	a1,56
    d430:	0ad5c663          	blt	a1,a3,d4dc <__adddf3+0x404>
    d434:	01f00593          	li	a1,31
    d438:	06d5c863          	blt	a1,a3,d4a8 <__adddf3+0x3d0>
    d43c:	02000813          	li	a6,32
    d440:	40d80833          	sub	a6,a6,a3
    d444:	00d658b3          	srl	a7,a2,a3
    d448:	010715b3          	sll	a1,a4,a6
    d44c:	01061833          	sll	a6,a2,a6
    d450:	0115e5b3          	or	a1,a1,a7
    d454:	01003833          	snez	a6,a6
    d458:	0105e633          	or	a2,a1,a6
    d45c:	00d756b3          	srl	a3,a4,a3
    d460:	40c50633          	sub	a2,a0,a2
    d464:	00c53733          	sltu	a4,a0,a2
    d468:	40d786b3          	sub	a3,a5,a3
    d46c:	00060513          	mv	a0,a2
    d470:	40e687b3          	sub	a5,a3,a4
    d474:	00879713          	slli	a4,a5,0x8
    d478:	f00750e3          	bgez	a4,d378 <__adddf3+0x2a0>
    d47c:	00800437          	lui	s0,0x800
    d480:	fff40413          	addi	s0,s0,-1 # 7fffff <_memory_end+0x7dffff>
    d484:	0087f433          	and	s0,a5,s0
    d488:	00050993          	mv	s3,a0
    d48c:	2100006f          	j	d69c <__adddf3+0x5c4>
    d490:	7ff00693          	li	a3,2047
    d494:	eed482e3          	beq	s1,a3,d378 <__adddf3+0x2a0>
    d498:	008006b7          	lui	a3,0x800
    d49c:	00d76733          	or	a4,a4,a3
    d4a0:	00080693          	mv	a3,a6
    d4a4:	f89ff06f          	j	d42c <__adddf3+0x354>
    d4a8:	fe068593          	addi	a1,a3,-32 # 7fffe0 <_memory_end+0x7dffe0>
    d4ac:	02000893          	li	a7,32
    d4b0:	00b755b3          	srl	a1,a4,a1
    d4b4:	00000813          	li	a6,0
    d4b8:	01168863          	beq	a3,a7,d4c8 <__adddf3+0x3f0>
    d4bc:	04000813          	li	a6,64
    d4c0:	40d80833          	sub	a6,a6,a3
    d4c4:	01071833          	sll	a6,a4,a6
    d4c8:	00c86833          	or	a6,a6,a2
    d4cc:	01003833          	snez	a6,a6
    d4d0:	0105e633          	or	a2,a1,a6
    d4d4:	00000693          	li	a3,0
    d4d8:	f89ff06f          	j	d460 <__adddf3+0x388>
    d4dc:	00c76633          	or	a2,a4,a2
    d4e0:	00c03633          	snez	a2,a2
    d4e4:	ff1ff06f          	j	d4d4 <__adddf3+0x3fc>
    d4e8:	0e080863          	beqz	a6,d5d8 <__adddf3+0x500>
    d4ec:	40988833          	sub	a6,a7,s1
    d4f0:	04049263          	bnez	s1,d534 <__adddf3+0x45c>
    d4f4:	00a7e5b3          	or	a1,a5,a0
    d4f8:	2a058e63          	beqz	a1,d7b4 <__adddf3+0x6dc>
    d4fc:	fff80593          	addi	a1,a6,-1
    d500:	00059e63          	bnez	a1,d51c <__adddf3+0x444>
    d504:	40a60533          	sub	a0,a2,a0
    d508:	40f70733          	sub	a4,a4,a5
    d50c:	00a63633          	sltu	a2,a2,a0
    d510:	40c707b3          	sub	a5,a4,a2
    d514:	00068913          	mv	s2,a3
    d518:	f05ff06f          	j	d41c <__adddf3+0x344>
    d51c:	7ff00313          	li	t1,2047
    d520:	02681463          	bne	a6,t1,d548 <__adddf3+0x470>
    d524:	00070793          	mv	a5,a4
    d528:	00060513          	mv	a0,a2
    d52c:	7ff00493          	li	s1,2047
    d530:	0d00006f          	j	d600 <__adddf3+0x528>
    d534:	7ff00593          	li	a1,2047
    d538:	feb886e3          	beq	a7,a1,d524 <__adddf3+0x44c>
    d53c:	008005b7          	lui	a1,0x800
    d540:	00b7e7b3          	or	a5,a5,a1
    d544:	00080593          	mv	a1,a6
    d548:	03800813          	li	a6,56
    d54c:	08b84063          	blt	a6,a1,d5cc <__adddf3+0x4f4>
    d550:	01f00813          	li	a6,31
    d554:	04b84263          	blt	a6,a1,d598 <__adddf3+0x4c0>
    d558:	02000313          	li	t1,32
    d55c:	40b30333          	sub	t1,t1,a1
    d560:	00b55e33          	srl	t3,a0,a1
    d564:	00679833          	sll	a6,a5,t1
    d568:	00651333          	sll	t1,a0,t1
    d56c:	01c86833          	or	a6,a6,t3
    d570:	00603333          	snez	t1,t1
    d574:	00686533          	or	a0,a6,t1
    d578:	00b7d5b3          	srl	a1,a5,a1
    d57c:	40a60533          	sub	a0,a2,a0
    d580:	40b705b3          	sub	a1,a4,a1
    d584:	00a63633          	sltu	a2,a2,a0
    d588:	40c587b3          	sub	a5,a1,a2
    d58c:	00088493          	mv	s1,a7
    d590:	00068913          	mv	s2,a3
    d594:	ee1ff06f          	j	d474 <__adddf3+0x39c>
    d598:	fe058813          	addi	a6,a1,-32 # 7fffe0 <_memory_end+0x7dffe0>
    d59c:	02000e13          	li	t3,32
    d5a0:	0107d833          	srl	a6,a5,a6
    d5a4:	00000313          	li	t1,0
    d5a8:	01c58863          	beq	a1,t3,d5b8 <__adddf3+0x4e0>
    d5ac:	04000313          	li	t1,64
    d5b0:	40b30333          	sub	t1,t1,a1
    d5b4:	00679333          	sll	t1,a5,t1
    d5b8:	00a36333          	or	t1,t1,a0
    d5bc:	00603333          	snez	t1,t1
    d5c0:	00686533          	or	a0,a6,t1
    d5c4:	00000593          	li	a1,0
    d5c8:	fb5ff06f          	j	d57c <__adddf3+0x4a4>
    d5cc:	00a7e533          	or	a0,a5,a0
    d5d0:	00a03533          	snez	a0,a0
    d5d4:	ff1ff06f          	j	d5c4 <__adddf3+0x4ec>
    d5d8:	00148593          	addi	a1,s1,1
    d5dc:	7fe5f593          	andi	a1,a1,2046
    d5e0:	08059663          	bnez	a1,d66c <__adddf3+0x594>
    d5e4:	00a7e833          	or	a6,a5,a0
    d5e8:	00c765b3          	or	a1,a4,a2
    d5ec:	06049063          	bnez	s1,d64c <__adddf3+0x574>
    d5f0:	00081c63          	bnez	a6,d608 <__adddf3+0x530>
    d5f4:	10058e63          	beqz	a1,d710 <__adddf3+0x638>
    d5f8:	00070793          	mv	a5,a4
    d5fc:	00060513          	mv	a0,a2
    d600:	00068913          	mv	s2,a3
    d604:	d75ff06f          	j	d378 <__adddf3+0x2a0>
    d608:	d60588e3          	beqz	a1,d378 <__adddf3+0x2a0>
    d60c:	40c50833          	sub	a6,a0,a2
    d610:	010538b3          	sltu	a7,a0,a6
    d614:	40e785b3          	sub	a1,a5,a4
    d618:	411585b3          	sub	a1,a1,a7
    d61c:	00859893          	slli	a7,a1,0x8
    d620:	0008dc63          	bgez	a7,d638 <__adddf3+0x560>
    d624:	40a60533          	sub	a0,a2,a0
    d628:	40f70733          	sub	a4,a4,a5
    d62c:	00a63633          	sltu	a2,a2,a0
    d630:	40c707b3          	sub	a5,a4,a2
    d634:	fcdff06f          	j	d600 <__adddf3+0x528>
    d638:	00b86533          	or	a0,a6,a1
    d63c:	18050463          	beqz	a0,d7c4 <__adddf3+0x6ec>
    d640:	00058793          	mv	a5,a1
    d644:	00080513          	mv	a0,a6
    d648:	d31ff06f          	j	d378 <__adddf3+0x2a0>
    d64c:	00081c63          	bnez	a6,d664 <__adddf3+0x58c>
    d650:	d4058ee3          	beqz	a1,d3ac <__adddf3+0x2d4>
    d654:	00070793          	mv	a5,a4
    d658:	00060513          	mv	a0,a2
    d65c:	00068913          	mv	s2,a3
    d660:	b1dff06f          	j	d17c <__adddf3+0xa4>
    d664:	b0058ce3          	beqz	a1,d17c <__adddf3+0xa4>
    d668:	d45ff06f          	j	d3ac <__adddf3+0x2d4>
    d66c:	40c505b3          	sub	a1,a0,a2
    d670:	00b53833          	sltu	a6,a0,a1
    d674:	40e78433          	sub	s0,a5,a4
    d678:	41040433          	sub	s0,s0,a6
    d67c:	00841813          	slli	a6,s0,0x8
    d680:	00058993          	mv	s3,a1
    d684:	08085063          	bgez	a6,d704 <__adddf3+0x62c>
    d688:	40a609b3          	sub	s3,a2,a0
    d68c:	40f70433          	sub	s0,a4,a5
    d690:	01363633          	sltu	a2,a2,s3
    d694:	40c40433          	sub	s0,s0,a2
    d698:	00068913          	mv	s2,a3
    d69c:	06040e63          	beqz	s0,d718 <__adddf3+0x640>
    d6a0:	00040513          	mv	a0,s0
    d6a4:	21c050ef          	jal	128c0 <__clzsi2>
    d6a8:	ff850693          	addi	a3,a0,-8
    d6ac:	02000793          	li	a5,32
    d6b0:	40d787b3          	sub	a5,a5,a3
    d6b4:	00d41433          	sll	s0,s0,a3
    d6b8:	00f9d7b3          	srl	a5,s3,a5
    d6bc:	0087e7b3          	or	a5,a5,s0
    d6c0:	00d99433          	sll	s0,s3,a3
    d6c4:	0a96c463          	blt	a3,s1,d76c <__adddf3+0x694>
    d6c8:	409686b3          	sub	a3,a3,s1
    d6cc:	00168613          	addi	a2,a3,1
    d6d0:	01f00713          	li	a4,31
    d6d4:	06c74263          	blt	a4,a2,d738 <__adddf3+0x660>
    d6d8:	02000713          	li	a4,32
    d6dc:	40c70733          	sub	a4,a4,a2
    d6e0:	00e79533          	sll	a0,a5,a4
    d6e4:	00c456b3          	srl	a3,s0,a2
    d6e8:	00e41733          	sll	a4,s0,a4
    d6ec:	00d56533          	or	a0,a0,a3
    d6f0:	00e03733          	snez	a4,a4
    d6f4:	00e56533          	or	a0,a0,a4
    d6f8:	00c7d7b3          	srl	a5,a5,a2
    d6fc:	00000493          	li	s1,0
    d700:	c79ff06f          	j	d378 <__adddf3+0x2a0>
    d704:	0085e5b3          	or	a1,a1,s0
    d708:	f8059ae3          	bnez	a1,d69c <__adddf3+0x5c4>
    d70c:	00000493          	li	s1,0
    d710:	00000913          	li	s2,0
    d714:	08c0006f          	j	d7a0 <__adddf3+0x6c8>
    d718:	00098513          	mv	a0,s3
    d71c:	1a4050ef          	jal	128c0 <__clzsi2>
    d720:	01850693          	addi	a3,a0,24
    d724:	01f00793          	li	a5,31
    d728:	f8d7d2e3          	bge	a5,a3,d6ac <__adddf3+0x5d4>
    d72c:	ff850793          	addi	a5,a0,-8
    d730:	00f997b3          	sll	a5,s3,a5
    d734:	f91ff06f          	j	d6c4 <__adddf3+0x5ec>
    d738:	fe168693          	addi	a3,a3,-31
    d73c:	00d7d533          	srl	a0,a5,a3
    d740:	02000693          	li	a3,32
    d744:	00000713          	li	a4,0
    d748:	00d60863          	beq	a2,a3,d758 <__adddf3+0x680>
    d74c:	04000713          	li	a4,64
    d750:	40c70733          	sub	a4,a4,a2
    d754:	00e79733          	sll	a4,a5,a4
    d758:	00e46733          	or	a4,s0,a4
    d75c:	00e03733          	snez	a4,a4
    d760:	00e56533          	or	a0,a0,a4
    d764:	00000793          	li	a5,0
    d768:	f95ff06f          	j	d6fc <__adddf3+0x624>
    d76c:	ff800737          	lui	a4,0xff800
    d770:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    d774:	40d484b3          	sub	s1,s1,a3
    d778:	00e7f7b3          	and	a5,a5,a4
    d77c:	00040513          	mv	a0,s0
    d780:	bf9ff06f          	j	d378 <__adddf3+0x2a0>
    d784:	00070793          	mv	a5,a4
    d788:	00060513          	mv	a0,a2
    d78c:	c5dff06f          	j	d3e8 <__adddf3+0x310>
    d790:	00070793          	mv	a5,a4
    d794:	00060513          	mv	a0,a2
    d798:	be1ff06f          	j	d378 <__adddf3+0x2a0>
    d79c:	7ff00493          	li	s1,2047
    d7a0:	00000793          	li	a5,0
    d7a4:	00000513          	li	a0,0
    d7a8:	0240006f          	j	d7cc <__adddf3+0x6f4>
    d7ac:	00080493          	mv	s1,a6
    d7b0:	bc9ff06f          	j	d378 <__adddf3+0x2a0>
    d7b4:	00070793          	mv	a5,a4
    d7b8:	00060513          	mv	a0,a2
    d7bc:	00080493          	mv	s1,a6
    d7c0:	e41ff06f          	j	d600 <__adddf3+0x528>
    d7c4:	00000793          	li	a5,0
    d7c8:	00000913          	li	s2,0
    d7cc:	00879713          	slli	a4,a5,0x8
    d7d0:	00075e63          	bgez	a4,d7ec <__adddf3+0x714>
    d7d4:	00148493          	addi	s1,s1,1
    d7d8:	7ff00713          	li	a4,2047
    d7dc:	08e48263          	beq	s1,a4,d860 <__adddf3+0x788>
    d7e0:	ff800737          	lui	a4,0xff800
    d7e4:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    d7e8:	00e7f7b3          	and	a5,a5,a4
    d7ec:	01d79693          	slli	a3,a5,0x1d
    d7f0:	00355513          	srli	a0,a0,0x3
    d7f4:	7ff00713          	li	a4,2047
    d7f8:	00a6e6b3          	or	a3,a3,a0
    d7fc:	0037d793          	srli	a5,a5,0x3
    d800:	00e49e63          	bne	s1,a4,d81c <__adddf3+0x744>
    d804:	00f6e6b3          	or	a3,a3,a5
    d808:	00000793          	li	a5,0
    d80c:	00068863          	beqz	a3,d81c <__adddf3+0x744>
    d810:	000807b7          	lui	a5,0x80
    d814:	00000693          	li	a3,0
    d818:	00000913          	li	s2,0
    d81c:	01449713          	slli	a4,s1,0x14
    d820:	7ff00637          	lui	a2,0x7ff00
    d824:	00c79793          	slli	a5,a5,0xc
    d828:	00c77733          	and	a4,a4,a2
    d82c:	01c12083          	lw	ra,28(sp)
    d830:	01812403          	lw	s0,24(sp)
    d834:	00c7d793          	srli	a5,a5,0xc
    d838:	00f767b3          	or	a5,a4,a5
    d83c:	01f91713          	slli	a4,s2,0x1f
    d840:	00e7e633          	or	a2,a5,a4
    d844:	01412483          	lw	s1,20(sp)
    d848:	01012903          	lw	s2,16(sp)
    d84c:	00c12983          	lw	s3,12(sp)
    d850:	00068513          	mv	a0,a3
    d854:	00060593          	mv	a1,a2
    d858:	02010113          	addi	sp,sp,32
    d85c:	00008067          	ret
    d860:	00000793          	li	a5,0
    d864:	00000513          	li	a0,0
    d868:	f85ff06f          	j	d7ec <__adddf3+0x714>

0000d86c <__divdf3>:
    d86c:	fd010113          	addi	sp,sp,-48
    d870:	0145d813          	srli	a6,a1,0x14
    d874:	02912223          	sw	s1,36(sp)
    d878:	03212023          	sw	s2,32(sp)
    d87c:	01312e23          	sw	s3,28(sp)
    d880:	01612823          	sw	s6,16(sp)
    d884:	01712623          	sw	s7,12(sp)
    d888:	00c59493          	slli	s1,a1,0xc
    d88c:	02112623          	sw	ra,44(sp)
    d890:	02812423          	sw	s0,40(sp)
    d894:	01412c23          	sw	s4,24(sp)
    d898:	01512a23          	sw	s5,20(sp)
    d89c:	7ff87813          	andi	a6,a6,2047
    d8a0:	00050b13          	mv	s6,a0
    d8a4:	00060b93          	mv	s7,a2
    d8a8:	00068913          	mv	s2,a3
    d8ac:	00c4d493          	srli	s1,s1,0xc
    d8b0:	01f5d993          	srli	s3,a1,0x1f
    d8b4:	0a080063          	beqz	a6,d954 <__divdf3+0xe8>
    d8b8:	7ff00793          	li	a5,2047
    d8bc:	10f80063          	beq	a6,a5,d9bc <__divdf3+0x150>
    d8c0:	01d55a13          	srli	s4,a0,0x1d
    d8c4:	00349493          	slli	s1,s1,0x3
    d8c8:	009a6a33          	or	s4,s4,s1
    d8cc:	008007b7          	lui	a5,0x800
    d8d0:	00fa6a33          	or	s4,s4,a5
    d8d4:	00351413          	slli	s0,a0,0x3
    d8d8:	c0180a93          	addi	s5,a6,-1023
    d8dc:	00000b13          	li	s6,0
    d8e0:	01495713          	srli	a4,s2,0x14
    d8e4:	00c91493          	slli	s1,s2,0xc
    d8e8:	7ff77713          	andi	a4,a4,2047
    d8ec:	00c4d493          	srli	s1,s1,0xc
    d8f0:	01f95913          	srli	s2,s2,0x1f
    d8f4:	10070263          	beqz	a4,d9f8 <__divdf3+0x18c>
    d8f8:	7ff00793          	li	a5,2047
    d8fc:	16f70663          	beq	a4,a5,da68 <__divdf3+0x1fc>
    d900:	00349493          	slli	s1,s1,0x3
    d904:	01dbd793          	srli	a5,s7,0x1d
    d908:	0097e7b3          	or	a5,a5,s1
    d90c:	008004b7          	lui	s1,0x800
    d910:	0097e4b3          	or	s1,a5,s1
    d914:	003b9f13          	slli	t5,s7,0x3
    d918:	c0170713          	addi	a4,a4,-1023
    d91c:	00000793          	li	a5,0
    d920:	40ea8833          	sub	a6,s5,a4
    d924:	002b1713          	slli	a4,s6,0x2
    d928:	00f76733          	or	a4,a4,a5
    d92c:	fff70713          	addi	a4,a4,-1
    d930:	00e00693          	li	a3,14
    d934:	0129c633          	xor	a2,s3,s2
    d938:	16e6e463          	bltu	a3,a4,daa0 <__divdf3+0x234>
    d93c:	000136b7          	lui	a3,0x13
    d940:	00271713          	slli	a4,a4,0x2
    d944:	59068693          	addi	a3,a3,1424 # 13590 <blanks.1+0x10>
    d948:	00d70733          	add	a4,a4,a3
    d94c:	00072703          	lw	a4,0(a4)
    d950:	00070067          	jr	a4
    d954:	00a4ea33          	or	s4,s1,a0
    d958:	060a0e63          	beqz	s4,d9d4 <__divdf3+0x168>
    d95c:	02048e63          	beqz	s1,d998 <__divdf3+0x12c>
    d960:	00048513          	mv	a0,s1
    d964:	75d040ef          	jal	128c0 <__clzsi2>
    d968:	ff550793          	addi	a5,a0,-11
    d96c:	01d00a13          	li	s4,29
    d970:	ff850713          	addi	a4,a0,-8
    d974:	40fa0a33          	sub	s4,s4,a5
    d978:	00e494b3          	sll	s1,s1,a4
    d97c:	014b5a33          	srl	s4,s6,s4
    d980:	009a6a33          	or	s4,s4,s1
    d984:	00eb14b3          	sll	s1,s6,a4
    d988:	c0d00813          	li	a6,-1011
    d98c:	40a80ab3          	sub	s5,a6,a0
    d990:	00048413          	mv	s0,s1
    d994:	f49ff06f          	j	d8dc <__divdf3+0x70>
    d998:	729040ef          	jal	128c0 <__clzsi2>
    d99c:	00050a13          	mv	s4,a0
    d9a0:	015a0793          	addi	a5,s4,21
    d9a4:	01c00713          	li	a4,28
    d9a8:	02050513          	addi	a0,a0,32
    d9ac:	fcf750e3          	bge	a4,a5,d96c <__divdf3+0x100>
    d9b0:	ff8a0a13          	addi	s4,s4,-8
    d9b4:	014b1a33          	sll	s4,s6,s4
    d9b8:	fd1ff06f          	j	d988 <__divdf3+0x11c>
    d9bc:	00a4ea33          	or	s4,s1,a0
    d9c0:	020a1263          	bnez	s4,d9e4 <__divdf3+0x178>
    d9c4:	00000413          	li	s0,0
    d9c8:	7ff00a93          	li	s5,2047
    d9cc:	00200b13          	li	s6,2
    d9d0:	f11ff06f          	j	d8e0 <__divdf3+0x74>
    d9d4:	00000413          	li	s0,0
    d9d8:	00000a93          	li	s5,0
    d9dc:	00100b13          	li	s6,1
    d9e0:	f01ff06f          	j	d8e0 <__divdf3+0x74>
    d9e4:	00050413          	mv	s0,a0
    d9e8:	00048a13          	mv	s4,s1
    d9ec:	7ff00a93          	li	s5,2047
    d9f0:	00300b13          	li	s6,3
    d9f4:	eedff06f          	j	d8e0 <__divdf3+0x74>
    d9f8:	0174ef33          	or	t5,s1,s7
    d9fc:	080f0263          	beqz	t5,da80 <__divdf3+0x214>
    da00:	04048063          	beqz	s1,da40 <__divdf3+0x1d4>
    da04:	00048513          	mv	a0,s1
    da08:	6b9040ef          	jal	128c0 <__clzsi2>
    da0c:	ff550713          	addi	a4,a0,-11
    da10:	01d00793          	li	a5,29
    da14:	ff850693          	addi	a3,a0,-8
    da18:	40e787b3          	sub	a5,a5,a4
    da1c:	00d494b3          	sll	s1,s1,a3
    da20:	00fbd7b3          	srl	a5,s7,a5
    da24:	0097e7b3          	or	a5,a5,s1
    da28:	00db94b3          	sll	s1,s7,a3
    da2c:	c0d00713          	li	a4,-1011
    da30:	00048f13          	mv	t5,s1
    da34:	40a70733          	sub	a4,a4,a0
    da38:	00078493          	mv	s1,a5
    da3c:	ee1ff06f          	j	d91c <__divdf3+0xb0>
    da40:	000b8513          	mv	a0,s7
    da44:	67d040ef          	jal	128c0 <__clzsi2>
    da48:	00050793          	mv	a5,a0
    da4c:	01578713          	addi	a4,a5,21 # 800015 <_memory_end+0x7e0015>
    da50:	01c00693          	li	a3,28
    da54:	02050513          	addi	a0,a0,32
    da58:	fae6dce3          	bge	a3,a4,da10 <__divdf3+0x1a4>
    da5c:	ff878793          	addi	a5,a5,-8
    da60:	00fb97b3          	sll	a5,s7,a5
    da64:	fc9ff06f          	j	da2c <__divdf3+0x1c0>
    da68:	0174ef33          	or	t5,s1,s7
    da6c:	020f1263          	bnez	t5,da90 <__divdf3+0x224>
    da70:	00000493          	li	s1,0
    da74:	7ff00713          	li	a4,2047
    da78:	00200793          	li	a5,2
    da7c:	ea5ff06f          	j	d920 <__divdf3+0xb4>
    da80:	00000493          	li	s1,0
    da84:	00000713          	li	a4,0
    da88:	00100793          	li	a5,1
    da8c:	e95ff06f          	j	d920 <__divdf3+0xb4>
    da90:	000b8f13          	mv	t5,s7
    da94:	7ff00713          	li	a4,2047
    da98:	00300793          	li	a5,3
    da9c:	e85ff06f          	j	d920 <__divdf3+0xb4>
    daa0:	0144e663          	bltu	s1,s4,daac <__divdf3+0x240>
    daa4:	349a1c63          	bne	s4,s1,ddfc <__divdf3+0x590>
    daa8:	35e46a63          	bltu	s0,t5,ddfc <__divdf3+0x590>
    daac:	01fa1693          	slli	a3,s4,0x1f
    dab0:	00145793          	srli	a5,s0,0x1
    dab4:	01f41713          	slli	a4,s0,0x1f
    dab8:	001a5a13          	srli	s4,s4,0x1
    dabc:	00f6e433          	or	s0,a3,a5
    dac0:	00849893          	slli	a7,s1,0x8
    dac4:	018f5593          	srli	a1,t5,0x18
    dac8:	0115e5b3          	or	a1,a1,a7
    dacc:	0108d893          	srli	a7,a7,0x10
    dad0:	031a5eb3          	divu	t4,s4,a7
    dad4:	01059313          	slli	t1,a1,0x10
    dad8:	01035313          	srli	t1,t1,0x10
    dadc:	01045793          	srli	a5,s0,0x10
    dae0:	008f1513          	slli	a0,t5,0x8
    dae4:	031a7a33          	remu	s4,s4,a7
    dae8:	000e8693          	mv	a3,t4
    daec:	03d30e33          	mul	t3,t1,t4
    daf0:	010a1a13          	slli	s4,s4,0x10
    daf4:	0147e7b3          	or	a5,a5,s4
    daf8:	01c7fe63          	bgeu	a5,t3,db14 <__divdf3+0x2a8>
    dafc:	00f587b3          	add	a5,a1,a5
    db00:	fffe8693          	addi	a3,t4,-1
    db04:	00b7e863          	bltu	a5,a1,db14 <__divdf3+0x2a8>
    db08:	01c7f663          	bgeu	a5,t3,db14 <__divdf3+0x2a8>
    db0c:	ffee8693          	addi	a3,t4,-2
    db10:	00b787b3          	add	a5,a5,a1
    db14:	41c787b3          	sub	a5,a5,t3
    db18:	0317df33          	divu	t5,a5,a7
    db1c:	01041413          	slli	s0,s0,0x10
    db20:	01045413          	srli	s0,s0,0x10
    db24:	0317f7b3          	remu	a5,a5,a7
    db28:	000f0e13          	mv	t3,t5
    db2c:	03e30eb3          	mul	t4,t1,t5
    db30:	01079793          	slli	a5,a5,0x10
    db34:	00f467b3          	or	a5,s0,a5
    db38:	01d7fe63          	bgeu	a5,t4,db54 <__divdf3+0x2e8>
    db3c:	00f587b3          	add	a5,a1,a5
    db40:	ffff0e13          	addi	t3,t5,-1
    db44:	00b7e863          	bltu	a5,a1,db54 <__divdf3+0x2e8>
    db48:	01d7f663          	bgeu	a5,t4,db54 <__divdf3+0x2e8>
    db4c:	ffef0e13          	addi	t3,t5,-2
    db50:	00b787b3          	add	a5,a5,a1
    db54:	01069693          	slli	a3,a3,0x10
    db58:	00010437          	lui	s0,0x10
    db5c:	01c6e2b3          	or	t0,a3,t3
    db60:	fff40e13          	addi	t3,s0,-1 # ffff <__multf3+0xc07>
    db64:	01c2f6b3          	and	a3,t0,t3
    db68:	0102df93          	srli	t6,t0,0x10
    db6c:	01c57e33          	and	t3,a0,t3
    db70:	41d787b3          	sub	a5,a5,t4
    db74:	01055e93          	srli	t4,a0,0x10
    db78:	02de03b3          	mul	t2,t3,a3
    db7c:	03cf84b3          	mul	s1,t6,t3
    db80:	02de86b3          	mul	a3,t4,a3
    db84:	00968f33          	add	t5,a3,s1
    db88:	0103d693          	srli	a3,t2,0x10
    db8c:	01e686b3          	add	a3,a3,t5
    db90:	03df8fb3          	mul	t6,t6,t4
    db94:	0096f463          	bgeu	a3,s1,db9c <__divdf3+0x330>
    db98:	008f8fb3          	add	t6,t6,s0
    db9c:	0106df13          	srli	t5,a3,0x10
    dba0:	01ff0f33          	add	t5,t5,t6
    dba4:	00010fb7          	lui	t6,0x10
    dba8:	ffff8f93          	addi	t6,t6,-1 # ffff <__multf3+0xc07>
    dbac:	01f6f6b3          	and	a3,a3,t6
    dbb0:	01069693          	slli	a3,a3,0x10
    dbb4:	01f3f3b3          	and	t2,t2,t6
    dbb8:	007686b3          	add	a3,a3,t2
    dbbc:	01e7e863          	bltu	a5,t5,dbcc <__divdf3+0x360>
    dbc0:	00028493          	mv	s1,t0
    dbc4:	05e79863          	bne	a5,t5,dc14 <__divdf3+0x3a8>
    dbc8:	04d77663          	bgeu	a4,a3,dc14 <__divdf3+0x3a8>
    dbcc:	00a70fb3          	add	t6,a4,a0
    dbd0:	00efb3b3          	sltu	t2,t6,a4
    dbd4:	00b38433          	add	s0,t2,a1
    dbd8:	008787b3          	add	a5,a5,s0
    dbdc:	fff28493          	addi	s1,t0,-1
    dbe0:	000f8713          	mv	a4,t6
    dbe4:	00f5e663          	bltu	a1,a5,dbf0 <__divdf3+0x384>
    dbe8:	02f59663          	bne	a1,a5,dc14 <__divdf3+0x3a8>
    dbec:	02039463          	bnez	t2,dc14 <__divdf3+0x3a8>
    dbf0:	01e7e663          	bltu	a5,t5,dbfc <__divdf3+0x390>
    dbf4:	02ff1063          	bne	t5,a5,dc14 <__divdf3+0x3a8>
    dbf8:	00dffe63          	bgeu	t6,a3,dc14 <__divdf3+0x3a8>
    dbfc:	01f50fb3          	add	t6,a0,t6
    dc00:	000f8713          	mv	a4,t6
    dc04:	00afbfb3          	sltu	t6,t6,a0
    dc08:	00bf8fb3          	add	t6,t6,a1
    dc0c:	ffe28493          	addi	s1,t0,-2
    dc10:	01f787b3          	add	a5,a5,t6
    dc14:	40d706b3          	sub	a3,a4,a3
    dc18:	41e787b3          	sub	a5,a5,t5
    dc1c:	00d73733          	sltu	a4,a4,a3
    dc20:	40e787b3          	sub	a5,a5,a4
    dc24:	fff00f13          	li	t5,-1
    dc28:	12f58663          	beq	a1,a5,dd54 <__divdf3+0x4e8>
    dc2c:	0317dfb3          	divu	t6,a5,a7
    dc30:	0106d713          	srli	a4,a3,0x10
    dc34:	0317f7b3          	remu	a5,a5,a7
    dc38:	03f30f33          	mul	t5,t1,t6
    dc3c:	01079793          	slli	a5,a5,0x10
    dc40:	00f767b3          	or	a5,a4,a5
    dc44:	000f8713          	mv	a4,t6
    dc48:	01e7fe63          	bgeu	a5,t5,dc64 <__divdf3+0x3f8>
    dc4c:	00f587b3          	add	a5,a1,a5
    dc50:	ffff8713          	addi	a4,t6,-1
    dc54:	00b7e863          	bltu	a5,a1,dc64 <__divdf3+0x3f8>
    dc58:	01e7f663          	bgeu	a5,t5,dc64 <__divdf3+0x3f8>
    dc5c:	ffef8713          	addi	a4,t6,-2
    dc60:	00b787b3          	add	a5,a5,a1
    dc64:	41e787b3          	sub	a5,a5,t5
    dc68:	0317df33          	divu	t5,a5,a7
    dc6c:	01069693          	slli	a3,a3,0x10
    dc70:	0106d693          	srli	a3,a3,0x10
    dc74:	0317f7b3          	remu	a5,a5,a7
    dc78:	000f0893          	mv	a7,t5
    dc7c:	03e30333          	mul	t1,t1,t5
    dc80:	01079793          	slli	a5,a5,0x10
    dc84:	00f6e7b3          	or	a5,a3,a5
    dc88:	0067fe63          	bgeu	a5,t1,dca4 <__divdf3+0x438>
    dc8c:	00f587b3          	add	a5,a1,a5
    dc90:	ffff0893          	addi	a7,t5,-1
    dc94:	00b7e863          	bltu	a5,a1,dca4 <__divdf3+0x438>
    dc98:	0067f663          	bgeu	a5,t1,dca4 <__divdf3+0x438>
    dc9c:	ffef0893          	addi	a7,t5,-2
    dca0:	00b787b3          	add	a5,a5,a1
    dca4:	01071693          	slli	a3,a4,0x10
    dca8:	0116e6b3          	or	a3,a3,a7
    dcac:	01069713          	slli	a4,a3,0x10
    dcb0:	01075713          	srli	a4,a4,0x10
    dcb4:	406787b3          	sub	a5,a5,t1
    dcb8:	0106d313          	srli	t1,a3,0x10
    dcbc:	03c70f33          	mul	t5,a4,t3
    dcc0:	03c30e33          	mul	t3,t1,t3
    dcc4:	026e8333          	mul	t1,t4,t1
    dcc8:	02ee8eb3          	mul	t4,t4,a4
    dccc:	010f5713          	srli	a4,t5,0x10
    dcd0:	01ce8eb3          	add	t4,t4,t3
    dcd4:	01d70733          	add	a4,a4,t4
    dcd8:	01c77663          	bgeu	a4,t3,dce4 <__divdf3+0x478>
    dcdc:	000108b7          	lui	a7,0x10
    dce0:	01130333          	add	t1,t1,a7
    dce4:	01075893          	srli	a7,a4,0x10
    dce8:	006888b3          	add	a7,a7,t1
    dcec:	00010337          	lui	t1,0x10
    dcf0:	fff30313          	addi	t1,t1,-1 # ffff <__multf3+0xc07>
    dcf4:	00677733          	and	a4,a4,t1
    dcf8:	01071713          	slli	a4,a4,0x10
    dcfc:	006f7f33          	and	t5,t5,t1
    dd00:	01e70733          	add	a4,a4,t5
    dd04:	0117e863          	bltu	a5,a7,dd14 <__divdf3+0x4a8>
    dd08:	23179c63          	bne	a5,a7,df40 <__divdf3+0x6d4>
    dd0c:	00068f13          	mv	t5,a3
    dd10:	04070263          	beqz	a4,dd54 <__divdf3+0x4e8>
    dd14:	00f587b3          	add	a5,a1,a5
    dd18:	fff68f13          	addi	t5,a3,-1
    dd1c:	00078313          	mv	t1,a5
    dd20:	02b7e463          	bltu	a5,a1,dd48 <__divdf3+0x4dc>
    dd24:	0117e663          	bltu	a5,a7,dd30 <__divdf3+0x4c4>
    dd28:	21179a63          	bne	a5,a7,df3c <__divdf3+0x6d0>
    dd2c:	02e57063          	bgeu	a0,a4,dd4c <__divdf3+0x4e0>
    dd30:	ffe68f13          	addi	t5,a3,-2
    dd34:	00151693          	slli	a3,a0,0x1
    dd38:	00a6b333          	sltu	t1,a3,a0
    dd3c:	00b30333          	add	t1,t1,a1
    dd40:	00678333          	add	t1,a5,t1
    dd44:	00068513          	mv	a0,a3
    dd48:	01131463          	bne	t1,a7,dd50 <__divdf3+0x4e4>
    dd4c:	00a70463          	beq	a4,a0,dd54 <__divdf3+0x4e8>
    dd50:	001f6f13          	ori	t5,t5,1
    dd54:	3ff80713          	addi	a4,a6,1023
    dd58:	10e05263          	blez	a4,de5c <__divdf3+0x5f0>
    dd5c:	007f7793          	andi	a5,t5,7
    dd60:	02078063          	beqz	a5,dd80 <__divdf3+0x514>
    dd64:	00ff7793          	andi	a5,t5,15
    dd68:	00400693          	li	a3,4
    dd6c:	00d78a63          	beq	a5,a3,dd80 <__divdf3+0x514>
    dd70:	004f0793          	addi	a5,t5,4
    dd74:	01e7b6b3          	sltu	a3,a5,t5
    dd78:	00d484b3          	add	s1,s1,a3
    dd7c:	00078f13          	mv	t5,a5
    dd80:	00749793          	slli	a5,s1,0x7
    dd84:	0007da63          	bgez	a5,dd98 <__divdf3+0x52c>
    dd88:	ff0007b7          	lui	a5,0xff000
    dd8c:	fff78793          	addi	a5,a5,-1 # feffffff <_memory_end+0xfefdffff>
    dd90:	00f4f4b3          	and	s1,s1,a5
    dd94:	40080713          	addi	a4,a6,1024
    dd98:	7fe00793          	li	a5,2046
    dd9c:	08e7ca63          	blt	a5,a4,de30 <__divdf3+0x5c4>
    dda0:	003f5f13          	srli	t5,t5,0x3
    dda4:	01d49793          	slli	a5,s1,0x1d
    dda8:	01e7ef33          	or	t5,a5,t5
    ddac:	0034d513          	srli	a0,s1,0x3
    ddb0:	00c51513          	slli	a0,a0,0xc
    ddb4:	02c12083          	lw	ra,44(sp)
    ddb8:	02812403          	lw	s0,40(sp)
    ddbc:	00c55513          	srli	a0,a0,0xc
    ddc0:	01471713          	slli	a4,a4,0x14
    ddc4:	00a76733          	or	a4,a4,a0
    ddc8:	01f61613          	slli	a2,a2,0x1f
    ddcc:	00c767b3          	or	a5,a4,a2
    ddd0:	02412483          	lw	s1,36(sp)
    ddd4:	02012903          	lw	s2,32(sp)
    ddd8:	01c12983          	lw	s3,28(sp)
    dddc:	01812a03          	lw	s4,24(sp)
    dde0:	01412a83          	lw	s5,20(sp)
    dde4:	01012b03          	lw	s6,16(sp)
    dde8:	00c12b83          	lw	s7,12(sp)
    ddec:	000f0513          	mv	a0,t5
    ddf0:	00078593          	mv	a1,a5
    ddf4:	03010113          	addi	sp,sp,48
    ddf8:	00008067          	ret
    ddfc:	fff80813          	addi	a6,a6,-1
    de00:	00000713          	li	a4,0
    de04:	cbdff06f          	j	dac0 <__divdf3+0x254>
    de08:	00098613          	mv	a2,s3
    de0c:	000a0493          	mv	s1,s4
    de10:	00040f13          	mv	t5,s0
    de14:	000b0793          	mv	a5,s6
    de18:	00300713          	li	a4,3
    de1c:	0ee78863          	beq	a5,a4,df0c <__divdf3+0x6a0>
    de20:	00100713          	li	a4,1
    de24:	0ee78e63          	beq	a5,a4,df20 <__divdf3+0x6b4>
    de28:	00200713          	li	a4,2
    de2c:	f2e794e3          	bne	a5,a4,dd54 <__divdf3+0x4e8>
    de30:	00000513          	li	a0,0
    de34:	00000f13          	li	t5,0
    de38:	7ff00713          	li	a4,2047
    de3c:	f75ff06f          	j	ddb0 <__divdf3+0x544>
    de40:	00090613          	mv	a2,s2
    de44:	fd5ff06f          	j	de18 <__divdf3+0x5ac>
    de48:	000804b7          	lui	s1,0x80
    de4c:	00000f13          	li	t5,0
    de50:	00000613          	li	a2,0
    de54:	00300793          	li	a5,3
    de58:	fc1ff06f          	j	de18 <__divdf3+0x5ac>
    de5c:	00100513          	li	a0,1
    de60:	40e50533          	sub	a0,a0,a4
    de64:	03800793          	li	a5,56
    de68:	0aa7cc63          	blt	a5,a0,df20 <__divdf3+0x6b4>
    de6c:	01f00793          	li	a5,31
    de70:	06a7c463          	blt	a5,a0,ded8 <__divdf3+0x66c>
    de74:	41e80813          	addi	a6,a6,1054
    de78:	010497b3          	sll	a5,s1,a6
    de7c:	00af5733          	srl	a4,t5,a0
    de80:	010f1833          	sll	a6,t5,a6
    de84:	00e7e7b3          	or	a5,a5,a4
    de88:	01003833          	snez	a6,a6
    de8c:	0107e7b3          	or	a5,a5,a6
    de90:	00a4d533          	srl	a0,s1,a0
    de94:	0077f713          	andi	a4,a5,7
    de98:	02070063          	beqz	a4,deb8 <__divdf3+0x64c>
    de9c:	00f7f713          	andi	a4,a5,15
    dea0:	00400693          	li	a3,4
    dea4:	00d70a63          	beq	a4,a3,deb8 <__divdf3+0x64c>
    dea8:	00478713          	addi	a4,a5,4
    deac:	00f736b3          	sltu	a3,a4,a5
    deb0:	00d50533          	add	a0,a0,a3
    deb4:	00070793          	mv	a5,a4
    deb8:	00851713          	slli	a4,a0,0x8
    debc:	06074863          	bltz	a4,df2c <__divdf3+0x6c0>
    dec0:	01d51f13          	slli	t5,a0,0x1d
    dec4:	0037d793          	srli	a5,a5,0x3
    dec8:	00ff6f33          	or	t5,t5,a5
    decc:	00355513          	srli	a0,a0,0x3
    ded0:	00000713          	li	a4,0
    ded4:	eddff06f          	j	ddb0 <__divdf3+0x544>
    ded8:	fe100793          	li	a5,-31
    dedc:	40e787b3          	sub	a5,a5,a4
    dee0:	02000693          	li	a3,32
    dee4:	00f4d7b3          	srl	a5,s1,a5
    dee8:	00000713          	li	a4,0
    deec:	00d50663          	beq	a0,a3,def8 <__divdf3+0x68c>
    def0:	43e80713          	addi	a4,a6,1086
    def4:	00e49733          	sll	a4,s1,a4
    def8:	01e76733          	or	a4,a4,t5
    defc:	00e03733          	snez	a4,a4
    df00:	00e7e7b3          	or	a5,a5,a4
    df04:	00000513          	li	a0,0
    df08:	f8dff06f          	j	de94 <__divdf3+0x628>
    df0c:	00080537          	lui	a0,0x80
    df10:	00000f13          	li	t5,0
    df14:	7ff00713          	li	a4,2047
    df18:	00000613          	li	a2,0
    df1c:	e95ff06f          	j	ddb0 <__divdf3+0x544>
    df20:	00000513          	li	a0,0
    df24:	00000f13          	li	t5,0
    df28:	fa9ff06f          	j	ded0 <__divdf3+0x664>
    df2c:	00000513          	li	a0,0
    df30:	00000f13          	li	t5,0
    df34:	00100713          	li	a4,1
    df38:	e79ff06f          	j	ddb0 <__divdf3+0x544>
    df3c:	000f0693          	mv	a3,t5
    df40:	00068f13          	mv	t5,a3
    df44:	e0dff06f          	j	dd50 <__divdf3+0x4e4>

0000df48 <__eqdf2>:
    df48:	0145d713          	srli	a4,a1,0x14
    df4c:	001007b7          	lui	a5,0x100
    df50:	fff78793          	addi	a5,a5,-1 # fffff <_memory_end+0xdffff>
    df54:	0146d813          	srli	a6,a3,0x14
    df58:	00050313          	mv	t1,a0
    df5c:	00050e93          	mv	t4,a0
    df60:	7ff77713          	andi	a4,a4,2047
    df64:	7ff00513          	li	a0,2047
    df68:	00b7f8b3          	and	a7,a5,a1
    df6c:	00060f13          	mv	t5,a2
    df70:	00d7f7b3          	and	a5,a5,a3
    df74:	01f5d593          	srli	a1,a1,0x1f
    df78:	7ff87813          	andi	a6,a6,2047
    df7c:	01f6d693          	srli	a3,a3,0x1f
    df80:	00a71c63          	bne	a4,a0,df98 <__eqdf2+0x50>
    df84:	0068ee33          	or	t3,a7,t1
    df88:	00100513          	li	a0,1
    df8c:	000e1463          	bnez	t3,df94 <__eqdf2+0x4c>
    df90:	00e80663          	beq	a6,a4,df9c <__eqdf2+0x54>
    df94:	00008067          	ret
    df98:	00a81863          	bne	a6,a0,dfa8 <__eqdf2+0x60>
    df9c:	00c7e633          	or	a2,a5,a2
    dfa0:	00100513          	li	a0,1
    dfa4:	fe0618e3          	bnez	a2,df94 <__eqdf2+0x4c>
    dfa8:	00100513          	li	a0,1
    dfac:	ff0714e3          	bne	a4,a6,df94 <__eqdf2+0x4c>
    dfb0:	fef892e3          	bne	a7,a5,df94 <__eqdf2+0x4c>
    dfb4:	ffee90e3          	bne	t4,t5,df94 <__eqdf2+0x4c>
    dfb8:	00d58a63          	beq	a1,a3,dfcc <__eqdf2+0x84>
    dfbc:	fc071ce3          	bnez	a4,df94 <__eqdf2+0x4c>
    dfc0:	0068e8b3          	or	a7,a7,t1
    dfc4:	01103533          	snez	a0,a7
    dfc8:	00008067          	ret
    dfcc:	00000513          	li	a0,0
    dfd0:	00008067          	ret

0000dfd4 <__gedf2>:
    dfd4:	0146d793          	srli	a5,a3,0x14
    dfd8:	0145d893          	srli	a7,a1,0x14
    dfdc:	00100737          	lui	a4,0x100
    dfe0:	fff70713          	addi	a4,a4,-1 # fffff <_memory_end+0xdffff>
    dfe4:	00050813          	mv	a6,a0
    dfe8:	00050e13          	mv	t3,a0
    dfec:	7ff8f893          	andi	a7,a7,2047
    dff0:	7ff7f513          	andi	a0,a5,2047
    dff4:	7ff00793          	li	a5,2047
    dff8:	00b77333          	and	t1,a4,a1
    dffc:	00060e93          	mv	t4,a2
    e000:	00d77733          	and	a4,a4,a3
    e004:	01f5d593          	srli	a1,a1,0x1f
    e008:	01f6d693          	srli	a3,a3,0x1f
    e00c:	00f89663          	bne	a7,a5,e018 <__gedf2+0x44>
    e010:	010367b3          	or	a5,t1,a6
    e014:	06079c63          	bnez	a5,e08c <__gedf2+0xb8>
    e018:	7ff00793          	li	a5,2047
    e01c:	00f51663          	bne	a0,a5,e028 <__gedf2+0x54>
    e020:	00c767b3          	or	a5,a4,a2
    e024:	06079463          	bnez	a5,e08c <__gedf2+0xb8>
    e028:	00000793          	li	a5,0
    e02c:	00089663          	bnez	a7,e038 <__gedf2+0x64>
    e030:	01036833          	or	a6,t1,a6
    e034:	00183793          	seqz	a5,a6
    e038:	04051e63          	bnez	a0,e094 <__gedf2+0xc0>
    e03c:	00c76633          	or	a2,a4,a2
    e040:	00078c63          	beqz	a5,e058 <__gedf2+0x84>
    e044:	02060063          	beqz	a2,e064 <__gedf2+0x90>
    e048:	00100513          	li	a0,1
    e04c:	00069c63          	bnez	a3,e064 <__gedf2+0x90>
    e050:	fff00513          	li	a0,-1
    e054:	00008067          	ret
    e058:	04061063          	bnez	a2,e098 <__gedf2+0xc4>
    e05c:	fff00513          	li	a0,-1
    e060:	04058463          	beqz	a1,e0a8 <__gedf2+0xd4>
    e064:	00008067          	ret
    e068:	fea8c0e3          	blt	a7,a0,e048 <__gedf2+0x74>
    e06c:	fe6768e3          	bltu	a4,t1,e05c <__gedf2+0x88>
    e070:	00e31863          	bne	t1,a4,e080 <__gedf2+0xac>
    e074:	ffcee4e3          	bltu	t4,t3,e05c <__gedf2+0x88>
    e078:	00000513          	li	a0,0
    e07c:	ffde74e3          	bgeu	t3,t4,e064 <__gedf2+0x90>
    e080:	00100513          	li	a0,1
    e084:	fe0590e3          	bnez	a1,e064 <__gedf2+0x90>
    e088:	fc9ff06f          	j	e050 <__gedf2+0x7c>
    e08c:	ffe00513          	li	a0,-2
    e090:	00008067          	ret
    e094:	fa079ae3          	bnez	a5,e048 <__gedf2+0x74>
    e098:	fcb692e3          	bne	a3,a1,e05c <__gedf2+0x88>
    e09c:	fd1556e3          	bge	a0,a7,e068 <__gedf2+0x94>
    e0a0:	fff00513          	li	a0,-1
    e0a4:	fc0690e3          	bnez	a3,e064 <__gedf2+0x90>
    e0a8:	00100513          	li	a0,1
    e0ac:	00008067          	ret

0000e0b0 <__ledf2>:
    e0b0:	0146d793          	srli	a5,a3,0x14
    e0b4:	0145d893          	srli	a7,a1,0x14
    e0b8:	00100737          	lui	a4,0x100
    e0bc:	fff70713          	addi	a4,a4,-1 # fffff <_memory_end+0xdffff>
    e0c0:	00050813          	mv	a6,a0
    e0c4:	00050e13          	mv	t3,a0
    e0c8:	7ff8f893          	andi	a7,a7,2047
    e0cc:	7ff7f513          	andi	a0,a5,2047
    e0d0:	7ff00793          	li	a5,2047
    e0d4:	00b77333          	and	t1,a4,a1
    e0d8:	00060e93          	mv	t4,a2
    e0dc:	00d77733          	and	a4,a4,a3
    e0e0:	01f5d593          	srli	a1,a1,0x1f
    e0e4:	01f6d693          	srli	a3,a3,0x1f
    e0e8:	00f89663          	bne	a7,a5,e0f4 <__ledf2+0x44>
    e0ec:	010367b3          	or	a5,t1,a6
    e0f0:	06079c63          	bnez	a5,e168 <__ledf2+0xb8>
    e0f4:	7ff00793          	li	a5,2047
    e0f8:	00f51663          	bne	a0,a5,e104 <__ledf2+0x54>
    e0fc:	00c767b3          	or	a5,a4,a2
    e100:	06079463          	bnez	a5,e168 <__ledf2+0xb8>
    e104:	00000793          	li	a5,0
    e108:	00089663          	bnez	a7,e114 <__ledf2+0x64>
    e10c:	01036833          	or	a6,t1,a6
    e110:	00183793          	seqz	a5,a6
    e114:	04051e63          	bnez	a0,e170 <__ledf2+0xc0>
    e118:	00c76633          	or	a2,a4,a2
    e11c:	00078c63          	beqz	a5,e134 <__ledf2+0x84>
    e120:	02060063          	beqz	a2,e140 <__ledf2+0x90>
    e124:	00100513          	li	a0,1
    e128:	00069c63          	bnez	a3,e140 <__ledf2+0x90>
    e12c:	fff00513          	li	a0,-1
    e130:	00008067          	ret
    e134:	04061063          	bnez	a2,e174 <__ledf2+0xc4>
    e138:	fff00513          	li	a0,-1
    e13c:	04058463          	beqz	a1,e184 <__ledf2+0xd4>
    e140:	00008067          	ret
    e144:	fea8c0e3          	blt	a7,a0,e124 <__ledf2+0x74>
    e148:	fe6768e3          	bltu	a4,t1,e138 <__ledf2+0x88>
    e14c:	00e31863          	bne	t1,a4,e15c <__ledf2+0xac>
    e150:	ffcee4e3          	bltu	t4,t3,e138 <__ledf2+0x88>
    e154:	00000513          	li	a0,0
    e158:	ffde74e3          	bgeu	t3,t4,e140 <__ledf2+0x90>
    e15c:	00100513          	li	a0,1
    e160:	fe0590e3          	bnez	a1,e140 <__ledf2+0x90>
    e164:	fc9ff06f          	j	e12c <__ledf2+0x7c>
    e168:	00200513          	li	a0,2
    e16c:	00008067          	ret
    e170:	fa079ae3          	bnez	a5,e124 <__ledf2+0x74>
    e174:	fcb692e3          	bne	a3,a1,e138 <__ledf2+0x88>
    e178:	fd1556e3          	bge	a0,a7,e144 <__ledf2+0x94>
    e17c:	fff00513          	li	a0,-1
    e180:	fc0690e3          	bnez	a3,e140 <__ledf2+0x90>
    e184:	00100513          	li	a0,1
    e188:	00008067          	ret

0000e18c <__muldf3>:
    e18c:	fd010113          	addi	sp,sp,-48
    e190:	01512a23          	sw	s5,20(sp)
    e194:	0145da93          	srli	s5,a1,0x14
    e198:	02812423          	sw	s0,40(sp)
    e19c:	02912223          	sw	s1,36(sp)
    e1a0:	01312e23          	sw	s3,28(sp)
    e1a4:	01412c23          	sw	s4,24(sp)
    e1a8:	01612823          	sw	s6,16(sp)
    e1ac:	00c59493          	slli	s1,a1,0xc
    e1b0:	02112623          	sw	ra,44(sp)
    e1b4:	03212023          	sw	s2,32(sp)
    e1b8:	01712623          	sw	s7,12(sp)
    e1bc:	7ffafa93          	andi	s5,s5,2047
    e1c0:	00050413          	mv	s0,a0
    e1c4:	00060b13          	mv	s6,a2
    e1c8:	00068993          	mv	s3,a3
    e1cc:	00c4d493          	srli	s1,s1,0xc
    e1d0:	01f5da13          	srli	s4,a1,0x1f
    e1d4:	240a8e63          	beqz	s5,e430 <__muldf3+0x2a4>
    e1d8:	7ff00793          	li	a5,2047
    e1dc:	2cfa8063          	beq	s5,a5,e49c <__muldf3+0x310>
    e1e0:	00349493          	slli	s1,s1,0x3
    e1e4:	01d55793          	srli	a5,a0,0x1d
    e1e8:	0097e7b3          	or	a5,a5,s1
    e1ec:	008004b7          	lui	s1,0x800
    e1f0:	0097e4b3          	or	s1,a5,s1
    e1f4:	00351913          	slli	s2,a0,0x3
    e1f8:	c01a8a93          	addi	s5,s5,-1023
    e1fc:	00000b93          	li	s7,0
    e200:	0149d713          	srli	a4,s3,0x14
    e204:	00c99413          	slli	s0,s3,0xc
    e208:	7ff77713          	andi	a4,a4,2047
    e20c:	00c45413          	srli	s0,s0,0xc
    e210:	01f9d993          	srli	s3,s3,0x1f
    e214:	2c070063          	beqz	a4,e4d4 <__muldf3+0x348>
    e218:	7ff00793          	li	a5,2047
    e21c:	32f70463          	beq	a4,a5,e544 <__muldf3+0x3b8>
    e220:	00341413          	slli	s0,s0,0x3
    e224:	01db5793          	srli	a5,s6,0x1d
    e228:	0087e7b3          	or	a5,a5,s0
    e22c:	00800437          	lui	s0,0x800
    e230:	0087e433          	or	s0,a5,s0
    e234:	c0170693          	addi	a3,a4,-1023
    e238:	003b1793          	slli	a5,s6,0x3
    e23c:	00000713          	li	a4,0
    e240:	00da8ab3          	add	s5,s5,a3
    e244:	002b9693          	slli	a3,s7,0x2
    e248:	00e6e6b3          	or	a3,a3,a4
    e24c:	00a00613          	li	a2,10
    e250:	001a8513          	addi	a0,s5,1
    e254:	40d64663          	blt	a2,a3,e660 <__muldf3+0x4d4>
    e258:	00200613          	li	a2,2
    e25c:	013a45b3          	xor	a1,s4,s3
    e260:	30d64e63          	blt	a2,a3,e57c <__muldf3+0x3f0>
    e264:	fff68693          	addi	a3,a3,-1
    e268:	00100613          	li	a2,1
    e26c:	32d67a63          	bgeu	a2,a3,e5a0 <__muldf3+0x414>
    e270:	00010337          	lui	t1,0x10
    e274:	fff30e13          	addi	t3,t1,-1 # ffff <__multf3+0xc07>
    e278:	01095713          	srli	a4,s2,0x10
    e27c:	0107d893          	srli	a7,a5,0x10
    e280:	01c97933          	and	s2,s2,t3
    e284:	01c7ff33          	and	t5,a5,t3
    e288:	03e907b3          	mul	a5,s2,t5
    e28c:	03e70eb3          	mul	t4,a4,t5
    e290:	0107d813          	srli	a6,a5,0x10
    e294:	03288633          	mul	a2,a7,s2
    e298:	01d60633          	add	a2,a2,t4
    e29c:	00c80833          	add	a6,a6,a2
    e2a0:	031706b3          	mul	a3,a4,a7
    e2a4:	01d87463          	bgeu	a6,t4,e2ac <__muldf3+0x120>
    e2a8:	006686b3          	add	a3,a3,t1
    e2ac:	01085293          	srli	t0,a6,0x10
    e2b0:	01c87833          	and	a6,a6,t3
    e2b4:	01c7f7b3          	and	a5,a5,t3
    e2b8:	01045613          	srli	a2,s0,0x10
    e2bc:	01c47e33          	and	t3,s0,t3
    e2c0:	01081813          	slli	a6,a6,0x10
    e2c4:	00f80833          	add	a6,a6,a5
    e2c8:	03c90eb3          	mul	t4,s2,t3
    e2cc:	03c707b3          	mul	a5,a4,t3
    e2d0:	03260933          	mul	s2,a2,s2
    e2d4:	02c70333          	mul	t1,a4,a2
    e2d8:	00f90933          	add	s2,s2,a5
    e2dc:	010ed713          	srli	a4,t4,0x10
    e2e0:	01270733          	add	a4,a4,s2
    e2e4:	00f77663          	bgeu	a4,a5,e2f0 <__muldf3+0x164>
    e2e8:	000107b7          	lui	a5,0x10
    e2ec:	00f30333          	add	t1,t1,a5
    e2f0:	00010437          	lui	s0,0x10
    e2f4:	01075793          	srli	a5,a4,0x10
    e2f8:	fff40f93          	addi	t6,s0,-1 # ffff <__multf3+0xc07>
    e2fc:	00678333          	add	t1,a5,t1
    e300:	01f777b3          	and	a5,a4,t6
    e304:	01fefeb3          	and	t4,t4,t6
    e308:	01079793          	slli	a5,a5,0x10
    e30c:	01f4ffb3          	and	t6,s1,t6
    e310:	01d787b3          	add	a5,a5,t4
    e314:	0104de93          	srli	t4,s1,0x10
    e318:	03ff03b3          	mul	t2,t5,t6
    e31c:	00f282b3          	add	t0,t0,a5
    e320:	03ee8f33          	mul	t5,t4,t5
    e324:	0103d713          	srli	a4,t2,0x10
    e328:	03d884b3          	mul	s1,a7,t4
    e32c:	03f888b3          	mul	a7,a7,t6
    e330:	01e888b3          	add	a7,a7,t5
    e334:	01170733          	add	a4,a4,a7
    e338:	01e77463          	bgeu	a4,t5,e340 <__muldf3+0x1b4>
    e33c:	008484b3          	add	s1,s1,s0
    e340:	01075f13          	srli	t5,a4,0x10
    e344:	009f0f33          	add	t5,t5,s1
    e348:	000104b7          	lui	s1,0x10
    e34c:	fff48413          	addi	s0,s1,-1 # ffff <__multf3+0xc07>
    e350:	00877733          	and	a4,a4,s0
    e354:	0083f3b3          	and	t2,t2,s0
    e358:	01071713          	slli	a4,a4,0x10
    e35c:	007708b3          	add	a7,a4,t2
    e360:	03fe03b3          	mul	t2,t3,t6
    e364:	03ce8e33          	mul	t3,t4,t3
    e368:	03d60eb3          	mul	t4,a2,t4
    e36c:	03f60633          	mul	a2,a2,t6
    e370:	0103df93          	srli	t6,t2,0x10
    e374:	01c60633          	add	a2,a2,t3
    e378:	00cf8fb3          	add	t6,t6,a2
    e37c:	01cff463          	bgeu	t6,t3,e384 <__muldf3+0x1f8>
    e380:	009e8eb3          	add	t4,t4,s1
    e384:	008ff733          	and	a4,t6,s0
    e388:	0083f3b3          	and	t2,t2,s0
    e38c:	01071713          	slli	a4,a4,0x10
    e390:	005686b3          	add	a3,a3,t0
    e394:	00770733          	add	a4,a4,t2
    e398:	00670333          	add	t1,a4,t1
    e39c:	00f6b7b3          	sltu	a5,a3,a5
    e3a0:	00f307b3          	add	a5,t1,a5
    e3a4:	00e33633          	sltu	a2,t1,a4
    e3a8:	011688b3          	add	a7,a3,a7
    e3ac:	0067b333          	sltu	t1,a5,t1
    e3b0:	00666633          	or	a2,a2,t1
    e3b4:	00d8b6b3          	sltu	a3,a7,a3
    e3b8:	01e78333          	add	t1,a5,t5
    e3bc:	00d306b3          	add	a3,t1,a3
    e3c0:	00f33733          	sltu	a4,t1,a5
    e3c4:	010fdf93          	srli	t6,t6,0x10
    e3c8:	0066b333          	sltu	t1,a3,t1
    e3cc:	00989793          	slli	a5,a7,0x9
    e3d0:	01f60633          	add	a2,a2,t6
    e3d4:	00676733          	or	a4,a4,t1
    e3d8:	00c70733          	add	a4,a4,a2
    e3dc:	0107e7b3          	or	a5,a5,a6
    e3e0:	01d70733          	add	a4,a4,t4
    e3e4:	00f037b3          	snez	a5,a5
    e3e8:	0178d893          	srli	a7,a7,0x17
    e3ec:	00971713          	slli	a4,a4,0x9
    e3f0:	0176d413          	srli	s0,a3,0x17
    e3f4:	0117e7b3          	or	a5,a5,a7
    e3f8:	00969693          	slli	a3,a3,0x9
    e3fc:	00d7e7b3          	or	a5,a5,a3
    e400:	00771693          	slli	a3,a4,0x7
    e404:	00876433          	or	s0,a4,s0
    e408:	0206d063          	bgez	a3,e428 <__muldf3+0x29c>
    e40c:	0017d713          	srli	a4,a5,0x1
    e410:	0017f793          	andi	a5,a5,1
    e414:	00f76733          	or	a4,a4,a5
    e418:	01f41793          	slli	a5,s0,0x1f
    e41c:	00f767b3          	or	a5,a4,a5
    e420:	00145413          	srli	s0,s0,0x1
    e424:	00050a93          	mv	s5,a0
    e428:	000a8513          	mv	a0,s5
    e42c:	18c0006f          	j	e5b8 <__muldf3+0x42c>
    e430:	00a4e933          	or	s2,s1,a0
    e434:	08090063          	beqz	s2,e4b4 <__muldf3+0x328>
    e438:	04048063          	beqz	s1,e478 <__muldf3+0x2ec>
    e43c:	00048513          	mv	a0,s1
    e440:	480040ef          	jal	128c0 <__clzsi2>
    e444:	ff550713          	addi	a4,a0,-11 # 7fff5 <_memory_end+0x5fff5>
    e448:	01d00793          	li	a5,29
    e44c:	ff850693          	addi	a3,a0,-8
    e450:	40e787b3          	sub	a5,a5,a4
    e454:	00d494b3          	sll	s1,s1,a3
    e458:	00f457b3          	srl	a5,s0,a5
    e45c:	0097e7b3          	or	a5,a5,s1
    e460:	00d414b3          	sll	s1,s0,a3
    e464:	c0d00a93          	li	s5,-1011
    e468:	00048913          	mv	s2,s1
    e46c:	40aa8ab3          	sub	s5,s5,a0
    e470:	00078493          	mv	s1,a5
    e474:	d89ff06f          	j	e1fc <__muldf3+0x70>
    e478:	448040ef          	jal	128c0 <__clzsi2>
    e47c:	00050793          	mv	a5,a0
    e480:	01578713          	addi	a4,a5,21 # 10015 <__multf3+0xc1d>
    e484:	01c00693          	li	a3,28
    e488:	02050513          	addi	a0,a0,32
    e48c:	fae6dee3          	bge	a3,a4,e448 <__muldf3+0x2bc>
    e490:	ff878793          	addi	a5,a5,-8
    e494:	00f417b3          	sll	a5,s0,a5
    e498:	fcdff06f          	j	e464 <__muldf3+0x2d8>
    e49c:	00a4e933          	or	s2,s1,a0
    e4a0:	02091263          	bnez	s2,e4c4 <__muldf3+0x338>
    e4a4:	00000493          	li	s1,0
    e4a8:	7ff00a93          	li	s5,2047
    e4ac:	00200b93          	li	s7,2
    e4b0:	d51ff06f          	j	e200 <__muldf3+0x74>
    e4b4:	00000493          	li	s1,0
    e4b8:	00000a93          	li	s5,0
    e4bc:	00100b93          	li	s7,1
    e4c0:	d41ff06f          	j	e200 <__muldf3+0x74>
    e4c4:	00050913          	mv	s2,a0
    e4c8:	7ff00a93          	li	s5,2047
    e4cc:	00300b93          	li	s7,3
    e4d0:	d31ff06f          	j	e200 <__muldf3+0x74>
    e4d4:	016467b3          	or	a5,s0,s6
    e4d8:	08078263          	beqz	a5,e55c <__muldf3+0x3d0>
    e4dc:	04040063          	beqz	s0,e51c <__muldf3+0x390>
    e4e0:	00040513          	mv	a0,s0
    e4e4:	3dc040ef          	jal	128c0 <__clzsi2>
    e4e8:	ff550693          	addi	a3,a0,-11
    e4ec:	01d00713          	li	a4,29
    e4f0:	ff850793          	addi	a5,a0,-8
    e4f4:	40d70733          	sub	a4,a4,a3
    e4f8:	00f41433          	sll	s0,s0,a5
    e4fc:	00eb5733          	srl	a4,s6,a4
    e500:	00876733          	or	a4,a4,s0
    e504:	00fb1433          	sll	s0,s6,a5
    e508:	c0d00693          	li	a3,-1011
    e50c:	00040793          	mv	a5,s0
    e510:	40a686b3          	sub	a3,a3,a0
    e514:	00070413          	mv	s0,a4
    e518:	d25ff06f          	j	e23c <__muldf3+0xb0>
    e51c:	000b0513          	mv	a0,s6
    e520:	3a0040ef          	jal	128c0 <__clzsi2>
    e524:	00050793          	mv	a5,a0
    e528:	01578693          	addi	a3,a5,21
    e52c:	01c00713          	li	a4,28
    e530:	02050513          	addi	a0,a0,32
    e534:	fad75ce3          	bge	a4,a3,e4ec <__muldf3+0x360>
    e538:	ff878793          	addi	a5,a5,-8
    e53c:	00fb1733          	sll	a4,s6,a5
    e540:	fc9ff06f          	j	e508 <__muldf3+0x37c>
    e544:	016467b3          	or	a5,s0,s6
    e548:	02079263          	bnez	a5,e56c <__muldf3+0x3e0>
    e54c:	00000413          	li	s0,0
    e550:	7ff00693          	li	a3,2047
    e554:	00200713          	li	a4,2
    e558:	ce9ff06f          	j	e240 <__muldf3+0xb4>
    e55c:	00000413          	li	s0,0
    e560:	00000693          	li	a3,0
    e564:	00100713          	li	a4,1
    e568:	cd9ff06f          	j	e240 <__muldf3+0xb4>
    e56c:	000b0793          	mv	a5,s6
    e570:	7ff00693          	li	a3,2047
    e574:	00300713          	li	a4,3
    e578:	cc9ff06f          	j	e240 <__muldf3+0xb4>
    e57c:	00100613          	li	a2,1
    e580:	00d61633          	sll	a2,a2,a3
    e584:	53067693          	andi	a3,a2,1328
    e588:	0e069663          	bnez	a3,e674 <__muldf3+0x4e8>
    e58c:	24067813          	andi	a6,a2,576
    e590:	1a081a63          	bnez	a6,e744 <__muldf3+0x5b8>
    e594:	08867613          	andi	a2,a2,136
    e598:	cc060ce3          	beqz	a2,e270 <__muldf3+0xe4>
    e59c:	00098593          	mv	a1,s3
    e5a0:	00200693          	li	a3,2
    e5a4:	18d70863          	beq	a4,a3,e734 <__muldf3+0x5a8>
    e5a8:	00300693          	li	a3,3
    e5ac:	1ad70463          	beq	a4,a3,e754 <__muldf3+0x5c8>
    e5b0:	00100693          	li	a3,1
    e5b4:	1ad70663          	beq	a4,a3,e760 <__muldf3+0x5d4>
    e5b8:	3ff50613          	addi	a2,a0,1023
    e5bc:	0cc05463          	blez	a2,e684 <__muldf3+0x4f8>
    e5c0:	0077f713          	andi	a4,a5,7
    e5c4:	02070063          	beqz	a4,e5e4 <__muldf3+0x458>
    e5c8:	00f7f713          	andi	a4,a5,15
    e5cc:	00400693          	li	a3,4
    e5d0:	00d70a63          	beq	a4,a3,e5e4 <__muldf3+0x458>
    e5d4:	00478713          	addi	a4,a5,4
    e5d8:	00f736b3          	sltu	a3,a4,a5
    e5dc:	00d40433          	add	s0,s0,a3
    e5e0:	00070793          	mv	a5,a4
    e5e4:	00741713          	slli	a4,s0,0x7
    e5e8:	00075a63          	bgez	a4,e5fc <__muldf3+0x470>
    e5ec:	ff000737          	lui	a4,0xff000
    e5f0:	fff70713          	addi	a4,a4,-1 # feffffff <_memory_end+0xfefdffff>
    e5f4:	00e47433          	and	s0,s0,a4
    e5f8:	40050613          	addi	a2,a0,1024
    e5fc:	7fe00713          	li	a4,2046
    e600:	12c74a63          	blt	a4,a2,e734 <__muldf3+0x5a8>
    e604:	0037d793          	srli	a5,a5,0x3
    e608:	01d41693          	slli	a3,s0,0x1d
    e60c:	00f6e6b3          	or	a3,a3,a5
    e610:	00345713          	srli	a4,s0,0x3
    e614:	00c71713          	slli	a4,a4,0xc
    e618:	02c12083          	lw	ra,44(sp)
    e61c:	02812403          	lw	s0,40(sp)
    e620:	01461613          	slli	a2,a2,0x14
    e624:	00c75713          	srli	a4,a4,0xc
    e628:	01f59593          	slli	a1,a1,0x1f
    e62c:	00e66633          	or	a2,a2,a4
    e630:	00b667b3          	or	a5,a2,a1
    e634:	02412483          	lw	s1,36(sp)
    e638:	02012903          	lw	s2,32(sp)
    e63c:	01c12983          	lw	s3,28(sp)
    e640:	01812a03          	lw	s4,24(sp)
    e644:	01412a83          	lw	s5,20(sp)
    e648:	01012b03          	lw	s6,16(sp)
    e64c:	00c12b83          	lw	s7,12(sp)
    e650:	00068513          	mv	a0,a3
    e654:	00078593          	mv	a1,a5
    e658:	03010113          	addi	sp,sp,48
    e65c:	00008067          	ret
    e660:	00f00613          	li	a2,15
    e664:	0ec68863          	beq	a3,a2,e754 <__muldf3+0x5c8>
    e668:	00b00613          	li	a2,11
    e66c:	000a0593          	mv	a1,s4
    e670:	f2c686e3          	beq	a3,a2,e59c <__muldf3+0x410>
    e674:	00048413          	mv	s0,s1
    e678:	00090793          	mv	a5,s2
    e67c:	000b8713          	mv	a4,s7
    e680:	f21ff06f          	j	e5a0 <__muldf3+0x414>
    e684:	00100713          	li	a4,1
    e688:	40c70733          	sub	a4,a4,a2
    e68c:	03800693          	li	a3,56
    e690:	0ce6c863          	blt	a3,a4,e760 <__muldf3+0x5d4>
    e694:	01f00693          	li	a3,31
    e698:	06e6c463          	blt	a3,a4,e700 <__muldf3+0x574>
    e69c:	41e50513          	addi	a0,a0,1054
    e6a0:	00e7d633          	srl	a2,a5,a4
    e6a4:	00a416b3          	sll	a3,s0,a0
    e6a8:	00a79533          	sll	a0,a5,a0
    e6ac:	00c6e6b3          	or	a3,a3,a2
    e6b0:	00a03533          	snez	a0,a0
    e6b4:	00a6e7b3          	or	a5,a3,a0
    e6b8:	00e45733          	srl	a4,s0,a4
    e6bc:	0077f693          	andi	a3,a5,7
    e6c0:	02068063          	beqz	a3,e6e0 <__muldf3+0x554>
    e6c4:	00f7f693          	andi	a3,a5,15
    e6c8:	00400613          	li	a2,4
    e6cc:	00c68a63          	beq	a3,a2,e6e0 <__muldf3+0x554>
    e6d0:	00478693          	addi	a3,a5,4
    e6d4:	00f6b633          	sltu	a2,a3,a5
    e6d8:	00c70733          	add	a4,a4,a2
    e6dc:	00068793          	mv	a5,a3
    e6e0:	00871693          	slli	a3,a4,0x8
    e6e4:	0806c463          	bltz	a3,e76c <__muldf3+0x5e0>
    e6e8:	01d71693          	slli	a3,a4,0x1d
    e6ec:	0037d793          	srli	a5,a5,0x3
    e6f0:	00f6e6b3          	or	a3,a3,a5
    e6f4:	00375713          	srli	a4,a4,0x3
    e6f8:	00000613          	li	a2,0
    e6fc:	f19ff06f          	j	e614 <__muldf3+0x488>
    e700:	fe100693          	li	a3,-31
    e704:	40c686b3          	sub	a3,a3,a2
    e708:	02000813          	li	a6,32
    e70c:	00d456b3          	srl	a3,s0,a3
    e710:	00000613          	li	a2,0
    e714:	01070663          	beq	a4,a6,e720 <__muldf3+0x594>
    e718:	43e50613          	addi	a2,a0,1086
    e71c:	00c41633          	sll	a2,s0,a2
    e720:	00f66633          	or	a2,a2,a5
    e724:	00c03633          	snez	a2,a2
    e728:	00c6e7b3          	or	a5,a3,a2
    e72c:	00000713          	li	a4,0
    e730:	f8dff06f          	j	e6bc <__muldf3+0x530>
    e734:	00000713          	li	a4,0
    e738:	00000693          	li	a3,0
    e73c:	7ff00613          	li	a2,2047
    e740:	ed5ff06f          	j	e614 <__muldf3+0x488>
    e744:	00080737          	lui	a4,0x80
    e748:	7ff00613          	li	a2,2047
    e74c:	00000593          	li	a1,0
    e750:	ec5ff06f          	j	e614 <__muldf3+0x488>
    e754:	00080737          	lui	a4,0x80
    e758:	00000693          	li	a3,0
    e75c:	fedff06f          	j	e748 <__muldf3+0x5bc>
    e760:	00000713          	li	a4,0
    e764:	00000693          	li	a3,0
    e768:	f91ff06f          	j	e6f8 <__muldf3+0x56c>
    e76c:	00000713          	li	a4,0
    e770:	00000693          	li	a3,0
    e774:	00100613          	li	a2,1
    e778:	e9dff06f          	j	e614 <__muldf3+0x488>

0000e77c <__subdf3>:
    e77c:	00100837          	lui	a6,0x100
    e780:	fff80813          	addi	a6,a6,-1 # fffff <_memory_end+0xdffff>
    e784:	fe010113          	addi	sp,sp,-32
    e788:	00b878b3          	and	a7,a6,a1
    e78c:	0145d713          	srli	a4,a1,0x14
    e790:	01d55793          	srli	a5,a0,0x1d
    e794:	00d87833          	and	a6,a6,a3
    e798:	01212823          	sw	s2,16(sp)
    e79c:	7ff77913          	andi	s2,a4,2047
    e7a0:	00389713          	slli	a4,a7,0x3
    e7a4:	0146d893          	srli	a7,a3,0x14
    e7a8:	00912a23          	sw	s1,20(sp)
    e7ac:	00e7e7b3          	or	a5,a5,a4
    e7b0:	01f5d493          	srli	s1,a1,0x1f
    e7b4:	01d65713          	srli	a4,a2,0x1d
    e7b8:	00381813          	slli	a6,a6,0x3
    e7bc:	00112e23          	sw	ra,28(sp)
    e7c0:	00812c23          	sw	s0,24(sp)
    e7c4:	01312623          	sw	s3,12(sp)
    e7c8:	7ff8f893          	andi	a7,a7,2047
    e7cc:	7ff00593          	li	a1,2047
    e7d0:	00351513          	slli	a0,a0,0x3
    e7d4:	01f6d693          	srli	a3,a3,0x1f
    e7d8:	01076733          	or	a4,a4,a6
    e7dc:	00361613          	slli	a2,a2,0x3
    e7e0:	00b89663          	bne	a7,a1,e7ec <__subdf3+0x70>
    e7e4:	00c765b3          	or	a1,a4,a2
    e7e8:	00059463          	bnez	a1,e7f0 <__subdf3+0x74>
    e7ec:	0016c693          	xori	a3,a3,1
    e7f0:	41190833          	sub	a6,s2,a7
    e7f4:	2a969a63          	bne	a3,s1,eaa8 <__subdf3+0x32c>
    e7f8:	11005c63          	blez	a6,e910 <__subdf3+0x194>
    e7fc:	04089063          	bnez	a7,e83c <__subdf3+0xc0>
    e800:	00c766b3          	or	a3,a4,a2
    e804:	66068063          	beqz	a3,ee64 <__subdf3+0x6e8>
    e808:	fff80593          	addi	a1,a6,-1
    e80c:	02059063          	bnez	a1,e82c <__subdf3+0xb0>
    e810:	00c50633          	add	a2,a0,a2
    e814:	00a636b3          	sltu	a3,a2,a0
    e818:	00e78733          	add	a4,a5,a4
    e81c:	00060513          	mv	a0,a2
    e820:	00d707b3          	add	a5,a4,a3
    e824:	00100913          	li	s2,1
    e828:	06c0006f          	j	e894 <__subdf3+0x118>
    e82c:	7ff00693          	li	a3,2047
    e830:	02d81063          	bne	a6,a3,e850 <__subdf3+0xd4>
    e834:	7ff00913          	li	s2,2047
    e838:	1f80006f          	j	ea30 <__subdf3+0x2b4>
    e83c:	7ff00693          	li	a3,2047
    e840:	1ed90863          	beq	s2,a3,ea30 <__subdf3+0x2b4>
    e844:	008006b7          	lui	a3,0x800
    e848:	00d76733          	or	a4,a4,a3
    e84c:	00080593          	mv	a1,a6
    e850:	03800693          	li	a3,56
    e854:	0ab6c863          	blt	a3,a1,e904 <__subdf3+0x188>
    e858:	01f00693          	li	a3,31
    e85c:	06b6ca63          	blt	a3,a1,e8d0 <__subdf3+0x154>
    e860:	02000813          	li	a6,32
    e864:	40b80833          	sub	a6,a6,a1
    e868:	010716b3          	sll	a3,a4,a6
    e86c:	00b658b3          	srl	a7,a2,a1
    e870:	01061833          	sll	a6,a2,a6
    e874:	0116e6b3          	or	a3,a3,a7
    e878:	01003833          	snez	a6,a6
    e87c:	0106e6b3          	or	a3,a3,a6
    e880:	00b755b3          	srl	a1,a4,a1
    e884:	00a68533          	add	a0,a3,a0
    e888:	00f585b3          	add	a1,a1,a5
    e88c:	00d536b3          	sltu	a3,a0,a3
    e890:	00d587b3          	add	a5,a1,a3
    e894:	00879713          	slli	a4,a5,0x8
    e898:	18075c63          	bgez	a4,ea30 <__subdf3+0x2b4>
    e89c:	00190913          	addi	s2,s2,1
    e8a0:	7ff00713          	li	a4,2047
    e8a4:	5ae90a63          	beq	s2,a4,ee58 <__subdf3+0x6dc>
    e8a8:	ff800737          	lui	a4,0xff800
    e8ac:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    e8b0:	00e7f733          	and	a4,a5,a4
    e8b4:	00155793          	srli	a5,a0,0x1
    e8b8:	00157513          	andi	a0,a0,1
    e8bc:	00a7e7b3          	or	a5,a5,a0
    e8c0:	01f71513          	slli	a0,a4,0x1f
    e8c4:	00f56533          	or	a0,a0,a5
    e8c8:	00175793          	srli	a5,a4,0x1
    e8cc:	1640006f          	j	ea30 <__subdf3+0x2b4>
    e8d0:	fe058693          	addi	a3,a1,-32
    e8d4:	02000893          	li	a7,32
    e8d8:	00d756b3          	srl	a3,a4,a3
    e8dc:	00000813          	li	a6,0
    e8e0:	01158863          	beq	a1,a7,e8f0 <__subdf3+0x174>
    e8e4:	04000813          	li	a6,64
    e8e8:	40b80833          	sub	a6,a6,a1
    e8ec:	01071833          	sll	a6,a4,a6
    e8f0:	00c86833          	or	a6,a6,a2
    e8f4:	01003833          	snez	a6,a6
    e8f8:	0106e6b3          	or	a3,a3,a6
    e8fc:	00000593          	li	a1,0
    e900:	f85ff06f          	j	e884 <__subdf3+0x108>
    e904:	00c766b3          	or	a3,a4,a2
    e908:	00d036b3          	snez	a3,a3
    e90c:	ff1ff06f          	j	e8fc <__subdf3+0x180>
    e910:	0c080a63          	beqz	a6,e9e4 <__subdf3+0x268>
    e914:	412886b3          	sub	a3,a7,s2
    e918:	02091463          	bnez	s2,e940 <__subdf3+0x1c4>
    e91c:	00a7e5b3          	or	a1,a5,a0
    e920:	50058e63          	beqz	a1,ee3c <__subdf3+0x6c0>
    e924:	fff68593          	addi	a1,a3,-1 # 7fffff <_memory_end+0x7dffff>
    e928:	ee0584e3          	beqz	a1,e810 <__subdf3+0x94>
    e92c:	7ff00813          	li	a6,2047
    e930:	03069263          	bne	a3,a6,e954 <__subdf3+0x1d8>
    e934:	00070793          	mv	a5,a4
    e938:	00060513          	mv	a0,a2
    e93c:	ef9ff06f          	j	e834 <__subdf3+0xb8>
    e940:	7ff00593          	li	a1,2047
    e944:	feb888e3          	beq	a7,a1,e934 <__subdf3+0x1b8>
    e948:	008005b7          	lui	a1,0x800
    e94c:	00b7e7b3          	or	a5,a5,a1
    e950:	00068593          	mv	a1,a3
    e954:	03800693          	li	a3,56
    e958:	08b6c063          	blt	a3,a1,e9d8 <__subdf3+0x25c>
    e95c:	01f00693          	li	a3,31
    e960:	04b6c263          	blt	a3,a1,e9a4 <__subdf3+0x228>
    e964:	02000813          	li	a6,32
    e968:	40b80833          	sub	a6,a6,a1
    e96c:	010796b3          	sll	a3,a5,a6
    e970:	00b55333          	srl	t1,a0,a1
    e974:	01051833          	sll	a6,a0,a6
    e978:	0066e6b3          	or	a3,a3,t1
    e97c:	01003833          	snez	a6,a6
    e980:	0106e6b3          	or	a3,a3,a6
    e984:	00b7d5b3          	srl	a1,a5,a1
    e988:	00c68633          	add	a2,a3,a2
    e98c:	00e585b3          	add	a1,a1,a4
    e990:	00d636b3          	sltu	a3,a2,a3
    e994:	00060513          	mv	a0,a2
    e998:	00d587b3          	add	a5,a1,a3
    e99c:	00088913          	mv	s2,a7
    e9a0:	ef5ff06f          	j	e894 <__subdf3+0x118>
    e9a4:	fe058693          	addi	a3,a1,-32 # 7fffe0 <_memory_end+0x7dffe0>
    e9a8:	02000313          	li	t1,32
    e9ac:	00d7d6b3          	srl	a3,a5,a3
    e9b0:	00000813          	li	a6,0
    e9b4:	00658863          	beq	a1,t1,e9c4 <__subdf3+0x248>
    e9b8:	04000813          	li	a6,64
    e9bc:	40b80833          	sub	a6,a6,a1
    e9c0:	01079833          	sll	a6,a5,a6
    e9c4:	00a86833          	or	a6,a6,a0
    e9c8:	01003833          	snez	a6,a6
    e9cc:	0106e6b3          	or	a3,a3,a6
    e9d0:	00000593          	li	a1,0
    e9d4:	fb5ff06f          	j	e988 <__subdf3+0x20c>
    e9d8:	00a7e6b3          	or	a3,a5,a0
    e9dc:	00d036b3          	snez	a3,a3
    e9e0:	ff1ff06f          	j	e9d0 <__subdf3+0x254>
    e9e4:	00190693          	addi	a3,s2,1
    e9e8:	7fe6f593          	andi	a1,a3,2046
    e9ec:	08059663          	bnez	a1,ea78 <__subdf3+0x2fc>
    e9f0:	00a7e6b3          	or	a3,a5,a0
    e9f4:	06091263          	bnez	s2,ea58 <__subdf3+0x2dc>
    e9f8:	44068863          	beqz	a3,ee48 <__subdf3+0x6cc>
    e9fc:	00c766b3          	or	a3,a4,a2
    ea00:	02068863          	beqz	a3,ea30 <__subdf3+0x2b4>
    ea04:	00c50633          	add	a2,a0,a2
    ea08:	00a636b3          	sltu	a3,a2,a0
    ea0c:	00e78733          	add	a4,a5,a4
    ea10:	00d707b3          	add	a5,a4,a3
    ea14:	00879713          	slli	a4,a5,0x8
    ea18:	00060513          	mv	a0,a2
    ea1c:	00075a63          	bgez	a4,ea30 <__subdf3+0x2b4>
    ea20:	ff800737          	lui	a4,0xff800
    ea24:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    ea28:	00e7f7b3          	and	a5,a5,a4
    ea2c:	00100913          	li	s2,1
    ea30:	00757713          	andi	a4,a0,7
    ea34:	44070863          	beqz	a4,ee84 <__subdf3+0x708>
    ea38:	00f57713          	andi	a4,a0,15
    ea3c:	00400693          	li	a3,4
    ea40:	44d70263          	beq	a4,a3,ee84 <__subdf3+0x708>
    ea44:	00450713          	addi	a4,a0,4
    ea48:	00a736b3          	sltu	a3,a4,a0
    ea4c:	00d787b3          	add	a5,a5,a3
    ea50:	00070513          	mv	a0,a4
    ea54:	4300006f          	j	ee84 <__subdf3+0x708>
    ea58:	ec068ee3          	beqz	a3,e934 <__subdf3+0x1b8>
    ea5c:	00c76633          	or	a2,a4,a2
    ea60:	dc060ae3          	beqz	a2,e834 <__subdf3+0xb8>
    ea64:	00000493          	li	s1,0
    ea68:	004007b7          	lui	a5,0x400
    ea6c:	00000513          	li	a0,0
    ea70:	7ff00913          	li	s2,2047
    ea74:	4100006f          	j	ee84 <__subdf3+0x708>
    ea78:	7ff00593          	li	a1,2047
    ea7c:	3cb68c63          	beq	a3,a1,ee54 <__subdf3+0x6d8>
    ea80:	00c50633          	add	a2,a0,a2
    ea84:	00a63533          	sltu	a0,a2,a0
    ea88:	00e78733          	add	a4,a5,a4
    ea8c:	00a70733          	add	a4,a4,a0
    ea90:	01f71513          	slli	a0,a4,0x1f
    ea94:	00165613          	srli	a2,a2,0x1
    ea98:	00c56533          	or	a0,a0,a2
    ea9c:	00175793          	srli	a5,a4,0x1
    eaa0:	00068913          	mv	s2,a3
    eaa4:	f8dff06f          	j	ea30 <__subdf3+0x2b4>
    eaa8:	0f005c63          	blez	a6,eba0 <__subdf3+0x424>
    eaac:	08089e63          	bnez	a7,eb48 <__subdf3+0x3cc>
    eab0:	00c766b3          	or	a3,a4,a2
    eab4:	3a068863          	beqz	a3,ee64 <__subdf3+0x6e8>
    eab8:	fff80693          	addi	a3,a6,-1
    eabc:	02069063          	bnez	a3,eadc <__subdf3+0x360>
    eac0:	40c50633          	sub	a2,a0,a2
    eac4:	00c536b3          	sltu	a3,a0,a2
    eac8:	40e78733          	sub	a4,a5,a4
    eacc:	00060513          	mv	a0,a2
    ead0:	40d707b3          	sub	a5,a4,a3
    ead4:	00100913          	li	s2,1
    ead8:	0540006f          	j	eb2c <__subdf3+0x3b0>
    eadc:	7ff00593          	li	a1,2047
    eae0:	d4b80ae3          	beq	a6,a1,e834 <__subdf3+0xb8>
    eae4:	03800593          	li	a1,56
    eae8:	0ad5c663          	blt	a1,a3,eb94 <__subdf3+0x418>
    eaec:	01f00593          	li	a1,31
    eaf0:	06d5c863          	blt	a1,a3,eb60 <__subdf3+0x3e4>
    eaf4:	02000813          	li	a6,32
    eaf8:	40d80833          	sub	a6,a6,a3
    eafc:	00d658b3          	srl	a7,a2,a3
    eb00:	010715b3          	sll	a1,a4,a6
    eb04:	01061833          	sll	a6,a2,a6
    eb08:	0115e5b3          	or	a1,a1,a7
    eb0c:	01003833          	snez	a6,a6
    eb10:	0105e633          	or	a2,a1,a6
    eb14:	00d756b3          	srl	a3,a4,a3
    eb18:	40c50633          	sub	a2,a0,a2
    eb1c:	00c53733          	sltu	a4,a0,a2
    eb20:	40d786b3          	sub	a3,a5,a3
    eb24:	00060513          	mv	a0,a2
    eb28:	40e687b3          	sub	a5,a3,a4
    eb2c:	00879713          	slli	a4,a5,0x8
    eb30:	f00750e3          	bgez	a4,ea30 <__subdf3+0x2b4>
    eb34:	00800437          	lui	s0,0x800
    eb38:	fff40413          	addi	s0,s0,-1 # 7fffff <_memory_end+0x7dffff>
    eb3c:	0087f433          	and	s0,a5,s0
    eb40:	00050993          	mv	s3,a0
    eb44:	2100006f          	j	ed54 <__subdf3+0x5d8>
    eb48:	7ff00693          	li	a3,2047
    eb4c:	eed902e3          	beq	s2,a3,ea30 <__subdf3+0x2b4>
    eb50:	008006b7          	lui	a3,0x800
    eb54:	00d76733          	or	a4,a4,a3
    eb58:	00080693          	mv	a3,a6
    eb5c:	f89ff06f          	j	eae4 <__subdf3+0x368>
    eb60:	fe068593          	addi	a1,a3,-32 # 7fffe0 <_memory_end+0x7dffe0>
    eb64:	02000893          	li	a7,32
    eb68:	00b755b3          	srl	a1,a4,a1
    eb6c:	00000813          	li	a6,0
    eb70:	01168863          	beq	a3,a7,eb80 <__subdf3+0x404>
    eb74:	04000813          	li	a6,64
    eb78:	40d80833          	sub	a6,a6,a3
    eb7c:	01071833          	sll	a6,a4,a6
    eb80:	00c86833          	or	a6,a6,a2
    eb84:	01003833          	snez	a6,a6
    eb88:	0105e633          	or	a2,a1,a6
    eb8c:	00000693          	li	a3,0
    eb90:	f89ff06f          	j	eb18 <__subdf3+0x39c>
    eb94:	00c76633          	or	a2,a4,a2
    eb98:	00c03633          	snez	a2,a2
    eb9c:	ff1ff06f          	j	eb8c <__subdf3+0x410>
    eba0:	0e080863          	beqz	a6,ec90 <__subdf3+0x514>
    eba4:	41288833          	sub	a6,a7,s2
    eba8:	04091263          	bnez	s2,ebec <__subdf3+0x470>
    ebac:	00a7e5b3          	or	a1,a5,a0
    ebb0:	2a058e63          	beqz	a1,ee6c <__subdf3+0x6f0>
    ebb4:	fff80593          	addi	a1,a6,-1
    ebb8:	00059e63          	bnez	a1,ebd4 <__subdf3+0x458>
    ebbc:	40a60533          	sub	a0,a2,a0
    ebc0:	40f70733          	sub	a4,a4,a5
    ebc4:	00a63633          	sltu	a2,a2,a0
    ebc8:	40c707b3          	sub	a5,a4,a2
    ebcc:	00068493          	mv	s1,a3
    ebd0:	f05ff06f          	j	ead4 <__subdf3+0x358>
    ebd4:	7ff00313          	li	t1,2047
    ebd8:	02681463          	bne	a6,t1,ec00 <__subdf3+0x484>
    ebdc:	00070793          	mv	a5,a4
    ebe0:	00060513          	mv	a0,a2
    ebe4:	7ff00913          	li	s2,2047
    ebe8:	0d00006f          	j	ecb8 <__subdf3+0x53c>
    ebec:	7ff00593          	li	a1,2047
    ebf0:	feb886e3          	beq	a7,a1,ebdc <__subdf3+0x460>
    ebf4:	008005b7          	lui	a1,0x800
    ebf8:	00b7e7b3          	or	a5,a5,a1
    ebfc:	00080593          	mv	a1,a6
    ec00:	03800813          	li	a6,56
    ec04:	08b84063          	blt	a6,a1,ec84 <__subdf3+0x508>
    ec08:	01f00813          	li	a6,31
    ec0c:	04b84263          	blt	a6,a1,ec50 <__subdf3+0x4d4>
    ec10:	02000313          	li	t1,32
    ec14:	40b30333          	sub	t1,t1,a1
    ec18:	00b55e33          	srl	t3,a0,a1
    ec1c:	00679833          	sll	a6,a5,t1
    ec20:	00651333          	sll	t1,a0,t1
    ec24:	01c86833          	or	a6,a6,t3
    ec28:	00603333          	snez	t1,t1
    ec2c:	00686533          	or	a0,a6,t1
    ec30:	00b7d5b3          	srl	a1,a5,a1
    ec34:	40a60533          	sub	a0,a2,a0
    ec38:	40b705b3          	sub	a1,a4,a1
    ec3c:	00a63633          	sltu	a2,a2,a0
    ec40:	40c587b3          	sub	a5,a1,a2
    ec44:	00088913          	mv	s2,a7
    ec48:	00068493          	mv	s1,a3
    ec4c:	ee1ff06f          	j	eb2c <__subdf3+0x3b0>
    ec50:	fe058813          	addi	a6,a1,-32 # 7fffe0 <_memory_end+0x7dffe0>
    ec54:	02000e13          	li	t3,32
    ec58:	0107d833          	srl	a6,a5,a6
    ec5c:	00000313          	li	t1,0
    ec60:	01c58863          	beq	a1,t3,ec70 <__subdf3+0x4f4>
    ec64:	04000313          	li	t1,64
    ec68:	40b30333          	sub	t1,t1,a1
    ec6c:	00679333          	sll	t1,a5,t1
    ec70:	00a36333          	or	t1,t1,a0
    ec74:	00603333          	snez	t1,t1
    ec78:	00686533          	or	a0,a6,t1
    ec7c:	00000593          	li	a1,0
    ec80:	fb5ff06f          	j	ec34 <__subdf3+0x4b8>
    ec84:	00a7e533          	or	a0,a5,a0
    ec88:	00a03533          	snez	a0,a0
    ec8c:	ff1ff06f          	j	ec7c <__subdf3+0x500>
    ec90:	00190593          	addi	a1,s2,1
    ec94:	7fe5f593          	andi	a1,a1,2046
    ec98:	08059663          	bnez	a1,ed24 <__subdf3+0x5a8>
    ec9c:	00c765b3          	or	a1,a4,a2
    eca0:	00a7e833          	or	a6,a5,a0
    eca4:	06091063          	bnez	s2,ed04 <__subdf3+0x588>
    eca8:	00081c63          	bnez	a6,ecc0 <__subdf3+0x544>
    ecac:	10058e63          	beqz	a1,edc8 <__subdf3+0x64c>
    ecb0:	00070793          	mv	a5,a4
    ecb4:	00060513          	mv	a0,a2
    ecb8:	00068493          	mv	s1,a3
    ecbc:	d75ff06f          	j	ea30 <__subdf3+0x2b4>
    ecc0:	d60588e3          	beqz	a1,ea30 <__subdf3+0x2b4>
    ecc4:	40c50833          	sub	a6,a0,a2
    ecc8:	010538b3          	sltu	a7,a0,a6
    eccc:	40e785b3          	sub	a1,a5,a4
    ecd0:	411585b3          	sub	a1,a1,a7
    ecd4:	00859893          	slli	a7,a1,0x8
    ecd8:	0008dc63          	bgez	a7,ecf0 <__subdf3+0x574>
    ecdc:	40a60533          	sub	a0,a2,a0
    ece0:	40f70733          	sub	a4,a4,a5
    ece4:	00a63633          	sltu	a2,a2,a0
    ece8:	40c707b3          	sub	a5,a4,a2
    ecec:	fcdff06f          	j	ecb8 <__subdf3+0x53c>
    ecf0:	00b86533          	or	a0,a6,a1
    ecf4:	18050463          	beqz	a0,ee7c <__subdf3+0x700>
    ecf8:	00058793          	mv	a5,a1
    ecfc:	00080513          	mv	a0,a6
    ed00:	d31ff06f          	j	ea30 <__subdf3+0x2b4>
    ed04:	00081c63          	bnez	a6,ed1c <__subdf3+0x5a0>
    ed08:	d4058ee3          	beqz	a1,ea64 <__subdf3+0x2e8>
    ed0c:	00070793          	mv	a5,a4
    ed10:	00060513          	mv	a0,a2
    ed14:	00068493          	mv	s1,a3
    ed18:	b1dff06f          	j	e834 <__subdf3+0xb8>
    ed1c:	b0058ce3          	beqz	a1,e834 <__subdf3+0xb8>
    ed20:	d45ff06f          	j	ea64 <__subdf3+0x2e8>
    ed24:	40c505b3          	sub	a1,a0,a2
    ed28:	00b53833          	sltu	a6,a0,a1
    ed2c:	40e78433          	sub	s0,a5,a4
    ed30:	41040433          	sub	s0,s0,a6
    ed34:	00841813          	slli	a6,s0,0x8
    ed38:	00058993          	mv	s3,a1
    ed3c:	08085063          	bgez	a6,edbc <__subdf3+0x640>
    ed40:	40a609b3          	sub	s3,a2,a0
    ed44:	40f70433          	sub	s0,a4,a5
    ed48:	01363633          	sltu	a2,a2,s3
    ed4c:	40c40433          	sub	s0,s0,a2
    ed50:	00068493          	mv	s1,a3
    ed54:	06040e63          	beqz	s0,edd0 <__subdf3+0x654>
    ed58:	00040513          	mv	a0,s0
    ed5c:	365030ef          	jal	128c0 <__clzsi2>
    ed60:	ff850693          	addi	a3,a0,-8
    ed64:	02000793          	li	a5,32
    ed68:	40d787b3          	sub	a5,a5,a3
    ed6c:	00d41433          	sll	s0,s0,a3
    ed70:	00f9d7b3          	srl	a5,s3,a5
    ed74:	0087e7b3          	or	a5,a5,s0
    ed78:	00d99433          	sll	s0,s3,a3
    ed7c:	0b26c463          	blt	a3,s2,ee24 <__subdf3+0x6a8>
    ed80:	412686b3          	sub	a3,a3,s2
    ed84:	00168613          	addi	a2,a3,1
    ed88:	01f00713          	li	a4,31
    ed8c:	06c74263          	blt	a4,a2,edf0 <__subdf3+0x674>
    ed90:	02000713          	li	a4,32
    ed94:	40c70733          	sub	a4,a4,a2
    ed98:	00e79533          	sll	a0,a5,a4
    ed9c:	00c456b3          	srl	a3,s0,a2
    eda0:	00e41733          	sll	a4,s0,a4
    eda4:	00d56533          	or	a0,a0,a3
    eda8:	00e03733          	snez	a4,a4
    edac:	00e56533          	or	a0,a0,a4
    edb0:	00c7d7b3          	srl	a5,a5,a2
    edb4:	00000913          	li	s2,0
    edb8:	c79ff06f          	j	ea30 <__subdf3+0x2b4>
    edbc:	0085e5b3          	or	a1,a1,s0
    edc0:	f8059ae3          	bnez	a1,ed54 <__subdf3+0x5d8>
    edc4:	00000913          	li	s2,0
    edc8:	00000493          	li	s1,0
    edcc:	08c0006f          	j	ee58 <__subdf3+0x6dc>
    edd0:	00098513          	mv	a0,s3
    edd4:	2ed030ef          	jal	128c0 <__clzsi2>
    edd8:	01850693          	addi	a3,a0,24
    eddc:	01f00793          	li	a5,31
    ede0:	f8d7d2e3          	bge	a5,a3,ed64 <__subdf3+0x5e8>
    ede4:	ff850793          	addi	a5,a0,-8
    ede8:	00f997b3          	sll	a5,s3,a5
    edec:	f91ff06f          	j	ed7c <__subdf3+0x600>
    edf0:	fe168693          	addi	a3,a3,-31
    edf4:	00d7d533          	srl	a0,a5,a3
    edf8:	02000693          	li	a3,32
    edfc:	00000713          	li	a4,0
    ee00:	00d60863          	beq	a2,a3,ee10 <__subdf3+0x694>
    ee04:	04000713          	li	a4,64
    ee08:	40c70733          	sub	a4,a4,a2
    ee0c:	00e79733          	sll	a4,a5,a4
    ee10:	00e46733          	or	a4,s0,a4
    ee14:	00e03733          	snez	a4,a4
    ee18:	00e56533          	or	a0,a0,a4
    ee1c:	00000793          	li	a5,0
    ee20:	f95ff06f          	j	edb4 <__subdf3+0x638>
    ee24:	ff800737          	lui	a4,0xff800
    ee28:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    ee2c:	40d90933          	sub	s2,s2,a3
    ee30:	00e7f7b3          	and	a5,a5,a4
    ee34:	00040513          	mv	a0,s0
    ee38:	bf9ff06f          	j	ea30 <__subdf3+0x2b4>
    ee3c:	00070793          	mv	a5,a4
    ee40:	00060513          	mv	a0,a2
    ee44:	c5dff06f          	j	eaa0 <__subdf3+0x324>
    ee48:	00070793          	mv	a5,a4
    ee4c:	00060513          	mv	a0,a2
    ee50:	be1ff06f          	j	ea30 <__subdf3+0x2b4>
    ee54:	7ff00913          	li	s2,2047
    ee58:	00000793          	li	a5,0
    ee5c:	00000513          	li	a0,0
    ee60:	0240006f          	j	ee84 <__subdf3+0x708>
    ee64:	00080913          	mv	s2,a6
    ee68:	bc9ff06f          	j	ea30 <__subdf3+0x2b4>
    ee6c:	00070793          	mv	a5,a4
    ee70:	00060513          	mv	a0,a2
    ee74:	00080913          	mv	s2,a6
    ee78:	e41ff06f          	j	ecb8 <__subdf3+0x53c>
    ee7c:	00000793          	li	a5,0
    ee80:	00000493          	li	s1,0
    ee84:	00879713          	slli	a4,a5,0x8
    ee88:	00075e63          	bgez	a4,eea4 <__subdf3+0x728>
    ee8c:	00190913          	addi	s2,s2,1
    ee90:	7ff00713          	li	a4,2047
    ee94:	08e90263          	beq	s2,a4,ef18 <__subdf3+0x79c>
    ee98:	ff800737          	lui	a4,0xff800
    ee9c:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    eea0:	00e7f7b3          	and	a5,a5,a4
    eea4:	01d79693          	slli	a3,a5,0x1d
    eea8:	00355513          	srli	a0,a0,0x3
    eeac:	7ff00713          	li	a4,2047
    eeb0:	00a6e6b3          	or	a3,a3,a0
    eeb4:	0037d793          	srli	a5,a5,0x3
    eeb8:	00e91e63          	bne	s2,a4,eed4 <__subdf3+0x758>
    eebc:	00f6e6b3          	or	a3,a3,a5
    eec0:	00000793          	li	a5,0
    eec4:	00068863          	beqz	a3,eed4 <__subdf3+0x758>
    eec8:	000807b7          	lui	a5,0x80
    eecc:	00000693          	li	a3,0
    eed0:	00000493          	li	s1,0
    eed4:	01491713          	slli	a4,s2,0x14
    eed8:	7ff00637          	lui	a2,0x7ff00
    eedc:	00c79793          	slli	a5,a5,0xc
    eee0:	00c77733          	and	a4,a4,a2
    eee4:	01c12083          	lw	ra,28(sp)
    eee8:	01812403          	lw	s0,24(sp)
    eeec:	00c7d793          	srli	a5,a5,0xc
    eef0:	00f767b3          	or	a5,a4,a5
    eef4:	01f49713          	slli	a4,s1,0x1f
    eef8:	00e7e633          	or	a2,a5,a4
    eefc:	01412483          	lw	s1,20(sp)
    ef00:	01012903          	lw	s2,16(sp)
    ef04:	00c12983          	lw	s3,12(sp)
    ef08:	00068513          	mv	a0,a3
    ef0c:	00060593          	mv	a1,a2
    ef10:	02010113          	addi	sp,sp,32
    ef14:	00008067          	ret
    ef18:	00000793          	li	a5,0
    ef1c:	00000513          	li	a0,0
    ef20:	f85ff06f          	j	eea4 <__subdf3+0x728>

0000ef24 <__fixdfsi>:
    ef24:	0145d713          	srli	a4,a1,0x14
    ef28:	001006b7          	lui	a3,0x100
    ef2c:	fff68793          	addi	a5,a3,-1 # fffff <_memory_end+0xdffff>
    ef30:	7ff77713          	andi	a4,a4,2047
    ef34:	3fe00613          	li	a2,1022
    ef38:	00b7f7b3          	and	a5,a5,a1
    ef3c:	01f5d593          	srli	a1,a1,0x1f
    ef40:	04e65e63          	bge	a2,a4,ef9c <__fixdfsi+0x78>
    ef44:	41d00613          	li	a2,1053
    ef48:	00e65a63          	bge	a2,a4,ef5c <__fixdfsi+0x38>
    ef4c:	80000537          	lui	a0,0x80000
    ef50:	fff50513          	addi	a0,a0,-1 # 7fffffff <_memory_end+0x7ffdffff>
    ef54:	00a58533          	add	a0,a1,a0
    ef58:	00008067          	ret
    ef5c:	00d7e7b3          	or	a5,a5,a3
    ef60:	43300693          	li	a3,1075
    ef64:	40e686b3          	sub	a3,a3,a4
    ef68:	01f00613          	li	a2,31
    ef6c:	02d64063          	blt	a2,a3,ef8c <__fixdfsi+0x68>
    ef70:	bed70713          	addi	a4,a4,-1043
    ef74:	00e797b3          	sll	a5,a5,a4
    ef78:	00d55533          	srl	a0,a0,a3
    ef7c:	00a7e533          	or	a0,a5,a0
    ef80:	02058063          	beqz	a1,efa0 <__fixdfsi+0x7c>
    ef84:	40a00533          	neg	a0,a0
    ef88:	00008067          	ret
    ef8c:	41300693          	li	a3,1043
    ef90:	40e68733          	sub	a4,a3,a4
    ef94:	00e7d533          	srl	a0,a5,a4
    ef98:	fe9ff06f          	j	ef80 <__fixdfsi+0x5c>
    ef9c:	00000513          	li	a0,0
    efa0:	00008067          	ret

0000efa4 <__floatsidf>:
    efa4:	ff010113          	addi	sp,sp,-16
    efa8:	00112623          	sw	ra,12(sp)
    efac:	00812423          	sw	s0,8(sp)
    efb0:	00912223          	sw	s1,4(sp)
    efb4:	08050663          	beqz	a0,f040 <__floatsidf+0x9c>
    efb8:	41f55793          	srai	a5,a0,0x1f
    efbc:	00a7c433          	xor	s0,a5,a0
    efc0:	40f40433          	sub	s0,s0,a5
    efc4:	01f55493          	srli	s1,a0,0x1f
    efc8:	00040513          	mv	a0,s0
    efcc:	0f5030ef          	jal	128c0 <__clzsi2>
    efd0:	41e00713          	li	a4,1054
    efd4:	00a00793          	li	a5,10
    efd8:	40a70733          	sub	a4,a4,a0
    efdc:	04a7c863          	blt	a5,a0,f02c <__floatsidf+0x88>
    efe0:	00b00793          	li	a5,11
    efe4:	40a787b3          	sub	a5,a5,a0
    efe8:	01550513          	addi	a0,a0,21
    efec:	00f457b3          	srl	a5,s0,a5
    eff0:	00a41433          	sll	s0,s0,a0
    eff4:	00048513          	mv	a0,s1
    eff8:	00c79793          	slli	a5,a5,0xc
    effc:	00c7d793          	srli	a5,a5,0xc
    f000:	01471713          	slli	a4,a4,0x14
    f004:	01f51513          	slli	a0,a0,0x1f
    f008:	00f76733          	or	a4,a4,a5
    f00c:	00c12083          	lw	ra,12(sp)
    f010:	00a767b3          	or	a5,a4,a0
    f014:	00040513          	mv	a0,s0
    f018:	00812403          	lw	s0,8(sp)
    f01c:	00412483          	lw	s1,4(sp)
    f020:	00078593          	mv	a1,a5
    f024:	01010113          	addi	sp,sp,16
    f028:	00008067          	ret
    f02c:	ff550513          	addi	a0,a0,-11
    f030:	00a417b3          	sll	a5,s0,a0
    f034:	00048513          	mv	a0,s1
    f038:	00000413          	li	s0,0
    f03c:	fbdff06f          	j	eff8 <__floatsidf+0x54>
    f040:	00000713          	li	a4,0
    f044:	00000793          	li	a5,0
    f048:	ff1ff06f          	j	f038 <__floatsidf+0x94>

0000f04c <__floatunsidf>:
    f04c:	ff010113          	addi	sp,sp,-16
    f050:	00812423          	sw	s0,8(sp)
    f054:	00112623          	sw	ra,12(sp)
    f058:	00050413          	mv	s0,a0
    f05c:	06050263          	beqz	a0,f0c0 <__floatunsidf+0x74>
    f060:	061030ef          	jal	128c0 <__clzsi2>
    f064:	41e00713          	li	a4,1054
    f068:	00a00793          	li	a5,10
    f06c:	40a70733          	sub	a4,a4,a0
    f070:	04a7c063          	blt	a5,a0,f0b0 <__floatunsidf+0x64>
    f074:	00b00793          	li	a5,11
    f078:	40a787b3          	sub	a5,a5,a0
    f07c:	01550513          	addi	a0,a0,21
    f080:	00f457b3          	srl	a5,s0,a5
    f084:	00a41433          	sll	s0,s0,a0
    f088:	00c12083          	lw	ra,12(sp)
    f08c:	00040513          	mv	a0,s0
    f090:	00c79793          	slli	a5,a5,0xc
    f094:	00812403          	lw	s0,8(sp)
    f098:	01471713          	slli	a4,a4,0x14
    f09c:	00c7d793          	srli	a5,a5,0xc
    f0a0:	00f766b3          	or	a3,a4,a5
    f0a4:	00068593          	mv	a1,a3
    f0a8:	01010113          	addi	sp,sp,16
    f0ac:	00008067          	ret
    f0b0:	ff550513          	addi	a0,a0,-11
    f0b4:	00a417b3          	sll	a5,s0,a0
    f0b8:	00000413          	li	s0,0
    f0bc:	fcdff06f          	j	f088 <__floatunsidf+0x3c>
    f0c0:	00000793          	li	a5,0
    f0c4:	00000713          	li	a4,0
    f0c8:	fc1ff06f          	j	f088 <__floatunsidf+0x3c>

0000f0cc <__eqtf2>:
    f0cc:	00c52783          	lw	a5,12(a0)
    f0d0:	0005af03          	lw	t5,0(a1)
    f0d4:	0045af83          	lw	t6,4(a1)
    f0d8:	0085a283          	lw	t0,8(a1)
    f0dc:	00c5a583          	lw	a1,12(a1)
    f0e0:	00008737          	lui	a4,0x8
    f0e4:	0107d693          	srli	a3,a5,0x10
    f0e8:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x1067>
    f0ec:	01079813          	slli	a6,a5,0x10
    f0f0:	01059e93          	slli	t4,a1,0x10
    f0f4:	01f7d613          	srli	a2,a5,0x1f
    f0f8:	00e6f6b3          	and	a3,a3,a4
    f0fc:	0105d793          	srli	a5,a1,0x10
    f100:	00052883          	lw	a7,0(a0)
    f104:	00452303          	lw	t1,4(a0)
    f108:	00852e03          	lw	t3,8(a0)
    f10c:	ff010113          	addi	sp,sp,-16
    f110:	01085813          	srli	a6,a6,0x10
    f114:	010ede93          	srli	t4,t4,0x10
    f118:	00e7f7b3          	and	a5,a5,a4
    f11c:	01f5d593          	srli	a1,a1,0x1f
    f120:	02e69063          	bne	a3,a4,f140 <__eqtf2+0x74>
    f124:	0068e733          	or	a4,a7,t1
    f128:	01c76733          	or	a4,a4,t3
    f12c:	01076733          	or	a4,a4,a6
    f130:	00100513          	li	a0,1
    f134:	04071a63          	bnez	a4,f188 <__eqtf2+0xbc>
    f138:	04d79863          	bne	a5,a3,f188 <__eqtf2+0xbc>
    f13c:	0080006f          	j	f144 <__eqtf2+0x78>
    f140:	00e79c63          	bne	a5,a4,f158 <__eqtf2+0x8c>
    f144:	01ff6733          	or	a4,t5,t6
    f148:	00576733          	or	a4,a4,t0
    f14c:	01d76733          	or	a4,a4,t4
    f150:	00100513          	li	a0,1
    f154:	02071a63          	bnez	a4,f188 <__eqtf2+0xbc>
    f158:	00100513          	li	a0,1
    f15c:	02d79663          	bne	a5,a3,f188 <__eqtf2+0xbc>
    f160:	03e89463          	bne	a7,t5,f188 <__eqtf2+0xbc>
    f164:	03f31263          	bne	t1,t6,f188 <__eqtf2+0xbc>
    f168:	025e1063          	bne	t3,t0,f188 <__eqtf2+0xbc>
    f16c:	01d81e63          	bne	a6,t4,f188 <__eqtf2+0xbc>
    f170:	02b60063          	beq	a2,a1,f190 <__eqtf2+0xc4>
    f174:	00079a63          	bnez	a5,f188 <__eqtf2+0xbc>
    f178:	0068e533          	or	a0,a7,t1
    f17c:	01c56533          	or	a0,a0,t3
    f180:	01056533          	or	a0,a0,a6
    f184:	00a03533          	snez	a0,a0
    f188:	01010113          	addi	sp,sp,16
    f18c:	00008067          	ret
    f190:	00000513          	li	a0,0
    f194:	ff5ff06f          	j	f188 <__eqtf2+0xbc>

0000f198 <__getf2>:
    f198:	00c52783          	lw	a5,12(a0)
    f19c:	00c5a683          	lw	a3,12(a1)
    f1a0:	00008737          	lui	a4,0x8
    f1a4:	0107d613          	srli	a2,a5,0x10
    f1a8:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x1067>
    f1ac:	01079813          	slli	a6,a5,0x10
    f1b0:	01069293          	slli	t0,a3,0x10
    f1b4:	00052883          	lw	a7,0(a0)
    f1b8:	00452303          	lw	t1,4(a0)
    f1bc:	00852e03          	lw	t3,8(a0)
    f1c0:	00e67633          	and	a2,a2,a4
    f1c4:	0106d513          	srli	a0,a3,0x10
    f1c8:	0005ae83          	lw	t4,0(a1)
    f1cc:	0045af03          	lw	t5,4(a1)
    f1d0:	0085af83          	lw	t6,8(a1)
    f1d4:	ff010113          	addi	sp,sp,-16
    f1d8:	01085813          	srli	a6,a6,0x10
    f1dc:	01f7d793          	srli	a5,a5,0x1f
    f1e0:	0102d293          	srli	t0,t0,0x10
    f1e4:	00e57533          	and	a0,a0,a4
    f1e8:	01f6d693          	srli	a3,a3,0x1f
    f1ec:	00e61a63          	bne	a2,a4,f200 <__getf2+0x68>
    f1f0:	01136733          	or	a4,t1,a7
    f1f4:	01c76733          	or	a4,a4,t3
    f1f8:	01076733          	or	a4,a4,a6
    f1fc:	0a071463          	bnez	a4,f2a4 <__getf2+0x10c>
    f200:	00008737          	lui	a4,0x8
    f204:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x1067>
    f208:	00e51a63          	bne	a0,a4,f21c <__getf2+0x84>
    f20c:	01eee733          	or	a4,t4,t5
    f210:	01f76733          	or	a4,a4,t6
    f214:	00576733          	or	a4,a4,t0
    f218:	08071663          	bnez	a4,f2a4 <__getf2+0x10c>
    f21c:	00000713          	li	a4,0
    f220:	00061a63          	bnez	a2,f234 <__getf2+0x9c>
    f224:	01136733          	or	a4,t1,a7
    f228:	01c76733          	or	a4,a4,t3
    f22c:	01076733          	or	a4,a4,a6
    f230:	00173713          	seqz	a4,a4
    f234:	06051c63          	bnez	a0,f2ac <__getf2+0x114>
    f238:	01eee5b3          	or	a1,t4,t5
    f23c:	01f5e5b3          	or	a1,a1,t6
    f240:	0055e5b3          	or	a1,a1,t0
    f244:	00070c63          	beqz	a4,f25c <__getf2+0xc4>
    f248:	02058063          	beqz	a1,f268 <__getf2+0xd0>
    f24c:	00100513          	li	a0,1
    f250:	00069c63          	bnez	a3,f268 <__getf2+0xd0>
    f254:	fff00513          	li	a0,-1
    f258:	0100006f          	j	f268 <__getf2+0xd0>
    f25c:	04059a63          	bnez	a1,f2b0 <__getf2+0x118>
    f260:	fff00513          	li	a0,-1
    f264:	04078e63          	beqz	a5,f2c0 <__getf2+0x128>
    f268:	01010113          	addi	sp,sp,16
    f26c:	00008067          	ret
    f270:	fca64ee3          	blt	a2,a0,f24c <__getf2+0xb4>
    f274:	ff02e6e3          	bltu	t0,a6,f260 <__getf2+0xc8>
    f278:	02581063          	bne	a6,t0,f298 <__getf2+0x100>
    f27c:	ffcfe2e3          	bltu	t6,t3,f260 <__getf2+0xc8>
    f280:	01fe1c63          	bne	t3,t6,f298 <__getf2+0x100>
    f284:	fc6f6ee3          	bltu	t5,t1,f260 <__getf2+0xc8>
    f288:	01e31863          	bne	t1,t5,f298 <__getf2+0x100>
    f28c:	fd1eeae3          	bltu	t4,a7,f260 <__getf2+0xc8>
    f290:	00000513          	li	a0,0
    f294:	fdd8fae3          	bgeu	a7,t4,f268 <__getf2+0xd0>
    f298:	00100513          	li	a0,1
    f29c:	fc0796e3          	bnez	a5,f268 <__getf2+0xd0>
    f2a0:	fb5ff06f          	j	f254 <__getf2+0xbc>
    f2a4:	ffe00513          	li	a0,-2
    f2a8:	fc1ff06f          	j	f268 <__getf2+0xd0>
    f2ac:	fa0710e3          	bnez	a4,f24c <__getf2+0xb4>
    f2b0:	faf698e3          	bne	a3,a5,f260 <__getf2+0xc8>
    f2b4:	fac55ee3          	bge	a0,a2,f270 <__getf2+0xd8>
    f2b8:	fff00513          	li	a0,-1
    f2bc:	fa0696e3          	bnez	a3,f268 <__getf2+0xd0>
    f2c0:	00100513          	li	a0,1
    f2c4:	fa5ff06f          	j	f268 <__getf2+0xd0>

0000f2c8 <__letf2>:
    f2c8:	00c52783          	lw	a5,12(a0)
    f2cc:	00c5a683          	lw	a3,12(a1)
    f2d0:	00008737          	lui	a4,0x8
    f2d4:	0107d613          	srli	a2,a5,0x10
    f2d8:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x1067>
    f2dc:	01079813          	slli	a6,a5,0x10
    f2e0:	01069293          	slli	t0,a3,0x10
    f2e4:	00052883          	lw	a7,0(a0)
    f2e8:	00452303          	lw	t1,4(a0)
    f2ec:	00852e03          	lw	t3,8(a0)
    f2f0:	00e67633          	and	a2,a2,a4
    f2f4:	0106d513          	srli	a0,a3,0x10
    f2f8:	0005ae83          	lw	t4,0(a1)
    f2fc:	0045af03          	lw	t5,4(a1)
    f300:	0085af83          	lw	t6,8(a1)
    f304:	ff010113          	addi	sp,sp,-16
    f308:	01085813          	srli	a6,a6,0x10
    f30c:	01f7d793          	srli	a5,a5,0x1f
    f310:	0102d293          	srli	t0,t0,0x10
    f314:	00e57533          	and	a0,a0,a4
    f318:	01f6d693          	srli	a3,a3,0x1f
    f31c:	00e61a63          	bne	a2,a4,f330 <__letf2+0x68>
    f320:	01136733          	or	a4,t1,a7
    f324:	01c76733          	or	a4,a4,t3
    f328:	01076733          	or	a4,a4,a6
    f32c:	0a071463          	bnez	a4,f3d4 <__letf2+0x10c>
    f330:	00008737          	lui	a4,0x8
    f334:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x1067>
    f338:	00e51a63          	bne	a0,a4,f34c <__letf2+0x84>
    f33c:	01eee733          	or	a4,t4,t5
    f340:	01f76733          	or	a4,a4,t6
    f344:	00576733          	or	a4,a4,t0
    f348:	08071663          	bnez	a4,f3d4 <__letf2+0x10c>
    f34c:	00000713          	li	a4,0
    f350:	00061a63          	bnez	a2,f364 <__letf2+0x9c>
    f354:	01136733          	or	a4,t1,a7
    f358:	01c76733          	or	a4,a4,t3
    f35c:	01076733          	or	a4,a4,a6
    f360:	00173713          	seqz	a4,a4
    f364:	06051c63          	bnez	a0,f3dc <__letf2+0x114>
    f368:	01eee5b3          	or	a1,t4,t5
    f36c:	01f5e5b3          	or	a1,a1,t6
    f370:	0055e5b3          	or	a1,a1,t0
    f374:	00070c63          	beqz	a4,f38c <__letf2+0xc4>
    f378:	02058063          	beqz	a1,f398 <__letf2+0xd0>
    f37c:	00100513          	li	a0,1
    f380:	00069c63          	bnez	a3,f398 <__letf2+0xd0>
    f384:	fff00513          	li	a0,-1
    f388:	0100006f          	j	f398 <__letf2+0xd0>
    f38c:	04059a63          	bnez	a1,f3e0 <__letf2+0x118>
    f390:	fff00513          	li	a0,-1
    f394:	04078e63          	beqz	a5,f3f0 <__letf2+0x128>
    f398:	01010113          	addi	sp,sp,16
    f39c:	00008067          	ret
    f3a0:	fca64ee3          	blt	a2,a0,f37c <__letf2+0xb4>
    f3a4:	ff02e6e3          	bltu	t0,a6,f390 <__letf2+0xc8>
    f3a8:	02581063          	bne	a6,t0,f3c8 <__letf2+0x100>
    f3ac:	ffcfe2e3          	bltu	t6,t3,f390 <__letf2+0xc8>
    f3b0:	01fe1c63          	bne	t3,t6,f3c8 <__letf2+0x100>
    f3b4:	fc6f6ee3          	bltu	t5,t1,f390 <__letf2+0xc8>
    f3b8:	01e31863          	bne	t1,t5,f3c8 <__letf2+0x100>
    f3bc:	fd1eeae3          	bltu	t4,a7,f390 <__letf2+0xc8>
    f3c0:	00000513          	li	a0,0
    f3c4:	fdd8fae3          	bgeu	a7,t4,f398 <__letf2+0xd0>
    f3c8:	00100513          	li	a0,1
    f3cc:	fc0796e3          	bnez	a5,f398 <__letf2+0xd0>
    f3d0:	fb5ff06f          	j	f384 <__letf2+0xbc>
    f3d4:	00200513          	li	a0,2
    f3d8:	fc1ff06f          	j	f398 <__letf2+0xd0>
    f3dc:	fa0710e3          	bnez	a4,f37c <__letf2+0xb4>
    f3e0:	faf698e3          	bne	a3,a5,f390 <__letf2+0xc8>
    f3e4:	fac55ee3          	bge	a0,a2,f3a0 <__letf2+0xd8>
    f3e8:	fff00513          	li	a0,-1
    f3ec:	fa0696e3          	bnez	a3,f398 <__letf2+0xd0>
    f3f0:	00100513          	li	a0,1
    f3f4:	fa5ff06f          	j	f398 <__letf2+0xd0>

0000f3f8 <__multf3>:
    f3f8:	f5010113          	addi	sp,sp,-176
    f3fc:	09412c23          	sw	s4,152(sp)
    f400:	00c5aa03          	lw	s4,12(a1)
    f404:	0005a783          	lw	a5,0(a1)
    f408:	0085a683          	lw	a3,8(a1)
    f40c:	0a812423          	sw	s0,168(sp)
    f410:	00050413          	mv	s0,a0
    f414:	0045a503          	lw	a0,4(a1)
    f418:	010a1713          	slli	a4,s4,0x10
    f41c:	0b212023          	sw	s2,160(sp)
    f420:	09312e23          	sw	s3,156(sp)
    f424:	00062903          	lw	s2,0(a2) # 7ff00000 <_memory_end+0x7fee0000>
    f428:	00c62983          	lw	s3,12(a2)
    f42c:	09512a23          	sw	s5,148(sp)
    f430:	09612823          	sw	s6,144(sp)
    f434:	00862a83          	lw	s5,8(a2)
    f438:	00462b03          	lw	s6,4(a2)
    f43c:	00008637          	lui	a2,0x8
    f440:	0a912223          	sw	s1,164(sp)
    f444:	01075713          	srli	a4,a4,0x10
    f448:	010a5493          	srli	s1,s4,0x10
    f44c:	fff60613          	addi	a2,a2,-1 # 7fff <__gdtoa+0x1067>
    f450:	05412e23          	sw	s4,92(sp)
    f454:	0a112623          	sw	ra,172(sp)
    f458:	09712623          	sw	s7,140(sp)
    f45c:	09812423          	sw	s8,136(sp)
    f460:	09912223          	sw	s9,132(sp)
    f464:	09a12023          	sw	s10,128(sp)
    f468:	07b12e23          	sw	s11,124(sp)
    f46c:	04f12823          	sw	a5,80(sp)
    f470:	04a12a23          	sw	a0,84(sp)
    f474:	04d12c23          	sw	a3,88(sp)
    f478:	02f12023          	sw	a5,32(sp)
    f47c:	02a12223          	sw	a0,36(sp)
    f480:	02d12423          	sw	a3,40(sp)
    f484:	02e12623          	sw	a4,44(sp)
    f488:	00c4f4b3          	and	s1,s1,a2
    f48c:	01fa5a13          	srli	s4,s4,0x1f
    f490:	080482e3          	beqz	s1,fd14 <__multf3+0x91c>
    f494:	1ac48ce3          	beq	s1,a2,fe4c <__multf3+0xa54>
    f498:	000106b7          	lui	a3,0x10
    f49c:	00d76733          	or	a4,a4,a3
    f4a0:	02e12623          	sw	a4,44(sp)
    f4a4:	02010593          	addi	a1,sp,32
    f4a8:	02c10713          	addi	a4,sp,44
    f4ac:	00072683          	lw	a3,0(a4)
    f4b0:	ffc72603          	lw	a2,-4(a4)
    f4b4:	ffc70713          	addi	a4,a4,-4
    f4b8:	00369693          	slli	a3,a3,0x3
    f4bc:	01d65613          	srli	a2,a2,0x1d
    f4c0:	00c6e6b3          	or	a3,a3,a2
    f4c4:	00d72223          	sw	a3,4(a4)
    f4c8:	fee592e3          	bne	a1,a4,f4ac <__multf3+0xb4>
    f4cc:	00379793          	slli	a5,a5,0x3
    f4d0:	02f12023          	sw	a5,32(sp)
    f4d4:	ffffc7b7          	lui	a5,0xffffc
    f4d8:	00178793          	addi	a5,a5,1 # ffffc001 <_memory_end+0xfffdc001>
    f4dc:	00f484b3          	add	s1,s1,a5
    f4e0:	00000b93          	li	s7,0
    f4e4:	01099513          	slli	a0,s3,0x10
    f4e8:	00008737          	lui	a4,0x8
    f4ec:	0109d793          	srli	a5,s3,0x10
    f4f0:	01055513          	srli	a0,a0,0x10
    f4f4:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x1067>
    f4f8:	05312e23          	sw	s3,92(sp)
    f4fc:	05212823          	sw	s2,80(sp)
    f500:	05612a23          	sw	s6,84(sp)
    f504:	05512c23          	sw	s5,88(sp)
    f508:	03212823          	sw	s2,48(sp)
    f50c:	03612a23          	sw	s6,52(sp)
    f510:	03512c23          	sw	s5,56(sp)
    f514:	02a12e23          	sw	a0,60(sp)
    f518:	00e7f7b3          	and	a5,a5,a4
    f51c:	01f9d993          	srli	s3,s3,0x1f
    f520:	14078ae3          	beqz	a5,fe74 <__multf3+0xa7c>
    f524:	28e784e3          	beq	a5,a4,ffac <__multf3+0xbb4>
    f528:	00010737          	lui	a4,0x10
    f52c:	00e56533          	or	a0,a0,a4
    f530:	02a12e23          	sw	a0,60(sp)
    f534:	03010593          	addi	a1,sp,48
    f538:	03c10713          	addi	a4,sp,60
    f53c:	00072683          	lw	a3,0(a4) # 10000 <__multf3+0xc08>
    f540:	ffc72603          	lw	a2,-4(a4)
    f544:	ffc70713          	addi	a4,a4,-4
    f548:	00369693          	slli	a3,a3,0x3
    f54c:	01d65613          	srli	a2,a2,0x1d
    f550:	00c6e6b3          	or	a3,a3,a2
    f554:	00d72223          	sw	a3,4(a4)
    f558:	fee592e3          	bne	a1,a4,f53c <__multf3+0x144>
    f55c:	ffffc737          	lui	a4,0xffffc
    f560:	00391913          	slli	s2,s2,0x3
    f564:	00170713          	addi	a4,a4,1 # ffffc001 <_memory_end+0xfffdc001>
    f568:	03212823          	sw	s2,48(sp)
    f56c:	00e787b3          	add	a5,a5,a4
    f570:	00000693          	li	a3,0
    f574:	009787b3          	add	a5,a5,s1
    f578:	00f12623          	sw	a5,12(sp)
    f57c:	00178793          	addi	a5,a5,1
    f580:	00f12423          	sw	a5,8(sp)
    f584:	002b9793          	slli	a5,s7,0x2
    f588:	00d7e7b3          	or	a5,a5,a3
    f58c:	00a00713          	li	a4,10
    f590:	28f742e3          	blt	a4,a5,10014 <__multf3+0xc1c>
    f594:	013a4733          	xor	a4,s4,s3
    f598:	00e12223          	sw	a4,4(sp)
    f59c:	00200713          	li	a4,2
    f5a0:	22f74ae3          	blt	a4,a5,ffd4 <__multf3+0xbdc>
    f5a4:	fff78793          	addi	a5,a5,-1
    f5a8:	00100713          	li	a4,1
    f5ac:	28f770e3          	bgeu	a4,a5,1002c <__multf3+0xc34>
    f5b0:	02012883          	lw	a7,32(sp)
    f5b4:	03012f03          	lw	t5,48(sp)
    f5b8:	000105b7          	lui	a1,0x10
    f5bc:	fff58713          	addi	a4,a1,-1 # ffff <__multf3+0xc07>
    f5c0:	0108d913          	srli	s2,a7,0x10
    f5c4:	010f5493          	srli	s1,t5,0x10
    f5c8:	00e8f8b3          	and	a7,a7,a4
    f5cc:	00ef7f33          	and	t5,t5,a4
    f5d0:	031f0633          	mul	a2,t5,a7
    f5d4:	03e90533          	mul	a0,s2,t5
    f5d8:	01065793          	srli	a5,a2,0x10
    f5dc:	031486b3          	mul	a3,s1,a7
    f5e0:	00a686b3          	add	a3,a3,a0
    f5e4:	00d787b3          	add	a5,a5,a3
    f5e8:	02990bb3          	mul	s7,s2,s1
    f5ec:	00a7f463          	bgeu	a5,a0,f5f4 <__multf3+0x1fc>
    f5f0:	00bb8bb3          	add	s7,s7,a1
    f5f4:	03412e83          	lw	t4,52(sp)
    f5f8:	0107d693          	srli	a3,a5,0x10
    f5fc:	00e7f7b3          	and	a5,a5,a4
    f600:	00e67633          	and	a2,a2,a4
    f604:	01079793          	slli	a5,a5,0x10
    f608:	00c787b3          	add	a5,a5,a2
    f60c:	010ed293          	srli	t0,t4,0x10
    f610:	00eefeb3          	and	t4,t4,a4
    f614:	03d90633          	mul	a2,s2,t4
    f618:	00f12823          	sw	a5,16(sp)
    f61c:	04f12823          	sw	a5,80(sp)
    f620:	03128733          	mul	a4,t0,a7
    f624:	031e87b3          	mul	a5,t4,a7
    f628:	00c70733          	add	a4,a4,a2
    f62c:	0107d313          	srli	t1,a5,0x10
    f630:	00e30333          	add	t1,t1,a4
    f634:	02590b33          	mul	s6,s2,t0
    f638:	00c37663          	bgeu	t1,a2,f644 <__multf3+0x24c>
    f63c:	00010737          	lui	a4,0x10
    f640:	00eb0b33          	add	s6,s6,a4
    f644:	02412803          	lw	a6,36(sp)
    f648:	00010737          	lui	a4,0x10
    f64c:	fff70613          	addi	a2,a4,-1 # ffff <__multf3+0xc07>
    f650:	01035513          	srli	a0,t1,0x10
    f654:	00c37333          	and	t1,t1,a2
    f658:	00c7f7b3          	and	a5,a5,a2
    f65c:	01085393          	srli	t2,a6,0x10
    f660:	01031313          	slli	t1,t1,0x10
    f664:	00c87833          	and	a6,a6,a2
    f668:	00f30333          	add	t1,t1,a5
    f66c:	03e38fb3          	mul	t6,t2,t5
    f670:	006686b3          	add	a3,a3,t1
    f674:	03e807b3          	mul	a5,a6,t5
    f678:	03048e33          	mul	t3,s1,a6
    f67c:	0107d613          	srli	a2,a5,0x10
    f680:	01fe0e33          	add	t3,t3,t6
    f684:	01c60633          	add	a2,a2,t3
    f688:	027485b3          	mul	a1,s1,t2
    f68c:	01f67463          	bgeu	a2,t6,f694 <__multf3+0x29c>
    f690:	00e585b3          	add	a1,a1,a4
    f694:	01065a93          	srli	s5,a2,0x10
    f698:	00010737          	lui	a4,0x10
    f69c:	00ba8ab3          	add	s5,s5,a1
    f6a0:	fff70593          	addi	a1,a4,-1 # ffff <__multf3+0xc07>
    f6a4:	00b7f7b3          	and	a5,a5,a1
    f6a8:	00b67633          	and	a2,a2,a1
    f6ac:	01061613          	slli	a2,a2,0x10
    f6b0:	030e85b3          	mul	a1,t4,a6
    f6b4:	00f60633          	add	a2,a2,a5
    f6b8:	03d38fb3          	mul	t6,t2,t4
    f6bc:	0105d793          	srli	a5,a1,0x10
    f6c0:	03028e33          	mul	t3,t0,a6
    f6c4:	01fe0e33          	add	t3,t3,t6
    f6c8:	01c787b3          	add	a5,a5,t3
    f6cc:	027289b3          	mul	s3,t0,t2
    f6d0:	01f7f463          	bgeu	a5,t6,f6d8 <__multf3+0x2e0>
    f6d4:	00e989b3          	add	s3,s3,a4
    f6d8:	0107d713          	srli	a4,a5,0x10
    f6dc:	01370733          	add	a4,a4,s3
    f6e0:	00010a37          	lui	s4,0x10
    f6e4:	00e12a23          	sw	a4,20(sp)
    f6e8:	fffa0713          	addi	a4,s4,-1 # ffff <__multf3+0xc07>
    f6ec:	03812e03          	lw	t3,56(sp)
    f6f0:	00e7f7b3          	and	a5,a5,a4
    f6f4:	00e5f5b3          	and	a1,a1,a4
    f6f8:	01079793          	slli	a5,a5,0x10
    f6fc:	00b787b3          	add	a5,a5,a1
    f700:	00f12c23          	sw	a5,24(sp)
    f704:	010e5793          	srli	a5,t3,0x10
    f708:	00ee7e33          	and	t3,t3,a4
    f70c:	031e05b3          	mul	a1,t3,a7
    f710:	03c90c33          	mul	s8,s2,t3
    f714:	0105d713          	srli	a4,a1,0x10
    f718:	031789b3          	mul	s3,a5,a7
    f71c:	018989b3          	add	s3,s3,s8
    f720:	01370733          	add	a4,a4,s3
    f724:	02f90fb3          	mul	t6,s2,a5
    f728:	01877463          	bgeu	a4,s8,f730 <__multf3+0x338>
    f72c:	014f8fb3          	add	t6,t6,s4
    f730:	01075993          	srli	s3,a4,0x10
    f734:	00010cb7          	lui	s9,0x10
    f738:	01f98fb3          	add	t6,s3,t6
    f73c:	fffc8993          	addi	s3,s9,-1 # ffff <__multf3+0xc07>
    f740:	01377733          	and	a4,a4,s3
    f744:	0135f5b3          	and	a1,a1,s3
    f748:	01071713          	slli	a4,a4,0x10
    f74c:	00b70733          	add	a4,a4,a1
    f750:	02812583          	lw	a1,40(sp)
    f754:	01f12e23          	sw	t6,28(sp)
    f758:	0105df93          	srli	t6,a1,0x10
    f75c:	0135f5b3          	and	a1,a1,s3
    f760:	03e58a33          	mul	s4,a1,t5
    f764:	03ef8d33          	mul	s10,t6,t5
    f768:	010a5d93          	srli	s11,s4,0x10
    f76c:	02b489b3          	mul	s3,s1,a1
    f770:	01a989b3          	add	s3,s3,s10
    f774:	013d89b3          	add	s3,s11,s3
    f778:	03f48c33          	mul	s8,s1,t6
    f77c:	01a9f463          	bgeu	s3,s10,f784 <__multf3+0x38c>
    f780:	019c0c33          	add	s8,s8,s9
    f784:	00db86b3          	add	a3,s7,a3
    f788:	0066b333          	sltu	t1,a3,t1
    f78c:	0109dd13          	srli	s10,s3,0x10
    f790:	00650533          	add	a0,a0,t1
    f794:	00010cb7          	lui	s9,0x10
    f798:	01650533          	add	a0,a0,s6
    f79c:	018d0d33          	add	s10,s10,s8
    f7a0:	00c68633          	add	a2,a3,a2
    f7a4:	fffc8c13          	addi	s8,s9,-1 # ffff <__multf3+0xc07>
    f7a8:	01550ab3          	add	s5,a0,s5
    f7ac:	0189f9b3          	and	s3,s3,s8
    f7b0:	00d636b3          	sltu	a3,a2,a3
    f7b4:	00da86b3          	add	a3,s5,a3
    f7b8:	01099993          	slli	s3,s3,0x10
    f7bc:	018a7a33          	and	s4,s4,s8
    f7c0:	01498a33          	add	s4,s3,s4
    f7c4:	00aab9b3          	sltu	s3,s5,a0
    f7c8:	0156bab3          	sltu	s5,a3,s5
    f7cc:	0159e9b3          	or	s3,s3,s5
    f7d0:	00653533          	sltu	a0,a0,t1
    f7d4:	00a98533          	add	a0,s3,a0
    f7d8:	01812303          	lw	t1,24(sp)
    f7dc:	01412983          	lw	s3,20(sp)
    f7e0:	04c12a23          	sw	a2,84(sp)
    f7e4:	00668333          	add	t1,a3,t1
    f7e8:	01350ab3          	add	s5,a0,s3
    f7ec:	01c12983          	lw	s3,28(sp)
    f7f0:	00d336b3          	sltu	a3,t1,a3
    f7f4:	00da86b3          	add	a3,s5,a3
    f7f8:	00e30733          	add	a4,t1,a4
    f7fc:	01368b33          	add	s6,a3,s3
    f800:	00673333          	sltu	t1,a4,t1
    f804:	006b0333          	add	t1,s6,t1
    f808:	01470a33          	add	s4,a4,s4
    f80c:	01a30d33          	add	s10,t1,s10
    f810:	00ea3733          	sltu	a4,s4,a4
    f814:	00aab533          	sltu	a0,s5,a0
    f818:	00ed0733          	add	a4,s10,a4
    f81c:	0156bab3          	sltu	s5,a3,s5
    f820:	00db36b3          	sltu	a3,s6,a3
    f824:	01633b33          	sltu	s6,t1,s6
    f828:	0166e6b3          	or	a3,a3,s6
    f82c:	006d39b3          	sltu	s3,s10,t1
    f830:	01556ab3          	or	s5,a0,s5
    f834:	01a73d33          	sltu	s10,a4,s10
    f838:	00da8ab3          	add	s5,s5,a3
    f83c:	01a9e9b3          	or	s3,s3,s10
    f840:	015989b3          	add	s3,s3,s5
    f844:	03c12a83          	lw	s5,60(sp)
    f848:	05412c23          	sw	s4,88(sp)
    f84c:	010adb13          	srli	s6,s5,0x10
    f850:	018afab3          	and	s5,s5,s8
    f854:	031a86b3          	mul	a3,s5,a7
    f858:	03590533          	mul	a0,s2,s5
    f85c:	031b08b3          	mul	a7,s6,a7
    f860:	00a88333          	add	t1,a7,a0
    f864:	0106d893          	srli	a7,a3,0x10
    f868:	006888b3          	add	a7,a7,t1
    f86c:	03690933          	mul	s2,s2,s6
    f870:	00a8f463          	bgeu	a7,a0,f878 <__multf3+0x480>
    f874:	01990933          	add	s2,s2,s9
    f878:	02c12b83          	lw	s7,44(sp)
    f87c:	0108d513          	srli	a0,a7,0x10
    f880:	01250533          	add	a0,a0,s2
    f884:	00010c37          	lui	s8,0x10
    f888:	00a12a23          	sw	a0,20(sp)
    f88c:	fffc0513          	addi	a0,s8,-1 # ffff <__multf3+0xc07>
    f890:	010bd913          	srli	s2,s7,0x10
    f894:	00abfbb3          	and	s7,s7,a0
    f898:	00a6f6b3          	and	a3,a3,a0
    f89c:	00a8f8b3          	and	a7,a7,a0
    f8a0:	03248333          	mul	t1,s1,s2
    f8a4:	01089893          	slli	a7,a7,0x10
    f8a8:	00d888b3          	add	a7,a7,a3
    f8ac:	03eb8533          	mul	a0,s7,t5
    f8b0:	037484b3          	mul	s1,s1,s7
    f8b4:	01055693          	srli	a3,a0,0x10
    f8b8:	03e90f33          	mul	t5,s2,t5
    f8bc:	01e484b3          	add	s1,s1,t5
    f8c0:	009686b3          	add	a3,a3,s1
    f8c4:	01e6f463          	bgeu	a3,t5,f8cc <__multf3+0x4d4>
    f8c8:	01830333          	add	t1,t1,s8
    f8cc:	0106df13          	srli	t5,a3,0x10
    f8d0:	006f0333          	add	t1,t5,t1
    f8d4:	00010cb7          	lui	s9,0x10
    f8d8:	00612c23          	sw	t1,24(sp)
    f8dc:	fffc8313          	addi	t1,s9,-1 # ffff <__multf3+0xc07>
    f8e0:	00657533          	and	a0,a0,t1
    f8e4:	0066f6b3          	and	a3,a3,t1
    f8e8:	03c38f33          	mul	t5,t2,t3
    f8ec:	01069693          	slli	a3,a3,0x10
    f8f0:	00a686b3          	add	a3,a3,a0
    f8f4:	03c80333          	mul	t1,a6,t3
    f8f8:	030784b3          	mul	s1,a5,a6
    f8fc:	01035513          	srli	a0,t1,0x10
    f900:	01e484b3          	add	s1,s1,t5
    f904:	00950533          	add	a0,a0,s1
    f908:	02f38c33          	mul	s8,t2,a5
    f90c:	01e57463          	bgeu	a0,t5,f914 <__multf3+0x51c>
    f910:	019c0c33          	add	s8,s8,s9
    f914:	00010d37          	lui	s10,0x10
    f918:	fffd0f13          	addi	t5,s10,-1 # ffff <__multf3+0xc07>
    f91c:	01055493          	srli	s1,a0,0x10
    f920:	01e57533          	and	a0,a0,t5
    f924:	01e37333          	and	t1,t1,t5
    f928:	01051513          	slli	a0,a0,0x10
    f92c:	018484b3          	add	s1,s1,s8
    f930:	02b28f33          	mul	t5,t0,a1
    f934:	00650533          	add	a0,a0,t1
    f938:	03df8c33          	mul	s8,t6,t4
    f93c:	02be8333          	mul	t1,t4,a1
    f940:	018f0f33          	add	t5,t5,s8
    f944:	01035d93          	srli	s11,t1,0x10
    f948:	01ed8f33          	add	t5,s11,t5
    f94c:	03f28cb3          	mul	s9,t0,t6
    f950:	018f7463          	bgeu	t5,s8,f958 <__multf3+0x560>
    f954:	01ac8cb3          	add	s9,s9,s10
    f958:	010f5c13          	srli	s8,t5,0x10
    f95c:	019c0c33          	add	s8,s8,s9
    f960:	00010cb7          	lui	s9,0x10
    f964:	fffc8d13          	addi	s10,s9,-1 # ffff <__multf3+0xc07>
    f968:	01af7f33          	and	t5,t5,s10
    f96c:	010f1f13          	slli	t5,t5,0x10
    f970:	01a37333          	and	t1,t1,s10
    f974:	006f0333          	add	t1,t5,t1
    f978:	01412f03          	lw	t5,20(sp)
    f97c:	011708b3          	add	a7,a4,a7
    f980:	01812d03          	lw	s10,24(sp)
    f984:	01e98f33          	add	t5,s3,t5
    f988:	00e8b733          	sltu	a4,a7,a4
    f98c:	00ef0733          	add	a4,t5,a4
    f990:	00d886b3          	add	a3,a7,a3
    f994:	01a70d33          	add	s10,a4,s10
    f998:	0116b8b3          	sltu	a7,a3,a7
    f99c:	011d08b3          	add	a7,s10,a7
    f9a0:	00a68533          	add	a0,a3,a0
    f9a4:	009884b3          	add	s1,a7,s1
    f9a8:	00d536b3          	sltu	a3,a0,a3
    f9ac:	00d486b3          	add	a3,s1,a3
    f9b0:	013f39b3          	sltu	s3,t5,s3
    f9b4:	01e73f33          	sltu	t5,a4,t5
    f9b8:	00ed3733          	sltu	a4,s10,a4
    f9bc:	01a8bd33          	sltu	s10,a7,s10
    f9c0:	01e9ef33          	or	t5,s3,t5
    f9c4:	0114b8b3          	sltu	a7,s1,a7
    f9c8:	01a76733          	or	a4,a4,s10
    f9cc:	0096b4b3          	sltu	s1,a3,s1
    f9d0:	01868c33          	add	s8,a3,s8
    f9d4:	00ef0733          	add	a4,t5,a4
    f9d8:	0098e8b3          	or	a7,a7,s1
    f9dc:	00e884b3          	add	s1,a7,a4
    f9e0:	03cf8f33          	mul	t5,t6,t3
    f9e4:	00dc38b3          	sltu	a7,s8,a3
    f9e8:	00650333          	add	t1,a0,t1
    f9ec:	00a33533          	sltu	a0,t1,a0
    f9f0:	00ac0533          	add	a0,s8,a0
    f9f4:	01853c33          	sltu	s8,a0,s8
    f9f8:	0188e8b3          	or	a7,a7,s8
    f9fc:	04612e23          	sw	t1,92(sp)
    fa00:	009888b3          	add	a7,a7,s1
    fa04:	02be06b3          	mul	a3,t3,a1
    fa08:	02b789b3          	mul	s3,a5,a1
    fa0c:	0106d713          	srli	a4,a3,0x10
    fa10:	01e989b3          	add	s3,s3,t5
    fa14:	01370733          	add	a4,a4,s3
    fa18:	03f784b3          	mul	s1,a5,t6
    fa1c:	01e77463          	bgeu	a4,t5,fa24 <__multf3+0x62c>
    fa20:	019484b3          	add	s1,s1,s9
    fa24:	01075f13          	srli	t5,a4,0x10
    fa28:	009f0f33          	add	t5,t5,s1
    fa2c:	000104b7          	lui	s1,0x10
    fa30:	fff48993          	addi	s3,s1,-1 # ffff <__multf3+0xc07>
    fa34:	01377733          	and	a4,a4,s3
    fa38:	0136f6b3          	and	a3,a3,s3
    fa3c:	01071713          	slli	a4,a4,0x10
    fa40:	035389b3          	mul	s3,t2,s5
    fa44:	00d70733          	add	a4,a4,a3
    fa48:	030a86b3          	mul	a3,s5,a6
    fa4c:	030b0833          	mul	a6,s6,a6
    fa50:	01380c33          	add	s8,a6,s3
    fa54:	0106d813          	srli	a6,a3,0x10
    fa58:	01880833          	add	a6,a6,s8
    fa5c:	036383b3          	mul	t2,t2,s6
    fa60:	01387463          	bgeu	a6,s3,fa68 <__multf3+0x670>
    fa64:	009383b3          	add	t2,t2,s1
    fa68:	01085493          	srli	s1,a6,0x10
    fa6c:	00010c37          	lui	s8,0x10
    fa70:	007483b3          	add	t2,s1,t2
    fa74:	fffc0493          	addi	s1,s8,-1 # ffff <__multf3+0xc07>
    fa78:	0096f6b3          	and	a3,a3,s1
    fa7c:	00987833          	and	a6,a6,s1
    fa80:	01081813          	slli	a6,a6,0x10
    fa84:	03db89b3          	mul	s3,s7,t4
    fa88:	00d80833          	add	a6,a6,a3
    fa8c:	03d90eb3          	mul	t4,s2,t4
    fa90:	0109d693          	srli	a3,s3,0x10
    fa94:	032284b3          	mul	s1,t0,s2
    fa98:	037282b3          	mul	t0,t0,s7
    fa9c:	01d282b3          	add	t0,t0,t4
    faa0:	005686b3          	add	a3,a3,t0
    faa4:	01d6f463          	bgeu	a3,t4,faac <__multf3+0x6b4>
    faa8:	018484b3          	add	s1,s1,s8
    faac:	0106de93          	srli	t4,a3,0x10
    fab0:	009e8eb3          	add	t4,t4,s1
    fab4:	000104b7          	lui	s1,0x10
    fab8:	fff48293          	addi	t0,s1,-1 # ffff <__multf3+0xc07>
    fabc:	0056f6b3          	and	a3,a3,t0
    fac0:	0059f9b3          	and	s3,s3,t0
    fac4:	01069693          	slli	a3,a3,0x10
    fac8:	02ba82b3          	mul	t0,s5,a1
    facc:	013686b3          	add	a3,a3,s3
    fad0:	02bb05b3          	mul	a1,s6,a1
    fad4:	035f89b3          	mul	s3,t6,s5
    fad8:	01358c33          	add	s8,a1,s3
    fadc:	0102d593          	srli	a1,t0,0x10
    fae0:	018585b3          	add	a1,a1,s8
    fae4:	036f8fb3          	mul	t6,t6,s6
    fae8:	0135f463          	bgeu	a1,s3,faf0 <__multf3+0x6f8>
    faec:	009f8fb3          	add	t6,t6,s1
    faf0:	0105d493          	srli	s1,a1,0x10
    faf4:	01f48fb3          	add	t6,s1,t6
    faf8:	000104b7          	lui	s1,0x10
    fafc:	fff48993          	addi	s3,s1,-1 # ffff <__multf3+0xc07>
    fb00:	0135f5b3          	and	a1,a1,s3
    fb04:	0132f2b3          	and	t0,t0,s3
    fb08:	01059593          	slli	a1,a1,0x10
    fb0c:	032789b3          	mul	s3,a5,s2
    fb10:	005585b3          	add	a1,a1,t0
    fb14:	037787b3          	mul	a5,a5,s7
    fb18:	03cb82b3          	mul	t0,s7,t3
    fb1c:	03c90e33          	mul	t3,s2,t3
    fb20:	0102dc13          	srli	s8,t0,0x10
    fb24:	01c787b3          	add	a5,a5,t3
    fb28:	00fc07b3          	add	a5,s8,a5
    fb2c:	01c7f463          	bgeu	a5,t3,fb34 <__multf3+0x73c>
    fb30:	009989b3          	add	s3,s3,s1
    fb34:	00e50733          	add	a4,a0,a4
    fb38:	01070833          	add	a6,a4,a6
    fb3c:	01e88f33          	add	t5,a7,t5
    fb40:	00a73533          	sltu	a0,a4,a0
    fb44:	00af0533          	add	a0,t5,a0
    fb48:	00d806b3          	add	a3,a6,a3
    fb4c:	007503b3          	add	t2,a0,t2
    fb50:	00e83733          	sltu	a4,a6,a4
    fb54:	06d12023          	sw	a3,96(sp)
    fb58:	0106b6b3          	sltu	a3,a3,a6
    fb5c:	037a8833          	mul	a6,s5,s7
    fb60:	00e38733          	add	a4,t2,a4
    fb64:	01d70eb3          	add	t4,a4,t4
    fb68:	00de86b3          	add	a3,t4,a3
    fb6c:	0107de13          	srli	t3,a5,0x10
    fb70:	011f38b3          	sltu	a7,t5,a7
    fb74:	000104b7          	lui	s1,0x10
    fb78:	01e53f33          	sltu	t5,a0,t5
    fb7c:	00a3b533          	sltu	a0,t2,a0
    fb80:	007733b3          	sltu	t2,a4,t2
    fb84:	03590ab3          	mul	s5,s2,s5
    fb88:	013e0e33          	add	t3,t3,s3
    fb8c:	00756533          	or	a0,a0,t2
    fb90:	fff48993          	addi	s3,s1,-1 # ffff <__multf3+0xc07>
    fb94:	00eeb733          	sltu	a4,t4,a4
    fb98:	01e8e8b3          	or	a7,a7,t5
    fb9c:	01d6beb3          	sltu	t4,a3,t4
    fba0:	00a888b3          	add	a7,a7,a0
    fba4:	0137f7b3          	and	a5,a5,s3
    fba8:	01d76733          	or	a4,a4,t4
    fbac:	032b0933          	mul	s2,s6,s2
    fbb0:	00b685b3          	add	a1,a3,a1
    fbb4:	01170733          	add	a4,a4,a7
    fbb8:	01079793          	slli	a5,a5,0x10
    fbbc:	0132f2b3          	and	t0,t0,s3
    fbc0:	01f70fb3          	add	t6,a4,t6
    fbc4:	005787b3          	add	a5,a5,t0
    fbc8:	00d5b6b3          	sltu	a3,a1,a3
    fbcc:	00df86b3          	add	a3,t6,a3
    fbd0:	00f587b3          	add	a5,a1,a5
    fbd4:	037b0b33          	mul	s6,s6,s7
    fbd8:	00efb733          	sltu	a4,t6,a4
    fbdc:	01c68e33          	add	t3,a3,t3
    fbe0:	01f6bfb3          	sltu	t6,a3,t6
    fbe4:	06f12223          	sw	a5,100(sp)
    fbe8:	00b7b7b3          	sltu	a5,a5,a1
    fbec:	01f76533          	or	a0,a4,t6
    fbf0:	00fe07b3          	add	a5,t3,a5
    fbf4:	01085713          	srli	a4,a6,0x10
    fbf8:	00de36b3          	sltu	a3,t3,a3
    fbfc:	015b0b33          	add	s6,s6,s5
    fc00:	01c7be33          	sltu	t3,a5,t3
    fc04:	01670733          	add	a4,a4,s6
    fc08:	01c6e6b3          	or	a3,a3,t3
    fc0c:	01577463          	bgeu	a4,s5,fc14 <__multf3+0x81c>
    fc10:	00990933          	add	s2,s2,s1
    fc14:	01075593          	srli	a1,a4,0x10
    fc18:	00a585b3          	add	a1,a1,a0
    fc1c:	00010537          	lui	a0,0x10
    fc20:	fff50513          	addi	a0,a0,-1 # ffff <__multf3+0xc07>
    fc24:	00a77733          	and	a4,a4,a0
    fc28:	01071713          	slli	a4,a4,0x10
    fc2c:	00a87833          	and	a6,a6,a0
    fc30:	01070733          	add	a4,a4,a6
    fc34:	00e78733          	add	a4,a5,a4
    fc38:	00d586b3          	add	a3,a1,a3
    fc3c:	00f737b3          	sltu	a5,a4,a5
    fc40:	00f687b3          	add	a5,a3,a5
    fc44:	012787b3          	add	a5,a5,s2
    fc48:	06f12623          	sw	a5,108(sp)
    fc4c:	01012783          	lw	a5,16(sp)
    fc50:	00d31313          	slli	t1,t1,0xd
    fc54:	06e12423          	sw	a4,104(sp)
    fc58:	00c7e7b3          	or	a5,a5,a2
    fc5c:	0147e7b3          	or	a5,a5,s4
    fc60:	00f36333          	or	t1,t1,a5
    fc64:	06010613          	addi	a2,sp,96
    fc68:	05010793          	addi	a5,sp,80
    fc6c:	00c7a703          	lw	a4,12(a5)
    fc70:	0107a683          	lw	a3,16(a5)
    fc74:	00478793          	addi	a5,a5,4
    fc78:	01375713          	srli	a4,a4,0x13
    fc7c:	00d69693          	slli	a3,a3,0xd
    fc80:	00d76733          	or	a4,a4,a3
    fc84:	fee7ae23          	sw	a4,-4(a5)
    fc88:	fef612e3          	bne	a2,a5,fc6c <__multf3+0x874>
    fc8c:	05012783          	lw	a5,80(sp)
    fc90:	00603333          	snez	t1,t1
    fc94:	05c12703          	lw	a4,92(sp)
    fc98:	00f36333          	or	t1,t1,a5
    fc9c:	05812783          	lw	a5,88(sp)
    fca0:	04e12623          	sw	a4,76(sp)
    fca4:	04612023          	sw	t1,64(sp)
    fca8:	04f12423          	sw	a5,72(sp)
    fcac:	05412783          	lw	a5,84(sp)
    fcb0:	04f12223          	sw	a5,68(sp)
    fcb4:	00b71793          	slli	a5,a4,0xb
    fcb8:	0407d863          	bgez	a5,fd08 <__multf3+0x910>
    fcbc:	01f31313          	slli	t1,t1,0x1f
    fcc0:	04010793          	addi	a5,sp,64
    fcc4:	04c10593          	addi	a1,sp,76
    fcc8:	0007a683          	lw	a3,0(a5)
    fccc:	0047a603          	lw	a2,4(a5)
    fcd0:	00478793          	addi	a5,a5,4
    fcd4:	0016d693          	srli	a3,a3,0x1
    fcd8:	01f61613          	slli	a2,a2,0x1f
    fcdc:	00c6e6b3          	or	a3,a3,a2
    fce0:	fed7ae23          	sw	a3,-4(a5)
    fce4:	fef592e3          	bne	a1,a5,fcc8 <__multf3+0x8d0>
    fce8:	04012783          	lw	a5,64(sp)
    fcec:	00603333          	snez	t1,t1
    fcf0:	00175713          	srli	a4,a4,0x1
    fcf4:	0067e7b3          	or	a5,a5,t1
    fcf8:	04f12023          	sw	a5,64(sp)
    fcfc:	00812783          	lw	a5,8(sp)
    fd00:	04e12623          	sw	a4,76(sp)
    fd04:	00f12623          	sw	a5,12(sp)
    fd08:	00c12783          	lw	a5,12(sp)
    fd0c:	00f12423          	sw	a5,8(sp)
    fd10:	3780006f          	j	10088 <__multf3+0xc90>
    fd14:	00a7e633          	or	a2,a5,a0
    fd18:	00d66633          	or	a2,a2,a3
    fd1c:	00e66633          	or	a2,a2,a4
    fd20:	14060463          	beqz	a2,fe68 <__multf3+0xa70>
    fd24:	0a070063          	beqz	a4,fdc4 <__multf3+0x9cc>
    fd28:	00070513          	mv	a0,a4
    fd2c:	395020ef          	jal	128c0 <__clzsi2>
    fd30:	ff450713          	addi	a4,a0,-12
    fd34:	40575593          	srai	a1,a4,0x5
    fd38:	01f77713          	andi	a4,a4,31
    fd3c:	0a070e63          	beqz	a4,fdf8 <__multf3+0xa00>
    fd40:	ffc00693          	li	a3,-4
    fd44:	02d586b3          	mul	a3,a1,a3
    fd48:	02000813          	li	a6,32
    fd4c:	02010313          	addi	t1,sp,32
    fd50:	40e80833          	sub	a6,a6,a4
    fd54:	00c68793          	addi	a5,a3,12 # 1000c <__multf3+0xc14>
    fd58:	00f307b3          	add	a5,t1,a5
    fd5c:	40d006b3          	neg	a3,a3
    fd60:	0cf31463          	bne	t1,a5,fe28 <__multf3+0xa30>
    fd64:	fff58793          	addi	a5,a1,-1
    fd68:	00259593          	slli	a1,a1,0x2
    fd6c:	05058693          	addi	a3,a1,80
    fd70:	02010613          	addi	a2,sp,32
    fd74:	00c685b3          	add	a1,a3,a2
    fd78:	02012683          	lw	a3,32(sp)
    fd7c:	00e69733          	sll	a4,a3,a4
    fd80:	fae5a823          	sw	a4,-80(a1)
    fd84:	00178793          	addi	a5,a5,1
    fd88:	00279793          	slli	a5,a5,0x2
    fd8c:	00800693          	li	a3,8
    fd90:	02010713          	addi	a4,sp,32
    fd94:	00d7ea63          	bltu	a5,a3,fda8 <__multf3+0x9b0>
    fd98:	02012023          	sw	zero,32(sp)
    fd9c:	00072223          	sw	zero,4(a4)
    fda0:	ff878793          	addi	a5,a5,-8
    fda4:	02810713          	addi	a4,sp,40
    fda8:	00400693          	li	a3,4
    fdac:	00d7e463          	bltu	a5,a3,fdb4 <__multf3+0x9bc>
    fdb0:	00072023          	sw	zero,0(a4)
    fdb4:	ffffc4b7          	lui	s1,0xffffc
    fdb8:	01148493          	addi	s1,s1,17 # ffffc011 <_memory_end+0xfffdc011>
    fdbc:	40a484b3          	sub	s1,s1,a0
    fdc0:	f20ff06f          	j	f4e0 <__multf3+0xe8>
    fdc4:	00068a63          	beqz	a3,fdd8 <__multf3+0x9e0>
    fdc8:	00068513          	mv	a0,a3
    fdcc:	2f5020ef          	jal	128c0 <__clzsi2>
    fdd0:	02050513          	addi	a0,a0,32
    fdd4:	f5dff06f          	j	fd30 <__multf3+0x938>
    fdd8:	00050863          	beqz	a0,fde8 <__multf3+0x9f0>
    fddc:	2e5020ef          	jal	128c0 <__clzsi2>
    fde0:	04050513          	addi	a0,a0,64
    fde4:	f4dff06f          	j	fd30 <__multf3+0x938>
    fde8:	00078513          	mv	a0,a5
    fdec:	2d5020ef          	jal	128c0 <__clzsi2>
    fdf0:	06050513          	addi	a0,a0,96
    fdf4:	f3dff06f          	j	fd30 <__multf3+0x938>
    fdf8:	ffc00693          	li	a3,-4
    fdfc:	02d586b3          	mul	a3,a1,a3
    fe00:	02c10793          	addi	a5,sp,44
    fe04:	00300713          	li	a4,3
    fe08:	00d78633          	add	a2,a5,a3
    fe0c:	00062603          	lw	a2,0(a2)
    fe10:	fff70713          	addi	a4,a4,-1
    fe14:	ffc78793          	addi	a5,a5,-4
    fe18:	00c7a223          	sw	a2,4(a5)
    fe1c:	feb756e3          	bge	a4,a1,fe08 <__multf3+0xa10>
    fe20:	fff58793          	addi	a5,a1,-1
    fe24:	f61ff06f          	j	fd84 <__multf3+0x98c>
    fe28:	0007a603          	lw	a2,0(a5)
    fe2c:	ffc7a883          	lw	a7,-4(a5)
    fe30:	00d78e33          	add	t3,a5,a3
    fe34:	00e61633          	sll	a2,a2,a4
    fe38:	0108d8b3          	srl	a7,a7,a6
    fe3c:	01166633          	or	a2,a2,a7
    fe40:	00ce2023          	sw	a2,0(t3)
    fe44:	ffc78793          	addi	a5,a5,-4
    fe48:	f19ff06f          	j	fd60 <__multf3+0x968>
    fe4c:	00a7e7b3          	or	a5,a5,a0
    fe50:	00d7e7b3          	or	a5,a5,a3
    fe54:	00e7e7b3          	or	a5,a5,a4
    fe58:	00200b93          	li	s7,2
    fe5c:	e8078463          	beqz	a5,f4e4 <__multf3+0xec>
    fe60:	00300b93          	li	s7,3
    fe64:	e80ff06f          	j	f4e4 <__multf3+0xec>
    fe68:	00000493          	li	s1,0
    fe6c:	00100b93          	li	s7,1
    fe70:	e74ff06f          	j	f4e4 <__multf3+0xec>
    fe74:	016967b3          	or	a5,s2,s6
    fe78:	0157e7b3          	or	a5,a5,s5
    fe7c:	00a7e7b3          	or	a5,a5,a0
    fe80:	14078463          	beqz	a5,ffc8 <__multf3+0xbd0>
    fe84:	08050e63          	beqz	a0,ff20 <__multf3+0xb28>
    fe88:	239020ef          	jal	128c0 <__clzsi2>
    fe8c:	ff450693          	addi	a3,a0,-12
    fe90:	4056d793          	srai	a5,a3,0x5
    fe94:	01f6f693          	andi	a3,a3,31
    fe98:	0c068063          	beqz	a3,ff58 <__multf3+0xb60>
    fe9c:	ffc00613          	li	a2,-4
    fea0:	02c78633          	mul	a2,a5,a2
    fea4:	02000813          	li	a6,32
    fea8:	03010313          	addi	t1,sp,48
    feac:	40d80833          	sub	a6,a6,a3
    feb0:	00c60713          	addi	a4,a2,12
    feb4:	00e30733          	add	a4,t1,a4
    feb8:	40c00633          	neg	a2,a2
    febc:	0ce31663          	bne	t1,a4,ff88 <__multf3+0xb90>
    fec0:	fff78713          	addi	a4,a5,-1
    fec4:	00279793          	slli	a5,a5,0x2
    fec8:	02010613          	addi	a2,sp,32
    fecc:	05078793          	addi	a5,a5,80
    fed0:	00c787b3          	add	a5,a5,a2
    fed4:	03012603          	lw	a2,48(sp)
    fed8:	00d616b3          	sll	a3,a2,a3
    fedc:	fcd7a023          	sw	a3,-64(a5)
    fee0:	00170793          	addi	a5,a4,1
    fee4:	00279793          	slli	a5,a5,0x2
    fee8:	00800693          	li	a3,8
    feec:	03010713          	addi	a4,sp,48
    fef0:	00d7ea63          	bltu	a5,a3,ff04 <__multf3+0xb0c>
    fef4:	02012823          	sw	zero,48(sp)
    fef8:	00072223          	sw	zero,4(a4)
    fefc:	ff878793          	addi	a5,a5,-8
    ff00:	03810713          	addi	a4,sp,56
    ff04:	00400693          	li	a3,4
    ff08:	00d7e463          	bltu	a5,a3,ff10 <__multf3+0xb18>
    ff0c:	00072023          	sw	zero,0(a4)
    ff10:	ffffc7b7          	lui	a5,0xffffc
    ff14:	01178793          	addi	a5,a5,17 # ffffc011 <_memory_end+0xfffdc011>
    ff18:	40a787b3          	sub	a5,a5,a0
    ff1c:	e54ff06f          	j	f570 <__multf3+0x178>
    ff20:	000a8a63          	beqz	s5,ff34 <__multf3+0xb3c>
    ff24:	000a8513          	mv	a0,s5
    ff28:	199020ef          	jal	128c0 <__clzsi2>
    ff2c:	02050513          	addi	a0,a0,32
    ff30:	f5dff06f          	j	fe8c <__multf3+0xa94>
    ff34:	000b0a63          	beqz	s6,ff48 <__multf3+0xb50>
    ff38:	000b0513          	mv	a0,s6
    ff3c:	185020ef          	jal	128c0 <__clzsi2>
    ff40:	04050513          	addi	a0,a0,64
    ff44:	f49ff06f          	j	fe8c <__multf3+0xa94>
    ff48:	00090513          	mv	a0,s2
    ff4c:	175020ef          	jal	128c0 <__clzsi2>
    ff50:	06050513          	addi	a0,a0,96
    ff54:	f39ff06f          	j	fe8c <__multf3+0xa94>
    ff58:	ffc00613          	li	a2,-4
    ff5c:	02c78633          	mul	a2,a5,a2
    ff60:	03c10713          	addi	a4,sp,60
    ff64:	00300693          	li	a3,3
    ff68:	00c705b3          	add	a1,a4,a2
    ff6c:	0005a583          	lw	a1,0(a1)
    ff70:	fff68693          	addi	a3,a3,-1
    ff74:	ffc70713          	addi	a4,a4,-4
    ff78:	00b72223          	sw	a1,4(a4)
    ff7c:	fef6d6e3          	bge	a3,a5,ff68 <__multf3+0xb70>
    ff80:	fff78713          	addi	a4,a5,-1
    ff84:	f5dff06f          	j	fee0 <__multf3+0xae8>
    ff88:	00072583          	lw	a1,0(a4)
    ff8c:	ffc72883          	lw	a7,-4(a4)
    ff90:	00c70e33          	add	t3,a4,a2
    ff94:	00d595b3          	sll	a1,a1,a3
    ff98:	0108d8b3          	srl	a7,a7,a6
    ff9c:	0115e5b3          	or	a1,a1,a7
    ffa0:	00be2023          	sw	a1,0(t3)
    ffa4:	ffc70713          	addi	a4,a4,-4
    ffa8:	f15ff06f          	j	febc <__multf3+0xac4>
    ffac:	01696933          	or	s2,s2,s6
    ffb0:	01596933          	or	s2,s2,s5
    ffb4:	00a96933          	or	s2,s2,a0
    ffb8:	00200693          	li	a3,2
    ffbc:	da090c63          	beqz	s2,f574 <__multf3+0x17c>
    ffc0:	00300693          	li	a3,3
    ffc4:	db0ff06f          	j	f574 <__multf3+0x17c>
    ffc8:	00000793          	li	a5,0
    ffcc:	00100693          	li	a3,1
    ffd0:	da4ff06f          	j	f574 <__multf3+0x17c>
    ffd4:	00100713          	li	a4,1
    ffd8:	00f717b3          	sll	a5,a4,a5
    ffdc:	5307f713          	andi	a4,a5,1328
    ffe0:	06071863          	bnez	a4,10050 <__multf3+0xc58>
    ffe4:	0887f713          	andi	a4,a5,136
    ffe8:	04071063          	bnez	a4,10028 <__multf3+0xc30>
    ffec:	2407f793          	andi	a5,a5,576
    fff0:	dc078063          	beqz	a5,f5b0 <__multf3+0x1b8>
    fff4:	000087b7          	lui	a5,0x8
    fff8:	04f12623          	sw	a5,76(sp)
    fffc:	04012423          	sw	zero,72(sp)
   10000:	04012223          	sw	zero,68(sp)
   10004:	04012023          	sw	zero,64(sp)
   10008:	fff78793          	addi	a5,a5,-1 # 7fff <__gdtoa+0x1067>
   1000c:	00012223          	sw	zero,4(sp)
   10010:	1440006f          	j	10154 <__multf3+0xd5c>
   10014:	00f00713          	li	a4,15
   10018:	fce78ee3          	beq	a5,a4,fff4 <__multf3+0xbfc>
   1001c:	00b00713          	li	a4,11
   10020:	01412223          	sw	s4,4(sp)
   10024:	02e79663          	bne	a5,a4,10050 <__multf3+0xc58>
   10028:	01312223          	sw	s3,4(sp)
   1002c:	03012783          	lw	a5,48(sp)
   10030:	00068b93          	mv	s7,a3
   10034:	04f12023          	sw	a5,64(sp)
   10038:	03412783          	lw	a5,52(sp)
   1003c:	04f12223          	sw	a5,68(sp)
   10040:	03812783          	lw	a5,56(sp)
   10044:	04f12423          	sw	a5,72(sp)
   10048:	03c12783          	lw	a5,60(sp)
   1004c:	0200006f          	j	1006c <__multf3+0xc74>
   10050:	02012783          	lw	a5,32(sp)
   10054:	04f12023          	sw	a5,64(sp)
   10058:	02412783          	lw	a5,36(sp)
   1005c:	04f12223          	sw	a5,68(sp)
   10060:	02812783          	lw	a5,40(sp)
   10064:	04f12423          	sw	a5,72(sp)
   10068:	02c12783          	lw	a5,44(sp)
   1006c:	04f12623          	sw	a5,76(sp)
   10070:	00200793          	li	a5,2
   10074:	36fb8663          	beq	s7,a5,103e0 <__multf3+0xfe8>
   10078:	00300793          	li	a5,3
   1007c:	f6fb8ce3          	beq	s7,a5,fff4 <__multf3+0xbfc>
   10080:	00100793          	li	a5,1
   10084:	34fb8463          	beq	s7,a5,103cc <__multf3+0xfd4>
   10088:	00812703          	lw	a4,8(sp)
   1008c:	000047b7          	lui	a5,0x4
   10090:	fff78793          	addi	a5,a5,-1 # 3fff <_vfprintf_r+0x1aef>
   10094:	00f707b3          	add	a5,a4,a5
   10098:	12f05a63          	blez	a5,101cc <__multf3+0xdd4>
   1009c:	04012703          	lw	a4,64(sp)
   100a0:	00777693          	andi	a3,a4,7
   100a4:	04068463          	beqz	a3,100ec <__multf3+0xcf4>
   100a8:	00f77693          	andi	a3,a4,15
   100ac:	00400613          	li	a2,4
   100b0:	02c68e63          	beq	a3,a2,100ec <__multf3+0xcf4>
   100b4:	00470713          	addi	a4,a4,4
   100b8:	00473693          	sltiu	a3,a4,4
   100bc:	04e12023          	sw	a4,64(sp)
   100c0:	04412703          	lw	a4,68(sp)
   100c4:	00e68733          	add	a4,a3,a4
   100c8:	04e12223          	sw	a4,68(sp)
   100cc:	00d73733          	sltu	a4,a4,a3
   100d0:	04812683          	lw	a3,72(sp)
   100d4:	00e68733          	add	a4,a3,a4
   100d8:	04e12423          	sw	a4,72(sp)
   100dc:	00d73733          	sltu	a4,a4,a3
   100e0:	04c12683          	lw	a3,76(sp)
   100e4:	00d70733          	add	a4,a4,a3
   100e8:	04e12623          	sw	a4,76(sp)
   100ec:	04c12703          	lw	a4,76(sp)
   100f0:	00b71693          	slli	a3,a4,0xb
   100f4:	0206d063          	bgez	a3,10114 <__multf3+0xd1c>
   100f8:	fff007b7          	lui	a5,0xfff00
   100fc:	fff78793          	addi	a5,a5,-1 # ffefffff <_memory_end+0xffedffff>
   10100:	00f77733          	and	a4,a4,a5
   10104:	04e12623          	sw	a4,76(sp)
   10108:	00812703          	lw	a4,8(sp)
   1010c:	000047b7          	lui	a5,0x4
   10110:	00f707b3          	add	a5,a4,a5
   10114:	04010713          	addi	a4,sp,64
   10118:	04c10593          	addi	a1,sp,76
   1011c:	00072683          	lw	a3,0(a4)
   10120:	00472603          	lw	a2,4(a4)
   10124:	00470713          	addi	a4,a4,4
   10128:	0036d693          	srli	a3,a3,0x3
   1012c:	01d61613          	slli	a2,a2,0x1d
   10130:	00c6e6b3          	or	a3,a3,a2
   10134:	fed72e23          	sw	a3,-4(a4)
   10138:	fee592e3          	bne	a1,a4,1011c <__multf3+0xd24>
   1013c:	000086b7          	lui	a3,0x8
   10140:	ffe68693          	addi	a3,a3,-2 # 7ffe <__gdtoa+0x1066>
   10144:	04c12703          	lw	a4,76(sp)
   10148:	28f6cc63          	blt	a3,a5,103e0 <__multf3+0xfe8>
   1014c:	00375713          	srli	a4,a4,0x3
   10150:	04e12623          	sw	a4,76(sp)
   10154:	04c12703          	lw	a4,76(sp)
   10158:	0ac12083          	lw	ra,172(sp)
   1015c:	00040513          	mv	a0,s0
   10160:	04e11e23          	sh	a4,92(sp)
   10164:	00412703          	lw	a4,4(sp)
   10168:	0a412483          	lw	s1,164(sp)
   1016c:	0a012903          	lw	s2,160(sp)
   10170:	00f71713          	slli	a4,a4,0xf
   10174:	00f767b3          	or	a5,a4,a5
   10178:	04f11f23          	sh	a5,94(sp)
   1017c:	04012783          	lw	a5,64(sp)
   10180:	09c12983          	lw	s3,156(sp)
   10184:	09812a03          	lw	s4,152(sp)
   10188:	00f42023          	sw	a5,0(s0)
   1018c:	04412783          	lw	a5,68(sp)
   10190:	09412a83          	lw	s5,148(sp)
   10194:	09012b03          	lw	s6,144(sp)
   10198:	00f42223          	sw	a5,4(s0)
   1019c:	04812783          	lw	a5,72(sp)
   101a0:	08c12b83          	lw	s7,140(sp)
   101a4:	08812c03          	lw	s8,136(sp)
   101a8:	00f42423          	sw	a5,8(s0)
   101ac:	05c12783          	lw	a5,92(sp)
   101b0:	08412c83          	lw	s9,132(sp)
   101b4:	08012d03          	lw	s10,128(sp)
   101b8:	00f42623          	sw	a5,12(s0)
   101bc:	0a812403          	lw	s0,168(sp)
   101c0:	07c12d83          	lw	s11,124(sp)
   101c4:	0b010113          	addi	sp,sp,176
   101c8:	00008067          	ret
   101cc:	00100693          	li	a3,1
   101d0:	40f686b3          	sub	a3,a3,a5
   101d4:	07400793          	li	a5,116
   101d8:	1cd7ca63          	blt	a5,a3,103ac <__multf3+0xfb4>
   101dc:	04010613          	addi	a2,sp,64
   101e0:	4056d713          	srai	a4,a3,0x5
   101e4:	00060513          	mv	a0,a2
   101e8:	01f6f693          	andi	a3,a3,31
   101ec:	00000793          	li	a5,0
   101f0:	00000593          	li	a1,0
   101f4:	02e59e63          	bne	a1,a4,10230 <__multf3+0xe38>
   101f8:	00300593          	li	a1,3
   101fc:	40e585b3          	sub	a1,a1,a4
   10200:	00271513          	slli	a0,a4,0x2
   10204:	04069063          	bnez	a3,10244 <__multf3+0xe4c>
   10208:	00060813          	mv	a6,a2
   1020c:	00a808b3          	add	a7,a6,a0
   10210:	0008a883          	lw	a7,0(a7) # 10000 <__multf3+0xc08>
   10214:	00168693          	addi	a3,a3,1
   10218:	00480813          	addi	a6,a6,4
   1021c:	ff182e23          	sw	a7,-4(a6)
   10220:	fed5d6e3          	bge	a1,a3,1020c <__multf3+0xe14>
   10224:	00400693          	li	a3,4
   10228:	40e68733          	sub	a4,a3,a4
   1022c:	06c0006f          	j	10298 <__multf3+0xea0>
   10230:	00052803          	lw	a6,0(a0)
   10234:	00158593          	addi	a1,a1,1
   10238:	00450513          	addi	a0,a0,4
   1023c:	0107e7b3          	or	a5,a5,a6
   10240:	fb5ff06f          	j	101f4 <__multf3+0xdfc>
   10244:	05050813          	addi	a6,a0,80
   10248:	02010893          	addi	a7,sp,32
   1024c:	01180833          	add	a6,a6,a7
   10250:	fd082803          	lw	a6,-48(a6)
   10254:	02000313          	li	t1,32
   10258:	40d30333          	sub	t1,t1,a3
   1025c:	00681833          	sll	a6,a6,t1
   10260:	0107e7b3          	or	a5,a5,a6
   10264:	00000e13          	li	t3,0
   10268:	00a60833          	add	a6,a2,a0
   1026c:	40a00533          	neg	a0,a0
   10270:	0ebe4063          	blt	t3,a1,10350 <__multf3+0xf58>
   10274:	00400513          	li	a0,4
   10278:	00259593          	slli	a1,a1,0x2
   1027c:	40e50733          	sub	a4,a0,a4
   10280:	05058593          	addi	a1,a1,80
   10284:	02010513          	addi	a0,sp,32
   10288:	00a585b3          	add	a1,a1,a0
   1028c:	04c12503          	lw	a0,76(sp)
   10290:	00d556b3          	srl	a3,a0,a3
   10294:	fcd5a823          	sw	a3,-48(a1)
   10298:	00400693          	li	a3,4
   1029c:	40e686b3          	sub	a3,a3,a4
   102a0:	00269693          	slli	a3,a3,0x2
   102a4:	00271713          	slli	a4,a4,0x2
   102a8:	00800593          	li	a1,8
   102ac:	00e60733          	add	a4,a2,a4
   102b0:	00b6ea63          	bltu	a3,a1,102c4 <__multf3+0xecc>
   102b4:	00072023          	sw	zero,0(a4)
   102b8:	00072223          	sw	zero,4(a4)
   102bc:	ff868693          	addi	a3,a3,-8
   102c0:	00870713          	addi	a4,a4,8
   102c4:	00400593          	li	a1,4
   102c8:	00b6e463          	bltu	a3,a1,102d0 <__multf3+0xed8>
   102cc:	00072023          	sw	zero,0(a4)
   102d0:	04012703          	lw	a4,64(sp)
   102d4:	00f037b3          	snez	a5,a5
   102d8:	00e7e7b3          	or	a5,a5,a4
   102dc:	04f12023          	sw	a5,64(sp)
   102e0:	0077f713          	andi	a4,a5,7
   102e4:	04070463          	beqz	a4,1032c <__multf3+0xf34>
   102e8:	00f7f713          	andi	a4,a5,15
   102ec:	00400693          	li	a3,4
   102f0:	02d70e63          	beq	a4,a3,1032c <__multf3+0xf34>
   102f4:	04412703          	lw	a4,68(sp)
   102f8:	00478793          	addi	a5,a5,4 # 4004 <_vfprintf_r+0x1af4>
   102fc:	04f12023          	sw	a5,64(sp)
   10300:	0047b793          	sltiu	a5,a5,4
   10304:	00f707b3          	add	a5,a4,a5
   10308:	04f12223          	sw	a5,68(sp)
   1030c:	00e7b7b3          	sltu	a5,a5,a4
   10310:	04812703          	lw	a4,72(sp)
   10314:	00f707b3          	add	a5,a4,a5
   10318:	04f12423          	sw	a5,72(sp)
   1031c:	00e7b7b3          	sltu	a5,a5,a4
   10320:	04c12703          	lw	a4,76(sp)
   10324:	00e787b3          	add	a5,a5,a4
   10328:	04f12623          	sw	a5,76(sp)
   1032c:	04c12703          	lw	a4,76(sp)
   10330:	00c71793          	slli	a5,a4,0xc
   10334:	0407d263          	bgez	a5,10378 <__multf3+0xf80>
   10338:	04012623          	sw	zero,76(sp)
   1033c:	04012423          	sw	zero,72(sp)
   10340:	04012223          	sw	zero,68(sp)
   10344:	04012023          	sw	zero,64(sp)
   10348:	00100793          	li	a5,1
   1034c:	e09ff06f          	j	10154 <__multf3+0xd5c>
   10350:	00082883          	lw	a7,0(a6)
   10354:	00482e83          	lw	t4,4(a6)
   10358:	00a80f33          	add	t5,a6,a0
   1035c:	00d8d8b3          	srl	a7,a7,a3
   10360:	006e9eb3          	sll	t4,t4,t1
   10364:	01d8e8b3          	or	a7,a7,t4
   10368:	011f2023          	sw	a7,0(t5)
   1036c:	001e0e13          	addi	t3,t3,1
   10370:	00480813          	addi	a6,a6,4
   10374:	efdff06f          	j	10270 <__multf3+0xe78>
   10378:	00c60593          	addi	a1,a2,12
   1037c:	00062783          	lw	a5,0(a2)
   10380:	00462683          	lw	a3,4(a2)
   10384:	00460613          	addi	a2,a2,4
   10388:	0037d793          	srli	a5,a5,0x3
   1038c:	01d69693          	slli	a3,a3,0x1d
   10390:	00d7e7b3          	or	a5,a5,a3
   10394:	fef62e23          	sw	a5,-4(a2)
   10398:	fec592e3          	bne	a1,a2,1037c <__multf3+0xf84>
   1039c:	00375713          	srli	a4,a4,0x3
   103a0:	04e12623          	sw	a4,76(sp)
   103a4:	00000793          	li	a5,0
   103a8:	dadff06f          	j	10154 <__multf3+0xd5c>
   103ac:	04412703          	lw	a4,68(sp)
   103b0:	04012783          	lw	a5,64(sp)
   103b4:	00e7e7b3          	or	a5,a5,a4
   103b8:	04812703          	lw	a4,72(sp)
   103bc:	00e7e7b3          	or	a5,a5,a4
   103c0:	04c12703          	lw	a4,76(sp)
   103c4:	00e7e7b3          	or	a5,a5,a4
   103c8:	fc078ee3          	beqz	a5,103a4 <__multf3+0xfac>
   103cc:	04012623          	sw	zero,76(sp)
   103d0:	04012423          	sw	zero,72(sp)
   103d4:	04012223          	sw	zero,68(sp)
   103d8:	04012023          	sw	zero,64(sp)
   103dc:	fc9ff06f          	j	103a4 <__multf3+0xfac>
   103e0:	000087b7          	lui	a5,0x8
   103e4:	04012623          	sw	zero,76(sp)
   103e8:	04012423          	sw	zero,72(sp)
   103ec:	04012223          	sw	zero,68(sp)
   103f0:	04012023          	sw	zero,64(sp)
   103f4:	fff78793          	addi	a5,a5,-1 # 7fff <__gdtoa+0x1067>
   103f8:	d5dff06f          	j	10154 <__multf3+0xd5c>

000103fc <__subtf3>:
   103fc:	f9010113          	addi	sp,sp,-112
   10400:	0085a703          	lw	a4,8(a1)
   10404:	05512a23          	sw	s5,84(sp)
   10408:	00c5aa83          	lw	s5,12(a1)
   1040c:	0005a783          	lw	a5,0(a1)
   10410:	0045a683          	lw	a3,4(a1)
   10414:	02e12c23          	sw	a4,56(sp)
   10418:	00e12c23          	sw	a4,24(sp)
   1041c:	010a9713          	slli	a4,s5,0x10
   10420:	06912223          	sw	s1,100(sp)
   10424:	01075713          	srli	a4,a4,0x10
   10428:	001a9493          	slli	s1,s5,0x1
   1042c:	00462803          	lw	a6,4(a2)
   10430:	00862583          	lw	a1,8(a2)
   10434:	06812423          	sw	s0,104(sp)
   10438:	07212023          	sw	s2,96(sp)
   1043c:	00062403          	lw	s0,0(a2)
   10440:	00c62903          	lw	s2,12(a2)
   10444:	05412c23          	sw	s4,88(sp)
   10448:	03512e23          	sw	s5,60(sp)
   1044c:	00050a13          	mv	s4,a0
   10450:	06112623          	sw	ra,108(sp)
   10454:	05312e23          	sw	s3,92(sp)
   10458:	05612823          	sw	s6,80(sp)
   1045c:	05712623          	sw	s7,76(sp)
   10460:	05812423          	sw	s8,72(sp)
   10464:	02f12823          	sw	a5,48(sp)
   10468:	02d12a23          	sw	a3,52(sp)
   1046c:	00f12823          	sw	a5,16(sp)
   10470:	00d12a23          	sw	a3,20(sp)
   10474:	00e12e23          	sw	a4,28(sp)
   10478:	0114d493          	srli	s1,s1,0x11
   1047c:	01fada93          	srli	s5,s5,0x1f
   10480:	01010513          	addi	a0,sp,16
   10484:	01c10613          	addi	a2,sp,28
   10488:	00062703          	lw	a4,0(a2)
   1048c:	ffc62683          	lw	a3,-4(a2)
   10490:	ffc60613          	addi	a2,a2,-4
   10494:	00371713          	slli	a4,a4,0x3
   10498:	01d6d693          	srli	a3,a3,0x1d
   1049c:	00d76733          	or	a4,a4,a3
   104a0:	00e62223          	sw	a4,4(a2)
   104a4:	fec512e3          	bne	a0,a2,10488 <__subtf3+0x8c>
   104a8:	01091713          	slli	a4,s2,0x10
   104ac:	00191b93          	slli	s7,s2,0x1
   104b0:	00379793          	slli	a5,a5,0x3
   104b4:	01075713          	srli	a4,a4,0x10
   104b8:	03012a23          	sw	a6,52(sp)
   104bc:	03212e23          	sw	s2,60(sp)
   104c0:	03012223          	sw	a6,36(sp)
   104c4:	00f12823          	sw	a5,16(sp)
   104c8:	02812823          	sw	s0,48(sp)
   104cc:	02b12c23          	sw	a1,56(sp)
   104d0:	02812023          	sw	s0,32(sp)
   104d4:	02b12423          	sw	a1,40(sp)
   104d8:	02e12623          	sw	a4,44(sp)
   104dc:	011bdb93          	srli	s7,s7,0x11
   104e0:	01f95913          	srli	s2,s2,0x1f
   104e4:	02010813          	addi	a6,sp,32
   104e8:	02c10313          	addi	t1,sp,44
   104ec:	00032703          	lw	a4,0(t1)
   104f0:	ffc32683          	lw	a3,-4(t1)
   104f4:	ffc30313          	addi	t1,t1,-4
   104f8:	00371713          	slli	a4,a4,0x3
   104fc:	01d6d693          	srli	a3,a3,0x1d
   10500:	00d76733          	or	a4,a4,a3
   10504:	00e32223          	sw	a4,4(t1)
   10508:	fe6812e3          	bne	a6,t1,104ec <__subtf3+0xf0>
   1050c:	00341413          	slli	s0,s0,0x3
   10510:	00008737          	lui	a4,0x8
   10514:	02812023          	sw	s0,32(sp)
   10518:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x1067>
   1051c:	02eb9063          	bne	s7,a4,1053c <__subtf3+0x140>
   10520:	02812683          	lw	a3,40(sp)
   10524:	02412703          	lw	a4,36(sp)
   10528:	00d76733          	or	a4,a4,a3
   1052c:	02c12683          	lw	a3,44(sp)
   10530:	00d76733          	or	a4,a4,a3
   10534:	00876733          	or	a4,a4,s0
   10538:	00071463          	bnez	a4,10540 <__subtf3+0x144>
   1053c:	00194913          	xori	s2,s2,1
   10540:	417488b3          	sub	a7,s1,s7
   10544:	095916e3          	bne	s2,s5,10dd0 <__subtf3+0x9d4>
   10548:	45105263          	blez	a7,1098c <__subtf3+0x590>
   1054c:	01412903          	lw	s2,20(sp)
   10550:	01812983          	lw	s3,24(sp)
   10554:	01c12b03          	lw	s6,28(sp)
   10558:	0a0b9263          	bnez	s7,105fc <__subtf3+0x200>
   1055c:	02412683          	lw	a3,36(sp)
   10560:	02812703          	lw	a4,40(sp)
   10564:	02c12583          	lw	a1,44(sp)
   10568:	00e6e633          	or	a2,a3,a4
   1056c:	00b66633          	or	a2,a2,a1
   10570:	00866633          	or	a2,a2,s0
   10574:	00061e63          	bnez	a2,10590 <__subtf3+0x194>
   10578:	02f12823          	sw	a5,48(sp)
   1057c:	03212a23          	sw	s2,52(sp)
   10580:	03312c23          	sw	s3,56(sp)
   10584:	03612e23          	sw	s6,60(sp)
   10588:	00088493          	mv	s1,a7
   1058c:	08c0006f          	j	10618 <__subtf3+0x21c>
   10590:	fff88613          	addi	a2,a7,-1
   10594:	04061863          	bnez	a2,105e4 <__subtf3+0x1e8>
   10598:	00878433          	add	s0,a5,s0
   1059c:	01268933          	add	s2,a3,s2
   105a0:	02812823          	sw	s0,48(sp)
   105a4:	00f43433          	sltu	s0,s0,a5
   105a8:	00890433          	add	s0,s2,s0
   105ac:	02812a23          	sw	s0,52(sp)
   105b0:	00d936b3          	sltu	a3,s2,a3
   105b4:	01243433          	sltu	s0,s0,s2
   105b8:	013709b3          	add	s3,a4,s3
   105bc:	0086e6b3          	or	a3,a3,s0
   105c0:	00d986b3          	add	a3,s3,a3
   105c4:	02d12c23          	sw	a3,56(sp)
   105c8:	00e9b7b3          	sltu	a5,s3,a4
   105cc:	0136b6b3          	sltu	a3,a3,s3
   105d0:	00d7e7b3          	or	a5,a5,a3
   105d4:	016585b3          	add	a1,a1,s6
   105d8:	00b787b3          	add	a5,a5,a1
   105dc:	00100493          	li	s1,1
   105e0:	2fc0006f          	j	108dc <__subtf3+0x4e0>
   105e4:	00008737          	lui	a4,0x8
   105e8:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x1067>
   105ec:	00e88463          	beq	a7,a4,105f4 <__subtf3+0x1f8>
   105f0:	2500106f          	j	11840 <__subtf3+0x1444>
   105f4:	02f12823          	sw	a5,48(sp)
   105f8:	4400006f          	j	10a38 <__subtf3+0x63c>
   105fc:	00008737          	lui	a4,0x8
   10600:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x1067>
   10604:	16e49a63          	bne	s1,a4,10778 <__subtf3+0x37c>
   10608:	02f12823          	sw	a5,48(sp)
   1060c:	03212a23          	sw	s2,52(sp)
   10610:	03312c23          	sw	s3,56(sp)
   10614:	03612e23          	sw	s6,60(sp)
   10618:	03012783          	lw	a5,48(sp)
   1061c:	0077f713          	andi	a4,a5,7
   10620:	04070463          	beqz	a4,10668 <__subtf3+0x26c>
   10624:	00f7f713          	andi	a4,a5,15
   10628:	00400693          	li	a3,4
   1062c:	02d70e63          	beq	a4,a3,10668 <__subtf3+0x26c>
   10630:	03412703          	lw	a4,52(sp)
   10634:	00478793          	addi	a5,a5,4
   10638:	02f12823          	sw	a5,48(sp)
   1063c:	0047b793          	sltiu	a5,a5,4
   10640:	00f707b3          	add	a5,a4,a5
   10644:	02f12a23          	sw	a5,52(sp)
   10648:	00e7b7b3          	sltu	a5,a5,a4
   1064c:	03812703          	lw	a4,56(sp)
   10650:	00f707b3          	add	a5,a4,a5
   10654:	02f12c23          	sw	a5,56(sp)
   10658:	00e7b7b3          	sltu	a5,a5,a4
   1065c:	03c12703          	lw	a4,60(sp)
   10660:	00e787b3          	add	a5,a5,a4
   10664:	02f12e23          	sw	a5,60(sp)
   10668:	03c12783          	lw	a5,60(sp)
   1066c:	00c79713          	slli	a4,a5,0xc
   10670:	02075463          	bgez	a4,10698 <__subtf3+0x29c>
   10674:	00008737          	lui	a4,0x8
   10678:	00148493          	addi	s1,s1,1
   1067c:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x1067>
   10680:	00e49463          	bne	s1,a4,10688 <__subtf3+0x28c>
   10684:	1a80106f          	j	1182c <__subtf3+0x1430>
   10688:	fff80737          	lui	a4,0xfff80
   1068c:	fff70713          	addi	a4,a4,-1 # fff7ffff <_memory_end+0xfff5ffff>
   10690:	00e7f7b3          	and	a5,a5,a4
   10694:	02f12e23          	sw	a5,60(sp)
   10698:	03010793          	addi	a5,sp,48
   1069c:	03c10613          	addi	a2,sp,60
   106a0:	0007a703          	lw	a4,0(a5)
   106a4:	0047a683          	lw	a3,4(a5)
   106a8:	00478793          	addi	a5,a5,4
   106ac:	00375713          	srli	a4,a4,0x3
   106b0:	01d69693          	slli	a3,a3,0x1d
   106b4:	00d76733          	or	a4,a4,a3
   106b8:	fee7ae23          	sw	a4,-4(a5)
   106bc:	fec792e3          	bne	a5,a2,106a0 <__subtf3+0x2a4>
   106c0:	03c12703          	lw	a4,60(sp)
   106c4:	000086b7          	lui	a3,0x8
   106c8:	fff68793          	addi	a5,a3,-1 # 7fff <__gdtoa+0x1067>
   106cc:	00375713          	srli	a4,a4,0x3
   106d0:	02e12e23          	sw	a4,60(sp)
   106d4:	02f49a63          	bne	s1,a5,10708 <__subtf3+0x30c>
   106d8:	03412603          	lw	a2,52(sp)
   106dc:	03012783          	lw	a5,48(sp)
   106e0:	00c7e7b3          	or	a5,a5,a2
   106e4:	03812603          	lw	a2,56(sp)
   106e8:	00c7e7b3          	or	a5,a5,a2
   106ec:	00e7e7b3          	or	a5,a5,a4
   106f0:	00078c63          	beqz	a5,10708 <__subtf3+0x30c>
   106f4:	02d12e23          	sw	a3,60(sp)
   106f8:	02012c23          	sw	zero,56(sp)
   106fc:	02012a23          	sw	zero,52(sp)
   10700:	02012823          	sw	zero,48(sp)
   10704:	00000a93          	li	s5,0
   10708:	03c12783          	lw	a5,60(sp)
   1070c:	01149493          	slli	s1,s1,0x11
   10710:	0114d493          	srli	s1,s1,0x11
   10714:	00f11623          	sh	a5,12(sp)
   10718:	03012783          	lw	a5,48(sp)
   1071c:	00fa9a93          	slli	s5,s5,0xf
   10720:	009aeab3          	or	s5,s5,s1
   10724:	00fa2023          	sw	a5,0(s4)
   10728:	03412783          	lw	a5,52(sp)
   1072c:	01511723          	sh	s5,14(sp)
   10730:	06c12083          	lw	ra,108(sp)
   10734:	00fa2223          	sw	a5,4(s4)
   10738:	03812783          	lw	a5,56(sp)
   1073c:	06812403          	lw	s0,104(sp)
   10740:	06412483          	lw	s1,100(sp)
   10744:	00fa2423          	sw	a5,8(s4)
   10748:	00c12783          	lw	a5,12(sp)
   1074c:	06012903          	lw	s2,96(sp)
   10750:	05c12983          	lw	s3,92(sp)
   10754:	00fa2623          	sw	a5,12(s4)
   10758:	05412a83          	lw	s5,84(sp)
   1075c:	05012b03          	lw	s6,80(sp)
   10760:	04c12b83          	lw	s7,76(sp)
   10764:	04812c03          	lw	s8,72(sp)
   10768:	000a0513          	mv	a0,s4
   1076c:	05812a03          	lw	s4,88(sp)
   10770:	07010113          	addi	sp,sp,112
   10774:	00008067          	ret
   10778:	02c12703          	lw	a4,44(sp)
   1077c:	000806b7          	lui	a3,0x80
   10780:	00d76733          	or	a4,a4,a3
   10784:	02e12623          	sw	a4,44(sp)
   10788:	07400713          	li	a4,116
   1078c:	01175463          	bge	a4,a7,10794 <__subtf3+0x398>
   10790:	0bc0106f          	j	1184c <__subtf3+0x1450>
   10794:	00088613          	mv	a2,a7
   10798:	40565693          	srai	a3,a2,0x5
   1079c:	00030513          	mv	a0,t1
   107a0:	01f67613          	andi	a2,a2,31
   107a4:	00000713          	li	a4,0
   107a8:	00000593          	li	a1,0
   107ac:	02d59c63          	bne	a1,a3,107e4 <__subtf3+0x3e8>
   107b0:	00300593          	li	a1,3
   107b4:	40d585b3          	sub	a1,a1,a3
   107b8:	00269513          	slli	a0,a3,0x2
   107bc:	02061e63          	bnez	a2,107f8 <__subtf3+0x3fc>
   107c0:	00a308b3          	add	a7,t1,a0
   107c4:	0008a883          	lw	a7,0(a7)
   107c8:	00160613          	addi	a2,a2,1
   107cc:	00430313          	addi	t1,t1,4
   107d0:	ff132e23          	sw	a7,-4(t1)
   107d4:	fec5d6e3          	bge	a1,a2,107c0 <__subtf3+0x3c4>
   107d8:	00400613          	li	a2,4
   107dc:	40d606b3          	sub	a3,a2,a3
   107e0:	0640006f          	j	10844 <__subtf3+0x448>
   107e4:	00052883          	lw	a7,0(a0)
   107e8:	00158593          	addi	a1,a1,1
   107ec:	00450513          	addi	a0,a0,4
   107f0:	01176733          	or	a4,a4,a7
   107f4:	fb9ff06f          	j	107ac <__subtf3+0x3b0>
   107f8:	04050893          	addi	a7,a0,64
   107fc:	002888b3          	add	a7,a7,sp
   10800:	fe08a883          	lw	a7,-32(a7)
   10804:	02000e13          	li	t3,32
   10808:	40ce0e33          	sub	t3,t3,a2
   1080c:	01c898b3          	sll	a7,a7,t3
   10810:	01176733          	or	a4,a4,a7
   10814:	00000e93          	li	t4,0
   10818:	00a808b3          	add	a7,a6,a0
   1081c:	40a00533          	neg	a0,a0
   10820:	14bec263          	blt	t4,a1,10964 <__subtf3+0x568>
   10824:	00400513          	li	a0,4
   10828:	40d506b3          	sub	a3,a0,a3
   1082c:	02c12503          	lw	a0,44(sp)
   10830:	00259593          	slli	a1,a1,0x2
   10834:	04058593          	addi	a1,a1,64
   10838:	002585b3          	add	a1,a1,sp
   1083c:	00c55633          	srl	a2,a0,a2
   10840:	fec5a023          	sw	a2,-32(a1)
   10844:	00400613          	li	a2,4
   10848:	40d60633          	sub	a2,a2,a3
   1084c:	00261613          	slli	a2,a2,0x2
   10850:	00269693          	slli	a3,a3,0x2
   10854:	00800593          	li	a1,8
   10858:	00d806b3          	add	a3,a6,a3
   1085c:	00b66a63          	bltu	a2,a1,10870 <__subtf3+0x474>
   10860:	0006a023          	sw	zero,0(a3) # 80000 <_memory_end+0x60000>
   10864:	0006a223          	sw	zero,4(a3)
   10868:	ff860613          	addi	a2,a2,-8
   1086c:	00868693          	addi	a3,a3,8
   10870:	00400593          	li	a1,4
   10874:	00b66463          	bltu	a2,a1,1087c <__subtf3+0x480>
   10878:	0006a023          	sw	zero,0(a3)
   1087c:	02012683          	lw	a3,32(sp)
   10880:	00e03733          	snez	a4,a4
   10884:	00d76733          	or	a4,a4,a3
   10888:	02412683          	lw	a3,36(sp)
   1088c:	02e12023          	sw	a4,32(sp)
   10890:	00e78733          	add	a4,a5,a4
   10894:	01268933          	add	s2,a3,s2
   10898:	02e12823          	sw	a4,48(sp)
   1089c:	00f73733          	sltu	a4,a4,a5
   108a0:	02812783          	lw	a5,40(sp)
   108a4:	00e90733          	add	a4,s2,a4
   108a8:	02e12a23          	sw	a4,52(sp)
   108ac:	00d936b3          	sltu	a3,s2,a3
   108b0:	01273733          	sltu	a4,a4,s2
   108b4:	013789b3          	add	s3,a5,s3
   108b8:	00e6e733          	or	a4,a3,a4
   108bc:	00e98733          	add	a4,s3,a4
   108c0:	02e12c23          	sw	a4,56(sp)
   108c4:	00f9b7b3          	sltu	a5,s3,a5
   108c8:	01373733          	sltu	a4,a4,s3
   108cc:	00e7e7b3          	or	a5,a5,a4
   108d0:	02c12703          	lw	a4,44(sp)
   108d4:	00eb0733          	add	a4,s6,a4
   108d8:	00e787b3          	add	a5,a5,a4
   108dc:	02f12e23          	sw	a5,60(sp)
   108e0:	00c79713          	slli	a4,a5,0xc
   108e4:	d2075ae3          	bgez	a4,10618 <__subtf3+0x21c>
   108e8:	03012683          	lw	a3,48(sp)
   108ec:	fff80737          	lui	a4,0xfff80
   108f0:	fff70713          	addi	a4,a4,-1 # fff7ffff <_memory_end+0xfff5ffff>
   108f4:	00e7f7b3          	and	a5,a5,a4
   108f8:	02f12e23          	sw	a5,60(sp)
   108fc:	00148493          	addi	s1,s1,1
   10900:	01f69693          	slli	a3,a3,0x1f
   10904:	03010713          	addi	a4,sp,48
   10908:	03c10513          	addi	a0,sp,60
   1090c:	00072603          	lw	a2,0(a4)
   10910:	00472583          	lw	a1,4(a4)
   10914:	00470713          	addi	a4,a4,4
   10918:	00165613          	srli	a2,a2,0x1
   1091c:	01f59593          	slli	a1,a1,0x1f
   10920:	00b66633          	or	a2,a2,a1
   10924:	fec72e23          	sw	a2,-4(a4)
   10928:	fee512e3          	bne	a0,a4,1090c <__subtf3+0x510>
   1092c:	03012703          	lw	a4,48(sp)
   10930:	0017d793          	srli	a5,a5,0x1
   10934:	02f12e23          	sw	a5,60(sp)
   10938:	00d037b3          	snez	a5,a3
   1093c:	00f767b3          	or	a5,a4,a5
   10940:	02f12823          	sw	a5,48(sp)
   10944:	000087b7          	lui	a5,0x8
   10948:	fff78793          	addi	a5,a5,-1 # 7fff <__gdtoa+0x1067>
   1094c:	ccf496e3          	bne	s1,a5,10618 <__subtf3+0x21c>
   10950:	02012e23          	sw	zero,60(sp)
   10954:	02012c23          	sw	zero,56(sp)
   10958:	02012a23          	sw	zero,52(sp)
   1095c:	02012823          	sw	zero,48(sp)
   10960:	cb9ff06f          	j	10618 <__subtf3+0x21c>
   10964:	0008a303          	lw	t1,0(a7)
   10968:	0048af03          	lw	t5,4(a7)
   1096c:	00a88fb3          	add	t6,a7,a0
   10970:	00c35333          	srl	t1,t1,a2
   10974:	01cf1f33          	sll	t5,t5,t3
   10978:	01e36333          	or	t1,t1,t5
   1097c:	006fa023          	sw	t1,0(t6)
   10980:	001e8e93          	addi	t4,t4,1
   10984:	00488893          	addi	a7,a7,4
   10988:	e99ff06f          	j	10820 <__subtf3+0x424>
   1098c:	02412903          	lw	s2,36(sp)
   10990:	02812983          	lw	s3,40(sp)
   10994:	02c12b03          	lw	s6,44(sp)
   10998:	26088263          	beqz	a7,10bfc <__subtf3+0x800>
   1099c:	409b8833          	sub	a6,s7,s1
   109a0:	0a049c63          	bnez	s1,10a58 <__subtf3+0x65c>
   109a4:	01412683          	lw	a3,20(sp)
   109a8:	01812703          	lw	a4,24(sp)
   109ac:	01c12883          	lw	a7,28(sp)
   109b0:	00e6e5b3          	or	a1,a3,a4
   109b4:	0115e5b3          	or	a1,a1,a7
   109b8:	00f5e5b3          	or	a1,a1,a5
   109bc:	00059e63          	bnez	a1,109d8 <__subtf3+0x5dc>
   109c0:	02812823          	sw	s0,48(sp)
   109c4:	03212a23          	sw	s2,52(sp)
   109c8:	03312c23          	sw	s3,56(sp)
   109cc:	03612e23          	sw	s6,60(sp)
   109d0:	00080493          	mv	s1,a6
   109d4:	c45ff06f          	j	10618 <__subtf3+0x21c>
   109d8:	fff80593          	addi	a1,a6,-1
   109dc:	04059663          	bnez	a1,10a28 <__subtf3+0x62c>
   109e0:	00878433          	add	s0,a5,s0
   109e4:	01268933          	add	s2,a3,s2
   109e8:	02812823          	sw	s0,48(sp)
   109ec:	00f43433          	sltu	s0,s0,a5
   109f0:	00890433          	add	s0,s2,s0
   109f4:	02812a23          	sw	s0,52(sp)
   109f8:	00d936b3          	sltu	a3,s2,a3
   109fc:	01243433          	sltu	s0,s0,s2
   10a00:	013709b3          	add	s3,a4,s3
   10a04:	0086e6b3          	or	a3,a3,s0
   10a08:	00d986b3          	add	a3,s3,a3
   10a0c:	02d12c23          	sw	a3,56(sp)
   10a10:	00e9b7b3          	sltu	a5,s3,a4
   10a14:	0136b6b3          	sltu	a3,a3,s3
   10a18:	00d7e7b3          	or	a5,a5,a3
   10a1c:	016888b3          	add	a7,a7,s6
   10a20:	011787b3          	add	a5,a5,a7
   10a24:	bb9ff06f          	j	105dc <__subtf3+0x1e0>
   10a28:	000087b7          	lui	a5,0x8
   10a2c:	fff78793          	addi	a5,a5,-1 # 7fff <__gdtoa+0x1067>
   10a30:	62f818e3          	bne	a6,a5,11860 <__subtf3+0x1464>
   10a34:	02812823          	sw	s0,48(sp)
   10a38:	03212a23          	sw	s2,52(sp)
   10a3c:	03312c23          	sw	s3,56(sp)
   10a40:	03612e23          	sw	s6,60(sp)
   10a44:	000084b7          	lui	s1,0x8
   10a48:	fff48493          	addi	s1,s1,-1 # 7fff <__gdtoa+0x1067>
   10a4c:	bcdff06f          	j	10618 <__subtf3+0x21c>
   10a50:	00078413          	mv	s0,a5
   10a54:	fe1ff06f          	j	10a34 <__subtf3+0x638>
   10a58:	000087b7          	lui	a5,0x8
   10a5c:	fff78793          	addi	a5,a5,-1 # 7fff <__gdtoa+0x1067>
   10a60:	fcfb8ae3          	beq	s7,a5,10a34 <__subtf3+0x638>
   10a64:	01c12783          	lw	a5,28(sp)
   10a68:	00080737          	lui	a4,0x80
   10a6c:	00e7e7b3          	or	a5,a5,a4
   10a70:	00f12e23          	sw	a5,28(sp)
   10a74:	07400793          	li	a5,116
   10a78:	5f07c8e3          	blt	a5,a6,11868 <__subtf3+0x146c>
   10a7c:	00080593          	mv	a1,a6
   10a80:	02000713          	li	a4,32
   10a84:	02e5c733          	div	a4,a1,a4
   10a88:	00060693          	mv	a3,a2
   10a8c:	00000493          	li	s1,0
   10a90:	00000793          	li	a5,0
   10a94:	02e7ce63          	blt	a5,a4,10ad0 <__subtf3+0x6d4>
   10a98:	00300793          	li	a5,3
   10a9c:	01f5f893          	andi	a7,a1,31
   10aa0:	40e787b3          	sub	a5,a5,a4
   10aa4:	00271813          	slli	a6,a4,0x2
   10aa8:	02089e63          	bnez	a7,10ae4 <__subtf3+0x6e8>
   10aac:	010606b3          	add	a3,a2,a6
   10ab0:	0006a683          	lw	a3,0(a3)
   10ab4:	00188893          	addi	a7,a7,1
   10ab8:	00460613          	addi	a2,a2,4
   10abc:	fed62e23          	sw	a3,-4(a2)
   10ac0:	ff17d6e3          	bge	a5,a7,10aac <__subtf3+0x6b0>
   10ac4:	00400793          	li	a5,4
   10ac8:	40e78733          	sub	a4,a5,a4
   10acc:	0780006f          	j	10b44 <__subtf3+0x748>
   10ad0:	0006a803          	lw	a6,0(a3)
   10ad4:	00178793          	addi	a5,a5,1
   10ad8:	00468693          	addi	a3,a3,4
   10adc:	0104e4b3          	or	s1,s1,a6
   10ae0:	fb5ff06f          	j	10a94 <__subtf3+0x698>
   10ae4:	02000693          	li	a3,32
   10ae8:	02d5e5b3          	rem	a1,a1,a3
   10aec:	40b685b3          	sub	a1,a3,a1
   10af0:	00070693          	mv	a3,a4
   10af4:	00075463          	bgez	a4,10afc <__subtf3+0x700>
   10af8:	00000693          	li	a3,0
   10afc:	00269693          	slli	a3,a3,0x2
   10b00:	04068693          	addi	a3,a3,64
   10b04:	002686b3          	add	a3,a3,sp
   10b08:	fd06a683          	lw	a3,-48(a3)
   10b0c:	00000313          	li	t1,0
   10b10:	00b696b3          	sll	a3,a3,a1
   10b14:	00d4e4b3          	or	s1,s1,a3
   10b18:	010506b3          	add	a3,a0,a6
   10b1c:	41000833          	neg	a6,a6
   10b20:	0af34a63          	blt	t1,a5,10bd4 <__subtf3+0x7d8>
   10b24:	00400693          	li	a3,4
   10b28:	40e68733          	sub	a4,a3,a4
   10b2c:	01c12683          	lw	a3,28(sp)
   10b30:	00279793          	slli	a5,a5,0x2
   10b34:	04078793          	addi	a5,a5,64
   10b38:	002787b3          	add	a5,a5,sp
   10b3c:	0116d6b3          	srl	a3,a3,a7
   10b40:	fcd7a823          	sw	a3,-48(a5)
   10b44:	00572793          	slti	a5,a4,5
   10b48:	00000613          	li	a2,0
   10b4c:	00078863          	beqz	a5,10b5c <__subtf3+0x760>
   10b50:	00400613          	li	a2,4
   10b54:	40e60633          	sub	a2,a2,a4
   10b58:	00261613          	slli	a2,a2,0x2
   10b5c:	00271713          	slli	a4,a4,0x2
   10b60:	00e50533          	add	a0,a0,a4
   10b64:	00000593          	li	a1,0
   10b68:	fa8f50ef          	jal	6310 <memset>
   10b6c:	01012703          	lw	a4,16(sp)
   10b70:	009037b3          	snez	a5,s1
   10b74:	00e7e7b3          	or	a5,a5,a4
   10b78:	01412683          	lw	a3,20(sp)
   10b7c:	00f12823          	sw	a5,16(sp)
   10b80:	00f407b3          	add	a5,s0,a5
   10b84:	01268933          	add	s2,a3,s2
   10b88:	02f12823          	sw	a5,48(sp)
   10b8c:	0087b7b3          	sltu	a5,a5,s0
   10b90:	00f90733          	add	a4,s2,a5
   10b94:	01812783          	lw	a5,24(sp)
   10b98:	02e12a23          	sw	a4,52(sp)
   10b9c:	00d936b3          	sltu	a3,s2,a3
   10ba0:	01273733          	sltu	a4,a4,s2
   10ba4:	013789b3          	add	s3,a5,s3
   10ba8:	00e6e733          	or	a4,a3,a4
   10bac:	00e98733          	add	a4,s3,a4
   10bb0:	02e12c23          	sw	a4,56(sp)
   10bb4:	00f9b7b3          	sltu	a5,s3,a5
   10bb8:	01373733          	sltu	a4,a4,s3
   10bbc:	00e7e7b3          	or	a5,a5,a4
   10bc0:	01c12703          	lw	a4,28(sp)
   10bc4:	000b8493          	mv	s1,s7
   10bc8:	00eb0733          	add	a4,s6,a4
   10bcc:	00e787b3          	add	a5,a5,a4
   10bd0:	d0dff06f          	j	108dc <__subtf3+0x4e0>
   10bd4:	0006a603          	lw	a2,0(a3)
   10bd8:	0046ae03          	lw	t3,4(a3)
   10bdc:	01068eb3          	add	t4,a3,a6
   10be0:	01165633          	srl	a2,a2,a7
   10be4:	00be1e33          	sll	t3,t3,a1
   10be8:	01c66633          	or	a2,a2,t3
   10bec:	00cea023          	sw	a2,0(t4)
   10bf0:	00130313          	addi	t1,t1,1
   10bf4:	00468693          	addi	a3,a3,4
   10bf8:	f29ff06f          	j	10b20 <__subtf3+0x724>
   10bfc:	00148813          	addi	a6,s1,1
   10c00:	01181893          	slli	a7,a6,0x11
   10c04:	0128d893          	srli	a7,a7,0x12
   10c08:	01412683          	lw	a3,20(sp)
   10c0c:	01812703          	lw	a4,24(sp)
   10c10:	01c12603          	lw	a2,28(sp)
   10c14:	03010593          	addi	a1,sp,48
   10c18:	03c10513          	addi	a0,sp,60
   10c1c:	10089e63          	bnez	a7,10d38 <__subtf3+0x93c>
   10c20:	00e6e833          	or	a6,a3,a4
   10c24:	00c86833          	or	a6,a6,a2
   10c28:	00f86833          	or	a6,a6,a5
   10c2c:	0a049863          	bnez	s1,10cdc <__subtf3+0x8e0>
   10c30:	00081e63          	bnez	a6,10c4c <__subtf3+0x850>
   10c34:	02812823          	sw	s0,48(sp)
   10c38:	03212a23          	sw	s2,52(sp)
   10c3c:	03312c23          	sw	s3,56(sp)
   10c40:	03612e23          	sw	s6,60(sp)
   10c44:	00000493          	li	s1,0
   10c48:	9d1ff06f          	j	10618 <__subtf3+0x21c>
   10c4c:	013965b3          	or	a1,s2,s3
   10c50:	0165e5b3          	or	a1,a1,s6
   10c54:	0085e5b3          	or	a1,a1,s0
   10c58:	00059c63          	bnez	a1,10c70 <__subtf3+0x874>
   10c5c:	02f12823          	sw	a5,48(sp)
   10c60:	02d12a23          	sw	a3,52(sp)
   10c64:	02e12c23          	sw	a4,56(sp)
   10c68:	02c12e23          	sw	a2,60(sp)
   10c6c:	9adff06f          	j	10618 <__subtf3+0x21c>
   10c70:	00878433          	add	s0,a5,s0
   10c74:	01268933          	add	s2,a3,s2
   10c78:	02812823          	sw	s0,48(sp)
   10c7c:	00f43433          	sltu	s0,s0,a5
   10c80:	00890433          	add	s0,s2,s0
   10c84:	02812a23          	sw	s0,52(sp)
   10c88:	00d936b3          	sltu	a3,s2,a3
   10c8c:	01243433          	sltu	s0,s0,s2
   10c90:	013709b3          	add	s3,a4,s3
   10c94:	0086e6b3          	or	a3,a3,s0
   10c98:	00d986b3          	add	a3,s3,a3
   10c9c:	02d12c23          	sw	a3,56(sp)
   10ca0:	00e9b733          	sltu	a4,s3,a4
   10ca4:	0136b6b3          	sltu	a3,a3,s3
   10ca8:	00d76733          	or	a4,a4,a3
   10cac:	01660633          	add	a2,a2,s6
   10cb0:	00c70733          	add	a4,a4,a2
   10cb4:	00c71793          	slli	a5,a4,0xc
   10cb8:	0007c663          	bltz	a5,10cc4 <__subtf3+0x8c8>
   10cbc:	02e12e23          	sw	a4,60(sp)
   10cc0:	959ff06f          	j	10618 <__subtf3+0x21c>
   10cc4:	fff807b7          	lui	a5,0xfff80
   10cc8:	fff78793          	addi	a5,a5,-1 # fff7ffff <_memory_end+0xfff5ffff>
   10ccc:	00f77733          	and	a4,a4,a5
   10cd0:	02e12e23          	sw	a4,60(sp)
   10cd4:	00100493          	li	s1,1
   10cd8:	941ff06f          	j	10618 <__subtf3+0x21c>
   10cdc:	1a080463          	beqz	a6,10e84 <__subtf3+0xa88>
   10ce0:	01396933          	or	s2,s2,s3
   10ce4:	01696933          	or	s2,s2,s6
   10ce8:	00896933          	or	s2,s2,s0
   10cec:	1a090063          	beqz	s2,10e8c <__subtf3+0xa90>
   10cf0:	000087b7          	lui	a5,0x8
   10cf4:	02f12e23          	sw	a5,60(sp)
   10cf8:	02012c23          	sw	zero,56(sp)
   10cfc:	02012a23          	sw	zero,52(sp)
   10d00:	02012823          	sw	zero,48(sp)
   10d04:	00050793          	mv	a5,a0
   10d08:	0007a703          	lw	a4,0(a5) # 8000 <__gdtoa+0x1068>
   10d0c:	ffc7a683          	lw	a3,-4(a5)
   10d10:	ffc78793          	addi	a5,a5,-4
   10d14:	00371713          	slli	a4,a4,0x3
   10d18:	01d6d693          	srli	a3,a3,0x1d
   10d1c:	00d76733          	or	a4,a4,a3
   10d20:	00e7a223          	sw	a4,4(a5)
   10d24:	fef592e3          	bne	a1,a5,10d08 <__subtf3+0x90c>
   10d28:	000084b7          	lui	s1,0x8
   10d2c:	fff48493          	addi	s1,s1,-1 # 7fff <__gdtoa+0x1067>
   10d30:	00000a93          	li	s5,0
   10d34:	8e5ff06f          	j	10618 <__subtf3+0x21c>
   10d38:	00878433          	add	s0,a5,s0
   10d3c:	01268933          	add	s2,a3,s2
   10d40:	02812823          	sw	s0,48(sp)
   10d44:	00f43433          	sltu	s0,s0,a5
   10d48:	00890433          	add	s0,s2,s0
   10d4c:	02812a23          	sw	s0,52(sp)
   10d50:	00d936b3          	sltu	a3,s2,a3
   10d54:	01243433          	sltu	s0,s0,s2
   10d58:	013709b3          	add	s3,a4,s3
   10d5c:	0086e6b3          	or	a3,a3,s0
   10d60:	00d986b3          	add	a3,s3,a3
   10d64:	02d12c23          	sw	a3,56(sp)
   10d68:	00e9b733          	sltu	a4,s3,a4
   10d6c:	0136b6b3          	sltu	a3,a3,s3
   10d70:	00d76733          	or	a4,a4,a3
   10d74:	01660633          	add	a2,a2,s6
   10d78:	00c70733          	add	a4,a4,a2
   10d7c:	02e12e23          	sw	a4,60(sp)
   10d80:	00058793          	mv	a5,a1
   10d84:	0007a683          	lw	a3,0(a5)
   10d88:	0047a603          	lw	a2,4(a5)
   10d8c:	00478793          	addi	a5,a5,4
   10d90:	0016d693          	srli	a3,a3,0x1
   10d94:	01f61613          	slli	a2,a2,0x1f
   10d98:	00c6e6b3          	or	a3,a3,a2
   10d9c:	fed7ae23          	sw	a3,-4(a5)
   10da0:	fef512e3          	bne	a0,a5,10d84 <__subtf3+0x988>
   10da4:	000087b7          	lui	a5,0x8
   10da8:	fff78793          	addi	a5,a5,-1 # 7fff <__gdtoa+0x1067>
   10dac:	00f80863          	beq	a6,a5,10dbc <__subtf3+0x9c0>
   10db0:	00175713          	srli	a4,a4,0x1
   10db4:	02e12e23          	sw	a4,60(sp)
   10db8:	c19ff06f          	j	109d0 <__subtf3+0x5d4>
   10dbc:	02012e23          	sw	zero,60(sp)
   10dc0:	02012c23          	sw	zero,56(sp)
   10dc4:	02012a23          	sw	zero,52(sp)
   10dc8:	02012823          	sw	zero,48(sp)
   10dcc:	c05ff06f          	j	109d0 <__subtf3+0x5d4>
   10dd0:	29105c63          	blez	a7,11068 <__subtf3+0xc6c>
   10dd4:	01412903          	lw	s2,20(sp)
   10dd8:	01812983          	lw	s3,24(sp)
   10ddc:	01c12b03          	lw	s6,28(sp)
   10de0:	0a0b9e63          	bnez	s7,10e9c <__subtf3+0xaa0>
   10de4:	02412e03          	lw	t3,36(sp)
   10de8:	02812503          	lw	a0,40(sp)
   10dec:	02c12683          	lw	a3,44(sp)
   10df0:	00ae6733          	or	a4,t3,a0
   10df4:	00d76733          	or	a4,a4,a3
   10df8:	00876733          	or	a4,a4,s0
   10dfc:	f6070e63          	beqz	a4,10578 <__subtf3+0x17c>
   10e00:	fff88e93          	addi	t4,a7,-1
   10e04:	040e9c63          	bnez	t4,10e5c <__subtf3+0xa60>
   10e08:	40878733          	sub	a4,a5,s0
   10e0c:	41c90633          	sub	a2,s2,t3
   10e10:	00e7b5b3          	sltu	a1,a5,a4
   10e14:	00c93833          	sltu	a6,s2,a2
   10e18:	40b60633          	sub	a2,a2,a1
   10e1c:	00000593          	li	a1,0
   10e20:	00e7f663          	bgeu	a5,a4,10e2c <__subtf3+0xa30>
   10e24:	412e0e33          	sub	t3,t3,s2
   10e28:	001e3593          	seqz	a1,t3
   10e2c:	0105e7b3          	or	a5,a1,a6
   10e30:	40a985b3          	sub	a1,s3,a0
   10e34:	00b9b833          	sltu	a6,s3,a1
   10e38:	40f585b3          	sub	a1,a1,a5
   10e3c:	00078663          	beqz	a5,10e48 <__subtf3+0xa4c>
   10e40:	41350533          	sub	a0,a0,s3
   10e44:	00153e93          	seqz	t4,a0
   10e48:	40db07b3          	sub	a5,s6,a3
   10e4c:	010ee6b3          	or	a3,t4,a6
   10e50:	40d787b3          	sub	a5,a5,a3
   10e54:	00100493          	li	s1,1
   10e58:	1bc0006f          	j	11014 <__subtf3+0xc18>
   10e5c:	00008737          	lui	a4,0x8
   10e60:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x1067>
   10e64:	f8e88863          	beq	a7,a4,105f4 <__subtf3+0x1f8>
   10e68:	07400713          	li	a4,116
   10e6c:	05d75c63          	bge	a4,t4,10ec4 <__subtf3+0xac8>
   10e70:	02012623          	sw	zero,44(sp)
   10e74:	02012423          	sw	zero,40(sp)
   10e78:	02012223          	sw	zero,36(sp)
   10e7c:	00100713          	li	a4,1
   10e80:	1340006f          	j	10fb4 <__subtf3+0xbb8>
   10e84:	00040793          	mv	a5,s0
   10e88:	f6cff06f          	j	105f4 <__subtf3+0x1f8>
   10e8c:	00068913          	mv	s2,a3
   10e90:	00070993          	mv	s3,a4
   10e94:	00060b13          	mv	s6,a2
   10e98:	f5cff06f          	j	105f4 <__subtf3+0x1f8>
   10e9c:	00008737          	lui	a4,0x8
   10ea0:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x1067>
   10ea4:	bae486e3          	beq	s1,a4,10a50 <__subtf3+0x654>
   10ea8:	02c12703          	lw	a4,44(sp)
   10eac:	000806b7          	lui	a3,0x80
   10eb0:	00d76733          	or	a4,a4,a3
   10eb4:	02e12623          	sw	a4,44(sp)
   10eb8:	07400713          	li	a4,116
   10ebc:	fb174ae3          	blt	a4,a7,10e70 <__subtf3+0xa74>
   10ec0:	00088e93          	mv	t4,a7
   10ec4:	405ed693          	srai	a3,t4,0x5
   10ec8:	00030593          	mv	a1,t1
   10ecc:	01fefe93          	andi	t4,t4,31
   10ed0:	00000713          	li	a4,0
   10ed4:	00000613          	li	a2,0
   10ed8:	02d61c63          	bne	a2,a3,10f10 <__subtf3+0xb14>
   10edc:	00300613          	li	a2,3
   10ee0:	40d60633          	sub	a2,a2,a3
   10ee4:	00269593          	slli	a1,a3,0x2
   10ee8:	020e9e63          	bnez	t4,10f24 <__subtf3+0xb28>
   10eec:	00b30533          	add	a0,t1,a1
   10ef0:	00052503          	lw	a0,0(a0)
   10ef4:	001e8e93          	addi	t4,t4,1
   10ef8:	00430313          	addi	t1,t1,4
   10efc:	fea32e23          	sw	a0,-4(t1)
   10f00:	ffd656e3          	bge	a2,t4,10eec <__subtf3+0xaf0>
   10f04:	00400613          	li	a2,4
   10f08:	40d606b3          	sub	a3,a2,a3
   10f0c:	0640006f          	j	10f70 <__subtf3+0xb74>
   10f10:	0005a503          	lw	a0,0(a1)
   10f14:	00160613          	addi	a2,a2,1
   10f18:	00458593          	addi	a1,a1,4
   10f1c:	00a76733          	or	a4,a4,a0
   10f20:	fb9ff06f          	j	10ed8 <__subtf3+0xadc>
   10f24:	04058513          	addi	a0,a1,64
   10f28:	00250533          	add	a0,a0,sp
   10f2c:	fe052503          	lw	a0,-32(a0)
   10f30:	02000313          	li	t1,32
   10f34:	41d30333          	sub	t1,t1,t4
   10f38:	00651533          	sll	a0,a0,t1
   10f3c:	00a76733          	or	a4,a4,a0
   10f40:	00000e13          	li	t3,0
   10f44:	00b80533          	add	a0,a6,a1
   10f48:	40b005b3          	neg	a1,a1
   10f4c:	0ece4a63          	blt	t3,a2,11040 <__subtf3+0xc44>
   10f50:	00400593          	li	a1,4
   10f54:	40d586b3          	sub	a3,a1,a3
   10f58:	02c12583          	lw	a1,44(sp)
   10f5c:	00261613          	slli	a2,a2,0x2
   10f60:	04060613          	addi	a2,a2,64
   10f64:	00260633          	add	a2,a2,sp
   10f68:	01d5d5b3          	srl	a1,a1,t4
   10f6c:	feb62023          	sw	a1,-32(a2)
   10f70:	00400613          	li	a2,4
   10f74:	40d60633          	sub	a2,a2,a3
   10f78:	00261613          	slli	a2,a2,0x2
   10f7c:	00269693          	slli	a3,a3,0x2
   10f80:	00800593          	li	a1,8
   10f84:	00d806b3          	add	a3,a6,a3
   10f88:	00b66a63          	bltu	a2,a1,10f9c <__subtf3+0xba0>
   10f8c:	0006a023          	sw	zero,0(a3) # 80000 <_memory_end+0x60000>
   10f90:	0006a223          	sw	zero,4(a3)
   10f94:	ff860613          	addi	a2,a2,-8
   10f98:	00868693          	addi	a3,a3,8
   10f9c:	00400593          	li	a1,4
   10fa0:	00b66463          	bltu	a2,a1,10fa8 <__subtf3+0xbac>
   10fa4:	0006a023          	sw	zero,0(a3)
   10fa8:	02012683          	lw	a3,32(sp)
   10fac:	00e03733          	snez	a4,a4
   10fb0:	00d76733          	or	a4,a4,a3
   10fb4:	02412583          	lw	a1,36(sp)
   10fb8:	02e12023          	sw	a4,32(sp)
   10fbc:	40e78733          	sub	a4,a5,a4
   10fc0:	40b90633          	sub	a2,s2,a1
   10fc4:	00e7b6b3          	sltu	a3,a5,a4
   10fc8:	00c93533          	sltu	a0,s2,a2
   10fcc:	40d60633          	sub	a2,a2,a3
   10fd0:	00000693          	li	a3,0
   10fd4:	00e7f663          	bgeu	a5,a4,10fe0 <__subtf3+0xbe4>
   10fd8:	412585b3          	sub	a1,a1,s2
   10fdc:	0015b693          	seqz	a3,a1
   10fe0:	00a6e7b3          	or	a5,a3,a0
   10fe4:	02812503          	lw	a0,40(sp)
   10fe8:	00000693          	li	a3,0
   10fec:	40a985b3          	sub	a1,s3,a0
   10ff0:	00b9b833          	sltu	a6,s3,a1
   10ff4:	40f585b3          	sub	a1,a1,a5
   10ff8:	00078663          	beqz	a5,11004 <__subtf3+0xc08>
   10ffc:	41350533          	sub	a0,a0,s3
   11000:	00153693          	seqz	a3,a0
   11004:	02c12783          	lw	a5,44(sp)
   11008:	0106e6b3          	or	a3,a3,a6
   1100c:	40fb07b3          	sub	a5,s6,a5
   11010:	40d787b3          	sub	a5,a5,a3
   11014:	02e12823          	sw	a4,48(sp)
   11018:	02f12e23          	sw	a5,60(sp)
   1101c:	02b12c23          	sw	a1,56(sp)
   11020:	02c12a23          	sw	a2,52(sp)
   11024:	00c79713          	slli	a4,a5,0xc
   11028:	de075863          	bgez	a4,10618 <__subtf3+0x21c>
   1102c:	00080737          	lui	a4,0x80
   11030:	fff70713          	addi	a4,a4,-1 # 7ffff <_memory_end+0x5ffff>
   11034:	00e7f7b3          	and	a5,a5,a4
   11038:	02f12e23          	sw	a5,60(sp)
   1103c:	5700006f          	j	115ac <__subtf3+0x11b0>
   11040:	00052883          	lw	a7,0(a0)
   11044:	00452f03          	lw	t5,4(a0)
   11048:	00b50fb3          	add	t6,a0,a1
   1104c:	01d8d8b3          	srl	a7,a7,t4
   11050:	006f1f33          	sll	t5,t5,t1
   11054:	01e8e8b3          	or	a7,a7,t5
   11058:	011fa023          	sw	a7,0(t6)
   1105c:	001e0e13          	addi	t3,t3,1
   11060:	00450513          	addi	a0,a0,4
   11064:	ee9ff06f          	j	10f4c <__subtf3+0xb50>
   11068:	02412c03          	lw	s8,36(sp)
   1106c:	02812b03          	lw	s6,40(sp)
   11070:	02c12983          	lw	s3,44(sp)
   11074:	28088463          	beqz	a7,112fc <__subtf3+0xf00>
   11078:	409b8333          	sub	t1,s7,s1
   1107c:	0a049e63          	bnez	s1,11138 <__subtf3+0xd3c>
   11080:	01412583          	lw	a1,20(sp)
   11084:	01812803          	lw	a6,24(sp)
   11088:	01c12683          	lw	a3,28(sp)
   1108c:	0105e8b3          	or	a7,a1,a6
   11090:	00d8e8b3          	or	a7,a7,a3
   11094:	00f8e8b3          	or	a7,a7,a5
   11098:	02089063          	bnez	a7,110b8 <__subtf3+0xcbc>
   1109c:	02812823          	sw	s0,48(sp)
   110a0:	03812a23          	sw	s8,52(sp)
   110a4:	03612c23          	sw	s6,56(sp)
   110a8:	03312e23          	sw	s3,60(sp)
   110ac:	00030493          	mv	s1,t1
   110b0:	00090a93          	mv	s5,s2
   110b4:	d64ff06f          	j	10618 <__subtf3+0x21c>
   110b8:	fff30893          	addi	a7,t1,-1
   110bc:	04089c63          	bnez	a7,11114 <__subtf3+0xd18>
   110c0:	40f40733          	sub	a4,s0,a5
   110c4:	40bc0633          	sub	a2,s8,a1
   110c8:	00e437b3          	sltu	a5,s0,a4
   110cc:	00cc3533          	sltu	a0,s8,a2
   110d0:	40f60633          	sub	a2,a2,a5
   110d4:	00000793          	li	a5,0
   110d8:	00e47663          	bgeu	s0,a4,110e4 <__subtf3+0xce8>
   110dc:	418585b3          	sub	a1,a1,s8
   110e0:	0015b793          	seqz	a5,a1
   110e4:	00a7e7b3          	or	a5,a5,a0
   110e8:	410b05b3          	sub	a1,s6,a6
   110ec:	00bb3533          	sltu	a0,s6,a1
   110f0:	40f585b3          	sub	a1,a1,a5
   110f4:	00078663          	beqz	a5,11100 <__subtf3+0xd04>
   110f8:	41680833          	sub	a6,a6,s6
   110fc:	00183893          	seqz	a7,a6
   11100:	40d987b3          	sub	a5,s3,a3
   11104:	00a8e6b3          	or	a3,a7,a0
   11108:	40d787b3          	sub	a5,a5,a3
   1110c:	00090a93          	mv	s5,s2
   11110:	d45ff06f          	j	10e54 <__subtf3+0xa58>
   11114:	000087b7          	lui	a5,0x8
   11118:	fff78793          	addi	a5,a5,-1 # 7fff <__gdtoa+0x1067>
   1111c:	76f31063          	bne	t1,a5,1187c <__subtf3+0x1480>
   11120:	02812823          	sw	s0,48(sp)
   11124:	03812a23          	sw	s8,52(sp)
   11128:	03612c23          	sw	s6,56(sp)
   1112c:	03312e23          	sw	s3,60(sp)
   11130:	00090a93          	mv	s5,s2
   11134:	911ff06f          	j	10a44 <__subtf3+0x648>
   11138:	000087b7          	lui	a5,0x8
   1113c:	fff78793          	addi	a5,a5,-1 # 7fff <__gdtoa+0x1067>
   11140:	fefb80e3          	beq	s7,a5,11120 <__subtf3+0xd24>
   11144:	01c12783          	lw	a5,28(sp)
   11148:	00080737          	lui	a4,0x80
   1114c:	00e7e7b3          	or	a5,a5,a4
   11150:	00f12e23          	sw	a5,28(sp)
   11154:	07400793          	li	a5,116
   11158:	1867c863          	blt	a5,t1,112e8 <__subtf3+0xeec>
   1115c:	02000793          	li	a5,32
   11160:	02f347b3          	div	a5,t1,a5
   11164:	00060693          	mv	a3,a2
   11168:	00000493          	li	s1,0
   1116c:	00000713          	li	a4,0
   11170:	02f74e63          	blt	a4,a5,111ac <__subtf3+0xdb0>
   11174:	00300713          	li	a4,3
   11178:	01f37893          	andi	a7,t1,31
   1117c:	40f70e33          	sub	t3,a4,a5
   11180:	00279593          	slli	a1,a5,0x2
   11184:	02089e63          	bnez	a7,111c0 <__subtf3+0xdc4>
   11188:	00b60733          	add	a4,a2,a1
   1118c:	00072703          	lw	a4,0(a4) # 80000 <_memory_end+0x60000>
   11190:	00188893          	addi	a7,a7,1
   11194:	00460613          	addi	a2,a2,4
   11198:	fee62e23          	sw	a4,-4(a2)
   1119c:	ff1e56e3          	bge	t3,a7,11188 <__subtf3+0xd8c>
   111a0:	00400713          	li	a4,4
   111a4:	40f707b3          	sub	a5,a4,a5
   111a8:	0780006f          	j	11220 <__subtf3+0xe24>
   111ac:	0006a583          	lw	a1,0(a3)
   111b0:	00170713          	addi	a4,a4,1
   111b4:	00468693          	addi	a3,a3,4
   111b8:	00b4e4b3          	or	s1,s1,a1
   111bc:	fb5ff06f          	j	11170 <__subtf3+0xd74>
   111c0:	02000613          	li	a2,32
   111c4:	02c36733          	rem	a4,t1,a2
   111c8:	00078693          	mv	a3,a5
   111cc:	40e60633          	sub	a2,a2,a4
   111d0:	0007d463          	bgez	a5,111d8 <__subtf3+0xddc>
   111d4:	00000693          	li	a3,0
   111d8:	00269693          	slli	a3,a3,0x2
   111dc:	04068713          	addi	a4,a3,64
   111e0:	002706b3          	add	a3,a4,sp
   111e4:	fd06a703          	lw	a4,-48(a3)
   111e8:	00b506b3          	add	a3,a0,a1
   111ec:	40b005b3          	neg	a1,a1
   111f0:	00c71733          	sll	a4,a4,a2
   111f4:	00e4e4b3          	or	s1,s1,a4
   111f8:	00000713          	li	a4,0
   111fc:	0dc74263          	blt	a4,t3,112c0 <__subtf3+0xec4>
   11200:	01c12683          	lw	a3,28(sp)
   11204:	00400713          	li	a4,4
   11208:	40f707b3          	sub	a5,a4,a5
   1120c:	002e1713          	slli	a4,t3,0x2
   11210:	04070713          	addi	a4,a4,64
   11214:	00270733          	add	a4,a4,sp
   11218:	0116d6b3          	srl	a3,a3,a7
   1121c:	fcd72823          	sw	a3,-48(a4)
   11220:	0057a713          	slti	a4,a5,5
   11224:	00000613          	li	a2,0
   11228:	00070863          	beqz	a4,11238 <__subtf3+0xe3c>
   1122c:	00400613          	li	a2,4
   11230:	40f60633          	sub	a2,a2,a5
   11234:	00261613          	slli	a2,a2,0x2
   11238:	00279793          	slli	a5,a5,0x2
   1123c:	00f50533          	add	a0,a0,a5
   11240:	00000593          	li	a1,0
   11244:	8ccf50ef          	jal	6310 <memset>
   11248:	01012783          	lw	a5,16(sp)
   1124c:	00903733          	snez	a4,s1
   11250:	00f76733          	or	a4,a4,a5
   11254:	01412683          	lw	a3,20(sp)
   11258:	00e12823          	sw	a4,16(sp)
   1125c:	40e40733          	sub	a4,s0,a4
   11260:	40dc0633          	sub	a2,s8,a3
   11264:	00e437b3          	sltu	a5,s0,a4
   11268:	00cc35b3          	sltu	a1,s8,a2
   1126c:	40f60633          	sub	a2,a2,a5
   11270:	00000793          	li	a5,0
   11274:	00e47663          	bgeu	s0,a4,11280 <__subtf3+0xe84>
   11278:	418686b3          	sub	a3,a3,s8
   1127c:	0016b793          	seqz	a5,a3
   11280:	01812503          	lw	a0,24(sp)
   11284:	00b7e7b3          	or	a5,a5,a1
   11288:	00000693          	li	a3,0
   1128c:	40ab05b3          	sub	a1,s6,a0
   11290:	00bb3833          	sltu	a6,s6,a1
   11294:	40f585b3          	sub	a1,a1,a5
   11298:	00078663          	beqz	a5,112a4 <__subtf3+0xea8>
   1129c:	41650533          	sub	a0,a0,s6
   112a0:	00153693          	seqz	a3,a0
   112a4:	01c12783          	lw	a5,28(sp)
   112a8:	0106e6b3          	or	a3,a3,a6
   112ac:	000b8493          	mv	s1,s7
   112b0:	40f987b3          	sub	a5,s3,a5
   112b4:	40d787b3          	sub	a5,a5,a3
   112b8:	00090a93          	mv	s5,s2
   112bc:	d59ff06f          	j	11014 <__subtf3+0xc18>
   112c0:	0006a803          	lw	a6,0(a3)
   112c4:	0046a303          	lw	t1,4(a3)
   112c8:	00b68eb3          	add	t4,a3,a1
   112cc:	01185833          	srl	a6,a6,a7
   112d0:	00c31333          	sll	t1,t1,a2
   112d4:	00686833          	or	a6,a6,t1
   112d8:	010ea023          	sw	a6,0(t4)
   112dc:	00170713          	addi	a4,a4,1
   112e0:	00468693          	addi	a3,a3,4
   112e4:	f19ff06f          	j	111fc <__subtf3+0xe00>
   112e8:	00012e23          	sw	zero,28(sp)
   112ec:	00012c23          	sw	zero,24(sp)
   112f0:	00012a23          	sw	zero,20(sp)
   112f4:	00100713          	li	a4,1
   112f8:	f5dff06f          	j	11254 <__subtf3+0xe58>
   112fc:	00148593          	addi	a1,s1,1
   11300:	01159513          	slli	a0,a1,0x11
   11304:	01255513          	srli	a0,a0,0x12
   11308:	01412683          	lw	a3,20(sp)
   1130c:	01812603          	lw	a2,24(sp)
   11310:	01c12703          	lw	a4,28(sp)
   11314:	00008837          	lui	a6,0x8
   11318:	1c051e63          	bnez	a0,114f4 <__subtf3+0x10f8>
   1131c:	016c6533          	or	a0,s8,s6
   11320:	00c6e5b3          	or	a1,a3,a2
   11324:	01356533          	or	a0,a0,s3
   11328:	00e5e5b3          	or	a1,a1,a4
   1132c:	00856533          	or	a0,a0,s0
   11330:	00f5e5b3          	or	a1,a1,a5
   11334:	10049863          	bnez	s1,11444 <__subtf3+0x1048>
   11338:	02059263          	bnez	a1,1135c <__subtf3+0xf60>
   1133c:	02812823          	sw	s0,48(sp)
   11340:	03812a23          	sw	s8,52(sp)
   11344:	03612c23          	sw	s6,56(sp)
   11348:	03312e23          	sw	s3,60(sp)
   1134c:	00090a93          	mv	s5,s2
   11350:	ac051463          	bnez	a0,10618 <__subtf3+0x21c>
   11354:	00000493          	li	s1,0
   11358:	9d9ff06f          	j	10d30 <__subtf3+0x934>
   1135c:	00051c63          	bnez	a0,11374 <__subtf3+0xf78>
   11360:	02f12823          	sw	a5,48(sp)
   11364:	02d12a23          	sw	a3,52(sp)
   11368:	02c12c23          	sw	a2,56(sp)
   1136c:	02e12e23          	sw	a4,60(sp)
   11370:	8d5ff06f          	j	10c44 <__subtf3+0x848>
   11374:	40878533          	sub	a0,a5,s0
   11378:	41868e33          	sub	t3,a3,s8
   1137c:	00a7b833          	sltu	a6,a5,a0
   11380:	01c6b8b3          	sltu	a7,a3,t3
   11384:	410e0833          	sub	a6,t3,a6
   11388:	00000593          	li	a1,0
   1138c:	00a7f463          	bgeu	a5,a0,11394 <__subtf3+0xf98>
   11390:	001e3593          	seqz	a1,t3
   11394:	0115e5b3          	or	a1,a1,a7
   11398:	416608b3          	sub	a7,a2,s6
   1139c:	01163f33          	sltu	t5,a2,a7
   113a0:	40b88eb3          	sub	t4,a7,a1
   113a4:	00000313          	li	t1,0
   113a8:	00058463          	beqz	a1,113b0 <__subtf3+0xfb4>
   113ac:	0018b313          	seqz	t1,a7
   113b0:	01e36333          	or	t1,t1,t5
   113b4:	413705b3          	sub	a1,a4,s3
   113b8:	406585b3          	sub	a1,a1,t1
   113bc:	02b12e23          	sw	a1,60(sp)
   113c0:	03d12c23          	sw	t4,56(sp)
   113c4:	03012a23          	sw	a6,52(sp)
   113c8:	02a12823          	sw	a0,48(sp)
   113cc:	00c59313          	slli	t1,a1,0xc
   113d0:	06035063          	bgez	t1,11430 <__subtf3+0x1034>
   113d4:	40f407b3          	sub	a5,s0,a5
   113d8:	40dc06b3          	sub	a3,s8,a3
   113dc:	00f435b3          	sltu	a1,s0,a5
   113e0:	00dc3c33          	sltu	s8,s8,a3
   113e4:	40b686b3          	sub	a3,a3,a1
   113e8:	00000593          	li	a1,0
   113ec:	00f47463          	bgeu	s0,a5,113f4 <__subtf3+0xff8>
   113f0:	001e3593          	seqz	a1,t3
   113f4:	40cb0633          	sub	a2,s6,a2
   113f8:	0185ec33          	or	s8,a1,s8
   113fc:	00cb3b33          	sltu	s6,s6,a2
   11400:	00000513          	li	a0,0
   11404:	41860633          	sub	a2,a2,s8
   11408:	000c0463          	beqz	s8,11410 <__subtf3+0x1014>
   1140c:	0018b513          	seqz	a0,a7
   11410:	40e98733          	sub	a4,s3,a4
   11414:	01656533          	or	a0,a0,s6
   11418:	40a70733          	sub	a4,a4,a0
   1141c:	02e12e23          	sw	a4,60(sp)
   11420:	02c12c23          	sw	a2,56(sp)
   11424:	02d12a23          	sw	a3,52(sp)
   11428:	02f12823          	sw	a5,48(sp)
   1142c:	c85ff06f          	j	110b0 <__subtf3+0xcb4>
   11430:	01056533          	or	a0,a0,a6
   11434:	01d56533          	or	a0,a0,t4
   11438:	00b56533          	or	a0,a0,a1
   1143c:	f0050ce3          	beqz	a0,11354 <__subtf3+0xf58>
   11440:	805ff06f          	j	10c44 <__subtf3+0x848>
   11444:	03010893          	addi	a7,sp,48
   11448:	04059e63          	bnez	a1,114a4 <__subtf3+0x10a8>
   1144c:	02051e63          	bnez	a0,11488 <__subtf3+0x108c>
   11450:	03012e23          	sw	a6,60(sp)
   11454:	02012c23          	sw	zero,56(sp)
   11458:	02012a23          	sw	zero,52(sp)
   1145c:	02012823          	sw	zero,48(sp)
   11460:	03c10793          	addi	a5,sp,60
   11464:	0007a703          	lw	a4,0(a5)
   11468:	ffc7a683          	lw	a3,-4(a5)
   1146c:	ffc78793          	addi	a5,a5,-4
   11470:	00371713          	slli	a4,a4,0x3
   11474:	01d6d693          	srli	a3,a3,0x1d
   11478:	00d76733          	or	a4,a4,a3
   1147c:	00e7a223          	sw	a4,4(a5)
   11480:	fef892e3          	bne	a7,a5,11464 <__subtf3+0x1068>
   11484:	8a5ff06f          	j	10d28 <__subtf3+0x92c>
   11488:	02812823          	sw	s0,48(sp)
   1148c:	03812a23          	sw	s8,52(sp)
   11490:	03612c23          	sw	s6,56(sp)
   11494:	03312e23          	sw	s3,60(sp)
   11498:	00090a93          	mv	s5,s2
   1149c:	fff80493          	addi	s1,a6,-1 # 7fff <__gdtoa+0x1067>
   114a0:	978ff06f          	j	10618 <__subtf3+0x21c>
   114a4:	00051c63          	bnez	a0,114bc <__subtf3+0x10c0>
   114a8:	02f12823          	sw	a5,48(sp)
   114ac:	02d12a23          	sw	a3,52(sp)
   114b0:	02c12c23          	sw	a2,56(sp)
   114b4:	02e12e23          	sw	a4,60(sp)
   114b8:	fe5ff06f          	j	1149c <__subtf3+0x10a0>
   114bc:	03012e23          	sw	a6,60(sp)
   114c0:	02012c23          	sw	zero,56(sp)
   114c4:	02012a23          	sw	zero,52(sp)
   114c8:	02012823          	sw	zero,48(sp)
   114cc:	03c10793          	addi	a5,sp,60
   114d0:	0007a703          	lw	a4,0(a5)
   114d4:	ffc7a683          	lw	a3,-4(a5)
   114d8:	ffc78793          	addi	a5,a5,-4
   114dc:	00371713          	slli	a4,a4,0x3
   114e0:	01d6d693          	srli	a3,a3,0x1d
   114e4:	00d76733          	or	a4,a4,a3
   114e8:	00e7a223          	sw	a4,4(a5)
   114ec:	fef892e3          	bne	a7,a5,114d0 <__subtf3+0x10d4>
   114f0:	839ff06f          	j	10d28 <__subtf3+0x92c>
   114f4:	40878533          	sub	a0,a5,s0
   114f8:	41868eb3          	sub	t4,a3,s8
   114fc:	00a7b833          	sltu	a6,a5,a0
   11500:	01d6b333          	sltu	t1,a3,t4
   11504:	410e8833          	sub	a6,t4,a6
   11508:	00000593          	li	a1,0
   1150c:	00a7f463          	bgeu	a5,a0,11514 <__subtf3+0x1118>
   11510:	001eb593          	seqz	a1,t4
   11514:	0065e5b3          	or	a1,a1,t1
   11518:	41660333          	sub	t1,a2,s6
   1151c:	00663fb3          	sltu	t6,a2,t1
   11520:	40b30f33          	sub	t5,t1,a1
   11524:	00000e13          	li	t3,0
   11528:	00058463          	beqz	a1,11530 <__subtf3+0x1134>
   1152c:	00133e13          	seqz	t3,t1
   11530:	01fe6e33          	or	t3,t3,t6
   11534:	413705b3          	sub	a1,a4,s3
   11538:	41c585b3          	sub	a1,a1,t3
   1153c:	02b12e23          	sw	a1,60(sp)
   11540:	03e12c23          	sw	t5,56(sp)
   11544:	03012a23          	sw	a6,52(sp)
   11548:	02a12823          	sw	a0,48(sp)
   1154c:	00c59e13          	slli	t3,a1,0xc
   11550:	140e5663          	bgez	t3,1169c <__subtf3+0x12a0>
   11554:	40f407b3          	sub	a5,s0,a5
   11558:	40dc06b3          	sub	a3,s8,a3
   1155c:	00f435b3          	sltu	a1,s0,a5
   11560:	00dc3c33          	sltu	s8,s8,a3
   11564:	40b686b3          	sub	a3,a3,a1
   11568:	00000593          	li	a1,0
   1156c:	00f47463          	bgeu	s0,a5,11574 <__subtf3+0x1178>
   11570:	001eb593          	seqz	a1,t4
   11574:	40cb0633          	sub	a2,s6,a2
   11578:	0185ec33          	or	s8,a1,s8
   1157c:	00cb3b33          	sltu	s6,s6,a2
   11580:	41860633          	sub	a2,a2,s8
   11584:	000c0463          	beqz	s8,1158c <__subtf3+0x1190>
   11588:	00133893          	seqz	a7,t1
   1158c:	40e985b3          	sub	a1,s3,a4
   11590:	0168e733          	or	a4,a7,s6
   11594:	40e58733          	sub	a4,a1,a4
   11598:	02e12e23          	sw	a4,60(sp)
   1159c:	02c12c23          	sw	a2,56(sp)
   115a0:	02d12a23          	sw	a3,52(sp)
   115a4:	02f12823          	sw	a5,48(sp)
   115a8:	00090a93          	mv	s5,s2
   115ac:	03c12503          	lw	a0,60(sp)
   115b0:	10050063          	beqz	a0,116b0 <__subtf3+0x12b4>
   115b4:	30c010ef          	jal	128c0 <__clzsi2>
   115b8:	ff450513          	addi	a0,a0,-12
   115bc:	02000713          	li	a4,32
   115c0:	01f57813          	andi	a6,a0,31
   115c4:	02e547b3          	div	a5,a0,a4
   115c8:	12080063          	beqz	a6,116e8 <__subtf3+0x12ec>
   115cc:	03010313          	addi	t1,sp,48
   115d0:	02e566b3          	rem	a3,a0,a4
   115d4:	40d70633          	sub	a2,a4,a3
   115d8:	ffc00693          	li	a3,-4
   115dc:	02d786b3          	mul	a3,a5,a3
   115e0:	00c68713          	addi	a4,a3,12
   115e4:	00e30733          	add	a4,t1,a4
   115e8:	40d006b3          	neg	a3,a3
   115ec:	12e31663          	bne	t1,a4,11718 <__subtf3+0x131c>
   115f0:	03012683          	lw	a3,48(sp)
   115f4:	fff78713          	addi	a4,a5,-1
   115f8:	00279793          	slli	a5,a5,0x2
   115fc:	04078793          	addi	a5,a5,64
   11600:	002787b3          	add	a5,a5,sp
   11604:	010696b3          	sll	a3,a3,a6
   11608:	fed7a823          	sw	a3,-16(a5)
   1160c:	00170713          	addi	a4,a4,1
   11610:	03010793          	addi	a5,sp,48
   11614:	00271713          	slli	a4,a4,0x2
   11618:	00800693          	li	a3,8
   1161c:	00078893          	mv	a7,a5
   11620:	00d76a63          	bltu	a4,a3,11634 <__subtf3+0x1238>
   11624:	02012823          	sw	zero,48(sp)
   11628:	0007a223          	sw	zero,4(a5)
   1162c:	ff870713          	addi	a4,a4,-8
   11630:	03810793          	addi	a5,sp,56
   11634:	00400693          	li	a3,4
   11638:	00d76463          	bltu	a4,a3,11640 <__subtf3+0x1244>
   1163c:	0007a023          	sw	zero,0(a5)
   11640:	1c954863          	blt	a0,s1,11810 <__subtf3+0x1414>
   11644:	40950533          	sub	a0,a0,s1
   11648:	00150513          	addi	a0,a0,1
   1164c:	40555713          	srai	a4,a0,0x5
   11650:	01f57793          	andi	a5,a0,31
   11654:	00088593          	mv	a1,a7
   11658:	00088613          	mv	a2,a7
   1165c:	00000313          	li	t1,0
   11660:	00000693          	li	a3,0
   11664:	0ce69c63          	bne	a3,a4,1173c <__subtf3+0x1340>
   11668:	00300693          	li	a3,3
   1166c:	40e686b3          	sub	a3,a3,a4
   11670:	00271613          	slli	a2,a4,0x2
   11674:	0c079e63          	bnez	a5,11750 <__subtf3+0x1354>
   11678:	00c58533          	add	a0,a1,a2
   1167c:	00052503          	lw	a0,0(a0)
   11680:	00178793          	addi	a5,a5,1
   11684:	00458593          	addi	a1,a1,4
   11688:	fea5ae23          	sw	a0,-4(a1)
   1168c:	fef6d6e3          	bge	a3,a5,11678 <__subtf3+0x127c>
   11690:	00400793          	li	a5,4
   11694:	40e78733          	sub	a4,a5,a4
   11698:	1040006f          	j	1179c <__subtf3+0x13a0>
   1169c:	01056533          	or	a0,a0,a6
   116a0:	01e56533          	or	a0,a0,t5
   116a4:	00b56533          	or	a0,a0,a1
   116a8:	ca0506e3          	beqz	a0,11354 <__subtf3+0xf58>
   116ac:	f01ff06f          	j	115ac <__subtf3+0x11b0>
   116b0:	03812503          	lw	a0,56(sp)
   116b4:	00050863          	beqz	a0,116c4 <__subtf3+0x12c8>
   116b8:	208010ef          	jal	128c0 <__clzsi2>
   116bc:	02050513          	addi	a0,a0,32
   116c0:	ef9ff06f          	j	115b8 <__subtf3+0x11bc>
   116c4:	03412503          	lw	a0,52(sp)
   116c8:	00050863          	beqz	a0,116d8 <__subtf3+0x12dc>
   116cc:	1f4010ef          	jal	128c0 <__clzsi2>
   116d0:	04050513          	addi	a0,a0,64
   116d4:	ee5ff06f          	j	115b8 <__subtf3+0x11bc>
   116d8:	03012503          	lw	a0,48(sp)
   116dc:	1e4010ef          	jal	128c0 <__clzsi2>
   116e0:	06050513          	addi	a0,a0,96
   116e4:	ed5ff06f          	j	115b8 <__subtf3+0x11bc>
   116e8:	ffc00613          	li	a2,-4
   116ec:	02c78633          	mul	a2,a5,a2
   116f0:	03c10713          	addi	a4,sp,60
   116f4:	00300693          	li	a3,3
   116f8:	00c705b3          	add	a1,a4,a2
   116fc:	0005a583          	lw	a1,0(a1)
   11700:	fff68693          	addi	a3,a3,-1
   11704:	ffc70713          	addi	a4,a4,-4
   11708:	00b72223          	sw	a1,4(a4)
   1170c:	fef6d6e3          	bge	a3,a5,116f8 <__subtf3+0x12fc>
   11710:	fff78713          	addi	a4,a5,-1
   11714:	ef9ff06f          	j	1160c <__subtf3+0x1210>
   11718:	00072583          	lw	a1,0(a4)
   1171c:	ffc72883          	lw	a7,-4(a4)
   11720:	00d70e33          	add	t3,a4,a3
   11724:	010595b3          	sll	a1,a1,a6
   11728:	00c8d8b3          	srl	a7,a7,a2
   1172c:	0115e5b3          	or	a1,a1,a7
   11730:	00be2023          	sw	a1,0(t3)
   11734:	ffc70713          	addi	a4,a4,-4
   11738:	eb5ff06f          	j	115ec <__subtf3+0x11f0>
   1173c:	00062503          	lw	a0,0(a2)
   11740:	00168693          	addi	a3,a3,1
   11744:	00460613          	addi	a2,a2,4
   11748:	00a36333          	or	t1,t1,a0
   1174c:	f19ff06f          	j	11664 <__subtf3+0x1268>
   11750:	04060593          	addi	a1,a2,64
   11754:	002585b3          	add	a1,a1,sp
   11758:	ff05a583          	lw	a1,-16(a1)
   1175c:	02000813          	li	a6,32
   11760:	40f80833          	sub	a6,a6,a5
   11764:	010595b3          	sll	a1,a1,a6
   11768:	00b36333          	or	t1,t1,a1
   1176c:	00000e13          	li	t3,0
   11770:	00c885b3          	add	a1,a7,a2
   11774:	40c00633          	neg	a2,a2
   11778:	06de4863          	blt	t3,a3,117e8 <__subtf3+0x13ec>
   1177c:	00400613          	li	a2,4
   11780:	40e60733          	sub	a4,a2,a4
   11784:	03c12603          	lw	a2,60(sp)
   11788:	00269693          	slli	a3,a3,0x2
   1178c:	04068693          	addi	a3,a3,64
   11790:	002686b3          	add	a3,a3,sp
   11794:	00f657b3          	srl	a5,a2,a5
   11798:	fef6a823          	sw	a5,-16(a3)
   1179c:	00400693          	li	a3,4
   117a0:	40e686b3          	sub	a3,a3,a4
   117a4:	00271713          	slli	a4,a4,0x2
   117a8:	00e887b3          	add	a5,a7,a4
   117ac:	00269713          	slli	a4,a3,0x2
   117b0:	00800693          	li	a3,8
   117b4:	00d76a63          	bltu	a4,a3,117c8 <__subtf3+0x13cc>
   117b8:	0007a023          	sw	zero,0(a5)
   117bc:	0007a223          	sw	zero,4(a5)
   117c0:	ff870713          	addi	a4,a4,-8
   117c4:	00878793          	addi	a5,a5,8
   117c8:	00400693          	li	a3,4
   117cc:	00d76463          	bltu	a4,a3,117d4 <__subtf3+0x13d8>
   117d0:	0007a023          	sw	zero,0(a5)
   117d4:	03012703          	lw	a4,48(sp)
   117d8:	006037b3          	snez	a5,t1
   117dc:	00f767b3          	or	a5,a4,a5
   117e0:	02f12823          	sw	a5,48(sp)
   117e4:	c60ff06f          	j	10c44 <__subtf3+0x848>
   117e8:	0005a503          	lw	a0,0(a1)
   117ec:	0045ae83          	lw	t4,4(a1)
   117f0:	00c58f33          	add	t5,a1,a2
   117f4:	00f55533          	srl	a0,a0,a5
   117f8:	010e9eb3          	sll	t4,t4,a6
   117fc:	01d56533          	or	a0,a0,t4
   11800:	00af2023          	sw	a0,0(t5)
   11804:	001e0e13          	addi	t3,t3,1
   11808:	00458593          	addi	a1,a1,4
   1180c:	f6dff06f          	j	11778 <__subtf3+0x137c>
   11810:	03c12783          	lw	a5,60(sp)
   11814:	fff80737          	lui	a4,0xfff80
   11818:	fff70713          	addi	a4,a4,-1 # fff7ffff <_memory_end+0xfff5ffff>
   1181c:	00e7f7b3          	and	a5,a5,a4
   11820:	40a484b3          	sub	s1,s1,a0
   11824:	02f12e23          	sw	a5,60(sp)
   11828:	df1fe06f          	j	10618 <__subtf3+0x21c>
   1182c:	02012e23          	sw	zero,60(sp)
   11830:	02012c23          	sw	zero,56(sp)
   11834:	02012a23          	sw	zero,52(sp)
   11838:	02012823          	sw	zero,48(sp)
   1183c:	e5dfe06f          	j	10698 <__subtf3+0x29c>
   11840:	07400713          	li	a4,116
   11844:	00c74463          	blt	a4,a2,1184c <__subtf3+0x1450>
   11848:	f51fe06f          	j	10798 <__subtf3+0x39c>
   1184c:	02012623          	sw	zero,44(sp)
   11850:	02012423          	sw	zero,40(sp)
   11854:	02012223          	sw	zero,36(sp)
   11858:	00100713          	li	a4,1
   1185c:	82cff06f          	j	10888 <__subtf3+0x48c>
   11860:	07400793          	li	a5,116
   11864:	a0b7de63          	bge	a5,a1,10a80 <__subtf3+0x684>
   11868:	00012e23          	sw	zero,28(sp)
   1186c:	00012c23          	sw	zero,24(sp)
   11870:	00012a23          	sw	zero,20(sp)
   11874:	00100793          	li	a5,1
   11878:	b00ff06f          	j	10b78 <__subtf3+0x77c>
   1187c:	07400793          	li	a5,116
   11880:	a717c4e3          	blt	a5,a7,112e8 <__subtf3+0xeec>
   11884:	00088313          	mv	t1,a7
   11888:	8d5ff06f          	j	1115c <__subtf3+0xd60>

0001188c <__unordtf2>:
   1188c:	00052703          	lw	a4,0(a0)
   11890:	00452e83          	lw	t4,4(a0)
   11894:	00852e03          	lw	t3,8(a0)
   11898:	00c52503          	lw	a0,12(a0)
   1189c:	00c5a603          	lw	a2,12(a1)
   118a0:	000086b7          	lui	a3,0x8
   118a4:	fff68693          	addi	a3,a3,-1 # 7fff <__gdtoa+0x1067>
   118a8:	01055813          	srli	a6,a0,0x10
   118ac:	0005a783          	lw	a5,0(a1)
   118b0:	0045a303          	lw	t1,4(a1)
   118b4:	0085a883          	lw	a7,8(a1)
   118b8:	00d87833          	and	a6,a6,a3
   118bc:	01065593          	srli	a1,a2,0x10
   118c0:	ff010113          	addi	sp,sp,-16
   118c4:	00d5f5b3          	and	a1,a1,a3
   118c8:	02d81063          	bne	a6,a3,118e8 <__unordtf2+0x5c>
   118cc:	01d76733          	or	a4,a4,t4
   118d0:	01051513          	slli	a0,a0,0x10
   118d4:	01055513          	srli	a0,a0,0x10
   118d8:	01c76733          	or	a4,a4,t3
   118dc:	00a76733          	or	a4,a4,a0
   118e0:	00100513          	li	a0,1
   118e4:	02071663          	bnez	a4,11910 <__unordtf2+0x84>
   118e8:	00008737          	lui	a4,0x8
   118ec:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x1067>
   118f0:	00000513          	li	a0,0
   118f4:	00e59e63          	bne	a1,a4,11910 <__unordtf2+0x84>
   118f8:	0067e533          	or	a0,a5,t1
   118fc:	01061613          	slli	a2,a2,0x10
   11900:	01156533          	or	a0,a0,a7
   11904:	01065613          	srli	a2,a2,0x10
   11908:	00c56533          	or	a0,a0,a2
   1190c:	00a03533          	snez	a0,a0
   11910:	01010113          	addi	sp,sp,16
   11914:	00008067          	ret

00011918 <__fixtfsi>:
   11918:	00052703          	lw	a4,0(a0)
   1191c:	00452683          	lw	a3,4(a0)
   11920:	00c52783          	lw	a5,12(a0)
   11924:	00852583          	lw	a1,8(a0)
   11928:	fe010113          	addi	sp,sp,-32
   1192c:	00e12023          	sw	a4,0(sp)
   11930:	00d12223          	sw	a3,4(sp)
   11934:	00e12823          	sw	a4,16(sp)
   11938:	00179693          	slli	a3,a5,0x1
   1193c:	00004737          	lui	a4,0x4
   11940:	00b12423          	sw	a1,8(sp)
   11944:	00f12623          	sw	a5,12(sp)
   11948:	00b12c23          	sw	a1,24(sp)
   1194c:	0116d693          	srli	a3,a3,0x11
   11950:	ffe70713          	addi	a4,a4,-2 # 3ffe <_vfprintf_r+0x1aee>
   11954:	00000513          	li	a0,0
   11958:	02d75063          	bge	a4,a3,11978 <__fixtfsi+0x60>
   1195c:	00004737          	lui	a4,0x4
   11960:	01d70713          	addi	a4,a4,29 # 401d <_vfprintf_r+0x1b0d>
   11964:	01f7d813          	srli	a6,a5,0x1f
   11968:	00d75c63          	bge	a4,a3,11980 <__fixtfsi+0x68>
   1196c:	80000537          	lui	a0,0x80000
   11970:	fff50513          	addi	a0,a0,-1 # 7fffffff <_memory_end+0x7ffdffff>
   11974:	00a80533          	add	a0,a6,a0
   11978:	02010113          	addi	sp,sp,32
   1197c:	00008067          	ret
   11980:	01079793          	slli	a5,a5,0x10
   11984:	00010737          	lui	a4,0x10
   11988:	0107d793          	srli	a5,a5,0x10
   1198c:	00e7e7b3          	or	a5,a5,a4
   11990:	00004737          	lui	a4,0x4
   11994:	06f70713          	addi	a4,a4,111 # 406f <_vfprintf_r+0x1b5f>
   11998:	40d70733          	sub	a4,a4,a3
   1199c:	40575613          	srai	a2,a4,0x5
   119a0:	00f12e23          	sw	a5,28(sp)
   119a4:	01f77713          	andi	a4,a4,31
   119a8:	02071463          	bnez	a4,119d0 <__fixtfsi+0xb8>
   119ac:	00261613          	slli	a2,a2,0x2
   119b0:	02060793          	addi	a5,a2,32
   119b4:	00278633          	add	a2,a5,sp
   119b8:	ff062783          	lw	a5,-16(a2)
   119bc:	00f12823          	sw	a5,16(sp)
   119c0:	01012503          	lw	a0,16(sp)
   119c4:	fa080ae3          	beqz	a6,11978 <__fixtfsi+0x60>
   119c8:	40a00533          	neg	a0,a0
   119cc:	fadff06f          	j	11978 <__fixtfsi+0x60>
   119d0:	00200513          	li	a0,2
   119d4:	00000693          	li	a3,0
   119d8:	02a61063          	bne	a2,a0,119f8 <__fixtfsi+0xe0>
   119dc:	02000693          	li	a3,32
   119e0:	40e686b3          	sub	a3,a3,a4
   119e4:	00d796b3          	sll	a3,a5,a3
   119e8:	00e5d5b3          	srl	a1,a1,a4
   119ec:	00b6e6b3          	or	a3,a3,a1
   119f0:	00d12823          	sw	a3,16(sp)
   119f4:	00100693          	li	a3,1
   119f8:	00269693          	slli	a3,a3,0x2
   119fc:	02068693          	addi	a3,a3,32
   11a00:	002686b3          	add	a3,a3,sp
   11a04:	00e7d7b3          	srl	a5,a5,a4
   11a08:	fef6a823          	sw	a5,-16(a3)
   11a0c:	fb5ff06f          	j	119c0 <__fixtfsi+0xa8>

00011a10 <__floatsitf>:
   11a10:	fd010113          	addi	sp,sp,-48
   11a14:	02912223          	sw	s1,36(sp)
   11a18:	02112623          	sw	ra,44(sp)
   11a1c:	02812423          	sw	s0,40(sp)
   11a20:	03212023          	sw	s2,32(sp)
   11a24:	00050493          	mv	s1,a0
   11a28:	12058263          	beqz	a1,11b4c <__floatsitf+0x13c>
   11a2c:	41f5d793          	srai	a5,a1,0x1f
   11a30:	00b7c433          	xor	s0,a5,a1
   11a34:	40f40433          	sub	s0,s0,a5
   11a38:	00040513          	mv	a0,s0
   11a3c:	01f5d913          	srli	s2,a1,0x1f
   11a40:	681000ef          	jal	128c0 <__clzsi2>
   11a44:	00004737          	lui	a4,0x4
   11a48:	01e70713          	addi	a4,a4,30 # 401e <_vfprintf_r+0x1b0e>
   11a4c:	05150793          	addi	a5,a0,81
   11a50:	40a70633          	sub	a2,a4,a0
   11a54:	00812823          	sw	s0,16(sp)
   11a58:	4057d713          	srai	a4,a5,0x5
   11a5c:	00012a23          	sw	zero,20(sp)
   11a60:	00012c23          	sw	zero,24(sp)
   11a64:	00012e23          	sw	zero,28(sp)
   11a68:	01f7f793          	andi	a5,a5,31
   11a6c:	02078c63          	beqz	a5,11aa4 <__floatsitf+0x94>
   11a70:	00200693          	li	a3,2
   11a74:	0cd71863          	bne	a4,a3,11b44 <__floatsitf+0x134>
   11a78:	02000693          	li	a3,32
   11a7c:	40f686b3          	sub	a3,a3,a5
   11a80:	00d456b3          	srl	a3,s0,a3
   11a84:	00d12e23          	sw	a3,28(sp)
   11a88:	fff70693          	addi	a3,a4,-1
   11a8c:	00271713          	slli	a4,a4,0x2
   11a90:	02070713          	addi	a4,a4,32
   11a94:	00270733          	add	a4,a4,sp
   11a98:	00f41433          	sll	s0,s0,a5
   11a9c:	fe872823          	sw	s0,-16(a4)
   11aa0:	0340006f          	j	11ad4 <__floatsitf+0xc4>
   11aa4:	00300793          	li	a5,3
   11aa8:	40e787b3          	sub	a5,a5,a4
   11aac:	00279793          	slli	a5,a5,0x2
   11ab0:	02078793          	addi	a5,a5,32
   11ab4:	002787b3          	add	a5,a5,sp
   11ab8:	ff07a783          	lw	a5,-16(a5)
   11abc:	00200693          	li	a3,2
   11ac0:	00f12e23          	sw	a5,28(sp)
   11ac4:	00200793          	li	a5,2
   11ac8:	00f71663          	bne	a4,a5,11ad4 <__floatsitf+0xc4>
   11acc:	00812c23          	sw	s0,24(sp)
   11ad0:	00100693          	li	a3,1
   11ad4:	00269693          	slli	a3,a3,0x2
   11ad8:	00012823          	sw	zero,16(sp)
   11adc:	00012a23          	sw	zero,20(sp)
   11ae0:	ffc68693          	addi	a3,a3,-4
   11ae4:	00400793          	li	a5,4
   11ae8:	00f6e463          	bltu	a3,a5,11af0 <__floatsitf+0xe0>
   11aec:	00012c23          	sw	zero,24(sp)
   11af0:	00090593          	mv	a1,s2
   11af4:	01c12783          	lw	a5,28(sp)
   11af8:	00f59413          	slli	s0,a1,0xf
   11afc:	00c46433          	or	s0,s0,a2
   11b00:	00f11623          	sh	a5,12(sp)
   11b04:	01012783          	lw	a5,16(sp)
   11b08:	00811723          	sh	s0,14(sp)
   11b0c:	02c12083          	lw	ra,44(sp)
   11b10:	00f4a023          	sw	a5,0(s1)
   11b14:	01412783          	lw	a5,20(sp)
   11b18:	02812403          	lw	s0,40(sp)
   11b1c:	02012903          	lw	s2,32(sp)
   11b20:	00f4a223          	sw	a5,4(s1)
   11b24:	01812783          	lw	a5,24(sp)
   11b28:	00048513          	mv	a0,s1
   11b2c:	00f4a423          	sw	a5,8(s1)
   11b30:	00c12783          	lw	a5,12(sp)
   11b34:	00f4a623          	sw	a5,12(s1)
   11b38:	02412483          	lw	s1,36(sp)
   11b3c:	03010113          	addi	sp,sp,48
   11b40:	00008067          	ret
   11b44:	00300713          	li	a4,3
   11b48:	f41ff06f          	j	11a88 <__floatsitf+0x78>
   11b4c:	00012e23          	sw	zero,28(sp)
   11b50:	00012c23          	sw	zero,24(sp)
   11b54:	00012a23          	sw	zero,20(sp)
   11b58:	00012823          	sw	zero,16(sp)
   11b5c:	00000613          	li	a2,0
   11b60:	f95ff06f          	j	11af4 <__floatsitf+0xe4>

00011b64 <__eqsf2>:
   11b64:	01755693          	srli	a3,a0,0x17
   11b68:	008007b7          	lui	a5,0x800
   11b6c:	fff78793          	addi	a5,a5,-1 # 7fffff <_memory_end+0x7dffff>
   11b70:	0175d613          	srli	a2,a1,0x17
   11b74:	0ff6f693          	zext.b	a3,a3
   11b78:	0ff00893          	li	a7,255
   11b7c:	00a7f833          	and	a6,a5,a0
   11b80:	01f55713          	srli	a4,a0,0x1f
   11b84:	00b7f7b3          	and	a5,a5,a1
   11b88:	0ff67613          	zext.b	a2,a2
   11b8c:	01f5d593          	srli	a1,a1,0x1f
   11b90:	00100513          	li	a0,1
   11b94:	01169a63          	bne	a3,a7,11ba8 <__eqsf2+0x44>
   11b98:	00081663          	bnez	a6,11ba4 <__eqsf2+0x40>
   11b9c:	00d61463          	bne	a2,a3,11ba4 <__eqsf2+0x40>
   11ba0:	00078a63          	beqz	a5,11bb4 <__eqsf2+0x50>
   11ba4:	00008067          	ret
   11ba8:	ff160ee3          	beq	a2,a7,11ba4 <__eqsf2+0x40>
   11bac:	fec69ce3          	bne	a3,a2,11ba4 <__eqsf2+0x40>
   11bb0:	fef81ae3          	bne	a6,a5,11ba4 <__eqsf2+0x40>
   11bb4:	00000513          	li	a0,0
   11bb8:	feb706e3          	beq	a4,a1,11ba4 <__eqsf2+0x40>
   11bbc:	00100513          	li	a0,1
   11bc0:	fe0692e3          	bnez	a3,11ba4 <__eqsf2+0x40>
   11bc4:	01003533          	snez	a0,a6
   11bc8:	00008067          	ret

00011bcc <__lesf2>:
   11bcc:	008007b7          	lui	a5,0x800
   11bd0:	fff78793          	addi	a5,a5,-1 # 7fffff <_memory_end+0x7dffff>
   11bd4:	01755693          	srli	a3,a0,0x17
   11bd8:	00a7f633          	and	a2,a5,a0
   11bdc:	01f55713          	srli	a4,a0,0x1f
   11be0:	0ff6f693          	zext.b	a3,a3
   11be4:	0175d513          	srli	a0,a1,0x17
   11be8:	0ff00813          	li	a6,255
   11bec:	00b7f7b3          	and	a5,a5,a1
   11bf0:	0ff57513          	zext.b	a0,a0
   11bf4:	01f5d593          	srli	a1,a1,0x1f
   11bf8:	01069463          	bne	a3,a6,11c00 <__lesf2+0x34>
   11bfc:	04061263          	bnez	a2,11c40 <__lesf2+0x74>
   11c00:	0ff00813          	li	a6,255
   11c04:	01051463          	bne	a0,a6,11c0c <__lesf2+0x40>
   11c08:	02079c63          	bnez	a5,11c40 <__lesf2+0x74>
   11c0c:	04069a63          	bnez	a3,11c60 <__lesf2+0x94>
   11c10:	02051c63          	bnez	a0,11c48 <__lesf2+0x7c>
   11c14:	04061863          	bnez	a2,11c64 <__lesf2+0x98>
   11c18:	04078263          	beqz	a5,11c5c <__lesf2+0x90>
   11c1c:	00100513          	li	a0,1
   11c20:	02059e63          	bnez	a1,11c5c <__lesf2+0x90>
   11c24:	fff00513          	li	a0,-1
   11c28:	00008067          	ret
   11c2c:	fea6c8e3          	blt	a3,a0,11c1c <__lesf2+0x50>
   11c30:	02c7e263          	bltu	a5,a2,11c54 <__lesf2+0x88>
   11c34:	00000513          	li	a0,0
   11c38:	02f67263          	bgeu	a2,a5,11c5c <__lesf2+0x90>
   11c3c:	fe1ff06f          	j	11c1c <__lesf2+0x50>
   11c40:	00200513          	li	a0,2
   11c44:	00008067          	ret
   11c48:	fc060ae3          	beqz	a2,11c1c <__lesf2+0x50>
   11c4c:	00e59e63          	bne	a1,a4,11c68 <__lesf2+0x9c>
   11c50:	fcd55ee3          	bge	a0,a3,11c2c <__lesf2+0x60>
   11c54:	fff00513          	li	a0,-1
   11c58:	00058c63          	beqz	a1,11c70 <__lesf2+0xa4>
   11c5c:	00008067          	ret
   11c60:	fe0516e3          	bnez	a0,11c4c <__lesf2+0x80>
   11c64:	fe0794e3          	bnez	a5,11c4c <__lesf2+0x80>
   11c68:	fff00513          	li	a0,-1
   11c6c:	fe0718e3          	bnez	a4,11c5c <__lesf2+0x90>
   11c70:	00100513          	li	a0,1
   11c74:	00008067          	ret

00011c78 <__mulsf3>:
   11c78:	fe010113          	addi	sp,sp,-32
   11c7c:	01212823          	sw	s2,16(sp)
   11c80:	01755913          	srli	s2,a0,0x17
   11c84:	00912a23          	sw	s1,20(sp)
   11c88:	01312623          	sw	s3,12(sp)
   11c8c:	01512223          	sw	s5,4(sp)
   11c90:	00951493          	slli	s1,a0,0x9
   11c94:	00112e23          	sw	ra,28(sp)
   11c98:	00812c23          	sw	s0,24(sp)
   11c9c:	01412423          	sw	s4,8(sp)
   11ca0:	0ff97913          	zext.b	s2,s2
   11ca4:	00058a93          	mv	s5,a1
   11ca8:	0094d493          	srli	s1,s1,0x9
   11cac:	01f55993          	srli	s3,a0,0x1f
   11cb0:	10090863          	beqz	s2,11dc0 <__mulsf3+0x148>
   11cb4:	0ff00793          	li	a5,255
   11cb8:	12f90463          	beq	s2,a5,11de0 <__mulsf3+0x168>
   11cbc:	00349493          	slli	s1,s1,0x3
   11cc0:	040007b7          	lui	a5,0x4000
   11cc4:	00f4e4b3          	or	s1,s1,a5
   11cc8:	f8190913          	addi	s2,s2,-127
   11ccc:	00000a13          	li	s4,0
   11cd0:	017ad793          	srli	a5,s5,0x17
   11cd4:	009a9413          	slli	s0,s5,0x9
   11cd8:	0ff7f793          	zext.b	a5,a5
   11cdc:	00945413          	srli	s0,s0,0x9
   11ce0:	01fada93          	srli	s5,s5,0x1f
   11ce4:	10078e63          	beqz	a5,11e00 <__mulsf3+0x188>
   11ce8:	0ff00713          	li	a4,255
   11cec:	12e78a63          	beq	a5,a4,11e20 <__mulsf3+0x1a8>
   11cf0:	00341413          	slli	s0,s0,0x3
   11cf4:	04000737          	lui	a4,0x4000
   11cf8:	00e46433          	or	s0,s0,a4
   11cfc:	f8178793          	addi	a5,a5,-127 # 3ffff81 <_memory_end+0x3fdff81>
   11d00:	00000713          	li	a4,0
   11d04:	00f90933          	add	s2,s2,a5
   11d08:	002a1793          	slli	a5,s4,0x2
   11d0c:	00e7e7b3          	or	a5,a5,a4
   11d10:	00a00613          	li	a2,10
   11d14:	00190693          	addi	a3,s2,1
   11d18:	1ef64263          	blt	a2,a5,11efc <__mulsf3+0x284>
   11d1c:	00200613          	li	a2,2
   11d20:	0159c9b3          	xor	s3,s3,s5
   11d24:	10f64e63          	blt	a2,a5,11e40 <__mulsf3+0x1c8>
   11d28:	fff78793          	addi	a5,a5,-1
   11d2c:	00100613          	li	a2,1
   11d30:	12f67a63          	bgeu	a2,a5,11e64 <__mulsf3+0x1ec>
   11d34:	00010837          	lui	a6,0x10
   11d38:	fff80513          	addi	a0,a6,-1 # ffff <__multf3+0xc07>
   11d3c:	0104d613          	srli	a2,s1,0x10
   11d40:	01045793          	srli	a5,s0,0x10
   11d44:	00a4f4b3          	and	s1,s1,a0
   11d48:	00a47433          	and	s0,s0,a0
   11d4c:	029405b3          	mul	a1,s0,s1
   11d50:	02860433          	mul	s0,a2,s0
   11d54:	02f60633          	mul	a2,a2,a5
   11d58:	029787b3          	mul	a5,a5,s1
   11d5c:	00878733          	add	a4,a5,s0
   11d60:	0105d793          	srli	a5,a1,0x10
   11d64:	00e787b3          	add	a5,a5,a4
   11d68:	0087f463          	bgeu	a5,s0,11d70 <__mulsf3+0xf8>
   11d6c:	01060633          	add	a2,a2,a6
   11d70:	00a7f733          	and	a4,a5,a0
   11d74:	01071713          	slli	a4,a4,0x10
   11d78:	00a5f5b3          	and	a1,a1,a0
   11d7c:	00b70733          	add	a4,a4,a1
   11d80:	0107d793          	srli	a5,a5,0x10
   11d84:	00671413          	slli	s0,a4,0x6
   11d88:	00c787b3          	add	a5,a5,a2
   11d8c:	01a75713          	srli	a4,a4,0x1a
   11d90:	00679793          	slli	a5,a5,0x6
   11d94:	00803433          	snez	s0,s0
   11d98:	00e46433          	or	s0,s0,a4
   11d9c:	00479713          	slli	a4,a5,0x4
   11da0:	0087e433          	or	s0,a5,s0
   11da4:	00075a63          	bgez	a4,11db8 <__mulsf3+0x140>
   11da8:	00145793          	srli	a5,s0,0x1
   11dac:	00147413          	andi	s0,s0,1
   11db0:	0087e433          	or	s0,a5,s0
   11db4:	00068913          	mv	s2,a3
   11db8:	00090693          	mv	a3,s2
   11dbc:	0c00006f          	j	11e7c <__mulsf3+0x204>
   11dc0:	02048a63          	beqz	s1,11df4 <__mulsf3+0x17c>
   11dc4:	00048513          	mv	a0,s1
   11dc8:	2f9000ef          	jal	128c0 <__clzsi2>
   11dcc:	ffb50793          	addi	a5,a0,-5
   11dd0:	f8a00913          	li	s2,-118
   11dd4:	00f494b3          	sll	s1,s1,a5
   11dd8:	40a90933          	sub	s2,s2,a0
   11ddc:	ef1ff06f          	j	11ccc <__mulsf3+0x54>
   11de0:	0ff00913          	li	s2,255
   11de4:	00200a13          	li	s4,2
   11de8:	ee0484e3          	beqz	s1,11cd0 <__mulsf3+0x58>
   11dec:	00300a13          	li	s4,3
   11df0:	ee1ff06f          	j	11cd0 <__mulsf3+0x58>
   11df4:	00000913          	li	s2,0
   11df8:	00100a13          	li	s4,1
   11dfc:	ed5ff06f          	j	11cd0 <__mulsf3+0x58>
   11e00:	02040a63          	beqz	s0,11e34 <__mulsf3+0x1bc>
   11e04:	00040513          	mv	a0,s0
   11e08:	2b9000ef          	jal	128c0 <__clzsi2>
   11e0c:	ffb50793          	addi	a5,a0,-5
   11e10:	00f41433          	sll	s0,s0,a5
   11e14:	f8a00793          	li	a5,-118
   11e18:	40a787b3          	sub	a5,a5,a0
   11e1c:	ee5ff06f          	j	11d00 <__mulsf3+0x88>
   11e20:	0ff00793          	li	a5,255
   11e24:	00200713          	li	a4,2
   11e28:	ec040ee3          	beqz	s0,11d04 <__mulsf3+0x8c>
   11e2c:	00300713          	li	a4,3
   11e30:	ed5ff06f          	j	11d04 <__mulsf3+0x8c>
   11e34:	00000793          	li	a5,0
   11e38:	00100713          	li	a4,1
   11e3c:	ec9ff06f          	j	11d04 <__mulsf3+0x8c>
   11e40:	00100613          	li	a2,1
   11e44:	00f617b3          	sll	a5,a2,a5
   11e48:	5307f613          	andi	a2,a5,1328
   11e4c:	0c061063          	bnez	a2,11f0c <__mulsf3+0x294>
   11e50:	2407f613          	andi	a2,a5,576
   11e54:	12061263          	bnez	a2,11f78 <__mulsf3+0x300>
   11e58:	0887f793          	andi	a5,a5,136
   11e5c:	ec078ce3          	beqz	a5,11d34 <__mulsf3+0xbc>
   11e60:	000a8993          	mv	s3,s5
   11e64:	00200793          	li	a5,2
   11e68:	10f70263          	beq	a4,a5,11f6c <__mulsf3+0x2f4>
   11e6c:	00300793          	li	a5,3
   11e70:	10f70463          	beq	a4,a5,11f78 <__mulsf3+0x300>
   11e74:	00100793          	li	a5,1
   11e78:	10f70863          	beq	a4,a5,11f88 <__mulsf3+0x310>
   11e7c:	07f68713          	addi	a4,a3,127
   11e80:	08e05c63          	blez	a4,11f18 <__mulsf3+0x2a0>
   11e84:	00747793          	andi	a5,s0,7
   11e88:	00078a63          	beqz	a5,11e9c <__mulsf3+0x224>
   11e8c:	00f47793          	andi	a5,s0,15
   11e90:	00400613          	li	a2,4
   11e94:	00c78463          	beq	a5,a2,11e9c <__mulsf3+0x224>
   11e98:	00440413          	addi	s0,s0,4
   11e9c:	00441793          	slli	a5,s0,0x4
   11ea0:	0007da63          	bgez	a5,11eb4 <__mulsf3+0x23c>
   11ea4:	f80007b7          	lui	a5,0xf8000
   11ea8:	fff78793          	addi	a5,a5,-1 # f7ffffff <_memory_end+0xf7fdffff>
   11eac:	00f47433          	and	s0,s0,a5
   11eb0:	08068713          	addi	a4,a3,128
   11eb4:	0fe00793          	li	a5,254
   11eb8:	0ae7ca63          	blt	a5,a4,11f6c <__mulsf3+0x2f4>
   11ebc:	00345793          	srli	a5,s0,0x3
   11ec0:	01c12083          	lw	ra,28(sp)
   11ec4:	01812403          	lw	s0,24(sp)
   11ec8:	00979793          	slli	a5,a5,0x9
   11ecc:	01771513          	slli	a0,a4,0x17
   11ed0:	0097d793          	srli	a5,a5,0x9
   11ed4:	01f99993          	slli	s3,s3,0x1f
   11ed8:	00f56533          	or	a0,a0,a5
   11edc:	01412483          	lw	s1,20(sp)
   11ee0:	01012903          	lw	s2,16(sp)
   11ee4:	00812a03          	lw	s4,8(sp)
   11ee8:	00412a83          	lw	s5,4(sp)
   11eec:	01356533          	or	a0,a0,s3
   11ef0:	00c12983          	lw	s3,12(sp)
   11ef4:	02010113          	addi	sp,sp,32
   11ef8:	00008067          	ret
   11efc:	00f00613          	li	a2,15
   11f00:	06c78c63          	beq	a5,a2,11f78 <__mulsf3+0x300>
   11f04:	00b00613          	li	a2,11
   11f08:	f4c78ce3          	beq	a5,a2,11e60 <__mulsf3+0x1e8>
   11f0c:	00048413          	mv	s0,s1
   11f10:	000a0713          	mv	a4,s4
   11f14:	f51ff06f          	j	11e64 <__mulsf3+0x1ec>
   11f18:	00100793          	li	a5,1
   11f1c:	40e787b3          	sub	a5,a5,a4
   11f20:	01b00713          	li	a4,27
   11f24:	06f74263          	blt	a4,a5,11f88 <__mulsf3+0x310>
   11f28:	09e68693          	addi	a3,a3,158
   11f2c:	00d416b3          	sll	a3,s0,a3
   11f30:	00f457b3          	srl	a5,s0,a5
   11f34:	00d036b3          	snez	a3,a3
   11f38:	00d7e7b3          	or	a5,a5,a3
   11f3c:	0077f713          	andi	a4,a5,7
   11f40:	00070a63          	beqz	a4,11f54 <__mulsf3+0x2dc>
   11f44:	00f7f713          	andi	a4,a5,15
   11f48:	00400693          	li	a3,4
   11f4c:	00d70463          	beq	a4,a3,11f54 <__mulsf3+0x2dc>
   11f50:	00478793          	addi	a5,a5,4
   11f54:	00579713          	slli	a4,a5,0x5
   11f58:	0037d793          	srli	a5,a5,0x3
   11f5c:	02075863          	bgez	a4,11f8c <__mulsf3+0x314>
   11f60:	00000793          	li	a5,0
   11f64:	00100713          	li	a4,1
   11f68:	f59ff06f          	j	11ec0 <__mulsf3+0x248>
   11f6c:	00000793          	li	a5,0
   11f70:	0ff00713          	li	a4,255
   11f74:	f4dff06f          	j	11ec0 <__mulsf3+0x248>
   11f78:	004007b7          	lui	a5,0x400
   11f7c:	0ff00713          	li	a4,255
   11f80:	00000993          	li	s3,0
   11f84:	f3dff06f          	j	11ec0 <__mulsf3+0x248>
   11f88:	00000793          	li	a5,0
   11f8c:	00000713          	li	a4,0
   11f90:	f31ff06f          	j	11ec0 <__mulsf3+0x248>

00011f94 <__subsf3>:
   11f94:	008006b7          	lui	a3,0x800
   11f98:	fff68693          	addi	a3,a3,-1 # 7fffff <_memory_end+0x7dffff>
   11f9c:	ff010113          	addi	sp,sp,-16
   11fa0:	00a6f633          	and	a2,a3,a0
   11fa4:	01755713          	srli	a4,a0,0x17
   11fa8:	00812423          	sw	s0,8(sp)
   11fac:	01f55413          	srli	s0,a0,0x1f
   11fb0:	00361513          	slli	a0,a2,0x3
   11fb4:	0175d613          	srli	a2,a1,0x17
   11fb8:	00b6f6b3          	and	a3,a3,a1
   11fbc:	01212023          	sw	s2,0(sp)
   11fc0:	00112623          	sw	ra,12(sp)
   11fc4:	0ff77913          	zext.b	s2,a4
   11fc8:	00912223          	sw	s1,4(sp)
   11fcc:	0ff67613          	zext.b	a2,a2
   11fd0:	0ff00713          	li	a4,255
   11fd4:	01f5d593          	srli	a1,a1,0x1f
   11fd8:	00369793          	slli	a5,a3,0x3
   11fdc:	00e61463          	bne	a2,a4,11fe4 <__subsf3+0x50>
   11fe0:	00079463          	bnez	a5,11fe8 <__subsf3+0x54>
   11fe4:	0015c593          	xori	a1,a1,1
   11fe8:	40c906b3          	sub	a3,s2,a2
   11fec:	18859063          	bne	a1,s0,1216c <__subsf3+0x1d8>
   11ff0:	08d05c63          	blez	a3,12088 <__subsf3+0xf4>
   11ff4:	02061663          	bnez	a2,12020 <__subsf3+0x8c>
   11ff8:	02078063          	beqz	a5,12018 <__subsf3+0x84>
   11ffc:	fff90693          	addi	a3,s2,-1
   12000:	00069863          	bnez	a3,12010 <__subsf3+0x7c>
   12004:	00a787b3          	add	a5,a5,a0
   12008:	00100913          	li	s2,1
   1200c:	04c0006f          	j	12058 <__subsf3+0xc4>
   12010:	0ff00713          	li	a4,255
   12014:	00e91e63          	bne	s2,a4,12030 <__subsf3+0x9c>
   12018:	00050793          	mv	a5,a0
   1201c:	10c0006f          	j	12128 <__subsf3+0x194>
   12020:	0ff00713          	li	a4,255
   12024:	fee90ae3          	beq	s2,a4,12018 <__subsf3+0x84>
   12028:	04000737          	lui	a4,0x4000
   1202c:	00e7e7b3          	or	a5,a5,a4
   12030:	01b00613          	li	a2,27
   12034:	00100713          	li	a4,1
   12038:	00d64e63          	blt	a2,a3,12054 <__subsf3+0xc0>
   1203c:	02000613          	li	a2,32
   12040:	00d7d733          	srl	a4,a5,a3
   12044:	40d606b3          	sub	a3,a2,a3
   12048:	00d796b3          	sll	a3,a5,a3
   1204c:	00d036b3          	snez	a3,a3
   12050:	00d76733          	or	a4,a4,a3
   12054:	00a707b3          	add	a5,a4,a0
   12058:	00579713          	slli	a4,a5,0x5
   1205c:	0c075663          	bgez	a4,12128 <__subsf3+0x194>
   12060:	00190913          	addi	s2,s2,1
   12064:	0ff00713          	li	a4,255
   12068:	2ce90a63          	beq	s2,a4,1233c <__subsf3+0x3a8>
   1206c:	7e000737          	lui	a4,0x7e000
   12070:	0017f693          	andi	a3,a5,1
   12074:	fff70713          	addi	a4,a4,-1 # 7dffffff <_memory_end+0x7dfdffff>
   12078:	0017d793          	srli	a5,a5,0x1
   1207c:	00e7f7b3          	and	a5,a5,a4
   12080:	00d7e7b3          	or	a5,a5,a3
   12084:	0a40006f          	j	12128 <__subsf3+0x194>
   12088:	06068663          	beqz	a3,120f4 <__subsf3+0x160>
   1208c:	41260733          	sub	a4,a2,s2
   12090:	02091063          	bnez	s2,120b0 <__subsf3+0x11c>
   12094:	0c050863          	beqz	a0,12164 <__subsf3+0x1d0>
   12098:	fff70693          	addi	a3,a4,-1
   1209c:	f60684e3          	beqz	a3,12004 <__subsf3+0x70>
   120a0:	0ff00593          	li	a1,255
   120a4:	02b71063          	bne	a4,a1,120c4 <__subsf3+0x130>
   120a8:	0ff00913          	li	s2,255
   120ac:	07c0006f          	j	12128 <__subsf3+0x194>
   120b0:	0ff00693          	li	a3,255
   120b4:	fed60ae3          	beq	a2,a3,120a8 <__subsf3+0x114>
   120b8:	040006b7          	lui	a3,0x4000
   120bc:	00d56533          	or	a0,a0,a3
   120c0:	00070693          	mv	a3,a4
   120c4:	01b00593          	li	a1,27
   120c8:	00100713          	li	a4,1
   120cc:	00d5ce63          	blt	a1,a3,120e8 <__subsf3+0x154>
   120d0:	02000713          	li	a4,32
   120d4:	40d70733          	sub	a4,a4,a3
   120d8:	00e51733          	sll	a4,a0,a4
   120dc:	00d555b3          	srl	a1,a0,a3
   120e0:	00e03733          	snez	a4,a4
   120e4:	00e5e733          	or	a4,a1,a4
   120e8:	00e787b3          	add	a5,a5,a4
   120ec:	00060913          	mv	s2,a2
   120f0:	f69ff06f          	j	12058 <__subsf3+0xc4>
   120f4:	00190713          	addi	a4,s2,1
   120f8:	0fe77693          	andi	a3,a4,254
   120fc:	04069c63          	bnez	a3,12154 <__subsf3+0x1c0>
   12100:	04091263          	bnez	s2,12144 <__subsf3+0x1b0>
   12104:	02050263          	beqz	a0,12128 <__subsf3+0x194>
   12108:	f00788e3          	beqz	a5,12018 <__subsf3+0x84>
   1210c:	00a787b3          	add	a5,a5,a0
   12110:	00579713          	slli	a4,a5,0x5
   12114:	00075a63          	bgez	a4,12128 <__subsf3+0x194>
   12118:	fc000737          	lui	a4,0xfc000
   1211c:	fff70713          	addi	a4,a4,-1 # fbffffff <_memory_end+0xfbfdffff>
   12120:	00e7f7b3          	and	a5,a5,a4
   12124:	00100913          	li	s2,1
   12128:	0077f713          	andi	a4,a5,7
   1212c:	20070a63          	beqz	a4,12340 <__subsf3+0x3ac>
   12130:	00f7f713          	andi	a4,a5,15
   12134:	00400693          	li	a3,4
   12138:	20d70463          	beq	a4,a3,12340 <__subsf3+0x3ac>
   1213c:	00478793          	addi	a5,a5,4 # 400004 <_memory_end+0x3e0004>
   12140:	2000006f          	j	12340 <__subsf3+0x3ac>
   12144:	f60502e3          	beqz	a0,120a8 <__subsf3+0x114>
   12148:	16079663          	bnez	a5,122b4 <__subsf3+0x320>
   1214c:	00050793          	mv	a5,a0
   12150:	f59ff06f          	j	120a8 <__subsf3+0x114>
   12154:	0ff00693          	li	a3,255
   12158:	1ed70063          	beq	a4,a3,12338 <__subsf3+0x3a4>
   1215c:	00f507b3          	add	a5,a0,a5
   12160:	0017d793          	srli	a5,a5,0x1
   12164:	00070913          	mv	s2,a4
   12168:	fc1ff06f          	j	12128 <__subsf3+0x194>
   1216c:	06d05e63          	blez	a3,121e8 <__subsf3+0x254>
   12170:	06061263          	bnez	a2,121d4 <__subsf3+0x240>
   12174:	ea0782e3          	beqz	a5,12018 <__subsf3+0x84>
   12178:	fff90693          	addi	a3,s2,-1
   1217c:	00069863          	bnez	a3,1218c <__subsf3+0x1f8>
   12180:	40f507b3          	sub	a5,a0,a5
   12184:	00100913          	li	s2,1
   12188:	0340006f          	j	121bc <__subsf3+0x228>
   1218c:	0ff00713          	li	a4,255
   12190:	e8e904e3          	beq	s2,a4,12018 <__subsf3+0x84>
   12194:	01b00613          	li	a2,27
   12198:	00100713          	li	a4,1
   1219c:	00d64e63          	blt	a2,a3,121b8 <__subsf3+0x224>
   121a0:	02000613          	li	a2,32
   121a4:	00d7d733          	srl	a4,a5,a3
   121a8:	40d606b3          	sub	a3,a2,a3
   121ac:	00d796b3          	sll	a3,a5,a3
   121b0:	00d036b3          	snez	a3,a3
   121b4:	00d76733          	or	a4,a4,a3
   121b8:	40e507b3          	sub	a5,a0,a4
   121bc:	00579713          	slli	a4,a5,0x5
   121c0:	f60754e3          	bgez	a4,12128 <__subsf3+0x194>
   121c4:	040004b7          	lui	s1,0x4000
   121c8:	fff48493          	addi	s1,s1,-1 # 3ffffff <_memory_end+0x3fdffff>
   121cc:	0097f4b3          	and	s1,a5,s1
   121d0:	1080006f          	j	122d8 <__subsf3+0x344>
   121d4:	0ff00713          	li	a4,255
   121d8:	e4e900e3          	beq	s2,a4,12018 <__subsf3+0x84>
   121dc:	04000737          	lui	a4,0x4000
   121e0:	00e7e7b3          	or	a5,a5,a4
   121e4:	fb1ff06f          	j	12194 <__subsf3+0x200>
   121e8:	06068e63          	beqz	a3,12264 <__subsf3+0x2d0>
   121ec:	41260733          	sub	a4,a2,s2
   121f0:	02091663          	bnez	s2,1221c <__subsf3+0x288>
   121f4:	1a050e63          	beqz	a0,123b0 <__subsf3+0x41c>
   121f8:	fff70693          	addi	a3,a4,-1 # 3ffffff <_memory_end+0x3fdffff>
   121fc:	00069863          	bnez	a3,1220c <__subsf3+0x278>
   12200:	40a787b3          	sub	a5,a5,a0
   12204:	00058413          	mv	s0,a1
   12208:	f7dff06f          	j	12184 <__subsf3+0x1f0>
   1220c:	0ff00813          	li	a6,255
   12210:	03071063          	bne	a4,a6,12230 <__subsf3+0x29c>
   12214:	0ff00913          	li	s2,255
   12218:	19c0006f          	j	123b4 <__subsf3+0x420>
   1221c:	0ff00693          	li	a3,255
   12220:	fed60ae3          	beq	a2,a3,12214 <__subsf3+0x280>
   12224:	040006b7          	lui	a3,0x4000
   12228:	00d56533          	or	a0,a0,a3
   1222c:	00070693          	mv	a3,a4
   12230:	01b00813          	li	a6,27
   12234:	00100713          	li	a4,1
   12238:	00d84e63          	blt	a6,a3,12254 <__subsf3+0x2c0>
   1223c:	02000713          	li	a4,32
   12240:	40d70733          	sub	a4,a4,a3
   12244:	00e51733          	sll	a4,a0,a4
   12248:	00d55833          	srl	a6,a0,a3
   1224c:	00e03733          	snez	a4,a4
   12250:	00e86733          	or	a4,a6,a4
   12254:	40e787b3          	sub	a5,a5,a4
   12258:	00060913          	mv	s2,a2
   1225c:	00058413          	mv	s0,a1
   12260:	f5dff06f          	j	121bc <__subsf3+0x228>
   12264:	00190713          	addi	a4,s2,1
   12268:	0fe77713          	andi	a4,a4,254
   1226c:	04071c63          	bnez	a4,122c4 <__subsf3+0x330>
   12270:	02091c63          	bnez	s2,122a8 <__subsf3+0x314>
   12274:	00051863          	bnez	a0,12284 <__subsf3+0x2f0>
   12278:	12079e63          	bnez	a5,123b4 <__subsf3+0x420>
   1227c:	00000413          	li	s0,0
   12280:	0c00006f          	j	12340 <__subsf3+0x3ac>
   12284:	d8078ae3          	beqz	a5,12018 <__subsf3+0x84>
   12288:	40f50733          	sub	a4,a0,a5
   1228c:	00571693          	slli	a3,a4,0x5
   12290:	40a787b3          	sub	a5,a5,a0
   12294:	1206c063          	bltz	a3,123b4 <__subsf3+0x420>
   12298:	00070793          	mv	a5,a4
   1229c:	e80716e3          	bnez	a4,12128 <__subsf3+0x194>
   122a0:	00000793          	li	a5,0
   122a4:	fd9ff06f          	j	1227c <__subsf3+0x2e8>
   122a8:	ea0510e3          	bnez	a0,12148 <__subsf3+0x1b4>
   122ac:	00058413          	mv	s0,a1
   122b0:	de079ce3          	bnez	a5,120a8 <__subsf3+0x114>
   122b4:	00000413          	li	s0,0
   122b8:	020007b7          	lui	a5,0x2000
   122bc:	0ff00913          	li	s2,255
   122c0:	0800006f          	j	12340 <__subsf3+0x3ac>
   122c4:	40f504b3          	sub	s1,a0,a5
   122c8:	00549713          	slli	a4,s1,0x5
   122cc:	04075463          	bgez	a4,12314 <__subsf3+0x380>
   122d0:	40a784b3          	sub	s1,a5,a0
   122d4:	00058413          	mv	s0,a1
   122d8:	00048513          	mv	a0,s1
   122dc:	5e4000ef          	jal	128c0 <__clzsi2>
   122e0:	ffb50513          	addi	a0,a0,-5
   122e4:	00a494b3          	sll	s1,s1,a0
   122e8:	03254e63          	blt	a0,s2,12324 <__subsf3+0x390>
   122ec:	41250533          	sub	a0,a0,s2
   122f0:	00150513          	addi	a0,a0,1
   122f4:	02000713          	li	a4,32
   122f8:	40a70733          	sub	a4,a4,a0
   122fc:	00a4d7b3          	srl	a5,s1,a0
   12300:	00e494b3          	sll	s1,s1,a4
   12304:	009034b3          	snez	s1,s1
   12308:	0097e7b3          	or	a5,a5,s1
   1230c:	00000913          	li	s2,0
   12310:	e19ff06f          	j	12128 <__subsf3+0x194>
   12314:	fc0492e3          	bnez	s1,122d8 <__subsf3+0x344>
   12318:	00000793          	li	a5,0
   1231c:	00000913          	li	s2,0
   12320:	f5dff06f          	j	1227c <__subsf3+0x2e8>
   12324:	fc0007b7          	lui	a5,0xfc000
   12328:	fff78793          	addi	a5,a5,-1 # fbffffff <_memory_end+0xfbfdffff>
   1232c:	40a90933          	sub	s2,s2,a0
   12330:	00f4f7b3          	and	a5,s1,a5
   12334:	df5ff06f          	j	12128 <__subsf3+0x194>
   12338:	0ff00913          	li	s2,255
   1233c:	00000793          	li	a5,0
   12340:	00579713          	slli	a4,a5,0x5
   12344:	00075e63          	bgez	a4,12360 <__subsf3+0x3cc>
   12348:	00190913          	addi	s2,s2,1
   1234c:	0ff00713          	li	a4,255
   12350:	06e90663          	beq	s2,a4,123bc <__subsf3+0x428>
   12354:	fc000737          	lui	a4,0xfc000
   12358:	fff70713          	addi	a4,a4,-1 # fbffffff <_memory_end+0xfbfdffff>
   1235c:	00e7f7b3          	and	a5,a5,a4
   12360:	0ff00713          	li	a4,255
   12364:	0037d793          	srli	a5,a5,0x3
   12368:	00e91863          	bne	s2,a4,12378 <__subsf3+0x3e4>
   1236c:	00078663          	beqz	a5,12378 <__subsf3+0x3e4>
   12370:	004007b7          	lui	a5,0x400
   12374:	00000413          	li	s0,0
   12378:	00c12083          	lw	ra,12(sp)
   1237c:	01791713          	slli	a4,s2,0x17
   12380:	01f41513          	slli	a0,s0,0x1f
   12384:	7f8006b7          	lui	a3,0x7f800
   12388:	00812403          	lw	s0,8(sp)
   1238c:	00979793          	slli	a5,a5,0x9
   12390:	00d77733          	and	a4,a4,a3
   12394:	0097d793          	srli	a5,a5,0x9
   12398:	00f767b3          	or	a5,a4,a5
   1239c:	00412483          	lw	s1,4(sp)
   123a0:	00012903          	lw	s2,0(sp)
   123a4:	00a7e533          	or	a0,a5,a0
   123a8:	01010113          	addi	sp,sp,16
   123ac:	00008067          	ret
   123b0:	00070913          	mv	s2,a4
   123b4:	00058413          	mv	s0,a1
   123b8:	d71ff06f          	j	12128 <__subsf3+0x194>
   123bc:	00000793          	li	a5,0
   123c0:	fa1ff06f          	j	12360 <__subsf3+0x3cc>

000123c4 <__fixsfsi>:
   123c4:	00800637          	lui	a2,0x800
   123c8:	01755713          	srli	a4,a0,0x17
   123cc:	fff60793          	addi	a5,a2,-1 # 7fffff <_memory_end+0x7dffff>
   123d0:	0ff77713          	zext.b	a4,a4
   123d4:	07e00593          	li	a1,126
   123d8:	00a7f7b3          	and	a5,a5,a0
   123dc:	01f55693          	srli	a3,a0,0x1f
   123e0:	04e5d663          	bge	a1,a4,1242c <__fixsfsi+0x68>
   123e4:	09d00593          	li	a1,157
   123e8:	00e5da63          	bge	a1,a4,123fc <__fixsfsi+0x38>
   123ec:	80000537          	lui	a0,0x80000
   123f0:	fff50513          	addi	a0,a0,-1 # 7fffffff <_memory_end+0x7ffdffff>
   123f4:	00a68533          	add	a0,a3,a0
   123f8:	00008067          	ret
   123fc:	00c7e533          	or	a0,a5,a2
   12400:	09500793          	li	a5,149
   12404:	00e7dc63          	bge	a5,a4,1241c <__fixsfsi+0x58>
   12408:	f6a70713          	addi	a4,a4,-150
   1240c:	00e51533          	sll	a0,a0,a4
   12410:	02068063          	beqz	a3,12430 <__fixsfsi+0x6c>
   12414:	40a00533          	neg	a0,a0
   12418:	00008067          	ret
   1241c:	09600793          	li	a5,150
   12420:	40e787b3          	sub	a5,a5,a4
   12424:	00f55533          	srl	a0,a0,a5
   12428:	fe9ff06f          	j	12410 <__fixsfsi+0x4c>
   1242c:	00000513          	li	a0,0
   12430:	00008067          	ret

00012434 <__floatsisf>:
   12434:	ff010113          	addi	sp,sp,-16
   12438:	00112623          	sw	ra,12(sp)
   1243c:	00812423          	sw	s0,8(sp)
   12440:	00912223          	sw	s1,4(sp)
   12444:	00050793          	mv	a5,a0
   12448:	0e050063          	beqz	a0,12528 <__floatsisf+0xf4>
   1244c:	41f55713          	srai	a4,a0,0x1f
   12450:	00a74433          	xor	s0,a4,a0
   12454:	40e40433          	sub	s0,s0,a4
   12458:	01f55493          	srli	s1,a0,0x1f
   1245c:	00040513          	mv	a0,s0
   12460:	460000ef          	jal	128c0 <__clzsi2>
   12464:	09e00793          	li	a5,158
   12468:	40a787b3          	sub	a5,a5,a0
   1246c:	09600713          	li	a4,150
   12470:	04f74063          	blt	a4,a5,124b0 <__floatsisf+0x7c>
   12474:	00800713          	li	a4,8
   12478:	0ae50e63          	beq	a0,a4,12534 <__floatsisf+0x100>
   1247c:	ff850513          	addi	a0,a0,-8
   12480:	00a41433          	sll	s0,s0,a0
   12484:	00941413          	slli	s0,s0,0x9
   12488:	00945413          	srli	s0,s0,0x9
   1248c:	01779793          	slli	a5,a5,0x17
   12490:	00c12083          	lw	ra,12(sp)
   12494:	0087e7b3          	or	a5,a5,s0
   12498:	00812403          	lw	s0,8(sp)
   1249c:	01f49513          	slli	a0,s1,0x1f
   124a0:	00a7e533          	or	a0,a5,a0
   124a4:	00412483          	lw	s1,4(sp)
   124a8:	01010113          	addi	sp,sp,16
   124ac:	00008067          	ret
   124b0:	09900713          	li	a4,153
   124b4:	06f75463          	bge	a4,a5,1251c <__floatsisf+0xe8>
   124b8:	00500713          	li	a4,5
   124bc:	40a70733          	sub	a4,a4,a0
   124c0:	01b50693          	addi	a3,a0,27
   124c4:	00e45733          	srl	a4,s0,a4
   124c8:	00d41433          	sll	s0,s0,a3
   124cc:	00803433          	snez	s0,s0
   124d0:	00876733          	or	a4,a4,s0
   124d4:	fc000437          	lui	s0,0xfc000
   124d8:	fff40413          	addi	s0,s0,-1 # fbffffff <_memory_end+0xfbfdffff>
   124dc:	00777693          	andi	a3,a4,7
   124e0:	00877433          	and	s0,a4,s0
   124e4:	00068a63          	beqz	a3,124f8 <__floatsisf+0xc4>
   124e8:	00f77713          	andi	a4,a4,15
   124ec:	00400693          	li	a3,4
   124f0:	00d70463          	beq	a4,a3,124f8 <__floatsisf+0xc4>
   124f4:	00440413          	addi	s0,s0,4
   124f8:	00541713          	slli	a4,s0,0x5
   124fc:	00075c63          	bgez	a4,12514 <__floatsisf+0xe0>
   12500:	fc0007b7          	lui	a5,0xfc000
   12504:	fff78793          	addi	a5,a5,-1 # fbffffff <_memory_end+0xfbfdffff>
   12508:	00f47433          	and	s0,s0,a5
   1250c:	09f00793          	li	a5,159
   12510:	40a787b3          	sub	a5,a5,a0
   12514:	00345413          	srli	s0,s0,0x3
   12518:	f6dff06f          	j	12484 <__floatsisf+0x50>
   1251c:	ffb50713          	addi	a4,a0,-5
   12520:	00e41733          	sll	a4,s0,a4
   12524:	fb1ff06f          	j	124d4 <__floatsisf+0xa0>
   12528:	00000493          	li	s1,0
   1252c:	00000413          	li	s0,0
   12530:	f55ff06f          	j	12484 <__floatsisf+0x50>
   12534:	09600793          	li	a5,150
   12538:	f4dff06f          	j	12484 <__floatsisf+0x50>

0001253c <__extenddftf2>:
   1253c:	01465713          	srli	a4,a2,0x14
   12540:	00c61793          	slli	a5,a2,0xc
   12544:	7ff77713          	andi	a4,a4,2047
   12548:	fd010113          	addi	sp,sp,-48
   1254c:	00c7d793          	srli	a5,a5,0xc
   12550:	00170693          	addi	a3,a4,1
   12554:	02812423          	sw	s0,40(sp)
   12558:	02912223          	sw	s1,36(sp)
   1255c:	03212023          	sw	s2,32(sp)
   12560:	02112623          	sw	ra,44(sp)
   12564:	00b12823          	sw	a1,16(sp)
   12568:	00f12a23          	sw	a5,20(sp)
   1256c:	00012e23          	sw	zero,28(sp)
   12570:	00012c23          	sw	zero,24(sp)
   12574:	7fe6f693          	andi	a3,a3,2046
   12578:	00050913          	mv	s2,a0
   1257c:	00058413          	mv	s0,a1
   12580:	01f65493          	srli	s1,a2,0x1f
   12584:	08068263          	beqz	a3,12608 <__extenddftf2+0xcc>
   12588:	000046b7          	lui	a3,0x4
   1258c:	c0068693          	addi	a3,a3,-1024 # 3c00 <_vfprintf_r+0x16f0>
   12590:	00d70733          	add	a4,a4,a3
   12594:	0047d693          	srli	a3,a5,0x4
   12598:	00d12e23          	sw	a3,28(sp)
   1259c:	01c79793          	slli	a5,a5,0x1c
   125a0:	0045d693          	srli	a3,a1,0x4
   125a4:	00d7e7b3          	or	a5,a5,a3
   125a8:	01c59413          	slli	s0,a1,0x1c
   125ac:	00f12c23          	sw	a5,24(sp)
   125b0:	00812a23          	sw	s0,20(sp)
   125b4:	00012823          	sw	zero,16(sp)
   125b8:	01c12783          	lw	a5,28(sp)
   125bc:	00f49493          	slli	s1,s1,0xf
   125c0:	00e4e4b3          	or	s1,s1,a4
   125c4:	00f11623          	sh	a5,12(sp)
   125c8:	01012783          	lw	a5,16(sp)
   125cc:	00911723          	sh	s1,14(sp)
   125d0:	02c12083          	lw	ra,44(sp)
   125d4:	00f92023          	sw	a5,0(s2)
   125d8:	01412783          	lw	a5,20(sp)
   125dc:	02812403          	lw	s0,40(sp)
   125e0:	02412483          	lw	s1,36(sp)
   125e4:	00f92223          	sw	a5,4(s2)
   125e8:	01812783          	lw	a5,24(sp)
   125ec:	00090513          	mv	a0,s2
   125f0:	00f92423          	sw	a5,8(s2)
   125f4:	00c12783          	lw	a5,12(sp)
   125f8:	00f92623          	sw	a5,12(s2)
   125fc:	02012903          	lw	s2,32(sp)
   12600:	03010113          	addi	sp,sp,48
   12604:	00008067          	ret
   12608:	00b7e533          	or	a0,a5,a1
   1260c:	10071063          	bnez	a4,1270c <__extenddftf2+0x1d0>
   12610:	fa0504e3          	beqz	a0,125b8 <__extenddftf2+0x7c>
   12614:	04078e63          	beqz	a5,12670 <__extenddftf2+0x134>
   12618:	00078513          	mv	a0,a5
   1261c:	2a4000ef          	jal	128c0 <__clzsi2>
   12620:	03150693          	addi	a3,a0,49
   12624:	4056d793          	srai	a5,a3,0x5
   12628:	01f6f693          	andi	a3,a3,31
   1262c:	04068863          	beqz	a3,1267c <__extenddftf2+0x140>
   12630:	ffc00613          	li	a2,-4
   12634:	02c78633          	mul	a2,a5,a2
   12638:	02000813          	li	a6,32
   1263c:	01010313          	addi	t1,sp,16
   12640:	40d80833          	sub	a6,a6,a3
   12644:	00c60713          	addi	a4,a2,12
   12648:	00e30733          	add	a4,t1,a4
   1264c:	40c00633          	neg	a2,a2
   12650:	08e31c63          	bne	t1,a4,126e8 <__extenddftf2+0x1ac>
   12654:	fff78713          	addi	a4,a5,-1
   12658:	00279793          	slli	a5,a5,0x2
   1265c:	02078793          	addi	a5,a5,32
   12660:	002787b3          	add	a5,a5,sp
   12664:	00d416b3          	sll	a3,s0,a3
   12668:	fed7a823          	sw	a3,-16(a5)
   1266c:	03c0006f          	j	126a8 <__extenddftf2+0x16c>
   12670:	250000ef          	jal	128c0 <__clzsi2>
   12674:	02050513          	addi	a0,a0,32
   12678:	fa9ff06f          	j	12620 <__extenddftf2+0xe4>
   1267c:	ffc00613          	li	a2,-4
   12680:	02c78633          	mul	a2,a5,a2
   12684:	01c10713          	addi	a4,sp,28
   12688:	00300693          	li	a3,3
   1268c:	00c705b3          	add	a1,a4,a2
   12690:	0005a583          	lw	a1,0(a1)
   12694:	fff68693          	addi	a3,a3,-1
   12698:	ffc70713          	addi	a4,a4,-4
   1269c:	00b72223          	sw	a1,4(a4)
   126a0:	fef6d6e3          	bge	a3,a5,1268c <__extenddftf2+0x150>
   126a4:	fff78713          	addi	a4,a5,-1
   126a8:	00170793          	addi	a5,a4,1
   126ac:	00279793          	slli	a5,a5,0x2
   126b0:	00800693          	li	a3,8
   126b4:	01010713          	addi	a4,sp,16
   126b8:	00d7ea63          	bltu	a5,a3,126cc <__extenddftf2+0x190>
   126bc:	00012823          	sw	zero,16(sp)
   126c0:	00072223          	sw	zero,4(a4)
   126c4:	ff878793          	addi	a5,a5,-8
   126c8:	01810713          	addi	a4,sp,24
   126cc:	00400693          	li	a3,4
   126d0:	00d7e463          	bltu	a5,a3,126d8 <__extenddftf2+0x19c>
   126d4:	00072023          	sw	zero,0(a4)
   126d8:	00004737          	lui	a4,0x4
   126dc:	c0c70713          	addi	a4,a4,-1012 # 3c0c <_vfprintf_r+0x16fc>
   126e0:	40a70733          	sub	a4,a4,a0
   126e4:	ed5ff06f          	j	125b8 <__extenddftf2+0x7c>
   126e8:	00072583          	lw	a1,0(a4)
   126ec:	ffc72883          	lw	a7,-4(a4)
   126f0:	00c70e33          	add	t3,a4,a2
   126f4:	00d595b3          	sll	a1,a1,a3
   126f8:	0108d8b3          	srl	a7,a7,a6
   126fc:	0115e5b3          	or	a1,a1,a7
   12700:	00be2023          	sw	a1,0(t3)
   12704:	ffc70713          	addi	a4,a4,-4
   12708:	f49ff06f          	j	12650 <__extenddftf2+0x114>
   1270c:	02050863          	beqz	a0,1273c <__extenddftf2+0x200>
   12710:	01c79713          	slli	a4,a5,0x1c
   12714:	0045d693          	srli	a3,a1,0x4
   12718:	00d76733          	or	a4,a4,a3
   1271c:	00e12c23          	sw	a4,24(sp)
   12720:	0047d793          	srli	a5,a5,0x4
   12724:	00008737          	lui	a4,0x8
   12728:	01c59413          	slli	s0,a1,0x1c
   1272c:	00e7e7b3          	or	a5,a5,a4
   12730:	00812a23          	sw	s0,20(sp)
   12734:	00012823          	sw	zero,16(sp)
   12738:	00f12e23          	sw	a5,28(sp)
   1273c:	00008737          	lui	a4,0x8
   12740:	fff70713          	addi	a4,a4,-1 # 7fff <__gdtoa+0x1067>
   12744:	e75ff06f          	j	125b8 <__extenddftf2+0x7c>

00012748 <__truncdfsf2>:
   12748:	0145d613          	srli	a2,a1,0x14
   1274c:	7ff67613          	andi	a2,a2,2047
   12750:	00c59793          	slli	a5,a1,0xc
   12754:	00160713          	addi	a4,a2,1
   12758:	0097d793          	srli	a5,a5,0x9
   1275c:	01d55693          	srli	a3,a0,0x1d
   12760:	7fe77713          	andi	a4,a4,2046
   12764:	00f6e6b3          	or	a3,a3,a5
   12768:	01f5d593          	srli	a1,a1,0x1f
   1276c:	00351793          	slli	a5,a0,0x3
   12770:	0a070663          	beqz	a4,1281c <__truncdfsf2+0xd4>
   12774:	c8060713          	addi	a4,a2,-896
   12778:	0fe00813          	li	a6,254
   1277c:	0ce84263          	blt	a6,a4,12840 <__truncdfsf2+0xf8>
   12780:	08e04063          	bgtz	a4,12800 <__truncdfsf2+0xb8>
   12784:	fe900513          	li	a0,-23
   12788:	10a74a63          	blt	a4,a0,1289c <__truncdfsf2+0x154>
   1278c:	00800537          	lui	a0,0x800
   12790:	00a6e6b3          	or	a3,a3,a0
   12794:	01e00513          	li	a0,30
   12798:	40e50533          	sub	a0,a0,a4
   1279c:	01f00813          	li	a6,31
   127a0:	02a84863          	blt	a6,a0,127d0 <__truncdfsf2+0x88>
   127a4:	c8260613          	addi	a2,a2,-894
   127a8:	00a7d533          	srl	a0,a5,a0
   127ac:	00c797b3          	sll	a5,a5,a2
   127b0:	00f037b3          	snez	a5,a5
   127b4:	00c696b3          	sll	a3,a3,a2
   127b8:	00d7e7b3          	or	a5,a5,a3
   127bc:	00f567b3          	or	a5,a0,a5
   127c0:	00000713          	li	a4,0
   127c4:	0077f693          	andi	a3,a5,7
   127c8:	08068063          	beqz	a3,12848 <__truncdfsf2+0x100>
   127cc:	0d80006f          	j	128a4 <__truncdfsf2+0x15c>
   127d0:	ffe00813          	li	a6,-2
   127d4:	40e80833          	sub	a6,a6,a4
   127d8:	02000893          	li	a7,32
   127dc:	0106d833          	srl	a6,a3,a6
   127e0:	00000713          	li	a4,0
   127e4:	01150663          	beq	a0,a7,127f0 <__truncdfsf2+0xa8>
   127e8:	ca260613          	addi	a2,a2,-862
   127ec:	00c69733          	sll	a4,a3,a2
   127f0:	00f76733          	or	a4,a4,a5
   127f4:	00e03733          	snez	a4,a4
   127f8:	00e867b3          	or	a5,a6,a4
   127fc:	fc5ff06f          	j	127c0 <__truncdfsf2+0x78>
   12800:	00651513          	slli	a0,a0,0x6
   12804:	00a03533          	snez	a0,a0
   12808:	00369693          	slli	a3,a3,0x3
   1280c:	01d7d793          	srli	a5,a5,0x1d
   12810:	00d566b3          	or	a3,a0,a3
   12814:	00f6e7b3          	or	a5,a3,a5
   12818:	fadff06f          	j	127c4 <__truncdfsf2+0x7c>
   1281c:	00f6e7b3          	or	a5,a3,a5
   12820:	00061663          	bnez	a2,1282c <__truncdfsf2+0xe4>
   12824:	00f037b3          	snez	a5,a5
   12828:	f99ff06f          	j	127c0 <__truncdfsf2+0x78>
   1282c:	0ff00713          	li	a4,255
   12830:	00078c63          	beqz	a5,12848 <__truncdfsf2+0x100>
   12834:	00369693          	slli	a3,a3,0x3
   12838:	020007b7          	lui	a5,0x2000
   1283c:	fd9ff06f          	j	12814 <__truncdfsf2+0xcc>
   12840:	00000793          	li	a5,0
   12844:	0ff00713          	li	a4,255
   12848:	00579693          	slli	a3,a5,0x5
   1284c:	0006de63          	bgez	a3,12868 <__truncdfsf2+0x120>
   12850:	00170713          	addi	a4,a4,1
   12854:	0ff00693          	li	a3,255
   12858:	06d70063          	beq	a4,a3,128b8 <__truncdfsf2+0x170>
   1285c:	fc0006b7          	lui	a3,0xfc000
   12860:	fff68693          	addi	a3,a3,-1 # fbffffff <_memory_end+0xfbfdffff>
   12864:	00d7f7b3          	and	a5,a5,a3
   12868:	0ff00693          	li	a3,255
   1286c:	0037d793          	srli	a5,a5,0x3
   12870:	00d71863          	bne	a4,a3,12880 <__truncdfsf2+0x138>
   12874:	00078663          	beqz	a5,12880 <__truncdfsf2+0x138>
   12878:	004007b7          	lui	a5,0x400
   1287c:	00000593          	li	a1,0
   12880:	7f8006b7          	lui	a3,0x7f800
   12884:	01771713          	slli	a4,a4,0x17
   12888:	00d77733          	and	a4,a4,a3
   1288c:	00f76733          	or	a4,a4,a5
   12890:	01f59513          	slli	a0,a1,0x1f
   12894:	00a76533          	or	a0,a4,a0
   12898:	00008067          	ret
   1289c:	00100793          	li	a5,1
   128a0:	00000713          	li	a4,0
   128a4:	00f7f693          	andi	a3,a5,15
   128a8:	00400613          	li	a2,4
   128ac:	f8c68ee3          	beq	a3,a2,12848 <__truncdfsf2+0x100>
   128b0:	00478793          	addi	a5,a5,4 # 400004 <_memory_end+0x3e0004>
   128b4:	f95ff06f          	j	12848 <__truncdfsf2+0x100>
   128b8:	00000793          	li	a5,0
   128bc:	fadff06f          	j	12868 <__truncdfsf2+0x120>

000128c0 <__clzsi2>:
   128c0:	000107b7          	lui	a5,0x10
   128c4:	02f57a63          	bgeu	a0,a5,128f8 <__clzsi2+0x38>
   128c8:	10053793          	sltiu	a5,a0,256
   128cc:	0017b793          	seqz	a5,a5
   128d0:	00379793          	slli	a5,a5,0x3
   128d4:	00013737          	lui	a4,0x13
   128d8:	02000693          	li	a3,32
   128dc:	40f686b3          	sub	a3,a3,a5
   128e0:	00f55533          	srl	a0,a0,a5
   128e4:	5cc70793          	addi	a5,a4,1484 # 135cc <__clz_tab>
   128e8:	00a787b3          	add	a5,a5,a0
   128ec:	0007c503          	lbu	a0,0(a5) # 10000 <__multf3+0xc08>
   128f0:	40a68533          	sub	a0,a3,a0
   128f4:	00008067          	ret
   128f8:	01000737          	lui	a4,0x1000
   128fc:	01800793          	li	a5,24
   12900:	fce57ae3          	bgeu	a0,a4,128d4 <__clzsi2+0x14>
   12904:	01000793          	li	a5,16
   12908:	fcdff06f          	j	128d4 <__clzsi2+0x14>
   1290c:	0000                	.insn	2, 0x
	...

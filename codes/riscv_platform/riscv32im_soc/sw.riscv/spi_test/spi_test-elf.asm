
spi_test.elf:     file format elf32-littleriscv


Disassembly of section .text:

00000000 <_start>:
       0:	00004197          	auipc	gp,0x4
       4:	fe018193          	addi	gp,gp,-32 # 3fe0 <__global_pointer$>
       8:	00020117          	auipc	sp,0x20
       c:	ff810113          	addi	sp,sp,-8 # 20000 <_memory_end>
      10:	00005e17          	auipc	t3,0x5
      14:	928e0e13          	addi	t3,t3,-1752 # 4938 <gpio_value>
      18:	00005e97          	auipc	t4,0x5
      1c:	a0be8e93          	addi	t4,t4,-1525 # 4a23 <_bss_end>
      20:	00c0006f          	j	2c <clear_bss_end>

00000024 <clear_bss32>:
      24:	000e2023          	sw	zero,0(t3)
      28:	004e0e13          	addi	t3,t3,4

0000002c <clear_bss_end>:
      2c:	ffde6ce3          	bltu	t3,t4,24 <clear_bss32>

00000030 <main_entry>:
      30:	00000513          	li	a0,0
      34:	00000593          	li	a1,0
      38:	194000ef          	jal	1cc <main>
      3c:	00040513          	mv	a0,s0

00000040 <terminate>:
      40:	00100293          	li	t0,1
      44:	00005317          	auipc	t1,0x5
      48:	89430313          	addi	t1,t1,-1900 # 48d8 <tohost>
      4c:	00532023          	sw	t0,0(t1)
      50:	0000006f          	j	50 <terminate+0x10>

00000054 <led_set>:
      54:	fe010113          	addi	sp,sp,-32
      58:	00112e23          	sw	ra,28(sp)
      5c:	00812c23          	sw	s0,24(sp)
      60:	02010413          	addi	s0,sp,32
      64:	00050793          	mv	a5,a0
      68:	fef407a3          	sb	a5,-17(s0)
      6c:	fef44703          	lbu	a4,-17(s0)
      70:	000057b7          	lui	a5,0x5
      74:	92e7ac23          	sw	a4,-1736(a5) # 4938 <gpio_value>
      78:	000057b7          	lui	a5,0x5
      7c:	9387a783          	lw	a5,-1736(a5) # 4938 <gpio_value>
      80:	00078513          	mv	a0,a5
      84:	6dc020ef          	jal	2760 <gpio_write>
      88:	00000013          	nop
      8c:	01c12083          	lw	ra,28(sp)
      90:	01812403          	lw	s0,24(sp)
      94:	02010113          	addi	sp,sp,32
      98:	00008067          	ret

0000009c <led_on>:
      9c:	ff010113          	addi	sp,sp,-16
      a0:	00112623          	sw	ra,12(sp)
      a4:	00812423          	sw	s0,8(sp)
      a8:	01010413          	addi	s0,sp,16
      ac:	0ff00513          	li	a0,255
      b0:	fa5ff0ef          	jal	54 <led_set>
      b4:	00000013          	nop
      b8:	00c12083          	lw	ra,12(sp)
      bc:	00812403          	lw	s0,8(sp)
      c0:	01010113          	addi	sp,sp,16
      c4:	00008067          	ret

000000c8 <led_off>:
      c8:	ff010113          	addi	sp,sp,-16
      cc:	00112623          	sw	ra,12(sp)
      d0:	00812423          	sw	s0,8(sp)
      d4:	01010413          	addi	s0,sp,16
      d8:	00000513          	li	a0,0
      dc:	f79ff0ef          	jal	54 <led_set>
      e0:	00000013          	nop
      e4:	00c12083          	lw	ra,12(sp)
      e8:	00812403          	lw	s0,8(sp)
      ec:	01010113          	addi	sp,sp,16
      f0:	00008067          	ret

000000f4 <delay_ms>:
      f4:	fd010113          	addi	sp,sp,-48
      f8:	02812623          	sw	s0,44(sp)
      fc:	03010413          	addi	s0,sp,48
     100:	fca42e23          	sw	a0,-36(s0)
     104:	fe042623          	sw	zero,-20(s0)
     108:	0300006f          	j	138 <delay_ms+0x44>
     10c:	fe042423          	sw	zero,-24(s0)
     110:	0100006f          	j	120 <delay_ms+0x2c>
     114:	fe842783          	lw	a5,-24(s0)
     118:	00178793          	addi	a5,a5,1
     11c:	fef42423          	sw	a5,-24(s0)
     120:	fe842703          	lw	a4,-24(s0)
     124:	3e700793          	li	a5,999
     128:	fee7f6e3          	bgeu	a5,a4,114 <delay_ms+0x20>
     12c:	fec42783          	lw	a5,-20(s0)
     130:	00178793          	addi	a5,a5,1
     134:	fef42623          	sw	a5,-20(s0)
     138:	fec42783          	lw	a5,-20(s0)
     13c:	fdc42703          	lw	a4,-36(s0)
     140:	fce7e6e3          	bltu	a5,a4,10c <delay_ms+0x18>
     144:	00000013          	nop
     148:	00000013          	nop
     14c:	02c12403          	lw	s0,44(sp)
     150:	03010113          	addi	sp,sp,48
     154:	00008067          	ret

00000158 <check_uid>:
     158:	fd010113          	addi	sp,sp,-48
     15c:	02812623          	sw	s0,44(sp)
     160:	03010413          	addi	s0,sp,48
     164:	fca42e23          	sw	a0,-36(s0)
     168:	fe042623          	sw	zero,-20(s0)
     16c:	0400006f          	j	1ac <check_uid+0x54>
     170:	fec42783          	lw	a5,-20(s0)
     174:	fdc42703          	lw	a4,-36(s0)
     178:	00f707b3          	add	a5,a4,a5
     17c:	0007c703          	lbu	a4,0(a5)
     180:	000057b7          	lui	a5,0x5
     184:	8d478693          	addi	a3,a5,-1836 # 48d4 <MASTER_UID>
     188:	fec42783          	lw	a5,-20(s0)
     18c:	00f687b3          	add	a5,a3,a5
     190:	0007c783          	lbu	a5,0(a5)
     194:	00f70663          	beq	a4,a5,1a0 <check_uid+0x48>
     198:	00000793          	li	a5,0
     19c:	0200006f          	j	1bc <check_uid+0x64>
     1a0:	fec42783          	lw	a5,-20(s0)
     1a4:	00178793          	addi	a5,a5,1
     1a8:	fef42623          	sw	a5,-20(s0)
     1ac:	fec42703          	lw	a4,-20(s0)
     1b0:	00300793          	li	a5,3
     1b4:	fae7dee3          	bge	a5,a4,170 <check_uid+0x18>
     1b8:	00100793          	li	a5,1
     1bc:	00078513          	mv	a0,a5
     1c0:	02c12403          	lw	s0,44(sp)
     1c4:	03010113          	addi	sp,sp,48
     1c8:	00008067          	ret

000001cc <main>:
     1cc:	fd010113          	addi	sp,sp,-48
     1d0:	02112623          	sw	ra,44(sp)
     1d4:	02812423          	sw	s0,40(sp)
     1d8:	03010413          	addi	s0,sp,48
     1dc:	90020537          	lui	a0,0x90020
     1e0:	16c010ef          	jal	134c <uart_set_addr>
     1e4:	00100713          	li	a4,1
     1e8:	00000693          	li	a3,0
     1ec:	00800613          	li	a2,8
     1f0:	0001c7b7          	lui	a5,0x1c
     1f4:	20078593          	addi	a1,a5,512 # 1c200 <_bss_end+0x177dd>
     1f8:	05f5e7b7          	lui	a5,0x5f5e
     1fc:	10078513          	addi	a0,a5,256 # 5f5e100 <_memory_end+0x5f3e100>
     200:	2b1000ef          	jal	cb0 <uart_init>
     204:	fc042a23          	sw	zero,-44(s0)
     208:	0100006f          	j	218 <main+0x4c>
     20c:	fd442783          	lw	a5,-44(s0)
     210:	00178793          	addi	a5,a5,1
     214:	fcf42a23          	sw	a5,-44(s0)
     218:	fd442703          	lw	a4,-44(s0)
     21c:	000187b7          	lui	a5,0x18
     220:	69f78793          	addi	a5,a5,1695 # 1869f <_bss_end+0x13c7c>
     224:	fee7d4e3          	bge	a5,a4,20c <main+0x40>
     228:	00018513          	mv	a0,gp
     22c:	458000ef          	jal	684 <my_printf>
     230:	02018513          	addi	a0,gp,32 # 4000 <__global_pointer$+0x20>
     234:	450000ef          	jal	684 <my_printf>
     238:	fc042a23          	sw	zero,-44(s0)
     23c:	0100006f          	j	24c <main+0x80>
     240:	fd442783          	lw	a5,-44(s0)
     244:	00178793          	addi	a5,a5,1
     248:	fcf42a23          	sw	a5,-44(s0)
     24c:	fd442703          	lw	a4,-44(s0)
     250:	000187b7          	lui	a5,0x18
     254:	69f78793          	addi	a5,a5,1695 # 1869f <_bss_end+0x13c7c>
     258:	fee7d4e3          	bge	a5,a4,240 <main+0x74>
     25c:	90030537          	lui	a0,0x90030
     260:	071020ef          	jal	2ad0 <gpio_set_addr>
     264:	00000693          	li	a3,0
     268:	00000613          	li	a2,0
     26c:	00000593          	li	a1,0
     270:	0ff00513          	li	a0,255
     274:	520020ef          	jal	2794 <gpio_init>
     278:	e51ff0ef          	jal	c8 <led_off>
     27c:	03c18513          	addi	a0,gp,60 # 401c <__global_pointer$+0x3c>
     280:	404000ef          	jal	684 <my_printf>
     284:	06418513          	addi	a0,gp,100 # 4044 <__global_pointer$+0x64>
     288:	3fc000ef          	jal	684 <my_printf>
     28c:	a0000537          	lui	a0,0xa0000
     290:	178010ef          	jal	1408 <spi_set_addr>
     294:	228010ef          	jal	14bc <spi_init>
     298:	09018513          	addi	a0,gp,144 # 4070 <__global_pointer$+0x90>
     29c:	3e8000ef          	jal	684 <my_printf>
     2a0:	0b818513          	addi	a0,gp,184 # 4098 <__global_pointer$+0xb8>
     2a4:	3e0000ef          	jal	684 <my_printf>
     2a8:	0e018513          	addi	a0,gp,224 # 40c0 <__global_pointer$+0xe0>
     2ac:	3d8000ef          	jal	684 <my_printf>
     2b0:	00f00593          	li	a1,15
     2b4:	00100513          	li	a0,1
     2b8:	350010ef          	jal	1608 <MFRC522_WriteReg>
     2bc:	00a00513          	li	a0,10
     2c0:	e35ff0ef          	jal	f4 <delay_ms>
     2c4:	10018513          	addi	a0,gp,256 # 40e0 <__global_pointer$+0x100>
     2c8:	3bc000ef          	jal	684 <my_printf>
     2cc:	13418513          	addi	a0,gp,308 # 4114 <__global_pointer$+0x134>
     2d0:	3b4000ef          	jal	684 <my_printf>
     2d4:	03700513          	li	a0,55
     2d8:	390010ef          	jal	1668 <MFRC522_ReadReg>
     2dc:	00050793          	mv	a5,a0
     2e0:	fef403a3          	sb	a5,-25(s0)
     2e4:	fe744783          	lbu	a5,-25(s0)
     2e8:	00078593          	mv	a1,a5
     2ec:	15418513          	addi	a0,gp,340 # 4134 <__global_pointer$+0x154>
     2f0:	394000ef          	jal	684 <my_printf>
     2f4:	17018513          	addi	a0,gp,368 # 4150 <__global_pointer$+0x170>
     2f8:	38c000ef          	jal	684 <my_printf>
     2fc:	054020ef          	jal	2350 <card_db_init>
     300:	3f0020ef          	jal	26f0 <card_db_count>
     304:	00050793          	mv	a5,a0
     308:	00078593          	mv	a1,a5
     30c:	19c18513          	addi	a0,gp,412 # 417c <__global_pointer$+0x19c>
     310:	374000ef          	jal	684 <my_printf>
     314:	1bc18513          	addi	a0,gp,444 # 419c <__global_pointer$+0x1bc>
     318:	36c000ef          	jal	684 <my_printf>
     31c:	1c018513          	addi	a0,gp,448 # 41a0 <__global_pointer$+0x1c0>
     320:	364000ef          	jal	684 <my_printf>
     324:	1ec18513          	addi	a0,gp,492 # 41cc <__global_pointer$+0x1ec>
     328:	35c000ef          	jal	684 <my_printf>
     32c:	1c018513          	addi	a0,gp,448 # 41a0 <__global_pointer$+0x1c0>
     330:	354000ef          	jal	684 <my_printf>
     334:	1bc18513          	addi	a0,gp,444 # 419c <__global_pointer$+0x1bc>
     338:	34c000ef          	jal	684 <my_printf>
     33c:	20c18513          	addi	a0,gp,524 # 41ec <__global_pointer$+0x20c>
     340:	344000ef          	jal	684 <my_printf>
     344:	22818513          	addi	a0,gp,552 # 4208 <__global_pointer$+0x228>
     348:	33c000ef          	jal	684 <my_printf>
     34c:	03700513          	li	a0,55
     350:	318010ef          	jal	1668 <MFRC522_ReadReg>
     354:	00050793          	mv	a5,a0
     358:	fef40323          	sb	a5,-26(s0)
     35c:	fe644783          	lbu	a5,-26(s0)
     360:	00078593          	mv	a1,a5
     364:	25818513          	addi	a0,gp,600 # 4238 <__global_pointer$+0x258>
     368:	31c000ef          	jal	684 <my_printf>
     36c:	01100513          	li	a0,17
     370:	2f8010ef          	jal	1668 <MFRC522_ReadReg>
     374:	00050793          	mv	a5,a0
     378:	fef402a3          	sb	a5,-27(s0)
     37c:	fe544783          	lbu	a5,-27(s0)
     380:	00078593          	mv	a1,a5
     384:	27818513          	addi	a0,gp,632 # 4258 <__global_pointer$+0x278>
     388:	2fc000ef          	jal	684 <my_printf>
     38c:	00100513          	li	a0,1
     390:	2d8010ef          	jal	1668 <MFRC522_ReadReg>
     394:	00050793          	mv	a5,a0
     398:	fef40223          	sb	a5,-28(s0)
     39c:	fe444783          	lbu	a5,-28(s0)
     3a0:	00078593          	mv	a1,a5
     3a4:	29818513          	addi	a0,gp,664 # 4278 <__global_pointer$+0x298>
     3a8:	2dc000ef          	jal	684 <my_printf>
     3ac:	00700513          	li	a0,7
     3b0:	2b8010ef          	jal	1668 <MFRC522_ReadReg>
     3b4:	00050793          	mv	a5,a0
     3b8:	fef401a3          	sb	a5,-29(s0)
     3bc:	fe344783          	lbu	a5,-29(s0)
     3c0:	00078593          	mv	a1,a5
     3c4:	2b818513          	addi	a0,gp,696 # 4298 <__global_pointer$+0x2b8>
     3c8:	2bc000ef          	jal	684 <my_printf>
     3cc:	2d818513          	addi	a0,gp,728 # 42b8 <__global_pointer$+0x2d8>
     3d0:	2b4000ef          	jal	684 <my_printf>
     3d4:	2f818513          	addi	a0,gp,760 # 42d8 <__global_pointer$+0x2f8>
     3d8:	2ac000ef          	jal	684 <my_printf>
     3dc:	0aa00593          	li	a1,170
     3e0:	01100513          	li	a0,17
     3e4:	224010ef          	jal	1608 <MFRC522_WriteReg>
     3e8:	00a00513          	li	a0,10
     3ec:	d09ff0ef          	jal	f4 <delay_ms>
     3f0:	01100513          	li	a0,17
     3f4:	274010ef          	jal	1668 <MFRC522_ReadReg>
     3f8:	00050793          	mv	a5,a0
     3fc:	fef40123          	sb	a5,-30(s0)
     400:	fe244683          	lbu	a3,-30(s0)
     404:	fe244703          	lbu	a4,-30(s0)
     408:	0aa00793          	li	a5,170
     40c:	00f71663          	bne	a4,a5,418 <main+0x24c>
     410:	32018793          	addi	a5,gp,800 # 4300 <__global_pointer$+0x320>
     414:	0080006f          	j	41c <main+0x250>
     418:	32c18793          	addi	a5,gp,812 # 430c <__global_pointer$+0x32c>
     41c:	00078613          	mv	a2,a5
     420:	00068593          	mv	a1,a3
     424:	33c18513          	addi	a0,gp,828 # 431c <__global_pointer$+0x33c>
     428:	25c000ef          	jal	684 <my_printf>
     42c:	35818513          	addi	a0,gp,856 # 4338 <__global_pointer$+0x358>
     430:	254000ef          	jal	684 <my_printf>
     434:	fe0407a3          	sb	zero,-17(s0)
     438:	0440006f          	j	47c <main+0x2b0>
     43c:	03700513          	li	a0,55
     440:	228010ef          	jal	1668 <MFRC522_ReadReg>
     444:	00050793          	mv	a5,a0
     448:	fcf40da3          	sb	a5,-37(s0)
     44c:	fef44783          	lbu	a5,-17(s0)
     450:	00178793          	addi	a5,a5,1
     454:	fdb44703          	lbu	a4,-37(s0)
     458:	00070613          	mv	a2,a4
     45c:	00078593          	mv	a1,a5
     460:	39818513          	addi	a0,gp,920 # 4378 <__global_pointer$+0x398>
     464:	220000ef          	jal	684 <my_printf>
     468:	03200513          	li	a0,50
     46c:	c89ff0ef          	jal	f4 <delay_ms>
     470:	fef44783          	lbu	a5,-17(s0)
     474:	00178793          	addi	a5,a5,1
     478:	fef407a3          	sb	a5,-17(s0)
     47c:	fef44703          	lbu	a4,-17(s0)
     480:	00400793          	li	a5,4
     484:	fae7fce3          	bgeu	a5,a4,43c <main+0x270>
     488:	3a818513          	addi	a0,gp,936 # 4388 <__global_pointer$+0x3a8>
     48c:	1f8000ef          	jal	684 <my_printf>
     490:	fe644783          	lbu	a5,-26(s0)
     494:	00078863          	beqz	a5,4a4 <main+0x2d8>
     498:	fe644703          	lbu	a4,-26(s0)
     49c:	0ff00793          	li	a5,255
     4a0:	02f71063          	bne	a4,a5,4c0 <main+0x2f4>
     4a4:	fe644783          	lbu	a5,-26(s0)
     4a8:	00078593          	mv	a1,a5
     4ac:	3b818513          	addi	a0,gp,952 # 4398 <__global_pointer$+0x3b8>
     4b0:	1d4000ef          	jal	684 <my_printf>
     4b4:	3e818513          	addi	a0,gp,1000 # 43c8 <__global_pointer$+0x3e8>
     4b8:	1cc000ef          	jal	684 <my_printf>
     4bc:	0380006f          	j	4f4 <main+0x328>
     4c0:	fe644703          	lbu	a4,-26(s0)
     4c4:	09100793          	li	a5,145
     4c8:	00f70863          	beq	a4,a5,4d8 <main+0x30c>
     4cc:	fe644703          	lbu	a4,-26(s0)
     4d0:	09200793          	li	a5,146
     4d4:	00f71863          	bne	a4,a5,4e4 <main+0x318>
     4d8:	40c18513          	addi	a0,gp,1036 # 43ec <__global_pointer$+0x40c>
     4dc:	1a8000ef          	jal	684 <my_printf>
     4e0:	0140006f          	j	4f4 <main+0x328>
     4e4:	fe644783          	lbu	a5,-26(s0)
     4e8:	00078593          	mv	a1,a5
     4ec:	43418513          	addi	a0,gp,1076 # 4414 <__global_pointer$+0x434>
     4f0:	194000ef          	jal	684 <my_printf>
     4f4:	45818513          	addi	a0,gp,1112 # 4438 <__global_pointer$+0x458>
     4f8:	18c000ef          	jal	684 <my_printf>
     4fc:	fe042423          	sw	zero,-24(s0)
     500:	0440006f          	j	544 <main+0x378>
     504:	2c9000ef          	jal	fcc <uart_get_char_nb>
     508:	fca42e23          	sw	a0,-36(s0)
     50c:	fdc42703          	lw	a4,-36(s0)
     510:	07100793          	li	a5,113
     514:	00f70863          	beq	a4,a5,524 <main+0x358>
     518:	fdc42703          	lw	a4,-36(s0)
     51c:	05100793          	li	a5,81
     520:	00f71863          	bne	a4,a5,530 <main+0x364>
     524:	49018513          	addi	a0,gp,1168 # 4470 <__global_pointer$+0x490>
     528:	15c000ef          	jal	684 <my_printf>
     52c:	0280006f          	j	554 <main+0x388>
     530:	06400513          	li	a0,100
     534:	bc1ff0ef          	jal	f4 <delay_ms>
     538:	fe842783          	lw	a5,-24(s0)
     53c:	00178793          	addi	a5,a5,1
     540:	fef42423          	sw	a5,-24(s0)
     544:	fe842703          	lw	a4,-24(s0)
     548:	01d00793          	li	a5,29
     54c:	fae7dce3          	bge	a5,a4,504 <main+0x338>
     550:	dedff06f          	j	33c <main+0x170>
     554:	4a818513          	addi	a0,gp,1192 # 4488 <__global_pointer$+0x4a8>
     558:	12c000ef          	jal	684 <my_printf>
     55c:	00000793          	li	a5,0
     560:	00078513          	mv	a0,a5
     564:	02c12083          	lw	ra,44(sp)
     568:	02812403          	lw	s0,40(sp)
     56c:	03010113          	addi	sp,sp,48
     570:	00008067          	ret

00000574 <my_putc>:
     574:	fe010113          	addi	sp,sp,-32
     578:	00112e23          	sw	ra,28(sp)
     57c:	00812c23          	sw	s0,24(sp)
     580:	02010413          	addi	s0,sp,32
     584:	fea42623          	sw	a0,-20(s0)
     588:	feb42423          	sw	a1,-24(s0)
     58c:	fec42783          	lw	a5,-20(s0)
     590:	0ff7f793          	zext.b	a5,a5
     594:	00078513          	mv	a0,a5
     598:	281000ef          	jal	1018 <uart_put_char>
     59c:	00050793          	mv	a5,a0
     5a0:	00078513          	mv	a0,a5
     5a4:	01c12083          	lw	ra,28(sp)
     5a8:	01812403          	lw	s0,24(sp)
     5ac:	02010113          	addi	sp,sp,32
     5b0:	00008067          	ret

000005b4 <my_putchar>:
     5b4:	fe010113          	addi	sp,sp,-32
     5b8:	00112e23          	sw	ra,28(sp)
     5bc:	00812c23          	sw	s0,24(sp)
     5c0:	02010413          	addi	s0,sp,32
     5c4:	fea42623          	sw	a0,-20(s0)
     5c8:	fec42783          	lw	a5,-20(s0)
     5cc:	0ff7f793          	zext.b	a5,a5
     5d0:	00078513          	mv	a0,a5
     5d4:	245000ef          	jal	1018 <uart_put_char>
     5d8:	00050793          	mv	a5,a0
     5dc:	00078513          	mv	a0,a5
     5e0:	01c12083          	lw	ra,28(sp)
     5e4:	01812403          	lw	s0,24(sp)
     5e8:	02010113          	addi	sp,sp,32
     5ec:	00008067          	ret

000005f0 <my_getc>:
     5f0:	fe010113          	addi	sp,sp,-32
     5f4:	00112e23          	sw	ra,28(sp)
     5f8:	00812c23          	sw	s0,24(sp)
     5fc:	02010413          	addi	s0,sp,32
     600:	fea42623          	sw	a0,-20(s0)
     604:	185000ef          	jal	f88 <uart_get_char>
     608:	00050793          	mv	a5,a0
     60c:	00078513          	mv	a0,a5
     610:	01c12083          	lw	ra,28(sp)
     614:	01812403          	lw	s0,24(sp)
     618:	02010113          	addi	sp,sp,32
     61c:	00008067          	ret

00000620 <my_getchar>:
     620:	ff010113          	addi	sp,sp,-16
     624:	00112623          	sw	ra,12(sp)
     628:	00812423          	sw	s0,8(sp)
     62c:	01010413          	addi	s0,sp,16
     630:	159000ef          	jal	f88 <uart_get_char>
     634:	00050793          	mv	a5,a0
     638:	00078513          	mv	a0,a5
     63c:	00c12083          	lw	ra,12(sp)
     640:	00812403          	lw	s0,8(sp)
     644:	01010113          	addi	sp,sp,16
     648:	00008067          	ret

0000064c <my_puts>:
     64c:	fd010113          	addi	sp,sp,-48
     650:	02112623          	sw	ra,44(sp)
     654:	02812423          	sw	s0,40(sp)
     658:	03010413          	addi	s0,sp,48
     65c:	fca42e23          	sw	a0,-36(s0)
     660:	fdc42503          	lw	a0,-36(s0)
     664:	21d000ef          	jal	1080 <uart_put_string>
     668:	fea42623          	sw	a0,-20(s0)
     66c:	fec42783          	lw	a5,-20(s0)
     670:	00078513          	mv	a0,a5
     674:	02c12083          	lw	ra,44(sp)
     678:	02812403          	lw	s0,40(sp)
     67c:	03010113          	addi	sp,sp,48
     680:	00008067          	ret

00000684 <my_printf>:
     684:	fb010113          	addi	sp,sp,-80
     688:	02112623          	sw	ra,44(sp)
     68c:	02812423          	sw	s0,40(sp)
     690:	03010413          	addi	s0,sp,48
     694:	fca42e23          	sw	a0,-36(s0)
     698:	00b42223          	sw	a1,4(s0)
     69c:	00c42423          	sw	a2,8(s0)
     6a0:	00d42623          	sw	a3,12(s0)
     6a4:	00e42823          	sw	a4,16(s0)
     6a8:	00f42a23          	sw	a5,20(s0)
     6ac:	01042c23          	sw	a6,24(s0)
     6b0:	01142e23          	sw	a7,28(s0)
     6b4:	02040793          	addi	a5,s0,32
     6b8:	fcf42c23          	sw	a5,-40(s0)
     6bc:	fd842783          	lw	a5,-40(s0)
     6c0:	fe478793          	addi	a5,a5,-28
     6c4:	fef42423          	sw	a5,-24(s0)
     6c8:	fe842783          	lw	a5,-24(s0)
     6cc:	00078593          	mv	a1,a5
     6d0:	fdc42503          	lw	a0,-36(s0)
     6d4:	28c000ef          	jal	960 <my_vprintf>
     6d8:	fea42623          	sw	a0,-20(s0)
     6dc:	fec42783          	lw	a5,-20(s0)
     6e0:	00078513          	mv	a0,a5
     6e4:	02c12083          	lw	ra,44(sp)
     6e8:	02812403          	lw	s0,40(sp)
     6ec:	05010113          	addi	sp,sp,80
     6f0:	00008067          	ret

000006f4 <my_printn>:
     6f4:	fd010113          	addi	sp,sp,-48
     6f8:	02112623          	sw	ra,44(sp)
     6fc:	02812423          	sw	s0,40(sp)
     700:	03010413          	addi	s0,sp,48
     704:	fca42e23          	sw	a0,-36(s0)
     708:	fcb42c23          	sw	a1,-40(s0)
     70c:	fcc42a23          	sw	a2,-44(s0)
     710:	fe042623          	sw	zero,-20(s0)
     714:	fd842703          	lw	a4,-40(s0)
     718:	00a00793          	li	a5,10
     71c:	02f71863          	bne	a4,a5,74c <my_printn+0x58>
     720:	fdc42783          	lw	a5,-36(s0)
     724:	0207d463          	bgez	a5,74c <my_printn+0x58>
     728:	02d00513          	li	a0,45
     72c:	0ed000ef          	jal	1018 <uart_put_char>
     730:	00050713          	mv	a4,a0
     734:	fec42783          	lw	a5,-20(s0)
     738:	00f707b3          	add	a5,a4,a5
     73c:	fef42623          	sw	a5,-20(s0)
     740:	fdc42783          	lw	a5,-36(s0)
     744:	40f007b3          	neg	a5,a5
     748:	fcf42e23          	sw	a5,-36(s0)
     74c:	fd842783          	lw	a5,-40(s0)
     750:	fdc42703          	lw	a4,-36(s0)
     754:	02f757b3          	divu	a5,a4,a5
     758:	fef42423          	sw	a5,-24(s0)
     75c:	fe842783          	lw	a5,-24(s0)
     760:	00079863          	bnez	a5,770 <my_printn+0x7c>
     764:	fd442703          	lw	a4,-44(s0)
     768:	00100793          	li	a5,1
     76c:	02e7d863          	bge	a5,a4,79c <my_printn+0xa8>
     770:	fd442783          	lw	a5,-44(s0)
     774:	fff78793          	addi	a5,a5,-1
     778:	fcf42a23          	sw	a5,-44(s0)
     77c:	fd442603          	lw	a2,-44(s0)
     780:	fd842583          	lw	a1,-40(s0)
     784:	fe842503          	lw	a0,-24(s0)
     788:	f6dff0ef          	jal	6f4 <my_printn>
     78c:	00050713          	mv	a4,a0
     790:	fec42783          	lw	a5,-20(s0)
     794:	00e787b3          	add	a5,a5,a4
     798:	fef42623          	sw	a5,-20(s0)
     79c:	fd842783          	lw	a5,-40(s0)
     7a0:	fdc42703          	lw	a4,-36(s0)
     7a4:	02f777b3          	remu	a5,a4,a5
     7a8:	00078713          	mv	a4,a5
     7ac:	4c418793          	addi	a5,gp,1220 # 44a4 <__global_pointer$+0x4c4>
     7b0:	00e787b3          	add	a5,a5,a4
     7b4:	0007c783          	lbu	a5,0(a5)
     7b8:	00078513          	mv	a0,a5
     7bc:	05d000ef          	jal	1018 <uart_put_char>
     7c0:	00050713          	mv	a4,a0
     7c4:	fec42783          	lw	a5,-20(s0)
     7c8:	00f707b3          	add	a5,a4,a5
     7cc:	fef42623          	sw	a5,-20(s0)
     7d0:	fec42783          	lw	a5,-20(s0)
     7d4:	00078513          	mv	a0,a5
     7d8:	02c12083          	lw	ra,44(sp)
     7dc:	02812403          	lw	s0,40(sp)
     7e0:	03010113          	addi	sp,sp,48
     7e4:	00008067          	ret

000007e8 <my_printflt>:
     7e8:	fd010113          	addi	sp,sp,-48
     7ec:	02112623          	sw	ra,44(sp)
     7f0:	02812423          	sw	s0,40(sp)
     7f4:	03010413          	addi	s0,sp,48
     7f8:	fca42e23          	sw	a0,-36(s0)
     7fc:	fcb42c23          	sw	a1,-40(s0)
     800:	fe042423          	sw	zero,-24(s0)
     804:	00000593          	li	a1,0
     808:	fdc42503          	lw	a0,-36(s0)
     80c:	4a1020ef          	jal	34ac <__lesf2>
     810:	00050793          	mv	a5,a0
     814:	0207d663          	bgez	a5,840 <my_printflt+0x58>
     818:	02d00513          	li	a0,45
     81c:	7fc000ef          	jal	1018 <uart_put_char>
     820:	00050713          	mv	a4,a0
     824:	fe842783          	lw	a5,-24(s0)
     828:	00f707b3          	add	a5,a4,a5
     82c:	fef42423          	sw	a5,-24(s0)
     830:	fdc42703          	lw	a4,-36(s0)
     834:	800007b7          	lui	a5,0x80000
     838:	00f747b3          	xor	a5,a4,a5
     83c:	fcf42e23          	sw	a5,-36(s0)
     840:	fdc42503          	lw	a0,-36(s0)
     844:	460030ef          	jal	3ca4 <__fixsfsi>
     848:	00050793          	mv	a5,a0
     84c:	fef42223          	sw	a5,-28(s0)
     850:	fe442783          	lw	a5,-28(s0)
     854:	fd842603          	lw	a2,-40(s0)
     858:	00a00593          	li	a1,10
     85c:	00078513          	mv	a0,a5
     860:	e95ff0ef          	jal	6f4 <my_printn>
     864:	00050713          	mv	a4,a0
     868:	fe842783          	lw	a5,-24(s0)
     86c:	00e787b3          	add	a5,a5,a4
     870:	fef42423          	sw	a5,-24(s0)
     874:	02e00513          	li	a0,46
     878:	7a0000ef          	jal	1018 <uart_put_char>
     87c:	00050713          	mv	a4,a0
     880:	fe842783          	lw	a5,-24(s0)
     884:	00f707b3          	add	a5,a4,a5
     888:	fef42423          	sw	a5,-24(s0)
     88c:	fe442503          	lw	a0,-28(s0)
     890:	484030ef          	jal	3d14 <__floatsisf>
     894:	00050793          	mv	a5,a0
     898:	00078593          	mv	a1,a5
     89c:	fdc42503          	lw	a0,-36(s0)
     8a0:	7d5020ef          	jal	3874 <__subsf3>
     8a4:	00050793          	mv	a5,a0
     8a8:	fcf42e23          	sw	a5,-36(s0)
     8ac:	fe042623          	sw	zero,-20(s0)
     8b0:	5301a583          	lw	a1,1328(gp) # 4510 <__global_pointer$+0x530>
     8b4:	fdc42503          	lw	a0,-36(s0)
     8b8:	4a1020ef          	jal	3558 <__mulsf3>
     8bc:	00050793          	mv	a5,a0
     8c0:	fcf42e23          	sw	a5,-36(s0)
     8c4:	fdc42503          	lw	a0,-36(s0)
     8c8:	3dc030ef          	jal	3ca4 <__fixsfsi>
     8cc:	00050793          	mv	a5,a0
     8d0:	fef42223          	sw	a5,-28(s0)
     8d4:	fe442783          	lw	a5,-28(s0)
     8d8:	0ff7f793          	zext.b	a5,a5
     8dc:	03078793          	addi	a5,a5,48 # 80000030 <_memory_end+0x7ffe0030>
     8e0:	0ff7f793          	zext.b	a5,a5
     8e4:	00078513          	mv	a0,a5
     8e8:	730000ef          	jal	1018 <uart_put_char>
     8ec:	00050713          	mv	a4,a0
     8f0:	fe842783          	lw	a5,-24(s0)
     8f4:	00f707b3          	add	a5,a4,a5
     8f8:	fef42423          	sw	a5,-24(s0)
     8fc:	fe442503          	lw	a0,-28(s0)
     900:	414030ef          	jal	3d14 <__floatsisf>
     904:	00050793          	mv	a5,a0
     908:	00078593          	mv	a1,a5
     90c:	fdc42503          	lw	a0,-36(s0)
     910:	765020ef          	jal	3874 <__subsf3>
     914:	00050793          	mv	a5,a0
     918:	fcf42e23          	sw	a5,-36(s0)
     91c:	fec42783          	lw	a5,-20(s0)
     920:	00178793          	addi	a5,a5,1
     924:	fef42623          	sw	a5,-20(s0)
     928:	00000593          	li	a1,0
     92c:	fdc42503          	lw	a0,-36(s0)
     930:	315020ef          	jal	3444 <__eqsf2>
     934:	00050793          	mv	a5,a0
     938:	00078863          	beqz	a5,948 <my_printflt+0x160>
     93c:	fec42703          	lw	a4,-20(s0)
     940:	00500793          	li	a5,5
     944:	f6e7d6e3          	bge	a5,a4,8b0 <my_printflt+0xc8>
     948:	fe842783          	lw	a5,-24(s0)
     94c:	00078513          	mv	a0,a5
     950:	02c12083          	lw	ra,44(sp)
     954:	02812403          	lw	s0,40(sp)
     958:	03010113          	addi	sp,sp,48
     95c:	00008067          	ret

00000960 <my_vprintf>:
     960:	fc010113          	addi	sp,sp,-64
     964:	02112e23          	sw	ra,60(sp)
     968:	02812c23          	sw	s0,56(sp)
     96c:	04010413          	addi	s0,sp,64
     970:	fca42623          	sw	a0,-52(s0)
     974:	fcb42423          	sw	a1,-56(s0)
     978:	fe042023          	sw	zero,-32(s0)
     97c:	3000006f          	j	c7c <my_vprintf+0x31c>
     980:	fe842703          	lw	a4,-24(s0)
     984:	02500793          	li	a5,37
     988:	2cf71063          	bne	a4,a5,c48 <my_vprintf+0x2e8>
     98c:	fcc42783          	lw	a5,-52(s0)
     990:	0007c783          	lbu	a5,0(a5)
     994:	fef42423          	sw	a5,-24(s0)
     998:	fe042623          	sw	zero,-20(s0)
     99c:	0440006f          	j	9e0 <my_vprintf+0x80>
     9a0:	fec42703          	lw	a4,-20(s0)
     9a4:	00070793          	mv	a5,a4
     9a8:	00279793          	slli	a5,a5,0x2
     9ac:	00e787b3          	add	a5,a5,a4
     9b0:	00179793          	slli	a5,a5,0x1
     9b4:	00078713          	mv	a4,a5
     9b8:	fe842783          	lw	a5,-24(s0)
     9bc:	00f707b3          	add	a5,a4,a5
     9c0:	fd078793          	addi	a5,a5,-48
     9c4:	fef42623          	sw	a5,-20(s0)
     9c8:	fcc42783          	lw	a5,-52(s0)
     9cc:	00178793          	addi	a5,a5,1
     9d0:	fcf42623          	sw	a5,-52(s0)
     9d4:	fcc42783          	lw	a5,-52(s0)
     9d8:	0007c783          	lbu	a5,0(a5)
     9dc:	fef42423          	sw	a5,-24(s0)
     9e0:	fe842703          	lw	a4,-24(s0)
     9e4:	02f00793          	li	a5,47
     9e8:	00e7d863          	bge	a5,a4,9f8 <my_vprintf+0x98>
     9ec:	fe842703          	lw	a4,-24(s0)
     9f0:	03900793          	li	a5,57
     9f4:	fae7d6e3          	bge	a5,a4,9a0 <my_vprintf+0x40>
     9f8:	fcc42783          	lw	a5,-52(s0)
     9fc:	00178713          	addi	a4,a5,1
     a00:	fce42623          	sw	a4,-52(s0)
     a04:	0007c783          	lbu	a5,0(a5)
     a08:	fef42423          	sw	a5,-24(s0)
     a0c:	fe842703          	lw	a4,-24(s0)
     a10:	02500793          	li	a5,37
     a14:	1ef70863          	beq	a4,a5,c04 <my_vprintf+0x2a4>
     a18:	fe842703          	lw	a4,-24(s0)
     a1c:	02500793          	li	a5,37
     a20:	20f74063          	blt	a4,a5,c20 <my_vprintf+0x2c0>
     a24:	fe842703          	lw	a4,-24(s0)
     a28:	07800793          	li	a5,120
     a2c:	1ee7ca63          	blt	a5,a4,c20 <my_vprintf+0x2c0>
     a30:	fe842703          	lw	a4,-24(s0)
     a34:	06300793          	li	a5,99
     a38:	1ef74463          	blt	a4,a5,c20 <my_vprintf+0x2c0>
     a3c:	fe842783          	lw	a5,-24(s0)
     a40:	f9d78793          	addi	a5,a5,-99
     a44:	01500713          	li	a4,21
     a48:	1cf76c63          	bltu	a4,a5,c20 <my_vprintf+0x2c0>
     a4c:	00279713          	slli	a4,a5,0x2
     a50:	4d818793          	addi	a5,gp,1240 # 44b8 <__global_pointer$+0x4d8>
     a54:	00f707b3          	add	a5,a4,a5
     a58:	0007a783          	lw	a5,0(a5)
     a5c:	00078067          	jr	a5
     a60:	fc842783          	lw	a5,-56(s0)
     a64:	00478713          	addi	a4,a5,4
     a68:	fce42423          	sw	a4,-56(s0)
     a6c:	0007a783          	lw	a5,0(a5)
     a70:	fcf40ba3          	sb	a5,-41(s0)
     a74:	fd744783          	lbu	a5,-41(s0)
     a78:	00078513          	mv	a0,a5
     a7c:	59c000ef          	jal	1018 <uart_put_char>
     a80:	00050713          	mv	a4,a0
     a84:	fe042783          	lw	a5,-32(s0)
     a88:	00f707b3          	add	a5,a4,a5
     a8c:	fef42023          	sw	a5,-32(s0)
     a90:	1ec0006f          	j	c7c <my_vprintf+0x31c>
     a94:	fc842783          	lw	a5,-56(s0)
     a98:	00478713          	addi	a4,a5,4
     a9c:	fce42423          	sw	a4,-56(s0)
     aa0:	0007a783          	lw	a5,0(a5)
     aa4:	fcf42e23          	sw	a5,-36(s0)
     aa8:	fdc42783          	lw	a5,-36(s0)
     aac:	fec42603          	lw	a2,-20(s0)
     ab0:	00800593          	li	a1,8
     ab4:	00078513          	mv	a0,a5
     ab8:	c3dff0ef          	jal	6f4 <my_printn>
     abc:	00050713          	mv	a4,a0
     ac0:	fe042783          	lw	a5,-32(s0)
     ac4:	00e787b3          	add	a5,a5,a4
     ac8:	fef42023          	sw	a5,-32(s0)
     acc:	1b00006f          	j	c7c <my_vprintf+0x31c>
     ad0:	fc842783          	lw	a5,-56(s0)
     ad4:	00478713          	addi	a4,a5,4
     ad8:	fce42423          	sw	a4,-56(s0)
     adc:	0007a783          	lw	a5,0(a5)
     ae0:	fcf42e23          	sw	a5,-36(s0)
     ae4:	fdc42783          	lw	a5,-36(s0)
     ae8:	fec42603          	lw	a2,-20(s0)
     aec:	00a00593          	li	a1,10
     af0:	00078513          	mv	a0,a5
     af4:	c01ff0ef          	jal	6f4 <my_printn>
     af8:	00050713          	mv	a4,a0
     afc:	fe042783          	lw	a5,-32(s0)
     b00:	00e787b3          	add	a5,a5,a4
     b04:	fef42023          	sw	a5,-32(s0)
     b08:	1740006f          	j	c7c <my_vprintf+0x31c>
     b0c:	fc842783          	lw	a5,-56(s0)
     b10:	00478713          	addi	a4,a5,4
     b14:	fce42423          	sw	a4,-56(s0)
     b18:	0007a783          	lw	a5,0(a5)
     b1c:	fcf42e23          	sw	a5,-36(s0)
     b20:	fdc42783          	lw	a5,-36(s0)
     b24:	fec42603          	lw	a2,-20(s0)
     b28:	01000593          	li	a1,16
     b2c:	00078513          	mv	a0,a5
     b30:	bc5ff0ef          	jal	6f4 <my_printn>
     b34:	00050713          	mv	a4,a0
     b38:	fe042783          	lw	a5,-32(s0)
     b3c:	00e787b3          	add	a5,a5,a4
     b40:	fef42023          	sw	a5,-32(s0)
     b44:	1380006f          	j	c7c <my_vprintf+0x31c>
     b48:	fc842783          	lw	a5,-56(s0)
     b4c:	00478713          	addi	a4,a5,4
     b50:	fce42423          	sw	a4,-56(s0)
     b54:	0007a783          	lw	a5,0(a5)
     b58:	fef42223          	sw	a5,-28(s0)
     b5c:	0480006f          	j	ba4 <my_vprintf+0x244>
     b60:	fe442783          	lw	a5,-28(s0)
     b64:	0007c783          	lbu	a5,0(a5)
     b68:	00078513          	mv	a0,a5
     b6c:	4ac000ef          	jal	1018 <uart_put_char>
     b70:	00050713          	mv	a4,a0
     b74:	fe042783          	lw	a5,-32(s0)
     b78:	00f707b3          	add	a5,a4,a5
     b7c:	fef42023          	sw	a5,-32(s0)
     b80:	fe442783          	lw	a5,-28(s0)
     b84:	0007c703          	lbu	a4,0(a5)
     b88:	00a00793          	li	a5,10
     b8c:	00f71663          	bne	a4,a5,b98 <my_vprintf+0x238>
     b90:	00d00513          	li	a0,13
     b94:	484000ef          	jal	1018 <uart_put_char>
     b98:	fe442783          	lw	a5,-28(s0)
     b9c:	00178793          	addi	a5,a5,1
     ba0:	fef42223          	sw	a5,-28(s0)
     ba4:	fe442783          	lw	a5,-28(s0)
     ba8:	0007c783          	lbu	a5,0(a5)
     bac:	fa079ae3          	bnez	a5,b60 <my_vprintf+0x200>
     bb0:	0cc0006f          	j	c7c <my_vprintf+0x31c>
     bb4:	fc842783          	lw	a5,-56(s0)
     bb8:	00778793          	addi	a5,a5,7
     bbc:	ff87f793          	andi	a5,a5,-8
     bc0:	00878713          	addi	a4,a5,8
     bc4:	fce42423          	sw	a4,-56(s0)
     bc8:	0007a703          	lw	a4,0(a5)
     bcc:	0047a783          	lw	a5,4(a5)
     bd0:	00070513          	mv	a0,a4
     bd4:	00078593          	mv	a1,a5
     bd8:	244030ef          	jal	3e1c <__truncdfsf2>
     bdc:	00050793          	mv	a5,a0
     be0:	fcf42c23          	sw	a5,-40(s0)
     be4:	fec42583          	lw	a1,-20(s0)
     be8:	fd842503          	lw	a0,-40(s0)
     bec:	bfdff0ef          	jal	7e8 <my_printflt>
     bf0:	00050713          	mv	a4,a0
     bf4:	fe042783          	lw	a5,-32(s0)
     bf8:	00e787b3          	add	a5,a5,a4
     bfc:	fef42023          	sw	a5,-32(s0)
     c00:	07c0006f          	j	c7c <my_vprintf+0x31c>
     c04:	02500513          	li	a0,37
     c08:	410000ef          	jal	1018 <uart_put_char>
     c0c:	00050713          	mv	a4,a0
     c10:	fe042783          	lw	a5,-32(s0)
     c14:	00f707b3          	add	a5,a4,a5
     c18:	fef42023          	sw	a5,-32(s0)
     c1c:	0600006f          	j	c7c <my_vprintf+0x31c>
     c20:	02500513          	li	a0,37
     c24:	3f4000ef          	jal	1018 <uart_put_char>
     c28:	00050713          	mv	a4,a0
     c2c:	fe042783          	lw	a5,-32(s0)
     c30:	00f707b3          	add	a5,a4,a5
     c34:	fef42023          	sw	a5,-32(s0)
     c38:	fcc42783          	lw	a5,-52(s0)
     c3c:	fff78793          	addi	a5,a5,-1
     c40:	fcf42623          	sw	a5,-52(s0)
     c44:	0380006f          	j	c7c <my_vprintf+0x31c>
     c48:	fe842783          	lw	a5,-24(s0)
     c4c:	0ff7f793          	zext.b	a5,a5
     c50:	00078513          	mv	a0,a5
     c54:	3c4000ef          	jal	1018 <uart_put_char>
     c58:	00050713          	mv	a4,a0
     c5c:	fe042783          	lw	a5,-32(s0)
     c60:	00f707b3          	add	a5,a4,a5
     c64:	fef42023          	sw	a5,-32(s0)
     c68:	fe842703          	lw	a4,-24(s0)
     c6c:	00a00793          	li	a5,10
     c70:	00f71663          	bne	a4,a5,c7c <my_vprintf+0x31c>
     c74:	00d00513          	li	a0,13
     c78:	3a0000ef          	jal	1018 <uart_put_char>
     c7c:	fcc42783          	lw	a5,-52(s0)
     c80:	00178713          	addi	a4,a5,1
     c84:	fce42623          	sw	a4,-52(s0)
     c88:	0007c783          	lbu	a5,0(a5)
     c8c:	fef42423          	sw	a5,-24(s0)
     c90:	fe842783          	lw	a5,-24(s0)
     c94:	ce0796e3          	bnez	a5,980 <my_vprintf+0x20>
     c98:	fe042783          	lw	a5,-32(s0)
     c9c:	00078513          	mv	a0,a5
     ca0:	03c12083          	lw	ra,60(sp)
     ca4:	03812403          	lw	s0,56(sp)
     ca8:	04010113          	addi	sp,sp,64
     cac:	00008067          	ret

00000cb0 <uart_init>:
     cb0:	fc010113          	addi	sp,sp,-64
     cb4:	02112e23          	sw	ra,60(sp)
     cb8:	02812c23          	sw	s0,56(sp)
     cbc:	04010413          	addi	s0,sp,64
     cc0:	fca42e23          	sw	a0,-36(s0)
     cc4:	fcb42c23          	sw	a1,-40(s0)
     cc8:	fcc42a23          	sw	a2,-44(s0)
     ccc:	fcd42823          	sw	a3,-48(s0)
     cd0:	fce42623          	sw	a4,-52(s0)
     cd4:	fdc42783          	lw	a5,-36(s0)
     cd8:	00079663          	bnez	a5,ce4 <uart_init+0x34>
     cdc:	638000ef          	jal	1314 <uart_get_clk_freq>
     ce0:	fca42e23          	sw	a0,-36(s0)
     ce4:	fdc42703          	lw	a4,-36(s0)
     ce8:	fd842783          	lw	a5,-40(s0)
     cec:	02f757b3          	divu	a5,a4,a5
     cf0:	00078513          	mv	a0,a5
     cf4:	6d0020ef          	jal	33c4 <__floatunsidf>
     cf8:	00050713          	mv	a4,a0
     cfc:	00058793          	mv	a5,a1
     d00:	5381a603          	lw	a2,1336(gp) # 4518 <__global_pointer$+0x538>
     d04:	53c1a683          	lw	a3,1340(gp) # 451c <__global_pointer$+0x53c>
     d08:	00070513          	mv	a0,a4
     d0c:	00078593          	mv	a1,a5
     d10:	6a1010ef          	jal	2bb0 <__adddf3>
     d14:	00050713          	mv	a4,a0
     d18:	00058793          	mv	a5,a1
     d1c:	00070513          	mv	a0,a4
     d20:	00078593          	mv	a1,a5
     d24:	620020ef          	jal	3344 <__fixdfsi>
     d28:	00050793          	mv	a5,a0
     d2c:	00078713          	mv	a4,a5
     d30:	000107b7          	lui	a5,0x10
     d34:	fff78793          	addi	a5,a5,-1 # ffff <_bss_end+0xb5dc>
     d38:	00f777b3          	and	a5,a4,a5
     d3c:	fef42623          	sw	a5,-20(s0)
     d40:	fd442703          	lw	a4,-44(s0)
     d44:	00800793          	li	a5,8
     d48:	00f71663          	bne	a4,a5,d54 <uart_init+0xa4>
     d4c:	00000793          	li	a5,0
     d50:	0080006f          	j	d58 <uart_init+0xa8>
     d54:	000107b7          	lui	a5,0x10
     d58:	fec42703          	lw	a4,-20(s0)
     d5c:	00e7e7b3          	or	a5,a5,a4
     d60:	fef42623          	sw	a5,-20(s0)
     d64:	fd042783          	lw	a5,-48(s0)
     d68:	00079663          	bnez	a5,d74 <uart_init+0xc4>
     d6c:	00000793          	li	a5,0
     d70:	0080006f          	j	d78 <uart_init+0xc8>
     d74:	000207b7          	lui	a5,0x20
     d78:	fec42703          	lw	a4,-20(s0)
     d7c:	00e7e7b3          	or	a5,a5,a4
     d80:	fef42623          	sw	a5,-20(s0)
     d84:	fd042703          	lw	a4,-48(s0)
     d88:	00100793          	li	a5,1
     d8c:	00f71663          	bne	a4,a5,d98 <uart_init+0xe8>
     d90:	00000793          	li	a5,0
     d94:	0080006f          	j	d9c <uart_init+0xec>
     d98:	000407b7          	lui	a5,0x40
     d9c:	fec42703          	lw	a4,-20(s0)
     da0:	00e7e7b3          	or	a5,a5,a4
     da4:	fef42623          	sw	a5,-20(s0)
     da8:	fcc42703          	lw	a4,-52(s0)
     dac:	00100793          	li	a5,1
     db0:	00f71663          	bne	a4,a5,dbc <uart_init+0x10c>
     db4:	00000793          	li	a5,0
     db8:	0080006f          	j	dc0 <uart_init+0x110>
     dbc:	000807b7          	lui	a5,0x80
     dc0:	fec42703          	lw	a4,-20(s0)
     dc4:	00e7e7b3          	or	a5,a5,a4
     dc8:	fef42623          	sw	a5,-20(s0)
     dcc:	000057b7          	lui	a5,0x5
     dd0:	8f47a783          	lw	a5,-1804(a5) # 48f4 <UART_CONTROL>
     dd4:	fef42423          	sw	a5,-24(s0)
     dd8:	fe842783          	lw	a5,-24(s0)
     ddc:	fec42703          	lw	a4,-20(s0)
     de0:	00e7a023          	sw	a4,0(a5)
     de4:	00000013          	nop
     de8:	03c12083          	lw	ra,60(sp)
     dec:	03812403          	lw	s0,56(sp)
     df0:	04010113          	addi	sp,sp,64
     df4:	00008067          	ret

00000df8 <uart_init_ext>:
     df8:	fc010113          	addi	sp,sp,-64
     dfc:	02112e23          	sw	ra,60(sp)
     e00:	02812c23          	sw	s0,56(sp)
     e04:	04010413          	addi	s0,sp,64
     e08:	fca42e23          	sw	a0,-36(s0)
     e0c:	fcb42c23          	sw	a1,-40(s0)
     e10:	fcc42a23          	sw	a2,-44(s0)
     e14:	fcd42823          	sw	a3,-48(s0)
     e18:	fce42623          	sw	a4,-52(s0)
     e1c:	fcf42423          	sw	a5,-56(s0)
     e20:	fd042223          	sw	a6,-60(s0)
     e24:	fdc42783          	lw	a5,-36(s0)
     e28:	00079663          	bnez	a5,e34 <uart_init_ext+0x3c>
     e2c:	4e8000ef          	jal	1314 <uart_get_clk_freq>
     e30:	fca42e23          	sw	a0,-36(s0)
     e34:	fdc42703          	lw	a4,-36(s0)
     e38:	fd842783          	lw	a5,-40(s0)
     e3c:	02f757b3          	divu	a5,a4,a5
     e40:	00078513          	mv	a0,a5
     e44:	580020ef          	jal	33c4 <__floatunsidf>
     e48:	00050713          	mv	a4,a0
     e4c:	00058793          	mv	a5,a1
     e50:	5381a603          	lw	a2,1336(gp) # 4518 <__global_pointer$+0x538>
     e54:	53c1a683          	lw	a3,1340(gp) # 451c <__global_pointer$+0x53c>
     e58:	00070513          	mv	a0,a4
     e5c:	00078593          	mv	a1,a5
     e60:	551010ef          	jal	2bb0 <__adddf3>
     e64:	00050713          	mv	a4,a0
     e68:	00058793          	mv	a5,a1
     e6c:	00070513          	mv	a0,a4
     e70:	00078593          	mv	a1,a5
     e74:	4d0020ef          	jal	3344 <__fixdfsi>
     e78:	00050793          	mv	a5,a0
     e7c:	00078713          	mv	a4,a5
     e80:	000107b7          	lui	a5,0x10
     e84:	fff78793          	addi	a5,a5,-1 # ffff <_bss_end+0xb5dc>
     e88:	00f777b3          	and	a5,a4,a5
     e8c:	fef42623          	sw	a5,-20(s0)
     e90:	fd442703          	lw	a4,-44(s0)
     e94:	00800793          	li	a5,8
     e98:	00f71663          	bne	a4,a5,ea4 <uart_init_ext+0xac>
     e9c:	00000793          	li	a5,0
     ea0:	0080006f          	j	ea8 <uart_init_ext+0xb0>
     ea4:	000107b7          	lui	a5,0x10
     ea8:	fec42703          	lw	a4,-20(s0)
     eac:	00e7e7b3          	or	a5,a5,a4
     eb0:	fef42623          	sw	a5,-20(s0)
     eb4:	fd042783          	lw	a5,-48(s0)
     eb8:	00079663          	bnez	a5,ec4 <uart_init_ext+0xcc>
     ebc:	00000793          	li	a5,0
     ec0:	0080006f          	j	ec8 <uart_init_ext+0xd0>
     ec4:	000207b7          	lui	a5,0x20
     ec8:	fec42703          	lw	a4,-20(s0)
     ecc:	00e7e7b3          	or	a5,a5,a4
     ed0:	fef42623          	sw	a5,-20(s0)
     ed4:	fd042703          	lw	a4,-48(s0)
     ed8:	00100793          	li	a5,1
     edc:	00f71663          	bne	a4,a5,ee8 <uart_init_ext+0xf0>
     ee0:	00000793          	li	a5,0
     ee4:	0080006f          	j	eec <uart_init_ext+0xf4>
     ee8:	000407b7          	lui	a5,0x40
     eec:	fec42703          	lw	a4,-20(s0)
     ef0:	00e7e7b3          	or	a5,a5,a4
     ef4:	fef42623          	sw	a5,-20(s0)
     ef8:	fcc42703          	lw	a4,-52(s0)
     efc:	00100793          	li	a5,1
     f00:	00f71663          	bne	a4,a5,f0c <uart_init_ext+0x114>
     f04:	00000793          	li	a5,0
     f08:	0080006f          	j	f10 <uart_init_ext+0x118>
     f0c:	000807b7          	lui	a5,0x80
     f10:	fec42703          	lw	a4,-20(s0)
     f14:	00e7e7b3          	or	a5,a5,a4
     f18:	fef42623          	sw	a5,-20(s0)
     f1c:	fc842783          	lw	a5,-56(s0)
     f20:	00079663          	bnez	a5,f2c <uart_init_ext+0x134>
     f24:	00000793          	li	a5,0
     f28:	0080006f          	j	f30 <uart_init_ext+0x138>
     f2c:	002007b7          	lui	a5,0x200
     f30:	fec42703          	lw	a4,-20(s0)
     f34:	00e7e7b3          	or	a5,a5,a4
     f38:	fef42623          	sw	a5,-20(s0)
     f3c:	fc442783          	lw	a5,-60(s0)
     f40:	00079663          	bnez	a5,f4c <uart_init_ext+0x154>
     f44:	00000793          	li	a5,0
     f48:	0080006f          	j	f50 <uart_init_ext+0x158>
     f4c:	001007b7          	lui	a5,0x100
     f50:	fec42703          	lw	a4,-20(s0)
     f54:	00e7e7b3          	or	a5,a5,a4
     f58:	fef42623          	sw	a5,-20(s0)
     f5c:	000057b7          	lui	a5,0x5
     f60:	8f47a783          	lw	a5,-1804(a5) # 48f4 <UART_CONTROL>
     f64:	fef42423          	sw	a5,-24(s0)
     f68:	fe842783          	lw	a5,-24(s0)
     f6c:	fec42703          	lw	a4,-20(s0)
     f70:	00e7a023          	sw	a4,0(a5)
     f74:	00000013          	nop
     f78:	03c12083          	lw	ra,60(sp)
     f7c:	03812403          	lw	s0,56(sp)
     f80:	04010113          	addi	sp,sp,64
     f84:	00008067          	ret

00000f88 <uart_get_char>:
     f88:	fe010113          	addi	sp,sp,-32
     f8c:	00812e23          	sw	s0,28(sp)
     f90:	02010413          	addi	s0,sp,32
     f94:	000057b7          	lui	a5,0x5
     f98:	9007a783          	lw	a5,-1792(a5) # 4900 <UART_RX>
     f9c:	fef42423          	sw	a5,-24(s0)
     fa0:	fe842783          	lw	a5,-24(s0)
     fa4:	0007a783          	lw	a5,0(a5)
     fa8:	fef42623          	sw	a5,-20(s0)
     fac:	fec42783          	lw	a5,-20(s0)
     fb0:	fe07d2e3          	bgez	a5,f94 <uart_get_char+0xc>
     fb4:	fec42783          	lw	a5,-20(s0)
     fb8:	0ff7f793          	zext.b	a5,a5
     fbc:	00078513          	mv	a0,a5
     fc0:	01c12403          	lw	s0,28(sp)
     fc4:	02010113          	addi	sp,sp,32
     fc8:	00008067          	ret

00000fcc <uart_get_char_nb>:
     fcc:	fe010113          	addi	sp,sp,-32
     fd0:	00812e23          	sw	s0,28(sp)
     fd4:	02010413          	addi	s0,sp,32
     fd8:	000057b7          	lui	a5,0x5
     fdc:	9007a783          	lw	a5,-1792(a5) # 4900 <UART_RX>
     fe0:	fef42423          	sw	a5,-24(s0)
     fe4:	fe842783          	lw	a5,-24(s0)
     fe8:	0007a783          	lw	a5,0(a5)
     fec:	fef42623          	sw	a5,-20(s0)
     ff0:	fec42783          	lw	a5,-20(s0)
     ff4:	0007d863          	bgez	a5,1004 <uart_get_char_nb+0x38>
     ff8:	fec42783          	lw	a5,-20(s0)
     ffc:	0ff7f793          	zext.b	a5,a5
    1000:	0080006f          	j	1008 <uart_get_char_nb+0x3c>
    1004:	00000793          	li	a5,0
    1008:	00078513          	mv	a0,a5
    100c:	01c12403          	lw	s0,28(sp)
    1010:	02010113          	addi	sp,sp,32
    1014:	00008067          	ret

00001018 <uart_put_char>:
    1018:	fd010113          	addi	sp,sp,-48
    101c:	02812623          	sw	s0,44(sp)
    1020:	03010413          	addi	s0,sp,48
    1024:	00050793          	mv	a5,a0
    1028:	fcf40fa3          	sb	a5,-33(s0)
    102c:	000057b7          	lui	a5,0x5
    1030:	8fc7a783          	lw	a5,-1796(a5) # 48fc <UART_TX>
    1034:	fef42423          	sw	a5,-24(s0)
    1038:	fe842783          	lw	a5,-24(s0)
    103c:	0007a783          	lw	a5,0(a5)
    1040:	fef42623          	sw	a5,-20(s0)
    1044:	fec42783          	lw	a5,-20(s0)
    1048:	fe07c2e3          	bltz	a5,102c <uart_put_char+0x14>
    104c:	fdf44783          	lbu	a5,-33(s0)
    1050:	fef42623          	sw	a5,-20(s0)
    1054:	000057b7          	lui	a5,0x5
    1058:	8fc7a783          	lw	a5,-1796(a5) # 48fc <UART_TX>
    105c:	fef42223          	sw	a5,-28(s0)
    1060:	fe442783          	lw	a5,-28(s0)
    1064:	fec42703          	lw	a4,-20(s0)
    1068:	00e7a023          	sw	a4,0(a5)
    106c:	fdf44783          	lbu	a5,-33(s0)
    1070:	00078513          	mv	a0,a5
    1074:	02c12403          	lw	s0,44(sp)
    1078:	03010113          	addi	sp,sp,48
    107c:	00008067          	ret

00001080 <uart_put_string>:
    1080:	fc010113          	addi	sp,sp,-64
    1084:	02812e23          	sw	s0,60(sp)
    1088:	04010413          	addi	s0,sp,64
    108c:	fca42623          	sw	a0,-52(s0)
    1090:	fe042623          	sw	zero,-20(s0)
    1094:	0480006f          	j	10dc <uart_put_string+0x5c>
    1098:	000057b7          	lui	a5,0x5
    109c:	8fc7a783          	lw	a5,-1796(a5) # 48fc <UART_TX>
    10a0:	fef42023          	sw	a5,-32(s0)
    10a4:	fe042783          	lw	a5,-32(s0)
    10a8:	0007a783          	lw	a5,0(a5)
    10ac:	fef42223          	sw	a5,-28(s0)
    10b0:	fe442783          	lw	a5,-28(s0)
    10b4:	fe07c2e3          	bltz	a5,1098 <uart_put_string+0x18>
    10b8:	000057b7          	lui	a5,0x5
    10bc:	8fc7a783          	lw	a5,-1796(a5) # 48fc <UART_TX>
    10c0:	fcf42e23          	sw	a5,-36(s0)
    10c4:	fdc42783          	lw	a5,-36(s0)
    10c8:	feb44703          	lbu	a4,-21(s0)
    10cc:	00e7a023          	sw	a4,0(a5)
    10d0:	fec42783          	lw	a5,-20(s0)
    10d4:	00178793          	addi	a5,a5,1
    10d8:	fef42623          	sw	a5,-20(s0)
    10dc:	fcc42783          	lw	a5,-52(s0)
    10e0:	00178713          	addi	a4,a5,1
    10e4:	fce42623          	sw	a4,-52(s0)
    10e8:	0007c783          	lbu	a5,0(a5)
    10ec:	fef405a3          	sb	a5,-21(s0)
    10f0:	feb44783          	lbu	a5,-21(s0)
    10f4:	fa0792e3          	bnez	a5,1098 <uart_put_string+0x18>
    10f8:	fec42783          	lw	a5,-20(s0)
    10fc:	00078513          	mv	a0,a5
    1100:	03c12403          	lw	s0,60(sp)
    1104:	04010113          	addi	sp,sp,64
    1108:	00008067          	ret

0000110c <uart_put_int>:
    110c:	fc010113          	addi	sp,sp,-64
    1110:	02112e23          	sw	ra,60(sp)
    1114:	02812c23          	sw	s0,56(sp)
    1118:	04010413          	addi	s0,sp,64
    111c:	fca42623          	sw	a0,-52(s0)
    1120:	fcc42703          	lw	a4,-52(s0)
    1124:	00a00793          	li	a5,10
    1128:	02f757b3          	divu	a5,a4,a5
    112c:	fef42623          	sw	a5,-20(s0)
    1130:	fec42783          	lw	a5,-20(s0)
    1134:	00078863          	beqz	a5,1144 <uart_put_int+0x38>
    1138:	fec42783          	lw	a5,-20(s0)
    113c:	00078513          	mv	a0,a5
    1140:	fcdff0ef          	jal	110c <uart_put_int>
    1144:	fcc42703          	lw	a4,-52(s0)
    1148:	00a00793          	li	a5,10
    114c:	02f777b3          	remu	a5,a4,a5
    1150:	0ff7f793          	zext.b	a5,a5
    1154:	03078793          	addi	a5,a5,48
    1158:	fef405a3          	sb	a5,-21(s0)
    115c:	000057b7          	lui	a5,0x5
    1160:	8fc7a783          	lw	a5,-1796(a5) # 48fc <UART_TX>
    1164:	fcf42a23          	sw	a5,-44(s0)
    1168:	fd442783          	lw	a5,-44(s0)
    116c:	0007a783          	lw	a5,0(a5)
    1170:	fcf42c23          	sw	a5,-40(s0)
    1174:	fd842783          	lw	a5,-40(s0)
    1178:	fe07c2e3          	bltz	a5,115c <uart_put_int+0x50>
    117c:	000057b7          	lui	a5,0x5
    1180:	8fc7a783          	lw	a5,-1796(a5) # 48fc <UART_TX>
    1184:	fcf42823          	sw	a5,-48(s0)
    1188:	fd042783          	lw	a5,-48(s0)
    118c:	feb44703          	lbu	a4,-21(s0)
    1190:	00e7a023          	sw	a4,0(a5)
    1194:	00000013          	nop
    1198:	03c12083          	lw	ra,60(sp)
    119c:	03812403          	lw	s0,56(sp)
    11a0:	04010113          	addi	sp,sp,64
    11a4:	00008067          	ret

000011a8 <uart_put_hex>:
    11a8:	fc010113          	addi	sp,sp,-64
    11ac:	02112e23          	sw	ra,60(sp)
    11b0:	02812c23          	sw	s0,56(sp)
    11b4:	04010413          	addi	s0,sp,64
    11b8:	fca42623          	sw	a0,-52(s0)
    11bc:	fcc42783          	lw	a5,-52(s0)
    11c0:	0047d793          	srli	a5,a5,0x4
    11c4:	fef42423          	sw	a5,-24(s0)
    11c8:	fe842783          	lw	a5,-24(s0)
    11cc:	00078863          	beqz	a5,11dc <uart_put_hex+0x34>
    11d0:	fe842783          	lw	a5,-24(s0)
    11d4:	00078513          	mv	a0,a5
    11d8:	fd1ff0ef          	jal	11a8 <uart_put_hex>
    11dc:	fcc42783          	lw	a5,-52(s0)
    11e0:	00f7f793          	andi	a5,a5,15
    11e4:	fef42423          	sw	a5,-24(s0)
    11e8:	fe842703          	lw	a4,-24(s0)
    11ec:	00900793          	li	a5,9
    11f0:	00e7cc63          	blt	a5,a4,1208 <uart_put_hex+0x60>
    11f4:	fe842783          	lw	a5,-24(s0)
    11f8:	0ff7f793          	zext.b	a5,a5
    11fc:	03078793          	addi	a5,a5,48
    1200:	fef407a3          	sb	a5,-17(s0)
    1204:	0140006f          	j	1218 <uart_put_hex+0x70>
    1208:	fe842783          	lw	a5,-24(s0)
    120c:	0ff7f793          	zext.b	a5,a5
    1210:	03778793          	addi	a5,a5,55
    1214:	fef407a3          	sb	a5,-17(s0)
    1218:	000057b7          	lui	a5,0x5
    121c:	8fc7a783          	lw	a5,-1796(a5) # 48fc <UART_TX>
    1220:	fef42023          	sw	a5,-32(s0)
    1224:	fe042783          	lw	a5,-32(s0)
    1228:	0007a783          	lw	a5,0(a5)
    122c:	fef42223          	sw	a5,-28(s0)
    1230:	fe442783          	lw	a5,-28(s0)
    1234:	fe07c2e3          	bltz	a5,1218 <uart_put_hex+0x70>
    1238:	000057b7          	lui	a5,0x5
    123c:	8fc7a783          	lw	a5,-1796(a5) # 48fc <UART_TX>
    1240:	fcf42e23          	sw	a5,-36(s0)
    1244:	fdc42783          	lw	a5,-36(s0)
    1248:	fef44703          	lbu	a4,-17(s0)
    124c:	00e7a023          	sw	a4,0(a5)
    1250:	00000013          	nop
    1254:	03c12083          	lw	ra,60(sp)
    1258:	03812403          	lw	s0,56(sp)
    125c:	04010113          	addi	sp,sp,64
    1260:	00008067          	ret

00001264 <uart_cler_tx_irq>:
    1264:	fe010113          	addi	sp,sp,-32
    1268:	00812e23          	sw	s0,28(sp)
    126c:	02010413          	addi	s0,sp,32
    1270:	000057b7          	lui	a5,0x5
    1274:	8f87a783          	lw	a5,-1800(a5) # 48f8 <UART_STATUS>
    1278:	fef42423          	sw	a5,-24(s0)
    127c:	fe842783          	lw	a5,-24(s0)
    1280:	0007a783          	lw	a5,0(a5)
    1284:	fef42623          	sw	a5,-20(s0)
    1288:	fec42783          	lw	a5,-20(s0)
    128c:	ffe7f793          	andi	a5,a5,-2
    1290:	fef42623          	sw	a5,-20(s0)
    1294:	000057b7          	lui	a5,0x5
    1298:	8f87a783          	lw	a5,-1800(a5) # 48f8 <UART_STATUS>
    129c:	fef42223          	sw	a5,-28(s0)
    12a0:	fe442783          	lw	a5,-28(s0)
    12a4:	fec42703          	lw	a4,-20(s0)
    12a8:	00e7a023          	sw	a4,0(a5)
    12ac:	00000013          	nop
    12b0:	01c12403          	lw	s0,28(sp)
    12b4:	02010113          	addi	sp,sp,32
    12b8:	00008067          	ret

000012bc <uart_cler_rx_irq>:
    12bc:	fe010113          	addi	sp,sp,-32
    12c0:	00812e23          	sw	s0,28(sp)
    12c4:	02010413          	addi	s0,sp,32
    12c8:	000057b7          	lui	a5,0x5
    12cc:	8f87a783          	lw	a5,-1800(a5) # 48f8 <UART_STATUS>
    12d0:	fef42423          	sw	a5,-24(s0)
    12d4:	fe842783          	lw	a5,-24(s0)
    12d8:	0007a783          	lw	a5,0(a5)
    12dc:	fef42623          	sw	a5,-20(s0)
    12e0:	fec42783          	lw	a5,-20(s0)
    12e4:	ffd7f793          	andi	a5,a5,-3
    12e8:	fef42623          	sw	a5,-20(s0)
    12ec:	000057b7          	lui	a5,0x5
    12f0:	8f87a783          	lw	a5,-1800(a5) # 48f8 <UART_STATUS>
    12f4:	fef42223          	sw	a5,-28(s0)
    12f8:	fe442783          	lw	a5,-28(s0)
    12fc:	fec42703          	lw	a4,-20(s0)
    1300:	00e7a023          	sw	a4,0(a5)
    1304:	00000013          	nop
    1308:	01c12403          	lw	s0,28(sp)
    130c:	02010113          	addi	sp,sp,32
    1310:	00008067          	ret

00001314 <uart_get_clk_freq>:
    1314:	fe010113          	addi	sp,sp,-32
    1318:	00812e23          	sw	s0,28(sp)
    131c:	02010413          	addi	s0,sp,32
    1320:	000057b7          	lui	a5,0x5
    1324:	9047a783          	lw	a5,-1788(a5) # 4904 <UART_CLK_FREQ>
    1328:	fef42423          	sw	a5,-24(s0)
    132c:	fe842783          	lw	a5,-24(s0)
    1330:	0007a783          	lw	a5,0(a5)
    1334:	fef42623          	sw	a5,-20(s0)
    1338:	fec42783          	lw	a5,-20(s0)
    133c:	00078513          	mv	a0,a5
    1340:	01c12403          	lw	s0,28(sp)
    1344:	02010113          	addi	sp,sp,32
    1348:	00008067          	ret

0000134c <uart_set_addr>:
    134c:	fe010113          	addi	sp,sp,-32
    1350:	00812e23          	sw	s0,28(sp)
    1354:	02010413          	addi	s0,sp,32
    1358:	fea42623          	sw	a0,-20(s0)
    135c:	000057b7          	lui	a5,0x5
    1360:	fec42703          	lw	a4,-20(s0)
    1364:	8ee7a423          	sw	a4,-1816(a5) # 48e8 <UART_ADDR_BASE>
    1368:	000057b7          	lui	a5,0x5
    136c:	fec42703          	lw	a4,-20(s0)
    1370:	8ee7a623          	sw	a4,-1812(a5) # 48ec <UART_VERSION>
    1374:	fec42783          	lw	a5,-20(s0)
    1378:	00478713          	addi	a4,a5,4
    137c:	000057b7          	lui	a5,0x5
    1380:	8ee7a823          	sw	a4,-1808(a5) # 48f0 <UART_NAME>
    1384:	fec42783          	lw	a5,-20(s0)
    1388:	01078713          	addi	a4,a5,16
    138c:	000057b7          	lui	a5,0x5
    1390:	8ee7aa23          	sw	a4,-1804(a5) # 48f4 <UART_CONTROL>
    1394:	fec42783          	lw	a5,-20(s0)
    1398:	01478713          	addi	a4,a5,20
    139c:	000057b7          	lui	a5,0x5
    13a0:	8ee7ac23          	sw	a4,-1800(a5) # 48f8 <UART_STATUS>
    13a4:	fec42783          	lw	a5,-20(s0)
    13a8:	01878713          	addi	a4,a5,24
    13ac:	000057b7          	lui	a5,0x5
    13b0:	8ee7ae23          	sw	a4,-1796(a5) # 48fc <UART_TX>
    13b4:	fec42783          	lw	a5,-20(s0)
    13b8:	01c78713          	addi	a4,a5,28
    13bc:	000057b7          	lui	a5,0x5
    13c0:	90e7a023          	sw	a4,-1792(a5) # 4900 <UART_RX>
    13c4:	fec42783          	lw	a5,-20(s0)
    13c8:	02078713          	addi	a4,a5,32
    13cc:	000057b7          	lui	a5,0x5
    13d0:	90e7a223          	sw	a4,-1788(a5) # 4904 <UART_CLK_FREQ>
    13d4:	00000013          	nop
    13d8:	01c12403          	lw	s0,28(sp)
    13dc:	02010113          	addi	sp,sp,32
    13e0:	00008067          	ret

000013e4 <uart_get_addr>:
    13e4:	ff010113          	addi	sp,sp,-16
    13e8:	00812623          	sw	s0,12(sp)
    13ec:	01010413          	addi	s0,sp,16
    13f0:	000057b7          	lui	a5,0x5
    13f4:	8e87a783          	lw	a5,-1816(a5) # 48e8 <UART_ADDR_BASE>
    13f8:	00078513          	mv	a0,a5
    13fc:	00c12403          	lw	s0,12(sp)
    1400:	01010113          	addi	sp,sp,16
    1404:	00008067          	ret

00001408 <spi_set_addr>:
    1408:	fe010113          	addi	sp,sp,-32
    140c:	00812e23          	sw	s0,28(sp)
    1410:	02010413          	addi	s0,sp,32
    1414:	fea42623          	sw	a0,-20(s0)
    1418:	000057b7          	lui	a5,0x5
    141c:	fec42703          	lw	a4,-20(s0)
    1420:	90e7a423          	sw	a4,-1784(a5) # 4908 <ADDR_SPI_BASE>
    1424:	000057b7          	lui	a5,0x5
    1428:	9087a703          	lw	a4,-1784(a5) # 4908 <ADDR_SPI_BASE>
    142c:	000057b7          	lui	a5,0x5
    1430:	92e7ae23          	sw	a4,-1732(a5) # 493c <CSRA_CTRL>
    1434:	000057b7          	lui	a5,0x5
    1438:	9087a783          	lw	a5,-1784(a5) # 4908 <ADDR_SPI_BASE>
    143c:	00478713          	addi	a4,a5,4
    1440:	000057b7          	lui	a5,0x5
    1444:	94e7a023          	sw	a4,-1728(a5) # 4940 <CSRA_ADDR>
    1448:	000057b7          	lui	a5,0x5
    144c:	9087a783          	lw	a5,-1784(a5) # 4908 <ADDR_SPI_BASE>
    1450:	00878713          	addi	a4,a5,8
    1454:	000057b7          	lui	a5,0x5
    1458:	94e7a223          	sw	a4,-1724(a5) # 4944 <CSRA_DATA_IN>
    145c:	000057b7          	lui	a5,0x5
    1460:	9087a783          	lw	a5,-1784(a5) # 4908 <ADDR_SPI_BASE>
    1464:	00c78713          	addi	a4,a5,12
    1468:	000057b7          	lui	a5,0x5
    146c:	94e7a423          	sw	a4,-1720(a5) # 4948 <CSRA_DATA_OUT>
    1470:	000057b7          	lui	a5,0x5
    1474:	9087a783          	lw	a5,-1784(a5) # 4908 <ADDR_SPI_BASE>
    1478:	01078713          	addi	a4,a5,16
    147c:	000057b7          	lui	a5,0x5
    1480:	94e7a623          	sw	a4,-1716(a5) # 494c <CSRA_STATUS>
    1484:	00000793          	li	a5,0
    1488:	00078513          	mv	a0,a5
    148c:	01c12403          	lw	s0,28(sp)
    1490:	02010113          	addi	sp,sp,32
    1494:	00008067          	ret

00001498 <spi_get_addr>:
    1498:	ff010113          	addi	sp,sp,-16
    149c:	00812623          	sw	s0,12(sp)
    14a0:	01010413          	addi	s0,sp,16
    14a4:	000057b7          	lui	a5,0x5
    14a8:	9087a783          	lw	a5,-1784(a5) # 4908 <ADDR_SPI_BASE>
    14ac:	00078513          	mv	a0,a5
    14b0:	00c12403          	lw	s0,12(sp)
    14b4:	01010113          	addi	sp,sp,16
    14b8:	00008067          	ret

000014bc <spi_init>:
    14bc:	ff010113          	addi	sp,sp,-16
    14c0:	00812623          	sw	s0,12(sp)
    14c4:	01010413          	addi	s0,sp,16
    14c8:	00000013          	nop
    14cc:	00c12403          	lw	s0,12(sp)
    14d0:	01010113          	addi	sp,sp,16
    14d4:	00008067          	ret

000014d8 <spi_busy>:
    14d8:	fe010113          	addi	sp,sp,-32
    14dc:	00812e23          	sw	s0,28(sp)
    14e0:	02010413          	addi	s0,sp,32
    14e4:	000057b7          	lui	a5,0x5
    14e8:	94c7a783          	lw	a5,-1716(a5) # 494c <CSRA_STATUS>
    14ec:	0007a783          	lw	a5,0(a5)
    14f0:	fef42623          	sw	a5,-20(s0)
    14f4:	fec42703          	lw	a4,-20(s0)
    14f8:	fff00793          	li	a5,-1
    14fc:	00f71663          	bne	a4,a5,1508 <spi_busy+0x30>
    1500:	fff00793          	li	a5,-1
    1504:	00c0006f          	j	1510 <spi_busy+0x38>
    1508:	fec42783          	lw	a5,-20(s0)
    150c:	0017f793          	andi	a5,a5,1
    1510:	00078513          	mv	a0,a5
    1514:	01c12403          	lw	s0,28(sp)
    1518:	02010113          	addi	sp,sp,32
    151c:	00008067          	ret

00001520 <spi_write_reg>:
    1520:	fd010113          	addi	sp,sp,-48
    1524:	02812623          	sw	s0,44(sp)
    1528:	03010413          	addi	s0,sp,48
    152c:	00050793          	mv	a5,a0
    1530:	00058713          	mv	a4,a1
    1534:	fcf40fa3          	sb	a5,-33(s0)
    1538:	00070793          	mv	a5,a4
    153c:	fcf40f23          	sb	a5,-34(s0)
    1540:	fdf44783          	lbu	a5,-33(s0)
    1544:	00179793          	slli	a5,a5,0x1
    1548:	00005737          	lui	a4,0x5
    154c:	94072703          	lw	a4,-1728(a4) # 4940 <CSRA_ADDR>
    1550:	07e7f793          	andi	a5,a5,126
    1554:	00f72023          	sw	a5,0(a4)
    1558:	000057b7          	lui	a5,0x5
    155c:	9447a783          	lw	a5,-1724(a5) # 4944 <CSRA_DATA_IN>
    1560:	00078713          	mv	a4,a5
    1564:	fde44783          	lbu	a5,-34(s0)
    1568:	00f72023          	sw	a5,0(a4)
    156c:	00100793          	li	a5,1
    1570:	fef42623          	sw	a5,-20(s0)
    1574:	000057b7          	lui	a5,0x5
    1578:	93c7a783          	lw	a5,-1732(a5) # 493c <CSRA_CTRL>
    157c:	00078713          	mv	a4,a5
    1580:	fec42783          	lw	a5,-20(s0)
    1584:	00f72023          	sw	a5,0(a4)
    1588:	00000013          	nop
    158c:	02c12403          	lw	s0,44(sp)
    1590:	03010113          	addi	sp,sp,48
    1594:	00008067          	ret

00001598 <spi_read_reg>:
    1598:	fd010113          	addi	sp,sp,-48
    159c:	02812623          	sw	s0,44(sp)
    15a0:	03010413          	addi	s0,sp,48
    15a4:	00050793          	mv	a5,a0
    15a8:	fcf40fa3          	sb	a5,-33(s0)
    15ac:	fdf44783          	lbu	a5,-33(s0)
    15b0:	00179793          	slli	a5,a5,0x1
    15b4:	0807e713          	ori	a4,a5,128
    15b8:	000057b7          	lui	a5,0x5
    15bc:	9407a783          	lw	a5,-1728(a5) # 4940 <CSRA_ADDR>
    15c0:	00e7a023          	sw	a4,0(a5)
    15c4:	00300793          	li	a5,3
    15c8:	fef42623          	sw	a5,-20(s0)
    15cc:	000057b7          	lui	a5,0x5
    15d0:	93c7a783          	lw	a5,-1732(a5) # 493c <CSRA_CTRL>
    15d4:	00078713          	mv	a4,a5
    15d8:	fec42783          	lw	a5,-20(s0)
    15dc:	00f72023          	sw	a5,0(a4)
    15e0:	000057b7          	lui	a5,0x5
    15e4:	9487a783          	lw	a5,-1720(a5) # 4948 <CSRA_DATA_OUT>
    15e8:	0007a783          	lw	a5,0(a5)
    15ec:	fef42423          	sw	a5,-24(s0)
    15f0:	fe842783          	lw	a5,-24(s0)
    15f4:	0ff7f793          	zext.b	a5,a5
    15f8:	00078513          	mv	a0,a5
    15fc:	02c12403          	lw	s0,44(sp)
    1600:	03010113          	addi	sp,sp,48
    1604:	00008067          	ret

00001608 <MFRC522_WriteReg>:
    1608:	fd010113          	addi	sp,sp,-48
    160c:	02112623          	sw	ra,44(sp)
    1610:	02812423          	sw	s0,40(sp)
    1614:	03010413          	addi	s0,sp,48
    1618:	00050793          	mv	a5,a0
    161c:	00058713          	mv	a4,a1
    1620:	fcf40fa3          	sb	a5,-33(s0)
    1624:	00070793          	mv	a5,a4
    1628:	fcf40f23          	sb	a5,-34(s0)
    162c:	fdf44783          	lbu	a5,-33(s0)
    1630:	00179793          	slli	a5,a5,0x1
    1634:	0ff7f793          	zext.b	a5,a5
    1638:	07e7f793          	andi	a5,a5,126
    163c:	fef407a3          	sb	a5,-17(s0)
    1640:	fde44703          	lbu	a4,-34(s0)
    1644:	fef44783          	lbu	a5,-17(s0)
    1648:	00070593          	mv	a1,a4
    164c:	00078513          	mv	a0,a5
    1650:	ed1ff0ef          	jal	1520 <spi_write_reg>
    1654:	00000013          	nop
    1658:	02c12083          	lw	ra,44(sp)
    165c:	02812403          	lw	s0,40(sp)
    1660:	03010113          	addi	sp,sp,48
    1664:	00008067          	ret

00001668 <MFRC522_ReadReg>:
    1668:	fd010113          	addi	sp,sp,-48
    166c:	02112623          	sw	ra,44(sp)
    1670:	02812423          	sw	s0,40(sp)
    1674:	03010413          	addi	s0,sp,48
    1678:	00050793          	mv	a5,a0
    167c:	fcf40fa3          	sb	a5,-33(s0)
    1680:	fdf40783          	lb	a5,-33(s0)
    1684:	00179793          	slli	a5,a5,0x1
    1688:	01879793          	slli	a5,a5,0x18
    168c:	4187d793          	srai	a5,a5,0x18
    1690:	07e7f793          	andi	a5,a5,126
    1694:	01879793          	slli	a5,a5,0x18
    1698:	4187d793          	srai	a5,a5,0x18
    169c:	f807e793          	ori	a5,a5,-128
    16a0:	01879793          	slli	a5,a5,0x18
    16a4:	4187d793          	srai	a5,a5,0x18
    16a8:	fef407a3          	sb	a5,-17(s0)
    16ac:	fef44783          	lbu	a5,-17(s0)
    16b0:	00078513          	mv	a0,a5
    16b4:	ee5ff0ef          	jal	1598 <spi_read_reg>
    16b8:	00050793          	mv	a5,a0
    16bc:	00078513          	mv	a0,a5
    16c0:	02c12083          	lw	ra,44(sp)
    16c4:	02812403          	lw	s0,40(sp)
    16c8:	03010113          	addi	sp,sp,48
    16cc:	00008067          	ret

000016d0 <MFRC522_Reset>:
    16d0:	ff010113          	addi	sp,sp,-16
    16d4:	00112623          	sw	ra,12(sp)
    16d8:	00812423          	sw	s0,8(sp)
    16dc:	01010413          	addi	s0,sp,16
    16e0:	00f00593          	li	a1,15
    16e4:	00100513          	li	a0,1
    16e8:	f21ff0ef          	jal	1608 <MFRC522_WriteReg>
    16ec:	00000013          	nop
    16f0:	00c12083          	lw	ra,12(sp)
    16f4:	00812403          	lw	s0,8(sp)
    16f8:	01010113          	addi	sp,sp,16
    16fc:	00008067          	ret

00001700 <MFRC522_Init>:
    1700:	ff010113          	addi	sp,sp,-16
    1704:	00112623          	sw	ra,12(sp)
    1708:	00812423          	sw	s0,8(sp)
    170c:	01010413          	addi	s0,sp,16
    1710:	54018513          	addi	a0,gp,1344 # 4520 <__global_pointer$+0x540>
    1714:	f71fe0ef          	jal	684 <my_printf>
    1718:	56018513          	addi	a0,gp,1376 # 4540 <__global_pointer$+0x560>
    171c:	f69fe0ef          	jal	684 <my_printf>
    1720:	fb1ff0ef          	jal	16d0 <MFRC522_Reset>
    1724:	58018513          	addi	a0,gp,1408 # 4560 <__global_pointer$+0x580>
    1728:	f5dfe0ef          	jal	684 <my_printf>
    172c:	59c18513          	addi	a0,gp,1436 # 457c <__global_pointer$+0x59c>
    1730:	f55fe0ef          	jal	684 <my_printf>
    1734:	08d00593          	li	a1,141
    1738:	02a00513          	li	a0,42
    173c:	ecdff0ef          	jal	1608 <MFRC522_WriteReg>
    1740:	03e00593          	li	a1,62
    1744:	02b00513          	li	a0,43
    1748:	ec1ff0ef          	jal	1608 <MFRC522_WriteReg>
    174c:	01e00593          	li	a1,30
    1750:	02d00513          	li	a0,45
    1754:	eb5ff0ef          	jal	1608 <MFRC522_WriteReg>
    1758:	00000593          	li	a1,0
    175c:	02c00513          	li	a0,44
    1760:	ea9ff0ef          	jal	1608 <MFRC522_WriteReg>
    1764:	5c418513          	addi	a0,gp,1476 # 45a4 <__global_pointer$+0x5c4>
    1768:	f1dfe0ef          	jal	684 <my_printf>
    176c:	5e818513          	addi	a0,gp,1512 # 45c8 <__global_pointer$+0x5e8>
    1770:	f15fe0ef          	jal	684 <my_printf>
    1774:	04000593          	li	a1,64
    1778:	01500513          	li	a0,21
    177c:	e8dff0ef          	jal	1608 <MFRC522_WriteReg>
    1780:	03d00593          	li	a1,61
    1784:	01100513          	li	a0,17
    1788:	e81ff0ef          	jal	1608 <MFRC522_WriteReg>
    178c:	61418513          	addi	a0,gp,1556 # 45f4 <__global_pointer$+0x614>
    1790:	ef5fe0ef          	jal	684 <my_printf>
    1794:	63818513          	addi	a0,gp,1592 # 4618 <__global_pointer$+0x638>
    1798:	eedfe0ef          	jal	684 <my_printf>
    179c:	110000ef          	jal	18ac <MFRC522_AntennaOn>
    17a0:	66018513          	addi	a0,gp,1632 # 4640 <__global_pointer$+0x660>
    17a4:	ee1fe0ef          	jal	684 <my_printf>
    17a8:	00000013          	nop
    17ac:	00c12083          	lw	ra,12(sp)
    17b0:	00812403          	lw	s0,8(sp)
    17b4:	01010113          	addi	sp,sp,16
    17b8:	00008067          	ret

000017bc <MFRC522_SetBitMask>:
    17bc:	fd010113          	addi	sp,sp,-48
    17c0:	02112623          	sw	ra,44(sp)
    17c4:	02812423          	sw	s0,40(sp)
    17c8:	03010413          	addi	s0,sp,48
    17cc:	00050793          	mv	a5,a0
    17d0:	00058713          	mv	a4,a1
    17d4:	fcf40fa3          	sb	a5,-33(s0)
    17d8:	00070793          	mv	a5,a4
    17dc:	fcf40f23          	sb	a5,-34(s0)
    17e0:	fdf44783          	lbu	a5,-33(s0)
    17e4:	00078513          	mv	a0,a5
    17e8:	e81ff0ef          	jal	1668 <MFRC522_ReadReg>
    17ec:	00050793          	mv	a5,a0
    17f0:	fef407a3          	sb	a5,-17(s0)
    17f4:	fef44783          	lbu	a5,-17(s0)
    17f8:	00078713          	mv	a4,a5
    17fc:	fde44783          	lbu	a5,-34(s0)
    1800:	00f767b3          	or	a5,a4,a5
    1804:	0ff7f713          	zext.b	a4,a5
    1808:	fdf44783          	lbu	a5,-33(s0)
    180c:	00070593          	mv	a1,a4
    1810:	00078513          	mv	a0,a5
    1814:	df5ff0ef          	jal	1608 <MFRC522_WriteReg>
    1818:	00000013          	nop
    181c:	02c12083          	lw	ra,44(sp)
    1820:	02812403          	lw	s0,40(sp)
    1824:	03010113          	addi	sp,sp,48
    1828:	00008067          	ret

0000182c <MFRC522_ClearBitMask>:
    182c:	fd010113          	addi	sp,sp,-48
    1830:	02112623          	sw	ra,44(sp)
    1834:	02812423          	sw	s0,40(sp)
    1838:	03010413          	addi	s0,sp,48
    183c:	00050793          	mv	a5,a0
    1840:	00058713          	mv	a4,a1
    1844:	fcf40fa3          	sb	a5,-33(s0)
    1848:	00070793          	mv	a5,a4
    184c:	fcf40f23          	sb	a5,-34(s0)
    1850:	fdf44783          	lbu	a5,-33(s0)
    1854:	00078513          	mv	a0,a5
    1858:	e11ff0ef          	jal	1668 <MFRC522_ReadReg>
    185c:	00050793          	mv	a5,a0
    1860:	fef407a3          	sb	a5,-17(s0)
    1864:	fde40783          	lb	a5,-34(s0)
    1868:	fff7c793          	not	a5,a5
    186c:	01879713          	slli	a4,a5,0x18
    1870:	41875713          	srai	a4,a4,0x18
    1874:	fef40783          	lb	a5,-17(s0)
    1878:	00f777b3          	and	a5,a4,a5
    187c:	01879793          	slli	a5,a5,0x18
    1880:	4187d793          	srai	a5,a5,0x18
    1884:	0ff7f713          	zext.b	a4,a5
    1888:	fdf44783          	lbu	a5,-33(s0)
    188c:	00070593          	mv	a1,a4
    1890:	00078513          	mv	a0,a5
    1894:	d75ff0ef          	jal	1608 <MFRC522_WriteReg>
    1898:	00000013          	nop
    189c:	02c12083          	lw	ra,44(sp)
    18a0:	02812403          	lw	s0,40(sp)
    18a4:	03010113          	addi	sp,sp,48
    18a8:	00008067          	ret

000018ac <MFRC522_AntennaOn>:
    18ac:	fe010113          	addi	sp,sp,-32
    18b0:	00112e23          	sw	ra,28(sp)
    18b4:	00812c23          	sw	s0,24(sp)
    18b8:	02010413          	addi	s0,sp,32
    18bc:	68018513          	addi	a0,gp,1664 # 4660 <__global_pointer$+0x680>
    18c0:	dc5fe0ef          	jal	684 <my_printf>
    18c4:	01400513          	li	a0,20
    18c8:	da1ff0ef          	jal	1668 <MFRC522_ReadReg>
    18cc:	00050793          	mv	a5,a0
    18d0:	fef407a3          	sb	a5,-17(s0)
    18d4:	fef44783          	lbu	a5,-17(s0)
    18d8:	00078593          	mv	a1,a5
    18dc:	6a818513          	addi	a0,gp,1704 # 4688 <__global_pointer$+0x6a8>
    18e0:	da5fe0ef          	jal	684 <my_printf>
    18e4:	fef44783          	lbu	a5,-17(s0)
    18e8:	0037f793          	andi	a5,a5,3
    18ec:	00079c63          	bnez	a5,1904 <MFRC522_AntennaOn+0x58>
    18f0:	6c818513          	addi	a0,gp,1736 # 46a8 <__global_pointer$+0x6c8>
    18f4:	d91fe0ef          	jal	684 <my_printf>
    18f8:	00300593          	li	a1,3
    18fc:	01400513          	li	a0,20
    1900:	ebdff0ef          	jal	17bc <MFRC522_SetBitMask>
    1904:	6f018513          	addi	a0,gp,1776 # 46d0 <__global_pointer$+0x6f0>
    1908:	d7dfe0ef          	jal	684 <my_printf>
    190c:	00000013          	nop
    1910:	01c12083          	lw	ra,28(sp)
    1914:	01812403          	lw	s0,24(sp)
    1918:	02010113          	addi	sp,sp,32
    191c:	00008067          	ret

00001920 <MFRC522_AntennaOff>:
    1920:	ff010113          	addi	sp,sp,-16
    1924:	00112623          	sw	ra,12(sp)
    1928:	00812423          	sw	s0,8(sp)
    192c:	01010413          	addi	s0,sp,16
    1930:	00300593          	li	a1,3
    1934:	01400513          	li	a0,20
    1938:	ef5ff0ef          	jal	182c <MFRC522_ClearBitMask>
    193c:	00000013          	nop
    1940:	00c12083          	lw	ra,12(sp)
    1944:	00812403          	lw	s0,8(sp)
    1948:	01010113          	addi	sp,sp,16
    194c:	00008067          	ret

00001950 <delay_ms>:
    1950:	fd010113          	addi	sp,sp,-48
    1954:	02812623          	sw	s0,44(sp)
    1958:	03010413          	addi	s0,sp,48
    195c:	fca42e23          	sw	a0,-36(s0)
    1960:	fe042623          	sw	zero,-20(s0)
    1964:	0300006f          	j	1994 <delay_ms+0x44>
    1968:	fe042423          	sw	zero,-24(s0)
    196c:	0100006f          	j	197c <delay_ms+0x2c>
    1970:	fe842783          	lw	a5,-24(s0)
    1974:	00178793          	addi	a5,a5,1
    1978:	fef42423          	sw	a5,-24(s0)
    197c:	fe842703          	lw	a4,-24(s0)
    1980:	3e700793          	li	a5,999
    1984:	fee7f6e3          	bgeu	a5,a4,1970 <delay_ms+0x20>
    1988:	fec42783          	lw	a5,-20(s0)
    198c:	00178793          	addi	a5,a5,1
    1990:	fef42623          	sw	a5,-20(s0)
    1994:	fec42783          	lw	a5,-20(s0)
    1998:	fdc42703          	lw	a4,-36(s0)
    199c:	fce7e6e3          	bltu	a5,a4,1968 <delay_ms+0x18>
    19a0:	00000013          	nop
    19a4:	00000013          	nop
    19a8:	02c12403          	lw	s0,44(sp)
    19ac:	03010113          	addi	sp,sp,48
    19b0:	00008067          	ret

000019b4 <MFRC522_CalculateCRC>:
    19b4:	fd010113          	addi	sp,sp,-48
    19b8:	02112623          	sw	ra,44(sp)
    19bc:	02812423          	sw	s0,40(sp)
    19c0:	02912223          	sw	s1,36(sp)
    19c4:	03010413          	addi	s0,sp,48
    19c8:	fca42e23          	sw	a0,-36(s0)
    19cc:	00058793          	mv	a5,a1
    19d0:	fcc42a23          	sw	a2,-44(s0)
    19d4:	fcf40da3          	sb	a5,-37(s0)
    19d8:	00400593          	li	a1,4
    19dc:	00500513          	li	a0,5
    19e0:	e4dff0ef          	jal	182c <MFRC522_ClearBitMask>
    19e4:	08000593          	li	a1,128
    19e8:	00a00513          	li	a0,10
    19ec:	dd1ff0ef          	jal	17bc <MFRC522_SetBitMask>
    19f0:	fe0407a3          	sb	zero,-17(s0)
    19f4:	02c0006f          	j	1a20 <MFRC522_CalculateCRC+0x6c>
    19f8:	fef44783          	lbu	a5,-17(s0)
    19fc:	fdc42703          	lw	a4,-36(s0)
    1a00:	00f707b3          	add	a5,a4,a5
    1a04:	0007c783          	lbu	a5,0(a5)
    1a08:	00078593          	mv	a1,a5
    1a0c:	00900513          	li	a0,9
    1a10:	bf9ff0ef          	jal	1608 <MFRC522_WriteReg>
    1a14:	fef44783          	lbu	a5,-17(s0)
    1a18:	00178793          	addi	a5,a5,1
    1a1c:	fef407a3          	sb	a5,-17(s0)
    1a20:	fef44703          	lbu	a4,-17(s0)
    1a24:	fdb44783          	lbu	a5,-37(s0)
    1a28:	fcf768e3          	bltu	a4,a5,19f8 <MFRC522_CalculateCRC+0x44>
    1a2c:	00300593          	li	a1,3
    1a30:	00100513          	li	a0,1
    1a34:	bd5ff0ef          	jal	1608 <MFRC522_WriteReg>
    1a38:	fff00793          	li	a5,-1
    1a3c:	fef407a3          	sb	a5,-17(s0)
    1a40:	00500513          	li	a0,5
    1a44:	c25ff0ef          	jal	1668 <MFRC522_ReadReg>
    1a48:	00050793          	mv	a5,a0
    1a4c:	fef40723          	sb	a5,-18(s0)
    1a50:	fef44783          	lbu	a5,-17(s0)
    1a54:	fff78793          	addi	a5,a5,-1
    1a58:	fef407a3          	sb	a5,-17(s0)
    1a5c:	fef44783          	lbu	a5,-17(s0)
    1a60:	00078863          	beqz	a5,1a70 <MFRC522_CalculateCRC+0xbc>
    1a64:	fee44783          	lbu	a5,-18(s0)
    1a68:	0047f793          	andi	a5,a5,4
    1a6c:	fc078ae3          	beqz	a5,1a40 <MFRC522_CalculateCRC+0x8c>
    1a70:	02100513          	li	a0,33
    1a74:	bf5ff0ef          	jal	1668 <MFRC522_ReadReg>
    1a78:	00050793          	mv	a5,a0
    1a7c:	00078713          	mv	a4,a5
    1a80:	fd442783          	lw	a5,-44(s0)
    1a84:	00e78023          	sb	a4,0(a5)
    1a88:	fd442783          	lw	a5,-44(s0)
    1a8c:	00178493          	addi	s1,a5,1
    1a90:	02200513          	li	a0,34
    1a94:	bd5ff0ef          	jal	1668 <MFRC522_ReadReg>
    1a98:	00050793          	mv	a5,a0
    1a9c:	00f48023          	sb	a5,0(s1)
    1aa0:	00000013          	nop
    1aa4:	02c12083          	lw	ra,44(sp)
    1aa8:	02812403          	lw	s0,40(sp)
    1aac:	02412483          	lw	s1,36(sp)
    1ab0:	03010113          	addi	sp,sp,48
    1ab4:	00008067          	ret

00001ab8 <MFRC522_ToCard>:
    1ab8:	fd010113          	addi	sp,sp,-48
    1abc:	02112623          	sw	ra,44(sp)
    1ac0:	02812423          	sw	s0,40(sp)
    1ac4:	02912223          	sw	s1,36(sp)
    1ac8:	03010413          	addi	s0,sp,48
    1acc:	00050793          	mv	a5,a0
    1ad0:	fcb42c23          	sw	a1,-40(s0)
    1ad4:	fcd42a23          	sw	a3,-44(s0)
    1ad8:	fce42823          	sw	a4,-48(s0)
    1adc:	fcf40fa3          	sb	a5,-33(s0)
    1ae0:	00060793          	mv	a5,a2
    1ae4:	fcf40f23          	sb	a5,-34(s0)
    1ae8:	fe0407a3          	sb	zero,-17(s0)
    1aec:	fe040723          	sb	zero,-18(s0)
    1af0:	fe0406a3          	sb	zero,-19(s0)
    1af4:	fdf44783          	lbu	a5,-33(s0)
    1af8:	00c00713          	li	a4,12
    1afc:	02e78063          	beq	a5,a4,1b1c <MFRC522_ToCard+0x64>
    1b00:	00e00713          	li	a4,14
    1b04:	02e79663          	bne	a5,a4,1b30 <MFRC522_ToCard+0x78>
    1b08:	01200793          	li	a5,18
    1b0c:	fef40723          	sb	a5,-18(s0)
    1b10:	01000793          	li	a5,16
    1b14:	fef406a3          	sb	a5,-19(s0)
    1b18:	01c0006f          	j	1b34 <MFRC522_ToCard+0x7c>
    1b1c:	07700793          	li	a5,119
    1b20:	fef40723          	sb	a5,-18(s0)
    1b24:	03000793          	li	a5,48
    1b28:	fef406a3          	sb	a5,-19(s0)
    1b2c:	0080006f          	j	1b34 <MFRC522_ToCard+0x7c>
    1b30:	00000013          	nop
    1b34:	fee44783          	lbu	a5,-18(s0)
    1b38:	f807e793          	ori	a5,a5,-128
    1b3c:	0ff7f793          	zext.b	a5,a5
    1b40:	00078593          	mv	a1,a5
    1b44:	00200513          	li	a0,2
    1b48:	ac1ff0ef          	jal	1608 <MFRC522_WriteReg>
    1b4c:	08000593          	li	a1,128
    1b50:	00400513          	li	a0,4
    1b54:	cd9ff0ef          	jal	182c <MFRC522_ClearBitMask>
    1b58:	08000593          	li	a1,128
    1b5c:	00a00513          	li	a0,10
    1b60:	c5dff0ef          	jal	17bc <MFRC522_SetBitMask>
    1b64:	00000593          	li	a1,0
    1b68:	00100513          	li	a0,1
    1b6c:	a9dff0ef          	jal	1608 <MFRC522_WriteReg>
    1b70:	fe041523          	sh	zero,-22(s0)
    1b74:	02c0006f          	j	1ba0 <MFRC522_ToCard+0xe8>
    1b78:	fea45783          	lhu	a5,-22(s0)
    1b7c:	fd842703          	lw	a4,-40(s0)
    1b80:	00f707b3          	add	a5,a4,a5
    1b84:	0007c783          	lbu	a5,0(a5)
    1b88:	00078593          	mv	a1,a5
    1b8c:	00900513          	li	a0,9
    1b90:	a79ff0ef          	jal	1608 <MFRC522_WriteReg>
    1b94:	fea45783          	lhu	a5,-22(s0)
    1b98:	00178793          	addi	a5,a5,1
    1b9c:	fef41523          	sh	a5,-22(s0)
    1ba0:	fde44783          	lbu	a5,-34(s0)
    1ba4:	01079793          	slli	a5,a5,0x10
    1ba8:	0107d793          	srli	a5,a5,0x10
    1bac:	fea45703          	lhu	a4,-22(s0)
    1bb0:	fcf764e3          	bltu	a4,a5,1b78 <MFRC522_ToCard+0xc0>
    1bb4:	fdf44783          	lbu	a5,-33(s0)
    1bb8:	00078593          	mv	a1,a5
    1bbc:	00100513          	li	a0,1
    1bc0:	a49ff0ef          	jal	1608 <MFRC522_WriteReg>
    1bc4:	fdf44703          	lbu	a4,-33(s0)
    1bc8:	00c00793          	li	a5,12
    1bcc:	00f71863          	bne	a4,a5,1bdc <MFRC522_ToCard+0x124>
    1bd0:	08000593          	li	a1,128
    1bd4:	00d00513          	li	a0,13
    1bd8:	be5ff0ef          	jal	17bc <MFRC522_SetBitMask>
    1bdc:	7d000793          	li	a5,2000
    1be0:	fef41523          	sh	a5,-22(s0)
    1be4:	00400513          	li	a0,4
    1be8:	a81ff0ef          	jal	1668 <MFRC522_ReadReg>
    1bec:	00050793          	mv	a5,a0
    1bf0:	fef40623          	sb	a5,-20(s0)
    1bf4:	fea45783          	lhu	a5,-22(s0)
    1bf8:	fff78793          	addi	a5,a5,-1
    1bfc:	fef41523          	sh	a5,-22(s0)
    1c00:	fea45783          	lhu	a5,-22(s0)
    1c04:	02078463          	beqz	a5,1c2c <MFRC522_ToCard+0x174>
    1c08:	fec44783          	lbu	a5,-20(s0)
    1c0c:	0017f793          	andi	a5,a5,1
    1c10:	00079e63          	bnez	a5,1c2c <MFRC522_ToCard+0x174>
    1c14:	fec44783          	lbu	a5,-20(s0)
    1c18:	00078713          	mv	a4,a5
    1c1c:	fed44783          	lbu	a5,-19(s0)
    1c20:	00f777b3          	and	a5,a4,a5
    1c24:	0ff7f793          	zext.b	a5,a5
    1c28:	fa078ee3          	beqz	a5,1be4 <MFRC522_ToCard+0x12c>
    1c2c:	08000593          	li	a1,128
    1c30:	00d00513          	li	a0,13
    1c34:	bf9ff0ef          	jal	182c <MFRC522_ClearBitMask>
    1c38:	fea45783          	lhu	a5,-22(s0)
    1c3c:	14078463          	beqz	a5,1d84 <MFRC522_ToCard+0x2cc>
    1c40:	00600513          	li	a0,6
    1c44:	a25ff0ef          	jal	1668 <MFRC522_ReadReg>
    1c48:	00050793          	mv	a5,a0
    1c4c:	01b7f793          	andi	a5,a5,27
    1c50:	12079863          	bnez	a5,1d80 <MFRC522_ToCard+0x2c8>
    1c54:	00100793          	li	a5,1
    1c58:	fef407a3          	sb	a5,-17(s0)
    1c5c:	fec44783          	lbu	a5,-20(s0)
    1c60:	00078713          	mv	a4,a5
    1c64:	fee44783          	lbu	a5,-18(s0)
    1c68:	00f777b3          	and	a5,a4,a5
    1c6c:	0ff7f793          	zext.b	a5,a5
    1c70:	0017f793          	andi	a5,a5,1
    1c74:	00078463          	beqz	a5,1c7c <MFRC522_ToCard+0x1c4>
    1c78:	fe0407a3          	sb	zero,-17(s0)
    1c7c:	fdf44703          	lbu	a4,-33(s0)
    1c80:	00c00793          	li	a5,12
    1c84:	10f71063          	bne	a4,a5,1d84 <MFRC522_ToCard+0x2cc>
    1c88:	00a00513          	li	a0,10
    1c8c:	9ddff0ef          	jal	1668 <MFRC522_ReadReg>
    1c90:	00050793          	mv	a5,a0
    1c94:	fef40623          	sb	a5,-20(s0)
    1c98:	00c00513          	li	a0,12
    1c9c:	9cdff0ef          	jal	1668 <MFRC522_ReadReg>
    1ca0:	00050793          	mv	a5,a0
    1ca4:	0077f793          	andi	a5,a5,7
    1ca8:	fef404a3          	sb	a5,-23(s0)
    1cac:	fe944783          	lbu	a5,-23(s0)
    1cb0:	04078263          	beqz	a5,1cf4 <MFRC522_ToCard+0x23c>
    1cb4:	fec44783          	lbu	a5,-20(s0)
    1cb8:	fff78793          	addi	a5,a5,-1
    1cbc:	01079793          	slli	a5,a5,0x10
    1cc0:	0107d793          	srli	a5,a5,0x10
    1cc4:	00379793          	slli	a5,a5,0x3
    1cc8:	01079713          	slli	a4,a5,0x10
    1ccc:	01075713          	srli	a4,a4,0x10
    1cd0:	fe944783          	lbu	a5,-23(s0)
    1cd4:	01079793          	slli	a5,a5,0x10
    1cd8:	0107d793          	srli	a5,a5,0x10
    1cdc:	00f707b3          	add	a5,a4,a5
    1ce0:	01079713          	slli	a4,a5,0x10
    1ce4:	01075713          	srli	a4,a4,0x10
    1ce8:	fd042783          	lw	a5,-48(s0)
    1cec:	00e79023          	sh	a4,0(a5)
    1cf0:	0240006f          	j	1d14 <MFRC522_ToCard+0x25c>
    1cf4:	fec44783          	lbu	a5,-20(s0)
    1cf8:	01079793          	slli	a5,a5,0x10
    1cfc:	0107d793          	srli	a5,a5,0x10
    1d00:	00379793          	slli	a5,a5,0x3
    1d04:	01079713          	slli	a4,a5,0x10
    1d08:	01075713          	srli	a4,a4,0x10
    1d0c:	fd042783          	lw	a5,-48(s0)
    1d10:	00e79023          	sh	a4,0(a5)
    1d14:	fec44783          	lbu	a5,-20(s0)
    1d18:	00079663          	bnez	a5,1d24 <MFRC522_ToCard+0x26c>
    1d1c:	00100793          	li	a5,1
    1d20:	fef40623          	sb	a5,-20(s0)
    1d24:	fec44703          	lbu	a4,-20(s0)
    1d28:	01000793          	li	a5,16
    1d2c:	00e7f663          	bgeu	a5,a4,1d38 <MFRC522_ToCard+0x280>
    1d30:	01000793          	li	a5,16
    1d34:	fef40623          	sb	a5,-20(s0)
    1d38:	fe041523          	sh	zero,-22(s0)
    1d3c:	02c0006f          	j	1d68 <MFRC522_ToCard+0x2b0>
    1d40:	fea45783          	lhu	a5,-22(s0)
    1d44:	fd442703          	lw	a4,-44(s0)
    1d48:	00f704b3          	add	s1,a4,a5
    1d4c:	00900513          	li	a0,9
    1d50:	919ff0ef          	jal	1668 <MFRC522_ReadReg>
    1d54:	00050793          	mv	a5,a0
    1d58:	00f48023          	sb	a5,0(s1)
    1d5c:	fea45783          	lhu	a5,-22(s0)
    1d60:	00178793          	addi	a5,a5,1
    1d64:	fef41523          	sh	a5,-22(s0)
    1d68:	fec44783          	lbu	a5,-20(s0)
    1d6c:	01079793          	slli	a5,a5,0x10
    1d70:	0107d793          	srli	a5,a5,0x10
    1d74:	fea45703          	lhu	a4,-22(s0)
    1d78:	fcf764e3          	bltu	a4,a5,1d40 <MFRC522_ToCard+0x288>
    1d7c:	0080006f          	j	1d84 <MFRC522_ToCard+0x2cc>
    1d80:	fe0407a3          	sb	zero,-17(s0)
    1d84:	fef44783          	lbu	a5,-17(s0)
    1d88:	00078513          	mv	a0,a5
    1d8c:	02c12083          	lw	ra,44(sp)
    1d90:	02812403          	lw	s0,40(sp)
    1d94:	02412483          	lw	s1,36(sp)
    1d98:	03010113          	addi	sp,sp,48
    1d9c:	00008067          	ret

00001da0 <MFRC522_Request>:
    1da0:	fd010113          	addi	sp,sp,-48
    1da4:	02112623          	sw	ra,44(sp)
    1da8:	02812423          	sw	s0,40(sp)
    1dac:	03010413          	addi	s0,sp,48
    1db0:	00050793          	mv	a5,a0
    1db4:	fcb42c23          	sw	a1,-40(s0)
    1db8:	fcf40fa3          	sb	a5,-33(s0)
    1dbc:	00700593          	li	a1,7
    1dc0:	00d00513          	li	a0,13
    1dc4:	845ff0ef          	jal	1608 <MFRC522_WriteReg>
    1dc8:	fd842783          	lw	a5,-40(s0)
    1dcc:	fdf44703          	lbu	a4,-33(s0)
    1dd0:	00e78023          	sb	a4,0(a5)
    1dd4:	fec40793          	addi	a5,s0,-20
    1dd8:	00078713          	mv	a4,a5
    1ddc:	fd842683          	lw	a3,-40(s0)
    1de0:	00100613          	li	a2,1
    1de4:	fd842583          	lw	a1,-40(s0)
    1de8:	00c00513          	li	a0,12
    1dec:	ccdff0ef          	jal	1ab8 <MFRC522_ToCard>
    1df0:	00050793          	mv	a5,a0
    1df4:	fef407a3          	sb	a5,-17(s0)
    1df8:	fef44703          	lbu	a4,-17(s0)
    1dfc:	00100793          	li	a5,1
    1e00:	00f71863          	bne	a4,a5,1e10 <MFRC522_Request+0x70>
    1e04:	fec45703          	lhu	a4,-20(s0)
    1e08:	01000793          	li	a5,16
    1e0c:	00f70463          	beq	a4,a5,1e14 <MFRC522_Request+0x74>
    1e10:	fe0407a3          	sb	zero,-17(s0)
    1e14:	fef44783          	lbu	a5,-17(s0)
    1e18:	00078513          	mv	a0,a5
    1e1c:	02c12083          	lw	ra,44(sp)
    1e20:	02812403          	lw	s0,40(sp)
    1e24:	03010113          	addi	sp,sp,48
    1e28:	00008067          	ret

00001e2c <MFRC522_Anticoll>:
    1e2c:	fd010113          	addi	sp,sp,-48
    1e30:	02112623          	sw	ra,44(sp)
    1e34:	02812423          	sw	s0,40(sp)
    1e38:	03010413          	addi	s0,sp,48
    1e3c:	fca42e23          	sw	a0,-36(s0)
    1e40:	fe0406a3          	sb	zero,-19(s0)
    1e44:	00000593          	li	a1,0
    1e48:	00d00513          	li	a0,13
    1e4c:	fbcff0ef          	jal	1608 <MFRC522_WriteReg>
    1e50:	fdc42783          	lw	a5,-36(s0)
    1e54:	f9300713          	li	a4,-109
    1e58:	00e78023          	sb	a4,0(a5)
    1e5c:	fdc42783          	lw	a5,-36(s0)
    1e60:	00178793          	addi	a5,a5,1
    1e64:	02000713          	li	a4,32
    1e68:	00e78023          	sb	a4,0(a5)
    1e6c:	fea40793          	addi	a5,s0,-22
    1e70:	00078713          	mv	a4,a5
    1e74:	fdc42683          	lw	a3,-36(s0)
    1e78:	00200613          	li	a2,2
    1e7c:	fdc42583          	lw	a1,-36(s0)
    1e80:	00c00513          	li	a0,12
    1e84:	c35ff0ef          	jal	1ab8 <MFRC522_ToCard>
    1e88:	00050793          	mv	a5,a0
    1e8c:	fef407a3          	sb	a5,-17(s0)
    1e90:	fef44703          	lbu	a4,-17(s0)
    1e94:	00100793          	li	a5,1
    1e98:	04f71e63          	bne	a4,a5,1ef4 <MFRC522_Anticoll+0xc8>
    1e9c:	fe040723          	sb	zero,-18(s0)
    1ea0:	02c0006f          	j	1ecc <MFRC522_Anticoll+0xa0>
    1ea4:	fee44783          	lbu	a5,-18(s0)
    1ea8:	fdc42703          	lw	a4,-36(s0)
    1eac:	00f707b3          	add	a5,a4,a5
    1eb0:	0007c783          	lbu	a5,0(a5)
    1eb4:	fed44703          	lbu	a4,-19(s0)
    1eb8:	00e7c7b3          	xor	a5,a5,a4
    1ebc:	fef406a3          	sb	a5,-19(s0)
    1ec0:	fee44783          	lbu	a5,-18(s0)
    1ec4:	00178793          	addi	a5,a5,1
    1ec8:	fef40723          	sb	a5,-18(s0)
    1ecc:	fee44703          	lbu	a4,-18(s0)
    1ed0:	00300793          	li	a5,3
    1ed4:	fce7f8e3          	bgeu	a5,a4,1ea4 <MFRC522_Anticoll+0x78>
    1ed8:	fee44783          	lbu	a5,-18(s0)
    1edc:	fdc42703          	lw	a4,-36(s0)
    1ee0:	00f707b3          	add	a5,a4,a5
    1ee4:	0007c783          	lbu	a5,0(a5)
    1ee8:	fed44703          	lbu	a4,-19(s0)
    1eec:	00f70463          	beq	a4,a5,1ef4 <MFRC522_Anticoll+0xc8>
    1ef0:	fe0407a3          	sb	zero,-17(s0)
    1ef4:	fef44783          	lbu	a5,-17(s0)
    1ef8:	00078513          	mv	a0,a5
    1efc:	02c12083          	lw	ra,44(sp)
    1f00:	02812403          	lw	s0,40(sp)
    1f04:	03010113          	addi	sp,sp,48
    1f08:	00008067          	ret

00001f0c <MFRC522_SelectTag>:
    1f0c:	fd010113          	addi	sp,sp,-48
    1f10:	02112623          	sw	ra,44(sp)
    1f14:	02812423          	sw	s0,40(sp)
    1f18:	03010413          	addi	s0,sp,48
    1f1c:	fca42e23          	sw	a0,-36(s0)
    1f20:	f9300793          	li	a5,-109
    1f24:	fef40023          	sb	a5,-32(s0)
    1f28:	07000793          	li	a5,112
    1f2c:	fef400a3          	sb	a5,-31(s0)
    1f30:	fe0407a3          	sb	zero,-17(s0)
    1f34:	0340006f          	j	1f68 <MFRC522_SelectTag+0x5c>
    1f38:	fef44783          	lbu	a5,-17(s0)
    1f3c:	fdc42703          	lw	a4,-36(s0)
    1f40:	00f70733          	add	a4,a4,a5
    1f44:	fef44783          	lbu	a5,-17(s0)
    1f48:	00278793          	addi	a5,a5,2
    1f4c:	00074703          	lbu	a4,0(a4)
    1f50:	ff078793          	addi	a5,a5,-16
    1f54:	008787b3          	add	a5,a5,s0
    1f58:	fee78823          	sb	a4,-16(a5)
    1f5c:	fef44783          	lbu	a5,-17(s0)
    1f60:	00178793          	addi	a5,a5,1
    1f64:	fef407a3          	sb	a5,-17(s0)
    1f68:	fef44703          	lbu	a4,-17(s0)
    1f6c:	00400793          	li	a5,4
    1f70:	fce7f4e3          	bgeu	a5,a4,1f38 <MFRC522_SelectTag+0x2c>
    1f74:	fe040793          	addi	a5,s0,-32
    1f78:	00778713          	addi	a4,a5,7
    1f7c:	fe040793          	addi	a5,s0,-32
    1f80:	00070613          	mv	a2,a4
    1f84:	00700593          	li	a1,7
    1f88:	00078513          	mv	a0,a5
    1f8c:	a29ff0ef          	jal	19b4 <MFRC522_CalculateCRC>
    1f90:	fea40713          	addi	a4,s0,-22
    1f94:	fe040693          	addi	a3,s0,-32
    1f98:	fe040793          	addi	a5,s0,-32
    1f9c:	00900613          	li	a2,9
    1fa0:	00078593          	mv	a1,a5
    1fa4:	00c00513          	li	a0,12
    1fa8:	b11ff0ef          	jal	1ab8 <MFRC522_ToCard>
    1fac:	00050793          	mv	a5,a0
    1fb0:	fef406a3          	sb	a5,-19(s0)
    1fb4:	fed44703          	lbu	a4,-19(s0)
    1fb8:	00100793          	li	a5,1
    1fbc:	00f71e63          	bne	a4,a5,1fd8 <MFRC522_SelectTag+0xcc>
    1fc0:	fea45703          	lhu	a4,-22(s0)
    1fc4:	01800793          	li	a5,24
    1fc8:	00f71863          	bne	a4,a5,1fd8 <MFRC522_SelectTag+0xcc>
    1fcc:	fe044783          	lbu	a5,-32(s0)
    1fd0:	fef40723          	sb	a5,-18(s0)
    1fd4:	0080006f          	j	1fdc <MFRC522_SelectTag+0xd0>
    1fd8:	fe040723          	sb	zero,-18(s0)
    1fdc:	fee44783          	lbu	a5,-18(s0)
    1fe0:	00078513          	mv	a0,a5
    1fe4:	02c12083          	lw	ra,44(sp)
    1fe8:	02812403          	lw	s0,40(sp)
    1fec:	03010113          	addi	sp,sp,48
    1ff0:	00008067          	ret

00001ff4 <MFRC522_IsCardPresent>:
    1ff4:	fc010113          	addi	sp,sp,-64
    1ff8:	02112e23          	sw	ra,60(sp)
    1ffc:	02812c23          	sw	s0,56(sp)
    2000:	04010413          	addi	s0,sp,64
    2004:	fca42623          	sw	a0,-52(s0)
    2008:	fdc40793          	addi	a5,s0,-36
    200c:	00078593          	mv	a1,a5
    2010:	02600513          	li	a0,38
    2014:	d8dff0ef          	jal	1da0 <MFRC522_Request>
    2018:	00050793          	mv	a5,a0
    201c:	fef407a3          	sb	a5,-17(s0)
    2020:	fef44703          	lbu	a4,-17(s0)
    2024:	00100793          	li	a5,1
    2028:	06f71c63          	bne	a4,a5,20a0 <MFRC522_IsCardPresent+0xac>
    202c:	fdc40793          	addi	a5,s0,-36
    2030:	00078513          	mv	a0,a5
    2034:	df9ff0ef          	jal	1e2c <MFRC522_Anticoll>
    2038:	00050793          	mv	a5,a0
    203c:	fef407a3          	sb	a5,-17(s0)
    2040:	fef44703          	lbu	a4,-17(s0)
    2044:	00100793          	li	a5,1
    2048:	04f71c63          	bne	a4,a5,20a0 <MFRC522_IsCardPresent+0xac>
    204c:	fe040723          	sb	zero,-18(s0)
    2050:	0300006f          	j	2080 <MFRC522_IsCardPresent+0x8c>
    2054:	fee44703          	lbu	a4,-18(s0)
    2058:	fee44783          	lbu	a5,-18(s0)
    205c:	fcc42683          	lw	a3,-52(s0)
    2060:	00f687b3          	add	a5,a3,a5
    2064:	ff070713          	addi	a4,a4,-16
    2068:	00870733          	add	a4,a4,s0
    206c:	fec74703          	lbu	a4,-20(a4)
    2070:	00e78023          	sb	a4,0(a5)
    2074:	fee44783          	lbu	a5,-18(s0)
    2078:	00178793          	addi	a5,a5,1
    207c:	fef40723          	sb	a5,-18(s0)
    2080:	fee44703          	lbu	a4,-18(s0)
    2084:	00300793          	li	a5,3
    2088:	fce7f6e3          	bgeu	a5,a4,2054 <MFRC522_IsCardPresent+0x60>
    208c:	fdc40793          	addi	a5,s0,-36
    2090:	00078513          	mv	a0,a5
    2094:	e79ff0ef          	jal	1f0c <MFRC522_SelectTag>
    2098:	00050793          	mv	a5,a0
    209c:	fef407a3          	sb	a5,-17(s0)
    20a0:	fef44783          	lbu	a5,-17(s0)
    20a4:	00078513          	mv	a0,a5
    20a8:	03c12083          	lw	ra,60(sp)
    20ac:	03812403          	lw	s0,56(sp)
    20b0:	04010113          	addi	sp,sp,64
    20b4:	00008067          	ret

000020b8 <simple_memset>:
    20b8:	fd010113          	addi	sp,sp,-48
    20bc:	02812623          	sw	s0,44(sp)
    20c0:	03010413          	addi	s0,sp,48
    20c4:	fca42e23          	sw	a0,-36(s0)
    20c8:	fcb42c23          	sw	a1,-40(s0)
    20cc:	fcc42a23          	sw	a2,-44(s0)
    20d0:	fdc42783          	lw	a5,-36(s0)
    20d4:	fef42423          	sw	a5,-24(s0)
    20d8:	fe042623          	sw	zero,-20(s0)
    20dc:	0280006f          	j	2104 <simple_memset+0x4c>
    20e0:	fe842703          	lw	a4,-24(s0)
    20e4:	fec42783          	lw	a5,-20(s0)
    20e8:	00f707b3          	add	a5,a4,a5
    20ec:	fd842703          	lw	a4,-40(s0)
    20f0:	0ff77713          	zext.b	a4,a4
    20f4:	00e78023          	sb	a4,0(a5)
    20f8:	fec42783          	lw	a5,-20(s0)
    20fc:	00178793          	addi	a5,a5,1
    2100:	fef42623          	sw	a5,-20(s0)
    2104:	fec42703          	lw	a4,-20(s0)
    2108:	fd442783          	lw	a5,-44(s0)
    210c:	fcf76ae3          	bltu	a4,a5,20e0 <simple_memset+0x28>
    2110:	00000013          	nop
    2114:	00000013          	nop
    2118:	02c12403          	lw	s0,44(sp)
    211c:	03010113          	addi	sp,sp,48
    2120:	00008067          	ret

00002124 <simple_memcpy>:
    2124:	fd010113          	addi	sp,sp,-48
    2128:	02812623          	sw	s0,44(sp)
    212c:	03010413          	addi	s0,sp,48
    2130:	fca42e23          	sw	a0,-36(s0)
    2134:	fcb42c23          	sw	a1,-40(s0)
    2138:	fcc42a23          	sw	a2,-44(s0)
    213c:	fdc42783          	lw	a5,-36(s0)
    2140:	fef42423          	sw	a5,-24(s0)
    2144:	fd842783          	lw	a5,-40(s0)
    2148:	fef42223          	sw	a5,-28(s0)
    214c:	fe042623          	sw	zero,-20(s0)
    2150:	0300006f          	j	2180 <simple_memcpy+0x5c>
    2154:	fe442703          	lw	a4,-28(s0)
    2158:	fec42783          	lw	a5,-20(s0)
    215c:	00f70733          	add	a4,a4,a5
    2160:	fe842683          	lw	a3,-24(s0)
    2164:	fec42783          	lw	a5,-20(s0)
    2168:	00f687b3          	add	a5,a3,a5
    216c:	00074703          	lbu	a4,0(a4)
    2170:	00e78023          	sb	a4,0(a5)
    2174:	fec42783          	lw	a5,-20(s0)
    2178:	00178793          	addi	a5,a5,1
    217c:	fef42623          	sw	a5,-20(s0)
    2180:	fec42703          	lw	a4,-20(s0)
    2184:	fd442783          	lw	a5,-44(s0)
    2188:	fcf766e3          	bltu	a4,a5,2154 <simple_memcpy+0x30>
    218c:	00000013          	nop
    2190:	00000013          	nop
    2194:	02c12403          	lw	s0,44(sp)
    2198:	03010113          	addi	sp,sp,48
    219c:	00008067          	ret

000021a0 <simple_strncpy>:
    21a0:	fd010113          	addi	sp,sp,-48
    21a4:	02812623          	sw	s0,44(sp)
    21a8:	03010413          	addi	s0,sp,48
    21ac:	fca42e23          	sw	a0,-36(s0)
    21b0:	fcb42c23          	sw	a1,-40(s0)
    21b4:	fcc42a23          	sw	a2,-44(s0)
    21b8:	fe042623          	sw	zero,-20(s0)
    21bc:	0300006f          	j	21ec <simple_strncpy+0x4c>
    21c0:	fd842703          	lw	a4,-40(s0)
    21c4:	fec42783          	lw	a5,-20(s0)
    21c8:	00f70733          	add	a4,a4,a5
    21cc:	fdc42683          	lw	a3,-36(s0)
    21d0:	fec42783          	lw	a5,-20(s0)
    21d4:	00f687b3          	add	a5,a3,a5
    21d8:	00074703          	lbu	a4,0(a4)
    21dc:	00e78023          	sb	a4,0(a5)
    21e0:	fec42783          	lw	a5,-20(s0)
    21e4:	00178793          	addi	a5,a5,1
    21e8:	fef42623          	sw	a5,-20(s0)
    21ec:	fec42703          	lw	a4,-20(s0)
    21f0:	fd442783          	lw	a5,-44(s0)
    21f4:	02f77c63          	bgeu	a4,a5,222c <simple_strncpy+0x8c>
    21f8:	fd842703          	lw	a4,-40(s0)
    21fc:	fec42783          	lw	a5,-20(s0)
    2200:	00f707b3          	add	a5,a4,a5
    2204:	0007c783          	lbu	a5,0(a5)
    2208:	fa079ce3          	bnez	a5,21c0 <simple_strncpy+0x20>
    220c:	0200006f          	j	222c <simple_strncpy+0x8c>
    2210:	fdc42703          	lw	a4,-36(s0)
    2214:	fec42783          	lw	a5,-20(s0)
    2218:	00f707b3          	add	a5,a4,a5
    221c:	00078023          	sb	zero,0(a5)
    2220:	fec42783          	lw	a5,-20(s0)
    2224:	00178793          	addi	a5,a5,1
    2228:	fef42623          	sw	a5,-20(s0)
    222c:	fec42703          	lw	a4,-20(s0)
    2230:	fd442783          	lw	a5,-44(s0)
    2234:	fcf76ee3          	bltu	a4,a5,2210 <simple_strncpy+0x70>
    2238:	00000013          	nop
    223c:	00000013          	nop
    2240:	02c12403          	lw	s0,44(sp)
    2244:	03010113          	addi	sp,sp,48
    2248:	00008067          	ret

0000224c <uid_compare>:
    224c:	fd010113          	addi	sp,sp,-48
    2250:	02812623          	sw	s0,44(sp)
    2254:	03010413          	addi	s0,sp,48
    2258:	fca42e23          	sw	a0,-36(s0)
    225c:	fcb42c23          	sw	a1,-40(s0)
    2260:	fe0407a3          	sb	zero,-17(s0)
    2264:	03c0006f          	j	22a0 <uid_compare+0x54>
    2268:	fef44783          	lbu	a5,-17(s0)
    226c:	fdc42703          	lw	a4,-36(s0)
    2270:	00f707b3          	add	a5,a4,a5
    2274:	0007c703          	lbu	a4,0(a5)
    2278:	fef44783          	lbu	a5,-17(s0)
    227c:	fd842683          	lw	a3,-40(s0)
    2280:	00f687b3          	add	a5,a3,a5
    2284:	0007c783          	lbu	a5,0(a5)
    2288:	00f70663          	beq	a4,a5,2294 <uid_compare+0x48>
    228c:	00000793          	li	a5,0
    2290:	0200006f          	j	22b0 <uid_compare+0x64>
    2294:	fef44783          	lbu	a5,-17(s0)
    2298:	00178793          	addi	a5,a5,1
    229c:	fef407a3          	sb	a5,-17(s0)
    22a0:	fef44703          	lbu	a4,-17(s0)
    22a4:	00300793          	li	a5,3
    22a8:	fce7f0e3          	bgeu	a5,a4,2268 <uid_compare+0x1c>
    22ac:	00100793          	li	a5,1
    22b0:	00078513          	mv	a0,a5
    22b4:	02c12403          	lw	s0,44(sp)
    22b8:	03010113          	addi	sp,sp,48
    22bc:	00008067          	ret

000022c0 <card_db_find_index>:
    22c0:	fd010113          	addi	sp,sp,-48
    22c4:	02112623          	sw	ra,44(sp)
    22c8:	02812423          	sw	s0,40(sp)
    22cc:	03010413          	addi	s0,sp,48
    22d0:	fca42e23          	sw	a0,-36(s0)
    22d4:	fe0407a3          	sb	zero,-17(s0)
    22d8:	0500006f          	j	2328 <card_db_find_index+0x68>
    22dc:	fef44703          	lbu	a4,-17(s0)
    22e0:	00070793          	mv	a5,a4
    22e4:	00279793          	slli	a5,a5,0x2
    22e8:	00e787b3          	add	a5,a5,a4
    22ec:	00279793          	slli	a5,a5,0x2
    22f0:	00e787b3          	add	a5,a5,a4
    22f4:	00005737          	lui	a4,0x5
    22f8:	95070713          	addi	a4,a4,-1712 # 4950 <card_db>
    22fc:	00e787b3          	add	a5,a5,a4
    2300:	fdc42583          	lw	a1,-36(s0)
    2304:	00078513          	mv	a0,a5
    2308:	f45ff0ef          	jal	224c <uid_compare>
    230c:	00050793          	mv	a5,a0
    2310:	00078663          	beqz	a5,231c <card_db_find_index+0x5c>
    2314:	fef44783          	lbu	a5,-17(s0)
    2318:	0240006f          	j	233c <card_db_find_index+0x7c>
    231c:	fef44783          	lbu	a5,-17(s0)
    2320:	00178793          	addi	a5,a5,1
    2324:	fef407a3          	sb	a5,-17(s0)
    2328:	000057b7          	lui	a5,0x5
    232c:	a227c783          	lbu	a5,-1502(a5) # 4a22 <card_count>
    2330:	fef44703          	lbu	a4,-17(s0)
    2334:	faf764e3          	bltu	a4,a5,22dc <card_db_find_index+0x1c>
    2338:	fff00793          	li	a5,-1
    233c:	00078513          	mv	a0,a5
    2340:	02c12083          	lw	ra,44(sp)
    2344:	02812403          	lw	s0,40(sp)
    2348:	03010113          	addi	sp,sp,48
    234c:	00008067          	ret

00002350 <card_db_init>:
    2350:	fe010113          	addi	sp,sp,-32
    2354:	00112e23          	sw	ra,28(sp)
    2358:	00812c23          	sw	s0,24(sp)
    235c:	02010413          	addi	s0,sp,32
    2360:	000057b7          	lui	a5,0x5
    2364:	a2078123          	sb	zero,-1502(a5) # 4a22 <card_count>
    2368:	0d200613          	li	a2,210
    236c:	00000593          	li	a1,0
    2370:	000057b7          	lui	a5,0x5
    2374:	95078513          	addi	a0,a5,-1712 # 4950 <card_db>
    2378:	d41ff0ef          	jal	20b8 <simple_memset>
    237c:	443327b7          	lui	a5,0x44332
    2380:	21178793          	addi	a5,a5,529 # 44332211 <_memory_end+0x44312211>
    2384:	fef42623          	sw	a5,-20(s0)
    2388:	fec40713          	addi	a4,s0,-20
    238c:	70418593          	addi	a1,gp,1796 # 46e4 <__global_pointer$+0x704>
    2390:	00070513          	mv	a0,a4
    2394:	034000ef          	jal	23c8 <card_db_add>
    2398:	ddccc7b7          	lui	a5,0xddccc
    239c:	baa78793          	addi	a5,a5,-1110 # ddccbbaa <_memory_end+0xddcabbaa>
    23a0:	fef42423          	sw	a5,-24(s0)
    23a4:	fe840713          	addi	a4,s0,-24
    23a8:	71018593          	addi	a1,gp,1808 # 46f0 <__global_pointer$+0x710>
    23ac:	00070513          	mv	a0,a4
    23b0:	018000ef          	jal	23c8 <card_db_add>
    23b4:	00000013          	nop
    23b8:	01c12083          	lw	ra,28(sp)
    23bc:	01812403          	lw	s0,24(sp)
    23c0:	02010113          	addi	sp,sp,32
    23c4:	00008067          	ret

000023c8 <card_db_add>:
    23c8:	fe010113          	addi	sp,sp,-32
    23cc:	00112e23          	sw	ra,28(sp)
    23d0:	00812c23          	sw	s0,24(sp)
    23d4:	02010413          	addi	s0,sp,32
    23d8:	fea42623          	sw	a0,-20(s0)
    23dc:	feb42423          	sw	a1,-24(s0)
    23e0:	000057b7          	lui	a5,0x5
    23e4:	a227c703          	lbu	a4,-1502(a5) # 4a22 <card_count>
    23e8:	00900793          	li	a5,9
    23ec:	00e7f663          	bgeu	a5,a4,23f8 <card_db_add+0x30>
    23f0:	00000793          	li	a5,0
    23f4:	1180006f          	j	250c <card_db_add+0x144>
    23f8:	fec42503          	lw	a0,-20(s0)
    23fc:	ec5ff0ef          	jal	22c0 <card_db_find_index>
    2400:	00050793          	mv	a5,a0
    2404:	0007c663          	bltz	a5,2410 <card_db_add+0x48>
    2408:	00000793          	li	a5,0
    240c:	1000006f          	j	250c <card_db_add+0x144>
    2410:	000057b7          	lui	a5,0x5
    2414:	a227c783          	lbu	a5,-1502(a5) # 4a22 <card_count>
    2418:	00078713          	mv	a4,a5
    241c:	00070793          	mv	a5,a4
    2420:	00279793          	slli	a5,a5,0x2
    2424:	00e787b3          	add	a5,a5,a4
    2428:	00279793          	slli	a5,a5,0x2
    242c:	00e787b3          	add	a5,a5,a4
    2430:	00005737          	lui	a4,0x5
    2434:	95070713          	addi	a4,a4,-1712 # 4950 <card_db>
    2438:	00e787b3          	add	a5,a5,a4
    243c:	00400613          	li	a2,4
    2440:	fec42583          	lw	a1,-20(s0)
    2444:	00078513          	mv	a0,a5
    2448:	cddff0ef          	jal	2124 <simple_memcpy>
    244c:	000057b7          	lui	a5,0x5
    2450:	a227c783          	lbu	a5,-1502(a5) # 4a22 <card_count>
    2454:	00078713          	mv	a4,a5
    2458:	000057b7          	lui	a5,0x5
    245c:	95078693          	addi	a3,a5,-1712 # 4950 <card_db>
    2460:	00070793          	mv	a5,a4
    2464:	00279793          	slli	a5,a5,0x2
    2468:	00e787b3          	add	a5,a5,a4
    246c:	00279793          	slli	a5,a5,0x2
    2470:	00e787b3          	add	a5,a5,a4
    2474:	00f687b3          	add	a5,a3,a5
    2478:	00100713          	li	a4,1
    247c:	00e78223          	sb	a4,4(a5)
    2480:	000057b7          	lui	a5,0x5
    2484:	a227c783          	lbu	a5,-1502(a5) # 4a22 <card_count>
    2488:	00078713          	mv	a4,a5
    248c:	00070793          	mv	a5,a4
    2490:	00279793          	slli	a5,a5,0x2
    2494:	00e787b3          	add	a5,a5,a4
    2498:	00279793          	slli	a5,a5,0x2
    249c:	00e787b3          	add	a5,a5,a4
    24a0:	00005737          	lui	a4,0x5
    24a4:	95070713          	addi	a4,a4,-1712 # 4950 <card_db>
    24a8:	00e787b3          	add	a5,a5,a4
    24ac:	00578793          	addi	a5,a5,5
    24b0:	00f00613          	li	a2,15
    24b4:	fe842583          	lw	a1,-24(s0)
    24b8:	00078513          	mv	a0,a5
    24bc:	ce5ff0ef          	jal	21a0 <simple_strncpy>
    24c0:	000057b7          	lui	a5,0x5
    24c4:	a227c783          	lbu	a5,-1502(a5) # 4a22 <card_count>
    24c8:	00078713          	mv	a4,a5
    24cc:	000057b7          	lui	a5,0x5
    24d0:	95078693          	addi	a3,a5,-1712 # 4950 <card_db>
    24d4:	00070793          	mv	a5,a4
    24d8:	00279793          	slli	a5,a5,0x2
    24dc:	00e787b3          	add	a5,a5,a4
    24e0:	00279793          	slli	a5,a5,0x2
    24e4:	00e787b3          	add	a5,a5,a4
    24e8:	00f687b3          	add	a5,a3,a5
    24ec:	00078a23          	sb	zero,20(a5)
    24f0:	000057b7          	lui	a5,0x5
    24f4:	a227c783          	lbu	a5,-1502(a5) # 4a22 <card_count>
    24f8:	00178793          	addi	a5,a5,1
    24fc:	0ff7f713          	zext.b	a4,a5
    2500:	000057b7          	lui	a5,0x5
    2504:	a2e78123          	sb	a4,-1502(a5) # 4a22 <card_count>
    2508:	00100793          	li	a5,1
    250c:	00078513          	mv	a0,a5
    2510:	01c12083          	lw	ra,28(sp)
    2514:	01812403          	lw	s0,24(sp)
    2518:	02010113          	addi	sp,sp,32
    251c:	00008067          	ret

00002520 <card_db_remove>:
    2520:	fd010113          	addi	sp,sp,-48
    2524:	02112623          	sw	ra,44(sp)
    2528:	02812423          	sw	s0,40(sp)
    252c:	03010413          	addi	s0,sp,48
    2530:	fca42e23          	sw	a0,-36(s0)
    2534:	fdc42503          	lw	a0,-36(s0)
    2538:	d89ff0ef          	jal	22c0 <card_db_find_index>
    253c:	fea42423          	sw	a0,-24(s0)
    2540:	fe842783          	lw	a5,-24(s0)
    2544:	0007d663          	bgez	a5,2550 <card_db_remove+0x30>
    2548:	00000793          	li	a5,0
    254c:	0a80006f          	j	25f4 <card_db_remove+0xd4>
    2550:	fe842783          	lw	a5,-24(s0)
    2554:	fef407a3          	sb	a5,-17(s0)
    2558:	06c0006f          	j	25c4 <card_db_remove+0xa4>
    255c:	fef44703          	lbu	a4,-17(s0)
    2560:	00070793          	mv	a5,a4
    2564:	00279793          	slli	a5,a5,0x2
    2568:	00e787b3          	add	a5,a5,a4
    256c:	00279793          	slli	a5,a5,0x2
    2570:	00e787b3          	add	a5,a5,a4
    2574:	00005737          	lui	a4,0x5
    2578:	95070713          	addi	a4,a4,-1712 # 4950 <card_db>
    257c:	00e786b3          	add	a3,a5,a4
    2580:	fef44783          	lbu	a5,-17(s0)
    2584:	00178713          	addi	a4,a5,1
    2588:	00070793          	mv	a5,a4
    258c:	00279793          	slli	a5,a5,0x2
    2590:	00e787b3          	add	a5,a5,a4
    2594:	00279793          	slli	a5,a5,0x2
    2598:	00e787b3          	add	a5,a5,a4
    259c:	00005737          	lui	a4,0x5
    25a0:	95070713          	addi	a4,a4,-1712 # 4950 <card_db>
    25a4:	00e787b3          	add	a5,a5,a4
    25a8:	01500613          	li	a2,21
    25ac:	00078593          	mv	a1,a5
    25b0:	00068513          	mv	a0,a3
    25b4:	b71ff0ef          	jal	2124 <simple_memcpy>
    25b8:	fef44783          	lbu	a5,-17(s0)
    25bc:	00178793          	addi	a5,a5,1
    25c0:	fef407a3          	sb	a5,-17(s0)
    25c4:	fef44703          	lbu	a4,-17(s0)
    25c8:	000057b7          	lui	a5,0x5
    25cc:	a227c783          	lbu	a5,-1502(a5) # 4a22 <card_count>
    25d0:	fff78793          	addi	a5,a5,-1
    25d4:	f8f744e3          	blt	a4,a5,255c <card_db_remove+0x3c>
    25d8:	000057b7          	lui	a5,0x5
    25dc:	a227c783          	lbu	a5,-1502(a5) # 4a22 <card_count>
    25e0:	fff78793          	addi	a5,a5,-1
    25e4:	0ff7f713          	zext.b	a4,a5
    25e8:	000057b7          	lui	a5,0x5
    25ec:	a2e78123          	sb	a4,-1502(a5) # 4a22 <card_count>
    25f0:	00100793          	li	a5,1
    25f4:	00078513          	mv	a0,a5
    25f8:	02c12083          	lw	ra,44(sp)
    25fc:	02812403          	lw	s0,40(sp)
    2600:	03010113          	addi	sp,sp,48
    2604:	00008067          	ret

00002608 <card_db_check>:
    2608:	fd010113          	addi	sp,sp,-48
    260c:	02112623          	sw	ra,44(sp)
    2610:	02812423          	sw	s0,40(sp)
    2614:	03010413          	addi	s0,sp,48
    2618:	fca42e23          	sw	a0,-36(s0)
    261c:	fdc42503          	lw	a0,-36(s0)
    2620:	ca1ff0ef          	jal	22c0 <card_db_find_index>
    2624:	fea42623          	sw	a0,-20(s0)
    2628:	fec42783          	lw	a5,-20(s0)
    262c:	0007d663          	bgez	a5,2638 <card_db_check+0x30>
    2630:	00000793          	li	a5,0
    2634:	02c0006f          	j	2660 <card_db_check+0x58>
    2638:	000057b7          	lui	a5,0x5
    263c:	95078693          	addi	a3,a5,-1712 # 4950 <card_db>
    2640:	fec42703          	lw	a4,-20(s0)
    2644:	00070793          	mv	a5,a4
    2648:	00279793          	slli	a5,a5,0x2
    264c:	00e787b3          	add	a5,a5,a4
    2650:	00279793          	slli	a5,a5,0x2
    2654:	00e787b3          	add	a5,a5,a4
    2658:	00f687b3          	add	a5,a3,a5
    265c:	0047c783          	lbu	a5,4(a5)
    2660:	00078513          	mv	a0,a5
    2664:	02c12083          	lw	ra,44(sp)
    2668:	02812403          	lw	s0,40(sp)
    266c:	03010113          	addi	sp,sp,48
    2670:	00008067          	ret

00002674 <card_db_set_enable>:
    2674:	fd010113          	addi	sp,sp,-48
    2678:	02112623          	sw	ra,44(sp)
    267c:	02812423          	sw	s0,40(sp)
    2680:	03010413          	addi	s0,sp,48
    2684:	fca42e23          	sw	a0,-36(s0)
    2688:	00058793          	mv	a5,a1
    268c:	fcf40da3          	sb	a5,-37(s0)
    2690:	fdc42503          	lw	a0,-36(s0)
    2694:	c2dff0ef          	jal	22c0 <card_db_find_index>
    2698:	fea42623          	sw	a0,-20(s0)
    269c:	fec42783          	lw	a5,-20(s0)
    26a0:	0007d663          	bgez	a5,26ac <card_db_set_enable+0x38>
    26a4:	00000793          	li	a5,0
    26a8:	0340006f          	j	26dc <card_db_set_enable+0x68>
    26ac:	000057b7          	lui	a5,0x5
    26b0:	95078693          	addi	a3,a5,-1712 # 4950 <card_db>
    26b4:	fec42703          	lw	a4,-20(s0)
    26b8:	00070793          	mv	a5,a4
    26bc:	00279793          	slli	a5,a5,0x2
    26c0:	00e787b3          	add	a5,a5,a4
    26c4:	00279793          	slli	a5,a5,0x2
    26c8:	00e787b3          	add	a5,a5,a4
    26cc:	00f687b3          	add	a5,a3,a5
    26d0:	fdb44703          	lbu	a4,-37(s0)
    26d4:	00e78223          	sb	a4,4(a5)
    26d8:	00100793          	li	a5,1
    26dc:	00078513          	mv	a0,a5
    26e0:	02c12083          	lw	ra,44(sp)
    26e4:	02812403          	lw	s0,40(sp)
    26e8:	03010113          	addi	sp,sp,48
    26ec:	00008067          	ret

000026f0 <card_db_count>:
    26f0:	ff010113          	addi	sp,sp,-16
    26f4:	00812623          	sw	s0,12(sp)
    26f8:	01010413          	addi	s0,sp,16
    26fc:	000057b7          	lui	a5,0x5
    2700:	a227c783          	lbu	a5,-1502(a5) # 4a22 <card_count>
    2704:	00078513          	mv	a0,a5
    2708:	00c12403          	lw	s0,12(sp)
    270c:	01010113          	addi	sp,sp,16
    2710:	00008067          	ret

00002714 <card_db_list>:
    2714:	ff010113          	addi	sp,sp,-16
    2718:	00812623          	sw	s0,12(sp)
    271c:	01010413          	addi	s0,sp,16
    2720:	00000013          	nop
    2724:	00c12403          	lw	s0,12(sp)
    2728:	01010113          	addi	sp,sp,16
    272c:	00008067          	ret

00002730 <gpio_read>:
    2730:	fe010113          	addi	sp,sp,-32
    2734:	00812e23          	sw	s0,28(sp)
    2738:	02010413          	addi	s0,sp,32
    273c:	000057b7          	lui	a5,0x5
    2740:	91c7a783          	lw	a5,-1764(a5) # 491c <CSRA_INPUT>
    2744:	0007a783          	lw	a5,0(a5)
    2748:	fef42623          	sw	a5,-20(s0)
    274c:	fec42783          	lw	a5,-20(s0)
    2750:	00078513          	mv	a0,a5
    2754:	01c12403          	lw	s0,28(sp)
    2758:	02010113          	addi	sp,sp,32
    275c:	00008067          	ret

00002760 <gpio_write>:
    2760:	fe010113          	addi	sp,sp,-32
    2764:	00812e23          	sw	s0,28(sp)
    2768:	02010413          	addi	s0,sp,32
    276c:	fea42623          	sw	a0,-20(s0)
    2770:	000057b7          	lui	a5,0x5
    2774:	9207a783          	lw	a5,-1760(a5) # 4920 <CSRA_OUTPUT>
    2778:	00078713          	mv	a4,a5
    277c:	fec42783          	lw	a5,-20(s0)
    2780:	00f72023          	sw	a5,0(a4)
    2784:	00000013          	nop
    2788:	01c12403          	lw	s0,28(sp)
    278c:	02010113          	addi	sp,sp,32
    2790:	00008067          	ret

00002794 <gpio_init>:
    2794:	fd010113          	addi	sp,sp,-48
    2798:	02812623          	sw	s0,44(sp)
    279c:	03010413          	addi	s0,sp,48
    27a0:	fca42e23          	sw	a0,-36(s0)
    27a4:	fcb42c23          	sw	a1,-40(s0)
    27a8:	fcc42a23          	sw	a2,-44(s0)
    27ac:	fcd42823          	sw	a3,-48(s0)
    27b0:	fe042623          	sw	zero,-20(s0)
    27b4:	000057b7          	lui	a5,0x5
    27b8:	9187a783          	lw	a5,-1768(a5) # 4918 <CSRA_DIR>
    27bc:	00078713          	mv	a4,a5
    27c0:	fdc42783          	lw	a5,-36(s0)
    27c4:	00f72023          	sw	a5,0(a4)
    27c8:	000057b7          	lui	a5,0x5
    27cc:	9207a783          	lw	a5,-1760(a5) # 4920 <CSRA_OUTPUT>
    27d0:	00078713          	mv	a4,a5
    27d4:	fec42783          	lw	a5,-20(s0)
    27d8:	00f72023          	sw	a5,0(a4)
    27dc:	000057b7          	lui	a5,0x5
    27e0:	92c7a783          	lw	a5,-1748(a5) # 492c <CSRA_EDGE>
    27e4:	00078713          	mv	a4,a5
    27e8:	fd842783          	lw	a5,-40(s0)
    27ec:	00f72023          	sw	a5,0(a4)
    27f0:	000057b7          	lui	a5,0x5
    27f4:	9307a783          	lw	a5,-1744(a5) # 4930 <CSRA_POL>
    27f8:	00078713          	mv	a4,a5
    27fc:	fd442783          	lw	a5,-44(s0)
    2800:	00f72023          	sw	a5,0(a4)
    2804:	fd042783          	lw	a5,-48(s0)
    2808:	fff7c793          	not	a5,a5
    280c:	fef42623          	sw	a5,-20(s0)
    2810:	000057b7          	lui	a5,0x5
    2814:	9247a783          	lw	a5,-1756(a5) # 4924 <CSRA_MASK>
    2818:	00078713          	mv	a4,a5
    281c:	fec42783          	lw	a5,-20(s0)
    2820:	00f72023          	sw	a5,0(a4)
    2824:	00000013          	nop
    2828:	02c12403          	lw	s0,44(sp)
    282c:	03010113          	addi	sp,sp,48
    2830:	00008067          	ret

00002834 <gpio_irq_enable>:
    2834:	fd010113          	addi	sp,sp,-48
    2838:	02812623          	sw	s0,44(sp)
    283c:	03010413          	addi	s0,sp,48
    2840:	fca42e23          	sw	a0,-36(s0)
    2844:	fdc42783          	lw	a5,-36(s0)
    2848:	fff7c793          	not	a5,a5
    284c:	fef42623          	sw	a5,-20(s0)
    2850:	000057b7          	lui	a5,0x5
    2854:	9247a783          	lw	a5,-1756(a5) # 4924 <CSRA_MASK>
    2858:	00078713          	mv	a4,a5
    285c:	fec42783          	lw	a5,-20(s0)
    2860:	00f72023          	sw	a5,0(a4)
    2864:	000057b7          	lui	a5,0x5
    2868:	9247a783          	lw	a5,-1756(a5) # 4924 <CSRA_MASK>
    286c:	0007a783          	lw	a5,0(a5)
    2870:	fef42623          	sw	a5,-20(s0)
    2874:	fec42783          	lw	a5,-20(s0)
    2878:	00078513          	mv	a0,a5
    287c:	02c12403          	lw	s0,44(sp)
    2880:	03010113          	addi	sp,sp,48
    2884:	00008067          	ret

00002888 <gpio_irq_edge>:
    2888:	fe010113          	addi	sp,sp,-32
    288c:	00812e23          	sw	s0,28(sp)
    2890:	02010413          	addi	s0,sp,32
    2894:	fea42623          	sw	a0,-20(s0)
    2898:	000057b7          	lui	a5,0x5
    289c:	92c7a783          	lw	a5,-1748(a5) # 492c <CSRA_EDGE>
    28a0:	00078713          	mv	a4,a5
    28a4:	fec42783          	lw	a5,-20(s0)
    28a8:	00f72023          	sw	a5,0(a4)
    28ac:	000057b7          	lui	a5,0x5
    28b0:	92c7a783          	lw	a5,-1748(a5) # 492c <CSRA_EDGE>
    28b4:	0007a783          	lw	a5,0(a5)
    28b8:	fef42623          	sw	a5,-20(s0)
    28bc:	fec42783          	lw	a5,-20(s0)
    28c0:	00078513          	mv	a0,a5
    28c4:	01c12403          	lw	s0,28(sp)
    28c8:	02010113          	addi	sp,sp,32
    28cc:	00008067          	ret

000028d0 <gpio_irq_pol>:
    28d0:	fe010113          	addi	sp,sp,-32
    28d4:	00812e23          	sw	s0,28(sp)
    28d8:	02010413          	addi	s0,sp,32
    28dc:	fea42623          	sw	a0,-20(s0)
    28e0:	000057b7          	lui	a5,0x5
    28e4:	9307a783          	lw	a5,-1744(a5) # 4930 <CSRA_POL>
    28e8:	00078713          	mv	a4,a5
    28ec:	fec42783          	lw	a5,-20(s0)
    28f0:	00f72023          	sw	a5,0(a4)
    28f4:	000057b7          	lui	a5,0x5
    28f8:	9307a783          	lw	a5,-1744(a5) # 4930 <CSRA_POL>
    28fc:	0007a783          	lw	a5,0(a5)
    2900:	fef42623          	sw	a5,-20(s0)
    2904:	fec42783          	lw	a5,-20(s0)
    2908:	00078513          	mv	a0,a5
    290c:	01c12403          	lw	s0,28(sp)
    2910:	02010113          	addi	sp,sp,32
    2914:	00008067          	ret

00002918 <gpio_irq_read>:
    2918:	fe010113          	addi	sp,sp,-32
    291c:	00812e23          	sw	s0,28(sp)
    2920:	02010413          	addi	s0,sp,32
    2924:	000057b7          	lui	a5,0x5
    2928:	9287a783          	lw	a5,-1752(a5) # 4928 <CSRA_IRQ>
    292c:	0007a783          	lw	a5,0(a5)
    2930:	fef42623          	sw	a5,-20(s0)
    2934:	fec42783          	lw	a5,-20(s0)
    2938:	00078513          	mv	a0,a5
    293c:	01c12403          	lw	s0,28(sp)
    2940:	02010113          	addi	sp,sp,32
    2944:	00008067          	ret

00002948 <gpio_irq_clear>:
    2948:	fd010113          	addi	sp,sp,-48
    294c:	02812623          	sw	s0,44(sp)
    2950:	03010413          	addi	s0,sp,48
    2954:	fca42e23          	sw	a0,-36(s0)
    2958:	000057b7          	lui	a5,0x5
    295c:	9287a783          	lw	a5,-1752(a5) # 4928 <CSRA_IRQ>
    2960:	0007a783          	lw	a5,0(a5)
    2964:	fef42623          	sw	a5,-20(s0)
    2968:	fec42703          	lw	a4,-20(s0)
    296c:	fdc42783          	lw	a5,-36(s0)
    2970:	00f777b3          	and	a5,a4,a5
    2974:	fef42623          	sw	a5,-20(s0)
    2978:	000057b7          	lui	a5,0x5
    297c:	9287a783          	lw	a5,-1752(a5) # 4928 <CSRA_IRQ>
    2980:	00078713          	mv	a4,a5
    2984:	fec42783          	lw	a5,-20(s0)
    2988:	00f72023          	sw	a5,0(a4)
    298c:	000057b7          	lui	a5,0x5
    2990:	9287a783          	lw	a5,-1752(a5) # 4928 <CSRA_IRQ>
    2994:	0007a783          	lw	a5,0(a5)
    2998:	fcf42e23          	sw	a5,-36(s0)
    299c:	fdc42783          	lw	a5,-36(s0)
    29a0:	00078513          	mv	a0,a5
    29a4:	02c12403          	lw	s0,44(sp)
    29a8:	03010113          	addi	sp,sp,48
    29ac:	00008067          	ret

000029b0 <gpio_csr>:
    29b0:	fe010113          	addi	sp,sp,-32
    29b4:	00112e23          	sw	ra,28(sp)
    29b8:	00812c23          	sw	s0,24(sp)
    29bc:	02010413          	addi	s0,sp,32
    29c0:	000057b7          	lui	a5,0x5
    29c4:	9107a783          	lw	a5,-1776(a5) # 4910 <CSRA_VERSION>
    29c8:	0007a783          	lw	a5,0(a5)
    29cc:	fef42623          	sw	a5,-20(s0)
    29d0:	fec42583          	lw	a1,-20(s0)
    29d4:	71c18513          	addi	a0,gp,1820 # 46fc <__global_pointer$+0x71c>
    29d8:	cadfd0ef          	jal	684 <my_printf>
    29dc:	000057b7          	lui	a5,0x5
    29e0:	9147a783          	lw	a5,-1772(a5) # 4914 <CSRA_NAME>
    29e4:	0007a783          	lw	a5,0(a5)
    29e8:	fef42623          	sw	a5,-20(s0)
    29ec:	fec42583          	lw	a1,-20(s0)
    29f0:	73418513          	addi	a0,gp,1844 # 4714 <__global_pointer$+0x734>
    29f4:	c91fd0ef          	jal	684 <my_printf>
    29f8:	000057b7          	lui	a5,0x5
    29fc:	9187a783          	lw	a5,-1768(a5) # 4918 <CSRA_DIR>
    2a00:	0007a783          	lw	a5,0(a5)
    2a04:	fef42623          	sw	a5,-20(s0)
    2a08:	fec42583          	lw	a1,-20(s0)
    2a0c:	74c18513          	addi	a0,gp,1868 # 472c <__global_pointer$+0x74c>
    2a10:	c75fd0ef          	jal	684 <my_printf>
    2a14:	000057b7          	lui	a5,0x5
    2a18:	91c7a783          	lw	a5,-1764(a5) # 491c <CSRA_INPUT>
    2a1c:	0007a783          	lw	a5,0(a5)
    2a20:	fef42623          	sw	a5,-20(s0)
    2a24:	fec42583          	lw	a1,-20(s0)
    2a28:	76418513          	addi	a0,gp,1892 # 4744 <__global_pointer$+0x764>
    2a2c:	c59fd0ef          	jal	684 <my_printf>
    2a30:	000057b7          	lui	a5,0x5
    2a34:	9207a783          	lw	a5,-1760(a5) # 4920 <CSRA_OUTPUT>
    2a38:	0007a783          	lw	a5,0(a5)
    2a3c:	fef42623          	sw	a5,-20(s0)
    2a40:	fec42583          	lw	a1,-20(s0)
    2a44:	77c18513          	addi	a0,gp,1916 # 475c <__global_pointer$+0x77c>
    2a48:	c3dfd0ef          	jal	684 <my_printf>
    2a4c:	000057b7          	lui	a5,0x5
    2a50:	9247a783          	lw	a5,-1756(a5) # 4924 <CSRA_MASK>
    2a54:	0007a783          	lw	a5,0(a5)
    2a58:	fef42623          	sw	a5,-20(s0)
    2a5c:	fec42583          	lw	a1,-20(s0)
    2a60:	79418513          	addi	a0,gp,1940 # 4774 <__global_pointer$+0x794>
    2a64:	c21fd0ef          	jal	684 <my_printf>
    2a68:	000057b7          	lui	a5,0x5
    2a6c:	9287a783          	lw	a5,-1752(a5) # 4928 <CSRA_IRQ>
    2a70:	0007a783          	lw	a5,0(a5)
    2a74:	fef42623          	sw	a5,-20(s0)
    2a78:	fec42583          	lw	a1,-20(s0)
    2a7c:	7ac18513          	addi	a0,gp,1964 # 478c <__global_pointer$+0x7ac>
    2a80:	c05fd0ef          	jal	684 <my_printf>
    2a84:	000057b7          	lui	a5,0x5
    2a88:	92c7a783          	lw	a5,-1748(a5) # 492c <CSRA_EDGE>
    2a8c:	0007a783          	lw	a5,0(a5)
    2a90:	fef42623          	sw	a5,-20(s0)
    2a94:	fec42583          	lw	a1,-20(s0)
    2a98:	7c418513          	addi	a0,gp,1988 # 47a4 <__global_pointer$+0x7c4>
    2a9c:	be9fd0ef          	jal	684 <my_printf>
    2aa0:	000057b7          	lui	a5,0x5
    2aa4:	9307a783          	lw	a5,-1744(a5) # 4930 <CSRA_POL>
    2aa8:	0007a783          	lw	a5,0(a5)
    2aac:	fef42623          	sw	a5,-20(s0)
    2ab0:	fec42583          	lw	a1,-20(s0)
    2ab4:	7dc18513          	addi	a0,gp,2012 # 47bc <__global_pointer$+0x7dc>
    2ab8:	bcdfd0ef          	jal	684 <my_printf>
    2abc:	00000013          	nop
    2ac0:	01c12083          	lw	ra,28(sp)
    2ac4:	01812403          	lw	s0,24(sp)
    2ac8:	02010113          	addi	sp,sp,32
    2acc:	00008067          	ret

00002ad0 <gpio_set_addr>:
    2ad0:	fe010113          	addi	sp,sp,-32
    2ad4:	00812e23          	sw	s0,28(sp)
    2ad8:	02010413          	addi	s0,sp,32
    2adc:	fea42623          	sw	a0,-20(s0)
    2ae0:	000057b7          	lui	a5,0x5
    2ae4:	fec42703          	lw	a4,-20(s0)
    2ae8:	90e7a623          	sw	a4,-1780(a5) # 490c <ADDR_GPIO>
    2aec:	000057b7          	lui	a5,0x5
    2af0:	fec42703          	lw	a4,-20(s0)
    2af4:	90e7a823          	sw	a4,-1776(a5) # 4910 <CSRA_VERSION>
    2af8:	fec42783          	lw	a5,-20(s0)
    2afc:	00478713          	addi	a4,a5,4
    2b00:	000057b7          	lui	a5,0x5
    2b04:	90e7aa23          	sw	a4,-1772(a5) # 4914 <CSRA_NAME>
    2b08:	fec42783          	lw	a5,-20(s0)
    2b0c:	01078713          	addi	a4,a5,16
    2b10:	000057b7          	lui	a5,0x5
    2b14:	90e7ac23          	sw	a4,-1768(a5) # 4918 <CSRA_DIR>
    2b18:	fec42783          	lw	a5,-20(s0)
    2b1c:	01478713          	addi	a4,a5,20
    2b20:	000057b7          	lui	a5,0x5
    2b24:	90e7ae23          	sw	a4,-1764(a5) # 491c <CSRA_INPUT>
    2b28:	fec42783          	lw	a5,-20(s0)
    2b2c:	01878713          	addi	a4,a5,24
    2b30:	000057b7          	lui	a5,0x5
    2b34:	92e7a023          	sw	a4,-1760(a5) # 4920 <CSRA_OUTPUT>
    2b38:	fec42783          	lw	a5,-20(s0)
    2b3c:	01c78713          	addi	a4,a5,28
    2b40:	000057b7          	lui	a5,0x5
    2b44:	92e7a223          	sw	a4,-1756(a5) # 4924 <CSRA_MASK>
    2b48:	fec42783          	lw	a5,-20(s0)
    2b4c:	02078713          	addi	a4,a5,32
    2b50:	000057b7          	lui	a5,0x5
    2b54:	92e7a423          	sw	a4,-1752(a5) # 4928 <CSRA_IRQ>
    2b58:	fec42783          	lw	a5,-20(s0)
    2b5c:	02478713          	addi	a4,a5,36
    2b60:	000057b7          	lui	a5,0x5
    2b64:	92e7a623          	sw	a4,-1748(a5) # 492c <CSRA_EDGE>
    2b68:	fec42783          	lw	a5,-20(s0)
    2b6c:	02878713          	addi	a4,a5,40
    2b70:	000057b7          	lui	a5,0x5
    2b74:	92e7a823          	sw	a4,-1744(a5) # 4930 <CSRA_POL>
    2b78:	00000793          	li	a5,0
    2b7c:	00078513          	mv	a0,a5
    2b80:	01c12403          	lw	s0,28(sp)
    2b84:	02010113          	addi	sp,sp,32
    2b88:	00008067          	ret

00002b8c <gpio_get_addr>:
    2b8c:	ff010113          	addi	sp,sp,-16
    2b90:	00812623          	sw	s0,12(sp)
    2b94:	01010413          	addi	s0,sp,16
    2b98:	000057b7          	lui	a5,0x5
    2b9c:	90c7a783          	lw	a5,-1780(a5) # 490c <ADDR_GPIO>
    2ba0:	00078513          	mv	a0,a5
    2ba4:	00c12403          	lw	s0,12(sp)
    2ba8:	01010113          	addi	sp,sp,16
    2bac:	00008067          	ret

00002bb0 <__adddf3>:
    2bb0:	00100837          	lui	a6,0x100
    2bb4:	fff80813          	addi	a6,a6,-1 # fffff <_memory_end+0xdffff>
    2bb8:	fe010113          	addi	sp,sp,-32
    2bbc:	00b878b3          	and	a7,a6,a1
    2bc0:	0145d713          	srli	a4,a1,0x14
    2bc4:	01d55793          	srli	a5,a0,0x1d
    2bc8:	00d87833          	and	a6,a6,a3
    2bcc:	00912a23          	sw	s1,20(sp)
    2bd0:	7ff77493          	andi	s1,a4,2047
    2bd4:	00389713          	slli	a4,a7,0x3
    2bd8:	0146d893          	srli	a7,a3,0x14
    2bdc:	00381813          	slli	a6,a6,0x3
    2be0:	01212823          	sw	s2,16(sp)
    2be4:	00e7e7b3          	or	a5,a5,a4
    2be8:	7ff8f893          	andi	a7,a7,2047
    2bec:	01d65713          	srli	a4,a2,0x1d
    2bf0:	00112e23          	sw	ra,28(sp)
    2bf4:	00812c23          	sw	s0,24(sp)
    2bf8:	01312623          	sw	s3,12(sp)
    2bfc:	01f5d913          	srli	s2,a1,0x1f
    2c00:	01f6d693          	srli	a3,a3,0x1f
    2c04:	01076733          	or	a4,a4,a6
    2c08:	00351513          	slli	a0,a0,0x3
    2c0c:	00361613          	slli	a2,a2,0x3
    2c10:	41148833          	sub	a6,s1,a7
    2c14:	2ad91a63          	bne	s2,a3,2ec8 <__adddf3+0x318>
    2c18:	11005c63          	blez	a6,2d30 <__adddf3+0x180>
    2c1c:	04089063          	bnez	a7,2c5c <__adddf3+0xac>
    2c20:	00c766b3          	or	a3,a4,a2
    2c24:	66068063          	beqz	a3,3284 <__adddf3+0x6d4>
    2c28:	fff80593          	addi	a1,a6,-1
    2c2c:	02059063          	bnez	a1,2c4c <__adddf3+0x9c>
    2c30:	00c50633          	add	a2,a0,a2
    2c34:	00a636b3          	sltu	a3,a2,a0
    2c38:	00e78733          	add	a4,a5,a4
    2c3c:	00060513          	mv	a0,a2
    2c40:	00d707b3          	add	a5,a4,a3
    2c44:	00100493          	li	s1,1
    2c48:	06c0006f          	j	2cb4 <__adddf3+0x104>
    2c4c:	7ff00693          	li	a3,2047
    2c50:	02d81063          	bne	a6,a3,2c70 <__adddf3+0xc0>
    2c54:	7ff00493          	li	s1,2047
    2c58:	1f80006f          	j	2e50 <__adddf3+0x2a0>
    2c5c:	7ff00693          	li	a3,2047
    2c60:	1ed48863          	beq	s1,a3,2e50 <__adddf3+0x2a0>
    2c64:	008006b7          	lui	a3,0x800
    2c68:	00d76733          	or	a4,a4,a3
    2c6c:	00080593          	mv	a1,a6
    2c70:	03800693          	li	a3,56
    2c74:	0ab6c863          	blt	a3,a1,2d24 <__adddf3+0x174>
    2c78:	01f00693          	li	a3,31
    2c7c:	06b6ca63          	blt	a3,a1,2cf0 <__adddf3+0x140>
    2c80:	02000813          	li	a6,32
    2c84:	40b80833          	sub	a6,a6,a1
    2c88:	010716b3          	sll	a3,a4,a6
    2c8c:	00b658b3          	srl	a7,a2,a1
    2c90:	01061833          	sll	a6,a2,a6
    2c94:	0116e6b3          	or	a3,a3,a7
    2c98:	01003833          	snez	a6,a6
    2c9c:	0106e6b3          	or	a3,a3,a6
    2ca0:	00b755b3          	srl	a1,a4,a1
    2ca4:	00a68533          	add	a0,a3,a0
    2ca8:	00f585b3          	add	a1,a1,a5
    2cac:	00d536b3          	sltu	a3,a0,a3
    2cb0:	00d587b3          	add	a5,a1,a3
    2cb4:	00879713          	slli	a4,a5,0x8
    2cb8:	18075c63          	bgez	a4,2e50 <__adddf3+0x2a0>
    2cbc:	00148493          	addi	s1,s1,1
    2cc0:	7ff00713          	li	a4,2047
    2cc4:	5ae48a63          	beq	s1,a4,3278 <__adddf3+0x6c8>
    2cc8:	ff800737          	lui	a4,0xff800
    2ccc:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    2cd0:	00e7f733          	and	a4,a5,a4
    2cd4:	00155793          	srli	a5,a0,0x1
    2cd8:	00157513          	andi	a0,a0,1
    2cdc:	00a7e7b3          	or	a5,a5,a0
    2ce0:	01f71513          	slli	a0,a4,0x1f
    2ce4:	00f56533          	or	a0,a0,a5
    2ce8:	00175793          	srli	a5,a4,0x1
    2cec:	1640006f          	j	2e50 <__adddf3+0x2a0>
    2cf0:	fe058693          	addi	a3,a1,-32
    2cf4:	02000893          	li	a7,32
    2cf8:	00d756b3          	srl	a3,a4,a3
    2cfc:	00000813          	li	a6,0
    2d00:	01158863          	beq	a1,a7,2d10 <__adddf3+0x160>
    2d04:	04000813          	li	a6,64
    2d08:	40b80833          	sub	a6,a6,a1
    2d0c:	01071833          	sll	a6,a4,a6
    2d10:	00c86833          	or	a6,a6,a2
    2d14:	01003833          	snez	a6,a6
    2d18:	0106e6b3          	or	a3,a3,a6
    2d1c:	00000593          	li	a1,0
    2d20:	f85ff06f          	j	2ca4 <__adddf3+0xf4>
    2d24:	00c766b3          	or	a3,a4,a2
    2d28:	00d036b3          	snez	a3,a3
    2d2c:	ff1ff06f          	j	2d1c <__adddf3+0x16c>
    2d30:	0c080a63          	beqz	a6,2e04 <__adddf3+0x254>
    2d34:	409886b3          	sub	a3,a7,s1
    2d38:	02049463          	bnez	s1,2d60 <__adddf3+0x1b0>
    2d3c:	00a7e5b3          	or	a1,a5,a0
    2d40:	50058e63          	beqz	a1,325c <__adddf3+0x6ac>
    2d44:	fff68593          	addi	a1,a3,-1 # 7fffff <_memory_end+0x7dffff>
    2d48:	ee0584e3          	beqz	a1,2c30 <__adddf3+0x80>
    2d4c:	7ff00813          	li	a6,2047
    2d50:	03069263          	bne	a3,a6,2d74 <__adddf3+0x1c4>
    2d54:	00070793          	mv	a5,a4
    2d58:	00060513          	mv	a0,a2
    2d5c:	ef9ff06f          	j	2c54 <__adddf3+0xa4>
    2d60:	7ff00593          	li	a1,2047
    2d64:	feb888e3          	beq	a7,a1,2d54 <__adddf3+0x1a4>
    2d68:	008005b7          	lui	a1,0x800
    2d6c:	00b7e7b3          	or	a5,a5,a1
    2d70:	00068593          	mv	a1,a3
    2d74:	03800693          	li	a3,56
    2d78:	08b6c063          	blt	a3,a1,2df8 <__adddf3+0x248>
    2d7c:	01f00693          	li	a3,31
    2d80:	04b6c263          	blt	a3,a1,2dc4 <__adddf3+0x214>
    2d84:	02000813          	li	a6,32
    2d88:	40b80833          	sub	a6,a6,a1
    2d8c:	010796b3          	sll	a3,a5,a6
    2d90:	00b55333          	srl	t1,a0,a1
    2d94:	01051833          	sll	a6,a0,a6
    2d98:	0066e6b3          	or	a3,a3,t1
    2d9c:	01003833          	snez	a6,a6
    2da0:	0106e6b3          	or	a3,a3,a6
    2da4:	00b7d5b3          	srl	a1,a5,a1
    2da8:	00c68633          	add	a2,a3,a2
    2dac:	00e585b3          	add	a1,a1,a4
    2db0:	00d636b3          	sltu	a3,a2,a3
    2db4:	00060513          	mv	a0,a2
    2db8:	00d587b3          	add	a5,a1,a3
    2dbc:	00088493          	mv	s1,a7
    2dc0:	ef5ff06f          	j	2cb4 <__adddf3+0x104>
    2dc4:	fe058693          	addi	a3,a1,-32 # 7fffe0 <_memory_end+0x7dffe0>
    2dc8:	02000313          	li	t1,32
    2dcc:	00d7d6b3          	srl	a3,a5,a3
    2dd0:	00000813          	li	a6,0
    2dd4:	00658863          	beq	a1,t1,2de4 <__adddf3+0x234>
    2dd8:	04000813          	li	a6,64
    2ddc:	40b80833          	sub	a6,a6,a1
    2de0:	01079833          	sll	a6,a5,a6
    2de4:	00a86833          	or	a6,a6,a0
    2de8:	01003833          	snez	a6,a6
    2dec:	0106e6b3          	or	a3,a3,a6
    2df0:	00000593          	li	a1,0
    2df4:	fb5ff06f          	j	2da8 <__adddf3+0x1f8>
    2df8:	00a7e6b3          	or	a3,a5,a0
    2dfc:	00d036b3          	snez	a3,a3
    2e00:	ff1ff06f          	j	2df0 <__adddf3+0x240>
    2e04:	00148693          	addi	a3,s1,1
    2e08:	7fe6f593          	andi	a1,a3,2046
    2e0c:	08059663          	bnez	a1,2e98 <__adddf3+0x2e8>
    2e10:	00a7e6b3          	or	a3,a5,a0
    2e14:	06049263          	bnez	s1,2e78 <__adddf3+0x2c8>
    2e18:	44068863          	beqz	a3,3268 <__adddf3+0x6b8>
    2e1c:	00c766b3          	or	a3,a4,a2
    2e20:	02068863          	beqz	a3,2e50 <__adddf3+0x2a0>
    2e24:	00c50633          	add	a2,a0,a2
    2e28:	00a636b3          	sltu	a3,a2,a0
    2e2c:	00e78733          	add	a4,a5,a4
    2e30:	00d707b3          	add	a5,a4,a3
    2e34:	00879713          	slli	a4,a5,0x8
    2e38:	00060513          	mv	a0,a2
    2e3c:	00075a63          	bgez	a4,2e50 <__adddf3+0x2a0>
    2e40:	ff800737          	lui	a4,0xff800
    2e44:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    2e48:	00e7f7b3          	and	a5,a5,a4
    2e4c:	00100493          	li	s1,1
    2e50:	00757713          	andi	a4,a0,7
    2e54:	44070863          	beqz	a4,32a4 <__adddf3+0x6f4>
    2e58:	00f57713          	andi	a4,a0,15
    2e5c:	00400693          	li	a3,4
    2e60:	44d70263          	beq	a4,a3,32a4 <__adddf3+0x6f4>
    2e64:	00450713          	addi	a4,a0,4 # a0000004 <_memory_end+0x9ffe0004>
    2e68:	00a736b3          	sltu	a3,a4,a0
    2e6c:	00d787b3          	add	a5,a5,a3
    2e70:	00070513          	mv	a0,a4
    2e74:	4300006f          	j	32a4 <__adddf3+0x6f4>
    2e78:	ec068ee3          	beqz	a3,2d54 <__adddf3+0x1a4>
    2e7c:	00c76633          	or	a2,a4,a2
    2e80:	dc060ae3          	beqz	a2,2c54 <__adddf3+0xa4>
    2e84:	00000913          	li	s2,0
    2e88:	004007b7          	lui	a5,0x400
    2e8c:	00000513          	li	a0,0
    2e90:	7ff00493          	li	s1,2047
    2e94:	4100006f          	j	32a4 <__adddf3+0x6f4>
    2e98:	7ff00593          	li	a1,2047
    2e9c:	3cb68c63          	beq	a3,a1,3274 <__adddf3+0x6c4>
    2ea0:	00c50633          	add	a2,a0,a2
    2ea4:	00a63533          	sltu	a0,a2,a0
    2ea8:	00e78733          	add	a4,a5,a4
    2eac:	00a70733          	add	a4,a4,a0
    2eb0:	01f71513          	slli	a0,a4,0x1f
    2eb4:	00165613          	srli	a2,a2,0x1
    2eb8:	00c56533          	or	a0,a0,a2
    2ebc:	00175793          	srli	a5,a4,0x1
    2ec0:	00068493          	mv	s1,a3
    2ec4:	f8dff06f          	j	2e50 <__adddf3+0x2a0>
    2ec8:	0f005c63          	blez	a6,2fc0 <__adddf3+0x410>
    2ecc:	08089e63          	bnez	a7,2f68 <__adddf3+0x3b8>
    2ed0:	00c766b3          	or	a3,a4,a2
    2ed4:	3a068863          	beqz	a3,3284 <__adddf3+0x6d4>
    2ed8:	fff80693          	addi	a3,a6,-1
    2edc:	02069063          	bnez	a3,2efc <__adddf3+0x34c>
    2ee0:	40c50633          	sub	a2,a0,a2
    2ee4:	00c536b3          	sltu	a3,a0,a2
    2ee8:	40e78733          	sub	a4,a5,a4
    2eec:	00060513          	mv	a0,a2
    2ef0:	40d707b3          	sub	a5,a4,a3
    2ef4:	00100493          	li	s1,1
    2ef8:	0540006f          	j	2f4c <__adddf3+0x39c>
    2efc:	7ff00593          	li	a1,2047
    2f00:	d4b80ae3          	beq	a6,a1,2c54 <__adddf3+0xa4>
    2f04:	03800593          	li	a1,56
    2f08:	0ad5c663          	blt	a1,a3,2fb4 <__adddf3+0x404>
    2f0c:	01f00593          	li	a1,31
    2f10:	06d5c863          	blt	a1,a3,2f80 <__adddf3+0x3d0>
    2f14:	02000813          	li	a6,32
    2f18:	40d80833          	sub	a6,a6,a3
    2f1c:	00d658b3          	srl	a7,a2,a3
    2f20:	010715b3          	sll	a1,a4,a6
    2f24:	01061833          	sll	a6,a2,a6
    2f28:	0115e5b3          	or	a1,a1,a7
    2f2c:	01003833          	snez	a6,a6
    2f30:	0105e633          	or	a2,a1,a6
    2f34:	00d756b3          	srl	a3,a4,a3
    2f38:	40c50633          	sub	a2,a0,a2
    2f3c:	00c53733          	sltu	a4,a0,a2
    2f40:	40d786b3          	sub	a3,a5,a3
    2f44:	00060513          	mv	a0,a2
    2f48:	40e687b3          	sub	a5,a3,a4
    2f4c:	00879713          	slli	a4,a5,0x8
    2f50:	f00750e3          	bgez	a4,2e50 <__adddf3+0x2a0>
    2f54:	00800437          	lui	s0,0x800
    2f58:	fff40413          	addi	s0,s0,-1 # 7fffff <_memory_end+0x7dffff>
    2f5c:	0087f433          	and	s0,a5,s0
    2f60:	00050993          	mv	s3,a0
    2f64:	2100006f          	j	3174 <__adddf3+0x5c4>
    2f68:	7ff00693          	li	a3,2047
    2f6c:	eed482e3          	beq	s1,a3,2e50 <__adddf3+0x2a0>
    2f70:	008006b7          	lui	a3,0x800
    2f74:	00d76733          	or	a4,a4,a3
    2f78:	00080693          	mv	a3,a6
    2f7c:	f89ff06f          	j	2f04 <__adddf3+0x354>
    2f80:	fe068593          	addi	a1,a3,-32 # 7fffe0 <_memory_end+0x7dffe0>
    2f84:	02000893          	li	a7,32
    2f88:	00b755b3          	srl	a1,a4,a1
    2f8c:	00000813          	li	a6,0
    2f90:	01168863          	beq	a3,a7,2fa0 <__adddf3+0x3f0>
    2f94:	04000813          	li	a6,64
    2f98:	40d80833          	sub	a6,a6,a3
    2f9c:	01071833          	sll	a6,a4,a6
    2fa0:	00c86833          	or	a6,a6,a2
    2fa4:	01003833          	snez	a6,a6
    2fa8:	0105e633          	or	a2,a1,a6
    2fac:	00000693          	li	a3,0
    2fb0:	f89ff06f          	j	2f38 <__adddf3+0x388>
    2fb4:	00c76633          	or	a2,a4,a2
    2fb8:	00c03633          	snez	a2,a2
    2fbc:	ff1ff06f          	j	2fac <__adddf3+0x3fc>
    2fc0:	0e080863          	beqz	a6,30b0 <__adddf3+0x500>
    2fc4:	40988833          	sub	a6,a7,s1
    2fc8:	04049263          	bnez	s1,300c <__adddf3+0x45c>
    2fcc:	00a7e5b3          	or	a1,a5,a0
    2fd0:	2a058e63          	beqz	a1,328c <__adddf3+0x6dc>
    2fd4:	fff80593          	addi	a1,a6,-1
    2fd8:	00059e63          	bnez	a1,2ff4 <__adddf3+0x444>
    2fdc:	40a60533          	sub	a0,a2,a0
    2fe0:	40f70733          	sub	a4,a4,a5
    2fe4:	00a63633          	sltu	a2,a2,a0
    2fe8:	40c707b3          	sub	a5,a4,a2
    2fec:	00068913          	mv	s2,a3
    2ff0:	f05ff06f          	j	2ef4 <__adddf3+0x344>
    2ff4:	7ff00313          	li	t1,2047
    2ff8:	02681463          	bne	a6,t1,3020 <__adddf3+0x470>
    2ffc:	00070793          	mv	a5,a4
    3000:	00060513          	mv	a0,a2
    3004:	7ff00493          	li	s1,2047
    3008:	0d00006f          	j	30d8 <__adddf3+0x528>
    300c:	7ff00593          	li	a1,2047
    3010:	feb886e3          	beq	a7,a1,2ffc <__adddf3+0x44c>
    3014:	008005b7          	lui	a1,0x800
    3018:	00b7e7b3          	or	a5,a5,a1
    301c:	00080593          	mv	a1,a6
    3020:	03800813          	li	a6,56
    3024:	08b84063          	blt	a6,a1,30a4 <__adddf3+0x4f4>
    3028:	01f00813          	li	a6,31
    302c:	04b84263          	blt	a6,a1,3070 <__adddf3+0x4c0>
    3030:	02000313          	li	t1,32
    3034:	40b30333          	sub	t1,t1,a1
    3038:	00b55e33          	srl	t3,a0,a1
    303c:	00679833          	sll	a6,a5,t1
    3040:	00651333          	sll	t1,a0,t1
    3044:	01c86833          	or	a6,a6,t3
    3048:	00603333          	snez	t1,t1
    304c:	00686533          	or	a0,a6,t1
    3050:	00b7d5b3          	srl	a1,a5,a1
    3054:	40a60533          	sub	a0,a2,a0
    3058:	40b705b3          	sub	a1,a4,a1
    305c:	00a63633          	sltu	a2,a2,a0
    3060:	40c587b3          	sub	a5,a1,a2
    3064:	00088493          	mv	s1,a7
    3068:	00068913          	mv	s2,a3
    306c:	ee1ff06f          	j	2f4c <__adddf3+0x39c>
    3070:	fe058813          	addi	a6,a1,-32 # 7fffe0 <_memory_end+0x7dffe0>
    3074:	02000e13          	li	t3,32
    3078:	0107d833          	srl	a6,a5,a6
    307c:	00000313          	li	t1,0
    3080:	01c58863          	beq	a1,t3,3090 <__adddf3+0x4e0>
    3084:	04000313          	li	t1,64
    3088:	40b30333          	sub	t1,t1,a1
    308c:	00679333          	sll	t1,a5,t1
    3090:	00a36333          	or	t1,t1,a0
    3094:	00603333          	snez	t1,t1
    3098:	00686533          	or	a0,a6,t1
    309c:	00000593          	li	a1,0
    30a0:	fb5ff06f          	j	3054 <__adddf3+0x4a4>
    30a4:	00a7e533          	or	a0,a5,a0
    30a8:	00a03533          	snez	a0,a0
    30ac:	ff1ff06f          	j	309c <__adddf3+0x4ec>
    30b0:	00148593          	addi	a1,s1,1
    30b4:	7fe5f593          	andi	a1,a1,2046
    30b8:	08059663          	bnez	a1,3144 <__adddf3+0x594>
    30bc:	00a7e833          	or	a6,a5,a0
    30c0:	00c765b3          	or	a1,a4,a2
    30c4:	06049063          	bnez	s1,3124 <__adddf3+0x574>
    30c8:	00081c63          	bnez	a6,30e0 <__adddf3+0x530>
    30cc:	10058e63          	beqz	a1,31e8 <__adddf3+0x638>
    30d0:	00070793          	mv	a5,a4
    30d4:	00060513          	mv	a0,a2
    30d8:	00068913          	mv	s2,a3
    30dc:	d75ff06f          	j	2e50 <__adddf3+0x2a0>
    30e0:	d60588e3          	beqz	a1,2e50 <__adddf3+0x2a0>
    30e4:	40c50833          	sub	a6,a0,a2
    30e8:	010538b3          	sltu	a7,a0,a6
    30ec:	40e785b3          	sub	a1,a5,a4
    30f0:	411585b3          	sub	a1,a1,a7
    30f4:	00859893          	slli	a7,a1,0x8
    30f8:	0008dc63          	bgez	a7,3110 <__adddf3+0x560>
    30fc:	40a60533          	sub	a0,a2,a0
    3100:	40f70733          	sub	a4,a4,a5
    3104:	00a63633          	sltu	a2,a2,a0
    3108:	40c707b3          	sub	a5,a4,a2
    310c:	fcdff06f          	j	30d8 <__adddf3+0x528>
    3110:	00b86533          	or	a0,a6,a1
    3114:	18050463          	beqz	a0,329c <__adddf3+0x6ec>
    3118:	00058793          	mv	a5,a1
    311c:	00080513          	mv	a0,a6
    3120:	d31ff06f          	j	2e50 <__adddf3+0x2a0>
    3124:	00081c63          	bnez	a6,313c <__adddf3+0x58c>
    3128:	d4058ee3          	beqz	a1,2e84 <__adddf3+0x2d4>
    312c:	00070793          	mv	a5,a4
    3130:	00060513          	mv	a0,a2
    3134:	00068913          	mv	s2,a3
    3138:	b1dff06f          	j	2c54 <__adddf3+0xa4>
    313c:	b0058ce3          	beqz	a1,2c54 <__adddf3+0xa4>
    3140:	d45ff06f          	j	2e84 <__adddf3+0x2d4>
    3144:	40c505b3          	sub	a1,a0,a2
    3148:	00b53833          	sltu	a6,a0,a1
    314c:	40e78433          	sub	s0,a5,a4
    3150:	41040433          	sub	s0,s0,a6
    3154:	00841813          	slli	a6,s0,0x8
    3158:	00058993          	mv	s3,a1
    315c:	08085063          	bgez	a6,31dc <__adddf3+0x62c>
    3160:	40a609b3          	sub	s3,a2,a0
    3164:	40f70433          	sub	s0,a4,a5
    3168:	01363633          	sltu	a2,a2,s3
    316c:	40c40433          	sub	s0,s0,a2
    3170:	00068913          	mv	s2,a3
    3174:	06040e63          	beqz	s0,31f0 <__adddf3+0x640>
    3178:	00040513          	mv	a0,s0
    317c:	619000ef          	jal	3f94 <__clzsi2>
    3180:	ff850693          	addi	a3,a0,-8
    3184:	02000793          	li	a5,32
    3188:	40d787b3          	sub	a5,a5,a3
    318c:	00d41433          	sll	s0,s0,a3
    3190:	00f9d7b3          	srl	a5,s3,a5
    3194:	0087e7b3          	or	a5,a5,s0
    3198:	00d99433          	sll	s0,s3,a3
    319c:	0a96c463          	blt	a3,s1,3244 <__adddf3+0x694>
    31a0:	409686b3          	sub	a3,a3,s1
    31a4:	00168613          	addi	a2,a3,1
    31a8:	01f00713          	li	a4,31
    31ac:	06c74263          	blt	a4,a2,3210 <__adddf3+0x660>
    31b0:	02000713          	li	a4,32
    31b4:	40c70733          	sub	a4,a4,a2
    31b8:	00e79533          	sll	a0,a5,a4
    31bc:	00c456b3          	srl	a3,s0,a2
    31c0:	00e41733          	sll	a4,s0,a4
    31c4:	00d56533          	or	a0,a0,a3
    31c8:	00e03733          	snez	a4,a4
    31cc:	00e56533          	or	a0,a0,a4
    31d0:	00c7d7b3          	srl	a5,a5,a2
    31d4:	00000493          	li	s1,0
    31d8:	c79ff06f          	j	2e50 <__adddf3+0x2a0>
    31dc:	0085e5b3          	or	a1,a1,s0
    31e0:	f8059ae3          	bnez	a1,3174 <__adddf3+0x5c4>
    31e4:	00000493          	li	s1,0
    31e8:	00000913          	li	s2,0
    31ec:	08c0006f          	j	3278 <__adddf3+0x6c8>
    31f0:	00098513          	mv	a0,s3
    31f4:	5a1000ef          	jal	3f94 <__clzsi2>
    31f8:	01850693          	addi	a3,a0,24
    31fc:	01f00793          	li	a5,31
    3200:	f8d7d2e3          	bge	a5,a3,3184 <__adddf3+0x5d4>
    3204:	ff850793          	addi	a5,a0,-8
    3208:	00f997b3          	sll	a5,s3,a5
    320c:	f91ff06f          	j	319c <__adddf3+0x5ec>
    3210:	fe168693          	addi	a3,a3,-31
    3214:	00d7d533          	srl	a0,a5,a3
    3218:	02000693          	li	a3,32
    321c:	00000713          	li	a4,0
    3220:	00d60863          	beq	a2,a3,3230 <__adddf3+0x680>
    3224:	04000713          	li	a4,64
    3228:	40c70733          	sub	a4,a4,a2
    322c:	00e79733          	sll	a4,a5,a4
    3230:	00e46733          	or	a4,s0,a4
    3234:	00e03733          	snez	a4,a4
    3238:	00e56533          	or	a0,a0,a4
    323c:	00000793          	li	a5,0
    3240:	f95ff06f          	j	31d4 <__adddf3+0x624>
    3244:	ff800737          	lui	a4,0xff800
    3248:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    324c:	40d484b3          	sub	s1,s1,a3
    3250:	00e7f7b3          	and	a5,a5,a4
    3254:	00040513          	mv	a0,s0
    3258:	bf9ff06f          	j	2e50 <__adddf3+0x2a0>
    325c:	00070793          	mv	a5,a4
    3260:	00060513          	mv	a0,a2
    3264:	c5dff06f          	j	2ec0 <__adddf3+0x310>
    3268:	00070793          	mv	a5,a4
    326c:	00060513          	mv	a0,a2
    3270:	be1ff06f          	j	2e50 <__adddf3+0x2a0>
    3274:	7ff00493          	li	s1,2047
    3278:	00000793          	li	a5,0
    327c:	00000513          	li	a0,0
    3280:	0240006f          	j	32a4 <__adddf3+0x6f4>
    3284:	00080493          	mv	s1,a6
    3288:	bc9ff06f          	j	2e50 <__adddf3+0x2a0>
    328c:	00070793          	mv	a5,a4
    3290:	00060513          	mv	a0,a2
    3294:	00080493          	mv	s1,a6
    3298:	e41ff06f          	j	30d8 <__adddf3+0x528>
    329c:	00000793          	li	a5,0
    32a0:	00000913          	li	s2,0
    32a4:	00879713          	slli	a4,a5,0x8
    32a8:	00075e63          	bgez	a4,32c4 <__adddf3+0x714>
    32ac:	00148493          	addi	s1,s1,1
    32b0:	7ff00713          	li	a4,2047
    32b4:	08e48263          	beq	s1,a4,3338 <__adddf3+0x788>
    32b8:	ff800737          	lui	a4,0xff800
    32bc:	fff70713          	addi	a4,a4,-1 # ff7fffff <_memory_end+0xff7dffff>
    32c0:	00e7f7b3          	and	a5,a5,a4
    32c4:	01d79693          	slli	a3,a5,0x1d
    32c8:	00355513          	srli	a0,a0,0x3
    32cc:	7ff00713          	li	a4,2047
    32d0:	00a6e6b3          	or	a3,a3,a0
    32d4:	0037d793          	srli	a5,a5,0x3
    32d8:	00e49e63          	bne	s1,a4,32f4 <__adddf3+0x744>
    32dc:	00f6e6b3          	or	a3,a3,a5
    32e0:	00000793          	li	a5,0
    32e4:	00068863          	beqz	a3,32f4 <__adddf3+0x744>
    32e8:	000807b7          	lui	a5,0x80
    32ec:	00000693          	li	a3,0
    32f0:	00000913          	li	s2,0
    32f4:	01449713          	slli	a4,s1,0x14
    32f8:	7ff00637          	lui	a2,0x7ff00
    32fc:	00c79793          	slli	a5,a5,0xc
    3300:	00c77733          	and	a4,a4,a2
    3304:	01c12083          	lw	ra,28(sp)
    3308:	01812403          	lw	s0,24(sp)
    330c:	00c7d793          	srli	a5,a5,0xc
    3310:	00f767b3          	or	a5,a4,a5
    3314:	01f91713          	slli	a4,s2,0x1f
    3318:	00e7e633          	or	a2,a5,a4
    331c:	01412483          	lw	s1,20(sp)
    3320:	01012903          	lw	s2,16(sp)
    3324:	00c12983          	lw	s3,12(sp)
    3328:	00068513          	mv	a0,a3
    332c:	00060593          	mv	a1,a2
    3330:	02010113          	addi	sp,sp,32
    3334:	00008067          	ret
    3338:	00000793          	li	a5,0
    333c:	00000513          	li	a0,0
    3340:	f85ff06f          	j	32c4 <__adddf3+0x714>

00003344 <__fixdfsi>:
    3344:	0145d713          	srli	a4,a1,0x14
    3348:	001006b7          	lui	a3,0x100
    334c:	fff68793          	addi	a5,a3,-1 # fffff <_memory_end+0xdffff>
    3350:	7ff77713          	andi	a4,a4,2047
    3354:	3fe00613          	li	a2,1022
    3358:	00b7f7b3          	and	a5,a5,a1
    335c:	01f5d593          	srli	a1,a1,0x1f
    3360:	04e65e63          	bge	a2,a4,33bc <__fixdfsi+0x78>
    3364:	41d00613          	li	a2,1053
    3368:	00e65a63          	bge	a2,a4,337c <__fixdfsi+0x38>
    336c:	80000537          	lui	a0,0x80000
    3370:	fff50513          	addi	a0,a0,-1 # 7fffffff <_memory_end+0x7ffdffff>
    3374:	00a58533          	add	a0,a1,a0
    3378:	00008067          	ret
    337c:	00d7e7b3          	or	a5,a5,a3
    3380:	43300693          	li	a3,1075
    3384:	40e686b3          	sub	a3,a3,a4
    3388:	01f00613          	li	a2,31
    338c:	02d64063          	blt	a2,a3,33ac <__fixdfsi+0x68>
    3390:	bed70713          	addi	a4,a4,-1043
    3394:	00e797b3          	sll	a5,a5,a4
    3398:	00d55533          	srl	a0,a0,a3
    339c:	00a7e533          	or	a0,a5,a0
    33a0:	02058063          	beqz	a1,33c0 <__fixdfsi+0x7c>
    33a4:	40a00533          	neg	a0,a0
    33a8:	00008067          	ret
    33ac:	41300693          	li	a3,1043
    33b0:	40e68733          	sub	a4,a3,a4
    33b4:	00e7d533          	srl	a0,a5,a4
    33b8:	fe9ff06f          	j	33a0 <__fixdfsi+0x5c>
    33bc:	00000513          	li	a0,0
    33c0:	00008067          	ret

000033c4 <__floatunsidf>:
    33c4:	ff010113          	addi	sp,sp,-16
    33c8:	00812423          	sw	s0,8(sp)
    33cc:	00112623          	sw	ra,12(sp)
    33d0:	00050413          	mv	s0,a0
    33d4:	06050263          	beqz	a0,3438 <__floatunsidf+0x74>
    33d8:	3bd000ef          	jal	3f94 <__clzsi2>
    33dc:	41e00713          	li	a4,1054
    33e0:	00a00793          	li	a5,10
    33e4:	40a70733          	sub	a4,a4,a0
    33e8:	04a7c063          	blt	a5,a0,3428 <__floatunsidf+0x64>
    33ec:	00b00793          	li	a5,11
    33f0:	40a787b3          	sub	a5,a5,a0
    33f4:	01550513          	addi	a0,a0,21
    33f8:	00f457b3          	srl	a5,s0,a5
    33fc:	00a41433          	sll	s0,s0,a0
    3400:	00c12083          	lw	ra,12(sp)
    3404:	00040513          	mv	a0,s0
    3408:	00c79793          	slli	a5,a5,0xc
    340c:	00812403          	lw	s0,8(sp)
    3410:	01471713          	slli	a4,a4,0x14
    3414:	00c7d793          	srli	a5,a5,0xc
    3418:	00f766b3          	or	a3,a4,a5
    341c:	00068593          	mv	a1,a3
    3420:	01010113          	addi	sp,sp,16
    3424:	00008067          	ret
    3428:	ff550513          	addi	a0,a0,-11
    342c:	00a417b3          	sll	a5,s0,a0
    3430:	00000413          	li	s0,0
    3434:	fcdff06f          	j	3400 <__floatunsidf+0x3c>
    3438:	00000793          	li	a5,0
    343c:	00000713          	li	a4,0
    3440:	fc1ff06f          	j	3400 <__floatunsidf+0x3c>

00003444 <__eqsf2>:
    3444:	01755693          	srli	a3,a0,0x17
    3448:	008007b7          	lui	a5,0x800
    344c:	fff78793          	addi	a5,a5,-1 # 7fffff <_memory_end+0x7dffff>
    3450:	0175d613          	srli	a2,a1,0x17
    3454:	0ff6f693          	zext.b	a3,a3
    3458:	0ff00893          	li	a7,255
    345c:	00a7f833          	and	a6,a5,a0
    3460:	01f55713          	srli	a4,a0,0x1f
    3464:	00b7f7b3          	and	a5,a5,a1
    3468:	0ff67613          	zext.b	a2,a2
    346c:	01f5d593          	srli	a1,a1,0x1f
    3470:	00100513          	li	a0,1
    3474:	01169a63          	bne	a3,a7,3488 <__eqsf2+0x44>
    3478:	00081663          	bnez	a6,3484 <__eqsf2+0x40>
    347c:	00d61463          	bne	a2,a3,3484 <__eqsf2+0x40>
    3480:	00078a63          	beqz	a5,3494 <__eqsf2+0x50>
    3484:	00008067          	ret
    3488:	ff160ee3          	beq	a2,a7,3484 <__eqsf2+0x40>
    348c:	fec69ce3          	bne	a3,a2,3484 <__eqsf2+0x40>
    3490:	fef81ae3          	bne	a6,a5,3484 <__eqsf2+0x40>
    3494:	00000513          	li	a0,0
    3498:	feb706e3          	beq	a4,a1,3484 <__eqsf2+0x40>
    349c:	00100513          	li	a0,1
    34a0:	fe0692e3          	bnez	a3,3484 <__eqsf2+0x40>
    34a4:	01003533          	snez	a0,a6
    34a8:	00008067          	ret

000034ac <__lesf2>:
    34ac:	008007b7          	lui	a5,0x800
    34b0:	fff78793          	addi	a5,a5,-1 # 7fffff <_memory_end+0x7dffff>
    34b4:	01755693          	srli	a3,a0,0x17
    34b8:	00a7f633          	and	a2,a5,a0
    34bc:	01f55713          	srli	a4,a0,0x1f
    34c0:	0ff6f693          	zext.b	a3,a3
    34c4:	0175d513          	srli	a0,a1,0x17
    34c8:	0ff00813          	li	a6,255
    34cc:	00b7f7b3          	and	a5,a5,a1
    34d0:	0ff57513          	zext.b	a0,a0
    34d4:	01f5d593          	srli	a1,a1,0x1f
    34d8:	01069463          	bne	a3,a6,34e0 <__lesf2+0x34>
    34dc:	04061263          	bnez	a2,3520 <__lesf2+0x74>
    34e0:	0ff00813          	li	a6,255
    34e4:	01051463          	bne	a0,a6,34ec <__lesf2+0x40>
    34e8:	02079c63          	bnez	a5,3520 <__lesf2+0x74>
    34ec:	04069a63          	bnez	a3,3540 <__lesf2+0x94>
    34f0:	02051c63          	bnez	a0,3528 <__lesf2+0x7c>
    34f4:	04061863          	bnez	a2,3544 <__lesf2+0x98>
    34f8:	04078263          	beqz	a5,353c <__lesf2+0x90>
    34fc:	00100513          	li	a0,1
    3500:	02059e63          	bnez	a1,353c <__lesf2+0x90>
    3504:	fff00513          	li	a0,-1
    3508:	00008067          	ret
    350c:	fea6c8e3          	blt	a3,a0,34fc <__lesf2+0x50>
    3510:	02c7e263          	bltu	a5,a2,3534 <__lesf2+0x88>
    3514:	00000513          	li	a0,0
    3518:	02f67263          	bgeu	a2,a5,353c <__lesf2+0x90>
    351c:	fe1ff06f          	j	34fc <__lesf2+0x50>
    3520:	00200513          	li	a0,2
    3524:	00008067          	ret
    3528:	fc060ae3          	beqz	a2,34fc <__lesf2+0x50>
    352c:	00e59e63          	bne	a1,a4,3548 <__lesf2+0x9c>
    3530:	fcd55ee3          	bge	a0,a3,350c <__lesf2+0x60>
    3534:	fff00513          	li	a0,-1
    3538:	00058c63          	beqz	a1,3550 <__lesf2+0xa4>
    353c:	00008067          	ret
    3540:	fe0516e3          	bnez	a0,352c <__lesf2+0x80>
    3544:	fe0794e3          	bnez	a5,352c <__lesf2+0x80>
    3548:	fff00513          	li	a0,-1
    354c:	fe0718e3          	bnez	a4,353c <__lesf2+0x90>
    3550:	00100513          	li	a0,1
    3554:	00008067          	ret

00003558 <__mulsf3>:
    3558:	fe010113          	addi	sp,sp,-32
    355c:	01212823          	sw	s2,16(sp)
    3560:	01755913          	srli	s2,a0,0x17
    3564:	00912a23          	sw	s1,20(sp)
    3568:	01312623          	sw	s3,12(sp)
    356c:	01512223          	sw	s5,4(sp)
    3570:	00951493          	slli	s1,a0,0x9
    3574:	00112e23          	sw	ra,28(sp)
    3578:	00812c23          	sw	s0,24(sp)
    357c:	01412423          	sw	s4,8(sp)
    3580:	0ff97913          	zext.b	s2,s2
    3584:	00058a93          	mv	s5,a1
    3588:	0094d493          	srli	s1,s1,0x9
    358c:	01f55993          	srli	s3,a0,0x1f
    3590:	10090863          	beqz	s2,36a0 <__mulsf3+0x148>
    3594:	0ff00793          	li	a5,255
    3598:	12f90463          	beq	s2,a5,36c0 <__mulsf3+0x168>
    359c:	00349493          	slli	s1,s1,0x3
    35a0:	040007b7          	lui	a5,0x4000
    35a4:	00f4e4b3          	or	s1,s1,a5
    35a8:	f8190913          	addi	s2,s2,-127
    35ac:	00000a13          	li	s4,0
    35b0:	017ad793          	srli	a5,s5,0x17
    35b4:	009a9413          	slli	s0,s5,0x9
    35b8:	0ff7f793          	zext.b	a5,a5
    35bc:	00945413          	srli	s0,s0,0x9
    35c0:	01fada93          	srli	s5,s5,0x1f
    35c4:	10078e63          	beqz	a5,36e0 <__mulsf3+0x188>
    35c8:	0ff00713          	li	a4,255
    35cc:	12e78a63          	beq	a5,a4,3700 <__mulsf3+0x1a8>
    35d0:	00341413          	slli	s0,s0,0x3
    35d4:	04000737          	lui	a4,0x4000
    35d8:	00e46433          	or	s0,s0,a4
    35dc:	f8178793          	addi	a5,a5,-127 # 3ffff81 <_memory_end+0x3fdff81>
    35e0:	00000713          	li	a4,0
    35e4:	00f90933          	add	s2,s2,a5
    35e8:	002a1793          	slli	a5,s4,0x2
    35ec:	00e7e7b3          	or	a5,a5,a4
    35f0:	00a00613          	li	a2,10
    35f4:	00190693          	addi	a3,s2,1
    35f8:	1ef64263          	blt	a2,a5,37dc <__mulsf3+0x284>
    35fc:	00200613          	li	a2,2
    3600:	0159c9b3          	xor	s3,s3,s5
    3604:	10f64e63          	blt	a2,a5,3720 <__mulsf3+0x1c8>
    3608:	fff78793          	addi	a5,a5,-1
    360c:	00100613          	li	a2,1
    3610:	12f67a63          	bgeu	a2,a5,3744 <__mulsf3+0x1ec>
    3614:	00010837          	lui	a6,0x10
    3618:	fff80513          	addi	a0,a6,-1 # ffff <_bss_end+0xb5dc>
    361c:	0104d613          	srli	a2,s1,0x10
    3620:	01045793          	srli	a5,s0,0x10
    3624:	00a4f4b3          	and	s1,s1,a0
    3628:	00a47433          	and	s0,s0,a0
    362c:	029405b3          	mul	a1,s0,s1
    3630:	02860433          	mul	s0,a2,s0
    3634:	02f60633          	mul	a2,a2,a5
    3638:	029787b3          	mul	a5,a5,s1
    363c:	00878733          	add	a4,a5,s0
    3640:	0105d793          	srli	a5,a1,0x10
    3644:	00e787b3          	add	a5,a5,a4
    3648:	0087f463          	bgeu	a5,s0,3650 <__mulsf3+0xf8>
    364c:	01060633          	add	a2,a2,a6
    3650:	00a7f733          	and	a4,a5,a0
    3654:	01071713          	slli	a4,a4,0x10
    3658:	00a5f5b3          	and	a1,a1,a0
    365c:	00b70733          	add	a4,a4,a1
    3660:	0107d793          	srli	a5,a5,0x10
    3664:	00671413          	slli	s0,a4,0x6
    3668:	00c787b3          	add	a5,a5,a2
    366c:	01a75713          	srli	a4,a4,0x1a
    3670:	00679793          	slli	a5,a5,0x6
    3674:	00803433          	snez	s0,s0
    3678:	00e46433          	or	s0,s0,a4
    367c:	00479713          	slli	a4,a5,0x4
    3680:	0087e433          	or	s0,a5,s0
    3684:	00075a63          	bgez	a4,3698 <__mulsf3+0x140>
    3688:	00145793          	srli	a5,s0,0x1
    368c:	00147413          	andi	s0,s0,1
    3690:	0087e433          	or	s0,a5,s0
    3694:	00068913          	mv	s2,a3
    3698:	00090693          	mv	a3,s2
    369c:	0c00006f          	j	375c <__mulsf3+0x204>
    36a0:	02048a63          	beqz	s1,36d4 <__mulsf3+0x17c>
    36a4:	00048513          	mv	a0,s1
    36a8:	0ed000ef          	jal	3f94 <__clzsi2>
    36ac:	ffb50793          	addi	a5,a0,-5
    36b0:	f8a00913          	li	s2,-118
    36b4:	00f494b3          	sll	s1,s1,a5
    36b8:	40a90933          	sub	s2,s2,a0
    36bc:	ef1ff06f          	j	35ac <__mulsf3+0x54>
    36c0:	0ff00913          	li	s2,255
    36c4:	00200a13          	li	s4,2
    36c8:	ee0484e3          	beqz	s1,35b0 <__mulsf3+0x58>
    36cc:	00300a13          	li	s4,3
    36d0:	ee1ff06f          	j	35b0 <__mulsf3+0x58>
    36d4:	00000913          	li	s2,0
    36d8:	00100a13          	li	s4,1
    36dc:	ed5ff06f          	j	35b0 <__mulsf3+0x58>
    36e0:	02040a63          	beqz	s0,3714 <__mulsf3+0x1bc>
    36e4:	00040513          	mv	a0,s0
    36e8:	0ad000ef          	jal	3f94 <__clzsi2>
    36ec:	ffb50793          	addi	a5,a0,-5
    36f0:	00f41433          	sll	s0,s0,a5
    36f4:	f8a00793          	li	a5,-118
    36f8:	40a787b3          	sub	a5,a5,a0
    36fc:	ee5ff06f          	j	35e0 <__mulsf3+0x88>
    3700:	0ff00793          	li	a5,255
    3704:	00200713          	li	a4,2
    3708:	ec040ee3          	beqz	s0,35e4 <__mulsf3+0x8c>
    370c:	00300713          	li	a4,3
    3710:	ed5ff06f          	j	35e4 <__mulsf3+0x8c>
    3714:	00000793          	li	a5,0
    3718:	00100713          	li	a4,1
    371c:	ec9ff06f          	j	35e4 <__mulsf3+0x8c>
    3720:	00100613          	li	a2,1
    3724:	00f617b3          	sll	a5,a2,a5
    3728:	5307f613          	andi	a2,a5,1328
    372c:	0c061063          	bnez	a2,37ec <__mulsf3+0x294>
    3730:	2407f613          	andi	a2,a5,576
    3734:	12061263          	bnez	a2,3858 <__mulsf3+0x300>
    3738:	0887f793          	andi	a5,a5,136
    373c:	ec078ce3          	beqz	a5,3614 <__mulsf3+0xbc>
    3740:	000a8993          	mv	s3,s5
    3744:	00200793          	li	a5,2
    3748:	10f70263          	beq	a4,a5,384c <__mulsf3+0x2f4>
    374c:	00300793          	li	a5,3
    3750:	10f70463          	beq	a4,a5,3858 <__mulsf3+0x300>
    3754:	00100793          	li	a5,1
    3758:	10f70863          	beq	a4,a5,3868 <__mulsf3+0x310>
    375c:	07f68713          	addi	a4,a3,127
    3760:	08e05c63          	blez	a4,37f8 <__mulsf3+0x2a0>
    3764:	00747793          	andi	a5,s0,7
    3768:	00078a63          	beqz	a5,377c <__mulsf3+0x224>
    376c:	00f47793          	andi	a5,s0,15
    3770:	00400613          	li	a2,4
    3774:	00c78463          	beq	a5,a2,377c <__mulsf3+0x224>
    3778:	00440413          	addi	s0,s0,4
    377c:	00441793          	slli	a5,s0,0x4
    3780:	0007da63          	bgez	a5,3794 <__mulsf3+0x23c>
    3784:	f80007b7          	lui	a5,0xf8000
    3788:	fff78793          	addi	a5,a5,-1 # f7ffffff <_memory_end+0xf7fdffff>
    378c:	00f47433          	and	s0,s0,a5
    3790:	08068713          	addi	a4,a3,128
    3794:	0fe00793          	li	a5,254
    3798:	0ae7ca63          	blt	a5,a4,384c <__mulsf3+0x2f4>
    379c:	00345793          	srli	a5,s0,0x3
    37a0:	01c12083          	lw	ra,28(sp)
    37a4:	01812403          	lw	s0,24(sp)
    37a8:	00979793          	slli	a5,a5,0x9
    37ac:	01771513          	slli	a0,a4,0x17
    37b0:	0097d793          	srli	a5,a5,0x9
    37b4:	01f99993          	slli	s3,s3,0x1f
    37b8:	00f56533          	or	a0,a0,a5
    37bc:	01412483          	lw	s1,20(sp)
    37c0:	01012903          	lw	s2,16(sp)
    37c4:	00812a03          	lw	s4,8(sp)
    37c8:	00412a83          	lw	s5,4(sp)
    37cc:	01356533          	or	a0,a0,s3
    37d0:	00c12983          	lw	s3,12(sp)
    37d4:	02010113          	addi	sp,sp,32
    37d8:	00008067          	ret
    37dc:	00f00613          	li	a2,15
    37e0:	06c78c63          	beq	a5,a2,3858 <__mulsf3+0x300>
    37e4:	00b00613          	li	a2,11
    37e8:	f4c78ce3          	beq	a5,a2,3740 <__mulsf3+0x1e8>
    37ec:	00048413          	mv	s0,s1
    37f0:	000a0713          	mv	a4,s4
    37f4:	f51ff06f          	j	3744 <__mulsf3+0x1ec>
    37f8:	00100793          	li	a5,1
    37fc:	40e787b3          	sub	a5,a5,a4
    3800:	01b00713          	li	a4,27
    3804:	06f74263          	blt	a4,a5,3868 <__mulsf3+0x310>
    3808:	09e68693          	addi	a3,a3,158
    380c:	00d416b3          	sll	a3,s0,a3
    3810:	00f457b3          	srl	a5,s0,a5
    3814:	00d036b3          	snez	a3,a3
    3818:	00d7e7b3          	or	a5,a5,a3
    381c:	0077f713          	andi	a4,a5,7
    3820:	00070a63          	beqz	a4,3834 <__mulsf3+0x2dc>
    3824:	00f7f713          	andi	a4,a5,15
    3828:	00400693          	li	a3,4
    382c:	00d70463          	beq	a4,a3,3834 <__mulsf3+0x2dc>
    3830:	00478793          	addi	a5,a5,4
    3834:	00579713          	slli	a4,a5,0x5
    3838:	0037d793          	srli	a5,a5,0x3
    383c:	02075863          	bgez	a4,386c <__mulsf3+0x314>
    3840:	00000793          	li	a5,0
    3844:	00100713          	li	a4,1
    3848:	f59ff06f          	j	37a0 <__mulsf3+0x248>
    384c:	00000793          	li	a5,0
    3850:	0ff00713          	li	a4,255
    3854:	f4dff06f          	j	37a0 <__mulsf3+0x248>
    3858:	004007b7          	lui	a5,0x400
    385c:	0ff00713          	li	a4,255
    3860:	00000993          	li	s3,0
    3864:	f3dff06f          	j	37a0 <__mulsf3+0x248>
    3868:	00000793          	li	a5,0
    386c:	00000713          	li	a4,0
    3870:	f31ff06f          	j	37a0 <__mulsf3+0x248>

00003874 <__subsf3>:
    3874:	008006b7          	lui	a3,0x800
    3878:	fff68693          	addi	a3,a3,-1 # 7fffff <_memory_end+0x7dffff>
    387c:	ff010113          	addi	sp,sp,-16
    3880:	00a6f633          	and	a2,a3,a0
    3884:	01755713          	srli	a4,a0,0x17
    3888:	00812423          	sw	s0,8(sp)
    388c:	01f55413          	srli	s0,a0,0x1f
    3890:	00361513          	slli	a0,a2,0x3
    3894:	0175d613          	srli	a2,a1,0x17
    3898:	00b6f6b3          	and	a3,a3,a1
    389c:	01212023          	sw	s2,0(sp)
    38a0:	00112623          	sw	ra,12(sp)
    38a4:	0ff77913          	zext.b	s2,a4
    38a8:	00912223          	sw	s1,4(sp)
    38ac:	0ff67613          	zext.b	a2,a2
    38b0:	0ff00713          	li	a4,255
    38b4:	01f5d593          	srli	a1,a1,0x1f
    38b8:	00369793          	slli	a5,a3,0x3
    38bc:	00e61463          	bne	a2,a4,38c4 <__subsf3+0x50>
    38c0:	00079463          	bnez	a5,38c8 <__subsf3+0x54>
    38c4:	0015c593          	xori	a1,a1,1
    38c8:	40c906b3          	sub	a3,s2,a2
    38cc:	18859063          	bne	a1,s0,3a4c <__subsf3+0x1d8>
    38d0:	08d05c63          	blez	a3,3968 <__subsf3+0xf4>
    38d4:	02061663          	bnez	a2,3900 <__subsf3+0x8c>
    38d8:	02078063          	beqz	a5,38f8 <__subsf3+0x84>
    38dc:	fff90693          	addi	a3,s2,-1
    38e0:	00069863          	bnez	a3,38f0 <__subsf3+0x7c>
    38e4:	00a787b3          	add	a5,a5,a0
    38e8:	00100913          	li	s2,1
    38ec:	04c0006f          	j	3938 <__subsf3+0xc4>
    38f0:	0ff00713          	li	a4,255
    38f4:	00e91e63          	bne	s2,a4,3910 <__subsf3+0x9c>
    38f8:	00050793          	mv	a5,a0
    38fc:	10c0006f          	j	3a08 <__subsf3+0x194>
    3900:	0ff00713          	li	a4,255
    3904:	fee90ae3          	beq	s2,a4,38f8 <__subsf3+0x84>
    3908:	04000737          	lui	a4,0x4000
    390c:	00e7e7b3          	or	a5,a5,a4
    3910:	01b00613          	li	a2,27
    3914:	00100713          	li	a4,1
    3918:	00d64e63          	blt	a2,a3,3934 <__subsf3+0xc0>
    391c:	02000613          	li	a2,32
    3920:	00d7d733          	srl	a4,a5,a3
    3924:	40d606b3          	sub	a3,a2,a3
    3928:	00d796b3          	sll	a3,a5,a3
    392c:	00d036b3          	snez	a3,a3
    3930:	00d76733          	or	a4,a4,a3
    3934:	00a707b3          	add	a5,a4,a0
    3938:	00579713          	slli	a4,a5,0x5
    393c:	0c075663          	bgez	a4,3a08 <__subsf3+0x194>
    3940:	00190913          	addi	s2,s2,1
    3944:	0ff00713          	li	a4,255
    3948:	2ce90a63          	beq	s2,a4,3c1c <__subsf3+0x3a8>
    394c:	7e000737          	lui	a4,0x7e000
    3950:	0017f693          	andi	a3,a5,1
    3954:	fff70713          	addi	a4,a4,-1 # 7dffffff <_memory_end+0x7dfdffff>
    3958:	0017d793          	srli	a5,a5,0x1
    395c:	00e7f7b3          	and	a5,a5,a4
    3960:	00d7e7b3          	or	a5,a5,a3
    3964:	0a40006f          	j	3a08 <__subsf3+0x194>
    3968:	06068663          	beqz	a3,39d4 <__subsf3+0x160>
    396c:	41260733          	sub	a4,a2,s2
    3970:	02091063          	bnez	s2,3990 <__subsf3+0x11c>
    3974:	0c050863          	beqz	a0,3a44 <__subsf3+0x1d0>
    3978:	fff70693          	addi	a3,a4,-1
    397c:	f60684e3          	beqz	a3,38e4 <__subsf3+0x70>
    3980:	0ff00593          	li	a1,255
    3984:	02b71063          	bne	a4,a1,39a4 <__subsf3+0x130>
    3988:	0ff00913          	li	s2,255
    398c:	07c0006f          	j	3a08 <__subsf3+0x194>
    3990:	0ff00693          	li	a3,255
    3994:	fed60ae3          	beq	a2,a3,3988 <__subsf3+0x114>
    3998:	040006b7          	lui	a3,0x4000
    399c:	00d56533          	or	a0,a0,a3
    39a0:	00070693          	mv	a3,a4
    39a4:	01b00593          	li	a1,27
    39a8:	00100713          	li	a4,1
    39ac:	00d5ce63          	blt	a1,a3,39c8 <__subsf3+0x154>
    39b0:	02000713          	li	a4,32
    39b4:	40d70733          	sub	a4,a4,a3
    39b8:	00e51733          	sll	a4,a0,a4
    39bc:	00d555b3          	srl	a1,a0,a3
    39c0:	00e03733          	snez	a4,a4
    39c4:	00e5e733          	or	a4,a1,a4
    39c8:	00e787b3          	add	a5,a5,a4
    39cc:	00060913          	mv	s2,a2
    39d0:	f69ff06f          	j	3938 <__subsf3+0xc4>
    39d4:	00190713          	addi	a4,s2,1
    39d8:	0fe77693          	andi	a3,a4,254
    39dc:	04069c63          	bnez	a3,3a34 <__subsf3+0x1c0>
    39e0:	04091263          	bnez	s2,3a24 <__subsf3+0x1b0>
    39e4:	02050263          	beqz	a0,3a08 <__subsf3+0x194>
    39e8:	f00788e3          	beqz	a5,38f8 <__subsf3+0x84>
    39ec:	00a787b3          	add	a5,a5,a0
    39f0:	00579713          	slli	a4,a5,0x5
    39f4:	00075a63          	bgez	a4,3a08 <__subsf3+0x194>
    39f8:	fc000737          	lui	a4,0xfc000
    39fc:	fff70713          	addi	a4,a4,-1 # fbffffff <_memory_end+0xfbfdffff>
    3a00:	00e7f7b3          	and	a5,a5,a4
    3a04:	00100913          	li	s2,1
    3a08:	0077f713          	andi	a4,a5,7
    3a0c:	20070a63          	beqz	a4,3c20 <__subsf3+0x3ac>
    3a10:	00f7f713          	andi	a4,a5,15
    3a14:	00400693          	li	a3,4
    3a18:	20d70463          	beq	a4,a3,3c20 <__subsf3+0x3ac>
    3a1c:	00478793          	addi	a5,a5,4 # 400004 <_memory_end+0x3e0004>
    3a20:	2000006f          	j	3c20 <__subsf3+0x3ac>
    3a24:	f60502e3          	beqz	a0,3988 <__subsf3+0x114>
    3a28:	16079663          	bnez	a5,3b94 <__subsf3+0x320>
    3a2c:	00050793          	mv	a5,a0
    3a30:	f59ff06f          	j	3988 <__subsf3+0x114>
    3a34:	0ff00693          	li	a3,255
    3a38:	1ed70063          	beq	a4,a3,3c18 <__subsf3+0x3a4>
    3a3c:	00f507b3          	add	a5,a0,a5
    3a40:	0017d793          	srli	a5,a5,0x1
    3a44:	00070913          	mv	s2,a4
    3a48:	fc1ff06f          	j	3a08 <__subsf3+0x194>
    3a4c:	06d05e63          	blez	a3,3ac8 <__subsf3+0x254>
    3a50:	06061263          	bnez	a2,3ab4 <__subsf3+0x240>
    3a54:	ea0782e3          	beqz	a5,38f8 <__subsf3+0x84>
    3a58:	fff90693          	addi	a3,s2,-1
    3a5c:	00069863          	bnez	a3,3a6c <__subsf3+0x1f8>
    3a60:	40f507b3          	sub	a5,a0,a5
    3a64:	00100913          	li	s2,1
    3a68:	0340006f          	j	3a9c <__subsf3+0x228>
    3a6c:	0ff00713          	li	a4,255
    3a70:	e8e904e3          	beq	s2,a4,38f8 <__subsf3+0x84>
    3a74:	01b00613          	li	a2,27
    3a78:	00100713          	li	a4,1
    3a7c:	00d64e63          	blt	a2,a3,3a98 <__subsf3+0x224>
    3a80:	02000613          	li	a2,32
    3a84:	00d7d733          	srl	a4,a5,a3
    3a88:	40d606b3          	sub	a3,a2,a3
    3a8c:	00d796b3          	sll	a3,a5,a3
    3a90:	00d036b3          	snez	a3,a3
    3a94:	00d76733          	or	a4,a4,a3
    3a98:	40e507b3          	sub	a5,a0,a4
    3a9c:	00579713          	slli	a4,a5,0x5
    3aa0:	f60754e3          	bgez	a4,3a08 <__subsf3+0x194>
    3aa4:	040004b7          	lui	s1,0x4000
    3aa8:	fff48493          	addi	s1,s1,-1 # 3ffffff <_memory_end+0x3fdffff>
    3aac:	0097f4b3          	and	s1,a5,s1
    3ab0:	1080006f          	j	3bb8 <__subsf3+0x344>
    3ab4:	0ff00713          	li	a4,255
    3ab8:	e4e900e3          	beq	s2,a4,38f8 <__subsf3+0x84>
    3abc:	04000737          	lui	a4,0x4000
    3ac0:	00e7e7b3          	or	a5,a5,a4
    3ac4:	fb1ff06f          	j	3a74 <__subsf3+0x200>
    3ac8:	06068e63          	beqz	a3,3b44 <__subsf3+0x2d0>
    3acc:	41260733          	sub	a4,a2,s2
    3ad0:	02091663          	bnez	s2,3afc <__subsf3+0x288>
    3ad4:	1a050e63          	beqz	a0,3c90 <__subsf3+0x41c>
    3ad8:	fff70693          	addi	a3,a4,-1 # 3ffffff <_memory_end+0x3fdffff>
    3adc:	00069863          	bnez	a3,3aec <__subsf3+0x278>
    3ae0:	40a787b3          	sub	a5,a5,a0
    3ae4:	00058413          	mv	s0,a1
    3ae8:	f7dff06f          	j	3a64 <__subsf3+0x1f0>
    3aec:	0ff00813          	li	a6,255
    3af0:	03071063          	bne	a4,a6,3b10 <__subsf3+0x29c>
    3af4:	0ff00913          	li	s2,255
    3af8:	19c0006f          	j	3c94 <__subsf3+0x420>
    3afc:	0ff00693          	li	a3,255
    3b00:	fed60ae3          	beq	a2,a3,3af4 <__subsf3+0x280>
    3b04:	040006b7          	lui	a3,0x4000
    3b08:	00d56533          	or	a0,a0,a3
    3b0c:	00070693          	mv	a3,a4
    3b10:	01b00813          	li	a6,27
    3b14:	00100713          	li	a4,1
    3b18:	00d84e63          	blt	a6,a3,3b34 <__subsf3+0x2c0>
    3b1c:	02000713          	li	a4,32
    3b20:	40d70733          	sub	a4,a4,a3
    3b24:	00e51733          	sll	a4,a0,a4
    3b28:	00d55833          	srl	a6,a0,a3
    3b2c:	00e03733          	snez	a4,a4
    3b30:	00e86733          	or	a4,a6,a4
    3b34:	40e787b3          	sub	a5,a5,a4
    3b38:	00060913          	mv	s2,a2
    3b3c:	00058413          	mv	s0,a1
    3b40:	f5dff06f          	j	3a9c <__subsf3+0x228>
    3b44:	00190713          	addi	a4,s2,1
    3b48:	0fe77713          	andi	a4,a4,254
    3b4c:	04071c63          	bnez	a4,3ba4 <__subsf3+0x330>
    3b50:	02091c63          	bnez	s2,3b88 <__subsf3+0x314>
    3b54:	00051863          	bnez	a0,3b64 <__subsf3+0x2f0>
    3b58:	12079e63          	bnez	a5,3c94 <__subsf3+0x420>
    3b5c:	00000413          	li	s0,0
    3b60:	0c00006f          	j	3c20 <__subsf3+0x3ac>
    3b64:	d8078ae3          	beqz	a5,38f8 <__subsf3+0x84>
    3b68:	40f50733          	sub	a4,a0,a5
    3b6c:	00571693          	slli	a3,a4,0x5
    3b70:	40a787b3          	sub	a5,a5,a0
    3b74:	1206c063          	bltz	a3,3c94 <__subsf3+0x420>
    3b78:	00070793          	mv	a5,a4
    3b7c:	e80716e3          	bnez	a4,3a08 <__subsf3+0x194>
    3b80:	00000793          	li	a5,0
    3b84:	fd9ff06f          	j	3b5c <__subsf3+0x2e8>
    3b88:	ea0510e3          	bnez	a0,3a28 <__subsf3+0x1b4>
    3b8c:	00058413          	mv	s0,a1
    3b90:	de079ce3          	bnez	a5,3988 <__subsf3+0x114>
    3b94:	00000413          	li	s0,0
    3b98:	020007b7          	lui	a5,0x2000
    3b9c:	0ff00913          	li	s2,255
    3ba0:	0800006f          	j	3c20 <__subsf3+0x3ac>
    3ba4:	40f504b3          	sub	s1,a0,a5
    3ba8:	00549713          	slli	a4,s1,0x5
    3bac:	04075463          	bgez	a4,3bf4 <__subsf3+0x380>
    3bb0:	40a784b3          	sub	s1,a5,a0
    3bb4:	00058413          	mv	s0,a1
    3bb8:	00048513          	mv	a0,s1
    3bbc:	3d8000ef          	jal	3f94 <__clzsi2>
    3bc0:	ffb50513          	addi	a0,a0,-5
    3bc4:	00a494b3          	sll	s1,s1,a0
    3bc8:	03254e63          	blt	a0,s2,3c04 <__subsf3+0x390>
    3bcc:	41250533          	sub	a0,a0,s2
    3bd0:	00150513          	addi	a0,a0,1
    3bd4:	02000713          	li	a4,32
    3bd8:	40a70733          	sub	a4,a4,a0
    3bdc:	00a4d7b3          	srl	a5,s1,a0
    3be0:	00e494b3          	sll	s1,s1,a4
    3be4:	009034b3          	snez	s1,s1
    3be8:	0097e7b3          	or	a5,a5,s1
    3bec:	00000913          	li	s2,0
    3bf0:	e19ff06f          	j	3a08 <__subsf3+0x194>
    3bf4:	fc0492e3          	bnez	s1,3bb8 <__subsf3+0x344>
    3bf8:	00000793          	li	a5,0
    3bfc:	00000913          	li	s2,0
    3c00:	f5dff06f          	j	3b5c <__subsf3+0x2e8>
    3c04:	fc0007b7          	lui	a5,0xfc000
    3c08:	fff78793          	addi	a5,a5,-1 # fbffffff <_memory_end+0xfbfdffff>
    3c0c:	40a90933          	sub	s2,s2,a0
    3c10:	00f4f7b3          	and	a5,s1,a5
    3c14:	df5ff06f          	j	3a08 <__subsf3+0x194>
    3c18:	0ff00913          	li	s2,255
    3c1c:	00000793          	li	a5,0
    3c20:	00579713          	slli	a4,a5,0x5
    3c24:	00075e63          	bgez	a4,3c40 <__subsf3+0x3cc>
    3c28:	00190913          	addi	s2,s2,1
    3c2c:	0ff00713          	li	a4,255
    3c30:	06e90663          	beq	s2,a4,3c9c <__subsf3+0x428>
    3c34:	fc000737          	lui	a4,0xfc000
    3c38:	fff70713          	addi	a4,a4,-1 # fbffffff <_memory_end+0xfbfdffff>
    3c3c:	00e7f7b3          	and	a5,a5,a4
    3c40:	0ff00713          	li	a4,255
    3c44:	0037d793          	srli	a5,a5,0x3
    3c48:	00e91863          	bne	s2,a4,3c58 <__subsf3+0x3e4>
    3c4c:	00078663          	beqz	a5,3c58 <__subsf3+0x3e4>
    3c50:	004007b7          	lui	a5,0x400
    3c54:	00000413          	li	s0,0
    3c58:	00c12083          	lw	ra,12(sp)
    3c5c:	01791713          	slli	a4,s2,0x17
    3c60:	01f41513          	slli	a0,s0,0x1f
    3c64:	7f8006b7          	lui	a3,0x7f800
    3c68:	00812403          	lw	s0,8(sp)
    3c6c:	00979793          	slli	a5,a5,0x9
    3c70:	00d77733          	and	a4,a4,a3
    3c74:	0097d793          	srli	a5,a5,0x9
    3c78:	00f767b3          	or	a5,a4,a5
    3c7c:	00412483          	lw	s1,4(sp)
    3c80:	00012903          	lw	s2,0(sp)
    3c84:	00a7e533          	or	a0,a5,a0
    3c88:	01010113          	addi	sp,sp,16
    3c8c:	00008067          	ret
    3c90:	00070913          	mv	s2,a4
    3c94:	00058413          	mv	s0,a1
    3c98:	d71ff06f          	j	3a08 <__subsf3+0x194>
    3c9c:	00000793          	li	a5,0
    3ca0:	fa1ff06f          	j	3c40 <__subsf3+0x3cc>

00003ca4 <__fixsfsi>:
    3ca4:	00800637          	lui	a2,0x800
    3ca8:	01755713          	srli	a4,a0,0x17
    3cac:	fff60793          	addi	a5,a2,-1 # 7fffff <_memory_end+0x7dffff>
    3cb0:	0ff77713          	zext.b	a4,a4
    3cb4:	07e00593          	li	a1,126
    3cb8:	00a7f7b3          	and	a5,a5,a0
    3cbc:	01f55693          	srli	a3,a0,0x1f
    3cc0:	04e5d663          	bge	a1,a4,3d0c <__fixsfsi+0x68>
    3cc4:	09d00593          	li	a1,157
    3cc8:	00e5da63          	bge	a1,a4,3cdc <__fixsfsi+0x38>
    3ccc:	80000537          	lui	a0,0x80000
    3cd0:	fff50513          	addi	a0,a0,-1 # 7fffffff <_memory_end+0x7ffdffff>
    3cd4:	00a68533          	add	a0,a3,a0
    3cd8:	00008067          	ret
    3cdc:	00c7e533          	or	a0,a5,a2
    3ce0:	09500793          	li	a5,149
    3ce4:	00e7dc63          	bge	a5,a4,3cfc <__fixsfsi+0x58>
    3ce8:	f6a70713          	addi	a4,a4,-150
    3cec:	00e51533          	sll	a0,a0,a4
    3cf0:	02068063          	beqz	a3,3d10 <__fixsfsi+0x6c>
    3cf4:	40a00533          	neg	a0,a0
    3cf8:	00008067          	ret
    3cfc:	09600793          	li	a5,150
    3d00:	40e787b3          	sub	a5,a5,a4
    3d04:	00f55533          	srl	a0,a0,a5
    3d08:	fe9ff06f          	j	3cf0 <__fixsfsi+0x4c>
    3d0c:	00000513          	li	a0,0
    3d10:	00008067          	ret

00003d14 <__floatsisf>:
    3d14:	ff010113          	addi	sp,sp,-16
    3d18:	00112623          	sw	ra,12(sp)
    3d1c:	00812423          	sw	s0,8(sp)
    3d20:	00912223          	sw	s1,4(sp)
    3d24:	00050793          	mv	a5,a0
    3d28:	0e050063          	beqz	a0,3e08 <__floatsisf+0xf4>
    3d2c:	41f55713          	srai	a4,a0,0x1f
    3d30:	00a74433          	xor	s0,a4,a0
    3d34:	40e40433          	sub	s0,s0,a4
    3d38:	01f55493          	srli	s1,a0,0x1f
    3d3c:	00040513          	mv	a0,s0
    3d40:	254000ef          	jal	3f94 <__clzsi2>
    3d44:	09e00793          	li	a5,158
    3d48:	40a787b3          	sub	a5,a5,a0
    3d4c:	09600713          	li	a4,150
    3d50:	04f74063          	blt	a4,a5,3d90 <__floatsisf+0x7c>
    3d54:	00800713          	li	a4,8
    3d58:	0ae50e63          	beq	a0,a4,3e14 <__floatsisf+0x100>
    3d5c:	ff850513          	addi	a0,a0,-8
    3d60:	00a41433          	sll	s0,s0,a0
    3d64:	00941413          	slli	s0,s0,0x9
    3d68:	00945413          	srli	s0,s0,0x9
    3d6c:	01779793          	slli	a5,a5,0x17
    3d70:	00c12083          	lw	ra,12(sp)
    3d74:	0087e7b3          	or	a5,a5,s0
    3d78:	00812403          	lw	s0,8(sp)
    3d7c:	01f49513          	slli	a0,s1,0x1f
    3d80:	00a7e533          	or	a0,a5,a0
    3d84:	00412483          	lw	s1,4(sp)
    3d88:	01010113          	addi	sp,sp,16
    3d8c:	00008067          	ret
    3d90:	09900713          	li	a4,153
    3d94:	06f75463          	bge	a4,a5,3dfc <__floatsisf+0xe8>
    3d98:	00500713          	li	a4,5
    3d9c:	40a70733          	sub	a4,a4,a0
    3da0:	01b50693          	addi	a3,a0,27
    3da4:	00e45733          	srl	a4,s0,a4
    3da8:	00d41433          	sll	s0,s0,a3
    3dac:	00803433          	snez	s0,s0
    3db0:	00876733          	or	a4,a4,s0
    3db4:	fc000437          	lui	s0,0xfc000
    3db8:	fff40413          	addi	s0,s0,-1 # fbffffff <_memory_end+0xfbfdffff>
    3dbc:	00777693          	andi	a3,a4,7
    3dc0:	00877433          	and	s0,a4,s0
    3dc4:	00068a63          	beqz	a3,3dd8 <__floatsisf+0xc4>
    3dc8:	00f77713          	andi	a4,a4,15
    3dcc:	00400693          	li	a3,4
    3dd0:	00d70463          	beq	a4,a3,3dd8 <__floatsisf+0xc4>
    3dd4:	00440413          	addi	s0,s0,4
    3dd8:	00541713          	slli	a4,s0,0x5
    3ddc:	00075c63          	bgez	a4,3df4 <__floatsisf+0xe0>
    3de0:	fc0007b7          	lui	a5,0xfc000
    3de4:	fff78793          	addi	a5,a5,-1 # fbffffff <_memory_end+0xfbfdffff>
    3de8:	00f47433          	and	s0,s0,a5
    3dec:	09f00793          	li	a5,159
    3df0:	40a787b3          	sub	a5,a5,a0
    3df4:	00345413          	srli	s0,s0,0x3
    3df8:	f6dff06f          	j	3d64 <__floatsisf+0x50>
    3dfc:	ffb50713          	addi	a4,a0,-5
    3e00:	00e41733          	sll	a4,s0,a4
    3e04:	fb1ff06f          	j	3db4 <__floatsisf+0xa0>
    3e08:	00000493          	li	s1,0
    3e0c:	00000413          	li	s0,0
    3e10:	f55ff06f          	j	3d64 <__floatsisf+0x50>
    3e14:	09600793          	li	a5,150
    3e18:	f4dff06f          	j	3d64 <__floatsisf+0x50>

00003e1c <__truncdfsf2>:
    3e1c:	0145d613          	srli	a2,a1,0x14
    3e20:	7ff67613          	andi	a2,a2,2047
    3e24:	00c59793          	slli	a5,a1,0xc
    3e28:	00160713          	addi	a4,a2,1
    3e2c:	0097d793          	srli	a5,a5,0x9
    3e30:	01d55693          	srli	a3,a0,0x1d
    3e34:	7fe77713          	andi	a4,a4,2046
    3e38:	00f6e6b3          	or	a3,a3,a5
    3e3c:	01f5d593          	srli	a1,a1,0x1f
    3e40:	00351793          	slli	a5,a0,0x3
    3e44:	0a070663          	beqz	a4,3ef0 <__truncdfsf2+0xd4>
    3e48:	c8060713          	addi	a4,a2,-896
    3e4c:	0fe00813          	li	a6,254
    3e50:	0ce84263          	blt	a6,a4,3f14 <__truncdfsf2+0xf8>
    3e54:	08e04063          	bgtz	a4,3ed4 <__truncdfsf2+0xb8>
    3e58:	fe900513          	li	a0,-23
    3e5c:	10a74a63          	blt	a4,a0,3f70 <__truncdfsf2+0x154>
    3e60:	00800537          	lui	a0,0x800
    3e64:	00a6e6b3          	or	a3,a3,a0
    3e68:	01e00513          	li	a0,30
    3e6c:	40e50533          	sub	a0,a0,a4
    3e70:	01f00813          	li	a6,31
    3e74:	02a84863          	blt	a6,a0,3ea4 <__truncdfsf2+0x88>
    3e78:	c8260613          	addi	a2,a2,-894
    3e7c:	00a7d533          	srl	a0,a5,a0
    3e80:	00c797b3          	sll	a5,a5,a2
    3e84:	00f037b3          	snez	a5,a5
    3e88:	00c696b3          	sll	a3,a3,a2
    3e8c:	00d7e7b3          	or	a5,a5,a3
    3e90:	00f567b3          	or	a5,a0,a5
    3e94:	00000713          	li	a4,0
    3e98:	0077f693          	andi	a3,a5,7
    3e9c:	08068063          	beqz	a3,3f1c <__truncdfsf2+0x100>
    3ea0:	0d80006f          	j	3f78 <__truncdfsf2+0x15c>
    3ea4:	ffe00813          	li	a6,-2
    3ea8:	40e80833          	sub	a6,a6,a4
    3eac:	02000893          	li	a7,32
    3eb0:	0106d833          	srl	a6,a3,a6
    3eb4:	00000713          	li	a4,0
    3eb8:	01150663          	beq	a0,a7,3ec4 <__truncdfsf2+0xa8>
    3ebc:	ca260613          	addi	a2,a2,-862
    3ec0:	00c69733          	sll	a4,a3,a2
    3ec4:	00f76733          	or	a4,a4,a5
    3ec8:	00e03733          	snez	a4,a4
    3ecc:	00e867b3          	or	a5,a6,a4
    3ed0:	fc5ff06f          	j	3e94 <__truncdfsf2+0x78>
    3ed4:	00651513          	slli	a0,a0,0x6
    3ed8:	00a03533          	snez	a0,a0
    3edc:	00369693          	slli	a3,a3,0x3
    3ee0:	01d7d793          	srli	a5,a5,0x1d
    3ee4:	00d566b3          	or	a3,a0,a3
    3ee8:	00f6e7b3          	or	a5,a3,a5
    3eec:	fadff06f          	j	3e98 <__truncdfsf2+0x7c>
    3ef0:	00f6e7b3          	or	a5,a3,a5
    3ef4:	00061663          	bnez	a2,3f00 <__truncdfsf2+0xe4>
    3ef8:	00f037b3          	snez	a5,a5
    3efc:	f99ff06f          	j	3e94 <__truncdfsf2+0x78>
    3f00:	0ff00713          	li	a4,255
    3f04:	00078c63          	beqz	a5,3f1c <__truncdfsf2+0x100>
    3f08:	00369693          	slli	a3,a3,0x3
    3f0c:	020007b7          	lui	a5,0x2000
    3f10:	fd9ff06f          	j	3ee8 <__truncdfsf2+0xcc>
    3f14:	00000793          	li	a5,0
    3f18:	0ff00713          	li	a4,255
    3f1c:	00579693          	slli	a3,a5,0x5
    3f20:	0006de63          	bgez	a3,3f3c <__truncdfsf2+0x120>
    3f24:	00170713          	addi	a4,a4,1
    3f28:	0ff00693          	li	a3,255
    3f2c:	06d70063          	beq	a4,a3,3f8c <__truncdfsf2+0x170>
    3f30:	fc0006b7          	lui	a3,0xfc000
    3f34:	fff68693          	addi	a3,a3,-1 # fbffffff <_memory_end+0xfbfdffff>
    3f38:	00d7f7b3          	and	a5,a5,a3
    3f3c:	0ff00693          	li	a3,255
    3f40:	0037d793          	srli	a5,a5,0x3
    3f44:	00d71863          	bne	a4,a3,3f54 <__truncdfsf2+0x138>
    3f48:	00078663          	beqz	a5,3f54 <__truncdfsf2+0x138>
    3f4c:	004007b7          	lui	a5,0x400
    3f50:	00000593          	li	a1,0
    3f54:	7f8006b7          	lui	a3,0x7f800
    3f58:	01771713          	slli	a4,a4,0x17
    3f5c:	00d77733          	and	a4,a4,a3
    3f60:	00f76733          	or	a4,a4,a5
    3f64:	01f59513          	slli	a0,a1,0x1f
    3f68:	00a76533          	or	a0,a4,a0
    3f6c:	00008067          	ret
    3f70:	00100793          	li	a5,1
    3f74:	00000713          	li	a4,0
    3f78:	00f7f693          	andi	a3,a5,15
    3f7c:	00400613          	li	a2,4
    3f80:	f8c68ee3          	beq	a3,a2,3f1c <__truncdfsf2+0x100>
    3f84:	00478793          	addi	a5,a5,4 # 400004 <_memory_end+0x3e0004>
    3f88:	f95ff06f          	j	3f1c <__truncdfsf2+0x100>
    3f8c:	00000793          	li	a5,0
    3f90:	fadff06f          	j	3f3c <__truncdfsf2+0x120>

00003f94 <__clzsi2>:
    3f94:	000107b7          	lui	a5,0x10
    3f98:	02f57a63          	bgeu	a0,a5,3fcc <__clzsi2+0x38>
    3f9c:	10053793          	sltiu	a5,a0,256
    3fa0:	0017b793          	seqz	a5,a5
    3fa4:	00379793          	slli	a5,a5,0x3
    3fa8:	00004737          	lui	a4,0x4
    3fac:	02000693          	li	a3,32
    3fb0:	40f686b3          	sub	a3,a3,a5
    3fb4:	00f55533          	srl	a0,a0,a5
    3fb8:	7d470793          	addi	a5,a4,2004 # 47d4 <__clz_tab>
    3fbc:	00a787b3          	add	a5,a5,a0
    3fc0:	0007c503          	lbu	a0,0(a5) # 10000 <_bss_end+0xb5dd>
    3fc4:	40a68533          	sub	a0,a3,a0
    3fc8:	00008067          	ret
    3fcc:	01000737          	lui	a4,0x1000
    3fd0:	01800793          	li	a5,24
    3fd4:	fce57ae3          	bgeu	a0,a4,3fa8 <__clzsi2+0x14>
    3fd8:	01000793          	li	a5,16
    3fdc:	fcdff06f          	j	3fa8 <__clzsi2+0x14>

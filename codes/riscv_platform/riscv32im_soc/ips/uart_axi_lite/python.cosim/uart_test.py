#!/usr/bin/env python3

import sys
import cosim_bfm_axi

class Uart():
    def __init__( self, read, write ): 
        self.read  = read
        self.write = write

    def init( self, base_addr=0x60000000
                  , freq=0
                  , baudrate=115200
                  , width=8
                  , parity=0 #0:disabled,1:odd,2:even
                  , stop=1): #1:1-bit, 2:2-bit
        self.set_addr( base_addr )
        if (freq==0): freq = self.get_clk_freq()
        val  = int(freq/baudrate+0.50)&0xFFFF
        val |= 0 if (width==8 ) else (1<<16)
        val |= 0 if (parity==0) else (1<<17)
        val |= 0 if (parity==1) else (1<<18)
        val |= 0 if (stop==1  ) else (1<<19)
        self.write( self.UART_CONTROL, val )

    def get_char( self ):
        val = 0x80000000
        while (val&0x80000000)!=0x80000000:
            val = self.read(self.UART_RX)
        return val&0xFF

    def put_char( self, d ):
        val = 0x80000000
        while (val&0x80000000):
            val = self.read(self.UART_TX)
        if isinstance(d, str):
            b = d.encode()[0]
        else:
            b = d
        self.write(self.UART_TX, b )

    def put_string( self, s ):
        b = s.encode()
        for c in b:
            self.put_char( c )

    def get_clk_freq( self ):
        val = self.read(self.UART_CLK_FREQ)
        return val

    def set_addr( self, addr ):
        self.UART_ADDR_BASE = addr
        self.UART_VERSION   = addr+0x00
        self.UART_NAME      = addr+0x04
        self.UART_CONTROL   = addr+0x10
        self.UART_STATUS    = addr+0x14
        self.UART_TX        = addr+0x18
        self.UART_RX        = addr+0x1C
        self.UART_CLK_FREQ  = addr+0x20

    def get_addr( self ):
        return self.UART_ADDR_BASE

if __name__=='__main__':
    import getopt
    import multiprocessing

    cid    = 0
    port   = 0x2300
    verbos = 0
    rigor  = 0

    try:
        opts, args = getopt.getopt(sys.argv[1:], "hg:r:C:P:", ['help'
                                                            ,'verbose='
                                                            ,'rigor='
                                                            ,'cid='
                                                            ,'port='])
    except getopt.GetoptError:
        sys.exit(2)
    else:
        for opt, arg in opts:
            if opt in ("-h", "--help"):
                print(f"{sys.argv[0]} [options]")
                print(f" -h/--help: help")
                print(f" -g/--verbose=num: set verbose level")
                print(f" -r/--rigor=num: set rigor level")
                print(f" -C/--cid=num: set channel id")
                print(f" -P/--port=num: set socket port")
                sys.exit()
            elif opt in ("-C","--cid"):
                cid = int(arg, 0)
            elif opt in ("-P","--port"):
                port = int(arg, 0)
            elif opt in ("-g","--verbose"):
                verbose = int(arg)
            elif opt in ("-g","--rigor"):
                rigor = int(arg)
            else:
                print("Unknown options: "+str(opt))
                sys.exit(1)

    bfm = cosim_bfm_axi.CosimBfmAxi(cid,port,rigor,verbose)
    uart = Uart( read=bfm.axi_lite_read, write=bfm.axi_lite_write )
    uart.init( base_addr=0x60000000, baudrate=115200, width=8, parity=0, stop=1 )
    uart.put_string( "Hello world!\n" )
    sys.stdout.flush()

    del bfm


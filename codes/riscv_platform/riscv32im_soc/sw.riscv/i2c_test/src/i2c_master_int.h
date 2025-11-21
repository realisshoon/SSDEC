#ifndef I2C_MASTER_INT_H
#define I2C_MASTER_INT_H
//------------------------------------------------------------------------------
// Copyright (c) 2019 by Future Design Systems , Inc.
// All right reserved.
//
// http://www.future-ds.com
//------------------------------------------------------------------------------
// i2c_master_int.c
//------------------------------------------------------------------------------
// VERSION = 2019.01.02.
//------------------------------------------------------------------------------

//------------------------------------------------------------------------------
uint32_t CSRA_I2C_BASE    = 0xC0060000;
uint32_t CSRA_I2C_VERSION =(0xC0060000+0x00);
uint32_t CSRA_I2C_CONTROL =(0xC0060000+0x04);
uint32_t CSRA_I2C_STATUS  =(0xC0060000+0x08);
uint32_t CSRA_I2C_CONFIG  =(0xC0060000+0x0C);
uint32_t CSRA_I2C_SEL     =(0xC0060000+0x10);
uint32_t CSRA_I2C_CLK_FREQ=(0xC0060000+0x20);
uint32_t CSRA_I2C_SPEED   =(0xC0060000+0x24);
uint32_t CSRA_I2C_CLKDIV  =(0xC0060000+0x28);
uint32_t CSRA_I2C_RUN     =(0xC0060000+0x30);
uint32_t CSRA_I2C_TX_DATA =(0xC0060000+0x40);
uint32_t CSRA_I2C_RX_DATA =(0xC0060000+0x50);

//------------------------------------------------------------------------------
#define I2C_CTL_rst          31
#define I2C_CTL_ie            1
#define I2C_CTL_en            0

#define I2C_STS_rst          31
#define I2C_STS_busy         30
#define I2C_STS_mst_id       24
#define I2C_STS_rx_depth     16
#define I2C_STS_tx_depth      8
#define I2C_STS_ip            1
#define I2C_STS_ie            0

#define I2C_CONF_i2c_num     28
#define I2C_CONF_gap         12
#define I2C_CONF_post         8
#define I2C_CONF_mid          4
#define I2C_CONF_pre          0

#define I2C_SEL_sel           0

#define I2C_RUN_num          24
#define I2C_RUN_rcv_items    16
#define I2C_RUN_snd_rooms     8
#define I2C_RUN_done          1
#define I2C_RUN_go            0

#define I2C_TX_DATA_repeat   12
#define I2C_TX_DATA_stop     11
#define I2C_TX_DATA_rcv      10
#define I2C_TX_DATA_drv       9
#define I2C_TX_DATA_start     8

#define I2C_RX_DATA_ack       8

//------------------------------------------------------------------------------
#define I2C_CTL_rst_MSK        (0x01<<I2C_CTL_rst   )
#define I2C_CTL_ie_MSK         (0x01<<I2C_CTL_ie    )
#define I2C_CTL_en_MSK         (0x01<<I2C_CTL_en    )

#define I2C_STS_rst_MSK        (0x01<<I2C_STS_rst     )
#define I2C_STS_busy_MSK       (0x01<<I2C_STS_busy    )
#define I2C_STS_mst_id_MSK     (0x0F<<I2C_STS_mst_id  )
#define I2C_STS_rx_depth_MSK   (0xFF<<I2C_STS_rx_depth)
#define I2C_STS_tx_depth_MSK   (0xFF<<I2C_STS_tx_depth)
#define I2C_STS_ip_MSK         (0x01<<I2C_STS_ip      )
#define I2C_STS_ie_MSK         (0x01<<I2C_STS_ie      )

#define I2C_CONF_i2c_num_MSK   (0x0F<<I2C_CONF_i2c_num)
#define I2C_CONF_gap_MSK       (0x0F<<I2C_CONF_gap    )
#define I2C_CONF_post_MSK      (0x0F<<I2C_CONF_post   )
#define I2C_CONF_mid_MSK       (0x0F<<I2C_CONF_mid    )
#define I2C_CONF_pre_MSK       (0x0F<<I2C_CONF_pre    )

#define I2C_SEL_sel_MSK        (0x0F<<I2C_SEL_sel     )

#define I2C_RUN_num_MSK        (0xFF<<I2C_RUN_num      )
#define I2C_RUN_rcv_items_MSK  (0xFF<<I2C_RUN_rcv_items)
#define I2C_RUN_snd_rooms_MSK  (0xFF<<I2C_RUN_snd_rooms)
#define I2C_RUN_done_MSK       (0x01<<I2C_RUN_done     )
#define I2C_RUN_go_MSK         (0x01<<I2C_RUN_go       )

#define I2C_TX_DATA_repeat_MSK (0x01<<I2C_TX_DATA_REPEAT)
#define I2C_TX_DATA_stop_MSK   (0x01<<I2C_TX_DATA_stop  )
#define I2C_TX_DATA_rcv_MSK    (0x01<<I2C_TX_DATA_rcv   )
#define I2C_TX_DATA_drv_MSK    (0x01<<I2C_TX_DATA_drv   )
#define I2C_TX_DATA_start_MSK  (0x01<<I2C_TX_DATA_start )

#define I2C_RX_DATA_ack_MSK    (0x01<<I2C_RX_DATA_ack  )
#define I2C_RX_DATA_dat_MSK    (0xFF)

//------------------------------------------------------------------------------
// Revision History
//
// 2019.01.02: Start by Ando Ki (adki@future-ds.com)
//------------------------------------------------------------------------------
#endif

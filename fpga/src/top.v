//top.v
//The top module of SYRF1 project.


module top(
//ad interface
ch1_cs_n,
ch1_sclk,
ch1_sdata,
ch2_cs_n,
ch2_sclk,
ch2_sdata,
ch3_cs_n,
ch3_sclk,
ch3_sdata,
ch4_cs_n,
ch4_sclk,
ch4_sdata,
ch5_cs_n,
ch5_sclk,
ch5_sdata,
ch6_cs_n,
ch6_sclk,
ch6_sdata,
ch7_cs_n,
ch7_sclk,
ch7_sdata,
ch8_cs_n,
ch8_sclk,
ch8_sdata,
//uart slave
uart_tx,
uart_rx,
//ast led boot num
ast_ctrl,
led,
boot,
num,
//sd
sd_busy,
sd_pwctrl,
sd_uart_rx,
sd_uart_tx,
//3g model
g3_uart_tx,
g3_uart_rx,
g3_link,
g3_full,
g3_rst,
g3_sel,
//SPI and I2C
spi1_nss,
spi1_sck,
spi1_miso,
spi1_mosi,
spi2_nss,
spi2_sck,
spi2_miso,
spi2_mosi,
i2c1_scl,
i2c1_sda,
//clk rst 
mclk0,
mclk1,
mclk2,
hrst_n

);
//ad interface
output ch1_cs_n;
output ch1_sclk;
input  ch1_sdata;
output ch2_cs_n;
output ch2_sclk;
input  ch2_sdata;
output ch3_cs_n;
output ch3_sclk;
input  ch3_sdata;
output ch4_cs_n;
output ch4_sclk;
input  ch4_sdata;
output ch5_cs_n;
output ch5_sclk;
input  ch5_sdata;
output ch6_cs_n;
output ch6_sclk;
input  ch6_sdata;
output ch7_cs_n;
output ch7_sclk;
input  ch7_sdata;
output ch8_cs_n;
output ch8_sclk;
input  ch8_sdata;
//uart slave
output uart_tx;
input  uart_rx;
//ast led boot num
output [7:0] ast_ctrl;
output [2:0]	led;
input	 [7:0]	boot;
input  [7:0]	num;
//sd farm
input 	sd_busy;
input 	sd_pwctrl;
input 	sd_uart_rx;
output 	sd_uart_tx;

//3g modle
output	g3_uart_tx;
input		g3_uart_rx;
input		g3_link;
input		g3_full;
output	g3_rst;
output	g3_sel;
//SPI and I2C
input 	spi1_nss;
input 	spi1_sck;
output 	spi1_miso;
input 	spi1_mosi;
output 	spi2_nss;
output 	spi2_sck;
input 	spi2_miso;
output 	spi2_mosi;
input i2c1_scl;
inout i2c1_sda;
//clk rst
input 				mclk0;
input 				mclk1;
input 				mclk2;
input					hrst_n;
//-------------------------------------------
//-------------------------------------------

//--------- clk rst -----------
wire clk_sys;
wire clk_slow;
wire rst_n;
clk_rst_top u_clk_rst(
.hrst_n(hrst_n),
.mclk0(mclk0),
.mclk1(mclk1),
.mclk2(mclk2),
.clk_sys(clk_sys),
.clk_slow(clk_slow),
.rst_n(rst_n)
);


//---------- ad_top --------
wire [15:0]	ad1_data;
wire				ad1_vld;
ad_top u_ad_top(
//ad interface
.cs_n(ch1_cs_n),
.sclk(ch1_sclk),
.sdata(ch1_sdata),
//data path
.ad_data(ad1_data),
.ad_vld(ad1_vld),
//clk rst
.clk_sys(clk_sys),
.rst_n(rst_n)
);



endmodule

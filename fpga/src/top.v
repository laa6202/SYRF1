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
irq_n,
//boot,
num,
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
output irq_n;
//input	 [7:0]	boot;
input  [7:0]	num;
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
wire pluse_us;
wire rst_n;
clk_rst_top u_clk_rst(
.hrst_n(hrst_n),
.mclk0(mclk0),
.mclk1(mclk1),
.mclk2(mclk2),
.clk_sys(clk_sys),
.clk_slow(clk_slow),
.pluse_us(pluse_us),
.rst_n(rst_n)
);



//---------- fx bus ------------
//fx bus device
wire 				fx_wr;
wire [7:0]	fx_data;
wire [21:0]	fx_waddr;
wire [21:0]	fx_raddr;
wire 				fx_rd;
wire  [7:0]	con_fx_q;
wire  [7:0] app_fx_q;
wire  [7:0] chip1_fx_q;
wire  [7:0] chip2_fx_q;
wire  [7:0]	ad1_fx_q;
wire  [7:0]	ad2_fx_q;
wire  [7:0]	ad3_fx_q;
wire  [7:0]	ad4_fx_q;
wire  [7:0]	ad5_fx_q;
wire  [7:0]	ad6_fx_q;
wire  [7:0]	ad7_fx_q;
wire  [7:0]	ad8_fx_q;
wire [7:0] dsp1_fx_q;
wire [7:0] dsp2_fx_q;
wire [7:0] dsp3_fx_q;
wire [7:0] dsp4_fx_q;
wire [7:0] dsp5_fx_q;
wire [7:0] dsp6_fx_q;
wire [7:0] dsp7_fx_q;
wire [7:0] dsp8_fx_q;
wire [7:0]	p1_fx_q;
wire [7:0]	p2_fx_q;
wire [7:0]	p3_fx_q;
wire [7:0]	p4_fx_q;
wire [7:0]	p5_fx_q;
wire [7:0]	p6_fx_q;
wire [7:0]	p7_fx_q;
wire [7:0]	p8_fx_q;
wire [7:0] 	ast1_fx_q;
wire [7:0] 	ast2_fx_q;
wire [7:0] 	ast3_fx_q;
wire [7:0] 	ast4_fx_q;
wire [7:0] 	ast5_fx_q;
wire [7:0] 	ast6_fx_q;
wire [7:0] 	ast7_fx_q;
wire [7:0] 	ast8_fx_q;
//fx bus master
wire 				ufx_wr;
wire [7:0]	ufx_data;
wire [21:0]	ufx_waddr;
wire [21:0]	ufx_raddr;
wire 				ufx_rd;
wire  [7:0]	ufx_q;
fx_bus u_fx_bus(
//fx bus for salve
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.con_fx_q(con_fx_q),
.app_fx_q(app_fx_q),
.chip1_fx_q(chip1_fx_q),
.chip2_fx_q(chip2_fx_q),
.ad1_fx_q(ad1_fx_q),
.ad2_fx_q(ad2_fx_q),
.ad3_fx_q(ad3_fx_q),
.ad4_fx_q(ad4_fx_q),
.ad5_fx_q(ad5_fx_q),
.ad6_fx_q(ad6_fx_q),
.ad7_fx_q(ad7_fx_q),
.ad8_fx_q(ad8_fx_q),
.dsp1_fx_q(dsp1_fx_q),
.dsp2_fx_q(dsp2_fx_q),
.dsp3_fx_q(dsp3_fx_q),
.dsp4_fx_q(dsp4_fx_q),
.dsp5_fx_q(dsp5_fx_q),
.dsp6_fx_q(dsp6_fx_q),
.dsp7_fx_q(dsp7_fx_q),
.dsp8_fx_q(dsp8_fx_q),
.p1_fx_q(p1_fx_q),
.p2_fx_q(p2_fx_q),
.p3_fx_q(p3_fx_q),
.p4_fx_q(p4_fx_q),
.p5_fx_q(p5_fx_q),
.p6_fx_q(p6_fx_q),
.p7_fx_q(p7_fx_q),
.p8_fx_q(p8_fx_q),
.ast1_fx_q(ast1_fx_q),
.ast2_fx_q(ast2_fx_q),
.ast3_fx_q(ast3_fx_q),
.ast4_fx_q(ast4_fx_q),
.ast5_fx_q(ast5_fx_q),
.ast6_fx_q(ast6_fx_q),
.ast7_fx_q(ast7_fx_q),
.ast8_fx_q(ast8_fx_q),
//fx bus for uart maseter
.ufx_waddr(ufx_waddr),
.ufx_wr(ufx_wr),
.ufx_data(ufx_data),
.ufx_rd(ufx_rd),
.ufx_raddr(ufx_raddr),
.ufx_q(ufx_q)
);


//---------- commu_top ----------
commu_top u_commu_top(
//uart slave
.uart_tx(uart_tx),
.uart_rx(uart_rx),
//fx bus
.fx_waddr(ufx_waddr),
.fx_wr(ufx_wr),
.fx_data(ufx_data),
.fx_rd(ufx_rd),
.fx_raddr(ufx_raddr),
.fx_q(ufx_q),
//clk rst
.clk_sys(clk_sys),
.pluse_us(pluse_us),
.rst_n(rst_n)
);



//--------- control_top --------
control_top u_control_top(
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(con_fx_q),
//clk rst
.dev_id(6'h01),
.clk_sys(clk_sys),
.rst_n(rst_n)
);









//---------- ad_top --------
wire [15:0]	ad1_data;
wire				ad1_vld;
ad_top ad1_top(
//ad interface
.cs_n(ch1_cs_n),
.sclk(ch1_sclk),
.sdata(ch1_sdata),
//data path
.ad_data(ad1_data),
.ad_vld(ad1_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(ad1_fx_q),
//clk rst
.dev_id(6'h10),
.clk_sys(clk_sys),
.rst_n(rst_n)
);

wire [15:0]	ad2_data;
wire				ad2_vld;
ad_top ad2_top(
//ad interface
.cs_n(ch2_cs_n),
.sclk(ch2_sclk),
.sdata(ch2_sdata),
//data path
.ad_data(ad2_data),
.ad_vld(ad2_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(ad2_fx_q),
//clk rst
.dev_id(6'h11),
.clk_sys(clk_sys),
.rst_n(rst_n)
);

wire [15:0]	ad3_data;
wire				ad3_vld;
ad_top ad3_top(
//ad interface
.cs_n(ch3_cs_n),
.sclk(ch3_sclk),
.sdata(ch3_sdata),
//data path
.ad_data(ad3_data),
.ad_vld(ad3_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(ad3_fx_q),
//clk rst
.dev_id(6'h12),
.clk_sys(clk_sys),
.rst_n(rst_n)
);

wire [15:0]	ad4_data;
wire				ad4_vld;
ad_top ad4_top(
//ad interface
.cs_n(ch4_cs_n),
.sclk(ch4_sclk),
.sdata(ch4_sdata),
//data path
.ad_data(ad4_data),
.ad_vld(ad4_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(ad4_fx_q),
//clk rst
.dev_id(6'h13),
.clk_sys(clk_sys),
.rst_n(rst_n)
);

wire [15:0]	ad5_data;
wire				ad5_vld;
ad_top ad5_top(
//ad interface
.cs_n(ch5_cs_n),
.sclk(ch5_sclk),
.sdata(ch5_sdata),
//data path
.ad_data(ad5_data),
.ad_vld(ad5_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(ad5_fx_q),
//clk rst
.dev_id(6'h14),
.clk_sys(clk_sys),
.rst_n(rst_n)
);

wire [15:0]	ad6_data;
wire				ad6_vld;
ad_top ad6_top(
//ad interface
.cs_n(ch6_cs_n),
.sclk(ch6_sclk),
.sdata(ch6_sdata),
//data path
.ad_data(ad6_data),
.ad_vld(ad6_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(ad6_fx_q),
//clk rst
.dev_id(6'h15),
.clk_sys(clk_sys),
.rst_n(rst_n)
);

wire [15:0]	ad7_data;
wire				ad7_vld;
ad_top ad7_top(
//ad interface
.cs_n(ch7_cs_n),
.sclk(ch7_sclk),
.sdata(ch7_sdata),
//data path
.ad_data(ad7_data),
.ad_vld(ad7_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(ad7_fx_q),
//clk rst
.dev_id(6'h16),
.clk_sys(clk_sys),
.rst_n(rst_n)
);

wire [15:0]	ad8_data;
wire				ad8_vld;
ad_top ad8_top(
//ad interface
.cs_n(ch8_cs_n),
.sclk(ch8_sclk),
.sdata(ch8_sdata),
//data path
.ad_data(ad8_data),
.ad_vld(ad8_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(ad8_fx_q),
//clk rst
.dev_id(6'h17),
.clk_sys(clk_sys),
.rst_n(rst_n)
);


//--------- dsp_top -----------
wire [15:0] sm1_data;
wire				sm1_vld;
dsp_top dsp1_top(
.ad_data(ad1_data),
.ad_vld(ad1_vld),
.sm_data(sm1_data),
.sm_vld(sm1_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(dsp1_fx_q),
//clk rst
.dev_id(6'h18),
.clk_sys(clk_sys),
.rst_n(rst_n)
);


wire [15:0] sm2_data;
wire				sm2_vld;
dsp_top dsp2_top(
.ad_data(ad2_data),
.ad_vld(ad2_vld),
.sm_data(sm2_data),
.sm_vld(sm2_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(dsp2_fx_q),
//clk rst
.dev_id(6'h19),
.clk_sys(clk_sys),
.rst_n(rst_n)
);

wire [15:0] sm3_data;
wire				sm3_vld;
dsp_top dsp3_top(
.ad_data(ad3_data),
.ad_vld(ad3_vld),
.sm_data(sm3_data),
.sm_vld(sm3_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(dsp3_fx_q),
//clk rst
.dev_id(6'h1a),
.clk_sys(clk_sys),
.rst_n(rst_n)
);


wire [15:0] sm4_data;
wire				sm4_vld;
dsp_top dsp4_top(
.ad_data(ad4_data),
.ad_vld(ad4_vld),
.sm_data(sm4_data),
.sm_vld(sm4_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(dsp4_fx_q),
//clk rst
.dev_id(6'h1b),
.clk_sys(clk_sys),
.rst_n(rst_n)
);

wire [15:0] sm5_data;
wire				sm5_vld;
dsp_top dsp5_top(
.ad_data(ad5_data),
.ad_vld(ad5_vld),
.sm_data(sm5_data),
.sm_vld(sm5_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(dsp5_fx_q),
//clk rst
.dev_id(6'h1c),
.clk_sys(clk_sys),
.rst_n(rst_n)
);

wire [15:0] sm6_data;
wire				sm6_vld;
dsp_top dsp6_top(
.ad_data(ad6_data),
.ad_vld(ad6_vld),
.sm_data(sm6_data),
.sm_vld(sm6_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(dsp6_fx_q),
//clk rst
.dev_id(6'h1d),
.clk_sys(clk_sys),
.rst_n(rst_n)
);

wire [15:0] sm7_data;
wire				sm7_vld;
dsp_top dsp7_top(
.ad_data(ad7_data),
.ad_vld(ad7_vld),
.sm_data(sm7_data),
.sm_vld(sm7_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(dsp7_fx_q),
//clk rst
.dev_id(6'h1e),
.clk_sys(clk_sys),
.rst_n(rst_n)
);

wire [15:0] sm8_data;
wire				sm8_vld;
dsp_top dsp8_top(
.ad_data(ad8_data),
.ad_vld(ad8_vld),
.sm_data(sm8_data),
.sm_vld(sm8_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(dsp8_fx_q),
//clk rst
.dev_id(6'h1f),
.clk_sys(clk_sys),
.rst_n(rst_n)
);


//------------ para top --------
wire [15:0]	ph1_ring;
wire				ph1_vld;	
para_top p1_top(
//data path
.sm_data(sm1_data),
.sm_vld(sm1_vld),
//para 
.ph_ring(ph1_ring),
.ph_vld(ph1_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(p1_fx_q),
//clk rst
.dev_id(6'h20),
.clk_sys(clk_sys),
.rst_n(rst_n)
);

wire [15:0]	ph2_ring;
wire				ph2_vld;	
para_top p2_top(
//data path
.sm_data(sm2_data),
.sm_vld(sm2_vld),
//para 
.ph_ring(ph2_ring),
.ph_vld(ph2_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(p2_fx_q),
//clk rst
.dev_id(6'h21),
.clk_sys(clk_sys),
.rst_n(rst_n)
);

wire [15:0]	ph3_ring;
wire				ph3_vld;	
para_top p3_top(
//data path
.sm_data(sm3_data),
.sm_vld(sm3_vld),
//para 
.ph_ring(ph3_ring),
.ph_vld(ph3_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(p3_fx_q),
//clk rst
.dev_id(6'h22),
.clk_sys(clk_sys),
.rst_n(rst_n)
);

wire [15:0]	ph4_ring;
wire				ph4_vld;	
para_top p4_top(
//data path
.sm_data(sm4_data),
.sm_vld(sm4_vld),
//para 
.ph_ring(ph4_ring),
.ph_vld(ph4_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(p4_fx_q),
//clk rst
.dev_id(6'h23),
.clk_sys(clk_sys),
.rst_n(rst_n)
);


wire [15:0]	ph5_ring;
wire				ph5_vld;	
para_top p5_top(
//data path
.sm_data(sm5_data),
.sm_vld(sm5_vld),
//para 
.ph_ring(ph5_ring),
.ph_vld(ph5_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(p5_fx_q),
//clk rst
.dev_id(6'h24),
.clk_sys(clk_sys),
.rst_n(rst_n)
);


wire [15:0]	ph6_ring;
wire				ph6_vld;	
para_top p6_top(
//data path
.sm_data(sm6_data),
.sm_vld(sm6_vld),
//para 
.ph_ring(ph6_ring),
.ph_vld(ph6_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(p6_fx_q),
//clk rst
.dev_id(6'h25),
.clk_sys(clk_sys),
.rst_n(rst_n)
);


wire [15:0]	ph7_ring;
wire				ph7_vld;	
para_top p7_top(
//data path
.sm_data(sm7_data),
.sm_vld(sm7_vld),
//para 
.ph_ring(ph7_ring),
.ph_vld(ph7_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(p7_fx_q),
//clk rst
.dev_id(6'h26),
.clk_sys(clk_sys),
.rst_n(rst_n)
);


wire [15:0]	ph8_ring;
wire				ph8_vld;	
para_top p8_top(
//data path
.sm_data(sm8_data),
.sm_vld(sm8_vld),
//para 
.ph_ring(ph8_ring),
.ph_vld(ph8_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(p8_fx_q),
//clk rst
.dev_id(6'h27),
.clk_sys(clk_sys),
.rst_n(rst_n)
);


//---------- ast_top ---------
ast_top ast1_top(
.ast(ast_ctrl[0]),
.ad_data(ad1_data),
.ad_vld(ad1_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(ast1_fx_q),
//clk rst
.dev_id(6'h30),
.clk_sys(clk_sys),
.pluse_us(pluse_us),
.rst_n(rst_n)
);

ast_top ast2_top(
.ast(ast_ctrl[1]),
.ad_data(ad2_data),
.ad_vld(ad2_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(ast2_fx_q),
//clk rst
.dev_id(6'h31),
.clk_sys(clk_sys),
.pluse_us(pluse_us),
.rst_n(rst_n)
);

ast_top ast3_top(
.ast(ast_ctrl[2]),
.ad_data(ad3_data),
.ad_vld(ad3_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(ast3_fx_q),
//clk rst
.dev_id(6'h32),
.clk_sys(clk_sys),
.pluse_us(pluse_us),
.rst_n(rst_n)
);

ast_top ast4_top(
.ast(ast_ctrl[3]),
.ad_data(ad4_data),
.ad_vld(ad4_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(ast4_fx_q),
//clk rst
.dev_id(6'h33),
.clk_sys(clk_sys),
.pluse_us(pluse_us),
.rst_n(rst_n)
);

ast_top ast5_top(
.ast(ast_ctrl[4]),
.ad_data(ad5_data),
.ad_vld(ad5_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(ast5_fx_q),
//clk rst
.dev_id(6'h34),
.clk_sys(clk_sys),
.pluse_us(pluse_us),
.rst_n(rst_n)
);

ast_top ast6_top(
.ast(ast_ctrl[5]),
.ad_data(ad6_data),
.ad_vld(ad6_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(ast6_fx_q),
//clk rst
.dev_id(6'h35),
.clk_sys(clk_sys),
.pluse_us(pluse_us),
.rst_n(rst_n)
);

ast_top ast7_top(
.ast(ast_ctrl[6]),
.ad_data(ad7_data),
.ad_vld(ad7_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(ast7_fx_q),
//clk rst
.dev_id(6'h36),
.clk_sys(clk_sys),
.pluse_us(pluse_us),
.rst_n(rst_n)
);

ast_top ast8_top(
.ast(ast_ctrl[7]),
.ad_data(ad8_data),
.ad_vld(ad8_vld),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(ast8_fx_q),
//clk rst
.dev_id(6'h37),
.clk_sys(clk_sys),
.pluse_us(pluse_us),
.rst_n(rst_n)
);


chip_top u_chip1_top(
//data path
.sm1_data(sm1_data),
.sm2_data(sm2_data),
.sm3_data(sm3_data),
.sm4_data(sm4_data),
.sm5_data(sm5_data),
.sm6_data(sm6_data),
.sm7_data(sm7_data),
.sm8_data(sm8_data),
.sm_vld(sm1_vld),
//data debug
.uart_data(),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(chip1_fx_q),
//clk rst
.dev_id(6'h04),
.clk_sys(clk_sys),
.pluse_us(pluse_us),
.rst_n(rst_n)
);



//---------- app_top ---------
wire irq_n;
app_top u_app_top(
//para input 
.ph1_ring(ph1_ring),
.ph1_vld(ph1_vld),
.ph2_ring(ph2_ring),
.ph2_vld(ph2_vld),
.ph3_ring(ph3_ring),
.ph3_vld(ph3_vld),
.ph4_ring(ph4_ring),
.ph4_vld(ph4_vld),
.ph5_ring(ph5_ring),
.ph5_vld(ph5_vld),
.ph6_ring(ph6_ring),
.ph6_vld(ph6_vld),
.ph7_ring(ph7_ring),
.ph7_vld(ph7_vld),
.ph8_ring(ph8_ring),
.ph8_vld(ph8_vld),
//irq and led
.irq_n(irq_n),
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(app_fx_q),
//clk rst
.dev_id(6'h02),
.clk_sys(clk_sys),
.rst_n(rst_n)
);

//-------- irq and led ----
assign led[0] = irq_n;



 
endmodule

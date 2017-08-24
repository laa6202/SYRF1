//top.v
//The top module of SYRF1 project.


module top(
//uart slave
uart_tx,
uart_rx,
//clk rst 
mclk0,
hrst_n

);

//uart slave
output uart_tx;
input  uart_rx;
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



//---------- commu_top ----------
commu_top u_commu_top(
//uart slave
.uart_tx(uart_tx),
.uart_rx(uart_rx),
//fx bus
.fx_waddr(),
.fx_wr(),
.fx_data(),
.fx_rd(),
.fx_raddr(),
.fx_q(),
//clk rst
.clk_sys(clk_sys),
.pluse_us(pluse_us),
.rst_n(rst_n)
);







endmodule

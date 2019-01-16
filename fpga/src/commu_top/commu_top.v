//commu_top.v
//`define LOOP_BACK_UART_TEST
//`define LOOP_BACK_UART_TEST


module commu_top(
//uart slave
uart_tx,
uart_rx,
//fx bus
fx_waddr,
fx_wr,
fx_data,
fx_rd,
fx_raddr,
fx_q,
//pkg data
pkg_d,
pkg_vld,
pkg_done,
//clk rst
clk_sys,
pluse_us,
rst_n
);
//uart slave
output 	uart_tx;
input 	uart_rx;
//fx_bus
output 				fx_wr;
output [7:0]	fx_data;
output [21:0]	fx_waddr;
output [21:0]	fx_raddr;
output 				fx_rd;
input  [7:0]	fx_q;
//pkg data
input [15:0]	pkg_d;
input					pkg_vld;
output				pkg_done;
//clk rst
input clk_sys;
input pluse_us;
input rst_n;
//-----------------------------------------
//-----------------------------------------


//--------- uart physical level ---------
wire [7:0] 	rx_data;
wire				rx_vld;
phy_urx u_phy_urx(
.uart_rx(uart_rx),
.rx_data(rx_data),
.rx_vld(rx_vld),
//clk rst
.clk_sys(clk_sys),
.pluse_us(pluse_us),
.rst_n(rst_n)
);


wire [15:0] tx_data;
wire				tx_vld;
wire 				tx_done;
phy_utx3 u_phy_utx(
.uart_tx(uart_tx),
.tx_data(tx_data),
.tx_vld(tx_vld),
.tx_done(tx_done),
//clk rst
.clk_sys(clk_sys),
.pluse_us(pluse_us),
.rst_n(rst_n)
);
assign tx_data = pkg_d;
assign tx_vld  = pkg_vld;
wire 	 pkg_done = tx_done;


`ifdef LOOP_BACK_UART_TEST
assign tx_data[15:8] = 8'h0;
assign tx_data[7:0] = rx_data;
assign tx_vld = rx_vld;
`else
//--------- fx_bus master --------
fx_master u_fx_master(
//phy data
.rx_data(rx_data),
.rx_vld(rx_vld),
.tx_data(),
.tx_vld(),		//no path for control read
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(fx_q),
//clk rst
.clk_sys(clk_sys),
.rst_n(rst_n)
);


`endif

endmodule


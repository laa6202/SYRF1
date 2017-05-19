//clk_rst_top.v


module clk_rst_top(
hrst_n,
mclk0,
mclk1,
mclk2,
clk_sys,
clk_slow,
rst_n
);
input hrst_n;
input mclk0;
input mclk1;
input mclk2;
output clk_sys;
output clk_slow;
output rst_n;
//---------------------------------
//---------------------------------

wire rst_n;
assign rst_n = hrst_n;

wire clk_100m;
wire clk_1m;
`ifndef SIM
sgpll u_sgpll(
.areset(1'b0),
.inclk0(mclk0),
.c0(clk_100m),
.c1(clk_1m),
.locked()
);
`else
assign clk_100m = mclk1;
assign clk_1m = mclk2;
`endif

wire clk_sys;
assign clk_sys = clk_100m;
wire clk_slow;
assign clk_slow = clk_1m;


endmodule

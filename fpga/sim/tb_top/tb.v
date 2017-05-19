module tb;


//---------- clk rst gen ---------
wire mclk0;
wire mclk1;
wire mclk2;
wire rst_n;

clk_gen u_clk_gen(
.clk_50m(mclk0),
.clk_100m(mclk1),
.clk_1m(mclk2)
);

rst_gen u_rst_gen(
.rst_n(rst_n)
);


//-------- ad chip -----------
wire cs_n;
wire sclk;
wire sdata;
ad_7226 u_ad_7226(
.cs_n(cs_n),
.sclk(sclk),
.sdata(sdata)
);


//---------- DUT -----------
top syrf1_top(
//ad inf
.cs_n(cs_n),
.sclk(sclk),
.sdata(sdata),
//uart slave
.uart_tx(),
.uart_rx(),
//clk rst 
.mclk0(mclk0),
.mclk1(mclk1),
.mclk2(mclk2),
.hrst_n(rst_n)
);

endmodule

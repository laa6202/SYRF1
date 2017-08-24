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


//---------- uart and SPI master ------
wire uart_mosi;
wire uart_miso;
rs232 rs232_master(
.uart_tx(uart_mosi),
.uart_rx(uart_miso)
);

//---------- DUT -----------
top syrf1_top(
//uart slave
.uart_tx(uart_miso),
.uart_rx(uart_mosi),
//clk rst 
.mclk0(mclk0),
.mclk1(mclk1),
.mclk2(mclk2),
.hrst_n(rst_n)
);

endmodule

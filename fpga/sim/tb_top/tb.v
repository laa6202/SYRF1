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
//ad inf
.ch1_cs_n(cs_n),
.ch1_sclk(sclk),
.ch1_sdata(sdata),
.ch2_cs_n(),
.ch2_sclk(),
.ch2_sdata(1'b0),
.ch3_cs_n(),
.ch3_sclk(),
.ch3_sdata(1'b0),
.ch4_cs_n(),
.ch4_sclk(),
.ch4_sdata(1'b0),
.ch5_cs_n(),
.ch5_sclk(),
.ch5_sdata(1'b0),
.ch6_cs_n(),
.ch6_sclk(),
.ch6_sdata(1'b0),
.ch7_cs_n(),
.ch7_sclk(),
.ch7_sdata(1'b0),
.ch8_cs_n(),
.ch8_sclk(),
.ch8_sdata(1'b0),
//led and irq
.ast_ctrl(),
.irq_n(),
.led(),
.num(8'h0),
//uart slave
.uart_tx(uart_miso),
.uart_rx(uart_mosi),
//data debug
.uart_data(),
//clk rst 
.mclk0(mclk0),
.mclk1(mclk1),
.mclk2(mclk2),
.hrst_n(rst_n)
);

endmodule

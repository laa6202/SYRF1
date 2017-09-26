//sclk_gen.v
`define DIV 8'd4
`define DIV_HALF	8'd2


module sclk_gen(
sclk,
pluse,
step,
//clk rst
clk_sys,
rst_n
);
output sclk;
output pluse;
output [3:0] step;
//clk rst
input clk_sys;
input rst_n;
//----------------------------------
//----------------------------------


reg [7:0] cnt_cycle;
always @(posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		cnt_cycle <= 8'h0;
	else if(cnt_cycle == (`DIV - 8'h1))
		cnt_cycle <= 8'h0;
	else 
		cnt_cycle <= cnt_cycle + 8'h1;
end
reg sclk;
always @ (posedge clk_sys or negedge rst_n)	begin	
	if(~rst_n)
		sclk <= 1'h1;
	else if(cnt_cycle >= `DIV_HALF)
		sclk <= 1'b1;
	else 
		sclk <= 1'h0;
end

/*
reg pluse;
always @ (posedge clk_sys or negedge rst_n)	begin	
	if(~rst_n)
		pluse <= 1'b0;
	else 
		pluse <= (cnt_cycle == `DIV_HALF) ? 1'b1 : 1'b0;
end
*/
wire pluse;
assign pluse = (cnt_cycle == `DIV_HALF) ? 1'b1 : 1'b0;

 
reg [3:0] step;
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		step <= 4'h0;
	else if(pluse)
		step <= step + 4'h1;
	else 
		;
end

 
endmodule

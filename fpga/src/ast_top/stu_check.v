//stu_check.v

module stu_check(
ast,
ad_data,
ad_vld,
//configuration
stu_sensor,
//clk rst
clk_sys,
pluse_us,
rst_n
);
input ast;
input [15:0]	ad_data;
input 				ad_vld;
//configuration
output [7:0]	stu_sensor;
//clk rst
input clk_sys;
input pluse_us;
input rst_n;

//-------------------------------------
//-------------------------------------

//no logic
wire [7:0]	stu_sensor = 8'h0;

endmodule

//csn_gen.v

module csn_gen(
cs_n,
pluse,
step,
//clk rst
clk_sys,
rst_n
);
output 	cs_n;
input		pluse;
input [3:0] step;
//clk rst
input		clk_sys;
input		rst_n;
//-------------------------------------
//-------------------------------------




wire cs_n;
assign cs_n = (step == 4'h0) ? 1'b1 :
							(step == 4'hf) ? 1'b1 : 1'b0;


endmodule


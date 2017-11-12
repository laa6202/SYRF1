//fracture.v

module fracture(
//para input 
ph_ring,
ph_vld,
//register
cfg_ring_th,
stu_action,
clr_action,
//clk rst
clk_sys,
rst_n
);
//para input 
input [15:0]	ph_ring;
input					ph_vld;
//register
input [15:0]	cfg_ring_th;
output stu_action;
input  clr_action;
//clk rst
input clk_sys;
input rst_n;
//----------------------------------
//----------------------------------


reg stu_action;
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		stu_action <= 1'b0;
	else if(clr_action)
		stu_action <= 1'b0;
	else if(stu_action == 1'b0)	begin
		if(ph_vld)
			stu_action <= (ph_ring >= cfg_ring_th) ? 1'b1 : 1'b0;
		else ;
	end
	else ;
end
		


endmodule


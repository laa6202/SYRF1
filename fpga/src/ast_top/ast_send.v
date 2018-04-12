//ast_send.v

module ast_send(
ast,
//configuration
cfg_pol,
cfg_width,
cmd_ast,
//clk rst
clk_sys,
pluse_us,
rst_n
);
output ast;
//configuration
input [7:0]	cfg_pol;
input [7:0]	cfg_width;
input [7:0]	cmd_ast;
//clk rst
input clk_sys;
input pluse_us;
input rst_n;
//------------------------------------
//------------------------------------


`ifdef SIM
reg [3:0] cnt_cycle;
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		cnt_cycle <= 4'h0;
	else if(cnt_cycle == 4'd9)
		cnt_cycle <= 4'h0;
	else 
		cnt_cycle <= cnt_cycle + 4'h1;
end
wire pluse_us_here = cnt_cycle == 4'd9;
`else
wire pluse_us_here = pluse_us;
`endif

wire fire_ast = (cmd_ast == 8'h1) ? 1'b1 : 1'b0;


//---------- main FSM -----------
parameter S_IDLE = 3'h0;
parameter S_PREP = 3'h1;
parameter S_SEND = 3'h2;
parameter S_CHECK = 3'h3;
parameter S_DONE = 3'h7;
reg [2:0] st_ast;
wire finish_send;
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		st_ast <= S_IDLE;
	else begin
		case(st_ast)
			S_IDLE : st_ast <= fire_ast ? S_PREP : S_IDLE;
			S_PREP : st_ast <= pluse_us_here ? S_SEND : S_PREP;
			S_SEND : st_ast <= finish_send ? S_CHECK : S_SEND;
			S_CHECK: st_ast <= S_DONE ;
			S_DONE : st_ast <= S_IDLE ;
			default : st_ast <= S_IDLE;
		endcase
	end
end

reg [7:0] cnt_send_us;
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		cnt_send_us <= 8'h0;
	else if(pluse_us_here)
		cnt_send_us <= (st_ast == S_SEND) ? (cnt_send_us + 8'h1) : 	8'h0;
	else ;
end
assign 	finish_send = (	cnt_send_us == cfg_width) ? 1'b1 : 1'b0;
			

//----------- ast output ------------
wire ast_i;
assign ast_i = (st_ast == S_SEND) ? 1'b1 : 1'b0;

reg ast;
always @ (posedge clk_sys)	begin
	ast <= (cfg_pol == 8'h0) ? ast_i : (~ast_i);	
end


endmodule

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



endmodule

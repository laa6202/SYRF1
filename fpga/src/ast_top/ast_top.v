//ast_top.v

module ast_top(
ast,
ad_data,
ad_vld,
//fx bus
fx_waddr,
fx_wr,
fx_data,
fx_rd,
fx_raddr,
fx_q,
//clk rst
dev_id,
clk_sys,
pluse_us,
rst_n
);
output ast;
input [15:0]	ad_data;
input 				ad_vld;
//fx_bus
input 				fx_wr;
input [7:0]		fx_data;
input [21:0]	fx_waddr;
input [21:0]	fx_raddr;
input 				fx_rd;
output  [7:0]	fx_q;
//clk rst
input [5:0] dev_id;
input clk_sys;
input pluse_us;
input rst_n;
//------------------------------------
//------------------------------------



//---------- ast_regs ------
wire [7:0]	stu_sensor;
wire [7:0]	cfg_pol;
wire [7:0]	cfg_width;
wire [7:0]	cmd_ast;
ast_regs u_ast_regs(
//fx bus
.fx_waddr(fx_waddr),
.fx_wr(fx_wr),
.fx_data(fx_data),
.fx_rd(fx_rd),
.fx_raddr(fx_raddr),
.fx_q(fx_q),
//reg 
.stu_sensor(stu_sensor),
.cfg_pol(cfg_pol),
.cfg_width(cfg_width),
.cmd_ast(cmd_ast),
//clk rst
.dev_id(dev_id),
.clk_sys(clk_sys),
.rst_n(rst_n)
);


//---------- ast_send ---------
ast_send u_ast_send(
.ast(ast),
//configuration
.cfg_pol(cfg_pol),
.cfg_width(cfg_width),
.cmd_ast(cmd_ast),
//clk rst
.clk_sys(clk_sys),
.pluse_us(pluse_us),
.rst_n(rst_n)
);



//---------stu_check ---------
stu_check u_stu_check(
.ast(ast),
.ad_data(ad_data),
.ad_vld(ad_vld),
//configuration
.stu_sensor(stu_sensor),
//clk rst
.clk_sys(clk_sys),
.pluse_us(pluse_us),
.rst_n(rst_n)
);


endmodule

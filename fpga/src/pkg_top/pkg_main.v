//pkg_main.v

module pkg_main(
//control
fire_pchip,
done_pchip,
fire_papp,
done_papp,
//buf satus
pcbuf_full,
pcbuf_empty,
pabuf_full,
pabuf_empty,
//clk rst
clk_sys,
rst_n
);
//control signal
output fire_pchip;
input	 done_pchip;
output fire_papp;
input  done_papp;
//buf satus
input pcbuf_full;
input pcbuf_empty;
input pabuf_full;
input pabuf_empty;
//clk rst
input clk_sys;
input rst_n;
//-----------------------------------
//-----------------------------------

parameter S_IDLE = 3'h0;
parameter S_FIRE_CHIP = 3'h1;
parameter S_WAIT_CHIP = 3'h2;
parameter S_FIRE_APP  = 3'h3;
parameter S_WAIT_APP  = 3'h4;
parameter S_DONE = 3'h7;
reg [2:0] st_pkg_main;
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		st_pkg_main <= S_IDLE;
	else begin
		case(st_pkg_main)
			S_IDLE : st_pkg_main <= pabuf_full ? S_FIRE_APP :
													(~pabuf_empty) ? S_IDLE :
													(pabuf_empty & pcbuf_full) ? S_FIRE_CHIP : S_IDLE;
			S_FIRE_APP : st_pkg_main <= S_WAIT_APP;
			S_WAIT_APP : st_pkg_main <= done_papp ? S_DONE : S_WAIT_APP;
			S_FIRE_CHIP: st_pkg_main <= S_WAIT_CHIP;
			S_WAIT_CHIP: st_pkg_main <= done_pchip ? S_DONE : S_WAIT_CHIP;
			S_DONE : st_pkg_main <= S_IDLE;
			default : st_pkg_main <= S_IDLE;
		endcase
	end
end

wire fire_pchip = (st_pkg_main == S_FIRE_CHIP) ? 1'b1 : 1'b0;
wire fire_papp  = (st_pkg_main == S_FIRE_APP ) ? 1'b1 : 1'b0;


endmodule

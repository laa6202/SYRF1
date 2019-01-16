//pchip_main.v

module pchip_main(
//control in
fire_pchip,
done_pchip,
//control out
fire_pcpush,
done_pcpush,
//clk rst
clk_sys,
rst_n
);

//control signal in
input 	fire_pchip;
output	done_pchip;
//control out
output fire_pcpush;
input  done_pcpush;
//clk rst
input clk_sys;
input rst_n;
//-----------------------------------
//-----------------------------------

reg done_pchip;
reg fire_pcpush;
always @ (posedge clk_sys)	begin
	done_pchip <= done_pcpush;
	fire_pcpush <= fire_pchip;
end



endmodule

//ad_s2p.v

module ad_s2p(
//ad interface
cs_n,
sclk,
sdata,
//data path
ad_data,
ad_vld,
//clk rst
clk_sys,
rst_n
);

//ad interface
input cs_n;
input sclk;
input sdata;
//data path
output [15:0]	ad_data;
output 				ad_vld;
//clk rst
input clk_sys;
input rst_n;
//------------------------------------
//------------------------------------


reg csn_reg;
always @ (posedge clk_sys)
	csn_reg <= cs_n;
wire cs_rasing = (~csn_reg) & cs_n;

reg sclk_reg;
always @ (posedge clk_sys )
	sclk_reg <= sclk;
wire sclk_rasing = (~sclk_reg) & sclk;


//---------- 
reg [12:0] data;
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		data <= 13'h0;
	else if(cs_n == 1'b0)	begin	
		if(sclk_rasing)
			data <= {data[11:0],sdata};
		else ;
	end
	else 
		data <= 13'b0;
end



//-------- data output -------
reg [15:0] ad_data;
reg					ad_vld;
always @ (posedge clk_sys or negedge rst_n)	begin	
	if(~rst_n)
		ad_data <= 16'h0;
	else if(cs_rasing)
		ad_data <= {data[11:0],4'h0};
	else ;
end
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		ad_vld <= 1'b0;
	else if(cs_rasing)
		ad_vld <= 1'b1;
	else 
		ad_vld <= 1'b0;
end

endmodule

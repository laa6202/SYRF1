//ad_filter.v

module ad_filter(
ad_data_i,
ad_vld_i,
ad_data_o,
ad_vld_o,
//cfg regs
cfg_ave,
//clk rst
clk_sys,
rst_n
);
input [15:0]	ad_data_i;
input					ad_vld_i;
output [15:0]	ad_data_o;
output				ad_vld_o;
//cfg regs
input [7:0]	cfg_ave;
//clk rst
input	clk_sys;
input	rst_n;
//--------------------------------------
//--------------------------------------

wire[1:0] ave_mode =  cfg_ave[1:0];

//----------- sum ----------
reg [15:0]	ad_reg1,ad_reg2,ad_reg3,ad_reg4;
reg [15:0]	ad_reg5,ad_reg6,ad_reg7,ad_reg8;
reg [18:0]  ad_sum8;
reg [17:0]  ad_sum4;
reg [16:0]  ad_sum2;
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n) begin
		ad_reg1 <= 16'h0;
		ad_reg2 <= 16'h0;	
		ad_reg3 <= 16'h0;
		ad_reg4 <= 16'h0;	
		ad_reg5 <= 16'h0;
		ad_reg6 <= 16'h0;	
		ad_reg7 <= 16'h0;
		ad_reg8 <= 16'h0;	
	end
	else if(ad_vld_i)	begin
		ad_reg1 <= ad_data_i;
		ad_reg2 <= ad_reg1;
		ad_reg3 <= ad_reg2;
		ad_reg4 <= ad_reg3;
		ad_reg5 <= ad_reg4;
		ad_reg6 <= ad_reg5;
		ad_reg7 <= ad_reg6;
		ad_reg8 <= ad_reg7;
	end
	else ;
end

always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n) begin
		ad_sum8 <= 19'h0;
		ad_sum4 <= 18'h0;
		ad_sum2 <= 17'h0;
	end
	else if(ad_vld_i)	begin
		ad_sum8 <= 	{3'h0,ad_reg1} + {3'h0,ad_reg2} 
							+	{3'h0,ad_reg3} + {3'h0,ad_reg4}
							+	{3'h0,ad_reg5} + {3'h0,ad_reg6}
							+	{3'h0,ad_reg7} + {3'h0,ad_reg8};
		ad_sum4 <=  {2'h0,ad_reg1} + {2'h0,ad_reg2} 
							+	{2'h0,ad_reg3} + {2'h0,ad_reg4};
		ad_sum2 <=  {1'h0,ad_reg1} + {1'h0,ad_reg2};
	end
	else ;
end

//-------- data output -------
reg [15:0] 	ad_data_o;
reg					ad_vld_o;
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		ad_data_o <= 16'h0;
	else begin
		case(ave_mode)
			2'h0 : ad_data_o <= ad_data_i;
			2'h1 : ad_data_o <= ad_sum2[16:1];
			2'h2 : ad_data_o <= ad_sum4[17:2];
			2'h3 : ad_data_o <= ad_sum8[18:3];
			default : ad_data_o <= ad_data_i;
		endcase
	end
end
always @ (posedge clk_sys)
	ad_vld_o <= ad_vld_i;


endmodule


//para_time.v

`ifdef SIM
	`define PARA_PERIOD 16'h7
`else
	`ifndef PARA_PERIOD
		`define PARA_PERIOD 16'hFFFF
	`endif
`endif

module para_time(
//data path
sm_data,
sm_vld,
//output para
sta_para_ave,
//clk rst
clk_sys,
rst_n
);
//data path
input [15:0]	sm_data;
input					sm_vld;
//output para
output [15:0]	sta_para_ave;
//clk rst
input clk_sys;
input rst_n;
//--------------------------------
//--------------------------------


//-------- main count --------
reg [15:0] cnt_vld;
wire finish_period = (cnt_vld == `PARA_PERIOD) & sm_vld;
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		cnt_vld <= 16'h0;
	else if(sm_vld)
		if(finish_period)
			cnt_vld <= 16'h0;
		else
			cnt_vld <= cnt_vld + 16'h1;
	else ;
end


//--------- sum and average -------
reg [31:0] sum_temp;
wire [31:0] a = {{16{sm_data[15]}},sm_data};
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		sum_temp <= 32'h0;
	else if(finish_period)
		sum_temp <= 32'h0;
	else if(sm_vld)
		sum_temp <= sum_temp + a;
	else; 
end

reg [31:0] sum_data;
always @(posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		sum_data <= 32'h0;
	else if(finish_period)
		sum_data <= sum_temp + a;
	else ;
end


//-------- output sm_ave -------- 
wire [15:0] sta_para_ave;
`ifdef SIM
assign	sta_para_ave = sum_data[18:3];
`else 
assign	sta_para_ave = sum_data[31:16];
`endif

endmodule


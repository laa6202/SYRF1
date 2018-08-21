//hit_main.v

module hit_main(
//data path
sm_data,
sm_vld,
//register
cfg_th,
cfg_hdt,
cfg_ldt,
cfg_swt,
cfg_hwt,
stu_now_hit,
stu_now_lock,
stu_hit_id,
force_end,
//clk rst
clk_sys,
rst_n
);
//data path
input [15:0]	sm_data;
input					sm_vld;
//register
input [15:0]	cfg_th;		//hit threshold
input [31:0]	cfg_hdt;	//hit defination time
input [31:0]	cfg_ldt;	//lock defination time
input [15:0]	cfg_swt;	//saturation width threshold
input [15:0]	cfg_hwt;	//hit width threshold
output stu_now_hit;
output stu_now_lock;
output [15:0] stu_hit_id;
output force_end;
//clk rst
input clk_sys;
input rst_n;
//--------------------------------
//--------------------------------


//--------- main hit FSM ---------
parameter S_IDLE = 3'h0;
parameter S_UP   = 3'h1;
parameter S_DOWN = 3'h2;
parameter S_LOCK = 3'h3;
parameter S_FORCE = 3'h6;
parameter S_DONE = 3'h7;
reg [2:0] st_hit;
reg hit_up;
wire finish_hdt;
wire finish_ldt;
wire force_end/*synthesis keep*/;
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		st_hit <= S_IDLE;
	else begin
		case(st_hit)
			S_IDLE : st_hit <= hit_up ? S_UP : S_IDLE;
			S_UP	 : st_hit <= force_end ? S_FORCE :
												 hit_up ? S_UP : S_DOWN;
			S_DOWN : st_hit <= force_end ? S_FORCE :
												 hit_up ? S_UP : 
												 finish_hdt ? S_LOCK : S_DOWN;
			S_LOCK : st_hit <= finish_ldt ? S_DONE : S_LOCK;
			S_FORCE: st_hit <= S_IDLE;
			S_DONE : st_hit <= S_IDLE;
			default : st_hit <= S_IDLE;
		endcase
	end
end


//--------- FSM switch -------
always @ (posedge clk_sys or negedge rst_n) begin
	if(~rst_n)
		hit_up <= 1'b0;
	else if(sm_vld)
		hit_up <= (sm_data >= cfg_th);
	else ;
end
 
reg [31:0] cnt_hit;
reg [31:0] cnt_lock;
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		cnt_hit <= 32'h0;
	else if(st_hit == S_DOWN)
		cnt_hit <= cnt_hit + 32'h1;
	else 
		cnt_hit <= 32'h0;
end
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		cnt_lock <= 32'h0;
	else if(st_hit == S_LOCK)
		cnt_lock <= cnt_lock + 32'h1;
	else 
		cnt_lock <= 32'h0;
end
assign finish_hdt = (cnt_hit >= cfg_hdt) ? 1'b1 : 1'b0;
assign finish_ldt = (cnt_lock >= cfg_ldt) ? 1'b1 : 1'b0;


reg [7:0]	cnt_sm_sat;
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		cnt_sm_sat <= 8'h0;
	else if(sm_vld)	begin
		if (sm_data >= 16'hfff0) begin
//			cnt_sm_sat <= (cnt_sm_sat == 8'hff) ?  8'hff : cnt_sm_sat+8'h1;
			if(cnt_sm_sat == 8'hff)
				cnt_sm_sat <= 8'hff;
			else 
				cnt_sm_sat <= cnt_sm_sat+8'h1;
		end
		else 
			cnt_sm_sat <= 16'h0;
	end
	else;
end
wire force_end1;
assign force_end1 = (cnt_sm_sat >= cfg_swt) ? 1'b1 : 1'b0;


//-------- status out ------
wire stu_now_hit;
wire stu_now_lock;
assign stu_now_hit = (st_hit == S_UP) | (st_hit == S_DOWN);
assign stu_now_lock = (st_hit == S_LOCK);
reg [15:0] stu_hit_id;
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		stu_hit_id <= 16'h0;
	else if(st_hit == S_DONE)
		stu_hit_id <= stu_hit_id + 16'h1;
	else ;
end


//--------- cnt_up ----------
reg [15:0] cnt_up;
always @(posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		cnt_up <= 16'h0;
	else if(sm_vld)
		cnt_up <= (sm_data >= cfg_th) ? (cnt_up + 16'h1) : 16'h0;
	else ;
end

wire force_end2;
assign force_end2 = (cnt_up >= cfg_hwt) ? 1'b1 :1'b0;

assign force_end = force_end1 | force_end2;

endmodule


//hit_ring.v

module hit_ring(
//data path
sm_data,
sm_vld,
//register
cfg_th,
stu_now_hit,
stu_now_lock,
stu_ring,
//para 
ph_ring,
ph_vld,
//clk rst
clk_sys,
rst_n

);
//data path
input [15:0]	sm_data;
input					sm_vld;
//register
input [15:0]	cfg_th;
input stu_now_hit;
input stu_now_lock;
output [15:0] stu_ring;
//para 
output [15:0]	ph_ring;
output 				ph_vld;
//clk rst
input clk_sys;
input rst_n;
//-----------------------------------
//-----------------------------------

wire now_hit/*synthesis keep*/;
wire now_lock/*synthesis keep*/;
wire now_hit_rasing/*synthesis keep*/;
wire now_hit_falling/*synthesis keep*/;
assign now_hit = stu_now_hit;
assign now_lock = stu_now_lock;
reg now_hit_reg;
always @ (posedge clk_sys)
	now_hit_reg <= now_hit;
assign  now_hit_rasing = (~now_hit_reg ) & now_hit;
assign  now_hit_falling = (~now_hit) & now_hit_reg;


reg [15:0] sm_data_reg;
always @ (posedge clk_sys)
	sm_data_reg <= sm_data;
wire ring_vld/*synthesis keep*/; 
assign ring_vld = (sm_data_reg < cfg_th) & (sm_data >= cfg_th);

reg [15:0] cnt_ring;
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		cnt_ring <= 16'h0;
	else if(now_hit_rasing)
		cnt_ring <= 16'h1;
	else if(now_hit)
		cnt_ring <= ring_vld ? (cnt_ring + 16'h1) : cnt_ring;
	else if(now_lock)
		cnt_ring <= cnt_ring;
	else 
		cnt_ring <= 16'h0;
end

reg [15:0] stu_ring;
always @(posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		stu_ring <= 16'h0;
	else if(now_hit_falling)
		stu_ring <= cnt_ring;
	else ;
end


//--------- para output ---------
//para 
wire [15:0]	ph_ring;
reg 				ph_vld;
assign ph_ring = stu_ring;
always @ (posedge clk_sys)
	ph_vld <= now_hit_falling;

endmodule


//phy_utx.v
//if uart send 55AA for debug open this macro
//`define SEND_55AA_TEST
`define SEND_55AA_TEST


module phy_utx(
uart_tx,
tx_data,
tx_vld,
//clk rst
clk_sys,
pluse_us,
rst_n
);
output uart_tx;
input [7:0]	tx_data;
input 			tx_vld;
//clk rst
input clk_sys;
input pluse_us;
input rst_n;
//---------------------------------
//---------------------------------


wire [7:0] 	tx_data_r;
wire 				tx_vld_r;

//--------- main counter ----------
reg [15:0] cnt_us;
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		cnt_us <= 16'd0;
	else if(cnt_us== 16'd399)
			cnt_us <= 16'd0;
	else if(cnt_us != 16'd0)
			cnt_us <= pluse_us ? (cnt_us + 16'h1) : cnt_us;			
	else if(tx_vld_r)
		cnt_us <= 16'd1;		
	else ;
end


//-------- data prepare ----------
`ifndef SEND_55AA_TEST
	assign tx_data_r = tx_data;
	assign tx_vld_r  = tx_vld;
`else 
	assign tx_vld_r = 1'b1;
	reg flag;
	always @(posedge clk_sys or negedge rst_n)	begin
		if(~rst_n)
			flag <= 1'b0;
		else if((cnt_us == 16'd90) & (pluse_us))
			flag <= ~flag;
		else ;
	end
	assign tx_data_r = flag ? 8'h55: 8'haa;
`endif

reg xor_tx;
reg [7:0] lock_tx;
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n) begin
		xor_tx <= 1'b0;
		lock_tx <= 8'h0;
	end
	else if(tx_vld_r) begin
		xor_tx <= ^tx_data_r;
		lock_tx <= tx_data_r;
	end
	else ;
end


//--------- uart tx output ----------
reg uart_tx;
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		uart_tx <= 1'b1;
	else if(pluse_us)	begin
		case(cnt_us)
			16'd1 : uart_tx <= 1'b0;		//start bit
			16'd9 : uart_tx <= lock_tx[0];
			16'd18 : uart_tx <= lock_tx[1];
			16'd26 : uart_tx <= lock_tx[2];
			16'd35 : uart_tx <= lock_tx[3];
			16'd44 : uart_tx <= lock_tx[4];
			16'd53 : uart_tx <= lock_tx[5];
			16'd61 : uart_tx <= lock_tx[6];
			16'd70 : uart_tx <= lock_tx[7];
			16'd79 : uart_tx <= 1'b1;	//no XOR_TX
			16'd87 : uart_tx <= 1'b1;	//stop bit
			default : ;
		endcase
	end
	else ;
end
	
endmodule

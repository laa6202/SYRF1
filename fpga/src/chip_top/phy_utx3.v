//phy_utx3.v

module phy_utx3(
uart_tx,
tx_data,
tx_vld,
tx_done,
//clk rst
clk_sys,
pluse_us,
rst_n
);
output uart_tx;
input [15:0]	tx_data;
input 			tx_vld;
output			tx_done;
//clk rst
input clk_sys;
input pluse_us;
input rst_n;
//---------------------------------
//---------------------------------


//--------- main counter ----------
reg [9:0] cnt_us;
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n)
		cnt_us <= 10'd0;
	else if(cnt_us== 10'd299)
			cnt_us <= 10'd0;
	else if(tx_vld)
		cnt_us <= 10'd1;		
	else if(cnt_us != 10'd0)
			cnt_us <= pluse_us ? (cnt_us + 10'h1) : cnt_us;
	else ;
end


wire tx_done = (cnt_us== 10'd299) ? 1'b1 : 1'b0;


reg xor_tx;
reg [7:0] lock_tx;
reg [7:0] lock_tx2;
wire [7:0]	lock_tx3 = 8'h0;
always @ (posedge clk_sys or negedge rst_n)	begin
	if(~rst_n) begin
		xor_tx <= 1'b0;
		lock_tx <= 8'h0;
		lock_tx2 <= 8'h0;
	end
	else if(tx_vld) begin
		xor_tx <= ^tx_data;
		lock_tx <= tx_data[15:8];
		lock_tx2 <= tx_data[7:0];
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
			10'd1 : uart_tx <= 1'b0;		//start bit
			10'd9 : uart_tx <= lock_tx[0];
			10'd18 : uart_tx <= lock_tx[1];
			10'd26 : uart_tx <= lock_tx[2];
			10'd35 : uart_tx <= lock_tx[3];
			10'd44 : uart_tx <= lock_tx[4];
			10'd53 : uart_tx <= lock_tx[5];
			10'd61 : uart_tx <= lock_tx[6];
			10'd70 : uart_tx <= lock_tx[7];
			10'd79 : uart_tx <= 1'b1;	//no XOR_TX
			10'd87 : uart_tx <= 1'b1;	//stop bit
			
			10'd101 : uart_tx <= 1'b0;		//start bit
			10'd109 : uart_tx <= lock_tx2[0];
			10'd118 : uart_tx <= lock_tx2[1];
			10'd126 : uart_tx <= lock_tx2[2];
			10'd135 : uart_tx <= lock_tx2[3];
			10'd144 : uart_tx <= lock_tx2[4];
			10'd153 : uart_tx <= lock_tx2[5];
			10'd161 : uart_tx <= lock_tx2[6];
			10'd170 : uart_tx <= lock_tx2[7];
			10'd179 : uart_tx <= 1'b1;	//no XOR_TX
			10'd187 : uart_tx <= 1'b1;	//stop bit
			
			10'd201 : uart_tx <= 1'b0;		//start bit
			10'd209 : uart_tx <= lock_tx3[0];
			10'd218 : uart_tx <= lock_tx3[1];
			10'd226 : uart_tx <= lock_tx3[2];
			10'd235 : uart_tx <= lock_tx3[3];
			10'd244 : uart_tx <= lock_tx3[4];
			10'd253 : uart_tx <= lock_tx3[5];
			10'd261 : uart_tx <= lock_tx3[6];
			10'd270 : uart_tx <= lock_tx3[7];
			10'd279 : uart_tx <= 1'b1;	//no XOR_TX
			10'd287 : uart_tx <= 1'b1;	//stop bit
			default : ;
		endcase
	end
	else ;
end
	
endmodule

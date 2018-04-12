//rs232.v

module rs232(
uart_tx,
uart_rx
);
output uart_tx;
input  uart_rx;
//------------------------------------

reg uart_tx;


task send_utx;
input [7:0] tx_data;
reg xor_tx;
begin
				xor_tx <= ^tx_data;
				uart_tx <= 1'b1;		//idle
#86.8		uart_tx <= 1'b0;		//start
#86.8		uart_tx <= tx_data[7];		//bit7
#86.8		uart_tx <= tx_data[6];		//bit6
#86.8		uart_tx <= tx_data[5];		//bit5
#86.8		uart_tx <= tx_data[4];		//bit4
#86.8		uart_tx <= tx_data[3];		//bit3
#86.8		uart_tx <= tx_data[2];		//bit2
#86.8		uart_tx <= tx_data[1];		//bit1
#86.8		uart_tx <= tx_data[0];		//bit0
#86.8		uart_tx <= xor_tx;		//bit xor
#86.8		uart_tx <= 1'b1;		//stop
#86.8		uart_tx <= 1'b1;		//idle
end
endtask


wire [7:0] cmd;
wire [7:0] addr_h;
wire [7:0] addr_l;
wire [7:0] data;
invert8b u_invc(
.din(8'hb0),
.dout(cmd)
);
invert8b u_inv_addr_h(
.din(8'h00),
.dout(addr_h)
);
invert8b u_inv_addr_l(
.din(8'h30),
.dout(addr_l)
);
invert8b u_inv_data(
.din(8'd1),
.dout(data)
);


initial begin
				uart_tx <= 1'b1;
#700		send_utx(cmd);
#200		send_utx(addr_h);
#200		send_utx(addr_l);
#200		send_utx(data);

end



endmodule

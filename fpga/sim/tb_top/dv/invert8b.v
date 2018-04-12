//invert8b.v

module invert8b(
din,
dout
);
input [7:0] din;
output [7:0] dout;
//--------------------------
//--------------------------
wire [7:0] dout;
assign dout[7] = din[0];
assign dout[6] = din[1];
assign dout[5] = din[2];
assign dout[4] = din[3];
assign dout[3] = din[4];
assign dout[2] = din[5];
assign dout[1] = din[6];
assign dout[0] = din[7];
endmodule

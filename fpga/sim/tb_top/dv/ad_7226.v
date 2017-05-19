//ad_7226.v
//The model of AD 7226 chip.


module ad_7226(
cs_n,
sclk,
sdata
);
input cs_n;
input sclk;
output sdata;
//--------------------------------------

reg sdata ;


reg [11:0] data;
reg [13:0] shift;
initial data <= 12'h523;
always @ (posedge cs_n)
	data <= data + 12'h111;
always @ (negedge cs_n)
	shift <= {2'h0,data};
always @ (negedge sclk)
	shift <= {shift[12:0],1'b0};

always 
	#2
	sdata  <=  shift[13];


endmodule

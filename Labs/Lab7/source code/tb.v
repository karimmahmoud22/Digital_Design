module tb();
reg i_serial_in,CLK,RST;
wire o_serial_out;
TOP U0 (.i_serial_in(i_serial_in),.CLK(CLK),.RST(RST),.o_serial_out(o_serial_out));

initial
 begin
 i_serial_in=1'b1;
 CLK=1'b0;
 RST=1'b0;
 #20
 RST=1'b0;
 #20
 i_serial_in=1'b0;
 #40
 i_serial_in=1'b1;
 #20
 i_serial_in=1'b0;
 #40
 i_serial_in=1'b1;
 $finish();
 end
 
always CLK=~CLK;

endmodule
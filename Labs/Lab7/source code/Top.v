module TOP(input i_serial_in,
input CLK,
input RST,
output o_serial_out);
wire o_CLK,BIT,out1,out2,SER_IN;
CLK_DIV U0 (.i_clk(CLK),.RST(RST),.o_clk(o_CLK));

SISO U1 (.IN(i_serial_in),.CLK(o_CLK),.RST(RST),.OUT(BIT));


SISO U2 (.IN(SER_IN),.CLK(CLK),.RST(RST),.OUT(o_serial_out));

DOUBLE_BIT_serializer U3 (.IN({out2,out1}),.CLK(o_CLK),.RST(RST),.OUT(SER_IN));

convolutional_encoder U4 (.i_bit(BIT),.CLK(o_CLK),.RST(RST),.out1(out1),.out2(out2));



endmodule
module SISO(input IN,
input CLK,
input RST,
output reg OUT);
reg [3:0] SHIFT_REG;
always@(posedge CLK or negedge RST)
 begin
 if(!RST)
  begin
  SHIFT_REG<='b0;
  OUT<=1'b0;
  end
  else
   begin
	SHIFT_REG[0]<=IN;
	SHIFT_REG[1]<=SHIFT_REG[0];
	SHIFT_REG[2]<=SHIFT_REG[1];
	SHIFT_REG[3]<=SHIFT_REG[2];
	OUT<=SHIFT_REG[3];
   end
 end












endmodule
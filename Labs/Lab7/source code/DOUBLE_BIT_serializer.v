module DOUBLE_BIT_serializer(input [1:0] IN,
input CLK,
input RST,
output reg OUT);
reg SER_FLAG;
always@(posedge CLK or negedge RST)
 begin
 if(!RST)
  begin
  OUT<=1'b0;
  SER_FLAG<=1'b0;
  end
  else
   begin
	 if(!SER_FLAG)
	  begin
		OUT<=IN[0];
		SER_FLAG<=1'b1;
	  end
	 else
	  begin
	  OUT<=IN[1];
		SER_FLAG<=1'b0;
	  end 
   end
 end




endmodule 
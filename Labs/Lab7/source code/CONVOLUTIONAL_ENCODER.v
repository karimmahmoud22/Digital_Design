module convolutional_encoder(input i_bit,
input CLK,
input RST,
output reg out1,out2);

localparam S0=2'b00,
			S1=2'b01,
			S2=2'b10,
			S3=2'b11;
reg [1:0] current_state,next_state;
always @(posedge CLK or negedge RST)
 begin
 if(!RST)
  begin
		current_state<=S0;
  end
  else
   begin
	current_state<=next_state;
	end 
 end

always @(*)
begin
case(current_state)
 S0:begin
		if(i_bit)
		 begin
			next_state=S2;
			out1=1'b1;
			out2=1'b1;
		 end
		 else
		 begin
		  next_state=S0;
		  	out1=1'b0;
			out2=1'b0;
		 end
     end
S1:begin
		if(i_bit)
		 begin
			next_state=S2;
			out1=1'b0;
			out2=1'b0;
		 end
		 else
		 begin
		  next_state=S0;
		  out1=1'b1;
		  out2=1'b1;
		 end
     end
S2:begin
		if(i_bit)
		 begin
			next_state=S3;
			out1=1'b0;
			out2=1'b1;
		 end
		 else
		 begin
		  next_state=S1;
		  out1=1'b1;
		  out2=1'b0;
		 end
     end
S3:begin
		if(i_bit)
		 begin
			next_state=S3;
			out1=1'b1;
			out2=1'b0;
		 end
		 else
		 begin
		  next_state=S1;
		  out1=1'b0;
		  out2=1'b1;
		 end
     end
endcase
end










endmodule
module BCD_adder_final( x , y , s2 , carry );

	input [3:0] x;
	input [3:0] y;
	output reg [3:0] s2;
	output reg carry;
	reg [3:0] s;
	
	always@(*) begin
	
		{carry,s} = x+y;
	
		if( carry || ( s[3] & s[2] ) || ( s[3] & s[1] ) ) begin
			s2=s+4'b0110;
		end
		
		else begin
			s2=s;
		end
	
	end

endmodule
module mux (
	output reg [3:0] o_out, 
	input wire [3:0] i_in0,
	input wire [3:0] i_in1,
	input wire [3:0] i_in2,
	input wire [3:0] i_in3,
	input wire [1:0] i_sel 
	);
	
	always @ (*) begin
	
		case (i_sel)
		
			2'b00: o_out = i_in0;
			2'b01: o_out = i_in1; 
			2'b10: o_out = i_in2;
			2'b11: o_out = i_in3;
		
			default: o_out = 'b0; 
		
		endcase
	
	end
endmodule

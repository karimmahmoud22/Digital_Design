//Unknown circuit logic 
module cir1(input wire [1:0] A,B, output [2:0] C);

	reg wire1,wire2,wire3,wire4,wire5;

	always@(*) begin
		wire1=A[1]^B[1];
		wire2=A[0]^B[0];
		wire3=~(A[0]|(~B[0]));
		wire4=~A[1];
		wire5=~(~A[0]|(B[0]));
	end
	
	assign C[0]=~(wire1|wire2);
	assign C[1]=(wire1) ? wire4:wire3;
	assign C[2]= (wire1) ?A[1]:wire5;
 
endmodule

//After knowing the Logic of the circuit
module cir1(input wire [1:0] A,B, output [2:0] C);

	assign C[0]=(A==B) ? 1'b1:1'b0;
   assign C[1]=(A<B) ? 1'b1:1'b0;
	assign C[2]=(A>B) ? 1'b1:1'b0;
 
endmodule

//TestBench of The Circuit
module TOP_TB ();

	reg [1:0]operand_A_TB;
	reg [1:0]operand_B_TB;
	wire [2:0] C_tb;

	cir1 DUT(.A(operand_A_TB),.B(operand_B_TB),.C(C_tb));
 
initial begin

	operand_A_TB=2'b00;
	operand_B_TB=2'b00;

	#30
	operand_A_TB=2'b00;
	operand_B_TB=2'b01;

	#30
	operand_A_TB=2'b00;
	operand_B_TB=2'b10;

	#30
	operand_A_TB=2'b00;
	operand_B_TB=2'b11;

	#30
	operand_A_TB=2'b01;
	operand_B_TB=2'b00;

	#30
	operand_A_TB=2'b01;
	operand_B_TB=2'b01;

	#30
	operand_A_TB=2'b01;
	operand_B_TB=2'b10;

	#30
	operand_A_TB=2'b01;
	operand_B_TB=2'b11;

	#30
	operand_A_TB=2'b10;
	operand_B_TB=2'b00;

	#30
	operand_A_TB=2'b10;
	operand_B_TB=2'b01;

	#30
	operand_A_TB=2'b10;
	operand_B_TB=2'b10;

	#30
	operand_A_TB=2'b10;
	operand_B_TB=2'b11;

	#30
	operand_A_TB=2'b11;
	operand_B_TB=2'b00;

	#30
	operand_A_TB=2'b11;
	operand_B_TB=2'b01;

	#30
	operand_A_TB=2'b11;
	operand_B_TB=2'b10;

	#30
	operand_A_TB=2'b11;
	operand_B_TB=2'b11;

	#100
	$stop;

end

endmodule

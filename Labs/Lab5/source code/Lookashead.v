module half_adder(input a,b,
output c,d);
assign c=a^b;
assign d=a&b;


endmodule 

module lockahead_adder
(
	input wire [3:0] A,B,
   input Cin,
	output [3:0] Couts,Sum,
	output Cout
	);
	
	wire P1,G1,P2,G2,P3,G3,P4,G4;	

	half_adder U1(.a(A[0]),.b(B[0]),.c(P1),.d(G1));
	half_adder U2(.a(A[1]),.b(B[1]),.c(P2),.d(G2));
	half_adder U3(.a(A[2]),.b(B[2]),.c(P3),.d(G3));
	half_adder U4(.a(A[3]),.b(B[3]),.c(P4),.d(G4));

	assign Couts[0]=(P1&Cin|G1);
	assign Couts[1]=(P1&Cin&P2)|(P2&G1)|(G2);
	assign Couts[2]=(P3&P2&P1&Cin)|(P3&P2&G1)|(P3&G2)|(G3);
	assign Couts[3]=(G4)|(P4&G3)|(P4&P3&G2)|(P4&P3&P2&G1)|(P4&P3&P2&P1&Cin);

	xor U5(Sum[0],Cin,P1);
	xor U6(Sum[1],Couts[0],P2);
	xor U7(Sum[2],Couts[1],P3);
	xor U8(Sum[3],Couts[2],P4);
	assign Cout=Couts[3];

endmodule




module xor_gate ( in1 , in2, out );

	input in1, in2;
	output out;
	
	assign out = ( in1 & ~in2 ) | ( ~in1 & in2);
	
endmodule

module and_gate ( in1 , in2, out );

	input in1, in2;
	output out;
	
	assign out = in1 & in2;

endmodule


module or_gate ( in1 , in2, out );

	input in1, in2;
	output out;
	
	assign out = in1 | in2;

endmodule


module full_adder ( in1 , in2, Cin , out, Cout );

	input in1, in2, Cin;
	output out, Cout;
	wire p,r,s;

	xor_gate sum1(in1, in2, p);
	xor_gate sum2(p, Cin, out);

	and_gate carry1 ( p, Cin, r );
	and_gate carry2 ( in1, in2, s);
	
	or_gate or1 ( r, s, Cout);
	
endmodule


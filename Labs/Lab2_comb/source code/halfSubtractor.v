module halfSubtractor(A,B,d,bo);

	input A,B;
	output d,bo;
	xor a1(d,a,b);
	and a2(bo,~a,b);

endmodule
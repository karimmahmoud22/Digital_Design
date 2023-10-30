module FABehavioral(A,B,cin,sum,cout);

	input A,B,cin;
	output reg sum,cout;

	always @(*) begin
		{cout,sum}=A+B+cin;
	
	end

endmodule
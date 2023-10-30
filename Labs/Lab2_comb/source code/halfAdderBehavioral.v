module halfAdderBehavioral(A,B,sum,carry);

	input A,B;
	output reg sum,carry;
	always @(*) begin
		{carry,sum}=A+B;
	end

endmodule
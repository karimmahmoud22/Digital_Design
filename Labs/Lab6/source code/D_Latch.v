module D_LATCH(
	input D,
	input CLK,
	output reg Q,
	output reg Q_INV
);


	always@(CLK) begin
			if(CLK)
			 begin
				Q<=D;
				Q_INV<=(~D);
			end
		
	end

endmodule
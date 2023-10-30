module D_FF_SYNC(
	input D,
	input CLK,
	input RST,
	output reg Q,
	output reg Q_INV
);


	always@(posedge CLK) begin
	
		if(RST) begin
		
			Q<=1'b0;
			Q_INV<=1'b1;	
				
		end
		else begin
			Q<=D;
			Q_INV<=(~D);
		end 
	end

endmodule
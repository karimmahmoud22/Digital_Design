module D_FF(
	input D,
	input CLK,
	input RST,
	output reg Q,
	output reg Q_INV
);


	always@(posedge CLK or negedge RST) begin
	
		if(!RST) begin
		
			Q<=1'b0;
			Q_INV<=1'b1;	
				
		end
		else begin
			Q<=D;
			Q_INV<=(~D);
		end 
	end

endmodule
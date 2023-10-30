module register_file #(parameter WIDTH = 16, DEPTH = 16, ADDR = 4 )
(	
	input clk,
	input rst,
	input WE,
	input wire [WIDTH-1:0] WD, 
	input wire [ADDR-1:0] A1,
	input wire [ADDR-1:0] A2,
	input wire [ADDR-1:0] A3,
	output wire [WIDTH-1:0] RD1,
	output wire [WIDTH-1:0] RD2
);

	reg [WIDTH-1:0] reg_file [0:DEPTH-1];

	integer i;

	always @(posedge clk or negedge rst) begin 
		if(!rst)
			for(i=0;i<DEPTH;i=i+1)
				reg_file[i] <= 'b0;
		else if(WE)
			reg_file[A3] <= WD;
		end

	assign RD1= reg_file[A1];
	assign RD2= reg_file[A2];

endmodule
`timescale 1ns/1ps
module mux_tb ();

	wire [3:0] o_out_tb; 
	reg [3:0] i_in0_tb; 
	reg [3:0] i_in1_tb;
	reg [3:0] i_in2_tb;
	reg [3:0] i_in3_tb;
	reg [1:0] i_sel_tb; 

	// Module Instantiation

	mux dut (
		.o_out (o_out_tb),
		.i_in0 (i_in0_tb), 
		.i_in1 (i_in1_tb), 
		.i_in2 (i_in2_tb), 
		.i_in3 (i_in3_tb),
		.i_sel (i_sel_tb)
	); 

	integer i = 0;

	initial begin
	// Initialization 

	$monitor ("[%0t] i_sel_tb = 0x%0h i_in0_tb = 0x%0h i_in1_tb = 0x%0h i_in2_tb = 0x%0h i_in3_tb = 0x%0h o_out_tb = 0x%0h", $time, i_sel_tb, i_in0_tb, i_in1_tb, i_in2_tb, i_in3_tb, o_out_tb); 

	i_sel_tb = 0; 
	i_in0_tb = $random;
	i_in1_tb = $random;
	i_in2_tb = $random; 
	i_in3_tb = $random;

	for (i = 0; i < 4; i=i+1) begin
		#5
			i_sel_tb <= i; 
	end

	#5 
	$finish;

	end

endmodule

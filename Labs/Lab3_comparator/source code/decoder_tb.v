module decoder_tb();

	//Signal declaration
	reg[1:0] in_tb;
	wire [3:0] out_tb;

	//DUT instantiation
	decoder dut(in_tb,out_tb);

	//Test stimulus generator
	integer i;

	initial begin

	for(i=0;i<4;i=i+1) begin
		in_tb=i;
		#100;
	end

	$stop;
	end

	//Test monitor to report the result
	initial begin
		$monitor("in = %d , out = %b,",in_tb,out_tb);
	end

endmodule

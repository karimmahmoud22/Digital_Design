module comparator_tb();

	reg [3:0]A_t,C_t;
	wire [1:0] out_t;

	//wire [1:0]out_exp;
	comparator DUT(.A(A_t),.C(C_t),.out(out_t));

	initial begin

	A_t=4'b0000;
	C_t=4'b0000;
	check(2'b00);

	#10

	A_t=4'b0100;
	C_t=4'b0010;
	check(2'b00);

	#10

	A_t=4'b0000;
	C_t=4'b1000;
	check(2'b10);

	end task check (input [1:0] out_exp);

	begin
	#1
	if(out_exp==out_t)
		$display("test_case_is_successfull_out_is %b and out_exp is %b",out_t,out_exp);
	else begin
		$display("test_case_is_failed_out_is %b and out_exp is %b",out_t,out_exp);
	end

	#10
		$display("comparison completed at time = %0t", $time);
	end

	endtask

endmodule

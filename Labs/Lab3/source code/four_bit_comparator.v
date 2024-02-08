module half_adder ( a , b , sum , carry );
	
	input a,b;
	output sum, carry;
	
	xor x1 ( sum, a , b );
	and a1 ( carry , a , b );
	
endmodule

module full_adder ( in1 , in2 , Cin , sum , carry );

	input in1, in2, Cin;
	output sum, carry;
	wire ws1, wc1, wc2;
	
	half_adder ha1 ( in1 , in2 , ws1 , wc1 );
	half_adder ha2 ( ws1 , Cin , sum , wc2 );
	or r1 ( carry , wc1 , wc2 );
	

endmodule

module four_bit_comparator( x , y , v , n , z );

	input [3:0] x;
	input [3:0] y;
	output v,n,z;
	wire s0, s1, s2, s3;
	wire c1, c2, c3, c4;
	
	full_adder fa1 ( x[0] , ~y[0] , 1'b1 , s0 , c1 );
	full_adder fa2 ( x[1] , ~y[1] , c1 , s1 , c2 );
	full_adder fa3 ( x[2] , ~y[2] , c2 , s2 , c3 );
	full_adder fa4 ( x[3] , ~y[3] , c3 , s3 , c4 );
	
	nor nor1 ( z , s0 , s1 , s2 , s3 );
	xor xor1 ( v , c3 , c4 );
	
	assign n = s3;

endmodule


module BCD_adder( x , y , s , carry );

	input [3:0] x;
	input [3:0] y;
	output [3:0] s;
	output carry;
	
	wire s0, s1, s2, s3;
	wire c1, c2, c3, c4;
	
	full_adder fa1 ( x[0] , y[0] , 1'b0 , s0 , c1 );
	full_adder fa2 ( x[1] , y[1] , c1 , s1 , c2 );
	full_adder fa3 ( x[2] , y[2] , c2 , s2 , c3 );
	full_adder fa4 ( x[3] , y[3] , c3 , s3 , c4 );
	
	assign carry = c4;
endmodule


module BCD_adder_final( x , y , s , carry, carry2 );

	input [3:0] x;
	input [3:0] y;
	output [3:0] s;
	output carry , carry2;
	
	wire [3:0] ss;
	wire c1, w1 ,w2;
	
	BCD_adder bcd1 ( x , y , ss , c1 );
	
	and a1 ( w1 , ss[3] , ss[2] );
	and a2 ( w2 , ss[3] , ss[1] );
	or o1  ( carry , w1 , w2 , c1 );
	
	BCD_adder bcd2 ( ss , {1'b0,carry,carry,1'b0} , s , carry2 );
	

endmodule
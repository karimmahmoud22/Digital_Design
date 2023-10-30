module half_adder(input a,b,output S,C);

	xor(S,a,b);	
	and(C,a,b);

endmodule


module full_adder(input A,B,Cin,output SUM,CARRY);

	wire W1,W2,W3;

	half_adder U1 (A,B,W1,W2);
	half_adder U2 (W1,Cin,SUM,W3);
	or(CARRY,W2,W3);

endmodule


module CIR(input [2:0] N,output reg Q1,Q0, R0,R1);


	always @(*)
	 begin

		case(N)
		3'b000:begin
				{Q1,Q0}=2'b00;
				end
		3'b001:begin
				{Q1,Q0}=2'b00;
				end
		3'b010:begin
				{Q1,Q0}=2'b00;
				end

		3'b011:begin
				{Q1,Q0}=2'b01;
				end
		3'b100:begin
				{Q1,Q0}=2'b01;
				end
		3'b101:begin
				{Q1,Q0}=2'b01;
				end

		3'b110:begin
				{Q1,Q0}=2'b10;
				end
		3'b111:begin
				{Q1,Q0}=2'b10;
				end
				
		default:begin
			{Q1,Q0}=2'b00;
			end
		endcase 


	  case(N)
		3'b010:begin
				R1=1'b1;
				R0=1'b0;
				end
		 3'b101:begin
				R1=1'b1;
				R0=1'b0;
				end
		 3'b001:begin
				R0=1'b1;
				R1=1'b0;
				end
		 3'b100:begin
				R0=1'b1;
				R1=1'b0;
				end
		 3'b111:begin
				R0=1'b1;
				R1=1'b0;
				end
		default:begin
					R1=1'b0;
					R0=1'b0;
				 end
		endcase 

		end

endmodule


module bit_adder_3(
	input [2:0] An, 
	input [2:0] Bn,
	input Cin,
	output [2:0] SUM,
	output Carry
);

	wire C0,C1;

	full_adder adder1(An[0],Bn[0],Cin,SUM[0],C0);
	full_adder adder2(An[1],Bn[1],C0,SUM[1],C1);
	full_adder adder3(An[2],Bn[2],C1,SUM[2],Carry);

endmodule 


module multiplier_out(input Q1,Q0,output [2:0] M);


	assign M = {Q1,Q0} * 2'b11;
/*
always @(*)
 begin
  case({Q1,Q0})
   2'b00:begin
			M=3'b000;
	      end
	 2'b01:begin
			M=3'b011;
	      end
	 2'b10:begin
			M=3'b110;
	      end
	default:begin
				M=3'b000;
			 end
   endcase 
 end
*/

endmodule



module TOP22(input [2:0] N,output [2:0] Y);

	wire Q1,Q0,R0,R1,Carry;
	wire [2:0] M;

	CIR b1(N,Q1,Q0,R0,R1);
	multiplier_out b3(Q1,Q0,M);

	bit_adder_3 b2({1'b0,R1,R0}, M,1'b0,Y,Carry);

endmodule 
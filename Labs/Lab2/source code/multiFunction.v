module multiFunction(A,B,x,y,F);
input A,B,x,y;
output reg F;
always @(*) begin
	case({x,y}) 
	2'b00:  F=A&B; 
	2'b01:  F=A|B;
	2'b10:  F=~(A|B);
	2'b11:  F=~(A&B);
	endcase
end
endmodule
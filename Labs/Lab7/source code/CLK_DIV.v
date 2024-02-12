module CLK_DIV(input i_clk,
input RST,
output o_clk);
reg Q;
wire D;
always @(posedge i_clk or negedge RST)
 if(!RST)
  begin
	Q<=1'b0;
  end
  else
   begin
	Q<=D;
   end
assign D = ~Q;
assign o_clk = Q;
endmodule
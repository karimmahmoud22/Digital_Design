module multiFunction3(A,B,x,y,F);
input A,B,x,y;
output F;
assign F = (~A&~B&x)|(~A&B&y)|(A&B&~x)|(A&~B&y);
endmodule
module halfAdder(A,B,sum,carry);
input A,B;
output sum,carry;
xor Sum(sum,A,B);
and Carry(carry,A,B);
endmodule
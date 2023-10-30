module multiFunction2(A,B,x,y,F);
input A,B,x,y;
output F;
wire a, b, c, d, e, f, g, h, i, j;
and a1(a, ~A, ~B);
and a2(b, a, x);

and a3(c, ~A, B);
and a4(d, c, y);

and a5(e, A, B);
and a6(f, e, ~x);

and a7(g, A, ~B);
and a8(h, g, y);
or a9(i, b, d);
or a10(j, f, h);
or a11(F, i, j);
endmodule
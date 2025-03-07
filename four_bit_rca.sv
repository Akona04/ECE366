module Ripple_Carry_Adder (
input [3:0] A, B,
input Cin,
output [3:0] S,
output Cout
);
wire c1, c2, c3;
Main_Structural FA0 (S[0], c1, A[0], B[0], Cin);
Main_Structural FA1 (S[1], c2, A[1], B[1], c1);
Main_Structural FA2 (S[2], c3, A[2], B[2], c2);
Main_Structural FA3 (S[3], Cout, A[3], B[3], c3);
endmodule

module Ripple_Carry_Subtractor (
input [3:0] A, B,
output [3:0] S,
output Cout
);
wire [3:0] B_comp;
wire Cin = 1'b1;
wire c1, c2, c3;
assign B_comp = ~B; // Bitwise complement of B
Main_Structural FA0 (S[0], c1, A[0], B_comp[0], Cin);
Main_Structural FA1 (S[1], c2, A[1], B_comp[1], c1);
Main_Structural FA2 (S[2], c3, A[2], B_comp[2], c2);
Main_Structural FA3 (S[3], Cout, A[3], B_comp[3], c3);
endmodule

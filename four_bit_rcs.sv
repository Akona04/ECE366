// Code your design here
module \1_adder (S, Cout, A, B, Cin);
  output S,  Cout;
  input A, B, Cin;
  wire and_0_out, or_0_out, xor_1_out, and_2_out, and_1_out, xor_0_out;
  assign and_0_out = Cin & B;
  assign or_0_out = and_2_out | and_0_out | and_1_out;
  assign Cout = or_0_out;
  assign xor_1_out = xor_0_out ^ Cin;
  assign S = xor_1_out;
  assign and_2_out = Cin & A;
  assign and_1_out = B & A;
  assign xor_0_out = A ^ B;
endmodule


module \4-bit_SUBTRACTOR (c4, s3, s2, s1, s0, inp_0, a0, a1, a2, a3, b0, b1, b2, b3);
  output c4,  s3,  s2,  s1,  s0;
  input inp_0, a0, a1, a2, a3, b0, b1, b2, b3;
  wire not_3_out, F3_out_0, F3_out_1, not_2_out, F2_out_0, F2_out_1, not_1_out, F1_out_0, F1_out_1, not_0_out, F0_out_0, F0_out_1;
  assign not_3_out = ~b3;
  \1_adder  F3(F3_out_0, F3_out_1, a3, not_3_out, F2_out_1);
  assign c4 = F3_out_1;
  assign s3 = F3_out_0;
  assign not_2_out = ~b2;
  \1_adder  F2(F2_out_0, F2_out_1, a2, not_2_out, F1_out_1);
  assign s2 = F2_out_0;
  assign not_1_out = ~b1;
  \1_adder  F1(F1_out_0, F1_out_1, a1, not_1_out, F0_out_1);
  assign s1 = F1_out_0;
  assign not_0_out = ~b0;
  \1_adder  F0(F0_out_0, F0_out_1, a0, not_0_out, inp_0);
  assign s0 = F0_out_0;
endmodule

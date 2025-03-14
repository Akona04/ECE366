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

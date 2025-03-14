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


module \4b_adder/subtractor (c4, s3, s2, s1, s0, inp_0, a0, a1, a2, a3, b0, b1, b2, b3);
  output c4,  s3,  s2,  s1,  s0;
  input inp_0, a0, a1, a2, a3, b0, b1, b2, b3;
  wire Multiplexer_3_out, F3_out_0, F3_out_1, not_3_out, Multiplexer_2_out, F2_out_0, F2_out_1, not_2_out, Multiplexer_1_out, F1_out_0, F1_out_1, not_1_out, Multiplexer_0_out, F0_out_0, F0_out_1, not_0_out;
  Multiplexer2 Multiplexer_3(Multiplexer_3_out, b3, not_3_out, inp_0);
  \1_adder  F3(F3_out_0, F3_out_1, a3, Multiplexer_3_out, F2_out_1);
  assign c4 = F3_out_1;
  assign s3 = F3_out_0;
  assign not_3_out = ~b3;
  Multiplexer2 Multiplexer_2(Multiplexer_2_out, b2, not_2_out, inp_0);
  \1_adder  F2(F2_out_0, F2_out_1, a2, Multiplexer_2_out, F1_out_1);
  assign s2 = F2_out_0;
  assign not_2_out = ~b2;
  Multiplexer2 Multiplexer_1(Multiplexer_1_out, b1, not_1_out, inp_0);
  \1_adder  F1(F1_out_0, F1_out_1, a1, Multiplexer_1_out, F0_out_1);
  assign s1 = F1_out_0;
  assign not_1_out = ~b1;
  Multiplexer2 Multiplexer_0(Multiplexer_0_out, b0, not_0_out, inp_0);
  \1_adder  F0(F0_out_0, F0_out_1, a0, Multiplexer_0_out, inp_0);
  assign s0 = F0_out_0;
  assign not_0_out = ~b0;
endmodule

module Multiplexer2(out, in0, in1, sel);
  parameter WIDTH = 1;
  output reg [WIDTH-1:0] out;
  input [WIDTH-1:0] in0, in1;
  input [0:0] sel;
  
  always @ (*)
    case (sel)
      0 : out = in0;
      1 : out = in1;
    endcase
endmodule


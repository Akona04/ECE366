module Main_Structural(S, Cout, A, B, Cin);
    output S, Cout;
    input A, B, Cin;

    wire and_0_out, or_1_out, or_0_out, and_2_out, and_1_out, xor_0_out;

    and (and_0_out, Cin, B);
    and (and_2_out, Cin, A);
    and (and_1_out, B, A);
    or  (or_1_out, and_2_out, and_0_out, and_1_out);
    assign Cout = or_1_out;
    xor (xor_0_out, A, B);
    or  (or_0_out, xor_0_out, Cin);
    assign S = or_0_out;

endmodule

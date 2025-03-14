// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps

module TestBench();

  //inputs for the 1-bit full adder
  reg A, B, Cin;
  wire S, Cout;

  //inputs for the 4-bit subtractor
  reg inp_0, a0, a1, a2, a3, b0, b1, b2, b3;
  wire c4, s3, s2, s1, s0;

  \1_adder DUT1 (S, Cout, A, B, Cin);

  \4-bit_SUBTRACTOR DUT2 (c4, s3, s2, s1, s0, inp_0, a0, a1, a2, a3, b0, b1, b2, b3);

  initial begin
    $dumpfile("adder_subtractor_tb.vcd");
    $dumpvars(0, TestBench);
    $display("\n1-bit Full Adder Testbench");
    $display("| A | B | Cin | Sum | Cout |");

    #10 A = 0; B = 0; Cin = 0;
    #10 $display("| %b | %b |  %b  |  %b  |  %b  |", A, B, Cin, S, Cout);
    #10 A = 0; B = 0; Cin = 1;
    #10 $display("| %b | %b |  %b  |  %b  |  %b  |", A, B, Cin, S, Cout);
    #10 A = 0; B = 1; Cin = 0;
    #10 $display("| %b | %b |  %b  |  %b  |  %b  |", A, B, Cin, S, Cout);
    #10 A = 0; B = 1; Cin = 1;
    #10 $display("| %b | %b |  %b  |  %b  |  %b  |", A, B, Cin, S, Cout);
    #10 A = 1; B = 0; Cin = 0;
    #10 $display("| %b | %b |  %b  |  %b  |  %b  |", A, B, Cin, S, Cout);
    #10 A = 1; B = 0; Cin = 1;
    #10 $display("| %b | %b |  %b  |  %b  |  %b  |", A, B, Cin, S, Cout);
    #10 A = 1; B = 1; Cin = 0;
    #10 $display("| %b | %b |  %b  |  %b  |  %b  |", A, B, Cin, S, Cout);
    #10 A = 1; B = 1; Cin = 1;
    #10 $display("| %b | %b |  %b  |  %b  |  %b  |", A, B, Cin, S, Cout);

    $display("\n4-bit Subtractor Testbench");
    $display("| A    |  B   | Carry-in   | Result   | Carry-out |");

    #10 a3=0; a2=1; a1=0; a0=1;  b3=0; b2=0; b1=1; b0=1;  inp_0=1;
    #10 $display("| %b%b%b%b | %b%b%b%b |     %b      |   %b%b%b%b   |      %b      |", a3, a2, a1, a0, b3, b2, b1, b0, inp_0, s3, s2, s1, s0, c4);

    #10 a3=1; a2=1; a1=0; a0=0;  b3=0; b2=1; b1=0; b0=1;  inp_0=1;
    #10 $display("| %b%b%b%b | %b%b%b%b |     %b      |   %b%b%b%b   |      %b      |", a3, a2, a1, a0, b3, b2, b1, b0, inp_0, s3, s2, s1, s0, c4);

    #10 a3=1; a2=0; a1=1; a0=1;  b3=1; b2=0; b1=0; b0=0;  inp_0=1;
    #10 $display("| %b%b%b%b | %b%b%b%b |     %b      |   %b%b%b%b   |      %b      |",  a3, a2, a1, a0, b3, b2, b1, b0, inp_0, s3, s2, s1, s0, c4);

    #10 a3=1; a2=0; a1=0; a0=0;  b3=1; b2=1; b1=1; b0=1;  inp_0=1;
    #10 $display("| %b%b%b%b | %b%b%b%b |     %b      |   %b%b%b%b   |      %b      |",  a3, a2, a1, a0, b3, b2, b1, b0, inp_0, s3, s2, s1, s0, c4);


    $finish;
  end

endmodule

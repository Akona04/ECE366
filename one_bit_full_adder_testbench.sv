// Code your testbench here
// or browse Examples
`timescale 1ns / 1ps

module TestBench();

  //inputs
  reg A, B, Cin;
  
  //outputs
  wire S, Cout;

  //1-bit full adder module
  \1_adder DUT (S, Cout, A, B, Cin);

  initial begin
    $dumpfile("1bit_adder.vcd");
    $dumpvars(0, TestBench);
    $display("| A | B | Cin | Sum | Cout |");
    $display("------------------------------------");

    //test cases
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

    $finish;
  end

endmodule

module TestBench();
  reg A, B, Cin;
  wire S, Cout; 

  fulladder DUT(S, Cout, A, B, Cin);

  initial begin
    $display("Time : A B Cin : S : Cout");
    $monitor("%4t : %b %b  %b  : %b : %b", $time, A, B, Cin, S, Cout);
    
    A = 0; B = 0; Cin = 0; 
    #10;
    A = 0; B = 0; Cin = 1; 
    #10;
    A = 0; B = 1; Cin = 0;
    #10;
    A = 0; B = 1; Cin = 1; 
    #10;
    A = 1; B = 0; Cin = 0; 
    #10;
    A = 1; B = 0; Cin = 1; 
    #10;
    A = 1; B = 1; Cin = 0; 
    #10;
    A = 1; B = 1; Cin = 1; 
    #10;

    $finish;
  end
endmodule

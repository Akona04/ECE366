module TestBench();
  reg inp_0, a0, a1, a2, a3, b0, b1, b2, b3;
  wire c4, s3, s2, s1, s0;
  reg [3:0] bin_Result; //store only last 4 bits
  \4b_adder/subtractor  DUT0 (c4, s3, s2, s1, s0, inp_0, a0, a1, a2, a3, b0, b1, b2, b3);
  
  task display_unsigned_results;
    integer unsigned_A, unsigned_B, unsigned_Result;
    
    begin
      unsigned_A = {a3, a2, a1, a0};
      unsigned_B = {b3, b2, b1, b0};
      bin_Result = {s3, s2, s1, s0};
      unsigned_Result = bin_Result; 
    
      $display("| %s | %b  %2d  | %b  %2d  | %b  %2d  |  %b  |  %b  |", 
      (inp_0) ? "SUB" : "ADD",
      {a3, a2, a1, a0}, unsigned_A, 
      {b3, b2, b1, b0}, unsigned_B, bin_Result, unsigned_Result,inp_0, c4);
    end
  endtask
  
  task display_signed_results;
    integer signed_A, signed_B, signed_Result;
    
    begin
      signed_A = (a3 == 1) ? ({a3, a2, a1, a0} - 16) : {a3, a2, a1, a0}; 
      signed_B = (b3 == 1) ? ({b3, b2, b1, b0} - 16) : {b3, b2, b1, b0}; 
      bin_Result = {s3, s2, s1, s0}; //store only the lower 4 bits
      signed_Result = (bin_Result[3] == 1) ? (bin_Result - 16) : bin_Result; 
      $display("| %s | %b  %2d  | %b  %2d  | %b  %2d  |  %b  |  %b  |", 
                 (inp_0) ? "SUB" : "ADD",
                 {a3, a2, a1, a0}, signed_A, 
                 {b3, b2, b1, b0}, signed_B, 
                 bin_Result, signed_Result,
                 inp_0, c4);
    end
  endtask
  
  initial begin
    // Add these two lines for waveform generation
    $dumpfile("4bit_adder_subtractor.vcd");
    $dumpvars(0, TestBench);
    
    $display("\nUnsigned Operations:");
    $display("-------------------------------------------------");
    $display("| Op  |  A    U   |  B    U   | Res.  U   | Cin | Cout |");
    $display("-------------------------------------------------");
    a3 = 0; a2 = 1; a1 = 0; a0 = 1;  
    b3 = 0; b2 = 0; b1 = 1; b0 = 1;  
    inp_0 = 0; // Addition
    #10 display_unsigned_results;
    a3 = 1; a2 = 0; a1 = 1; a0 = 0;
    b3 = 0; b2 = 1; b1 = 0; b0 = 0;
    inp_0 = 1; // Subtraction
    #10 display_unsigned_results;
    $display("\nSigned Operations:");
    $display("-------------------------------------------------");
    $display("| Op  |  A     S  |  B     S  |  Res.  S  | Cin | Cout |");
    $display("-------------------------------------------------");
    a3 = 1; a2 = 1; a1 = 0; a0 = 0; 
    b3 = 1; b2 = 1; b1 = 0; b0 = 1; 
    inp_0 = 0; // Addition
    #10 display_signed_results;
    a3 = 1; a2 = 0; a1 = 1; a0 = 1;  
    b3 = 1; b2 = 1; b1 = 1; b0 = 0;  
    inp_0 = 1; // Subtraction
    #10 display_signed_results;
    $finish;
  end
endmodule

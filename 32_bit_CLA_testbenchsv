module CLA_TestBench();
reg [31:0] A, B;
reg Cin;
wire [31:0] S;
wire Cout;
CLA dut(A, B, Cin, S, Cout);
reg [32:0] expected_result;
initial begin
  $dumpfile("cla_test.vcd");
  $dumpvars(0, CLA_TestBench);
  $display("Time\tA\t\t\tB\t\t\tCin\tS\t\t\tCout\tExpected");
  $monitor("%4t\t%h\t%h\t%b\t%h\t%b\t%h", 
           $time, A, B, Cin, S, Cout, expected_result);
  A = 32'h00000001; B = 32'h00000002; Cin = 0;
  expected_result = A + B + Cin;
  #10;
  A = 32'hFFFFFFFF; B = 32'h00000001; Cin = 0;
  expected_result = A + B + Cin;
  #10;
  A = 32'h12345678; B = 32'h87654321; Cin = 1;
  expected_result = A + B + Cin;
  #10;
  A = 32'h7FFFFFFF; B = 32'h7FFFFFFF; Cin = 0;
  expected_result = A + B + Cin;
  #10;
  A = 32'hFFFFFFFB; 
  B = 32'hFFFFFFF6; 
  Cin = 0;
  expected_result = A + B + Cin;
  #10;
  A = 32'h00000000; B = 32'h12345678; Cin = 0;
  expected_result = A + B + Cin;
  #10;
  A = 32'h00000000; B = 32'h00000000; Cin = 0;
  expected_result = A + B + Cin;
  #10;
  A = 32'h00000000; B = 32'h00000000; Cin = 1;
  expected_result = A + B + Cin;
  #10;
  $finish;
end
endmodule

module adder_using_always();
  reg A, B, Cin; //innputs
  reg Sum, Carry; //outputs

  always @ (A or B or Cin) begin
    {Carry, Sum} = A + B + Cin; 
  end

  initial begin
    $monitor (" A = %b B = %b Cin = %b | Carry = %b Sum = %b", A, B, Cin, Carry, Sum);

    #10 A = 0; B = 0; Cin = 0;
    #10 A = 0; B = 0; Cin = 1;
    #10 A = 0; B = 1; Cin = 0;
    #10 A = 0; B = 1; Cin = 1;
    #10 A = 1; B = 0; Cin = 0;
    #10 A = 1; B = 0; Cin = 1;
    #10 A = 1; B = 1; Cin = 0;
    #10 A = 1; B = 1; Cin = 1;

    #10 $finish; 
  end

endmodule

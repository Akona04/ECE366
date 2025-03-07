module Main_Behavioral(
    output reg S, Cout,
    input A, B, Cin
);
    always @(*) begin
        {Cout, S} = A + B + Cin; // Full adder behavior using arithmetic operations
    end
endmodule

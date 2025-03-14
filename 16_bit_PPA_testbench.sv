module prefix_adder_16bit_tb;
    reg [15:0] A, B;
    reg Cin;
    wire [15:0] S;
    wire Cout;
    integer i; // Declare the variable outside the for loop
    reg [16:0] expected; // Declare expected outside the loop as well
    
    // Instantiate the 16-bit prefix adder
    prefix_adder_16bit uut (
        .A(A),
        .B(B),
        .Cin(Cin),
        .S(S),
        .Cout(Cout)
    );
    
    initial begin
      
      $dumpfile("dump.vcd");
      $dumpvars(0, prefix_adder_16bit_tb);
      
        // Test case 1: Simple addition
        A = 16'h1234;
        B = 16'h5678;
        Cin = 0;
        #10;
        $display("Test 1: %h + %h + %b = %h, Cout = %b", A, B, Cin, S, Cout);
        
        // Test case 2: Addition with carry-in
        A = 16'h1234;
        B = 16'h5678;
        Cin = 1;
        #10;
        $display("Test 2: %h + %h + %b = %h, Cout = %b", A, B, Cin, S, Cout);
        
        // Test case 3: Overflow test
        A = 16'hFFFF;
        B = 16'h0001;
        Cin = 0;
        #10;
        $display("Test 3: %h + %h + %b = %h, Cout = %b", A, B, Cin, S, Cout);
        
        // Test case 4: Overflow with carry-in
        A = 16'hFFFF;
        B = 16'h0000;
        Cin = 1;
        #10;
        $display("Test 4: %h + %h + %b = %h, Cout = %b", A, B, Cin, S, Cout);
        
        // Test case 5: Random values
        A = 16'h3A5C;
        B = 16'h947B;
        Cin = 0;
        #10;
        $display("Test 5: %h + %h + %b = %h, Cout = %b", A, B, Cin, S, Cout);
        
        // Test case 6: Zero inputs
        A = 16'h0000;
        B = 16'h0000;
        Cin = 0;
        #10;
        $display("Test 6: %h + %h + %b = %h, Cout = %b", A, B, Cin, S, Cout);
        
        // Test case 7: All ones
        A = 16'hFFFF;
        B = 16'hFFFF;
        Cin = 1;
        #10;
        $display("Test 7: %h + %h + %b = %h, Cout = %b", A, B, Cin, S, Cout);
        
        // Verification using built-in addition
        for (i = 0; i < 10; i = i + 1) begin
            A = $random;
            B = $random;
            Cin = i % 2; // Using i instead of $random % 2
            #10;
            
            // Calculate expected result
            expected = A + B + Cin;
            
            // Verify result
            if ({Cout, S} !== expected) begin
                $display("ERROR: A=%h, B=%h, Cin=%b", A, B, Cin);
                $display("Expected: %h, Got: %h", expected, {Cout, S});
            end else begin
                $display("PASS: %h + %h + %b = %h, Cout = %b", A, B, Cin, S, Cout);
            end
        end
        $display("Waveform file created: prefix_adder_16bit_tb.vcd");
      	#100;
        $finish;
    end
endmodule
